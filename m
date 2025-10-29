Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB79C178CD
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 01:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCE410E6C3;
	Wed, 29 Oct 2025 00:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CEkOydok";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gY/bIeIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF8F10E6C5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 00:30:51 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlmPA2524165
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 00:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /WIa6RkBloD5ztrGJJT0zLrD3gSyVrhoMmTumwjlzqg=; b=CEkOydok2jsuebK7
 kpCmaL52MeJ5wtd83KVpZ93pw6a8ivyGoAe4/IN62UwP8/CC0AvwFH31OWtXDb3R
 HntjABQQEzPVs6jIDdUi920cdXtHZUjmZ7vpD2t13AiUCb1tYkuM8++zHyqQyGz4
 VAWTqoL0HUBHbmw8jKPBQ0FhxLILRGO5YDR4dYOTSOHFpz+ib9IeEZk89HCjfty3
 zWOn28mMtKlB9l81pecqJPZpEsvpZTmrVxMVhZ5ywNeBqm/26CEHiwhbznmlnCJk
 6MO6Yb6K3aTwRV6ALQRiPldh5+gyok1mObEd2sD00Jw/z0WUPq+/L1XDlYcMDXwa
 O8EZxg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1rn4g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 00:30:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-87c1f435b6bso76099016d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761697850; x=1762302650;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WIa6RkBloD5ztrGJJT0zLrD3gSyVrhoMmTumwjlzqg=;
 b=gY/bIeImtPaMzQwAgY1gq7yezcSUHj4HPuYeLBiNm01VlM6jQ40NKHlz885hQXBZQZ
 z9BIKQ333jY/xFptycDaluoSbUgF89AaddS1rHbWbnSZljmfPHg2T44Au/yf8MM60Gxl
 lqmuLvMCvngCefw+DimwaX2iI86sYKiYApqRWvCv7nuJTkvTg+is6MXP8YzXBI4Fng5K
 afuVoF/cU2Tu2eNyW7+Qe0OlFeT+chdbQoqmzGqhNbc8Y8D35Xsn2KXMDjD2X2ItM8lM
 MJHMcdhHx8bnYMHOtgmMXGa3pzcDEdZVVECtFX8XbA8953l6x6o6Nfe3wwkkArbwP2Tu
 vdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761697850; x=1762302650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/WIa6RkBloD5ztrGJJT0zLrD3gSyVrhoMmTumwjlzqg=;
 b=tb4/IuGy50K+ygnQlU+8ublwnQsZRIQz8+yavv2epXdZGaghRh1Mqr3zaBZmDLy6mX
 C8Up++83P9Y/XbE0hseohd3EOsTYaRa33eH55uZMI9s82L6EMemg02ee7clW6s6AtfGC
 WAOP5O/hyiBAuAYLli2Nxjk0pbmKd+vCBLneboEpwte4aoIujbOh45SP04pGustFZRg8
 dGaRGtcngHDIk1KNpX/yFQBGyIBD368OT1qZELR7xwmXFUVhCXe9T/JHQcjeakihhwql
 3Rn7Srh+6nDOdUeOhCAX3i6aOZ99QBtyfwXZXeufcvbBT4HjTpZF6VYXPhhtV7UwoeIM
 LL1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtZk4QgUdpP70x0UQifwwJ522a3RuS3C4yIBYYVydkkHC2WZoe3w1AmfE8UVOOY57qRaO9uYe8+ys=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYCY1XooVYSzTH7rN7VLYZh3xqCiFzERfmJ4akvtrth9HG5SUR
 287scLcl79ZHpg0hlYMFPT7536Pu1HI4k716BBDSU90NBary5/PUFNG68zK7WMfLUCPsXJ/lJig
 2fF5bzqRhenYqRG2SYbeAfamUJSpTiTLIcE4hIHeqODfEr2Slk1Vwk6J9Usf8EGypJvcS57A=
