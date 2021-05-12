Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D9C37C004
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 16:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F786EC11;
	Wed, 12 May 2021 14:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0B96EC11;
 Wed, 12 May 2021 14:27:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmkQr74taIp1Iw7KaANpctHA35hNoUXNDLkt4FDMNor/p4IEBV8X/4bj+V776nqpSAwdyhWi9YhgwmFyQ7D+p2cUwtQ1qRtrdpArR3jo2puWzB7i/YRfaM5nWO44XeZVeEjHltCp2vYqo+T8nBfxdN/mKP9ZBg4z7hoS9wqLhKIJGPI/p6QfAoqKpRxqDEkUS/1bpAbp6uo4ZPsJVtAJEq7W+XwBpolhDZM6og3yaOtOyM6KWeR2hAkARoafHirv7X0lYaYObKr0mIFiI9X6nzRZUFhVu7vkeCMQSWDOkK5qFW2Wk1OIjqkHDy+SKBMf5GXZFebMqkGey/Jck+C2PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ib9JMbJcQ89S3QqH2/zvtmoA13b9zTTfzZEYQOgJxs4=;
 b=jpzUTj/AYiDtyZ5sUU16lKenuffbZedAu8u+j453UWRIHUN9Dw68Jy9FDuMyGSTBs4ETT/QTZRQ2S6OphfdQ7Ci4ESprgJQY6BBemRIYxvJ+Dkui3NgjN6a+jDyddOvKDDZ1E0VPgA+7P69VXz4IboD0emFfvbEmnPA6lqMe9DlGwRIE+xRNpwGbzXtVSpWKwTYb/qKnLhdPdJ3hAIElmLHItUMLIvaGTvjPafBaM8hhF8MxHk77AmJm89bT2Jc5ZHqE+XDavcxmWCTuAE4QPqZnbcFy97yeIL/eze/JCsHYH08PbDw6SHD5GrS6uGnABcg+sEilaJuCNq9mRgoY9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ib9JMbJcQ89S3QqH2/zvtmoA13b9zTTfzZEYQOgJxs4=;
 b=dejeCAViCbUGefjdpMBG1HI/5+wnIryalwnu33JMf5cKQBeHCp5SDAPwiOKSP+Su9iltYdIfu3a+yxtww2i4w9h6kj8PlFXLSPZSewSNqZwMXaWT/lnEnRi97De9mKAPOhTkgt5hav3eoXmZd/JV2ixf4PiMXQtVq4sP7PCkg/k=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2845.namprd12.prod.outlook.com (2603:10b6:805:75::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 12 May
 2021 14:27:24 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 14:27:24 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v7 07/16] PCI: Add support for dev_groups to struct pci_driver
Date: Wed, 12 May 2021 10:26:39 -0400
Message-Id: <20210512142648.666476-8-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:7576:4f76:97d8:1487]
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7576:4f76:97d8:1487) by
 YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Wed, 12 May 2021 14:27:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cc5f59e-5043-4ff6-6096-08d915520f63
