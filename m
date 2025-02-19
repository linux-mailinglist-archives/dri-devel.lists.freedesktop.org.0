Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0F3A3BC3F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 11:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CF210E2BF;
	Wed, 19 Feb 2025 10:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wMSzwpsO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C604A10E2A0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 10:58:55 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-30613802a6bso67776151fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 02:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739962734; x=1740567534; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=01B6M3B/6e8fBJbhUwGqxldkm9jDFUlKOIpIo2WPDw8=;
 b=wMSzwpsOelsOd2tH+o/WP/0R33myFfeaiHsoolrmuq6zHwi/H1Q4f/kDVJ3Jbgz5X2
 SqCEhkwX4Fc23NJpJvbcIWB8KeaxVBTtxB1ZQcKIuooWUJVnk/u5T2zPB/O1wvLivaU3
 pXeKAqSmU2TkhYA7nSKRjiqwO5WJmrSBbrkduEkrB6h7Z/6QmpcTGhJQ7GwxqcejFSYl
 kq5lo8OvgYeW06D/wVpdiCvTKvVFh0RU8Lzcfii1/pHI3OM9aUJZIsqFtEn/yFq3hMYK
 stxH6aWl2TSUarsZ416GibRQvJIo+n/aEUCGdlvJAD4cxkgCu12OydiOC5bN1mRcZi6q
 F1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739962734; x=1740567534;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=01B6M3B/6e8fBJbhUwGqxldkm9jDFUlKOIpIo2WPDw8=;
 b=R+ZokjnvU6wY03WPjIqTjAbjrBE8SAEo1Jt9lH1O/qpCIIvK3IKMxt2dHOFCI7NZV9
 2pITjFjR6SXbWFqkVCK/fjf1XlELgU7lcc2DvohX8jub9Him0CL1h6iBHMvnE96BCkMs
 jHdRgeA+XAucgcxVS70fpVzPXeRhq+ZkLDy4hXgu4/5tklpREyKHefzQ9UrhG/2lHUIN
 S60DoR3oy+kpBw700vaHUCibul5oujGBKtFGpMOvKlKwOz2eEoPFDcJe9WalVYc1YwLz
 WnUdhpEn18+0YMIQV/jnFyeh2FI+LPoPG3lc3dI1HbA32BLDBLN2MT0yZ6JGVm2X97yY
 QVGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKCP5L9CuGtkWA8kteYMnqwragHHoLM1ExUEw29wIw43FlaT7R2oCwlkAYzq32QA7Ef5IJ4RicH6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyl2KDj+W1eve720dMWGeOK5UwR1m+L6584QCdXXXzonCwJ/+Ht
 60adMeyTSswrOvSiY76C3c/HYSdgmrUXZLKBdBN5F5LtTxnADkzYEDEaPRW3g8w=
X-Gm-Gg: ASbGnctAY1zj9REGn7uZHuS/naWubI1//oCNpKESadCnSpeZtK8gMCuyQq1OB6HBd4P
 1tBvj9/+Bh+zKUoRF7MChMKbCU38kT4lRpAZLP80oQPZezevci38ZwDDW5y6/hsgJGQgLmyDvGp
 w/mQA3TV1N8r586w3zCW5ZDzM6COtwARvj501wDncscsxapt/ue8mxgAMDMCmTCz5r0jgWRo0UT
 7tmHKhnm1/lfO93IlWNWP+OcRl6WDCCm4WPAxQOQgX4sq7HfadnV/KiwXr2HnV/O2MbD0dSOSL2
 FFmgDDdQxC29ImRtad5f8nQ+W2uNnPH4lg8hI9mPfVfZCAQyCQEUPODVVu63Yr1lYE+vrv4=
X-Google-Smtp-Source: AGHT+IGcisYXxPQLC+b5+fYSrjvm5AAYIjBDylh4x2pSEkaI839acVqUHx0018XYsObzYf9DMzTOXA==
X-Received: by 2002:a2e:91c6:0:b0:300:1ea5:1655 with SMTP id
 38308e7fff4ca-30927a47351mr50492061fa.15.1739962733885; 
 Wed, 19 Feb 2025 02:58:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30941da3978sm14149531fa.112.2025.02.19.02.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 02:58:53 -0800 (PST)
Date: Wed, 19 Feb 2025 12:58:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Add MST support for qcs8300 platform
Message-ID: <ylotx2i5wvkitezd3ilqg67g2fj2emjigvnxhsdfl5nmoscsbf@kybjxritnslb>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <87058b73-8854-4dbd-9f27-1da2a8240c16@kernel.org>
 <2ede97c5-a4f2-42fb-b3cd-68f26297150b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ede97c5-a4f2-42fb-b3cd-68f26297150b@quicinc.com>
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

On Wed, Feb 19, 2025 at 06:02:27PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/2/12 17:06, Krzysztof Kozlowski wrote:
> > On 12/02/2025 08:12, Yongxing Mou wrote:
> > > This series of patches introduces how to enable MST functionality on
> > > the qcs8300 platform. The qcs8300 platform uses dpu_8_4 hardware, which
> > > is the same as the sa8775p, but it only has one DPU. So it only has one
> > > DP0 controller, supporting 4-stream MST. This patch only enables
> > > 2-stream MST, using intf0 and intf3. The first and second patches are
> > > modifications to the correspond dt-bindings, third patch is the dp
> > > controller driver after not reuse sm8650, fourth patch is the qcs8300
> > > dts modification which add the clk support for stream 1.
> > > 
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > > This patch depends on following series:
> > > https://lore.kernel.org/all/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com/
> > > https://lore.kernel.org/all/20250114-dts_qcs8300-v3-0-d114cc5e4af9@quicinc.com/
> > > https://lore.kernel.org/all/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com
> > > https://lore.kernel.org/all/20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com/
> > 
> > Buggy patch cannot be the dependency. You need to fix the original patch
> > instead. You are not supposed to wait till knowingly incorrect patches
> > get merged so you can send a fix. You must respond to that patch
> > stopping its merging process.
> > 
> > Best regards,
> > Krzysztof
> Thanks for the reminder. I hadn't noticed that before. We will wait for our
> dependencies to be ready before sending the new patchset.

Hmm, no. Work with Abhinav and send the bindings (including all 4
stream clocks) and platform enablement. Then MST support can come up
together with the rest of MST patchset.

-- 
With best wishes
Dmitry
