Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4FC3F531B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 23:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C501289C05;
	Mon, 23 Aug 2021 21:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A558D89C05
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 21:58:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E99BD1042;
 Mon, 23 Aug 2021 14:58:00 -0700 (PDT)
Received: from [127.0.0.1] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7ABFA3F766;
 Mon, 23 Aug 2021 14:58:00 -0700 (PDT)
Date: Mon, 23 Aug 2021 22:57:56 +0100
From: Steven Price <steven.price@arm.com>
To: dri-devel@lists.freedesktop.org, Alyssa Rosenzweig <alyssa@collabora.com>
CC: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 2/3] drm/panfrost: Use u64 for size in lock_region
User-Agent: K-9 Mail for Android
In-Reply-To: <YSQO7exgqnk0ZLJT@maud>
References: <20210820213117.13050-1-alyssa.rosenzweig@collabora.com>
 <20210820213117.13050-3-alyssa.rosenzweig@collabora.com>
 <71392001-a5a9-fee2-79a5-91df55ba3081@arm.com> <YSQO7exgqnk0ZLJT@maud>
Message-ID: <77CFD756-7F02-4CBA-9E58-3EDA2167620E@arm.com>
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

On 23 August 2021 22:11:09 BST, Alyssa Rosenzweig <alyssa@collabora=2Ecom> =
wrote:
>> > Mali virtual addresses are 48-bit=2E Use a u64 instead of size_t to e=
nsure
>> > we can express the "lock everything" condition as ~0ULL without relyi=
ng
>> > on platform-specific behaviour=2E
>>=20
>> 'platform-specific behaviour' makes it sound like this is something to
>> do with a particular board=2E This is 32bit/64bit - it's going to be
>> broken on 32bit: large lock regions are not going to work=2E
>
>Oh, my=2E I used the term as a weasel word since the spec is loose on how
>big a size_t actually is=2E But if this is causing actual breakage on
>armv7 we're in trouble=2E I'll add a Cc stable tag on v2, unless the Fixe=
s
>implies that?

The usual practice is to put CC: stable in the commit message or the fixes=
 tag (no need to actually CC the stable email address)=2E So just Fixes: sh=
ould work

>Thanks for pointing this out=2E

It's not actually quite so bad as it could be as >4GB regions are unlikely=
 (especially on 32bit), but the GPU does of course support such a thing=2E

Thanks,
Steve
