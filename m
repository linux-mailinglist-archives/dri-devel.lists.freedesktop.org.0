Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB9838CF35
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 22:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294486F903;
	Fri, 21 May 2021 20:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E12E6F900;
 Fri, 21 May 2021 20:41:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkFHtF9dscfdRQIsWJaz9iRg6HSuwVB8IjZrgPqDC4Zg+nAlshMurYP9P1cC1ePqKX5Za/gNwfLfMThcYX4mbsBVXzNQIIeDq5lgEHL5hVPovNKX/y+O6yjvexYuKLrlJkta5mSleCYKDm2HtSNVOUmtFAC2rNgpGRXfY50jmZaanZGX3jvnlfN4sQmriNCt5X4eEl0HtA4/FOgS9iVMGSY0qZQA1/Y0DtXX4NiPbHzEpgEK2gR8yi0za9qQUxz701FPx6vw+fKQfcDFEix7JgJHWeua1zSSlB7PbssePXVIFFR7kAnakNmqYaR4CenXqP9psVgEXpRKSRLwyY+IAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9oz8lvo2ZAotg1LCkHFN3+2/gQ0v7HObxdJcmBdHk0=;
 b=IZd2qS0QNSh4NQfU1eQzAnbmc4YVsb4Uo8rFH2lYZjviFu9lGu1XXtFI+UlbyFuew19OckGOp4cs1V7HQ1gLVqrDLodYLJzEy/6L3a/7BDLaLu8TSfGgnFjJ7CzU6d1mae1r3MsB3yBdQgqttcLQMTzxu6TaIUAfNDAMjwIJnl9/tSSjploUIuIgWWHbDm3sOTCRlI/bjEk6NT6xeAdhhGwy+VR2XTJzT2kbI9SktJhNH7UL608kNUvqXxchIW3t1Vb3oS8aQFzCVaq8lBQW9Uz7wjDjZKJIAUuFpehZWq+crGBGmmcmuAPvwkMf5IB64MTXweBPqnkGePUi56CV2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9oz8lvo2ZAotg1LCkHFN3+2/gQ0v7HObxdJcmBdHk0=;
 b=bUkALW8aM6iol4SYbUh52UpnrO7yaHPm3wyn8FrIEbt0Qdrkk0HM7fA7CkBDSeFqJrxigEjezPNsXii/4JxOH4nzL9T2uzfaoYnDWsQ+hwKa+uvvozCcHafrz+9RUiD1lznS+JhiRkgt6WES09QPEtYSzbr7xZ3Z98m/UN1pnus=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4615.namprd12.prod.outlook.com (2603:10b6:a03:96::21)
 by BY5PR12MB4952.namprd12.prod.outlook.com (2603:10b6:a03:1d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 21 May
 2021 20:41:39 +0000
Received: from BYAPR12MB4615.namprd12.prod.outlook.com
 ([fe80::58e2:2ca1:afbc:5122]) by BYAPR12MB4615.namprd12.prod.outlook.com
 ([fe80::58e2:2ca1:afbc:5122%7]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 20:41:39 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alexander.Deucher@amd.com
Subject: [PATCH v2 2/2] drm/amdgpu: Fix crash when hot unplug in BACO.
Date: Fri, 21 May 2021 16:41:22 -0400
Message-Id: <20210521204122.762288-2-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210521204122.762288-1-andrey.grodzovsky@amd.com>
References: <20210521204122.762288-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:b74b:1af9:3eb:e31d]
X-ClientProxiedBy: YT1PR01CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::20) To BYAPR12MB4615.namprd12.prod.outlook.com
 (2603:10b6:a03:96::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:b74b:1af9:3eb:e31d) by
 YT1PR01CA0051.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Fri, 21 May 2021 20:41:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97bc0949-ed5d-4768-6918-08d91c98d57c
