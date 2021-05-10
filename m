Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26913379420
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C155C6E8B4;
	Mon, 10 May 2021 16:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F496E8C3;
 Mon, 10 May 2021 16:37:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJecyp0HC854m+XK0+qt88BhlgqD+iLvsSRmPOA46KVsRemVkOpUXNT6BODvGPJNWpnOHcLxSAVHcgr5cTaTkLoWgaEkhzokVkycsI6YHHlSVdiXSKpOXYd5++7t/oplptgHuQ2sQSQKCC8MPMnrW2DccztjPdwtoQ/gvedmqDFvi+BRTG93PAlbz65bjVzGQvyzeWMaWbtJ/X86FMHQci7fd3T+ekHZvndUXfM2sfXDdUXPXeBV6Br1mET4XTF3B+g23II4MkzdKWWsMg7Yo9orvK22W1YgGEwsJTia6rd/03gQUhkU5eejJAMl1bRzSkentX5iecbwSidCLFusEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+j+bM1q4z3pMJEkudykjSW5dJG+JuOaAr7e0M6/ckSw=;
 b=GGQqgOdfIW5e2ds3aLPTz868enYuenbbNB5UiZ0Oa/4wGZ+nKvcHIbT3yalZ5JP1THlIRII0Fu28O3/wEoGIQHbl9Q/aXFMbsrVjxSdY/2hG+pr1ukrtalr8+FQNiQRN7X2k4p/bBXsT9IpXB1KJBPWYkm4OUqwQeMuHusL7/5XY+ZiAt+iVeypnif+2kyaBRMx+ooJ+KrxEmJZmEK2T3dfSLdHTyld2jzg1UFZAQFwtI4MMoEsTE7k8TFAyKFdZFoBtPUNwlOGI5Bl/391pn/9fAT1fTe2OPQuNw9gmHuIlSORxDqXvy4cUr00M5DJBQaHjr74/7ltFF0dPBvW0Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+j+bM1q4z3pMJEkudykjSW5dJG+JuOaAr7e0M6/ckSw=;
 b=xFWcdoK4E2+CY+pSvb3iFoPz0W7zLvXEY37/Q8zx+4N2qoD2A6p96kY5H47Glu0wK2pWRmyM+F9Sv/G2qZeu1QD2tzVvkPtawyM1eB/vjcKGfncV30EywNNfM8ikkMmyBXElS6CZGjrlldQYXvbE0jCS3j+8De+dgnG7R4nVYaA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2397.namprd12.prod.outlook.com (2603:10b6:802:27::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29; Mon, 10 May
 2021 16:36:57 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:36:57 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v6 09/16] drm/amdgpu: Convert driver sysfs attributes to
 static attributes
