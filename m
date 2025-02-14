Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C552A35C91
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 12:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9458A10EC4C;
	Fri, 14 Feb 2025 11:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xhhidBWM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C2110EC4C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 11:31:28 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5450f38393aso1918671e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 03:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739532687; x=1740137487; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZQrrMIIcsdepuAUZtYMG2ibPJAIlpej8VrcFVh4LEgA=;
 b=xhhidBWMZGJvIjNE/ZtVzop4K3XksdwLCJsPRJdd45UetuqInsI6ceYHZWBnEyd2yD
 5ITpjcBrBKNnZaRoqwrvRa1nephl3zA3l7bQ5uYBM4dwDX4MFL6lvIRfr/Nn7vSFtu3H
 ApC9ElyK2JDgC11bljQP10tVl/eU3R8W9FtCc34QDTq3AWEwStYAm99i2O3YTb3XECtN
 u4axI58vja3nCOJIB9h2k0jM/83+I6grpnPdyMrqaE/XrIgQp5jn+8UuHv5IYxbhZLqB
 43MMxxcshAfP7dXt6te2SH+rfUgtSNCmS6AZ/WjQqQnKe6YF+NmDJyn5VLFRUwBUlyAL
 vyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739532687; x=1740137487;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZQrrMIIcsdepuAUZtYMG2ibPJAIlpej8VrcFVh4LEgA=;
 b=isdU5gk+SvI42L025MEpRZM42AIE6mv5Qt+dyHPfwODhsglYGSELxyzb791ufktqZl
 4TLToDLnCZFsy/6/AEzqnBX4U6VCsx0fY1PdVF8mZB1U7CGc42eh+MFWlpNXqEIAdJcR
 TPMbA+STpgMTlqKEnsvrg0OQSrVMEyrnejlqCYSjdpXVU8PVWviqAbYZluc2tKr9UbaQ
 ZmV3b4ZTyvfPOIQmGPkOs52Pqd5T4iDFZtQ88IYdf2z9tukWoMlmxr8ZAR70Unx25uF8
 AwlAc+QH+wmkGG2COT2asKhTBwwy3ggWAK78tjMjy5EQ8kaGEo4xOi8q+AcwqHyZkwG3
 shsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPy7uJ1S/AGvr1nDYBJFCISGY7N2hvPCtvRqpAUnNWAf+e/5bDSmK9T7GyItBsYJ7ULhN3R3EOEvE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7LCzHHh3cqsMfD8lUsOZdWf8IWHtwKw/fVftacC8M/iVDJ1TG
 yV8GWuOk7duAZxH1KBJ+U+ClG21OOCETI5QBnKnVriVEdGH7viqO7BxR3vE1lUo=
X-Gm-Gg: ASbGncvx26N2sKEcT4lB378OEiMg1aRLrHf33o4yOdHvge9hRQw1LHmvLCBmpv+vsT0
 ZDT2B+SspSwBZUAfWsSlPhFPWqNN5YHO2Cndj6lqcYW6a/VzGrfI+4pZyAhl44ZpuvID0zG/7CN
 xIKxVF+TTbsoaAHpjgxGUoJnGddPm7R8JQKbMVzYD33Z/ZmIqBaiC4hNzq8EV6JGNhdhmhbPwmF
 Vgt4QXyOMb/574p2JXZgnp4OF3sfYxA5R6XEK07kOfzi/lth6pPzuWZ6xh5uqd5iekF7YwUFYY4
 6c4/6i4PB4mDA9tRr6xVrfmlwIMU5t5udPZiz7Nnb4qzDiyISaCLt8MkADR3A+L7rXYwVng=
X-Google-Smtp-Source: AGHT+IGjs9yMg+iCQr3IF2oWlxeySoJlOZkKJgyEb8x4vfVkiQxa9wP3j61Oy3tVPMRng/3g23DMxw==
X-Received: by 2002:a05:6512:2216:b0:545:62c:4b13 with SMTP id
 2adb3069b0e04-545184a2e51mr2906212e87.40.1739532686682; 
 Fri, 14 Feb 2025 03:31:26 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f083593sm487198e87.18.2025.02.14.03.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:31:25 -0800 (PST)
Date: Fri, 14 Feb 2025 13:31:22 +0200
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
Message-ID: <cpem2v3z5slkihza4h4kaocxitpmdpnkrnl3iksevbewsqo5tb@zugjn5ng6oci>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
 <b4d07c0a-5b09-4a89-84b0-e8508ae12ba5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4d07c0a-5b09-4a89-84b0-e8508ae12ba5@linaro.org>
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

On Fri, Feb 14, 2025 at 11:50:14AM +0100, Krzysztof Kozlowski wrote:
> On 27/01/2025 14:21, Krzysztof Kozlowski wrote:
> > DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
> > two clocks.  The respective clock ID is used by drivers and DTS, so it
> > should be documented as explicit ABI.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > ---
> > 
> > Patch for Display tree, although with Ack from clock.
> 
> 
> Any more comments from DRM side? Can it be merged?

Yes, it can.

-- 
With best wishes
Dmitry
