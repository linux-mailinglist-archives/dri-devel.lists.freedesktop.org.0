Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A2D9C4368
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 18:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8BE10E2F0;
	Mon, 11 Nov 2024 17:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pJCMuiJ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120E110E2F0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 17:17:45 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6ea50585bf2so45326447b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 09:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731345464; x=1731950264; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EVAoKlYuwhpxemTCYwh1Tkj7l1J7a1J0FZ6n/pZvepA=;
 b=pJCMuiJ0MzXdAYx+pHcHr95SMraluA3ng+uk5jiqAYsMQN+SbHM+xUaD9RLomloPaK
 EbeGD6scF4oM0izRa4Y5SMNt0Sfiv0R8tvPTIyvfZagpRoFH8UsnzMqxE0ofP4p5W5Cp
 bJzIdp4nV0DF6lf6AblxEecO08sua9V7EjBwfXYQ/fXHMZOw0jCoh5qAg9hL554v2jA6
 y9BZrskYWhEosqND8pmCxyTWDmyLQOOUkSFnOZ+PGBz0L4JSNmua/wnoypFWWWkHulIe
 fWgte34BfKMbeb+tVEw5OT3cEpk7hMTjCH2Zd5IkVwbWfrJxRaPMGDeBJ6oNa5kIxLDv
 YSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731345464; x=1731950264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EVAoKlYuwhpxemTCYwh1Tkj7l1J7a1J0FZ6n/pZvepA=;
 b=oJjnsysKHdh9sLoC0djPuRZrnADTcY44Uj6jn9/jqw3rsYjEG4UlMQ/Els8FmK7VNq
 XR1Uxtc0bz2UW2dW/w+o9xEDbz+DOezsrwcTpwcunGdNIRpm8XMjOtZsfxlv0/AgfJ79
 xTD3jyvpYAelKsBfd4dqRmpockQ78tWVu5Ih5YYWrcW6lqyq95jj3V7TAGf0UgdCQ98O
 9QLjOe9vhW68LeCcHRuFi7pdHEsVS3GFTrSFiNsGKalcC0fX7+vhixpE9lFHYXbD9Yg9
 R2MCg9T+lqpqsBYE79LxW1aicDWWHCXNrzoswWGSSo8PJfdJOE4zXL7o/3gcyV0nZbjA
 sejg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpC5F5YhHOgZKbRwTjBatSEwuuQI51n7xufwLA+DhtgQbep5IdgEN6NZXsG89pMsIohy3uVRO7y1c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZ+vO7MuQEsWs6HFSTVaBAkFTB+9xMwJ0NmxhBQXI34y7lQ9jD
 a1WRuSCBiAl0mUq1ocikTcO8S22WK5FKa2CicJRjOQ5YyrO8wCEvg8filuoprOfVPafCmKEi7k8
 QKdYATdqIBhlzvTzuOF75KnSYqOQTe2pYUHA3lQ==
X-Google-Smtp-Source: AGHT+IEIfKEgS8SXTmAU6JUeTqa2pA45BLVA8WQCryDvQyLebwuTTv0iL8Ym7trTq+NnT9YNlkjR5YyXNUj+tHbLJUc=
X-Received: by 2002:a05:690c:dc7:b0:6e3:34b9:961d with SMTP id
 00721157ae682-6eaddfbe812mr106611157b3.38.1731345463717; Mon, 11 Nov 2024
 09:17:43 -0800 (PST)
MIME-Version: 1.0
References: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
 <20241009-patchv3_1-v4-1-cd683a9ca554@quicinc.com>
 <ugkiv4m3etpydvosjkyzwr4qus74xnwccow7xrpvr77kzcx6bv@odlz7dzldqc5>
 <CAL_JsqJ0zoyaZAgZtyJ8xMsPY+YzrbF-YG1vPN6tFoFXQaW09w@mail.gmail.com>
In-Reply-To: <CAL_JsqJ0zoyaZAgZtyJ8xMsPY+YzrbF-YG1vPN6tFoFXQaW09w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Nov 2024 19:17:32 +0200
Message-ID: <CAA8EJppkv-BoiX-UQZ2S6iL5KQZMBAMREarHxxhc45dEq5U84g@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: display/msm: Document MDSS on SA8775P
To: Rob Herring <robh@kernel.org>
Cc: Mahadevan <quic_mahap@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, 11 Nov 2024 at 19:06, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Oct 18, 2024 at 6:00=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, Oct 09, 2024 at 08:02:01PM +0530, Mahadevan wrote:
> > > Document the MDSS hardware found on the Qualcomm SA8775P platform.
> > >
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> > > ---
> > >  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 241 +++++++++++=
++++++++++
> > >  1 file changed, 241 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa877=
5p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-m=
dss.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..37c04ae6876f873c2cddc=
51b5160b1f54e2b5118
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss=
.yaml
> >
> > [...]
> >
> > > +
> > > +        display-controller@ae01000 {
> > > +            compatible =3D "qcom,sa8775p-dpu";
> > > +            reg =3D <0x0ae01000 0x8f000>,
> > > +                  <0x0aeb0000 0x2008>;
> > > +            reg-names =3D "mdp", "vbif";
> > > +
> > > +            clocks =3D <&gcc GCC_DISP_HF_AXI_CLK>,
> > > +                     <&dispcc_ahb_clk>,
> > > +                     <&dispcc_mdp_lut_clk>,
> > > +                     <&dispcc_mdp_clk>,
> > > +                     <&dispcc_mdp_vsync_clk>;
> > > +            clock-names =3D "bus",
> > > +                          "iface",
> > > +                          "lut",
> > > +                          "core",
> > > +                          "vsync";
> > > +
> >
> > It's been more than a week since Rob reported issues with the bindings.
> > Any updates? Obviously I can not pick up patches with binding errors.
>
> Well, someone picked up this version rather than v5 which appears to
> have fixed it. So, probably need an incremental patch to fix the
> warning in linux-next.

Well, I picked up v5, [1]. I will check if there are warnings and send
a patch targeting linux-next / msm-fixes.

[1] https://gitlab.freedesktop.org/lumag/msm/-/commit/409685915f00


--=20
With best wishes
Dmitry