X-MS-TrafficTypeDiagnostic: BY5PR12MB4952:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB4952DFAD512E33EE51CA65EFEA299@BY5PR12MB4952.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0tqLAZ3Hr5SV4HDztPlKXjZ/96/Ad2hLz8xIQA6n/5OsFIm3+LygNBBg32Nr/RrVnM5zV/hfsBuwSq4+5/bS+0KwZNqrTvZdYF/N6wu07FarGTJ/wnUPmUrxh6B6pkmHo0hnsroj4HueKjhHmypW8aI7X0NeQLSISG7ybhvIoh5nYe+YhMjqtmc/mPDeWF51Qb5ATAX9jiyu5laVz4vYdwCEPek3JXKM2oKV+KrGTRIKpEkwccA6dGKxl/6hXioczl5LBOVl1E7iw///7X+noWGGoFmN26Wt4riHpK6PuGph2sbqr1/B7gU6goQt0b9Gj8ceD064JRRb6sqU2RgQZTENEvA1NEMDG+hrz3Bz4W/3IsR3uVBsIcFq4PtQ0cHYhx1v8gx1JTPAea3NBRJpn7tjU73SLO1YthbdMA3TKeha/GzDSKsnBf1KkEuaN0px+jB+UEQMXO5/pUqj3lW5ns8wu1JHAuxjdGH4O/4Rl9GLEgSF66gWOpf2kTYn83DwRX1nPiIpayTWOPlxQzgQ6qPRpPJY7nLXPefWX1Mdh640FF/k343vxObxXXZNx+UTalHIe3C3U7T8c86AyxQioBOA25fqjZQvdn51VR2Kp2IAG6RKK/OmMotVLRmw6Tsr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(186003)(16526019)(966005)(8676002)(2616005)(316002)(52116002)(86362001)(36756003)(6666004)(8936002)(44832011)(6636002)(83380400001)(2906002)(478600001)(4326008)(5660300002)(38100700002)(6506007)(66946007)(66556008)(66476007)(1076003)(6512007)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?62F5nuCimLHIbThMYN/wziq8NC+2A2w/ujuwFgFLKxHSHwDZknXBwuHLkvBH?=
 =?us-ascii?Q?0+dTWbO2VUWEGDFoxd9k8MpxMRLAO0N5tDkAfa1+BYtS5Tj4ye7DJQF2Y3VY?=
 =?us-ascii?Q?/wMDkPHCy0m0GJdILC4RL4d1xJjI1JNSZAJXh1TYr+qBjmV+L3KozzgEYPZP?=
 =?us-ascii?Q?C6gI32GfI5YWSvN+shvZbGh+pShck9qFeoby4sO2dnCWGT/kD2DV5DVGUd1P?=
 =?us-ascii?Q?d1xZdGUTLbvyl5lfB/TGoj3CjqL7WO37FiU4bkhs0j8V7gbuz5tcTc31kfuE?=
 =?us-ascii?Q?HhP93JWHEsSBXoWNM/vkrY38pwyUk2QG4A9FAo78SxbiTSw6WBFkjC/znlxL?=
 =?us-ascii?Q?uS/M8Jbt9VPJyfYT9ZElcy/c5GuTarXUAR/UwK3fSRE0852BWoMJN1UV8jjY?=
 =?us-ascii?Q?/KUbH3CD4hgU0svMuGROrix5qT5yUmrGha7xR++lCidTbX+qbjd5QnZvgGzq?=
 =?us-ascii?Q?YOkDK+hh1fXusCQO/J/ihukhuyo1eJPmmjbjpEgtNkDZSWheyRGF8Tr2V5sd?=
 =?us-ascii?Q?I7851WzCiziz0HtV5S1hzLxNYOmHS/cfU06IIgDNtkM0B/WPjuEtxvuDorHM?=
 =?us-ascii?Q?/eQNgDNwT7NMHtfEbCVEA4RUkqU5MnIm/aIGgx4MOsRquhrDRjzrr9V4txHk?=
 =?us-ascii?Q?rCeadXce2xLtGctF/Iy6jv+NpqPNTu+J6SI2R8bUtEXv/UgPzLo5oOh2bSEb?=
 =?us-ascii?Q?SDz+GU3GJy0DrNIzb54gaJQ6GwmuWiB0zdkJfGiEAceLJUvYxQVH+yOUWNA7?=
 =?us-ascii?Q?MWXKHccsuzEwT7ksN74YmAclmfrOz+9dLDQ743uk3yg+UtWvrMFF6LjgDoZ/?=
 =?us-ascii?Q?d7Xk1/lcMbnwdmhM1+quw7G5xva2HZeHuUvl0D0fJD7tnTx9PdXuUrpK2DIj?=
 =?us-ascii?Q?maSk141XXzF1OYAp3KC8rJ+ttrPwZxO/ZOS5e2nWckYTZe6LlCJswFx3zmuz?=
 =?us-ascii?Q?AzXnRg8LKBqxZDQ4tdgOcn7HlS4RykVRtzWi++gOp3iEGbiNuyhVUbwZhb49?=
 =?us-ascii?Q?DNANWhiMfn85hUoMcMOPVPQy99kuOk9OoT3vDuEinoha21/nU4AKGmd5D7Nw?=
 =?us-ascii?Q?jwoglMBiEEY19xLV2BvytX86xEh4aJMRQwW1FwLzMebBYXXBewRgAqrQjUk4?=
 =?us-ascii?Q?eeCoxNmem9MvjDijKaRiQYf2r/nf028mOdqk+e4LWbmFW5HBKly/tqKPuDWV?=
 =?us-ascii?Q?xh0mS3AuJmFLfGgFiQc6Tszg0UfLSKHetLTudSRyU/jYVkFjkwbjoCltzY41?=
 =?us-ascii?Q?PGAjVvH922oZex2Ygj5q/lsW+hacM+V+GQS35o7Bha+1vAv+mt788Fw5l/mT?=
 =?us-ascii?Q?KrfkF3g+vbbg78wMjLWgubm41zynsDhmiX7MA8gpXgjNJUP7VSU2E9Y7rKa7?=
 =?us-ascii?Q?9HHaCovRPJFKu0XsQ2H5LYnxmiEN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bc0949-ed5d-4768-6918-08d91c98d57c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 20:41:39.5860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kLpX2/xoZ9343Ns7KK0uhV2JemjVUkWomN3gljK1P1aP5/7tLVmKpEGbPllqpgmZdOGMpEvFmuqka9hPExpohA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4952
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
Cc: ckoenig.leichtzumerken@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Problem:
When device goes into sleep state due to prolonged
innactivity (e.g. BACO sleep) and then hot unplugged,
PCI core will try to wake up the device as part of
unplug process. Since the device is gone all HW
programming during rpm resume fails leading
to a bad SW state later during pci remove handling.

Fix:
Use a flag we use for PCIe error recovery to avoid
accessing registres. This allows to succefully complete
rpm resume sequence and finish pci remove.

v2: Renamed HW access block flag

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1081
Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index d8db5929cdd9..b9d221fcb66d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1555,6 +1555,11 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
 	if (!adev->runpm)
 		return -EINVAL;
 
+	/* Avoids registers access if device is physically gone */
+	if (!pci_device_is_present(adev->pdev))
+		adev->no_hw_access = true;
+
+
 	if (amdgpu_device_supports_px(drm_dev)) {
 		drm_dev->switch_power_state = DRM_SWITCH_POWER_CHANGING;
 
-- 
2.25.1

