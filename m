Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A724887F985
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF1A10F6DB;
	Tue, 19 Mar 2024 08:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gFogp8Rs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D1910F6DB
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:24:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEsxkSogIfwIEIK18xcgrkbc5Wj04LsXKRaXd5OK/DATIORU49J2KW3l4pSwUov8SGxSQUxdDyFWooR9sp9orNTNJ5DVIk+1CTp4bZveCdZxauocjMphuJMbQOIPuw/abPIqzvRfDITN266+Duka524GAcyL1MrwaWTKkSF9Cma98DKjbh13HR9kG6116ROi1zbcZOM62fsRqjCQnhzW6HLJqtA2UE9HV+Mw3qYBc9KI1YnAfnwKm1ZmM7ZJR3ZlzWVyc4Rd7mlDydcUY16B7PVX/9aCoNaQMKsQg393Tx78Lac/ClHuk5w6157v3aMHK+GAvajINfy6ikB2pvFR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+G4q+GMJRVzgD9j3hStCr+sXtsaL/Jc038ui+VHCe4A=;
 b=Ye+sV9yC87YRHzGvALL0CqCcwZU9BDL310eRkROH1hzsfFxe1GoiDnREbjqaK3bfsHOXg4HP/fta9R04HkyBm9HsLA1F/mnUTqBPUySTs8WY4e9d36lvnsb0ADL/wv29RG6uvEjPkUu256JmGWPOUc3Pz8ubeW6Uef2QKVPHDV9Gl9AzszIqCPSxukN/ZuUH0bSYIW+nc1xi3DEkqNfYqz8yCLMr57GWdMxpGYLwzr4BNg7MTgBoX7SCUFM7HgOeCJknhoEJLIHYpHtzlzLebu7EF67AwCQckxsvvmljAiMZZMfyoBURfP65ZCm+Y3FmuJYwG14S/vkXAzjzcpLq3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gondor.apana.org.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+G4q+GMJRVzgD9j3hStCr+sXtsaL/Jc038ui+VHCe4A=;
 b=gFogp8RsSY6SmVXmdZ8ih1XgUCMpPWs+9BaJVkLfQ4dXuiPg7Y8GetWBqMfIhgqKEe5008Hl5pVGaVHH9qqwOibh19JS06m5KFi+0IHq5+RE4955ye7IWcls1Y8jMmDzn6u/K7rU1Sj6WTF+wpf6ODAlYMPNAnH5TBWbe3nbdRhI7FaAhO+0awaEEW7iAjIPlOm0htQtc7OqZeJJ0JJRiGJn8bhAI2lvwVSUjHv+Ti+4JwtEhawehlP8yZXLqBnSZvA34BdIrZJD37EfuXxp6QCFzSC6GQsihXj94WTWMWV2Y6os61mIKda0ivrW1N2Bnudihv+CR1QKxgQa+pV1qQ==
Received: from MN2PR15CA0007.namprd15.prod.outlook.com (2603:10b6:208:1b4::20)
 by PH7PR12MB6444.namprd12.prod.outlook.com (2603:10b6:510:1f8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Tue, 19 Mar
 2024 08:24:03 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:1b4:cafe::96) by MN2PR15CA0007.outlook.office365.com
 (2603:10b6:208:1b4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Tue, 19 Mar 2024 08:24:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 08:24:02 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 19 Mar
 2024 01:23:48 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 19 Mar
 2024 01:23:48 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 19 Mar 2024 01:23:43 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <mperttunen@nvidia.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <linux-crypto@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <dri-devel@lists.freedesktop.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v6 0/5] Add Tegra Security Engine driver
