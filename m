Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3012E890C13
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 21:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EBA10E2B8;
	Thu, 28 Mar 2024 20:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dFqXutSp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F0610F018
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 20:58:20 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5101cd91017so1703780e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 13:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711659499; x=1712264299;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=lZTeYvBsc1oAa4VB+k3glOGyxEenyZ156QMTJ6JLs28=;
 b=dFqXutSpHX1E44qEeVybbi63NCX/N0xCBb/6PzPW2w3w52774N1mZoE9y+8NX3BMW1
 IiK8UFoQcVkayt3joPftnnBItFWRadsfNf0yCMfMqUDyeBy0ZVeNNIO5UMr7RsziF50n
 QefzQMpHnfTVCsMaRiBRBCO1a9+uBVKfL7sOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711659499; x=1712264299;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lZTeYvBsc1oAa4VB+k3glOGyxEenyZ156QMTJ6JLs28=;
 b=G1K5Y9EjphmbxYvN1VXzstl5DQgpNtGEBbUbmifa61hasAzYbizXkaKovN46ZW7o8M
 gY90jNwnSVsAy9jCEnjKYnkg7kYSKuwFoKyT1c5SwLb767EvWPIgNQBNVVq26OYQli07
 nbphKt/L9ndC+M4MjaFz3L37qeQF/JtYqZG3baLa4b8eFypmWVHB7Wa/bBvyLq3QnBqG
 vcUK5csJfT8Z42W/CE+aXrqRP0+HPV3KI8qmPwg1aa3E69NYvNK38p5r4sY7aM8Hx3Iw
 bWoK1P1kARGa4cmYDdiUiMHmq0O1SpAoMb6VkGzb5ggVAiY41U9ZYbXJ9zmgRvMvwXmQ
 5SAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmhEfP+pA5H81mQOH4QCa+AEGvSsZEiIcwPx3HAeFgl06/BIRpuYMmmdSjujjxH/82JTS48bcUDlA287Mut6+I+yjXlHI5vuUYl9WrP0ku
X-Gm-Message-State: AOJu0Yw0ErVDiLWKgPbkejFCFw0B07YAZZbaAn+LrXeiHJxAh+iYwqOm
 Wah/U5jNQXXMhOA8PSILP9NXNql3IIYa9GKaPR1I/gNvTJVEmfdoK2HN9dAxVMuSa6/WyO59fBd
 UBdlTZx3ab/C8jbJzDuZRCJNSGe5ztAWBoHuE
X-Google-Smtp-Source: AGHT+IHoxrbzbhkVOP8a4fcpK+Wu8N/3pU+MedZMjdflM+fqjOjEguDaIwsuhXjzqY9Q1I8bN3idizKTu7WUJ11QjeU=
X-Received: by 2002:a19:ca01:0:b0:515:c1a9:7d98 with SMTP id
 a1-20020a19ca01000000b00515c1a97d98mr395135lfg.13.1711659498582; Thu, 28 Mar
 2024 13:58:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Mar 2024 15:58:17 -0500
MIME-Version: 1.0
In-Reply-To: <55debb0a-c7af-ef71-c49a-414c7ab4f59d@quicinc.com>
References: <1711656246-3483-1-git-send-email-quic_khsieh@quicinc.com>
 <1711656246-3483-2-git-send-email-quic_khsieh@quicinc.com>
 <55debb0a-c7af-ef71-c49a-414c7ab4f59d@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 28 Mar 2024 15:58:17 -0500
Message-ID: <CAE-0n503FwcwreZ14MMKgdzu8QybWYtMdLOKasiCwmE8pCJOSw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm/dp: use dp_hpd_plug_handle() and
 dp_hpd_unplug_handle() directly
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 abel.vesa@linaro.org, 
 agross@kernel.org, airlied@gmail.com, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc: quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com, 
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

Quoting Abhinav Kumar (2024-03-28 13:24:34)
> + Johan and Bjorn for FYI
>
> On 3/28/2024 1:04 PM, Kuogee Hsieh wrote:
> > For internal HPD case, hpd_event_thread is created to handle HPD
> > interrupts generated by HPD block of DP controller. It converts
> > HPD interrupts into events and executed them under hpd_event_thread
> > context. For external HPD case, HPD events is delivered by way of
> > dp_bridge_hpd_notify() under thread context. Since they are executed
> > under thread context already, there is no reason to hand over those
> > events to hpd_event_thread. Hence dp_hpd_plug_handle() and
> > dp_hpd_unplug_hanlde() are called directly at dp_bridge_hpd_notify().
> >
> > Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_display.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
>
> Fixes: 542b37efc20e ("drm/msm/dp: Implement hpd_notify()")

Is this a bug fix or an optimization? The commit text doesn't tell me.

>
> Looks right to me,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
