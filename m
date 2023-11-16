Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CFA7EDEE9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:53:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1578A10E5BE;
	Thu, 16 Nov 2023 10:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189BC10E5C0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:53:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YC6wz3D5Czm5UJGUCa4FuwqJn9G5DpONEXlYssMc/hxmk3alkZmrLe+GT7aguewAmO3/HB8E+aWYgwYMxbTdvnpMVz8z39w70nlqiSkK8Y7mdhc83/5N5/b/wsz92HDXSdGR+xSQZeBZt7nt1KiujBH/V31b60XmCPjIgoXB/WJA1uawiFvBcxiZASeCQrn16IgXGX4L9nYhrGRcKvQhosv02Jz27TPp8C9ZHXKrdj84ovtbrsrNfWS4D79iUk3bNwfzwqhYqMDB7xPXi+hkR3kTQSl3dLl6kc5h4zdPB3swSjgxjplOA/mppFSeXAu/XM2Z/b4+0db4LPh9m+LvsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXFm1JVcKK2Sm2WULWvxrSdeaYJ06T+WVyWjZQZfxjw=;
 b=eBFRpkTxbgNhJV0vrvqxq3nylNcyT4JOM0tzbTINT3aZbqU1JqsmdQ5ThWzWvny6NkisnDN8msYny89wOitB4cFPzDHHdGiSo9OAiKW9epiIzGH65coxdp5AHNJOrn9Ckx9Cyxbx0gIS0fM4dAsKcsrZ+hMsSS62PtjOMjkvtyZDnRChAVtMM0wDBTCj29xu5z01M0g3TSthZz2U0vTCeee448d/mUEaE+Ni19ogcp8tDo4y1HwPPk/yrkQS+1Fx72dQTHVEg3oTFPGnx2pimJx65JRq6oUKwANJBEyTkY389KKp3p+yB3/meJOTTHHkFq9J0laZxEQDhDdS4FXEng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXFm1JVcKK2Sm2WULWvxrSdeaYJ06T+WVyWjZQZfxjw=;
 b=J1EpFjD2/JZVJb/aVOZP7AGtHE82op0UYotPPW5Kh61Zromiw6740eKg4j2WdD/H0nuTbR8MvTMKMA81uOKqCdZUzGspW0r8KWh9CIQ11mOXinoUpukJpQZg6sLd9SEk4VMRKj0VWyaP6hCsM2EhqprmOid33wdyCPMGidMaI+w=
Received: from AM6P191CA0073.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::14)
 by AM8PR01MB7745.eurprd01.prod.exchangelabs.com (2603:10a6:20b:245::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Thu, 16 Nov
 2023 10:53:28 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:209:8a:cafe::ab) by AM6P191CA0073.outlook.office365.com
 (2603:10a6:209:8a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21 via Frontend
 Transport; Thu, 16 Nov 2023 10:53:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.19 via Frontend Transport; Thu, 16 Nov 2023 10:53:27 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Thu, 16 Nov 2023 11:53:27 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v7 0/2] backlight: mp3309c: Add support for MPS MP3309C
Date: Thu, 16 Nov 2023 11:53:17 +0100
Message-Id: <20231116105319.957600-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Nov 2023 10:53:27.0497 (UTC)
 FILETIME=[21068390:01DA187B]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019C:EE_|AM8PR01MB7745:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 817923fa-5fd0-4094-64e9-08dbe69243dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KwbAhxBGnjKnQMXVWX8P6wV3qhsCNlZEFlVqTQ75wSEb0+CfHm1AnBGQ87L+Wbt2lXYqe9josPEF4hw+qCq5uwhxdDPA/3o3F6l0Dup44hvrkc/dRdJ+mB9A4LP/YS4Zpo2BnKpUTpIz5BCOu1JsGNz/jx6RlmBdO3PGRXizs/kYbR9O4eck5jkuU7hOPWgEvWbus1iLnyORvzrE/ovHRxn/WxiMMCjUiJS63BpvOQlJT3zhp1x+8rV9e57XkyXz/qLWR3xqSCE6u6/9ZoJr8v7Ubv90kpuPnArRHat/t4VRwpd3dk0pHuppDIxPSB02cf2ICJu1kAdnESSLJhJxtn9Ly2VQldXtEsEyrie8LwXGhccfOkfEbH/beMhpU1mU9QrPAxiuZFCJ3ONzyAd72L0p7zxx5FkyHscLQJlFfPoUgfNicbR3B4USUYKXK+qpZwYq4z8UgsvseYN+EAG5CuGmBbDEmlj4+x0/1uZS1UGEns/L6jGMUKW0Xg88mTp5/rmXq8ztfySV6ZUEcpY73KQde081g8GwL4gB0I79i4cPajBP+/NA70Bt3ZtztgE0Ks/tR0StBavsOfGY2K5dpbEU+5OFmv9vd7fl2YsHyM74MYvA0s65E0Y1HGNmQ5i1h5O0Gw8PtOVRAC6ns9iQVyFis2M/19Wvc72HzQVv27/FOvFh6ttSLE9bzYSAZhSBHH0WG5E46a3mhH+ZxoNrBVjnZPsDmiINM+2ikfuZq7XC/MV1d234cQQX7rkD5gv2
X-Forefront-Antispam-Report: CIP:151.1.184.193; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:asas054.asem.intra; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(39850400004)(396003)(136003)(346002)(376002)(230922051799003)(186009)(82310400011)(1800799009)(451199024)(64100799003)(46966006)(36840700001)(2906002)(36860700001)(41300700001)(316002)(110136005)(70586007)(70206006)(8676002)(36756003)(8936002)(4326008)(81166007)(478600001)(47076005)(5660300002)(40480700001)(86362001)(356005)(83380400001)(336012)(82740400003)(1076003)(26005)(107886003)(2616005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 10:53:27.9847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 817923fa-5fd0-4094-64e9-08dbe69243dd
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2; Ip=[151.1.184.193];
 Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR01MB7745
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Flavio Suligoi <f.suligoi@asem.it>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset (rebased on v6.7.0-rc1 kernel version):

- includes and updates the mps,mp3309c.yaml dt bindings file:
    - Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
    Note: the patch related to this file was previously a separate patch
          and sent in two versions (v1 and v2).
          It has now been included in this patchset, starting with the
          version v6.
- adds the related device driver to support the MPS MP3309C backlight chip
- adds missed history of previous versions
- adds missed "Acked-by" and "Reviewed-by" added in previous versions

Note: about the first point, the mps,mp3309c.yaml file updating, there are
      no compatibility problems with the previous version, since the
      related device driver has not yet been included in any kernel.
      Only this dt-binding yaml file is already included in the current
      v6.7.0-rc1 kernel version.
      No developer may have used it.

Flavio Suligoi (2):
  dt-bindings: backlight: mp3309c: remove two required properties
  backlight: mp3309c: Add support for MPS MP3309C

 .../bindings/leds/backlight/mps,mp3309c.yaml  |  10 +-
 MAINTAINERS                                   |   7 +
 drivers/video/backlight/Kconfig               |  11 +
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/mp3309c.c             | 443 ++++++++++++++++++
 5 files changed, 466 insertions(+), 6 deletions(-)
 create mode 100644 drivers/video/backlight/mp3309c.c

-- 
2.34.1

