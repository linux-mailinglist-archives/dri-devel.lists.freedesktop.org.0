Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EE3A3BEF1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 13:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C9C10E7E0;
	Wed, 19 Feb 2025 12:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GCrLyumS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6051110E7E1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 12:56:14 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54605bfcc72so1009093e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 04:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739969773; x=1740574573; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jpdeNF19DgfEm3H7/Uvp6T3atcP8vyt6RGMBKgTt3ic=;
 b=GCrLyumSXDRhPnete/yMEsa0KxhcC+TQb3iE9Z+Y81afzBzj9CjWJNuzPclqlBCVh/
 XszUoNFtSZhUkdPJnf9V7iD9OItsALp7HlfkRlTgpQNjff8AiISpZ/NYXkp0byLtyikK
 lYg7lJdECnujL2PVE/JLBxJyUawHxOFdK49o6MDUgenwXDQbWsUmbZXGbtQeSJe0D3gL
 8dWNBV3lGPf/xQYJoxRxghpKF5LD3jxL3rGIXo0IVih74o/7D3bJTGRW+Au5FyAo7P75
 5Z/ZsI2lIycGzCH3zZ5+Q/O/xaCgs1A0VgTYb+ywYoM0ka9b53PzOn4/jOXLZUcexAjX
 Z+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739969773; x=1740574573;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jpdeNF19DgfEm3H7/Uvp6T3atcP8vyt6RGMBKgTt3ic=;
 b=GzoTGyeZq8b/a6qizez1H3n90irSNpaZL9uTlvzAmzl1SzgwHZoiPV8Vk585niMLsg
 itfrsKJPqzFt0QhY/KmfznJxW56UOfgIWW7Z0w85Vy63uls1jDQsPDX/MggveZT4yiKR
 03BGPFVMtv6IcLy5Z3jXN3rOic7jA2LSdIwjW3RNUCpcagq/dFm2uOHagj3yeX+o9/cv
 /16tnAj0bye306CZIwp0RHPb91pqb/E7BqGmCs6SXKRGPt4tOcMlidMQLiPNjaI8B0zd
 V3dRfVyhDnDyX6bQ3Hn8qZU9un4ZV98+cLQtuh8mCicJOUQT7LSlhvhdnc+Y7tAtntZh
 Utbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo3s477A7YQbG7ThiyxUKWfMf3115Su6CZjMYkxEWx86uZgveGTHBMqCQlXwWMs5QSZDiDSts3TeA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOaezPb/+ugITCzhvmHwp+bagPQ9BEk1+UMpBUJrrXrbNOW+VD
 xYq22Al3FguYVRcgf8ACtdoiUuJIaZkP6ilj9/Pts1pTAYdKdqlsGvbEEGG7CkJrGpxzpGU9cY4
 A
X-Gm-Gg: ASbGnctbkZdNj4AgL8sAK9Sq+gQ5LKeK3XNrvD8ywpjANS8Emd4ryII+Y5jeXoWx9J+
 73hOUMGJr9HHNsSFEODJ9GFMIng1Aj330xpvwVhdARDYyRMH9/6++fKejPK6q7SIr/3eQz+ixC+
 u9D8Y2u/eIM7C+a2+Pr4gDCitYZaieFIQV55CYsW+NvQx93NLQvFWZPTvIKsQOgR4PXk2Ed/c2X
 y6yc5yJabWcPYOlGm6itzSrooXnmKNfphgxAXQyiAE8XPrLbaRdfqyQBbj+C39xjytv38sGWJsh
 zPdWXTJMMT/sP5ujLHYqzgdsDpazSipU/whBs0YevLsrJZ+Nj5Pkf/8sL06bTn2+ou4VdbQ=
X-Google-Smtp-Source: AGHT+IH0YmAtnjvMy5+btGUvGsvhy9fusmwBi9HtyhuX25OtuhvvQajrAtK6BmKWaYMSFy6bf3k0Sg==
X-Received: by 2002:a05:6512:3b23:b0:545:550:83e6 with SMTP id
 2adb3069b0e04-5462eaa1f1amr1151645e87.5.1739969772537; 
 Wed, 19 Feb 2025 04:56:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5462c60f99fsm421664e87.118.2025.02.19.04.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 04:56:11 -0800 (PST)
Date: Wed, 19 Feb 2025 14:56:09 +0200
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
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Redocument the
 dp-controller for QCS8300
Message-ID: <yjt6wwzrufigpuotsspoolnnonkueyb6evk3gtrtb6zpceuinu@em3ry7pufabw>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212-mst_qcs8300-v1-1-38a8aa08394b@quicinc.com>
 <wyd7i47pkafa7n2yjohuvlh4btasxle4rw5xm55h4bhv24yvah@pfo224xz4xfl>
 <b4008932-ce56-4cc0-9b53-2253051514da@kernel.org>
 <CAA8EJpoowyKcwDQgbWy4xGHzngNQOcWt_z_Xc49GFB1qYjYO6A@mail.gmail.com>
 <0171746e-1d3c-42e5-9cde-7dcf2708ffc3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0171746e-1d3c-42e5-9cde-7dcf2708ffc3@quicinc.com>
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

On Wed, Feb 19, 2025 at 05:56:14PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/2/12 20:26, Dmitry Baryshkov wrote:
> > On Wed, 12 Feb 2025 at 12:54, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > 
> > > On 12/02/2025 11:41, Dmitry Baryshkov wrote:
> > > > On Wed, Feb 12, 2025 at 03:12:24PM +0800, Yongxing Mou wrote:
> > > > > We need to enable mst for qcs8300, dp0 controller will support 2 streams
> > > > > output. So not reuse sm8650 dp controller driver and will add a new driver
> > > > > patch for qcs8300 mst feature. Modify the corresponding dt-bingding file
> > > > > to compatible with the qcs8300-dp.
> > > > 
> > > > NAK for a different reason: QCS8300 is still compatible with SM8650.
> > > > Enable features instead of randomly reshuffle compats. In this case,
> > > > enable MST for both architectures.
> > > > 
> > > So the original patch was probably correct...
> > 
> > I have no idea. I'd let Yongxing Mou to comment on this. It would be
> > nice  instead of getting a lengthy explanation of obvious items to get
> > an answer to an actual question: is QCS8300 compatible with SM8650 or
> > not. In other words whether they can support the same number of MST
> > streams on each controller or not.
> > 
> Hi, in hardware, the SM8650's DP controller supports 2 INTFs, while the
> QCS8300's DP0 controller supports 4 INTFs.In sst mode, only one INTF will be
> used, they are same, but for MST, sm8650 supports 2 streams while qcs8300
> support 4 streams. Thanks.

So, they are not compatible. Please use separate compatible.

-- 
With best wishes
Dmitry
