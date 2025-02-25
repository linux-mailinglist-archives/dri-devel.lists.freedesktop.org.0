Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07274A4479C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAFA10E778;
	Tue, 25 Feb 2025 17:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pTLQgqkU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C629010E778
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:14:54 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3091fecb637so47314651fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740503693; x=1741108493; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+dODZ+7MTPPBH6S67MBivWnFKuk0Orcv5ZDM65vBwrU=;
 b=pTLQgqkU2DQ5VlHKNgS+Cpmpo7yygf4jAo6Stlml10uLqhI9UTTsxKeeX5WiLB1GvU
 dZOCoWlorSS85nx5M2GnSH1xcy1QApbhm5arwP5/HPVRrAAnWNJS9x9scQFzSPVcVj//
 q8pnc5LVvIyt1g+d1wCpNrKkbbOFfsZewS4XmsOkouC3kdUkj5JsQBLn7A4TJBC/F5Bw
 WXTOvqVtp0ZR+E2usHr29h5BV3j4oozjKLvtnwPYvIuRL6r2e14Fs6c08iAysaf2YjEm
 V6OaAzxLmsvH1p1u4fpig/8ro2hsACnWLwpKWXL5dlsAFWjRNmb1i52XjBFgZ4RhIqXf
 iaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740503693; x=1741108493;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+dODZ+7MTPPBH6S67MBivWnFKuk0Orcv5ZDM65vBwrU=;
 b=CJ9K1a5cDgl886GK+3Li2OF0loXcpIV5NP0IZ39b12+nRJlm+IYENrja+C/UOSXDcF
 vZ0PLXLkDjezhRawgiloLPzcSXrpJ8soD+XVcx5FCMAemj3GMh6JdwT0nnqwBVSZltJj
 lKAO1ZRj17NVdPOJ9X3wgnGxgkwShryF3RmjsVmEREyMEPFTWyYwSludbMvREScRB0tD
 WZfeMjtZfgvEh+FFRhD5vnfrClE1RWiTVxQbNvz0tTsTt6om8q27rTBqlsu3zJ2WELfA
 hxdk/me/+6q4jHp2369ioSkSXm1kQKxjGggV93H9UcwbhTVrSLZUP41t5DI5dtkIqeWT
 vlNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTAaux3gaBT4EYOsFUcI95aWxhTsC4ShlL1mYWHvF6KQb2HCtLup7YOXuB4Flz3APmnRwA2JReQck=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkfFRKWBhXi6ehO7n1C1/gsGaQjbqw07oEQHq6w2GvcpAacQ/c
 YBbf6Rt2MPUcZ+UEofBtiBVRmtvGllC4+V3YeXysWyxRbWu1rd8ztReecbfknJ0=
X-Gm-Gg: ASbGncuFNMGCm8mBvrL/f14p41Ph92/JFRh4Rhxe/PR6Zz6tQf1xWQnNBiI3Z3ogczH
 rdg8aSu6y/RIjsG80j5jTFVw67Msn+q08Z1tt0fnO3x4pnl3hJKG3A51ZBdi+LudyTsoba8UJ22
 2BsC+ob+jTHPsayMMmdgoJrUQEMQYqK4HCcNwgOylpKNdlFsSIF/D33pl/4SfCw45R5B/94DxVt
 JBWlupzZu03uVtpRTxuRs1+85ExbrzDmSmyRdKqghYUXu6GMUe2zQKzF4N1Kry3gRqyRSNcbfxQ
 XBllJ9AHhiaMj0BWxXhOT3SadodxB9lByerlRSHIpr/EDJSQLvH9SztedlbNTIhcfnCVme9NwA0
 SrD8lcw==
X-Google-Smtp-Source: AGHT+IG2JNWtG5t9NbVNuoQ9NN6EnQTrfMLDjiH8gZ0sx1WPbonGS4f2ipr94i56nk1lp01l/rVSZw==
X-Received: by 2002:a05:6512:3d16:b0:545:62c:4b29 with SMTP id
 2adb3069b0e04-548510d2891mr1850229e87.22.1740503691782; 
 Tue, 25 Feb 2025 09:14:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514b237bsm233549e87.4.2025.02.25.09.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:14:51 -0800 (PST)
Date: Tue, 25 Feb 2025 19:14:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org, 
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com, 
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 04/11] drm/msm/dsi: add DSI PHY configuration on SA8775P
Message-ID: <jrlpgcg4f4p76muibh4hypdjag2fl7ex55bspxhkjya6dyqjin@gcsrrrtoggcg>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-5-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225121824.3869719-5-quic_amakhija@quicinc.com>
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

On Tue, Feb 25, 2025 at 05:48:17PM +0530, Ayushi Makhija wrote:
> The SA8775P SoC uses the 5nm (v4.2) DSI PHY driver with
> different enable regulator load.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 27 +++++++++++++++++++++++
>  3 files changed, 30 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