X-Gm-Gg: ASbGncszTlvivGqJBNlol1d4x3SgNiMN40AkmRjitp0s3ole2ZuWJetIDg75SygAWeP
 phbO8d0r3CzD0QxRXIzseIMHgZp6nmR6W59ZnglbCrACdBnBdOMgPZBi2fefxS1hOmdtG3bh2dh
 D/gzGGZxYJJBstWQqAs7N5mSSJyra4gzLLgPNVY4igKVYmp1AapETybo1wFpJWRDpFVrj23E/vE
 RNM9HwqKgZvA4dQtGY+Q97uQd5Z9t+o2g6K9nZbEMyh4xIm4Lqca09p0I/MycVRsd8PassxG71b
 uIFGSTV5H5n2ZJ/PQBD9qoSK3RqEiPB1l23rSzh9MYF+igZzgOmH7h7W367BHbwQl+mvG/+OKUW
 1TJyV3PDD2f8P6eWWaY9OmRrJx7XeUhxJF760QyFWITyyT7SAochd0+xZXGZ5VoP4E+AWssDEty
 uOhHn42ZJl0JW/
X-Received: by 2002:a05:6214:d62:b0:87c:2805:9fa0 with SMTP id
 6a1803df08f44-88009c38648mr13964926d6.65.1761697849649; 
 Tue, 28 Oct 2025 17:30:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSnLbnquq7Efq2KCwiEYWEnFhYg3Vhkyj2eKpcDAg1Bjm2R9tCzuRidVUDhLFOw6pKZFqx3w==
X-Received: by 2002:a05:6214:d62:b0:87c:2805:9fa0 with SMTP id
 6a1803df08f44-88009c38648mr13964546d6.65.1761697849177; 
 Tue, 28 Oct 2025 17:30:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee092042sm32141621fa.6.2025.10.28.17.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 17:30:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: dsi: fix PLL init in bonded mode
Date: Wed, 29 Oct 2025 02:30:42 +0200
Message-ID: <176169780826.3761968.3488141100025074954.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
References: <20251027-topic-sm8x50-fix-dsi-bonded-v1-1-a477cd3f907d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bemLeLR-rNsRS8hoVgy-HwUoc5VN_-Kv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAwMSBTYWx0ZWRfX4XFDrGIF5iGv
 JGEGcsb9XHwh2Y4c4cZa+i+CTD1D0DjBywfFEU/9lvln9EN4oJ/LHOrRh4uUrQ47ADiy9S5pTR/
 MzHNpoOB/T+vzMmOXzLQOFVGBlbuwA6pZQ8+PIwuGWk/WwINhylNyOUAflpfw0B7cUmoG9Oa3LB
 BZGnzLYE4HWoHeko0ihlg7V1P1ydBlvp8SZIW/vWmi9IwO3nVT2f4PakT07Y6erHFdAaDuFxT2f
 KHuYVbUZf1iIhVyQoJmo9ftEDoqgQ/J0rgPaVDUzbE/aXkwyuqkLh0XAWwPvOYdpIIxJk2Q6P7g
 EIh6vAp0PPpg93XCRNRYnBUWyVBadfcy2mIUJVFk869BvMCkgx5eJ1tJbW2anM3JMardhdK0i2q
 VLvSXcF7ShNjCYt/k5ShEWJJXzzeRQ==
X-Proofpoint-ORIG-GUID: bemLeLR-rNsRS8hoVgy-HwUoc5VN_-Kv
X-Authority-Analysis: v=2.4 cv=UObQ3Sfy c=1 sm=1 tr=0 ts=6901603a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=8BgOjkq8Mluc09TWGxQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_09,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290001
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


On Mon, 27 Oct 2025 14:09:48 +0100, Neil Armstrong wrote:
> When in bonded DSI mode, only one PLL in one DSI PHY is used for both
> DSI PHYs, meaning that parents of the secondary DSI PHY will use the
> primary DSI PHY PLL as parent.
> 
> In this case the primary DSI PHY PLL will be set even if the primary
> DSI PHY is not yet enabled. The DSI PHY code has support for this
> particular use-case and will handle the fact the PLL was already
> set when initializing the primary DSI PHY.
> 
> [...]

Applied, thanks!

[1/1] drm/msm: dsi: fix PLL init in bonded mode
      https://gitlab.freedesktop.org/lumag/msm/-/commit/93c97bc8d85d

Best regards,
-- 
With best wishes
Dmitry

