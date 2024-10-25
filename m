Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 786109AF9EC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 08:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164A710E9FE;
	Fri, 25 Oct 2024 06:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lsnCoPuq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30D510E9FE
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 06:28:40 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2fb58980711so16140371fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 23:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729837719; x=1730442519; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ggQprwB+vTricRp85OZCHCZrtqv0PIzjtgOf5gOgeCo=;
 b=lsnCoPuqkaX7syxX1opA70oW+WVhUyMl3jU9X9EA2QKeyyuHVqmcUO01q9MxbF37/b
 +EaJyaxvWizKDaPskikys7i7tqxtGEjGBIxHe5r2kNoav9F9RC5+qGEC0aKfrWLmfCAP
 JFffsbeInq6/i1Rco3DuFDT4JEkwVmTmOjVxn/orAD7Gxmk/0gGJ9quAQgpGioMezWim
 UEsOjUhTomQ59c952qvobXX8DuAX8l04swlEqibHJhgdvEe4S+/u/HZu+dALkMelDmDx
 aZF11pQ69Zr4AA1k2tnKuCCY/z7f8IMnv7USZcxsmx7ZxWELxzoP3WCECWkAcjedlu+M
 hwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729837719; x=1730442519;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ggQprwB+vTricRp85OZCHCZrtqv0PIzjtgOf5gOgeCo=;
 b=O7JuJTIX7aFDiZiu7kND2JkYta1GsEVwG4VRvuccqr6Z2LTb3RiLTmXa5XjeVjF5BC
 dPQ33lFA4Hv1Ws2p0EOLREzp3EZnZkdE02VZpjJjaRaXGp7b9jUEzhfJALm1iw9xMzF7
 yAnArtPB6UJH2XDejRBvfisVUL/RcbnegwTSl+prPaV91CgVC0BrW+y/reLlyXy6CgBI
 UBYEjmMtDefiK6OR3KVBU7pRej/7r8CRjHkG0UcffGqWOcwV+fjqaOjrO0rU1i3BNm2B
 h5OPbj5lG1ym2D15rqWUVS4tvqS3Wa6+ptEnoK/XMtusw31KKDrDCGn3XAMF+72aOBzN
 XCsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvrFQTwyOCcOAg+4FFhlquFJG9HzFzQZDhgsA558PnO88F9xnKU570PGqRYhyRrHhNVmnQbEDHGdA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyIKiLqfvcDU32d/MOxCSVQ33S1miqzXMd+uC27OXoDKg7r7lx
 XKqZb2/vreV5c9/Ytj4b6aZUXzgsy3BVDA3gDQ5LGn3lHKfmpc2w4kETTapeUz0=
X-Google-Smtp-Source: AGHT+IFaqSi3YpsyTfNZEHslT6tXnIucCTkmvLVJIORZGEveGd+wYqYmRBCEZV5qZEaTCrCcylcBhg==
X-Received: by 2002:a2e:b8c2:0:b0:2fb:382e:410f with SMTP id
 38308e7fff4ca-2fca8227ddbmr26408121fa.26.1729837718711; 
 Thu, 24 Oct 2024 23:28:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fcb4612a5asm703221fa.122.2024.10.24.23.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 23:28:36 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:28:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
Message-ID: <4426b4kybtac6rc4twa5pgm3hvlegofemvqjcrvh6ni7f5z2h6@5dnlv3hgywh5>
References: <20241021-gpu-acd-v2-0-9c25a62803bc@quicinc.com>
 <20241021-gpu-acd-v2-2-9c25a62803bc@quicinc.com>
 <mz4zpcr4tqh2w7vt75f4ofxjzfve54ozzgpdbi2jjzk5pdxbk7@t36tlt3mmprt>
 <d858dadb-4098-4c9f-b4f0-393dc988db5f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d858dadb-4098-4c9f-b4f0-393dc988db5f@quicinc.com>
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

On Thu, Oct 24, 2024 at 12:56:58AM +0530, Akhil P Oommen wrote:
> On 10/22/2024 11:19 AM, Krzysztof Kozlowski wrote:
> > On Mon, Oct 21, 2024 at 05:23:43PM +0530, Akhil P Oommen wrote:
> >> Add a new schema which extends opp-v2 to support a new vendor specific
> >> property required for Adreno GPUs found in Qualcomm's SoCs. The new
> >> property called "qcom,opp-acd-level" carries a u32 value recommended
> >> for each opp needs to be shared to GMU during runtime.
> >>
> >> Cc: Rob Clark <robdclark@gmail.com>
> >> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> ---
> >>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 96 ++++++++++++++++++++++
> >>  1 file changed, 96 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> >> new file mode 100644
> >> index 000000000000..6d50c0405ef8
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> >> @@ -0,0 +1,96 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Qualcomm Adreno compatible OPP supply
> >> +
> >> +description:
> >> +  Adreno GPUs present in Qualcomm's Snapdragon chipsets uses an OPP specific
> >> +  ACD related information tailored for the specific chipset. This binding
> >> +  provides the information needed to describe such a hardware value.
> >> +
> >> +maintainers:
> >> +  - Rob Clark <robdclark@gmail.com>
> >> +
> >> +allOf:
> >> +  - $ref: opp-v2-base.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    items:
> >> +      - const: operating-points-v2-adreno
> >> +      - const: operating-points-v2
> >> +
> >> +patternProperties:
> >> +  '^opp-?[0-9]+$':
> > 
> > '-' should not be optional. opp1 is not expected name.
> 
> Agree. Will change this to '^opp-[0-9]+$'
> 
> > 
> >> +    type: object
> >> +    additionalProperties: false
> >> +
> >> +    properties:
> >> +      opp-hz: true
> >> +
> >> +      opp-level: true
> >> +
> >> +      opp-peak-kBps: true
> >> +
> >> +      opp-supported-hw: true
> >> +
> >> +      qcom,opp-acd-level:
> >> +        description: |
> >> +          A positive value representing the ACD (Adaptive Clock Distribution,
> >> +          a fancy name for clk throttling during voltage droop) level associated
> >> +          with this OPP node. This value is shared to a co-processor inside GPU
> >> +          (called Graphics Management Unit a.k.a GMU) during wake up. It may not
> >> +          be present for some OPPs and GMU will disable ACD while transitioning
> >> +          to that OPP. This value encodes a voltage threshold and few other knobs
> >> +          which are identified by characterization of the SoC. So, it doesn't have
> >> +          any unit.
> > 
> > Thanks for explanation and other updates. I am still not happy with this
> > property. I do not see reason why DT should encode magic values in a
> > quite generic piece of code. This creates poor ABI, difficult to
> > maintain or understand.
> > 
> 
> Configuring GPU ACD block with its respective value is a requirement for each OPP.
> So OPP node seems like the natural place for this data.
> 
> If it helps to resolve your concerns, I can elaborate the documentation with
> details on the GMU HFI interface where this value should be passed on to the
> hardware. Also replace "few other knobs" with "Delay cycles & Calibration margin"
> in the above doc.

Usually the preference for DT is to specify data in a sensible way
rather than just the values being programmed to the register. Is it
possible to implement this approach for ACD values?

>  
> > 

-- 
With best wishes
Dmitry
