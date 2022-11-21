Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 627CA632008
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 12:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C8E10E2BD;
	Mon, 21 Nov 2022 11:14:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6AC10E2AD
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 11:14:21 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id bp12so5486203ilb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 03:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YKmL238oBqxiRNanxS8WxENXsxx4KWSkzL71xeQ1GGU=;
 b=cmTtkZsRLYZ2I7OrrX8A0P6ENVcoRjlUIfcoXkb+53K2jA1qr5lGYrpVGseSq278q+
 GLJCGg6rHlo8FEqW8LGQIYXFXJ5a5dwgunZ0fsd/adJPLzAbKdLRdKwSMgVFFqHd8hQG
 QO+fLy+vT8HOklP/uCk8dmMDdSwlr2Pl3c1yHtisY48EgVuuNTCiR3Cv3kjqmx3yqnQA
 uLHHCB1I18mgGAPJfPMwZAiURQL8TotvBLKGsFUCKCUpbVnE75cRojgHxAfmG9cLwOEb
 3U9B0C87KNHCKtfe5vPO4y0MRAFZ18zJtZZKROYda8xVEfwb/7M2z0I4epl0nYHUU/Hw
 xZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YKmL238oBqxiRNanxS8WxENXsxx4KWSkzL71xeQ1GGU=;
 b=QJ4JsIuNoAkVkhPNn3tDLTpjGPVnrnhZBAs0IAW7wkDvtAbS/ihzJFC0Fz+ETbJ8xQ
 fuFv+vn5l5QKoptvW41n4Bt2GbUBVs/s+BzSZQmDYeFJ7BhjMeadM8q4TMw+O/xZbNHT
 MxZ/90bvN7H8dnwCSDPLICK7NxYU4pXyxkgb2DI72uwwkWUILkqtkqlk1V3i/22/yWiS
 ENk0AzhwM/BjP/CPHYeKbBA8vmzhSSjNmlZHu+lSdipZJewLGBnRVnHpN6/USj+hhzwD
 mnM1fhc1PNymrd5NtTK942rtWyPY0Mr+6OCL6yapP38ssVIBvwsazZ0k4pAQakNzRpnC
 xzHw==
X-Gm-Message-State: ANoB5pltHR9fVcmHYbv4ntlYCeywNbb1TU+ygjTRPatDOd16BONg2jlm
 L9XjX/hGpQJdomheTjmDCYWCdXeVogijRf2azgHA+A==
X-Google-Smtp-Source: AA0mqf5uuxubo0pCDvjXbIwnanubajZXjr7+F1Eregkc8LJqmNaOLK6kPnWI7ii9zYvuynlQ0vGgq5bNYlO61FtDZKs=
X-Received: by 2002:a05:6e02:523:b0:2f6:9105:7a15 with SMTP id
 h3-20020a056e02052300b002f691057a15mr2247770ils.292.1669029261089; Mon, 21
 Nov 2022 03:14:21 -0800 (PST)
MIME-Version: 1.0
References: <20221120142737.17519-1-LinoSanfilippo@gmx.de>
In-Reply-To: <20221120142737.17519-1-LinoSanfilippo@gmx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 21 Nov 2022 11:14:04 +0000
Message-ID: <CAPY8ntB-LdH-oy86x-4Ox-JzgLLpmBNKu7j=bQo+Danj-r3+Dw@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: Fix NULL pointer access in
 vc4_platform_drm_probe()
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: emma@anholt.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, eric@anholt.net, stable@vger.kernel.org,
 l.sanfilippo@kunbus.com, p.rosenberger@kunbus.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lino

On Sun, 20 Nov 2022 at 15:26, Lino Sanfilippo <LinoSanfilippo@gmx.de> wrote:
>
> From: Lino Sanfilippo <l.sanfilippo@kunbus.com>
>
> In vc4_platform_drm_probe() function vc4_match_add_drivers() is called to
> find component matches for the component drivers. If no such match is found
> the passed variable "match" is still NULL after the function returns.

This would imply a very strange device tree that has bothered to add
the drm device but none of the devices that are required to run the
DRM pipeline, but avoiding a NULL deref is certainly preferable.

> Do not pass "match" to component_master_add_with_match() in this case since
> this results in a NULL pointer access as soon as match->num is used to
> allocate a component_match array. Instead return with -ENODEV from the
> drivers probe function.
>
> Fixes: c8b75bca92cb ("drm/vc4: Add KMS support for Raspberry Pi.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lino Sanfilippo <l.sanfilippo@kunbus.com>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_drv.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 2027063fdc30..2e53d7f8ad44 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -437,6 +437,9 @@ static int vc4_platform_drm_probe(struct platform_device *pdev)
>         vc4_match_add_drivers(dev, &match,
>                               component_drivers, ARRAY_SIZE(component_drivers));
>
> +       if (!match)
> +               return -ENODEV;
> +
>         return component_master_add_with_match(dev, &vc4_drm_ops, match);
>  }
>
>
> base-commit: 30a0b95b1335e12efef89dd78518ed3e4a71a763
> --
> 2.36.1
>
