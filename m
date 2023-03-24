Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D216C880A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 23:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D182210E258;
	Fri, 24 Mar 2023 22:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FE810E258
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 22:06:34 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id k17so3973687ybm.11
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 15:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679695593;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AW96lDx5vwowhGiHzDVKGLsiV7fUhA67Ww+wttjBEwU=;
 b=kpJyuBzmaRYbioRqb5vGqry2GHgycmPyUnnxvdAANb2s+I5+UckR9viLl/8kUnwtsf
 Q7+LDDM69Vu2oFwkJGdq0pk81UJndycZyxuRQhPnR7WIn7TI116XPFHuAu6wWLccOc8o
 2sBeL91RE2283BvpWqZ1lLdl5THJKMNCJ+BTayM2nZ2dJsHu0EO7S7GQgtCqrYSJvdwW
 UU7aT8YPVkRLG1i0zyfT4IEd5slRhq8VTdfFrM8OfTioFMwOV0gD8IBlT0YtUSuoNtQu
 539xnoMEbH6SAZf8TaExkU7HmF+MVxlf2Ed51omRr2X6PZWYSIxHlxDf25bEFwSFH7oV
 //iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679695593;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AW96lDx5vwowhGiHzDVKGLsiV7fUhA67Ww+wttjBEwU=;
 b=lcBlNgVnecFfRglTHONv9MMNxn6iaTSKtzKi/kbKZ+My7Yx4iw90PhWvkZ+qRkndTp
 TJAlJyUS3KX3NrKJbpumGgbO+70wRjGypHfpd6iNkVRCgakrogyUn/A8dEJGAccqwU37
 1QpWC3BwYm4ULw7LUEhKTSmxaY2y2bkKU8GPlZS5RLuwbTvdocF4NeNKdMBN6MKuppFk
 QGrwnW+8kyGI8UcLRin0rgcjNfxktka2+WGdx+23z0AbCS7NMZHByC3fl53c+xAt1rhK
 KSJCy0779RgDHwLoxhnQMGfIXImuzf9MkL/CnX413ag3T8Arz1MhJk304Yya+fMiYLZB
 /KgA==
X-Gm-Message-State: AAQBX9dpU6mBJpL3BmZVqdlgBgaP7mzHlfQsMvYmuOq3htSZP6caL/4k
 KfScvCx5PmZcIAotQBC6OZxuBnsg0+QycIcV+Yh3UA==
X-Google-Smtp-Source: AKy350b22KWd/52YQxPAH9uA2YhVFFyLDy325ozIEZ34++SQJC7q83qVmJTG2A31rDN5OZEc70zCmWabGGvncpkmyxQ=
X-Received: by 2002:a05:6902:1501:b0:b4c:9333:2a2 with SMTP id
 q1-20020a056902150100b00b4c933302a2mr1857678ybu.9.1679695593310; Fri, 24 Mar
 2023 15:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <20230306100722.28485-7-johan+linaro@kernel.org>
In-Reply-To: <20230306100722.28485-7-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Mar 2023 00:06:21 +0200
Message-ID: <CAA8EJpoMKRY_w1eM6XVx6R3+2Mi3y=AbbvXQcFF-ccTfV_j2AQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] drm/msm: fix vram leak on bind errors
To: Johan Hovold <johan+linaro@kernel.org>
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
Cc: freedreno@lists.freedesktop.org, Craig Tatlor <ctatlor97@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 6 Mar 2023 at 12:09, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> Make sure to release the VRAM buffer also in a case a subcomponent fails
> to bind.
>
> Fixes: d863f0c7b536 ("drm/msm: Call msm_init_vram before binding the gpu")
> Cc: stable@vger.kernel.org      # 5.11
> Cc: Craig Tatlor <ctatlor97@gmail.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
