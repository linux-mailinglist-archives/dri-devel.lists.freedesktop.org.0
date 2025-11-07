Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87400C40037
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 14:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44C810E090;
	Fri,  7 Nov 2025 13:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iFVQbAOa";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F4UhMoTO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3C410E090
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 13:03:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A7C3FDo557548
 for <dri-devel@lists.freedesktop.org>; Fri, 7 Nov 2025 13:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=lfUt+Pe8Vkcg5TILyH6ijn
 6N/BCnnj8nV9k1efvvmJc=; b=iFVQbAOaLGnngSi4qCLpu4a1Q4Dk1u1ETE6tO3
 WGjDSDTveSH5bQC64sD+MOji/EzasaBH8JQftSVYnmCrOHGFhmLsBrocf8HUHIPi
 /JD6yS9PPagvjxnnNtqPfCigErUfNxBNw2QZMj9Jak+AG/3InWzyPmo66Me0PI5E
 tpBYXVEtdvmU/XOt8ELqigtw6hLZsoCzFxolqNW/w9+hhB4z4S5C3yBt99rHVNgT
 6y8FgNCoxFYqrUKqTPNuB1YMtfHOR+k2xxiXxUob5W1q9xoo3kY25f2eayx3rmwm
 N8Est9/RvjAJm+T1b9TyAYxj5kfBNiMW28i6raeXbmsvbqhg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yr9u410-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 13:03:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-295592eb5dbso7719105ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 05:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762520589; x=1763125389;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lfUt+Pe8Vkcg5TILyH6ijn6N/BCnnj8nV9k1efvvmJc=;
 b=F4UhMoTOTkdAXXoaeV84E/iCRDVziAtOcdZOxQlc2FI0zS1poNct7zJNKHNP9PHDND
 1O6aR4VKErF98QXFnbVOJk3YulsC46cu3pi/+OMCbTwvEvDbvvwkDgiqRPneX4TymXOy
 aChv2NJMHJffwTH+mAYTCYPHzUlewAqPP3GjYcml+6Mew8zU0x/fL158/HzyEWm6Lt5W
 ujuOprrLthNDxyFp2iR3P57zURuxXRplBhiHPNWCQOZyB80ge2H1r6g2+iHpFw4RhfXZ
 LQ6AgpSU9qB7sAO/WuCXhBV7v/soC1BcznM25zesr06xmI18AL7ICXvu58JtlqrwdEiS
 MgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762520589; x=1763125389;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lfUt+Pe8Vkcg5TILyH6ijn6N/BCnnj8nV9k1efvvmJc=;
 b=qfG/RQo6LRyodnbOD8IRmWL5NeGueZea6uBtoYYQg57nn8T6RtHrI9akI90uCEOVAE
 9W04+XjUmYbl7gFKA/2U8GbOeMW6f4KsiXLBtT2gyvN5HW5QphvGxqifmODsqfm9lOJo
 Z4tFoMG2FQjAaat9lEGkKgkBRBW6Jk0ftTAXFy9Tt1B21A5o8Zzk786strAfuWAfajIa
 ice85ud27/3vyH0YXQ2sCE8UK0DuqS9NPum2pmO+OuqBZ+1BPSbJ07TQCjtz868A3cI/
 lTK7fgYa/GBuanpVEdwKngvffhrghYuYyNcJGqSeUU3/aNYblJhXUBJctFS1gPChaQ1y
 /9mQ==
X-Gm-Message-State: AOJu0YyF2820UX2kgtNwfzs8ssao1M+bZe57RGPOG+0qoCWDAWUVMhWy
 1Ph+wpgLLId4sSFvI7iNh9F61meen9n8+uUfbJpNNt0ker6BftDEhqgzD/A/JX1YDZfSx3pio47
 0rIJIp6ErZy4ASreotpdrbxAItyBPti4VNXK8nxCUt9yNQzzWp18uKwa86TDJM3mZXiYkyPd+oN
 WHXA==
X-Gm-Gg: ASbGnctg+6bgBVx/mHH9UtP+5guu811Sm/3giGAQnbK50vlzejc27H/pGAE06JVmO9m
 qMGLHSruN5uWBcUPFFShN6W9jrEoIQC8Svyh4gdx0ejoobE6Hm1F+Fyx6W2/8udfBfiqZ6ZZanE
 ZcBvpYj4i1apN0gOBpLxKLpQW+uOo61Jm62rGAZIWRhOeEW7A+/6tt6T+gnzV/RFc7lD5neB4BM
 lyfF7dToZlhlntyur3LpNlbNP/U647tj2xc1WeSsLCii+XfeBuCFbDV7dQWDK2ykvu5pbsn0ORi
 VCgBYkFf7uyhqQ6+rexB47Ewbjk6ifwDfIBv6dbaTcMoiPrn11loZL7+IIssWQjVPBork8IhDjN
 iDmiol1lPBP1YgX9HS4RR3DpH
X-Received: by 2002:a17:903:1111:b0:295:4d97:8503 with SMTP id
 d9443c01a7336-297c0464908mr45728655ad.30.1762520589211; 
 Fri, 07 Nov 2025 05:03:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeHnWcEh2L1n7jfwYkgaWNZ9WVU4d8qKMKl6aIl3glpe3CfGHxreyqN5fPQUGfR/kDgnPPIw==
