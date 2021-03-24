Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71463482D1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 21:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07066EA8A;
	Wed, 24 Mar 2021 20:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C2C6EA51;
 Wed, 24 Mar 2021 20:23:31 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 91-20020a9d08640000b0290237d9c40382so2975970oty.12; 
 Wed, 24 Mar 2021 13:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RaZcdCZN7zqROxLNVq3rIO4aLNeOhcX7PBDOpMGUlmE=;
 b=BLsFl3OGLlqkaruz8cUyse209AF9YbDNLtc55K3B+sxHKeTcwbOFutQmJqro4VvRVO
 uYhQDOO1pe7kBibHLnBX9h79tklWvJjBPuoHLPzCvH8Lb1Fl/tfKYI8L5cHtjcrF38wL
 Zs2Ij4K5nbUnLAjQ4iAuyoUuoq1iGRvPbwmTdoie3Y0a1ohlGXc8UcuHJtGIYuJvPLSC
 juQ9Vku+d3YDXU46S7hCUus3baWTYZbbHztqmiCKAH3WB032mG0GIVqCV1ounqIRX6KN
 TzKexoujbodaP6TTwfk+0KBqzipZbVV4rlueCxOFRCatqIQ54ohgC9uUW5AFDxosDNeE
 nvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RaZcdCZN7zqROxLNVq3rIO4aLNeOhcX7PBDOpMGUlmE=;
 b=ZeBJGUWci5mfM4x+g+ScDEiIc1ZRKdnf4ybgOpKk/YPx0MfO6wCGTEumNlZhu31uw3
 IEK5jSSl1Uc4X2yulGQpWNGNFLnn5qVhJpw/f+bBHlvpC00fgPCLK5SDXXYWLasn8Y06
 DlEyOn+JS5KlfhiYeMBNgSX2a3EA/WwFkF3oCg1fWbGbaCxx71Rqn0UBkPZEct754keZ
 QN5nS2P+D4zJ0rBYt1VaIT/ozg/nJpitSzPRYRe//b3l316ejIzXnrhaRl3kiYIrNR4x
 vbtxK3rGXL/G7nsdLsNcEdVC9BbSZOlWyrIiGEpe6zpOF2g52WdRGl5Ke8AP86R3Wxr7
 vHEQ==
X-Gm-Message-State: AOAM533oVC6U+4fYTLwLDK/jApz7B+ls6OU/BZNlyRMF+imuW8GaYvr1
 kbPO8cYkWR43JerK3Xl6hAWR7aPNgsd8ukCeAvs=
X-Google-Smtp-Source: ABdhPJzUUgR8Spu+CHOcOHs6UfaP8AfSy/e+bFFUzRutJXGFbySDVYUK6VJWWeGUFsfIWGvyxai0yy7WHzDYfd5XC0g=
X-Received: by 2002:a05:6830:408f:: with SMTP id
 x15mr4767542ott.132.1616617410803; 
 Wed, 24 Mar 2021 13:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210317151348.11331-1-wse@tuxedocomputers.com>
In-Reply-To: <20210317151348.11331-1-wse@tuxedocomputers.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 24 Mar 2021 16:23:19 -0400
Message-ID: <CADnq5_OpJ-2jR4D8xwH93PZKoMWXx8C2yGTkqt7KRrVgph-KvA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Try YCbCr420 color when YCbCr444 fails
To: Werner Sembach <wse@tuxedocomputers.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "for 3.8" <stable@vger.kernel.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 17, 2021 at 11:25 AM Werner Sembach <wse@tuxedocomputers.com> wrote:
>
> When encoder validation of a display mode fails, retry with less bandwidth
> heavy YCbCr420 color mode, if available. This enables some HDMI 1.4 setups
> to support 4k60Hz output, which previously failed silently.
>
> On some setups, while the monitor and the gpu support display modes with
> pixel clocks of up to 600MHz, the link encoder might not. This prevents
> YCbCr444 and RGB encoding for 4k60Hz, but YCbCr420 encoding might still be
> possible. However, which color mode is used is decided before the link
> encoder capabilities are checked. This patch fixes the problem by retrying
> to find a display mode with YCbCr420 enforced and using it, if it is
> valid.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: <stable@vger.kernel.org>


This seems reasonable to me.  Harry, Leo, Any objections?

Alex

> ---
>
> From c9398160caf4ff20e63b8ba3a4366d6ef95c4ac3 Mon Sep 17 00:00:00 2001
> From: Werner Sembach <wse@tuxedocomputers.com>
> Date: Wed, 17 Mar 2021 12:52:22 +0100
> Subject: [PATCH] Retry forcing YCbCr420 color on failed encoder validation
>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 961abf1cf040..2d16389b5f1e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5727,6 +5727,15 @@ create_validate_stream_for_sink(struct amdgpu_dm_connector *aconnector,
>
>         } while (stream == NULL && requested_bpc >= 6);
>
> +       if (dc_result == DC_FAIL_ENC_VALIDATE && !aconnector->force_yuv420_output) {
> +               DRM_DEBUG_KMS("Retry forcing YCbCr420 encoding\n");
> +
> +               aconnector->force_yuv420_output = true;
> +               stream = create_validate_stream_for_sink(aconnector, drm_mode,
> +                                               dm_state, old_stream);
> +               aconnector->force_yuv420_output = false;
> +       }
> +
>         return stream;
>  }
>
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
