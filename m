Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8524467EA17
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 16:58:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1153C10E9AA;
	Fri, 27 Jan 2023 15:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D275B10E9AA
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 15:58:17 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id mg12so14919435ejc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 07:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mlg45T4/VC+7LmAsgOWK4bw3SsjPwjm5InA1atd5cbM=;
 b=Lb5onOMPT75+MY3z7ZObqs5E6eGtXjhmibCMQ+TiXHxDJcjGv3MQCb44+itMUg6MrT
 YkmJGmVNLkEfIjjTp+Z7Ew5Xbg0s9VQTl3COKoI/4tuXyHHg+xK9/Cq/FI6iV6nvM7PV
 yPsNLyT0miE6du9DKnP5DnHU+uEJOfYt76j9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mlg45T4/VC+7LmAsgOWK4bw3SsjPwjm5InA1atd5cbM=;
 b=E9F5G3PAarKudX4KbfOF9O8Kz+SUijGdMbfdpy/SvmrHocUzmmuO8ajwK+K39T5Mly
 MoVsjRYs8DANpVSgAfCqPDobEm/Nx0QtBwkPWij8OP0oFvVYWdgXOH4ViVmISTui7CV3
 /2+0Au0ctn7+nTW+4Y6wEHHkZ8nGHBTBWmgBr3I8Ta7JOTFJ8haPTNGT2sQl0ZwFge4a
 fOi48JHFZVoqB/T9+hfE3vJ1lh4OaGWJGiZpZ5s5pnCw0sd7t+mK1ysLqWVbGqUF7mO5
 ALTi4pCqxrrfjZVaDpfQckiZchh86j/k8i2SczoLLeiNs7jVASjQTSoND8JI7a1QwtBI
 TECw==
X-Gm-Message-State: AFqh2krk1tvNXgCA574TgQ9Nrl8yOJVjDsStgtIyjVMQ2ZS3YIq2iSPJ
 F1n4WliCeModft1IUE7eBFkSfAIjaf7jiErIzC4=
X-Google-Smtp-Source: AMrXdXvi27/1k/kMlYrag2kUmtfMYmJwp4uEIGGHQ3vJoI/I2b9NyOSMog4lAu+LhKiZVPb+Ks6qXQ==
X-Received: by 2002:a17:907:2a56:b0:84d:35e1:2781 with SMTP id
 fe22-20020a1709072a5600b0084d35e12781mr47345081ejc.46.1674835096154; 
 Fri, 27 Jan 2023 07:58:16 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51]) by smtp.gmail.com with ESMTPSA id
 e18-20020a170906081200b008727576e4ecsm2461610ejd.117.2023.01.27.07.58.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 07:58:15 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id n7so5380711wrx.5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 07:58:15 -0800 (PST)
X-Received: by 2002:adf:f10b:0:b0:2bd:ef96:3889 with SMTP id
 r11-20020adff10b000000b002bdef963889mr1582683wro.138.1674835095329; Fri, 27
 Jan 2023 07:58:15 -0800 (PST)
MIME-Version: 1.0
References: <20230119224052.2879106-1-robdclark@gmail.com>
In-Reply-To: <20230119224052.2879106-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 27 Jan 2023 07:58:02 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XqWzrgss7HAsYJASuJjNr3gBgtM7b3rNU=NtGuVgJ+ew@mail.gmail.com>
Message-ID: <CAD=FV=XqWzrgss7HAsYJASuJjNr3gBgtM7b3rNU=NtGuVgJ+ew@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Remove dependency on GEM DMA helper
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jan 19, 2023 at 2:40 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> It appears that the dependency on the DMA helpers was only for
> drm_gem_dma_vm_ops.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/Kconfig       | 1 -
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 7 ++++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)

Drive-by comment: can you post a follow-up patch that also removes the
"#include <drm/drm_gem_dma_helper.h>" from "mtk_drm_gem.c", assuming
that still compiles? If it doesn't compile, that might be a bad sign
that we missed something. ;-)

-Doug