X-Received: by 2002:a17:903:1111:b0:295:4d97:8503 with SMTP id
 d9443c01a7336-297c0464908mr45727775ad.30.1762520588466; 
 Fri, 07 Nov 2025 05:03:08 -0800 (PST)
Received: from hu-nlaad-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-296509680e5sm62477745ad.1.2025.11.07.05.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 05:03:07 -0800 (PST)
From: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Subject: [PATCH v2 0/2] This series adds LT9211c bridge driver support.
Date: Fri, 07 Nov 2025 18:32:57 +0530
Message-Id: <20251107-add-lt9211c-bridge-v2-0-b0616e23407c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAHuDWkC/32NTQ6CMBCFr0Jm7ZBOgSiuvIdhUfojkwDFFhsN4
 e5WDuDmJd/L+9kg2sA2wrXYINjEkf2cQZ4K0IOaHxbZZAYpZCNaEqiMwXFtJZHGPrDJiUZJcro
 nfREV5OISrOP3MXrvMg8cVx8+x0ein/t3LhES1k5W51o4S4JuPsby+VKj9tNUZoFu3/cv2We/6
 rsAAAA=
X-Change-ID: 20250910-add-lt9211c-bridge-5a21fcb1c803
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
 venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 Yi Zhang <zhanyi@qti.qualcomm.com>,
 Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762520582; l=1293;
 i=nilesh.laad@oss.qualcomm.com; s=20250718; h=from:subject:message-id;
 bh=3o6/h7lfm0wNOd4QIU3s+OjsyRjrNHPqDmP6ixdcEM4=;
 b=kZHsSBXd6SQsvPCO/QQLrItK5cFUkDdGBuKgmtLJTb7VA4fPrSSp7u/q0iRYBSRuKGG1Oht1l
 Okx3+359Y9ECUA6V/8mERpMXOSGlmOskpfQrpfT9NBOz1SCLgJFYDo6
X-Developer-Key: i=nilesh.laad@oss.qualcomm.com; a=ed25519;
 pk=MjLHvGipC16awutyYh0FnLpT1nPxL/Cs1dCevHMrrD4=
X-Authority-Analysis: v=2.4 cv=DrpbOW/+ c=1 sm=1 tr=0 ts=690dee0e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wg4gmtxcXx2xPSsGLWoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 1FqKsmrTT8ASiZJ5Qcilkxm6-7-vyLeb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDEwNiBTYWx0ZWRfX0WDTPvk4SD6y
 hV3pljEGn2hGgtzb572/XmUcHszAcSQ4fdbdwlRxdyVN+EOASktcOYkgU4mW5/WrHBHMAwHHlFz
 gKXrIkLdbZbdWfLYi1XSJjKRNZIDWrgom6uO2dnz4v4E6Bdp1pEKCEQbOR/ImWVr3O/1O03kB9o
 IYPqnQenWDVnYd9XOzPMVhAL/IgL9ExEDVtW7pVuysAbwEWTvLnxSq8/MLwdMJ0pt3IeEdntn4r
 uxZReY8vouQw9xC5iCXRS3UljquXBL4J5ddzLTJz7OTf6suI9ZxXSCWoUSB0QYg20H8SFUGlnGO
 59EtTBQkTYXmQmdS+A+6FXsVmRpn0hl9m6qyxB6YwNBz1gxRHVmQt3ghhLBaHYD/GpL/FJsBUrw
 CZlHaUUaofPaFVLJrTFjjeKl4lPpOA==
X-Proofpoint-GUID: 1FqKsmrTT8ASiZJ5Qcilkxm6-7-vyLeb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070106
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

LT9211c is a Single/Dual-Link DSI/LVDS or Single DPI input to
Single-link/Dual-Link DSI/LVDS or Single DPI output bridge chip.
This adds support for DSI to LVDS bridge configuration. Exisitng
lt9211 programming sequence is completely different from lt9211c
hence adding as a seperate driver.

Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
---
Changes in v2:
- Combined driver patch from https://lore.kernel.org/lkml/20250911-lt9211c-bridge-support-v1-1-c221202cbcd5@oss.qualcomm.com/ 
- Added MODULE_AUTHOR
- Uppercase to lowercase for hex values
- Link to v1: https://lore.kernel.org/r/20250910-add-lt9211c-bridge-v1-1-4f23740fe101@oss.qualcomm.com

---
Yi Zhang (2):
      dt-bindings: bridge: lt9211c: Add bindings
      drm/bridge: add support for lontium lt9211c bridge

 .../bindings/display/bridge/lontium,lt9211c.yaml   |  113 ++
 drivers/gpu/drm/bridge/Kconfig                     |   13 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/lontium-lt9211c.c           | 1106 ++++++++++++++++++++
 4 files changed, 1233 insertions(+)
---
base-commit: f50b969bafafb2810a07f376387350c4c0d72a21
change-id: 20250910-add-lt9211c-bridge-5a21fcb1c803

Best regards,
--  
Nilesh Laad <nilesh.laad@oss.qualcomm.com>

