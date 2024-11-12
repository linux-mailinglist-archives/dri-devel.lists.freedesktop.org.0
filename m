Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB0D9C58B9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 14:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5F610E1E9;
	Tue, 12 Nov 2024 13:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ybbvCE5c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA2B10E5DF
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 13:15:13 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-6eacc99a063so54484007b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 05:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731417313; x=1732022113; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RjMFUcCJ2PMcOh++QmaV4FSg4hd5bf5ZwUL8svAZiGU=;
 b=ybbvCE5cBH1zb5RUKEuG/vfx9T8S1TDDaAn40usQrYNky8R/4qmmGYeni5Qgoyr34K
 GhQusT7ACqElDz+fAovdGBbPwzqD7mDvEGbqIC3y3Vtpk4BxKf1HitoX0m09PY6gieiQ
 Kde2BDaK/u2JWBfYjjclmu5dMXT1S3kkPFNq6wvjiFZXDGir/FEAOvgWfWDLs/0B0t/d
 8YjqCj2gHfR2ek4JPl0cAvvrgbMFP5G+v3TidCybuP9cqCYeYwG+Pprc5YoZprJWMVIi
 Xoe0Q5BE5dQ9BlyvDA0TCGfh0cPolu8cuah6/MpvBKvIH3HOOJGC/jK7k8L5VOXSc+Db
 ivjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731417313; x=1732022113;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RjMFUcCJ2PMcOh++QmaV4FSg4hd5bf5ZwUL8svAZiGU=;
 b=Kt0Mx8upBWCaQQT/SEPWB4sYcrsq+h1Ya2+1u9CwGIWMJnMRMjZLRSIeJLLdGCfJeb
 j9XyxEWX1VCeMvWzqHk4NVsUMDzVJboV69jxoONk1Y3gghtXsprJQZz7q3V6VTMdekzn
 WsjWqWh4N1zZyY1g7v4e3EUmHHr+rM4IskDUlbYeNJT3U02Ka+mYch9Oo0byp3Tapumf
 gGoKvpt+uAZJhlz58OAgwxDC6oFfjCu8VqYXpQ+eo6elyY+xtWpUQYOrr3OicH19zIg7
 B9FPI4zTQv6sjGl9OaXtEWX5UcrQuVLkoG4HiG/9uiJuEzajA187LWgpqH/3s9b5AkTD
 Su8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3f3Etn3D4orA3wt/Yu2eZIaDrCq7QgYQrxHSQQXAifK0rNM5WFv+17C/XAPPR7GaxHiH8QhfTyGw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7cNtWT/4hM/zp5jovTF/ONRarSscJdI69bxJjtCB64HnQHwWG
 oGsziyYyin/NFQO+VAS6+SizSuTLqny31K++WuIQtQ4Kg+yhXIUqhaM1twYOPTB1J1iMKa2JDFK
 bJqTKY0wed2pvkWCfVfs/B8JoFH8boRI6AIe54w==
X-Google-Smtp-Source: AGHT+IHXjXnnSh4cfhalObRmFjWIlKplKbXL511dM4znTgK/qAvBdvKZqt3NvA/NCChuF/Jz1MpD8Bjt8ZPwU1Hyt0g=
X-Received: by 2002:a05:690c:9b08:b0:6e3:1f02:407b with SMTP id
 00721157ae682-6eaddda0ec6mr157284817b3.11.1731417312627; Tue, 12 Nov 2024
 05:15:12 -0800 (PST)
MIME-Version: 1.0
References: <20241112-fd-dp-fux-warning-v2-1-8cc4960094bd@linaro.org>
 <643d2935-65ce-4d86-9be6-c2faa1956365@quicinc.com>
In-Reply-To: <643d2935-65ce-4d86-9be6-c2faa1956365@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Nov 2024 15:15:03 +0200
Message-ID: <CAA8EJpqBouv-f-QMpZ+hrA-vF4ojhUWBn5yMqYYB9LpW0TACdg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display/msm: qcom,
 sa8775p-mdss: fix the example
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mahadevan <quic_mahap@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, 12 Nov 2024 at 05:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 11/11/2024 7:21 PM, Dmitry Baryshkov wrote:
> > Add p1 region to the list of DP registers in the SA8775p example. This
> > fixes the following warning:
> >
> > Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb: displayport-controller@af54000: reg: [[183844864, 260], [183845376, 192], [183848960, 1904], [183853056, 156]] is too short
> >
> > Fixes: 409685915f00 ("dt-bindings: display/msm: Document MDSS on SA8775P")
> > Reported-by: Rob Herring <robh@kernel.org>
> > Closes: https://lore.kernel.org/dri-devel/CAL_JsqJ0zoyaZAgZtyJ8xMsPY+YzrbF-YG1vPN6tFoFXQaW09w@mail.gmail.com/c
>
> Thanks for the patch.
>
> I think this link has an extra 'c' at the end.

Oh.. Can you fix that when picking it up for -fixes or would you
prefer to have a clean version in patchwork?

>
> With that fixed,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - EDITME: describe what is new in this series revision.
> > - EDITME: use bulletpoints and terse descriptions.
> > - Link to v1: https://lore.kernel.org/r/20241112-fd-dp-fux-warning-v1-1-705b527f5a63@linaro.org
> > ---
> >   Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > index 58f8a01f29c7aaa9dc943c232363075686c06a7c..4536bb2f971f3b7173b8807f90c9af3e460bb01c 100644
> > --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> > @@ -168,7 +168,8 @@ examples:
> >               reg = <0xaf54000 0x104>,
> >                     <0xaf54200 0x0c0>,
> >                     <0xaf55000 0x770>,
> > -                  <0xaf56000 0x09c>;
> > +                  <0xaf56000 0x09c>,
> > +                  <0xaf57000 0x09c>;
> >
> >               interrupt-parent = <&mdss0>;
> >               interrupts = <12>;
> >
> > ---
> > base-commit: ff2ce06d5e28be5ee399a2ff894d6a551c70a318
> > change-id: 20241112-fd-dp-fux-warning-c8764c93f787
> >
> > Best regards,



-- 
With best wishes
Dmitry