Date: Tue, 19 Mar 2024 13:53:01 +0530
Message-ID: <20240319082306.34716-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|PH7PR12MB6444:EE_
X-MS-Office365-Filtering-Correlation-Id: ea96cc18-248e-4603-46da-08dc47edef04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Am0KCI76Q5le1jWAVKi2+4ojTfR+yBE7fLoB+gtMn6NZfhJo0KdivjRVaCPDakJ7twXBYpecmMgw/zigPhsRnANaFttRkXfgeAOMPKkV4By/36RPxbbkuBpFPcpo8NiNT71hvuBt56//nfaSVluut1jAXcteeG/EFbWDtXpVgPiZSyF7e8f5aluzDns75LI/r7dOBVZQaHi+TaViWU51yyvVV0rHUYWkg/qCnpbOegnwOPmZb2Kytypy819LpsrGPzO0s56Ey4LL2OapeRth4UQRr7e5Wy5ha7PbMXYlfwKlEU3mv3Vss/m7taC2Hi/nxFD/13lxo1c+vNUo2U06lhnDRFcLXQdzM4dnIKvOK1Oa4UIS5F50sXSJ+a8DcZ5mm1Ckbc50DfSqofKcgFPdrgNFjqM7dyFZ3BY7SwjAeBWUuXbY1ysskQxfLmoVaJ2TZ6Z05Hdms+Bk2EoDJQCyV4xze9PMNXWUYPfbQfPk2okcTuS6Cf75xulpEpGowhpZ8qnnGENU9c33Jmi5MFK2tZqC3s80g81xqqb5qRbcFsZzDssIRTrt05KN2q1Yu255N0C+pFBLr0Fy48mLYYfxGqSBUu6oxVD7WHPoW/5pszC3WTEkYXGpGVSbk8fxC27YaW6v3Gb2CQrWba7Q2D7rvV7DtKTMCe9LZBHsitGmNMzSWZGAgS57ZCVFB6txTjJvTYSPwULnNeNiMdrlcANOcKcnSU2NCXfzHkibgHysmj9BRlD4US4goCudPzicDnwYWUCHTEM6utwP0PxbepfE7Q==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(82310400014)(36860700004)(376005)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 08:24:02.0593 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea96cc18-248e-4603-46da-08dc47edef04
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6444
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

Add support for Tegra Security Engine which can accelerates various
crypto algorithms. The Engine has two separate instances within for
AES and HASH algorithms respectively.

The driver registers two crypto engines - one for AES and another for
HASH algorithms and these operate independently and both uses the host1x
bus. Additionally, it provides  hardware-assisted key protection for up to
15 symmetric keys which it can use for the cipher operations.

v5->v6:
* Move copy/pase of intermediate results in export()/import() to
  'update()' callback for CMAC as well.
* Check for rctx size when using fallback alg.
* Updated blocksizes to align with generic implementation
* Combined GCM and CCM init into aead_cra_init
* Updates to handle invalid cases better
* Reduce log levels for invalid cases to dev_dbg
v4->v5:
* Move copy/paste of intermediate results in export()/import() to
  'update()' callback
v3->v4:
* Remove unused header in bindings doc.
* Update commit message in host1x change.
* Fix test bot warning.
v2->v3:
* Update compatible in driver and device trees.
* Remove extra new lines and symbols in binding doc.
v1->v2:
* Update probe errors with 'dev_err_probe'.
* Clean up function prototypes and redundant prints.
* Remove readl/writel wrappers.
* Fix test bot warnings.

Akhil R (5):
  dt-bindings: crypto: Add Tegra Security Engine
  gpu: host1x: Add Tegra SE to SID table
  crypto: tegra: Add Tegra Security Engine driver
  arm64: defconfig: Enable Tegra Security Engine
  arm64: tegra: Add Tegra Security Engine DT nodes

 .../crypto/nvidia,tegra234-se-aes.yaml        |   52 +
 .../crypto/nvidia,tegra234-se-hash.yaml       |   52 +
 MAINTAINERS                                   |    5 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      |   16 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/crypto/Kconfig                        |    8 +
 drivers/crypto/Makefile                       |    1 +
 drivers/crypto/tegra/Makefile                 |    9 +
 drivers/crypto/tegra/tegra-se-aes.c           | 1960 +++++++++++++++++
 drivers/crypto/tegra/tegra-se-hash.c          | 1055 +++++++++
 drivers/crypto/tegra/tegra-se-key.c           |  156 ++
 drivers/crypto/tegra/tegra-se-main.c          |  439 ++++
 drivers/crypto/tegra/tegra-se.h               |  569 +++++
 drivers/gpu/host1x/dev.c                      |   24 +
 14 files changed, 4347 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/nvidia,tegra234-se-aes.yaml
 create mode 100644 Documentation/devicetree/bindings/crypto/nvidia,tegra234-se-hash.yaml
 create mode 100644 drivers/crypto/tegra/Makefile
 create mode 100644 drivers/crypto/tegra/tegra-se-aes.c
 create mode 100644 drivers/crypto/tegra/tegra-se-hash.c
 create mode 100644 drivers/crypto/tegra/tegra-se-key.c
 create mode 100644 drivers/crypto/tegra/tegra-se-main.c
 create mode 100644 drivers/crypto/tegra/tegra-se.h

-- 
2.43.2

