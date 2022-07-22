Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBD557E934
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 23:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC828EED4;
	Fri, 22 Jul 2022 21:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F84E8EEEA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 21:52:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuQQ+fyAQ4EVgt9y9M4hSaJufhcXjY0ORioUrcdHiLt0qQQJiMtcwONrBRmSHbU+8u613t/DuRantk1dR2CzUo5sy9vcqrnzTfbjj3zUMRJXVr34KeNVpHmUGnnNsQui7Va+iQedZqwMaNfXijhcdufiXgkse4hfCuJ5l5tusQPvre/+HIru3xjQzL/ZyX2ZQjKsvg7hOWB9KrFpF4C8wkyVeCw8CyKIc+6ELJY20IkDUexPcAjGyHad3Q+hRAqAXlN2zdjyE/PYbk4R87TfG1D6Ej3wEPaIqKLlsbGU9vKeOcbzUI8Kxi0Up6IhbMDHJ44rDDf1qmfv1JgvrKWL6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYXDflbhZ/m0KhZ4nPzWmyrqoM7fZ58ZQNyX/ziFkTc=;
 b=nHelkwbrm8xB0N1pdB0aNZ9TcDH+OwmQ8OuApxniaC6aZNYRP/OYXC8SLl2iGjcojZK9eLijZogKqPJqVAQMm38gFiGTg5tTJjNznYUSPrIE2BIxn01kCvFSA+RzfgA1kpUwMlK5A/eW63D9Fy3N5PURQ2L6iaL7Z4HElNXRx2u6FJnedI+lKiHn3RfKriCVS40qbuzfZ/DMeSIdA6ZTWYBKXYx2irhcwr3o4vUacXnWkWa1czQbDpkHyOoFwlURuG4HgfR/aTWupOmSSZogxQlEu502+PTiLalLE22AElOJuoPHdIHvXdTpETgwq/nQdcR31rsPv/CsfC1V77uV5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYXDflbhZ/m0KhZ4nPzWmyrqoM7fZ58ZQNyX/ziFkTc=;
 b=YX7BOeIz45XhKVSj0p83BqB5d53HYL/LODALul7e0zmJVcA+5sHFNG+brRROKFtiK7pLKUy+BVJQsOOmcx9tTGZbdtagmIZ7jvoS3dL/3mHvm9GGr2pfvJmOhywqgnwzoNgQJmyVHFaNoOH3l7kRJ72dNk53RQuiMKQdJmZf6io=
Received: from DM6PR03CA0102.namprd03.prod.outlook.com (2603:10b6:5:333::35)
 by LV2PR12MB5896.namprd12.prod.outlook.com (2603:10b6:408:172::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 21:52:48 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::1) by DM6PR03CA0102.outlook.office365.com
 (2603:10b6:5:333::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18 via Frontend
 Transport; Fri, 22 Jul 2022 21:52:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Fri, 22 Jul 2022 21:52:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 22 Jul
 2022 16:52:47 -0500
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Fri, 22 Jul 2022 16:52:47 -0500
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm: get lock before accessing vblank refcount
Date: Fri, 22 Jul 2022 17:52:34 -0400
Message-ID: <20220722215234.129793-2-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722215234.129793-1-Yunxiang.Li@amd.com>
References: <20220722215234.129793-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9e19b3c-87bd-4aab-b569-08da6c2c84a9
X-MS-TrafficTypeDiagnostic: LV2PR12MB5896:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A3/150/Sk3laAYS2hevMYJ3LdsWr0u0E+z+fHrX7onRojBxL5YpZKXGzHdZAL0iNsle3cgCpXail7gwyPZBlZtHGpg/k9+bt9BzgCrfkozpEPzPbJpAQAuC8qMBOmOI250h5dz3yLRbBnFqmgGX0m0rovopS/8t077zdJW4h5SB4S4+sLiRwsJmMXh3sPW2ykuwVHL20tKs/SYMFCF/w+VDcYJW6GPTxC4iiWobdYwxttGJSRRp8YMeydjllHAJNcLEziIvxYbbNSHWjD6LR/co/fEItL5caQ8awaZG2O6BVRojH4gj6b0wk7rtsjGNLS/fi1ZADGrOd6TFS55m5MUCxtVCnsviZr3z9WZ98KCtdNjE+1I2QyaStOQZF2MDNXuWe9m97x3k54gP5DFloI+h0Ri9ynAd75v17wVVSma96AmIwBbFfb8JwxYOFsAOBVvrQ1KiDSOXVbhOJMzT7iSeCae/b6bIdoQF4uI7E52Xy3FfQczeZL1emxhb5UZNNSKJxY4FWBSNmlnXgCJScDuaSxKzgdeTuqzC/DOuz90o9scxtCfOUg5WiHPpsyAu2WYQObhHCjXZ2LE9PnR1deVwBmahX7Fi05ZOQwV1LhdyEWxqIyAtnVDEjZXqOqpIpiMrLUnkZPBizIsIXM7k0fE9cmjZ+/YJjxcn+P8HDazdIKkpeMFX5RVTavIy0UMsN/kmX/3Bcvi6Ap46vfUGOXzXOtErLBqnO2m2pAu1u36o1XIQCqC2RIc5mFF/RNqgfmvdYgv96E0dZ0zwc9Upua8DCnQ7SH15Qck8Y817A2L3ByhLcLYBVUFZjCiDdaA6WiG7rF7W7o9T0km37TY0BnA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(376002)(39860400002)(346002)(36840700001)(46966006)(40470700004)(36860700001)(86362001)(82310400005)(40460700003)(81166007)(8936002)(356005)(41300700001)(5660300002)(316002)(82740400003)(47076005)(336012)(83380400001)(1076003)(6916009)(40480700001)(70586007)(4326008)(70206006)(186003)(8676002)(7696005)(2906002)(2616005)(478600001)(6666004)(26005)(36756003)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 21:52:48.5328 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e19b3c-87bd-4aab-b569-08da6c2c84a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5896
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
Cc: Yunxiang Li <Yunxiang.Li@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acquire vbl_lock before accessing vblank refcount in drm_vblank_put,
just like everywhere else that access the refcount.

Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
---
 drivers/gpu/drm/drm_vblank.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 159d13b5d97b..77b8c40fc7ba 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1203,15 +1203,22 @@ EXPORT_SYMBOL(drm_crtc_vblank_get);
 void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	unsigned long irqflags;
+	int ret;
 
 	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
 
-	if (drm_WARN_ON(dev, atomic_read(&vblank->refcount) == 0))
+	spin_lock_irqsave(&dev->vbl_lock, irqflags);
+	if (drm_WARN_ON(dev, atomic_read(&vblank->refcount) == 0)) {
+		spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
 		return;
+	}
 
 	/* Last user schedules interrupt disable */
-	if (atomic_dec_and_test(&vblank->refcount)) {
+	ret = atomic_dec_and_test(&vblank->refcount);
+	spin_unlock_irqrestore(&dev->vbl_lock, irqflags);
+	if (ret) {
 		if (drm_vblank_offdelay == 0)
 			return;
 		else if (drm_vblank_offdelay < 0)
-- 
2.37.1

