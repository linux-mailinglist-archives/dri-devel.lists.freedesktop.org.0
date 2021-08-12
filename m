Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A243E9E9F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 08:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060F76E2DC;
	Thu, 12 Aug 2021 06:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9355F6E1FB;
 Thu, 12 Aug 2021 06:31:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXBW1NXUBoZVQv1IY3JYEy9QetubdreVd4S6En5Lw4xs+3MKwnozJILedUXB2EYf9YfPR4ibOvZ9LlAGF/avhnc4UGGpkF/aptJG7iorFDvCrTM3zgJr5z52pz0ddjnXbYMO5Gm/TmFj9VyAPMcK0YzzQlwSGXlBSDczs+pOuC6j+dqlOn6Nv6tesZX9LRBbptBRIo1Ye5aj+DojZe4F9qI5c3FV+UmGrfDbfGjgWvFn5GNcyrEIRv3zXP8UvJTGoieEbSFYm0t6+vGkQrkU+rb4s0WPNpDEflPxe0o1gmiJZRCr10WaDMXZMr+2lDPKmWgWjjmVOa9u8od7z0MJdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JYNbIZyT4GsemXLmS0c1O12FNYR+CKGj4BBJeppL5Q=;
 b=Et5NpZNp6baPuoO1eo3/+HoNUaFi1qAFbcizlX1n3SsFAG7F7tIAdZ10BOx4j9wIgV3vd73lgMRMZ9/GCPOEO2kSK2UQfZAJ2W1iiXLinAE2p0ZEL52Aeaef77PSZfo3AEvyC1V8lk2/LqxEEJ/g/LKUuv78SzsNwRUBDl1IIDRekYLFhbzenF9tD005r66+8urK5rmVvhtjHW+CQrTmzbZhSMGBfBPdKEMi7Ol+X7IWomElD0kLJJQ6b1XXEKn2XuJ6y/oOZaGRR9y5+I9dlieym9tBxLHLITzKxixxROKE/ADFdyoCp7qYV5tuaO/B843T4yFfxH9kJvzl6ekNNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JYNbIZyT4GsemXLmS0c1O12FNYR+CKGj4BBJeppL5Q=;
 b=W5t7Tfju5mavhj1U2HXUYuU2qDZoLSx3m7KYTy9MNpcG/N0QL3Q55vyoMJHuHiH1GTemT/NUCKBzw3rc2Y1LP7OHWaC1sfbmT50tWLsmV+CBK3ZAKgVPTlLjXw7P1Dm3X7k3Hv9EkcUJZf93+wFs8+kgAjo8FtBh9Asq1iG4jqk=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN1PR12MB2448.namprd12.prod.outlook.com (2603:10b6:802:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Thu, 12 Aug
 2021 06:31:25 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 06:31:25 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v5 09/13] lib: test_hmm add ioctl to get zone device type
