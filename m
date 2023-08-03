Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF3576F450
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 22:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE9B10E227;
	Thu,  3 Aug 2023 20:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3902D10E239
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 20:53:56 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-d3d729a08e4so1644058276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 13:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691096035; x=1691700835;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1Mmv+/pXamB9oY0WEXeNBKPJsXGa3jNSNiztILLlTY4=;
 b=QG64sPxmlvnELJ1w3jUSh5YAd3vTo7EpCd65fa7G5iQBLlIkMAy+VRbHdR+BrW/wGt
 JljRATuIXnWdSvseD5g/VZ6+QGB0gMo4l2kBhhKjYnANbjiNRLgMSpI2e8svUet48pAN
 kVTz+8wD4JIKeHJQgNjv/4WfP6XFZfuNPvUMlQCQCC+5IEWmeCms9hBh43gw5dW/ASLo
 tWJElpEvC4pAQgv258VS5VlXUrGEaze3zVBFkd+zJ8hLGErHGyGG3qVW5QSR1xNXeRYK
 G62J6VtPPqy+/9UPrwdl6cGEgRw0iSWeBjyzH9LyhMfebZYHI+tt27+pYdOM8DaAgZdq
 yxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691096035; x=1691700835;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Mmv+/pXamB9oY0WEXeNBKPJsXGa3jNSNiztILLlTY4=;
 b=T7qEtVMbSQWDRnHTOJxCbumJLYv01NfIcUMCR6n2Rv03Dze+FUNYwF8Vg0aqgOKf35
 QD6uMSF1e4QAEaq8xzsUwLIshk1a+mgI0rhUTcMiT1UdVUu6AnpAbOVV3nfp13IOHOb9
 mmk8X1t2idPgG5kunPnUCzpIrCSvU5DWxZIgdRdNNJ3wMDt7mFwHzlCcZ1q7TzaVMuRb
 Bt8uF9aKSAeVZgeCK595gB071PM16oge89eZ4dSVy9lY5HQm1g+MTqUT6UVtXEc3fhAR
 PMjwNb1ly2u5uX1QATC4/f9a8oInCUu8XPw9ZejaHwrWRG5U8mGsHRDeQ6BVGcGLKK/K
 F/AA==
X-Gm-Message-State: ABy/qLaNu9SnpX5dvOLy2eiKsRLNSMB3+Vp6JeILVY0uJgfvyyY/AKZC
 TNrpU1rzspm0rwCXYUx8cc/lEgSZng/XdFCV+t246Q==
X-Google-Smtp-Source: APBJJlF7XEIRCehOg8x18n+pAj6XjXh60FKRDpRItIlpCDy80h1FjXBqaG/sPhrf8edAz5AfQWjU0XJhdNgH+HQrRCI=
X-Received: by 2002:a25:694b:0:b0:d19:40c2:eb03 with SMTP id
 e72-20020a25694b000000b00d1940c2eb03mr20833186ybc.54.1691096035371; Thu, 03
 Aug 2023 13:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230803204521.928582-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20230803204521.928582-1-daniel.vetter@ffwll.ch>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 3 Aug 2023 23:53:44 +0300
Message-ID: <CAA8EJppW6s4DgQDamAumYcSP7mqKD1zNrVAtKMabAK5bh3iPnA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Don't leak some plane state
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, freedreno@lists.freedesktop.org,
 dorum@noisolation.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Aug 2023 at 23:45, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Apparently no one noticed that mdp5 plane states leak like a sieve
> ever since we introduced plane_state->commit refcount a few years ago
> in 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too
> early by tracking commits, v3.")
>
> Fix it by using the right helpers.
>
> Fixes: 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too early by tracking commits, v3.")
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Reported-and-tested-by: dorum@noisolation.com
> Cc: dorum@noisolation.com
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
