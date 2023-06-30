Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2A4743B46
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 13:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BD510E462;
	Fri, 30 Jun 2023 11:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F1C10E469
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 11:57:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqAVknYdhV/aULcTm27H29qTOINk5o7nRJmFQzdSwyik/QtWPKZ6tAmSuFhKbjot6tARhQYmQZ63RmXzY6cdD4wue+ABy3y/lKevdJFuy/p/ann/ntUHEO7zNHti9aQu6aSIDgWjFEMaDkduIA1zzwu5985WC8jnXnK7EXnMU/tLCUre+eD1+9L8uDARUdmB2sUIetd18PJ1rAzS7vXQTaW7mGRtbY+Zkh63djC+R4iHeIpKglDCTFqB+rjg7KyLetwiQU583f57HYEIoBHuDut7h3Ph6RhpVJghFxQq0hax5XarSc8KQ4PDIUDzyuDvpOSqzTUUjboUAQQsjKJNkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHcOF/BB79qV8szHLF7p08JA9U2RL5WZz3pT0VRoTpI=;
 b=Kpmp84ndffglsTzHahCF4QKHdsSs6iptqhImmeEb6RlbSJa8AgT4r55N9KWissucJrsKPtznEaCM/8KF6VU58QBevqfih0DfZIj36t8TcEHM8NMNofyZddapFAvsUBqnCIg5GyPgR4Gw/rt1Y7ovfX5n6JAPujxf3tRIFR6i9w1azBmdoq7LrTX5p/julLyQt+cex1OerkkJMJt4fBttAcCr34VXg/WkOnR+GDN7KSj9Z20qLsicJo736uhiifgVKbGwYw8mTQJYt6vr1bU4RW9LQr/XAYoGHbUAXH4hqQGkVDtJDmIqUhhhErwkDbAQ1K2Tbw8YRt/UJEWORmXUSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHcOF/BB79qV8szHLF7p08JA9U2RL5WZz3pT0VRoTpI=;
 b=VXQYrGjmK0blk4qmF5xjCpKBAHu8896BuJJpNS2Jd6ATjr27BIrV2GQ/Ap7TLQavA1vkqwAEHxrfjV/uWZ9S3WnRl1Go5sIobIUvHlVCmoPlPzB92mwzuVetsu//bkysEbiQJm92OEdZQSAEMqV4NU0QPWxDyTnkmzIZcohqJrw=
Received: from BN8PR12CA0032.namprd12.prod.outlook.com (2603:10b6:408:60::45)
 by DM4PR12MB5085.namprd12.prod.outlook.com (2603:10b6:5:388::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 11:57:03 +0000
Received: from BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::9b) by BN8PR12CA0032.outlook.office365.com
 (2603:10b6:408:60::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Fri, 30 Jun 2023 11:57:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT094.mail.protection.outlook.com (10.13.176.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.49 via Frontend Transport; Fri, 30 Jun 2023 11:57:03 +0000
Received: from jz-tester2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 06:57:02 -0500
From: James Zhu <James.Zhu@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: support up to 128 drm devices
Date: Fri, 30 Jun 2023 07:56:51 -0400
Message-ID: <20230630115651.354849-1-James.Zhu@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT094:EE_|DM4PR12MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: b4813b37-19d8-4651-cb10-08db79611e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6npSzkC0yBdfzcYvGxDmTuceBCeGXQsPuJxPlJiCyhJE1ZiEKiyNhwrEZMID5yT1O9FYXRmhtIN+BrBaUprq5o+bNiEj1pYtkJW+OaFkLEwwbiW0BAuQLVZQxvzU1LgzEl1bz8QEm0R0i5zGuWfeKKpGnHdsyOwcqN+X8/E7GFLqbxVGJDf8EY3IwLlO0wwH19EK+MoComd+uf+KePnJQkElq9sjh6k+8u8KnI7ab/1x5/1KgsjTzEmWvwG0Exge/ek4M23OGVyexx4CaiSUA5pfP7RFyjko7hy5ehLkEdncJOFWRX95yKEzHDXU8GqS28kyX7mfFw5CqH4vx9EO5WOfHwGOoknBscc8j4n+aXLQ62ZEJv77EKZRLmXcKVR4oscjwHGe+5C2WrRgDYy0DOTAuhhkZ/mGR/F90ocqzC0L9+c5f/pKOGm6jW3npNWjKkB7N8Hdu693vhdZGEqRg6yRoX9lC3RpcabbYhsMJd0nRXAZMVxXr3VKF3yLnOGhtPdMcUQ5gc5omV73I5xbcAoh2c88RrEFJh1ri9SF3d287WZgNUSKbWwk8wzQ6EojQScUv5113RAodsHIs6pNNAFRzXPQGxugQLVhSowfNcHe/oiE1im9KvchO10mqAq7T5f5vKwCxQJbShsI5/IU3NozIqnZItLge3FPwFGF4Z9cTKCh3C9FytHt1fXmfRFjl57PqWbH/3gaVUGQaQrTqLYZE951N1MBU+/tEZoawJKotO4PSL4IhcQ+JsbkJFp6Dss+jHzKi+cEARvEx1btpw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(86362001)(54906003)(8936002)(8676002)(5660300002)(82310400005)(26005)(1076003)(7696005)(478600001)(6916009)(4326008)(70206006)(70586007)(41300700001)(316002)(6666004)(16526019)(186003)(2616005)(2906002)(4744005)(47076005)(40460700003)(83380400001)(336012)(426003)(66574015)(36860700001)(40480700001)(36756003)(82740400003)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 11:57:03.2151 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4813b37-19d8-4651-cb10-08db79611e71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5085
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
Cc: jamesz@amd.com, christian.koenig@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christian König <ckoenig.leichtzumerken@gmail.com>

This makes room for up to 128 DRM devices.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: James Zhu <James.Zhu@amd.com>
---
 drivers/gpu/drm/drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 73b845a75d52..0d55c64444f5 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -137,7 +137,7 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
 		r = idr_alloc(&drm_minors_idr,
 			NULL,
 			64 * type,
-			64 * (type + 1),
+			64 * (type + 2),
 			GFP_NOWAIT);
 		spin_unlock_irqrestore(&drm_minor_lock, flags);
 	}
-- 
2.34.1

