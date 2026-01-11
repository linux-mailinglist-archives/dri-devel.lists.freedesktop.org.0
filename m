Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFDCD0F99E
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 19:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB39810E1B8;
	Sun, 11 Jan 2026 18:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="s6F5IRpY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2927810E1B8
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 18:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1768157437; x=1768762237; i=deller@gmx.de;
 bh=4giF1Ylnl0OprmOltB2maMEKRmScAsi0wfaxs7LIMCY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=s6F5IRpY+JSpAXpuzrZtlrppKn74Pch1FTNJ4svNy9XMB8C4oTdg6r0+V9flC4CJ
 lclhlgPJ9v8SPpFeJaMY+FwSnKAq8KCHIO9Zx5e7rYK1UvgyAIRCfw//3LtJ2G/NR
 SsXz55mSwbQOXb61yUxFX99PMMm59/I4CuvkUz0dqCyLihCEpT5lebGumjMLPn6a+
 guRdd0Pxjmip7G5Adba2O7hvOb0PFsLuv9nRJdAXnIDvRMWIf/3aigh65HJ9GX4O2
 T1gGhoteqYN3ICXy+92lnt3hvbwyrSSlEch4l+rvc7YQIFqnop8Bmji6eWjv3OsHi
 h/tlbBMtY82chA+y6g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.120]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Hdw-1vgfTj16GQ-005S2j; Sun, 11
 Jan 2026 19:50:37 +0100
Message-ID: <40911dd0-52e1-46de-b060-0372988291ca@gmx.de>
Date: Sun, 11 Jan 2026 19:50:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] fb: Add dev_of_fbinfo() helper for optional sysfs
 support
To: Chintan Patel <chintanlike@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, gregkh@linuxfoundation.org
References: <20260107044258.528624-1-chintanlike@gmail.com>
 <20260107044258.528624-2-chintanlike@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260107044258.528624-2-chintanlike@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LRJjXxtVZrPLcO8WGOvnc0L5lSO00ZKZ17x0QNckWvg7CNRB+ka
 /3CJJyxSqTYgC5Fm+GrNr7r6c+6Nn18vfKtKcTaTDRTPG2ZBPir8nzSJEdbDaNDtV8qYZ5Q
 PK3tpcQ8Kkh131VPnSdw79iF68Glpj3e1UZGXa4p7rrryMYe2d5fNmyGpn9v/JOy0Gq3Joc
 twiRNdHKTtlQ+hY3vGynA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eS+6eo+assI=;/1wEpZQVxkwObyfxW4aiEw15poL
 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
 WUkwYmhBC0nQuogrZOhvQVUTgz9gVD+amq5Ulb
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

On 1/7/26 05:42, Chintan Patel wrote:
> Add dev_of_fbinfo() to return the framebuffer struct device when
> CONFIG_FB_DEVICE is enabled, or NULL otherwise.
>=20
> This allows fbdev drivers to use sysfs interfaces via runtime checks
> instead of CONFIG_FB_DEVICE ifdefs, keeping the code clean while
> remaining fully buildable.
>=20
> Suggested-by: Helge Deller <deller@gmx.de>
> Reviewed-by: Helge Deller <deller@gmx.de>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---
>   include/linux/fb.h | 9 +++++++++
>   1 file changed, 9 insertions(+)

Whole v4 series applied to fbdev git tree.

Thanks!
Helge
