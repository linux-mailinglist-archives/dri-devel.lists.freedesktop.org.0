Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C4DB13051
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 18:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE3010E242;
	Sun, 27 Jul 2025 16:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="j7Z6ZDzA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566BA10E242
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 16:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1753632875; x=1754237675; i=deller@gmx.de;
 bh=exzmy0J2PU4tNoA29k6SSxf931+foXBM+lf5xMBSovE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=j7Z6ZDzA23JKUAJToRb4P8pGdIDfK+ft1rzh0q7ynM0YdblKR9Buy4z/1fmGx+Kh
 ncpGki7gbJhFX/dnjqjidVeqzlpOsXlui9UbKW1ik2wLHLxptxuyfGn1JBfGs9D1s
 qkUUnp0I29F3S5Jw9t72u+PW/Xa6lojPB84aeRemqTbNy4qEA69ddQnyf6tuaTF2k
 g9W3A8gFtF59iErFeEH47+Q25/sEj5b5/ghNGjdQbuzsSdURF5Rjn0j2o4O1qQRcV
 FppNpNbkZGjqvJpdPRIvzBMQlehehj7R/sXYGE7CNmb/Gx36B1tbxCq0ZjJRvPr0A
 Emuys1/qM6FDNJzkNg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.22]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MyKHc-1uU1sl2BNk-00r5nm; Sun, 27
 Jul 2025 18:14:35 +0200
Message-ID: <b9e277cc-2b42-4c67-8490-10b9e2171909@gmx.de>
Date: Sun, 27 Jul 2025 20:04:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: Check fb_add_videomode to prevent null-ptr-deref
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev
References: <20250724032534.1638187-1-chenyuan0y@gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250724032534.1638187-1-chenyuan0y@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2pV+FSCzFDw6tXkrvuNGdFB8Z9dDuoZA8yZiMyQmRmolJgLxUxr
 sZIHeBwHuHeBtav3ZxFMqCj9y6vNJcKwt7UBMq1tTiDIwixwlUOSPw3ZeJXLwMYyRUnc/ca
 LLYOvCumavgM+GESb0yqdC6qdj6RiiYc/dV3/mIzN6lEIbtIezgeti+x9zzTUGFXL4M6TQH
 jeToLoza1RFnBgBzrq42A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EoQp678/xBo=;0SE/STJ9tfqWlZ89hPSXHFXOTf1
 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
 uWWH9DH22TQ==
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

On 7/24/25 05:25, Chenyuan Yang wrote:
> fb_add_videomode() can fail with -ENOMEM when its internal kmalloc()
> cannot allocate a struct fb_modelist.
> If that happens, the modelist stays empty but the driver continues to
> register.
> Add a check for its return value to prevent poteintial null-ptr-deref,
> which is similar to the commit 17186f1f90d3
> ("fbdev: Fix do_register_framebuffer to prevent null-ptr-deref in fb_vid=
eomode_to_var").
>=20
> Fixes: 1b6c79361ba5 ("video: imxfb: Add DT support")
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> ---
>   drivers/video/fbdev/imxfb.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

applied.

Thanks!
Helge
