Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A266D22D4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 16:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EF910F24A;
	Fri, 31 Mar 2023 14:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6378010F273
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 14:45:29 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-545cb3c9898so343726767b3.7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680273928;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0MUvj6InzZLXQQxmjmGO59NHAjC0vDjsk7+Frfxo9oo=;
 b=Z/hDsToqVvIQ4/eMDlsiI9NRhmjHkAqDNmu25q/Q+/6sK5GtKBqZRl7uUpim+c8ZKc
 KQf7fxOyz5daa6dYNVfBaaai10t/CE28EEsg7Uk1n4iqcpi8bj33XMel4ORDD5A2DrOb
 idCPi2QoPeDwhE0qQJ1BMZgb0JkudvpN7/W0yn+DdbavU46S5sZ1V+QS5vAwCatIVo4C
 mibvjDqPwaiPKxK2YyHZuWPg0j8AO+Dt0Ws38nTa5O++BWQr1Ni4PRaKKj659LCvVCNA
 IqGZzAA6i9kGAa0kFkMn0mWms+HBwDeY6ClVrrRidMSny07Dm6fzmm8MkO7XC2AX1gSe
 jP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680273928;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0MUvj6InzZLXQQxmjmGO59NHAjC0vDjsk7+Frfxo9oo=;
 b=lIkdMNIwmh1SbqxCGHngE3poYVIjW1NX1gMC3yl9uqNniZmCvTlkAr/6mre/QjyDHK
 UCk85xvp0YxNcI8oTFR54MrxjNVZopTXdxgK2z1p9Q6SxOUpJswO7Qd+XnAaMbnRi8Pa
 SGFQmPsPOw5e5mrUsxOH3WQRuMobVor6XL0lnu4IGPF4t7IwIkW2ut7/i1jK8YfttY75
 zQ5wx/cterLM134Ik6/2M9779VY5EeXQpa8pJapgGir6VEkGGeAptsaCABTkNjofYHhw
 wvcUnx3+I0yJVo4/A/vENymUiNvJ4skJBi6mUnEbeOY9P7v2lY1Bxs0lglJm2Hsv/1/e
 lTZA==
X-Gm-Message-State: AAQBX9f6v/eIxq1l7o63whh5mq69BPg+nFYuU7IOqc2LxL6k7uzfCy3r
 O1+t5QbQClaQtXaypZkkOZvM1Die3maLqAC6MNBp4g==
X-Google-Smtp-Source: AKy350YKfTfxSZLTn93/PabzrLMy3cO4bMXqdvdtS7frCg0qBJ1nWyMmjpiUeYSF/Wyv+ZZBUuij7hxKNI9ZCCizUpQ=
X-Received: by 2002:a81:ae4f:0:b0:545:ed8e:f4f6 with SMTP id
 g15-20020a81ae4f000000b00545ed8ef4f6mr9444843ywk.5.1680273928397; Fri, 31 Mar
 2023 07:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
 <1680271114-1534-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1680271114-1534-2-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 Mar 2023 17:45:17 +0300
Message-ID: <CAA8EJpo4HaYJ358gnBTfo94o7xUcN+z57+EJUMfJT1gQ5m_UEg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drm/msm/dpu: set dirty_fb flag while in self
 refresh mode
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, quic_bjorande@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-arm-msm@vger.kernel.org, quic_khsieh@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 31 Mar 2023 at 16:59, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> While in virtual terminal mode with PSR enabled, there will be
> no atomic commits triggered without dirty_fb being set. This
> will create a notion of no screen update. Allow atomic commit
> when dirty_fb ioctl is issued, so that it can trigger a PSR exit
> and shows update on the screen.

Will this impact non-VT workloads? If I remember correctly, we added
dirty_fb handling to prevent the framework from limiting the page
flips to vblank events (in DSI video mode).

>
> Reported-by: Bjorn Andersson <andersson@kernel.org>
> Link: https://lore.kernel.org/all/20230326162723.3lo6pnsfdwzsvbhj@ripper/
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index ab636da..96f645e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1158,6 +1158,9 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
>         struct drm_crtc *crtc = cstate->crtc;
>         struct drm_encoder *encoder;
>
> +       if (cstate->self_refresh_active)
> +               return true;
> +
>         drm_for_each_encoder_mask (encoder, crtc->dev, cstate->encoder_mask) {
>                 if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_CMD) {
>                         return true;
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
