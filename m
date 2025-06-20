Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D717CAE24D4
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 00:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E88910E245;
	Fri, 20 Jun 2025 22:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HuK1sNDZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5662310E23F;
 Fri, 20 Jun 2025 22:06:20 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ad89ee255easo435186166b.3; 
 Fri, 20 Jun 2025 15:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750457179; x=1751061979; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/nZ5vLwAzsNnnPm1vpVhd40+MzAtASMHps3Kb30tzxE=;
 b=HuK1sNDZa3TLtNbzvDIDEWQiE6olqzoyJmMmnLCbGkVJtbWKDe7dLRctHZ7hHGJ4Vo
 r2ipGlLDK6RKsvgzmp/z9rskh4tWb3dxBICmiz3JPoqLdvYv71pRPPdOXh68yjRxmQFF
 F+tRftqUtpROUWjvfyP1gyefPbuV2N0aqhAMwbRddKCEEQ/z3pRYa1HHWUKzGOiF3V+4
 H16XiyhryreCEMIeVRquF9risXPkcxWCspMpPKhUqn1gnXbnYW7ehY5Ojlg301L2wukO
 fyiVdQJo8snOPDlFpsfQUuSNH781HXpF81XYnjrTpnXmLWhfX9Qr8pXLa1DFh/LsRwq5
 p70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750457179; x=1751061979;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/nZ5vLwAzsNnnPm1vpVhd40+MzAtASMHps3Kb30tzxE=;
 b=FTOXVUIzUS0bRI6pLCbge4W/XN3F8nMKY1Ep4QFNyzgwl+/85+Y4UxPMu7Bx3FWJab
 d+Xl7LuCEEpDkd/LTtOdxUpmIl1A+9rhyOF/rLGRdB/rCsco/hqVMl1uXGBvaltG335I
 J/bdnRKXupxyTiRUxrcx7LWjAg+SmUQgigUMCuraeGFXlo3uNInV2juiwhxrP1wmCzWW
 FioyYHuqpsW1BlR+L9cOLCLofF9xoQIhg2uYaLj3zTobh5n7bJpm4+8jDzxj23E9q+Yy
 FHoppNRiHjS2YRNaS9SCoLLDStLAGEm6CVaz8SRjFVkBZpNxuFZmYgttM3OP+TGvW6Hv
 3/0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfuuKc7YMXXldpO0ZOj3Co60LaTWlRRG/7f5ikfa4pxuhAVvdy5XxsxoCM0WQKroL5cm1v/PUvIDo=@lists.freedesktop.org,
 AJvYcCW8Tt2kGwvObXdS3VvoalNQetUOW2jNZkE3epex+J8V1iVbNY0IVifDBLFDBsBlcEITUL+iDTn7KT6n@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSrhlj2Nx2YHBHcqwqkHY0DfegIee2gGieWijDqEwbTob0tZpP
 oCWZoetBk5cX3dt/8Me7KERwmDsJsKN1vTSEWvByU0swp2EW1cSLc7Y=
X-Gm-Gg: ASbGnctgPzsWv9fNsCb1I9xoXCSXjkEDdOBvEqgMX7Ny+q7IXE/A94yD7lq6EUnd5EJ
 kyCZTJQP3W3bBoi1O0ifJDHfRKpHbKEa/+DN5GMayRligvithowbdz20hRRLJCQpgEPbHaxvtnb
 fPPEo4F96dtLczF762RsWDK+rGrRBq5hciDYX0Ij8eGxfKjo0X0S8gsvAAmm6m4H0u9tMm6lTTP
 IdyrqppLG6ZdKqbnmumKnF4tyloi+o638WZZgrM65vPWZLGIUxH3anpnH0yhpjwJaLIeT+EDnS8
 ihbUcVJO+208406UETthDWZXwZcX+IIQneTj5fMrh1HtO3WGVX9e9gGwX+jcZ9ArOWFCkfNOoA=
 =
X-Google-Smtp-Source: AGHT+IEYDHPLPS/aiLsylQmdV4aS29FcdoVYkARHkjeD3JC5HuUi2/GalehZw8KEnx2WXwNuzXZgDw==
X-Received: by 2002:a17:907:1ca8:b0:ade:35fc:1a73 with SMTP id
 a640c23a62f3a-ae057f9e1b6mr483910966b.55.1750457178076; 
 Fri, 20 Jun 2025 15:06:18 -0700 (PDT)
Received: from [192.168.20.26] ([84.226.118.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae054083406sm227701466b.75.2025.06.20.15.06.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jun 2025 15:06:17 -0700 (PDT)
Message-ID: <970c41dc-e89b-4963-abbe-398dc3d53110@gmail.com>
Date: Sat, 21 Jun 2025 00:06:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Support for Adreno X1-45 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
Content-Language: en-US
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
In-Reply-To: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 6/20/25 08:54, Akhil P Oommen wrote:
> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
> version). X1-45 is a smaller version of X1-85 with lower core count and
> smaller memories. From UMD perspective, this is similar to "FD735"
> present in Mesa.
>
> Tested Glmark & Vkmark on Debian Gnome desktop.
>
> I think Bjorn can pick the DT patch and Rob Clark can pick up the rest.
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Hi,

Thanks for the long awaited series!
Works on Asus Zenbook A14 UX3407QA (x1-26-100), tested on Ubuntu 24.10 
with Gnome 47 on Wayland.

Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com> # x1-26-100

Regards,
Alex

> ---
> Changes in v3:
> - Rebased on v6.16-rc1
> - Fixed speedbin table in drm/msm
> - Corrected the regex for the adreno opp node (Krzysztof)
> - Replace underscore with hypen in DT node names (Krzysztof)
> - Link to v2: https://lore.kernel.org/r/20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com
>
> Changes in v2:
> - Skip 'delete-property' wherever it is unnecessary (Dmitry)
> - Reorder dt nodes alphabetically (Konrad)
> - A new patch#1 to fix the dtbs_check error
> - Link to v1: https://lore.kernel.org/r/20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com
>
> ---
> Akhil P Oommen (4):
>        dt-bindings: opp: adreno: Update regex of OPP entry
>        arm64: defconfig: Enable X1P42100 GPUCC driver
>        drm/msm/adreno: Add Adreno X1-45 support
>        arm64: dts: qcom: Add GPU support to X1P42100 SoC
>
>   .../bindings/opp/opp-v2-qcom-adreno.yaml           |   2 +-
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   7 ++
>   arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   4 +
>   arch/arm64/boot/dts/qcom/x1p42100.dtsi             | 120 ++++++++++++++++++++-
>   arch/arm64/configs/defconfig                       |   1 +
>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  39 +++++++
>   6 files changed, 170 insertions(+), 3 deletions(-)
> ---
> base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
> change-id: 20250603-x1p-adreno-219da2fd4ca4
>
> Best regards,
