Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE70067E203
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 11:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FFA10E444;
	Fri, 27 Jan 2023 10:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942D710E444
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 10:42:18 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id d8so3514819ybe.9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 02:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u0DEsVHKXVwSN3PAjhc49w5MtI6q8p3tuYvphFNkdg4=;
 b=lu0Vvh5MuoiiYDYZUTxh7zbvym4Uj0/v6GjSmt68vqvdxQUf4Buqig6SOOwUSz/XbL
 lO/9cqb+CuVhsufP2wulTnuiRl2uiG2IjcDc6ivKuvFEojix/qo2+3r/N4B5rLofVMLz
 M+G+sJV93/IYHsoiQEjGskyIqr24h0NhIbgHpj6EDrJRAv53piOFjlOE4jHf6GwByA9i
 BKtw45jsb2Zh+Y12Y2TbiuAYQ63uAaP+ubNy0hNZq3JJEttGX7LxkDCENU+DZqPgecyr
 AqPcysVFgoqtLkToozcLuK7KLQqkNqWwT6Yb+2Eh3jl4zZN177/2r+nainc7iIMJfmMa
 eNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u0DEsVHKXVwSN3PAjhc49w5MtI6q8p3tuYvphFNkdg4=;
 b=sQ5wZdBe6BWA2/lQ7Lufmk95/dGu70WZAcGepKzwMQP9N239O0RbxMprBl+ta63m5g
 o0ZB4IKqsSCGW7pIGYdYIoNtNvr3quwe+BNfwjbKSNONoLoGjkrs47NJPjHTcp8lvFmB
 Fne+O5T0LHBfWCJMu/yZGCDLcEZShTnQ5arPpH/DZBvU56Ezjc00icEZcvoMWFAv3Vr9
 SE7F/0i6Ly/LVgq3lYzv9OQOvbzIrhDttbwc7TQmeYdD+gT3COducLPwPcs7flJvovDJ
 MgU+SX+0NyeVlY9gqcS80Z32XdUKE6eE1mV+ioSJyaBCbd0YjLUzv5G2a6bSsajsFga+
 ZbfQ==
X-Gm-Message-State: AFqh2kq6rc11oRvYemlJPk6DF5vaq84JMWuftt3ms5JvEHias0MAqovx
 1EPSHMuRVeFEz9ns7lTp7ffuMDuKEIBZrrNbai4K5w==
X-Google-Smtp-Source: AMrXdXt4duFzDFzPIakNzG6OqVc1/XNGxgxhi/nSyzIhtE35B4STzPtFyk5UKGZ1IPXCXqZQlrjy22DL04eJMPVwVFg=
X-Received: by 2002:a25:af92:0:b0:801:525c:6726 with SMTP id
 g18-20020a25af92000000b00801525c6726mr3185391ybh.152.1674816137778; Fri, 27
 Jan 2023 02:42:17 -0800 (PST)
MIME-Version: 1.0
References: <1674814545-9453-1-git-send-email-quic_kalyant@quicinc.com>
 <1674814545-9453-2-git-send-email-quic_kalyant@quicinc.com>
In-Reply-To: <1674814545-9453-2-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 27 Jan 2023 12:42:06 +0200
Message-ID: <CAA8EJpruGSXPDd+wj2vZpRQ3wgk3U+Nvvx0hsP=+U503vQ-c6g@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/disp/dpu1: clear dspp reservations in rm
 release
To: Kalyan Thota <quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, marijn.suijten@somainline.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Jan 2023 at 12:15, Kalyan Thota <quic_kalyant@quicinc.com> wrote:
>
> Clear dspp reservations from the global state during
> rm release
>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>

Fixes: e47616df008b ("drm/msm/dpu: add support for color processing
blocks in dpu driver")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 73b3442..718ea0a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -572,6 +572,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>                 ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
>         _dpu_rm_clear_mapping(global_state->dsc_to_enc_id,
>                 ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
> +       _dpu_rm_clear_mapping(global_state->dspp_to_enc_id,
> +               ARRAY_SIZE(global_state->dspp_to_enc_id), enc->base.id);
>  }
>
>  int dpu_rm_reserve(
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
