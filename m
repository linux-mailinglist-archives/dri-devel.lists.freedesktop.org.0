Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CABB37941C
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52D36E8CB;
	Mon, 10 May 2021 16:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DD16E8B7;
 Mon, 10 May 2021 16:36:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3e5yK5h3vvdy8IRUflO8u8BHkgDi/50MOQTLqa/gr5ek6Hy8Fo1Mq/n7oLBfSUPvwAQkE9IA1qfi3gkVsutKHYLmQ4SddNZ/yO4u1YhBCtXIQYK34t/Vc21T5JOdLosOZsPRA7hQZ78n7Y1NcePXhW1nzssISgmrnRyQG3Sz7urfFfg3ASZiEZiF6YgXzdOEgff2N43080C0Vae5GvTtaX9zIJNjZpxV9sc1v1JxQbeMSGa1io/SCRIdp38TaO2+y/hHUim7FHbtByBhtuUlPRqjydSGmmKgmLDb7cALTyGsf/nsZ6vlke1UazF9vDrrtdrRyFCOlvS4zTDHv/VOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfW+qrJpKhR5p+rD+wQdoutlcOFsn4QAumXGO4q0St4=;
 b=iVO8SOdt+pJPzP3jEsQ0ra86fEE+VwFp4+Ek/qPqLqDrVucy/Om9tcOwvHOij1AxOZOWNzOrE+pEle2LIaKhJR9pIwmbrXsxh7FuVWmxtApYGOy3HUcQVKfu1qz/YVSImkD7pm8m2gr0b7muCp1x3z+EvNdEUbIzLySFolynLyL4Ee5KS4KdgBBojW5i5PtMIEhNqxejhcUInz3nFbGj64NIfmVRiWWDiligDRCv3cX9FYdNP55yaeGymLugVmmoC6NR509b03nUywD3SiNU8Q+J9vy2ardpkPk6xh2iqNISec54TEIhjcuKqvbkTVnVV3hKvcQGHN7U1/HAJQfD3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfW+qrJpKhR5p+rD+wQdoutlcOFsn4QAumXGO4q0St4=;
 b=sF0hCAFaWC0Asz9gQgqn6dAvKG8zbe5z99v/sPPmYYUVoX9N7VgF4IUDyBxCblbKSr1WhanFlR5s8Cd0An5hYYt/oXzgrxQJ8m4vpsBj/UZBzGsP6EJjtyBhDoq81Bl2O0elB9k6LWz87SmC+70Bxdp4dmxggHgeU7kK3p8seDg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2397.namprd12.prod.outlook.com (2603:10b6:802:27::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29; Mon, 10 May
 2021 16:36:56 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:36:56 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v6 08/16] PCI: Add support for dev_groups to struct
 pci_device_driver
