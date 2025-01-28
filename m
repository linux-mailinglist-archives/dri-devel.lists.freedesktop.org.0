Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDE6A20A2F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 13:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65E710E642;
	Tue, 28 Jan 2025 12:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bnwkqBBq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E72B10E642
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 12:06:03 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-540218726d5so5963566e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 04:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738065961; x=1738670761; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qUyQVfWY0TcVLA75T8KrSwQy4er3JVk1Q3BfjVHWE9I=;
 b=bnwkqBBq/PYnPqaT2ADoYD4bycCQ5nq1VrYiMRvFqQdpJe2NBffaYVnxLuuf4ZT52j
 iAIbZIRtM2QbeNag0XO0uOkRjKoY2iN3Ot+mS+YsZqBInLHtq7fly69+AumBDvLWSKaF
 AIb4dOFJzmfGPQCurwwRSra+Oxf30N9NBi/h1eJUU1PBHc2NTwWGHTNKMrzWLXHjVpVn
 UZJCnYEe2LcFjHl56onRIqP9LKwx8ttdEkWbMrWsM3vi1jBdN+Nldo3WNiCGhuk8kKj5
 uRXXsnl9VgmiibQfl4gPoYlIMBbdvd3+3RfkPav5MJw6cT0ohqJlAXB8vbXW/3Z49wf7
 Wrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738065961; x=1738670761;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qUyQVfWY0TcVLA75T8KrSwQy4er3JVk1Q3BfjVHWE9I=;
 b=dveVwkhHCR0T4v/Lshle40Dq4vYYWQ9D92QaualYwL3I6z1Ha1Xox6xtMVn+3Rebyg
 B6iqQZJDZFpgxA7qiDvdZytoy8aZtSWxxFjWTWnNBGK4UfVys20oPzT9Gmc1hWoHtsb1
 OM4SCVvbTlfUQ9hucvuXKo4wfr6F8zFmUSxYxHU/lnDTEBJTUp9dsdHFgLk9hCbO20Sg
 +MIEIJm/mnDgjM5E7xiQbe2z8WC0Kmg6MPGFJ8ArqCLjdantDFqzfdb9om5RNYqlHxBp
 rM7SHb9ENyEQZlT9AA+KOCtp9fmu4fdq2TlS8efAAdt0EmgktjzINWew6JxkluNSGjGC
 80zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2d4cKql337r85hIofAo/YDrA6YLjDJdg0hzGclsktIcvlIN7K6QyxlGzYqpCiS3u89jgP/Uy7ugI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygwKyl71pneeMxMX3EfHivP9O5lWJaTj1s/FqWBrK0IiEawhjG
 XzTi+Syj170FXgVvgQ28lsH3SrBFusxxM8ZRCQbcPRKmgz44tZtLUlEgcLYejHM=
X-Gm-Gg: ASbGncukQTyQugk5WAyzBrR0BsNdfJNuq2HRuCO6Yi4BvZKHpB6LAvSWd6xhlFc9BAY
 ozSLzc8VXmBeOtGa8NRB2uBCNfA799n+Mu+toST05GO1QYlU2O11K8IVdn/B/fV6qrAOK+P8+XV
 CIgq9/UmF+dZG/SWrKeYn+zSFRKeZdM6RfqQlFUDKt9TCRg2IELUH2H8wzoAGI+eOOKFa4qI9y8
 MuQkwdIT7dHDiRyWA1cpC/lxwHJP9Ae71IY6ORvNcMHT9RwBtokQtsdxfioOzsQd+S3PqAIsv5I
 cQBO7sMow4/WLyuX6mZxYyKah7k+xQGbXZpilCStl5QBr96puEA0HzMbruBJ5g8RLnd+oDE=
X-Google-Smtp-Source: AGHT+IHAsiYhaOuqsjBfo6+IiSS13eiK4EvcYmQzAODrNEPBRfk1wrbF7CuWTZhv/BBI0wyJGPOXUw==
X-Received: by 2002:a05:6512:b94:b0:542:7217:361a with SMTP id
 2adb3069b0e04-5439c22c3bemr14203681e87.10.1738065961178; 
 Tue, 28 Jan 2025 04:06:01 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bc194cesm18324081fa.72.2025.01.28.04.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 04:06:00 -0800 (PST)
Date: Tue, 28 Jan 2025 14:05:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/dsi-phy: Add header with
 exposed clock IDs
Message-ID: <q7qrfmmzvs7uyleiuxzaahhawcgexbsyvi7edubpfmr6ompcw2@vj2j434qcwbf>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
 <4vy6tjdvhkplly3uqqekdmz6brkcbac6pijrn6gdyz4x3hralr@meeugoua2ats>
 <7038f0a5-f7ae-44da-abee-bd04fecf74b4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7038f0a5-f7ae-44da-abee-bd04fecf74b4@linaro.org>
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

On Mon, Jan 27, 2025 at 03:37:05PM +0100, Krzysztof Kozlowski wrote:
> On 27/01/2025 14:56, Dmitry Baryshkov wrote:
> > On Mon, Jan 27, 2025 at 02:21:04PM +0100, Krzysztof Kozlowski wrote:
> >> DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
> >> two clocks.  The respective clock ID is used by drivers and DTS, so it
> >> should be documented as explicit ABI.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Patch for Display tree, although with Ack from clock.
> >> ---
> >>  .../devicetree/bindings/display/msm/dsi-phy-common.yaml  | 2 ++
> >>  MAINTAINERS                                              | 1 +
> >>  include/dt-bindings/clock/qcom,dsi-phy-28nm.h            | 9 +++++++++
> >>  3 files changed, 12 insertions(+)
> >>  create mode 100644 include/dt-bindings/clock/qcom,dsi-phy-28nm.h
> >>
> > 
> >> diff --git a/include/dt-bindings/clock/qcom,dsi-phy-28nm.h b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h
> >> new file mode 100644
> >> index 000000000000..ab94d58377a1
> >> --- /dev/null
> >> +++ b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h
> > 
> > I think this should be dt-bindings/phy/qcom,foo.h
> 
> 
> Both options - clock or phy - work for me, although with slight
> preference of keeping foo constants only in foo (so clock -> clock)
> because then clock maintainer sees it as well. Also because I would
> judge by type of constants (so again clock constants -> clock
> directory), not type of device. We have several MFD devices, like PMICs,
> which have a clock, so bindings should go to mfd? But mfd is not a real
> device, but Linux subsystem.
> 
> For many other archs, e.g Mediatek, pretty often even for the same
> device, the binding headers are split between clock and reset. I know
> that Qualcomm GCC has it in one file, with exceptions (ipq, qca8k). Also
> these other archs have bindings file in e.g. soc or arm, but the header
> in respective subsystem
> 
> With exceptions of am654 and pisatchio-usb headers, we don't store clock
> constants in phy.
> 
> Unless someone insists or there is existing qcom convention, then I
> rather prefer to keep it in clock.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
