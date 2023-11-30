Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A627FE823
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 05:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3BC10E6AA;
	Thu, 30 Nov 2023 04:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC29B10E6AA
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 04:06:21 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5cc589c0b90so5297597b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 20:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701317181; x=1701921981; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1zwuamlIV1jDg6rOlQdipklJQb9oUjXdjuftFM5av+U=;
 b=UuQG3uxzhYK0TWVnwAmyoPQhQnHMdBCiCvgb+YzGulJGxbgkxcRuKDV++jR+EHt60P
 fapdPiokCul0JUtC53qeA+XpmcTntCEPhM2lkCBxWzNo6V1Qxf+91jv76V6Fe4k5oxQj
 Qe2FFPUuwL8+oNyX/PRBokLWF+nKIl4V5LEhywWmDQCRKgztr9W8IGV5X51HUU5CbyGh
 9fOVdlnW9v+/DDcbPoucPKd71q+PMkOyDTTazpRiwwR85HB+fHz6HL/WCZToYTvwia1g
 OU3F+6rgi4zxsXRpaATfk/H3eFJ7GWna9KamIf0MaAJlM0g0+Y35L5kLMKhSpPQFXJFP
 skqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701317181; x=1701921981;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1zwuamlIV1jDg6rOlQdipklJQb9oUjXdjuftFM5av+U=;
 b=uvcv1mIm6V3jA4Gw3Lw488ayMddY/Q6lI9eJAqHmhy6C9Cq5kS1zUX3d27AyX0FdSy
 N+CE3D9lpg2YHRpY7g6M94zxbkzyAGwk1M1S/4IXxyLchv0xerRpjBvTlJSZm4rWEYcc
 iYN++/lqU9iilXhnG7Y6STv11M7FZhSTkzG5828KhlAyuSE6nbDiY6hgfmNru3n1wKTE
 lq4LU5PT/VJjXkqT4PhH8JKrkfaiyOSdiY/1kGOfK9wAHC6rliwORaMXL+QjLNyWWLFh
 W8UYXPWfWXzWW56RmLQ/kC3zlfVGvFIKKNpsYWzsE9bGEFmp2lhMp1omWyw7OnHcC9rL
 OLxA==
X-Gm-Message-State: AOJu0YxBUH4dkGaqSHTVr0r1TOjors6B0SX5gABgtTbyLjDUv6Zch1Wd
 rDYWiIOsYhv2XkXJe/0fP4iYY1flD4XnRTNI2Sl9zw==
X-Google-Smtp-Source: AGHT+IH5VqWkIJEXkSlzehGjOyCBp+myDPhrn3B4acVuNRIw/JkoNdioljfuRcqvXowZACNims6bGNNgqho9TQqZ5ow=
X-Received: by 2002:a0d:ef47:0:b0:5a7:b481:4dd2 with SMTP id
 y68-20020a0def47000000b005a7b4814dd2mr21943989ywe.47.1701317180853; Wed, 29
 Nov 2023 20:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
 <20231027-solid-fill-v7-7-780188bfa7b2@quicinc.com>
In-Reply-To: <20231027-solid-fill-v7-7-780188bfa7b2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Nov 2023 06:06:09 +0200
Message-ID: <CAA8EJppjVcP3YbBLG2vaZrRP2FAVfVM4WvLieLpV3z1VQ2exAA@mail.gmail.com>
Subject: Re: [PATCH RFC v7 07/10] drm/atomic: Loosen FB atomic checks
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 sebastian.wick@redhat.com, ppaalanen@gmail.com,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 laurent.pinchart@ideasonboard.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 28 Oct 2023 at 01:33, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Loosen the requirements for atomic and legacy commit so that, in cases
> where pixel_source != FB, the commit can still go through.
>
> This includes adding framebuffer NULL checks in other areas to account for
> FB being NULL when non-FB pixel sources are enabled.
>
> To disable a plane, the pixel_source must be NONE or the FB must be NULL
> if pixel_source == FB.
>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic.c        | 21 ++++++++++----------
>  drivers/gpu/drm/drm_atomic_helper.c | 39 +++++++++++++++++++++----------------
>  include/drm/drm_atomic_helper.h     |  4 ++--
>  include/drm/drm_plane.h             | 29 +++++++++++++++++++++++++++
>  4 files changed, 64 insertions(+), 29 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
