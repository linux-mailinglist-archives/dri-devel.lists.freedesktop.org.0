Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956523F5314
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 23:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E7489BFD;
	Mon, 23 Aug 2021 21:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE8C689BFD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 21:54:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF9D41042;
 Mon, 23 Aug 2021 14:54:40 -0700 (PDT)
Received: from [127.0.0.1] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FB0B3F766;
 Mon, 23 Aug 2021 14:54:40 -0700 (PDT)
Date: Mon, 23 Aug 2021 22:54:35 +0100
From: Steven Price <steven.price@arm.com>
To: dri-devel@lists.freedesktop.org, Alyssa Rosenzweig <alyssa@collabora.com>
CC: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/panfrost: Simplify lock_region calculation
User-Agent: K-9 Mail for Android
In-Reply-To: <YSQOdDyLqiUccBq8@maud>
References: <20210820213117.13050-1-alyssa.rosenzweig@collabora.com>
 <20210820213117.13050-2-alyssa.rosenzweig@collabora.com>
 <192e5a1b-2caf-11a8-f090-ec5649ea16b5@arm.com> <YSQOdDyLqiUccBq8@maud>
Message-ID: <7076BF0A-C40E-4E5A-9185-FDB3882EC539@arm.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23 August 2021 22:09:08 BST, Alyssa Rosenzweig <alyssa@collabora=2Ecom> =
wrote:
>> > In lock_region, simplify the calculation of the region_width paramete=
r=2E
>> > This field is the size, but encoded as log2(ceil(size)) - 1=2E
>> > log2(ceil(size)) may be computed directly as fls(size - 1)=2E However=
, we
>> > want to use the 64-bit versions as the amount to lock can exceed
>> > 32-bits=2E
>> >=20
>> > This avoids undefined behaviour when locking all memory (size ~0),
>> > caught by UBSAN=2E
>>=20
>> It might have been useful to mention what it is that UBSAN specifically
>> picked up (it took me a while to spot) - but anyway I think there's a
>> bigger issue with it being completely wrong when size =3D=3D ~0 (see be=
low)=2E
>
>Indeed=2E I've updated the commit message in v2 to explain what goes
>wrong (your analysis was spot on, but a mailing list message is more
>ephermal than a commit message)=2E I'll send out v2 tomorrow assuming
>nobody objects to v1 in the mean time=2E
>
>Thanks for the review=2E
>
>> There is potentially a third bug which kbase only recently attempted to
>> fix=2E The lock address is effectively rounded down by the hardware (th=
e
>> bottom bits are ignored)=2E So if you have mask=3D(1<<region_width)-1 b=
ut
>> (iova & mask) !=3D ((iova + size) & mask) then you are potentially fail=
ing
>> to lock the end of the intended region=2E kbase has added some code to
>> handle this:
>>=20
>> > 	/* Round up if some memory pages spill into the next region=2E */
>> > 	region_frame_number_start =3D pfn >> (lockaddr_size_log2 - PAGE_SHIF=
T);
>> > 	region_frame_number_end =3D
>> > 	    (pfn + num_pages - 1) >> (lockaddr_size_log2 - PAGE_SHIFT);
>> >=20
>> > 	if (region_frame_number_start < region_frame_number_end)
>> > 		lockaddr_size_log2 +=3D 1;
>>=20
>> I guess we should too?
>
>Oh, I missed this one=2E Guess we have 4 bugs with this code instead of
>just 3, yikes=2E How could such a short function be so deeply and horribl=
y
>broken? =EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD
>
>Should I add a fourth patch to the series to fix this?

Yes please!

Thanks,
Steve