Date: Mon, 10 May 2021 12:36:17 -0400
Message-Id: <20210510163625.407105-9-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Mon, 10 May 2021 16:36:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54a98bf7-4684-4c6a-4d8f-08d913d1d2fa
X-MS-TrafficTypeDiagnostic: SN1PR12MB2397:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB23970A31C68A3057CD6D2124EA549@SN1PR12MB2397.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ooGQP1ZYap/yZnT2kSe2/8VAfjYDRKlfk5c2c51WNy1B43JxxGg1mWH2rDo1Wi+acCNZCr3ieqXlDNANnpl1W89uN3oM9pNUv1fdQX3ZL62CXqyb6n0b8oOinOSQZOw93SPWvne6ZmlIJdOTvkj59SZlyQeUXgeag0+Hx8j5GAGf9AbTzp3+Dr9980z4TcQ9WKCM4MN3SQ2zEj8fAB2EM747O/WMI8PMTeFzT7k3ULfbZRzmUfVQE9i4LHy8aMdJkjqPa7Q0efdmFO7d+9JOD0lhz57awWt4aCdukQ97L2A80v0USR/K95c5J9Gw1ZKnkAaK5H28SmYyWWQgAlGUwu7iMJl7DJJ5PcJETkml4o8SFIvRJogQEF7OJYxDlS2ZNu0y0MAavazZayRsw/DcoSPnESUEwIVMgDqPEro5AYgXtmvDsbyRk3RqBbRSb3v52arGsls40f/Hox6x4UaNNNIWipoNsGYp9k3QIrxMlrGmnVkotlCvuG+H2vRrwwJxSfjBq7CxufrtTo83ap6Bwm7qohwmNgf8SlwJPX0agRnsP0gAmlSZCaM9V0o5udIa0dqIs2mQHr7CD1QwxXihIx9WCJE6k87FNJfDQ7X+/kU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(6636002)(44832011)(83380400001)(6512007)(66946007)(66556008)(36756003)(2906002)(66476007)(6666004)(16526019)(5660300002)(52116002)(4326008)(8676002)(6506007)(2616005)(8936002)(6486002)(86362001)(38100700002)(186003)(498600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?U7QcdvGikTgz/2gQXDqKBUOCyshZlNEESXLaPyL4cMrfQ+W+AzCI0aw6xlZ0?=
 =?us-ascii?Q?qfBndWRCPysZeF62vadEdthVzla4lZIV0NbZ1TE7ks54wHazAmzibtqHtg8m?=
 =?us-ascii?Q?QxyBVdE185I+KtFronX/b4MJLU0dT0/pLgy1WBJ1pIfCuv9qn9HWH1QIfrvw?=
 =?us-ascii?Q?modKUKJX5CSBq5Tcp7kkGkXbxkAU2oO1l2hibrrdthnTfZ2HF/2x03ZUuboJ?=
 =?us-ascii?Q?KLZGylcdt4eEOp+mRjblXf3eeF3QYuM9GurJzo7Uy5OO5N4txMmfcmHhl5/3?=
 =?us-ascii?Q?VKiGieuqwI1s4JT6tO5zt4Dq5btTaP0slMj0Dv9cB4Mcq5arQFK+RR6b8F1k?=
 =?us-ascii?Q?UhhBXGcKBigGfTRHDLGaWTpI9jyxuaShlSqjty0oJXWRP1fFWoiYdaRBDCJ4?=
 =?us-ascii?Q?FC2P5qNjHct1r+igSbgJzHfG9slQZ4DpxmmWjhUG0UCnC43S9uQkbOjMS4Bk?=
 =?us-ascii?Q?MNP5+O3d375Ts3kdU3icERjtQCb965Y2wcd3HrLbfejg3bHhF+ITkCmStWJa?=
 =?us-ascii?Q?Vpkzc1WHBv+6ZxcAk1/Vmn4q+Bw0AViI5uAWzx5w2BUX+PVNYUto22UzI/NW?=
 =?us-ascii?Q?XKJ7tQnyyhX91DGaXR6y/InuwdLahDE4eFeszDBjI1S2LKpagwE6NHI5Va71?=
 =?us-ascii?Q?cQC+SXl0A3G/06QURGjk1BDmUXsMYoJ/ESK48GQkZGEmk1B/EgYJILd7gdp6?=
 =?us-ascii?Q?Ppilba2NxsguhWl4mengiBmeY8G6T0YRbfQVItgVvSFTz58g+2U2QW1DeRwz?=
 =?us-ascii?Q?vzvTBB4KzlA4HnlU2x2JMVO5+0r0F2vkdX8FKmExwXIknl1oUuhSgKmotqh2?=
 =?us-ascii?Q?9P128t4c0Imyg8kiwhu2jfpLwyrSLD+OydbKAeqDKzAOk2DejHedL+Ao6hM1?=
 =?us-ascii?Q?vZzUTrjVnLVuKIfpvqltw9PLCprGCouW7gv7katmB7rNwxrBbRX+YnBTHWrp?=
 =?us-ascii?Q?icuKJOtlYTCKZAUHqMqq8YufBl3YZFgd0LcH6bhXz91kIqEzKhRQ+aYBP8Vu?=
 =?us-ascii?Q?bDQ1gARqvxjpiTyIwvz/qrELshu47dvtdCbmQljL5fQMa6gphm5GLm3TbmBj?=
 =?us-ascii?Q?jVg8A19dgnsCNijOF1z1DaSWEMRZJeRuWNtxd4ZI6gItHUrW/c3mxM5v3ZV/?=
 =?us-ascii?Q?mFCuWhhxQ1zJ/F4HJSxTzQwVyv4ikw2vCs3sRiqeXiMYpXUfOC4pOwz3HQYZ?=
 =?us-ascii?Q?plol2i/QtAgBNPmIUKfdrFa0WQlWzvfTYHG6uelWyJtNkvtR+mqaPdDsXn+y?=
 =?us-ascii?Q?thZF1aUAPDWhKo5VWSdcrZzaqL6ArwgLet8KW4mGSYTBaCsRFrp9gLECZ8ic?=
 =?us-ascii?Q?e9aSjTtuq3FPSJiOqLNcbGfFxvSfEJpGZuXM36/Gmj+eFs0KpDN439X+T+Lq?=
 =?us-ascii?Q?JE9O5OQ5IqtsO+aCeXpPabJRUMl5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a98bf7-4684-4c6a-4d8f-08d913d1d2fa
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:36:55.9936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oE+CKvLaIncFOC7/5g1e7bId0gtA6dKYOQpMkQMhZfRb+/VxlFHSkv2t9uzc3L0AomBwB1efIMHPbSuuYftdSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2397
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This helps converting PCI drivers sysfs attributes to static.

Analogous to b71b283e3d6d ("USB: add support for dev_groups to
struct usb_driver")

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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

