Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D9851AD22
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 20:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A06410E168;
	Wed,  4 May 2022 18:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138DC10E147
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 18:44:13 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id v65so2052102oig.10
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 11:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Krvi/HpwBHAesm89MfsfOEIVsDIyjC5WrgT/4s6KRVQ=;
 b=Oao9pys9XD8VYE1VlkOYBz1163LoVqK0zQTXLcgwltnMASr9kfj9/M4WPVNS3hAy7A
 X01TWIvf5m/gbtLzupZrqcJ7u1D7aKzJ2VgI4+xF1TS+ioPlz0/Be3OZU5VRk4tIzZN8
 lj+SykAlqKoIZtcW8FCGRyjQK8KNyIQujQAuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Krvi/HpwBHAesm89MfsfOEIVsDIyjC5WrgT/4s6KRVQ=;
 b=PxICTpsMo86kQOQpAtptMzp1dlN1w6rYWAi/8zirdBFPV8aWJTDQFhnMF3BON9zNBi
 K59DvGXEBR4tuJo5hJCT8QTqr2DEadGQIyIYVgwfPPusJtcSJlOp/dZjlrNjzhBmg4zX
 Dhp7YQH5F+gvwM3Jcb+a8VJ9sQaSDpmQR1JgnCc86UagsS4NWAOEBTpZ6J3M221rH49C
 m9NYp/1H5FyOSipohMQMboJ887bi4rmzGUcsEl/I9FJm7ObJb500ws9ZHgAv2tXvqXsQ
 OM7sOo1t8XX1YFezEf7PxO10fLWLHc9fbZQRLFFIbZYeY9GuRFEPxoyaBcjFWiVuNIOz
 scUw==
X-Gm-Message-State: AOAM532zSI0Nkb5r1opevKlYh4k7BUBzEoAKjr7sL/nbxbkTb8WOr+WZ
 EyQXStZPtlVnEybA16p+C0Pm5hDEzrIR3xZdnkFYMw==
X-Google-Smtp-Source: ABdhPJzN6Wlws2ejvXzwfKhDTAuq/vO3u/Y7SEw5cpP2kVU87jhPZQDlvf6Baumo+WHVMuuIUelVblPIYt8pNdViXkE=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr440284oif.63.1651689852377; Wed, 04 May
 2022 11:44:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 May 2022 14:44:11 -0400
MIME-Version: 1.0
In-Reply-To: <1651595136-24312-1-git-send-email-quic_khsieh@quicinc.com>
References: <1651595136-24312-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 4 May 2022 14:44:11 -0400
Message-ID: <CAE-0n50P4G1gwKmdzKR-ezHwmN3_BfBC5eWTC852oww75Zen6g@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: fix event thread stuck in wait_event after
 kthread_stop()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-05-03 09:25:36)
> Event thread supposed to exit from its while loop after kthread_stop().
> However there may has possibility that event thread is pending in the
> middle of wait_event due to condition checking never become true.
> To make sure event thread exit its loop after kthread_stop(), this
> patch OR kthread_should_stop() into wait_event's condition checking
> so that event thread will exit its loop after kernal_stop().
>
> Changes in v2:
> --  correct spelling error at commit title
>
> Changes in v3:
> -- remove unnecessary parenthesis
> -- while(1) to replace while (!kthread_should_stop())
>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 570d3e5d28db ("drm/msm/dp: stop event kernel thread when DP unbind")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
