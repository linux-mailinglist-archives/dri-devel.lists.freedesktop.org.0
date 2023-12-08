Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B55880A8F2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5E110EAC2;
	Fri,  8 Dec 2023 16:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2855610EAC2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 16:31:21 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B8FDFnI011468; Fri, 8 Dec 2023 16:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=+7kn1480RGW6VCPSIqFcm
 8JDYY+fbCoqndAwvZ1IGPA=; b=r6e/LW4sDHpdgEqfuB4qRT10Ea5eKlHBtUazz
 y0jZEyWgMZADftUdlp6PEmerCSBOCzUWzlSFQSAFfoGjUjldNgU8Nj+fzlcbRrha
 fo7eo+8On24vAC3QQb4FYSHmiytrDdgViRt5xxobQQesakBd8CBK37KvwTYLPM8C
 QtGVwKZ2n4796VEhQwZ8kNV3ThSvXZONzEVFotIexumx8MTaLGmAlJBhhRgAlZRK
 JfCEzHcJhHPCCq4gLkCmXcxxQpo1hIgVDYwXgLDmV5yqL9gG4R3Gs9DZqKt0a6gN
 XQ2hZ09uvBRg2gslImKTrZa919FfNAzvthDX5789JG9FHjgUw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3utd359xka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 08 Dec 2023 16:30:49 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 16:30:48 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 8 Dec 2023 16:30:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tl9MRziyigKQXM0PVlJtbn3MyrDPecQzxhcgGThD6Bj5iL9NSS+k7IHhKmiVp/Ohgfd67u90sSo8u5HtI+cmjoeK/1xlHyUMYj+5l2gStvurDcXLqsiHWDidm6W2BXugA9Re00uNCeiaYy4npTmPwYcYtVuvEuMhasJMcjtxTG/KftUA1BZVzwbme9f/TaBw/1bFUYQlCH5bQwTecwUSoer4aGa9AZONH+y+54QiA0cwydTf8DTNOlIklvqsyp0Z44TJ0vOelfyIOVVsefjtQwQ4s0sZbEU7lELvcURaBfC+ZpD9GWSs1xbQZGDSuWKxugQxJ5cSZ8QsC0qk2FLsug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7kn1480RGW6VCPSIqFcm8JDYY+fbCoqndAwvZ1IGPA=;
 b=clBrj4jiMoRnsrLjmiXM4HU750jX56RY0JCBve9grj6Hv9MLebKznk29BYcf1D+j2AdEjWAHs7x0a81hJ04pkwbbKwMXtqQpy/+RnOmGpnbFKAGjbr10cl3hLV18xUfvVSomH0ZRlQKN/D+w2tBteYOEJ5Gm6Vj6BB9gdG7P5PnMCbZRBATexmMblZL50SIMd4scHR/OyGAfUwJSLQ9O8AEPa7fYouOmBvcgc/JjV5DiW7M+UGAz3sU4qHWbaWYGRCKGWE5N1fz6oglkvWBwBSWdT23FvjZKUfdAsDS7QqTtLPj3TjSUPmxVRVP/KXvUp5PZtvL9K16cU5IYKETBwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7kn1480RGW6VCPSIqFcm8JDYY+fbCoqndAwvZ1IGPA=;
 b=KvLiXdqQxhABpgq25eii9nC9d5Hk1/seqRg4S7x47r+5YFG55Ixnd6fJCAKlvSf1okqtvXs6Y1Il96Qn2RPs+3hH36VfTDIZEkzdVs9NXI9bV+pH7Gv+ed4xy9D7ANTXHh5JeDvBSdHJZnv2ECnAfmWSO9HtUzur155mV9HmEFg=
Received: from LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:23c::11)
 by CWLP265MB6102.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:181::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 16:30:47 +0000
Received: from LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a3f5:aa1a:ff75:79a2]) by LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a3f5:aa1a:ff75:79a2%4]) with mapi id 15.20.7068.025; Fri, 8 Dec 2023
 16:30:47 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/imagination: Fixed oops when misusing ioctl
 CREATE_HWRT_DATASET
