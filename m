Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1964B7CFC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 02:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E89710E5F2;
	Wed, 16 Feb 2022 01:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E8510E5F2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 01:58:55 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so836325oos.9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 17:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=R+LYm6UbYwzklwgrWKfldyYMasmr0KjdKhTH+74gh5E=;
 b=V/q8gH1WZpL2h1HMbcPsyQhax1VJztQIe10OiGgLpp3mfnSElE8s1fmozTu0UZERff
 /P3g4fqN9FQkP6ymYgD59qg67zdRpuBv5i7cEmI7Vn11781ZjVZO8GYjwjRxMdiFsflx
 FyMySmz3/V8jYwp6c8ER0o3C+d0n4kbTrU5UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=R+LYm6UbYwzklwgrWKfldyYMasmr0KjdKhTH+74gh5E=;
 b=r+EMEqbeD54bajt9rkjopWAoUkuM72qr2TuYQ0qfyRwx4fPkAdtj2sIfnAp8aTQZi5
 TlW2oGxpSfOWoF+16YHcHMDiTv+OnMSv05yx5l8hALOj4EZcMfx3PMsZmbwTYcwHF9EQ
 Kuq2h5U3aQ3HjxodKNYPkbFV4JQ3ILp9IoXeKIP+0KwgOKcPJw4VQnr91Xo+dbZPXx2G
 //E9pyK8omyWVlhxxU5lyTWJ5MM6FtO+Hz2ptrLlAhSErTJNPcaDucLkY7xKrLhDM72e
 yu91uRDjQ1cSUTr3UkKo529hHQahDGhlytbeK/VR4sHnNdz+yZmiyivsyn32fdoZ/SpV
 J0SQ==
X-Gm-Message-State: AOAM530wlEQf1lDXhauM/fxt86sxSpkP6T7c727mxKXL7e1EM40kzGPF
 MZ0NP+YedkHfd7UC5Wdy10V7keNrsZje/jlRsGrU9Q==
X-Google-Smtp-Source: ABdhPJze3x/RF7+2WkKFtz8cWerX43wYucnT4Wu3WZEPmq2xYoXVy1IiMR4/cE/ZbonvVhbSyVFTMQkLvkqYp6NwLWs=
X-Received: by 2002:a4a:a9cf:0:b0:2e9:5c75:e242 with SMTP id
 h15-20020a4aa9cf000000b002e95c75e242mr206733oon.25.1644976734433; Tue, 15 Feb
 2022 17:58:54 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 17:58:54 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-7-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-7-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 17:58:53 -0800
Message-ID: <CAE-0n500D92XLGPHwm-SHPZ1KwzQ+2rKaDOHU-G_2j6aFv7Ofw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] drm/msm/dpu: switch dpu_encoder to use
 atomic_mode_set
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-15 06:16:41)
> Make dpu_encoder use atomic_mode_set to receive connector and CRTC
> states as arguments rather than finding connector and CRTC by manually
> looping through the respective lists.
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
