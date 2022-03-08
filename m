Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 553074D20D0
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 19:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36B010E38D;
	Tue,  8 Mar 2022 18:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F4410E293;
 Tue,  8 Mar 2022 18:59:46 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so110806wms.4; 
 Tue, 08 Mar 2022 10:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GlEBP0dYqZ3fyLNSyiw8KHK9YhpTqiBMFquOs6BvLfo=;
 b=Xall2NrXYxCvpO+k2IRdt458PZkUo48IXE0jneqg59khrwXsl5iewYj2Eb8LIUrZZe
 FVE/jff4cGANSH0wf4dLwbtFEn/gXsXiBA3+1rlgNdAffWUeAlYtw2waUrVIil6tk/VY
 E3BmxeV8Bnufneps3gq9MfbZ90VZG1WMdr9fwdAo/oNUh5n8eeJjca1u2K4Jg5ZsosP5
 o8hXDXJQpG8Xn0AtDpOvoj6/6lf9oSSGc8hgLTaOUlE2qDvGNTdPMc3gU1I4hMML7Kgl
 1ZGunPmBieoXBd9wvRj5dhY1QJ/3eTqEg1ukLa4h1hwrFlo9oLpVhtsa4B2LbDqgevX+
 0iAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GlEBP0dYqZ3fyLNSyiw8KHK9YhpTqiBMFquOs6BvLfo=;
 b=YkUJYkDZ22kU3G72UaO2IfhJaehKaQtImJn0MUulgIvF4bbkktB7C0KfcKjGIdyCXR
 t245Hy2WY8DPoskiJCAD983za+ZJkweN6ThUUMtQxDh28IJi4TUOj/fYOUUXT0XEJLSh
 dx8jSFeGkKM1Xe2G3xF5te+mNeNUbfCNu/lXdR98rbxJjtg4tYlKp/R1b09IPEAhg7U4
 hfxA6fG3iRpwYcqBierWb8g7DBFKQFWSnprd3+9Kz1f8U7nzcopUWTQJzZiooqktjfKG
 XJYUVeWqP/YuHjKhOWfaZDcXdJnPFevE2dt1alndnkFVN4cUJd3cj0CUzooixvo4WU5C
 vTRA==
X-Gm-Message-State: AOAM532AwxYOfL9zAY+P2DihCk6Vlj4USouOBBtODe7wrqVDxfPy9tJU
 kIDEwo6SkJeMVpL/Ksy6iLJZ4/whp84hBG/z8Hk=
X-Google-Smtp-Source: ABdhPJxRLMgBSW3C5vVIU9Jzb/aKdPhWN3yZiBXjWHOvBgCS/dLX7GeDxuJWaQ/PI8AjZCkHayN5eHMLHehGkhRtfOg=
X-Received: by 2002:a1c:f616:0:b0:37d:1e1c:f90a with SMTP id
 w22-20020a1cf616000000b0037d1e1cf90amr4597415wmc.148.1646765985128; Tue, 08
 Mar 2022 10:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20220308184844.1121029-1-robdclark@gmail.com>
 <CAOMZO5Dkr7PqvgYpNp1fBR7P91T-x1ke2pRN6A6GWFJ7zBQo7g@mail.gmail.com>
In-Reply-To: <CAOMZO5Dkr7PqvgYpNp1fBR7P91T-x1ke2pRN6A6GWFJ7zBQo7g@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 8 Mar 2022 11:00:14 -0800
Message-ID: <CAF6AEGvfdyK2oNyLVrN5WJV0VV-EkvyD+EJ0rtGP7u7CA3kDXg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gpu: Fix crash on devices without devfreq support
 (v2)
To: Fabio Estevam <festevam@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Anders Roxell <anders.roxell@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Linux Kernel Functional Testing <lkft@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 8, 2022 at 10:53 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Tue, Mar 8, 2022 at 3:48 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Avoid going down devfreq paths on devices where devfreq is not
> > initialized.
> >
> > v2: Change has_devfreq() logic [Dmitry]
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Reported-by: Anders Roxell <anders.roxell@linaro.org>

Fixes: 6aa89ae1fb04 ("drm/msm/gpu: Cancel idle/boost work on suspend")

> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Does this need a Fixes tag?

Yes, sorry, patchwork had picked up the fixes tag from previous
version but I'd forgot to add it locally

BR,
-R