Date: Thu, 12 Aug 2021 01:30:56 -0500
Message-Id: <20210812063100.31997-10-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210812063100.31997-1-alex.sierra@amd.com>
References: <20210812063100.31997-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR18CA0026.namprd18.prod.outlook.com
 (2603:10b6:806:f3::18) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR18CA0026.namprd18.prod.outlook.com (2603:10b6:806:f3::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.17 via Frontend Transport; Thu, 12 Aug 2021 06:31:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f273485-be94-4762-106f-08d95d5acf39
X-MS-TrafficTypeDiagnostic: SN1PR12MB2448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2448857460FFF2EA02361D1EFDF99@SN1PR12MB2448.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /PbL72d9snV/S9kCgd1XEIgwHDVafD7+zf+IUQNDYm1czKMkgulr9/r5G7P7fA7ftRcdC30lOGpVmthUL3zQaGH4K3Cgmg1QYt+BLKfp5wdVaWozf42IP1ZC056x8yc8O+p9VZ/p/lq9x0lwJMPs27NYpQJN8mIRJb52Twz5+TuLgKd+EA556ePXJSdW/3w2514nz307CqiENlQ76NFiWWNhIJ5Br4fjiYu9sHuMUZMNFTtdFsyKZBms/9SZq6b+N+EYUBvITtLAQvS8PaeRsFkXTS8tJKs2Kuu/yG17hS6ILLir5xaFA6ktJi9PHUDSA0YjuO01cJ33sfbTmUWiv6yYqIdWcXtEGkUt9ebUmKe51ywatqmZP3fHGCQB4EDmPrO5OgyuHvwn9xUQeSenGuQkXxuVabUnKD0Xh2+JNTck8CMXmEh3P2zpfL70kJs65c1lO4mgCghAjlTE1f9Xyg2YoS8MG0Ros51cQDlOjlCWOOeBBfIyx+qOmy0Mk2yAZmzprXdAqNkblX3xcNYBlFpkcJvK98VgwVTfKr3gd+PRF1dduY/czuUI57CvBQu+L87vJXNcZnBbC+JdfG3zGm6ShVJjQ46Ijw6KKdsx3+BiYLldzWEjoTWAJ9LExwzT21alJerrQpVA5S6MSRQDfMCLd4k2S6ni84EldueFdFW6uzQ2aDRle1tuzq0GHlzL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(38350700002)(6666004)(186003)(66556008)(66946007)(2616005)(478600001)(83380400001)(38100700002)(8676002)(26005)(44832011)(2906002)(66476007)(956004)(52116002)(7416002)(1076003)(4326008)(86362001)(36756003)(6486002)(8936002)(5660300002)(316002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J9vZEI2f/bSXkMt8lE3+xSx1n6w89cIXFPeXBzXrI90q1qBsqrSQ8QgczYnm?=
 =?us-ascii?Q?ebPmBYggX04oKlZWQE+8AOQGYQW5QnuyxGFaFEmYzb96mEquOQKip3h5rDro?=
 =?us-ascii?Q?lvzCRJPOU35nmVRLICXJq9w4XWjeDYETBx2qu2EBM77uQKRbJNMVGXsSOzQ9?=
 =?us-ascii?Q?mTGwp+hVMOm+DUC2lWeo3kp0vV4OscJG9MINhdfIk5rfIFAdM/czt+sF60u4?=
 =?us-ascii?Q?Zs7DrT6jrGR0hnvmTwTt6SC9IRMrhtHIrWvodsV71XBuchORTP95RSpiYOAh?=
 =?us-ascii?Q?3aTdePiwss+OFqYYYSkd4r+5B85UlQ2KVH1jqmIkh/obl5YJaq4GihnAW3OC?=
 =?us-ascii?Q?D93CKoqjzIAAFlJwbyJphcbVx4X+EoUsMhDpj7QnOfIpQFAGtiQPf1J2eItP?=
 =?us-ascii?Q?G5vcQuwU/w7smf944/yeNHvBYm0vZ5I9n+vX8MVq8v51hsP4Wd137K5Q9MXJ?=
 =?us-ascii?Q?n1T89z2bQNPGmXdl2OUjrvMM8ehNvcXHwxa/2/GbenWvH+er0o+PCUY1cKlw?=
 =?us-ascii?Q?A6QkBADYVKMsZxO3eap+m6FjFPCk2DW9lLPHo/c0rGdtW0yjv5wuI2sWIewv?=
 =?us-ascii?Q?DyM0KHLMaL3WGLE152wp+eBWd9WWCDJpNorhCvRSqJGFQGhuCF5b7ifBe0i0?=
 =?us-ascii?Q?gbRyVncgyHtbQZM1o5vKA+5h61e6dnwhZ6scgo3Y5AyfHPgicJORgqhlwP+r?=
 =?us-ascii?Q?koR9MWyyrc4sNNRBVc5gpXpmnTTIFDH/rDj5/ORUi+AvHJ/hJ7uXb6a0DcpM?=
 =?us-ascii?Q?Cz1RTJ1w6S0Ph3BhGKNaFTRVXKvoJhCgjjvGv4u6sxt4ORCqdA8iMNx5VsI5?=
 =?us-ascii?Q?wmDk3JP8NR1otK9feX3HsVyhbt19spZmShyYUc7UeUiMLXehc9mSMYOTVGkD?=
 =?us-ascii?Q?95f1KRrcI0czRTS8MlKR1AecAARoYDkM3hD5YSqEh6o162QJ9liD1h2J7gOT?=
 =?us-ascii?Q?IdKohC1+NMp72hXD/mI2EsfrHhHrg9RC+9P7D97RpKjwRy5hFHg9M7Nfw2wd?=
 =?us-ascii?Q?OG+M/8Uh0nVYxueN/5MJTHc2rYMJpWyXVgv1WMOaopxtuFoBrzv0S9Flt6Mq?=
 =?us-ascii?Q?t1Wq0NKSWaCZ/XKAxDqBojeZOvu7lwpuB7wYSMOGM7JxSZOyQjVqII2OYuGQ?=
 =?us-ascii?Q?6MBMpHBAJdH7156X0ewmWCqEvHvsXtCDnJaW+E/sdl5Kb3M8yQybaGce0x4q?=
 =?us-ascii?Q?SrIrjtpoiaDN8YfJWiRWPL7OYmnD6EFyH6bzi1dVNsYQIOoaMY+A5ZdijdXz?=
 =?us-ascii?Q?PyPN/fMPS0L/mo9dARh1/4J8HjHPgO72IQ65oVCF1uqjYbB2hHEcYFLohaQA?=
 =?us-ascii?Q?r/952kaH4bUMjU08XZ8wNflX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f273485-be94-4762-106f-08d95d5acf39
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 06:31:25.5943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nd1p0qoCZFgifYLU80V7+wD1yc3j6HOaHe0R6utkozNZfd55Ke6/v5yrZJ/BRU+Z2eNXlN9XwrR76VOmOHvgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2448
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

new ioctl cmd added to query zone device type. This will be
used once the test_hmm adds zone device generic type.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 lib/test_hmm.c      | 15 ++++++++++++++-
 lib/test_hmm_uapi.h |  7 +++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 6998f10350ea..3cd91ca31dd7 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -82,6 +82,7 @@ struct dmirror_chunk {
 struct dmirror_device {
 	struct cdev		cdevice;
 	struct hmm_devmem	*devmem;
+	unsigned int            zone_device_type;
 
 	unsigned int		devmem_capacity;
 	unsigned int		devmem_count;
@@ -468,6 +469,7 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
 	if (IS_ERR(res))
 		goto err_devmem;
 
+	mdevice->zone_device_type = HMM_DMIRROR_MEMORY_DEVICE_PRIVATE;
 	devmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
 	devmem->pagemap.range.start = res->start;
 	devmem->pagemap.range.end = res->end;
@@ -912,6 +914,15 @@ static int dmirror_snapshot(struct dmirror *dmirror,
 	return ret;
 }
 
+static int dmirror_get_device_type(struct dmirror *dmirror,
+			    struct hmm_dmirror_cmd *cmd)
+{
+	mutex_lock(&dmirror->mutex);
+	cmd->zone_device_type = dmirror->mdevice->zone_device_type;
+	mutex_unlock(&dmirror->mutex);
+
+	return 0;
+}
 static long dmirror_fops_unlocked_ioctl(struct file *filp,
 					unsigned int command,
 					unsigned long arg)
@@ -952,7 +963,9 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 	case HMM_DMIRROR_SNAPSHOT:
 		ret = dmirror_snapshot(dmirror, &cmd);
 		break;
-
+	case HMM_DMIRROR_GET_MEM_DEV_TYPE:
+		ret = dmirror_get_device_type(dmirror, &cmd);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index 670b4ef2a5b6..ee88701793d5 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -26,6 +26,7 @@ struct hmm_dmirror_cmd {
 	__u64		npages;
 	__u64		cpages;
 	__u64		faults;
+	__u64		zone_device_type;
 };
 
 /* Expose the address space of the calling process through hmm device file */
@@ -33,6 +34,7 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_WRITE		_IOWR('H', 0x01, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_MIGRATE		_IOWR('H', 0x02, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_SNAPSHOT		_IOWR('H', 0x03, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_GET_MEM_DEV_TYPE	_IOWR('H', 0x04, struct hmm_dmirror_cmd)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
@@ -60,4 +62,9 @@ enum {
 	HMM_DMIRROR_PROT_DEV_PRIVATE_REMOTE	= 0x30,
 };
 
+enum {
+	/* 0 is reserved to catch uninitialized type fields */
+	HMM_DMIRROR_MEMORY_DEVICE_PRIVATE = 1,
+};
+
 #endif /* _LIB_TEST_HMM_UAPI_H */
-- 
2.32.0

