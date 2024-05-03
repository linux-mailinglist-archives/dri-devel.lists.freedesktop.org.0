Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5828BAA54
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 11:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE9B10E059;
	Fri,  3 May 2024 09:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uUgmLlcY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D849710E059
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 09:55:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E5917CE0AB3;
 Fri,  3 May 2024 09:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176ECC116B1;
 Fri,  3 May 2024 09:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714730119;
 bh=2ZuH8DJWKdI8xZCLGCNsawY8TILgFbvsCfAw9mJuqqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uUgmLlcYkJi4Y9gh/4f5/UdhgmN1qqy6bsEAoLCyzmpGORX35Th540t8i7lEGvXZ4
 WCILsRry+m8Vughb03wMZaLhX+rlvn4toLuPxwUuGEGrVLZYPeUZykQie/nHgSITYl
 Lq0bqWxJphmgtfw8yawhscCNwgGc+BEmGFd3USkh7wlNcYCTglcafrpsFwhDBQiP1q
 UqvqK7tjZhkeq9yjIzsYXdm9qlpI6SW63uidnuhg8wes1IeOZkp5a5zvMuwok1CmVQ
 26FNNz6vSyamHDnWtksDmjRLupE/t+lEHA81eAhGFs81luI64SE3dlOfalYaZiASl/
 WS/3KIIK8LsKA==
Date: Fri, 3 May 2024 10:55:12 +0100
From: Lee Jones <lee@kernel.org>
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v2 00/19] backlight: Constify lcd_ops
Message-ID: <20240503095512.GQ1227636@google.com>
References: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
 <171472928415.1323021.3458121588308140519.b4-ty@kernel.org>
 <20240503094319.GP1227636@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240503094319.GP1227636@google.com>
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

On Fri, 03 May 2024, Lee Jones wrote:

> On Fri, 03 May 2024, Lee Jones wrote:
> 
> > On Wed, 24 Apr 2024 08:33:26 +0200, Krzysztof Kozlowski wrote:
> > > Changes in v2:
> > > - Collect tags, including wrongly places Thomas' tag (which requires me
> > >   to manually edit 15 other patches to drop it).
> > > - Combine here checkpatch patch:
> > >   https://lore.kernel.org/all/20240414185440.288812-1-krzk@kernel.org/
> > > - Link to v1: https://lore.kernel.org/r/20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [01/19] backlight: Constify lcd_ops
> >         commit: 9258e31adebf0ccf0797867841f3f9800695dba2
> > [02/19] backlight: ams369fg06: Constify lcd_ops
> >         commit: 8053c4fa200c3fef07859bac9469ad3f26f5aba1
> > [03/19] backlight: corgi_lcd: Constify lcd_ops
> >         commit: 18c5d4ab9f6312f2c9c6c409287d552112db810a
> > [04/19] backlight: hx8357: Constify lcd_ops
> >         commit: 1d669c1998b559393ec2eaac0449f4989a255049
> > [05/19] backlight: ili922x: Constify lcd_ops
> >         commit: e77fef89de954b1557cb91b64696cd4fc06c80ad
> > [06/19] backlight: ili9320: Constify lcd_ops
> >         commit: 06cfc92faa1eabb2ea226c58d6fd0b5ab117ee39
> > [07/19] backlight: jornada720_lcd: Constify lcd_ops
> >         commit: a54b4999dc204bc5839bb70602078c7c8e4a5010
> > [08/19] backlight: l4f00242t03: Constify lcd_ops
> >         commit: 657e6c1b270e9f4a890059f5d08a08ea842fa1a8
> > [09/19] backlight: lms283gf05: Constify lcd_ops
> >         commit: 66e5a10818fd332e973d36429e36f4c436a86a91
> > [10/19] backlight: lms501kf03: Constify lcd_ops
> >         commit: 31c205d1e8426dd0cce0143c500ff1ff71fe64d1
> > [11/19] backlight: ltv350qv: Constify lcd_ops
> >         commit: 24424f84d7568d9d794657622e080b1cba1e9290
> > [12/19] backlight: otm3225a: Constify lcd_ops
> >         commit: 02949072ee8fb6141cd8ac2be9867ef466580ddb
> > [13/19] backlight: platform_lcd: Constify lcd_ops
> >         commit: d217a8d5a39851caa16996756682715c9debb4a9
> > [14/19] backlight: tdo24m: Constify lcd_ops
> >         commit: c7a1809d1982f671e66a4b1c1ffd8bdd5ba260aa
> > [15/19] HID: picoLCD: Constify lcd_ops
> >         commit: 238724635763e7c5d82c0581b0c49e5dfdd5505a
> > [16/19] fbdev: clps711x: Constify lcd_ops
> >         commit: 55d9a955375af3b3fd5725a9b5cbc658d4bdd244
> > [17/19] fbdev: imx: Constify lcd_ops
> >         commit: a6abbb5783345c4c7cc9fbd583b81e167bd0207d
> > [18/19] fbdev: omap: lcd_ams_delta: Constify lcd_ops
> >         commit: ca991e8e096c9f0cff0300289e2d4813192b8ef3
> > [19/19] const_structs.checkpatch: add lcd_ops
> >         commit: f02aeccbec6108d768f54d31e7cb48b06c0e3814
> 
> Please ensure you use checkpatch.pl before submitting:
> 
> ====
> 
> ERROR: Does not appear to be a unified-diff format patch
> 
> total: 1 errors, 0 warnings, 0 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inplace.
> 
> "[PATCH v2 19/19] const_structs.checkpatch: add lcd_ops" has style problems, please review.
> 
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS.
> WARNING: Missing commit description - Add an appropriate one
> 
> ERROR: Missing Signed-off-by: line(s)
> 
> total: 1 errors, 1 warnings, 7 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inplace.
> 
> Your patch has style problems, please review.
> 
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS.
> 
> ====
> 
> Some of them are a little odd.  I fixed the relevant ones

Change of plan - I actually can't find anything to fix.

All of this reports seem bogus!

-- 
Lee Jones [李琼斯]
