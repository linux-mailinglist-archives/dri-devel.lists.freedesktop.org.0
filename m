Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E092C3F5327
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 00:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8356289AEB;
	Mon, 23 Aug 2021 22:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 541A189AEB
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 22:02:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CA611042;
 Mon, 23 Aug 2021 15:02:10 -0700 (PDT)
Received: from [127.0.0.1] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D198B3F766;
 Mon, 23 Aug 2021 15:02:09 -0700 (PDT)
Date: Mon, 23 Aug 2021 23:02:05 +0100
From: Steven Price <steven.price@arm.com>
To: dri-devel@lists.freedesktop.org, Alyssa Rosenzweig <alyssa@collabora.com>
CC: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/panfrost: Clamp lock region to Bifrost minimum
User-Agent: K-9 Mail for Android
In-Reply-To: <YSQPiQX8IOkJJSoY@maud>
References: <20210820213117.13050-1-alyssa.rosenzweig@collabora.com>
 <20210820213117.13050-4-alyssa.rosenzweig@collabora.com>
 <818b1a15-ddf4-461b-1d6a-cea539deaf76@arm.com> <YSQPiQX8IOkJJSoY@maud>
Message-ID: <FA069E32-03E1-4193-8918-C750A4ECE5F8@arm.com>
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

On 23 August 2021 22:13:45 BST, Alyssa Rosenzweig <alyssa@collabora=2Ecom> =
wrote:
>> > When locking a region, we currently clamp to a PAGE_SIZE as the minim=
um
>> > lock region=2E While this is valid for Midgard, it is invalid for Bif=
rost,
>>=20
>> While the spec does seem to state it's invalid for Bifrost - kbase
>> didn't bother with a lower clamp for a long time=2E I actually think th=
is
>> is in many ways more of a spec bug: i=2Ee=2E implementation details of =
the
>> round-up that the hardware does=2E But it's much safer following the sp=
ec
>> ;) And it seems like kbase eventually caught up too=2E
>
>Yeah, makes sense=2E Should I drop the Cc: stable in that case? If the
>issue is purely theoretical=2E

I think it might still be worth fixing=2E Early Bifrost should be fine, bu=
t something triggered a bug report that caused kbase to be fixed, so I'm le=
ss confident that there's nothing out there that cares=2E Following both kb=
ase and the spec seems the safest approach=2E

Thanks,
Steve