Date: Fri,  8 Dec 2023 16:30:19 +0000
Message-Id: <20231208163019.95913-1-donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::20) To LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:23c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB4600:EE_|CWLP265MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dac6a65-a628-4e57-c9db-08dbf80b0845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uyZDloV0i7lbqAyU+B3wgCgYjwEK38TrzTTwsGnUWW7ZWzu4wMfWNnuD8w5HlJhWiJ7Eq12sQABsM7yMX/a3qclh+VUfJZEaG7VCDB86g2eBxL1HatWxCoWj/4XLywZZNnUuQ6UbxG2n4+Fb9Ah9n/hFQvE77Uomy3+nv8sb7iYlrOMzPossR8gVa6qjgAE8z+fhd1+/OT3t6xEy1fTT8w3lkbJwe9NLKFB+n4NTZrvIfKfQ8iRC5Pxy9Ur2KBn4e/OkEMjl165e8D5IzdkNAuzqtueRR6uUYIIik6HpAWUE9hp7Jc1eh/awhBYHtLfaL9TG52MSzDm8efr+TYvLpIwm9SJhHn8yuyUJlRetqMf8UgI+1EmUBucHHNGhT8mb+l0zd353hXlqTyzno6qgu7j3ierS13V3iPB4+ResE7LSzzsJF9LYzPjamFuW+kH+/gIhrk2Q3ZCfPzMpsk7sDJQb+AUiKa5lM0kJSVUxIAj4gnCSP+dRshGzH4ECMa92Rd5WoGcfbR7wyIEq0AU6qZAexkzQyDbFX8KFJLNh8oQH/KtijsKqEeYA45G8JvljZTkznUUOypsdMEfCqPuZw3NnTStjLGhWEmwM7dQTunJPPGjo1aN3mfpVPVwoa3lr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39850400004)(366004)(396003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6512007)(8676002)(316002)(8936002)(4326008)(44832011)(86362001)(66476007)(6486002)(66556008)(66946007)(478600001)(36756003)(41300700001)(38350700005)(2906002)(5660300002)(38100700002)(1076003)(26005)(6666004)(52116002)(6506007)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sx4jlMVNcNsPSjZkI3HMrjEXNZtGsJtxrwTHShidotEPrOplvUf9QmD4qATW?=
 =?us-ascii?Q?CWnwgRU+eZlFc2CUKTmTvCA3YTvleYTZLUXNf9m8LfPcKSjWGDTRa7bh6qs8?=
 =?us-ascii?Q?qulHTQUtw2Xek8sNX5BCQevWMYz5gMv7B80FIy6Z1BCSPNEHxJlgsm4RmCk9?=
 =?us-ascii?Q?ryp/3Acw0xUxcseJsetqAJPOTkZn6pT49xLPFDTR1pUN7TodRI2j1Y+6xif3?=
 =?us-ascii?Q?tVW8xohsA6ooLinsAaPWhVVwcthdaJZrCyu0qYuzSDWqE/6PGjhS3xNqD5Z1?=
 =?us-ascii?Q?ncCvlnASiO9MnrTM3TkwF9c2l8BJSSflaLK7qjgOVGueL1TO+EZ4bVRf+PjU?=
 =?us-ascii?Q?VfALonsWD5gO5qrY/LA9z1gN9wM5e31a1GPBZVq+uktAlJjvHhKMbpToO496?=
 =?us-ascii?Q?gxLIEpxxvGJ1TswaKB3TIGfl22EIo+KlrpsepY3peR0Y9TqCDqwda1Jc7W6e?=
 =?us-ascii?Q?IH9eZQMu0jhlESixblo/mmRm9QVk1GFZD11/QrvOfzN4DpA8MmahdIFJzM5w?=
 =?us-ascii?Q?qsaEZa3BB4UZHyW7KpDK70XtEs0mxSfhhUIAKhWzfMY7Ugx29/6jXtMI8PKE?=
 =?us-ascii?Q?6IqI8zQ09WZLApijzCQ6VV9bu+ijuL0IIlS64BKIQcJ2opmTFY26mfrjHtD1?=
 =?us-ascii?Q?T/+NiHws/ZzIkApXMlIRCvFPilb0ttPjhKgo1iMWrhwQ1J8op444y/HzxFqM?=
 =?us-ascii?Q?V4FLy/5ov6bFdbq7ayRSm7dKHhq3jMsE1f/xY69nDGx6fvFrXtUOTUVHowXo?=
 =?us-ascii?Q?nvwUPLrZVf1YTGx+HnAtMFD3qyFEhlYAYdsOcn5oHwZAxeTWwmWkmsyAlav6?=
 =?us-ascii?Q?vjWBc+YGtPNxz/x1rMuXNVPg+WKtSHg2ZiepxS3TVm/2ZG3A0rQdyhgk0mPe?=
 =?us-ascii?Q?/lbO5ZPuhiGULg6vI/4SaGL8EEv6fHFT40+4XLFZ4CmFyR2tP1ZQi8JvLvKy?=
 =?us-ascii?Q?moh2fpdpxAmY/KWWYCaJK619uCJVYOu1fpWB19u+8E4wmjvU8e51sdQbrJxM?=
 =?us-ascii?Q?ZWfGz96Yb96S+ShwONKtHPXH1UQI8Y7qcbEYedZs4BS+MpZXqLSV/WYYI0LT?=
 =?us-ascii?Q?fkeNFzeeegqw2w/SPBtYlbgBL93ABlRPZxUgfnyIzFKyao/dDum+q/BwCNIl?=
 =?us-ascii?Q?ztdAQx8okSXhTOY4HwEyN8E1GMwz9TnRudY6D897MmMDym0nEn4OnHv7DhEX?=
 =?us-ascii?Q?n7Hxj6uRpmUWBtKUx9YHaksAt556X99PzGFaEch5Xo1Ekb8c4mg961fcRsOb?=
 =?us-ascii?Q?PJ+YMmW9h7HttUA/qk2uwyBci2dhsljWwdtavwfBgfXK3WFYcokAY5pnd0vC?=
 =?us-ascii?Q?86HY1qnT02Jkm29pqvo2d7KUqDaSgVbrrZ/lW7KrURAm61KWbdaZDEXgY+8t?=
 =?us-ascii?Q?8ax1FHVJ7/Op3k25XXomUI6ZMuVANLKlNv3L52oi1FSzcYbRovEDXRVUnIso?=
 =?us-ascii?Q?mPOYbblCOL8i1cHi6eZcVj3MPk2jCnWujbdpLXbj1okF1bcmKOrQlFh4sn0L?=
 =?us-ascii?Q?NrhlpqLaCRyamU5G8oR+NBtt2s0vmgWGyWdsKEMaTd0sgXjc1dndgKXUv8uD?=
 =?us-ascii?Q?9tSrsm8CDtMBkhkgwjo4/WINmxzTYV6U36u6DPUihv5TeeK6LEWD9vNXnT6q?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dac6a65-a628-4e57-c9db-08dbf80b0845
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 16:30:47.1292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VxEd1755un8LFpdxUmMSy1KgddrTJZo4rmMViRrREB5YzhGsHmHSgVD1KM5eL8bVnpydvhNDBlneJ/m8wxZJFsr5VacXIegAPes8T/sly0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6102
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: Rc1aDK3cqQyp8_dyUOAc9yXl_F8Em3xu
X-Proofpoint-GUID: Rc1aDK3cqQyp8_dyUOAc9yXl_F8Em3xu
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
Cc: mripard@kernel.org, matt.coster@imgtec.com, donald.robson@imgtec.com,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While writing the matching IGT suite I discovered that it's possible to
cause a kernel oops when using DRM_IOCTL_PVR_CREATE_HWRT_DATASET when
the call to hwrt_init_common_fw_structure() fails.

