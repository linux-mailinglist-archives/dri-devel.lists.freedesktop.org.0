Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B1DB49BE9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 23:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A4210E5E5;
	Mon,  8 Sep 2025 21:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8yC9GTP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB9A10E5E5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 21:28:51 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588Ht6aO029084
 for <dri-devel@lists.freedesktop.org>; Mon, 8 Sep 2025 21:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ScGHARm0oECuOzEJcN01KKnFkQXnrnAhZVDiz2pnvYA=; b=g8yC9GTPjmhJQMGT
 uUOy5evnTxnRCeX/AW3qA+wqtjLA3UcDTti6WGQhYyYVP3SjtYwOjdbw/jNwvRc8
 z4J4KyuCwIf+ecjX4/jgHzZ8rq6hQi58KAhCGOACxwphsb9IpPX5J/ZG2QUGcwyZ
 ejnw2RjRXmK5PKolDX7IPGKCx8+vip63cL1N6NVPi7Wceh10oGuFGWOptdX0NYmZ
 lq3CXecrNQqcfhnrT3Dzoo5Stzy9IYRxSzbF4ZMR6tYANZ3q800QqFUX9KL+9YvG
 pjiEl1FXmL8v5UG3vosFRGGazLaW+0Vx/vF7/iyW50dUTE9QyM2BJ6VeeozwF/kP
 ZKTqNg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8x35q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 21:28:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-720408622c3so103187836d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 14:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757366930; x=1757971730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ScGHARm0oECuOzEJcN01KKnFkQXnrnAhZVDiz2pnvYA=;
 b=lSBv4pha6TuDAyktLX8hdtwX7UUr2BDgsSMqQNvLUEaxI6fxWbFMP8+onXeuCHcaca
 X3gHAIWj9AD9dFqCCvH1RuMg8PVjDkQg+q0RjX0Xl74qV2+M9uT5eURiI5POv81H7LcC
 zBoFcYpdl4nq99J0fqO64v2XYIKAAUJXGu1dT+xbsi6/9MMJu3g17/hOF9S8swbacuqu
 fQEgvvE9fZWYXVOqfDikKRdc9GZVSSc/kVXMzumEg2yWSwqtVWz3d4Cbo+RK/mzbPpbF
 mJw/ZsDU2WDBq4Q7mAoCJAxSqjVDBsmopOPPrlh75E3yYrez7XTfidUcLcpNVtJG/+Ve
 /23A==
X-Gm-Message-State: AOJu0YyOCw/VSvZi93QrLSkIF+BMl7jOfNiDlMaw22crVXeXTADcl1DJ
 bveo7WLlJorK0xHkkrRBIiqSYR8pdT1oN+qZxfrwk+yGv2IizQyiF7ndUI9QMevdnZWvx9aL5Kk
 CPsL9SYz1R3DRmYjhU8WA994OVEuZI9bNVfgtQXRl6md4jv0wH6fnNeOCmDzKJ2vZYfP43mk=
X-Gm-Gg: ASbGncsKh2yL6+5UjXoGyEBhsgtvctfoKUU/O3X8X8GzSZTGrlP7QcVavO4ICpVFlW6
 B2MgNHBIwDvpaXWoscnzci9FN4uypI8eoVT70bgnPWUoVdNsER5UAOUkTuNuLHsAWA6eDrn1Bxn
 gN/8aWcih4oNjB5j8b2+t0TsxU09KzdX+XAf6VySgmicc76Lc1gju9hEXJdX8flGLSMTvvnwOFX
 2fdjhhQvIoJ3esqHBZYSK8UCQtVV5cJIjW3MMoZgO8/hf1JeA/201DMAc0BVc+WPd8SAJvbHdTG
 bO1yX6TWvS4xb5WrVssC8MJbfUNEE0EXItM9fusfIrUq/dt1LCV/TqO38GDp4rkE4gMCT++XfwW
 WnyaTOtPVB7oKpuILgMAH4xWCwpVRy/eHGgS2exEPIGzPrHU352LX
X-Received: by 2002:a05:6214:496:b0:70d:fec6:494a with SMTP id
 6a1803df08f44-739258aab01mr109442016d6.17.1757366929575; 
 Mon, 08 Sep 2025 14:28:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFvWg9eRYub8/7m0Za7JpIIl4RD41FM6MBXJkA7gLyefolZO08FSmz7yplGf9/6bML7UCQDw==
X-Received: by 2002:a05:6214:496:b0:70d:fec6:494a with SMTP id
 6a1803df08f44-739258aab01mr109441656d6.17.1757366929103; 
 Mon, 08 Sep 2025 14:28:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5681795d445sm31486e87.71.2025.09.08.14.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 14:28:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v3 0/5] arm64: qcom:
 x1e78100-lenovo-thinkpad-t14s: add support for HDMI output
Date: Tue,  9 Sep 2025 00:28:46 +0300
Message-ID: <175736691957.998930.6661595469735181143.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68bf4a92 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=mli57nIQh2RWQkMICy8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: SJMcf6YDcU-cTvYo2NfRMyjfmRtXbDRJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXwcto+C1MGbvp
 YenrVgNsRLdoYQXjLrmd6aOvYWT7kJl3R48QaINiC4/5PUlBVMVGPmwaz2f82eGXk5DgMuR6FSu
 f48b6+7ekBzzFoVdYkuUxBWaHUiCMUYBvw35PQQTVAYF+cbhrdnICWHfUCvpIUZ0Wv6P9qspVCX
 AuC4LJEB9XmhlsoXht+0rrzGGfQjDQguUaQXuSqIRfPJnCTTA2d5glG9jr7IyGz2y1r4QBNnN5L
 ATmACUz068lIV4NE/pIe6BLxYaS2CIxxGCP/k3XsypunyGBOeRXVr36jK8BTp1WYyhGmYzUO04a
 +HiNFqQa/OtFgr+ouMlfMGFiPgSlezmnWvgVRVbjtnldNEgyOOqHE5MG00gfKzBxR4X4Dav+kzw
 5bm18ORz
X-Proofpoint-ORIG-GUID: SJMcf6YDcU-cTvYo2NfRMyjfmRtXbDRJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On Mon, 08 Sep 2025 15:04:17 +0200, Neil Armstrong wrote:
> The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
> connected to the third QMP Combo PHY 4 lanes.
> 
> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
> of a combo glue to route either lanes to the 4 shared physical lanes.
> 
> The routing of the lanes can be:
> - 2 DP + 2 USB3
> - 4 DP
> - 2 USB3
> 
> [...]

Applied to drm-misc-next, thanks!

[1/5] dt-bindings: display: bridge: simple: document the Realtek RTD2171 DP-to-HDMI bridge
      commit: 2c4f536c75217476baabbd557a44e8d4c3a2a23a
[2/5] drm/bridge: simple: add Realtek RTD2171 DP-to-HDMI bridge
      commit: 7156602d56e5ad689ae11e03680ab6326238b5e3

Best regards,
-- 
With best wishes
Dmitry