X-MS-TrafficTypeDiagnostic: SN6PR12MB2845:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2845D733D1723D15FB3A10E5EA529@SN6PR12MB2845.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FIdWCEba5PvMihH9V8v4zF3bQkbJWxh0oJMl0zP5dXIjUH8x12scsTLi2HxMJlb/QssNik2mDoiozhwFMmcYkOOuhplMcOAaYpYIg/fzMC1l1iz/r3f9n/jYpqj6O2ysHYMSi4F5gIt0vKnn0psqEbPQndEdbX6s77AXywHwW5UBlVJYhrlcWwtW5rnHzPCemAzWPVHiTjihFxT9RFup/FjxqwhBgLonj1Ias5cxbidttQhmg6U4QJUetmjOziUOFCkmmBokjvMScUsOIP9kEm+LPCzAPfHpISK4umn4mk5K9WRuRUHts5m50ey5rG9OFy1CMYr/mCmHdxXh4MLn1qQ4Juhx0V3R6o8LkpQuPRivt86ZvnhCuIrN3lLRKvoYdzkfzzyM+r9v6atmRLTsBtQYK2XZLKLoom3mZLAaBueGMem06bvSBULa664jx0a6Y/Ss6PdzRHVKVsZ6+/bdCQKi4v509nWsXCNBIP5GtwNFoUUozRP7Eap4EixCpcXuLLY/xwaDHEaWIv7P9Nl0tvSxW2JpD2xyjUWoqj5sFiKjpnpT/0BAw1JNnzYFvUtGcNGumz0l0ze+RyiBL6UHE3bC8hP6NDCZ6zCXyE+HCzo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(6486002)(8676002)(54906003)(316002)(6512007)(16526019)(6636002)(478600001)(1076003)(186003)(4326008)(44832011)(2906002)(6506007)(8936002)(5660300002)(2616005)(38100700002)(36756003)(86362001)(6666004)(66476007)(66946007)(66556008)(83380400001)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?u8iHqv8tz9BHH08oKkW0lWy+cVTbTQr+sNaKsxJOFnpNCoHi6ienOySoSYOt?=
 =?us-ascii?Q?dAsqtZWqURt0kPBQn8bW/cO7UvWGWVxk/7MN4LL4cAgY0Ey0BvXLazUbVY7r?=
 =?us-ascii?Q?eJIczrZThoQXR9eVTD67J8QQFuy/OUwyD39E1Zis4m+LvFlhanVLffF5juJk?=
 =?us-ascii?Q?g7MSzN3P7niWvBNibx0a3fDmjFIUnfl2nkyvlB06P5s1OqM3ZJiYgNiMi+zf?=
 =?us-ascii?Q?PJvaTHBGVO8A5NxBYJ6XSIQEIJUYHr70Stjt1tSWNMLn3CLxvX5uDNag9BKe?=
 =?us-ascii?Q?DvscL4acYDhm0Mg8VGaSMII4Fb5Qthd3YzufXp2M+7+l/8qveJukSWe/jf6+?=
 =?us-ascii?Q?JJ88HZEaKHKKZMjTP0fOcoxu0jYcUJwnB7fGByHyfqbknXzBW293697/N0eu?=
 =?us-ascii?Q?PVTv4fcmHJjbPrA1M9yaAfEGvks476KhrWgkFKLpr4Xjm3vbTuAC/SwpIYfg?=
 =?us-ascii?Q?pQrwymZCoZpRHFkTh7JuCPzgDHwO1X/zGJCyGh3TJqnKaLfpGrTdahBXhvny?=
 =?us-ascii?Q?IQaVeN2zUcikn+uLHFw/IKDfs7Q+JaEfGh1gF4KT/q7utxmPmmTCTlowDt9g?=
 =?us-ascii?Q?EzLhLi7pjQiLKH746Tr2vOwZxsNZrIkL0msPwAC2UpycnIws5FfPKBiqVrjV?=
 =?us-ascii?Q?WYN3bucLL6f8b0hF9ySUR2Swl8XXvgLJ9UDC5xJdkSoRqJW+g/8ZhAnAb11g?=
 =?us-ascii?Q?33pS2CX3ZHuh8ND6Jfa0t9eXYpxPnY4p/E5Y6hLDIinQFHF1o/A4kPiPfuG1?=
 =?us-ascii?Q?77XkS081kXR8l5f4q8RTcZdECGyvGhQp39XRDzoOE5sRwAkD2If8kfuQP3Yq?=
 =?us-ascii?Q?9aMYFhnX1seDDbjleUMuHxKfcVfsby459WkgJYvxMPpfGetzSnjLLB3+DtbB?=
 =?us-ascii?Q?XiBfCBeE69f+CaBODO0FDqUFZ81U9ql1lSZHeRcfYtM9iOQ9SM6jLm8DsnWv?=
 =?us-ascii?Q?Dc60yb2AVu880FrSJonHv8HJc30spBvDqYu0MZpcMzih/uukCmWws8zQy0TH?=
 =?us-ascii?Q?DhH0o1aIy9NUm+WbLq/VjgWFU0EwvpoJBVec/JjV6QdKLblhWZj4g2zD4MpL?=
 =?us-ascii?Q?YEuGePx9LMqH8coX8xmNv6nZoEMADVnZGKQDCTUOpbDbOwaVZzji8JoYORKB?=
 =?us-ascii?Q?t9CYiSoalEAM9iDXQRmyH6PHFlqpvtVBU7niz+JJt8muSKNpqzqQum73v83B?=
 =?us-ascii?Q?AgctJuO41MKbMsCe3CkR/W3+Xwi3Po8C54lpUZky6XAAwSL+YndZQgWEcgX7?=
 =?us-ascii?Q?disj7xdIzrUOdT0X70onRkByA5LEikpaV9cSIAnLC3iPZfYrK5aF2lQydMuH?=
 =?us-ascii?Q?vEHjgQeSbfDRmsN/Wl/1qvhpjIGPnKFNtQ/2zrL6cf3QYXXXpQoSc6CsOQAL?=
 =?us-ascii?Q?jgb12A88sGsyl8p8aUuUKPHPc0s9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc5f59e-5043-4ff6-6096-08d915520f63
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 14:27:24.0827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQtc9Q04ARiFQzokZZctQsHV7H4uApNgsNfGDqe/v8sPsmekPREdT+07h+OaIp+NAnyCvBq2yHew9QcmHKJubw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2845
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com,
 Bjorn Helgaas <bhelgaas@google.com>, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This helps converting PCI drivers sysfs attributes to static.

Analogous to' commit b71b283e3d6d ("USB: add support for dev_groups to
struct usb_driver")'

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pci-driver.c | 1 +
 include/linux/pci.h      | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index ec44a79e951a..3a72352aa5cf 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -1385,6 +1385,7 @@ int __pci_register_driver(struct pci_driver *drv, struct module *owner,
 	drv->driver.owner = owner;
 	drv->driver.mod_name = mod_name;
 	drv->driver.groups = drv->groups;
+	drv->driver.dev_groups = drv->dev_groups;
 
 	spin_lock_init(&drv->dynids.lock);
 	INIT_LIST_HEAD(&drv->dynids.list);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 86c799c97b77..b57755b03009 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -858,6 +858,8 @@ struct module;
  *		number of VFs to enable via sysfs "sriov_numvfs" file.
  * @err_handler: See Documentation/PCI/pci-error-recovery.rst
  * @groups:	Sysfs attribute groups.
+ * @dev_groups: Attributes attached to the device that will be
+ *              created once it is bound to the driver.
  * @driver:	Driver model structure.
  * @dynids:	List of dynamically added device IDs.
  */
@@ -873,6 +875,7 @@ struct pci_driver {
 	int  (*sriov_configure)(struct pci_dev *dev, int num_vfs); /* On PF */
 	const struct pci_error_handlers *err_handler;
 	const struct attribute_group **groups;
+	const struct attribute_group **dev_groups;
 	struct device_driver	driver;
 	struct pci_dynids	dynids;
 };
-- 
2.25.1