Date: Mon, 10 May 2021 12:36:18 -0400
Message-Id: <20210510163625.407105-10-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 15.20.4108.31 via Frontend Transport; Mon, 10 May 2021 16:36:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5562cbb1-a149-4a0d-abbe-08d913d1d40a
X-MS-TrafficTypeDiagnostic: SN1PR12MB2397:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB23977F86556F0432E319E3A9EA549@SN1PR12MB2397.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iI/X83UHzIDbDtdbgfFOykfsbVFyf4IiDgE+YPs0cNh3qgCdEud/ALSQKT+a04H7O2BqrucywVXyOb5o/h5q/N2JEK/wZ7OTaR8/Fvwof2n70CXZcZndCXTFHEDSBLHLm5poBa2oqkfx7z+KIzZJBRopgQQohs3j7PmF83bTQYgpBAcbXHjtn8khPshF+Oz48/IkTWD74L9EL3FuIzPjqx2kfjRnhvW2dkWPW+7UoGPPPE9g3SZhUnNelOLuLGu5YOS9sHYPjYaC6xnSVfO3yFHN6/Na8Ls7puQyG9I/hLd2c7l73se+51znxujueK1c7NhbP8rI2IJgdp+pBon/ZlWh3ju/g0gfXOcVe75x/ym7TbnqK1buoKDkCF/gFb0zaOxqD+MVJDf8ckSBAY3X2T0xwgImg9/aNTddtM45UZ7J8G5XDk1K+ZudoLxfYPWegLhzbVT9RKlDsW+XgvECMfWLaE05a+9/1bzIs1uYAH8DrSroHR8inzZQDYdTr7qrJCDG1Z2hnRA2rjMJSz+QSZ3Tkbk6Mzm7ely8FhknawxtfDI8FNWl2xU+1HOF5PxF0jJUKyLwvTZEHDQUnAdqamH4qD9ce4P+M11BXSpfJv8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(1076003)(54906003)(6636002)(44832011)(83380400001)(6512007)(66946007)(66556008)(36756003)(2906002)(66476007)(6666004)(16526019)(5660300002)(52116002)(4326008)(8676002)(6506007)(2616005)(66574015)(8936002)(6486002)(86362001)(38100700002)(186003)(498600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bnFmdCs3UDB0eWR4UTlzVkg5TGM2RlFBNWpXd2ZCRmFxMUhjUkJmL0pxUUkv?=
 =?utf-8?B?MnNSM3U2ZkdEeEY5TEtLSnNTQ0hTM01zUGZzU0RvbmxnQjRVOUFPbU9uUVhz?=
 =?utf-8?B?WXMzNkxTNUQ3c3IzRThKRDFFQUFjWUlBdVBoeTN1bDFsS2s2emtob3ZadjJi?=
 =?utf-8?B?OU5XN2syZjJpZCtZbit2NkFRNjN0RU1rNVJ2Z1dPNzdna2g5bDFQTFVqZ2t2?=
 =?utf-8?B?Vm0yb0hWSDJrdDkyYTgvQktNcEJQd1RRYWdmRzg2RDF3VnZGS2FHdG9adkJ5?=
 =?utf-8?B?ZktJSlBxTlpRVXFlV3pVS1V5YjhvZDFsaUZTcTBha09iRHZwTjlwdGJRNFZk?=
 =?utf-8?B?UTdWbGNaSE9ZN2o2V1AzblBnaVNnYitnWmFXd2xJL3VQRjRMZThBUFlZd1VG?=
 =?utf-8?B?aWZ3aWFXWVhqQ3RSbkZyRUQvby9BallRZFFzRFpXcm9OU0IyTXRESzFmdGht?=
 =?utf-8?B?R3hlOHN4Zy9TZk9GcTBJdmUzekkxMGlDbzFxeHlWenhOVHQyMWc3WVpicjMw?=
 =?utf-8?B?T1pNNXdMYVpHZkg2K0g5OG5WcDRrc1N5WFduWTBiM0NlNm9RK2FEcnZ5aER0?=
 =?utf-8?B?dTA3WnBrRDVCelUxNTVCbFJQcWVGVHVNb3FWL0R0NlpFMkZ3aXVJTmszc0Nk?=
 =?utf-8?B?K2sxZEdzSWlZMnlveXZsclZLK1hNbTE4VnI1L3hsdEN4WndwY25sMGt1ZXhV?=
 =?utf-8?B?Q0RMYzQwcHp1ekZzMVpFWmhWWEVhNU4wZ0ZqY2lkeUw3TmFrNExBOU1mWWt6?=
 =?utf-8?B?ZEc3b205dlREdkx1TXNZRkVYMXp3SzJ0amJnOWVPS2g2cWFiMzZxL2pJYzV0?=
 =?utf-8?B?ZGF1THNSYkd0bFZTODUzcElGTVdEeklyWGJPaEt5SS9IUTJBdmhEdVAzOUs2?=
 =?utf-8?B?cjlKbW13WXhud255TmZiZE5lM3ArcmZScFRtU01KbVduTVBoTTNzMDdCQ3V2?=
 =?utf-8?B?eHpnbUZzYVBjN3R3TUpEaWZFeEY2WWt4bjRGZnlHbTNLUDRhSEZ3Um8zU0Rn?=
 =?utf-8?B?ZnVlNjlmR0RQUXp0akxyRHlvVzRPYk16TER0clR0SE1HdDAxY1RibS9OZnVx?=
 =?utf-8?B?T2ZPWTIwTE1sVzVHUTRDNGhpWDRYZ0lZa0hWcHN6OXpqdkViWkxhbkpVckpS?=
 =?utf-8?B?R3R6c3Z2aDdHN3UvZ2pRcDkxMXgweEduUVJVYTY1RDVsR2twUEVKSGVscFJL?=
 =?utf-8?B?WG1CR1NFdUhlVUR2UytGL21VUk02M2RaNU1jeE5TQVlkeXdRdHUrV0w4Mmtu?=
 =?utf-8?B?eEJBUWNROXUzTUxlWnltQ3Y1NkVZNnk1c2cxOEh4c0VVQWdOQVI1OW9zbk8x?=
 =?utf-8?B?QTVuRUF5ckJWMGtpU0dENjBqV2JUTE1SekVWM0RXSDE4R2FORVJRbjh3VjdS?=
 =?utf-8?B?NlFJWld2TlJPRytEdTFHaGRrQjF3QUU0UDNZcmVVSy83TFQ5aUJOUmROaWtk?=
 =?utf-8?B?Um4xNXpKcFBYQXNmcUpteTJPcnhycjNuM3NTbjMrQXd0NjU2cnNubzMyT1lh?=
 =?utf-8?B?ZDJKeFYyMDNVUStyaE1Ib1BqQkZ2ejdYT3BqYndSTWlzUjcwMEpjY0FLb0VK?=
 =?utf-8?B?aWhPUEs1RXpGOGkxaTlNMVZDU3pQcDlxR1RRRVVVU0t3ZjB4ZDAyZ2xMdXVF?=
 =?utf-8?B?NWV4R0t0SlN5Q2d3aHZBdkNFeDZNK1FxZXdCN1NqczkvN21CL0tWcHI2ZUxO?=
 =?utf-8?B?ZTdMeGJ5WnRDQjRvZXFMekp6YW1DTEVrRkVGMnBBQTB3TDhZQ3dzNmM2R0tI?=
 =?utf-8?B?VGRPSC9COGxlVGJqUzlVb2lJRzR4MDBaNkpyTDA0aERDOEZrcloyRWJtYXdn?=
 =?utf-8?B?UWZEa0JUZTdIWnpTbTljaXlWbExWSXd4ZW44dkpBaWt1THpYdy85UVpWSGRS?=
 =?utf-8?Q?VOnk0X9mc+K1G?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5562cbb1-a149-4a0d-abbe-08d913d1d40a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:36:57.7746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O1iTQk5HvTkMxppOrl2tuuJXMzR4CiAKEbqgS2vce1cDqKYFgkj100fXtKnSFRyZ10YYZ2w8tvWhDWf8SLBS/g==
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
 Alexander.Deucher@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows to remove explicit creation and destruction
of those attrs and by this avoids warnings on device
finalizing post physical device extraction.

v5: Use newly added pci_driver.dev_groups directly

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 17 ++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c      | 13 ++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 25 ++++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 14 ++++-------
 4 files changed, 37 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index 494b2e1717d5..879ed3e50a6e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -1768,6 +1768,15 @@ static ssize_t amdgpu_atombios_get_vbios_version(struct device *dev,
 static DEVICE_ATTR(vbios_version, 0444, amdgpu_atombios_get_vbios_version,
 		   NULL);
 
+static struct attribute *amdgpu_vbios_version_attrs[] = {
+	&dev_attr_vbios_version.attr,
+	NULL
+};
+
+const struct attribute_group amdgpu_vbios_version_attr_group = {
+	.attrs = amdgpu_vbios_version_attrs
+};
+
 /**
  * amdgpu_atombios_fini - free the driver info and callbacks for atombios
  *
@@ -1787,7 +1796,6 @@ void amdgpu_atombios_fini(struct amdgpu_device *adev)
 	adev->mode_info.atom_context = NULL;
 	kfree(adev->mode_info.atom_card_info);
 	adev->mode_info.atom_card_info = NULL;
-	device_remove_file(adev->dev, &dev_attr_vbios_version);
 }
 
 /**
@@ -1804,7 +1812,6 @@ int amdgpu_atombios_init(struct amdgpu_device *adev)
 {
 	struct card_info *atom_card_info =
 	    kzalloc(sizeof(struct card_info), GFP_KERNEL);
-	int ret;
 
 	if (!atom_card_info)
 		return -ENOMEM;
@@ -1833,12 +1840,6 @@ int amdgpu_atombios_init(struct amdgpu_device *adev)
 		amdgpu_atombios_allocate_fb_scratch(adev);
 	}
 
-	ret = device_create_file(adev->dev, &dev_attr_vbios_version);
-	if (ret) {
-		DRM_ERROR("Failed to create device file for VBIOS version\n");
-		return ret;
-	}
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 5ebed4c7d9c0..83006f45b10b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1766,6 +1766,18 @@ static struct pci_error_handlers amdgpu_pci_err_handler = {
 	.resume		= amdgpu_pci_resume,
 };
 
+extern const struct attribute_group amdgpu_vram_mgr_attr_group;
+extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
+extern const struct attribute_group amdgpu_vbios_version_attr_group;
+
+static const struct attribute_group *amdgpu_sysfs_groups[] = {
+	&amdgpu_vram_mgr_attr_group,
+	&amdgpu_gtt_mgr_attr_group,
+	&amdgpu_vbios_version_attr_group,
+	NULL,
+};
+
+
 static struct pci_driver amdgpu_kms_pci_driver = {
 	.name = DRIVER_NAME,
 	.id_table = pciidlist,
@@ -1774,6 +1786,7 @@ static struct pci_driver amdgpu_kms_pci_driver = {
 	.shutdown = amdgpu_pci_shutdown,
 	.driver.pm = &amdgpu_pm_ops,
 	.err_handler = &amdgpu_pci_err_handler,
+	.dev_groups = amdgpu_sysfs_groups,
 };
 
 static int __init amdgpu_init(void)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 72962de4c04c..a4404da8ca6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -75,6 +75,16 @@ static DEVICE_ATTR(mem_info_gtt_total, S_IRUGO,
 static DEVICE_ATTR(mem_info_gtt_used, S_IRUGO,
 	           amdgpu_mem_info_gtt_used_show, NULL);
 
+static struct attribute *amdgpu_gtt_mgr_attributes[] = {
+	&dev_attr_mem_info_gtt_total.attr,
+	&dev_attr_mem_info_gtt_used.attr,
+	NULL
+};
+
+const struct attribute_group amdgpu_gtt_mgr_attr_group = {
+	.attrs = amdgpu_gtt_mgr_attributes
+};
+
 static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func;
 /**
  * amdgpu_gtt_mgr_init - init GTT manager and DRM MM
@@ -89,7 +99,6 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
 	uint64_t start, size;
-	int ret;
 
 	man->use_tt = true;
 	man->func = &amdgpu_gtt_mgr_func;
@@ -102,17 +111,6 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 	spin_lock_init(&mgr->lock);
 	atomic64_set(&mgr->available, gtt_size >> PAGE_SHIFT);
 
-	ret = device_create_file(adev->dev, &dev_attr_mem_info_gtt_total);
-	if (ret) {
-		DRM_ERROR("Failed to create device file mem_info_gtt_total\n");
-		return ret;
-	}
-	ret = device_create_file(adev->dev, &dev_attr_mem_info_gtt_used);
-	if (ret) {
-		DRM_ERROR("Failed to create device file mem_info_gtt_used\n");
-		return ret;
-	}
-
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
 	ttm_resource_manager_set_used(man, true);
 	return 0;
@@ -142,9 +140,6 @@ void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
 	drm_mm_takedown(&mgr->mm);
 	spin_unlock(&mgr->lock);
 
-	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_total);
-	device_remove_file(adev->dev, &dev_attr_mem_info_gtt_used);
-
 	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, NULL);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 2344aba9dca3..8543d6486018 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -152,7 +152,7 @@ static DEVICE_ATTR(mem_info_vis_vram_used, S_IRUGO,
 static DEVICE_ATTR(mem_info_vram_vendor, S_IRUGO,
 		   amdgpu_mem_info_vram_vendor, NULL);
 
-static const struct attribute *amdgpu_vram_mgr_attributes[] = {
+static struct attribute *amdgpu_vram_mgr_attributes[] = {
 	&dev_attr_mem_info_vram_total.attr,
 	&dev_attr_mem_info_vis_vram_total.attr,
 	&dev_attr_mem_info_vram_used.attr,
@@ -161,6 +161,10 @@ static const struct attribute *amdgpu_vram_mgr_attributes[] = {
 	NULL
 };
 
+const struct attribute_group amdgpu_vram_mgr_attr_group = {
+	.attrs = amdgpu_vram_mgr_attributes
+};
+
 static const struct ttm_resource_manager_func amdgpu_vram_mgr_func;
 
 /**
@@ -174,7 +178,6 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 {
 	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
-	int ret;
 
 	ttm_resource_manager_init(man, adev->gmc.real_vram_size >> PAGE_SHIFT);
 
@@ -185,11 +188,6 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 	INIT_LIST_HEAD(&mgr->reservations_pending);
 	INIT_LIST_HEAD(&mgr->reserved_pages);
 
-	/* Add the two VRAM-related sysfs files */
-	ret = sysfs_create_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
-	if (ret)
-		DRM_ERROR("Failed to register sysfs\n");
-
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
 	ttm_resource_manager_set_used(man, true);
 	return 0;
@@ -227,8 +225,6 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 	drm_mm_takedown(&mgr->mm);
 	spin_unlock(&mgr->lock);
 
-	sysfs_remove_files(&adev->dev->kobj, amdgpu_vram_mgr_attributes);
-
 	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, NULL);
 }
-- 
2.25.1