Use an unwind-type error path to avoid cleaning up the object using the
the release function before it is fully resolved.

Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_hwrt.c | 27 +++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_hwrt.c b/drivers/gpu/drm/imagination/pvr_hwrt.c
index c4213c18489e..54f88d6c01e5 100644
--- a/drivers/gpu/drm/imagination/pvr_hwrt.c
+++ b/drivers/gpu/drm/imagination/pvr_hwrt.c
@@ -458,7 +458,7 @@ pvr_hwrt_dataset_create(struct pvr_file *pvr_file,
 			struct drm_pvr_ioctl_create_hwrt_dataset_args *args)
 {
 	struct pvr_hwrt_dataset *hwrt;
-	int err;
+	int err, i = 0;
 
 	/* Create and fill out the kernel structure */
 	hwrt = kzalloc(sizeof(*hwrt), GFP_KERNEL);
@@ -466,35 +466,36 @@ pvr_hwrt_dataset_create(struct pvr_file *pvr_file,
 	if (!hwrt)
 		return ERR_PTR(-ENOMEM);
 
-	kref_init(&hwrt->ref_count);
-
 	err = hwrt_init_kernel_structure(pvr_file, args, hwrt);
 	if (err < 0)
 		goto err_free;
 
 	err = hwrt_init_common_fw_structure(pvr_file, args, hwrt);
 	if (err < 0)
-		goto err_free;
+		goto err_fini_kernel_structure;
 
-	for (int i = 0; i < ARRAY_SIZE(hwrt->data); i++) {
+	for (; i < ARRAY_SIZE(hwrt->data); i++) {
 		err = hwrt_data_init_fw_structure(pvr_file, hwrt, args,
 						  &args->rt_data_args[i],
 						  &hwrt->data[i]);
-		if (err < 0) {
-			i--;
-			/* Destroy already created structures. */
-			for (; i >= 0; i--)
-				hwrt_data_fini_fw_structure(hwrt, i);
-			goto err_free;
-		}
+		if (err < 0)
+			goto err_fini_data_structures;
 
 		hwrt->data[i].hwrt_dataset = hwrt;
 	}
 
+	kref_init(&hwrt->ref_count);
 	return hwrt;
 
+err_fini_data_structures:
+	while (--i >= 0)
+		hwrt_data_fini_fw_structure(hwrt, i);
+
+err_fini_kernel_structure:
+	hwrt_fini_kernel_structure(hwrt);
+
 err_free:
-	pvr_hwrt_dataset_put(hwrt);
+	kfree(hwrt);
 
 	return ERR_PTR(err);
 }
-- 
2.25.1

