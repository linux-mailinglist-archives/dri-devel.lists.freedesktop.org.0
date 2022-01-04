Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AE148432A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 15:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0354510E2C7;
	Tue,  4 Jan 2022 14:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A625210E2C7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 14:17:43 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so35800118pjf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 06:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tCh2rgII3hbRw94echP2rRCkkf7dv31cKpRI8aiSXTA=;
 b=l1PuuWKzA4YNweLgk/f3pi3g7b816L7QVEBV0F33NTLz1JzxWTaf2rdltBVPpBjgYa
 tGiUu6ZcHojdAHpJU7syxiCN1Pq3Vnh6IKe2hjVS7oZzf5ODjG6JRUtZ0xTU37eyurI9
 OsljZimrHH1SVVxa0lF5flIjih1gMxTkc4wB3hG+pwZRvcB+gxyY9BZpfjSzD+ltvH9u
 t1NNAAdEorHJJFg1G2JnaBV/pzQvxyguVsV3tQoqCNwR41W7q/Ts8MvNpD9Snz1QE93L
 f//pCdW98dveSXJs9E6ovK9FV8jhzlqcTkjLtkVSG//IOjHfEC2EAn4td98TFfZoTUik
 f6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tCh2rgII3hbRw94echP2rRCkkf7dv31cKpRI8aiSXTA=;
 b=rh3srJ+twmDOKT2JoUEXz0u5sXBsr0GFXO6i+0NtqR2Q4AIVQL+aOEa4M/hP0XCEqn
 dRxvXwoR6kR/IN+vKh/57QPRqTQEfYVLeTB5PIwWt7dlrIfeAZdjqM4S8dj8Zq76PRSW
 E6UgA/Qc1VRTlls+u95d1SVOmpt0cpprZ4MxJUabtRYvnsEMPzIvovfL87zfnDGo95f+
 dU6DGdETkqUryp63ODk/3mrjsXQzY+sxLakOAoIfLI5Q9zmvx+HZS9UkYaRUqU3TMgeW
 y/ZKMKQGIX+k70EnbTD358jjZhQsI4JPVmTsTozufVlVHlWfsxOweHhlnRWifoLkb6Jz
 EebQ==
X-Gm-Message-State: AOAM531zqsqvDNlm16xsWIDyHMgRZ+xuYy8kaLjJKSmX7mPTuhtmWVuz
 fZdKOcCZZMmNNBjLKbVmW63AF2whHc5DGe1AhHdZ8A==
X-Google-Smtp-Source: ABdhPJwDc7gBgmDrYJ15PsNoVnS2EGIzqnLgQ/NvooPZubtxchxczwltMUYunBj6IOSCZAVovVlg0oqzzWNjv2kAEbo=
X-Received: by 2002:a17:902:c40f:b0:148:f2e0:3f6e with SMTP id
 k15-20020a170902c40f00b00148f2e03f6emr48931658plk.65.1641305863209; Tue, 04
 Jan 2022 06:17:43 -0800 (PST)
MIME-Version: 1.0
References: <20211130131113.126261-1-zhou1615@umn.edu>
In-Reply-To: <20211130131113.126261-1-zhou1615@umn.edu>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Jan 2022 15:17:32 +0100
Message-ID: <CAG3jFytSB4HtFs3CZuFsiE1LCX+1BDY6MPAWSBxPwjx88fUF9Q@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: Fix a NULL pointer
 dereference in cdns_mhdp_atomic_enable()
To: Zhou Qingyang <zhou1615@umn.edu>
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 dri-devel@lists.freedesktop.org, Yuti Amonkar <yamonkar@cadence.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Swapnil Jakhade <sjakhade@cadence.com>,
 Neil Armstrong <narmstrong@baylibre.com>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Andrzej Hajda <a.hajda@samsung.com>,
 Parshuram Thombare <pthombar@cadence.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yu Kuai <yukuai3@huawei.com>, Dave Airlie <airlied@redhat.com>,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Zhou,

Thanks for submitting this patch.

On Tue, 30 Nov 2021 at 14:11, Zhou Qingyang <zhou1615@umn.edu> wrote:
>
> In cdns_mhdp_atomic_enable(), the return value of drm_mode_duplicate()
> is assigned to mhdp_state->current_mode and used in drm_mode_set_name().
> There is a dereference of it in drm_mode_set_name(), which could lead
> to a NULL pointer dereference on failure of drm_mode_duplicate().
>
> Fix this bug by adding a check of mhdp_state->current_mode.
>
> This bug was found by a static analyzer. The analysis employs
> differential checking to identify inconsistent security operations
> (e.g., checks or kfrees) between two code paths and confirms that the
> inconsistent operations are not recovered in the current function or
> the callers, so they constitute bugs.
>
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
>
> Builds with CONFIG_DRM_CDNS_MHDP8546=m show no new warnings,
> and our static analyzer no longer warns about this code.
>
> Fixes: fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridge")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 5530fbf64f1e..347fbecf76a4 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2040,6 +2040,11 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
>         mhdp_state = to_cdns_mhdp_bridge_state(new_state);
>
>         mhdp_state->current_mode = drm_mode_duplicate(bridge->dev, mode);
> +       if (!mhdp_state->current_mode) {
> +               ret = -ENOMEM;
> +               goto out;
> +       }
> +

This appears to be a problem that is handled in other drivers, but the
solution here does strike me as good.

The out-label will schedule modeset_retry_work to be executed if
ret==-ENOMEM. If drm_mode_duplicate() fails, we've had a memory
allocation issue, and failing is probably the correct solution here.
However cdns_mhdp_atomic_enable() does allow for signalling failures.

>         drm_mode_set_name(mhdp_state->current_mode);
>
>         dev_dbg(mhdp->dev, "%s: Enabling mode %s\n", __func__, mode->name);
> --
> 2.25.1
>
