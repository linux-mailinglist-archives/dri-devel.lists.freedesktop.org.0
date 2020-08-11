Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E16A2421D1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 23:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2D76E84B;
	Tue, 11 Aug 2020 21:18:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88856E854
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 21:18:44 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id t13so2760451ile.9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 14:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5zCJzt+BJueo1G2rs0QZq7zeuowqnIxHPn78LDh13kg=;
 b=FlowTssUayfdaL85TriP2RcBUzG/T6vntLnxRx7DdtmcmiqIiV3bH2ED/pB1FCvjq+
 LokfjisnXtGBAQLL+YECpUsyNdAMytoTTAZ5ztFLMVlLx+lGEPmly8iE28Klsvc7m9Nu
 rW8uiNQz+QsV8/gNXH/owhOE1Gr3XvGLYs7sEeg4HsgRYX5YK59C4yWf/cz63g8iGHkX
 v6N8lFRoSD5yLRGWWVCsMSLMRuQBKlHgkOanGuqLjHak4zsryiT50596J4YrA9pfpLnW
 YixCIlT2k0xTm6BLZAwgZ2QaJYMqPvXMnsKIKrGVZYUiWFHwxbYRazU6BEIFJoP87MuW
 JfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5zCJzt+BJueo1G2rs0QZq7zeuowqnIxHPn78LDh13kg=;
 b=qxbh+DeLc7im8/sqlu4XsrGExyOeitTa2b5rLdJnMFKUb0Xp7dcVYPyaIKe0ojje8v
 XKv987HLncnMYKrzFc4gRb55OXycD8xuiztapAFPWG8ZuhsRM4vo4tQ1e7LO4pv2GFiK
 bn9vnwjNbSt+jO3ULk0EeO3TZVQLZepca2SIdWslvF9P/vP4uG/2tYLCbu1lv7lhSWaE
 EV0x76hJdWs3IWLbpsw3fOUNdO5s3ieuaM+Jy5h3iN/uWCx/Ckda9tUHvaz//4QvAX2F
 rrlgLs39cTHszOqoMI/NdzglWJoL6cM8o03NFfhieR0SHJwlfvbAb2n57m7BDeUKwsW2
 I7yQ==
X-Gm-Message-State: AOAM533AcCapy25jp4ouX8LxwSgV/J4xsviC/mHCYVEzG3lVs051QPUR
 2eg0L3NmfK5krs3mlkvVYdXFGrsY1gdygBgQPW8d9Q==
X-Google-Smtp-Source: ABdhPJydXaSlgITmBtELkzUO4DBmCANUrr1wRTcqhyIrK8VcFT550AeHkpAKa6iE1xor3dBnDr5/Yj0olPjyteNUyc8=
X-Received: by 2002:a92:1d1:: with SMTP id 200mr25295650ilb.71.1597180724140; 
 Tue, 11 Aug 2020 14:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200811210938.552939-1-robdclark@gmail.com>
In-Reply-To: <20200811210938.552939-1-robdclark@gmail.com>
From: Sean Paul <sean@poorly.run>
Date: Tue, 11 Aug 2020 17:18:08 -0400
Message-ID: <CAMavQKJcRRc=K3m14A5NsFMKC-E84FL3-r7MKcpoPQ_rq7d6gw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: fix unitialized variable error
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, kernel test robot <lkp@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Bernard <bernard@vivo.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Hongbo Yao <yaohongbo@huawei.com>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 11, 2020 at 5:08 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:817 dpu_crtc_enable() error: uninitialized symbol 'request_bandwidth'.
>
> Reported-by: kernel test robot <lkp@intel.com>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index f272a8d0f95b..c2729f71e2fa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -827,7 +827,7 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
>  {
>         struct dpu_crtc *dpu_crtc;
>         struct drm_encoder *encoder;
> -       bool request_bandwidth;
> +       bool request_bandwidth = false;
>
>         if (!crtc) {
>                 DPU_ERROR("invalid crtc\n");
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
