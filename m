Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9296A7EC736
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 16:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE93510E06F;
	Wed, 15 Nov 2023 15:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2076.outbound.protection.outlook.com [40.107.247.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3B210E058
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 15:29:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mu24NzQSTNjDlEPWbUMlM53+/PyFTVGwGfTF22/yMb/Wm27+4V1kOWUWV3CrSOQi1jHJ+Pe4Bn6uQSdNh2cxtuNyBFhg2xpIuql5cKI7SRTV92nkmdQrJmE5srZkNJUYn+8n+UbqGzpWDecowHk2jIBEXMm/kqC53ZvXXANDGS7QMRGXCkq9IeD/ujiIl9R6YP54PTPGZFzUw6l27UO0yTG79yaL4CSU7h5gykZA1dMYLD6rN96vm+rLWe2qpeKaiPrvBelSR0qMHrxpAeBldZwL345RDKAI0xaT84iAiwLowm+YXGArk50qDJgH9SGx2FpHXvXtzb7BMMZ7onXvTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bo+ViQCVwP4zn25XTOp+1bolcZ0vuCqNmJ/hK0s8FhQ=;
 b=FJEj6cq6M3C5XUB118chP+sAXGXGG5wK4y+mwuVubuf0pw1QMcr+WI35+5bOrQXwx/F4cyE+NdFj78oJ23H9JL7AdgFI2O4Kj2OZ4B33IXlgqZNYWFFYwtwnfvgp04tq0xA4/v9sYTj4aC1FmYRWQy0icjX74aIlcLkuZRVC0fCquEFtTikdLx1+CW0bT4T/KMN4yALjC0zFnkq1I+4pzllazLMGWk6qMhk4fAHjKxaFgfieFlOvFM+/RAt+2u0H8e3K646lImht0PJflEr4GaDCLHdj8eppOtDnfoDM2XH1XzftUwnsTn5lZfikJRpRSZY9P+PV3rs0n9JIGdbeuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bo+ViQCVwP4zn25XTOp+1bolcZ0vuCqNmJ/hK0s8FhQ=;
 b=kXXoLe9Cvwayg/d7xfzXAP7RLXQdfEKQldMBxEc4N++S9BH8BjVMPE4ZGssixa4shtiS4fOeJVIBxWBpft1XqJjZVodeb/7onFnVF0E7vddppQV/bMofxQo7J9KA5HwDiW5YjpvBB02IAvQ0vw05nPXAiAv+nAnXsSbI/3YJ1lM=
Received: from AM6PR10CA0068.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::45)
 by AS1PR01MB9129.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4d9::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Wed, 15 Nov
 2023 15:29:07 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:209:80:cafe::d7) by AM6PR10CA0068.outlook.office365.com
 (2603:10a6:209:80::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.19 via Frontend
 Transport; Wed, 15 Nov 2023 15:29:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.20 via Frontend Transport; Wed, 15 Nov 2023 15:29:07 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Wed, 15 Nov 2023 16:29:06 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v6 0/2] backlight: mp3309c: Add support for MPS MP3309C
Date: Wed, 15 Nov 2023 16:29:00 +0100
Message-Id: <20231115152902.851715-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Nov 2023 15:29:06.0631 (UTC)
 FILETIME=[78B45570:01DA17D8]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A7:EE_|AS1PR01MB9129:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 90537a52-e090-4a6a-4a1a-08dbe5ef9b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p6ErBNpgZXFI6JkJsVWIgt+Hn7ld8DuDmdR1j0V6x4oTEi6fqpV3y5+pAea7Inptm2zZceUd6uHedSP+q6VPcyD283otqeQTD1McxfVBmpKLq2QACMIlGF3lWlAXWe1+loQ31nmuWEdZlWthMahUHmm6ZtfwOuYet6ngLjCNFs9ftpxEam9Xkxmbzts004aYKv8HRp8Fstcpxr8HuhcBAZ0yWjUBCiPcI1naYgm1mxJD2ZLOVcItAPzLdyCU+NGvFi1CcrQ5GEBPBjPpxXvn5Xdq6uI4WZq7tITfPtObiM++bb8009nXFOyggrjjkWD7PijPg7zvVRfAtTo8Hygz5NtHUOV3aqA5dgIyF3yRNJaoz1yE9mRQC84T8n87XjOWE/j+qKAHtZDCAlWllIIIX8pMPRtliGZlKZm6i00mUYognJ4pECn3cMa3++nyAFg0bksduNB+9diU+KmFNFenik06xjXjQ3/9TeOC/aKA2RV/hMlRURcwTXrJL0lvueHgUFjvTvIXRNMiO2TizczaBBzaN9TdM+nbFOI3mRdmkRVPfB6QOTxcionxD7lMwwJK6DKy9g71ZAw7T6hAcxCCZzLWV74WSSnmy/b/t8T1xQ0Jp2HblmZXqB8gPMd/ZGbf2qzPEGh/Pt3k3ZscKcUtkzzKgdqHCbEUglZWEp5DWhtJdI2O/zhgzNkxDFS4LY8cXvt4f4cWD83RPlFjmEV3cku2XLlLSG4Wcy7SWfZls2yBRklvXse3z2CIbY5PEQLP
X-Forefront-Antispam-Report: CIP:151.1.184.193; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:asas054.asem.intra; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(396003)(39850400004)(230922051799003)(451199024)(82310400011)(186009)(1800799009)(64100799003)(36840700001)(46966006)(356005)(81166007)(2616005)(36860700001)(26005)(336012)(2906002)(1076003)(5660300002)(4326008)(70206006)(8936002)(70586007)(36756003)(316002)(47076005)(110136005)(83380400001)(8676002)(107886003)(41300700001)(6666004)(478600001)(40480700001)(86362001)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 15:29:07.2513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90537a52-e090-4a6a-4a1a-08dbe5ef9b98
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2; Ip=[151.1.184.193];
 Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB9129
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

This patchset (rebased on v6.7-rc1 kernel version):

- updates the mps,mp3309c.yaml dt bindings file:
    - Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml

- adds the related device driver to support the MPS MP3309C backlight chip.

Note: about the first point, the mps,mp3309c.yaml file updating, there are
      no compatibility problems with the previous version, since the
      related device driver has not yet been included in any kernel.
      Only this dt-binding yaml file is already included in the current
      v6.7-rc1 kernel version.
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
