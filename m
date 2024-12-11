Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DCB9ED9E6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569CD10E0AD;
	Wed, 11 Dec 2024 22:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="V4ERCPNd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D772A10E08C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 22:34:53 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-6d8e8445219so41929936d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 14:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733956493; x=1734561293;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=xk9mjVxKh0Cpv8VTlttHozyBPYsnqFLG9k7nQi8tKJA=;
 b=V4ERCPNdHG7YaO6uFhX6vLkrGvhe/89vlRjX74hqW88LAEuzb4dlq0sGDl0gwJUqAO
 T4C6ox+P+r0DGEwJm1gqsK4tfUGJJuv6txyO6+ZFDLHxqBm0uwowJpPAIESzgmfvE8gA
 YaIdGcjPGqk8eBzKSM6CzQr4Ti5A/6Lq2YEa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733956493; x=1734561293;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xk9mjVxKh0Cpv8VTlttHozyBPYsnqFLG9k7nQi8tKJA=;
 b=Qx+ujdVJ2/GrexIdTyyjjm/c68u4MDEHLvsvn8xUQpic4ltGxlXflfe8m5Dt0aymiR
 8RzPcCA0X0ZxFcqs+gH1l4VVhPBiHDpRaiDxItoFwUJ8KC0lhaG7bWiPd6dFdVOPmPzu
 DK/IZr48GhqzrZs+dEbIVA6pVVx9vfwUs4zzzow2FuC+EhVh/N5Q5rQdoNzxnvndxkgy
 e9xpjrCHqO5qQpJm0VeLplHSCC0gVqhMPqlNN7dziAKXWyZrs37fcM6mdxrJo2KYcUvL
 ZFuX9J13nKzUwpo6hd3RvHO/OBdBI+oIeiNw9Rm2PIHFmTeTbY35XQ1oAN5vITQalB0V
 XR8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpJsshRLbGsMBGdWbVuXPzEnYuiX/qVY7evXwRJrs/SvpMyP9KYsU358R9rGstv8TEhaj0FDqT+a8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxE40iV/edEvop6m0FuLEWDqrfF4lkcs89aIcYTZA1PBWmR+Vmf
 IU57dZuYBEucr2ku6K1LixNCZbHD72vBeEjviA4KgpFaEi8FXbntgMdQoQV62UJLWtYLVOFopEB
 K3/toSJknWLYFYwx1biAB7QclvT/hA7dvoZ6l
X-Gm-Gg: ASbGncvuGimjX6a1J/C120Vdo5a6B8Ug5wT11t6zHsgEm6ows1oDbJEG15ahr/6RaFz
 hnVwhi4wGC/eQqmZdeOfTEYOvhg5oGVkSNf8668ZWbdxEqKFD6qdYbddVVqPwE2Q=
X-Google-Smtp-Source: AGHT+IEmNl1A02u+Et+QaYelQl7de4pzHAlegixn/lag8TVHIDn3QbqOGZ1uvtk5TAuOj8J/cuxjMvpZP+M69zQwnG4=
X-Received: by 2002:a05:6214:d83:b0:6d8:9c50:52be with SMTP id
 6a1803df08f44-6dae39a1d71mr15934046d6.44.1733956493056; Wed, 11 Dec 2024
 14:34:53 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:34:52 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-9-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-9-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:34:52 -0800
Message-ID: <CAE-0n50Ei+DodV6VRmm_aSEZ_DdeMZ_vMnK7Mq0=X441B+YreQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2024-12-02 02:06:39)
> Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
> to program audio packet data. Use 0 as Packet ID, as it was not
> programmed earlier.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> index 5cbb11986460d1e4ed1890bdf66d0913e013083c..1aa52d5cc08684a49102e45ed6e40ac2b13497c7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
[...]
> +               .HB0 = 0x00,
> +               .HB1 = 0x06,
> +               .HB2 = 0x0f,
> +               .HB3 = 0x00,
> +       };
> +       u32 header[2];
> +       u32 reg;
> +
> +       /* XXX: is it necessary to preserve this field? */

Maybe qcom can comment.

> +       reg = msm_dp_read_link(catalog, MMSS_DP_AUDIO_ISRC_1);
> +       sdp_hdr.HB3 = FIELD_GET(HEADER_3_MASK, reg);
> +
> +       msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
> +
