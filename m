Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8850B3F6E0C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 06:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1DE6E12B;
	Wed, 25 Aug 2021 04:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E2C6E128;
 Wed, 25 Aug 2021 04:04:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IB608qQQ2oHFXA41Piarh67jaRAxnVZITyPW8wRjcUkwagXwgiwB0IfN4pxv2TIOxaLd0E98w+ll9GhG0E1D5EsaFlOWiru2widxXgQ+t5EIJBizz2hqjqMFeLUr6ic+Cnu5ppmTsKN8KAgV+CZl2GwBcaBZoJuHQ+r7h/jPNoa5IxL3zUE2nGA6LAAJKNYorN0mJ2wa3q3U/dZW/17r/odbr1J0Qp/6ZAPSO3h4Z0zzEeXxunUSYN28RfxHLhey+IiKIqzDFV4zwB7Uy+ZsVZLVfWpIyq5lG0unwUjrV6k8iIx+L7BPt2/E1gorNSTCCLUulJxxlHuEscN7LmeYFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKC0SDJcXNMoavar9nuqOgDG5SsEzpi3aevSualtrlA=;
 b=lZIOsYZCU35u21/0BuOJ4CRscCWRl4T6Yzdvp1FvB5TXQS/huyW/4yaVdNFac7iTl49L+iPzf/0zQ6Y8yZEGncu1DEjfreosHZNtd5x7Fk8JRfa0kGhojRBCHvUVzmpYbqpL5TJRsP0hlW2v4cUJekNoGoOHuSEeBzIc75+ngv+/N10BQmGOB/oZ9y0sLXqVm1hxWU7bdHxBoiPWPsyAM6bEe1NwgduQP0Szk9YRGYgY68AacX4HEdDTHXEJgCtByO/11WBxpufHZ0hsIKHIOSYwwJkEwKXdaa+zIcUilnKn9xT4Q0qszEGElCRiDU4HQPtgK1KFsNl/LXyezF18zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKC0SDJcXNMoavar9nuqOgDG5SsEzpi3aevSualtrlA=;
 b=kTKiZIyXqnP/D1MHpiS76QwPH882afenwMxQE8tOLPQm+iqWKEW1jrptYzX2YNaG/RhLP3HpNfltJC0/rS2EVvkD5wkAXs2kLyUSFizel6nyYkjUs+51damymApLnS+4lrHfSgTdtfafskVHVtf5YcMYFCg+TgBh9aEVbUnJP+g=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4750.namprd12.prod.outlook.com (2603:10b6:805:e3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 03:48:49 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::855b:1f8c:c5d1:331f%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 03:48:49 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v1 10/14] lib: test_hmm add ioctl to get zone device type
Date: Tue, 24 Aug 2021 22:48:24 -0500
Message-Id: <20210825034828.12927-11-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210825034828.12927-1-alex.sierra@amd.com>
References: <20210825034828.12927-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:806:126::15) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN7PR04CA0190.namprd04.prod.outlook.com (2603:10b6:806:126::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Wed, 25 Aug 2021 03:48:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76d43493-cdcd-4104-03e8-08d9677b3f60
X-MS-TrafficTypeDiagnostic: SN6PR12MB4750:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4750E66EB072904092F993E3FDC69@SN6PR12MB4750.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uZG1WW8EFQD1gmOKU3aPWLNOinci1PXViln1JQO1U3Iknq8blW2Y5DtlDsDxxRzyLrAH25L0i3cSg3RYu47Pa0oZjAypZoIIRVkXcXzcz5YfqZ81gKyTDu/QbMufZRYyngZ4oQPPaF6juxf1BB2EuzgFNdqECNg6nmftLKOW654z3V9N2i6gG4+q+IK4rUDYhUWR57anmlEN263N7JAQiUUNyHfLSETBCa9JZE7FpUNUyxB/Rq/S66fjSFS/ej5bFXfp+p28oWP7e15ikg9/21uBrvqbjtgANH961lWhDaQM+swprIc3N0+S1seU9goPwlSOUdiHBbn9t+kdmcfmP3Njrc3n/ydbkJyhyjfhztBCxbqbGjMNNjXQHR+Cm+kpL9TXM3eHwdzJdm0IpXPvkGi4AVd5KYhoKXpHi/+6hAXiV8B1zjQ8C26zeWt2r8Tq0oQfOOLhjOyDLXYUh/Tz5NTvcil3rLynbhT0TKzM2HJqJVCsLwTfrGRznHswYcJoSYB72PeHmkkfKquiTY5pJ32GqR8MpObwfDO3OiLaPztdOj2s5E8og5O22hBg9/eDychg1wGtxv0z98aIcelGfIvhYpDBxU/dfZy+Vxro2XhjMeAZ8iCMrzJafpMrKEnI95NUngeqbbuiTiskKwkTfnDYkWGuI+uco0wYCMnMi5dkPHAJvIwIGFFisL6SP+aT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(7416002)(6486002)(1076003)(4326008)(86362001)(7696005)(44832011)(52116002)(186003)(2616005)(956004)(38350700002)(38100700002)(478600001)(66476007)(66556008)(6666004)(316002)(26005)(36756003)(8936002)(5660300002)(8676002)(66946007)(83380400001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tXjEeyCvcC5jsUwzCM8YUBB/zI6M8yyhcZlrekQxjEZYBM+hif73/BIFy0eR?=
 =?us-ascii?Q?2CjTgC/uyEIWbmS3chtJCN6c++GOM17sxXzSMuWVXbhvySMlKa38WLLDGTc+?=
 =?us-ascii?Q?HXtjm8Us19KCuWViX91HbSVlEP95MC+DAFeAOinEgKewYH5PIVj4FlUqKn/M?=
 =?us-ascii?Q?/5At1TfMD+rS5yu4iZRJri8LAoDUSZzXmd3+XiTnmQHl7bu2djtQV1WtEI2h?=
 =?us-ascii?Q?S6IP7GcW/1/oFuxmfnLuM5eCiDvsTOAS9Y3uwrSRCZe7ZVV8qlFGXuEMYng0?=
 =?us-ascii?Q?jtr5UDnN6uZBJjfOCgldRU7At+SqBz4Qf4CEllTdRXtGJr2EB4DTZ5ugWMiQ?=
 =?us-ascii?Q?2gKNCk4wj4IQ/X0uNZQ+Low870LzGPAYbiAivEAYiwZq8/K+JqOcNzThw3Nr?=
 =?us-ascii?Q?BCMobdLsWJdcAYmLp6jG3BHttO2Z7tpzBXOJmRAZ01LajbFICYZNHE8MolPF?=
 =?us-ascii?Q?cH22dsdUd+Q4R3Hb4i5Gm3U21Vn8FYCMIB2wDwe3j8qh8MHcTTd00Q09VN/D?=
 =?us-ascii?Q?JoacTnI31LlQpQtaxhgXczmmXeZwWVfua/DJhDHRhhjS4oLp8qA8G/6tjDPb?=
 =?us-ascii?Q?/mv0ObYrapvAqnCSeITe708U9ELC7ksHEZkA1nkFt+BC82l9OxKNvtP4JW8F?=
 =?us-ascii?Q?CezSowfPVCro3Ay25vyq/o3EFOI017qLBbsPD4zSTNzSCBv7JBFaurzU39ib?=
 =?us-ascii?Q?RK4iQJAWwMBAs346y5wImITFSNMCWCXON9wAmDFKe5xWQpYNWC9wMj1m/8vw?=
 =?us-ascii?Q?ZnabTUy0UbiZ/wlD6kEvFrQUcODUQfJ4bli8NmMuVpeeLbYg2Nykkokce5mm?=
 =?us-ascii?Q?BXg8/l38z/DdQF86GLde7Kvv5Qm81hyQhhJETcJ3eeKj67c/0hIuhAmQeuWF?=
 =?us-ascii?Q?8rrqYsi8DVS6Zx5/axcwDm3puzNWHk264wdpC5jyfRVkZuOo3OXchgKTjXOs?=
 =?us-ascii?Q?vH3S9QXlf4wKynQgYXW4kwhKd85vYHQXiGwx5e4VwJaIZQxzd7w+acGEvWE9?=
 =?us-ascii?Q?lGHEMKNpgM6zmwgUscH+QDcWFSIzzxmIbIslOHetO+aRtjFQp7VCfGsK9tVE?=
 =?us-ascii?Q?5AjIL/PbQL03mo0+yYfN7jZAYXoPjSAQLmPeH8R3NsYC6FJad80nBut7l7SK?=
 =?us-ascii?Q?lAFtRDZrynP2ZC+2hIhUoc2xvWerPMNXoUjfOZtaCE05mZOo5ZYvoJoJ1KPw?=
 =?us-ascii?Q?v9hWAxnMe+d3TB3hvaCXMGsz5kk6QvTIjogmYgrGVwADOrw+WzIeD9fy+8/D?=
 =?us-ascii?Q?2exMj6EOelknUTf4v3smQgd7t0zwiUsRnlXbtdj2zR2f1mCDBDLDQly98p3T?=
 =?us-ascii?Q?Ubia5wH1bDLeNHjmtW3HT2CT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d43493-cdcd-4104-03e8-08d9677b3f60
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 03:48:49.3213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grfDI+SGhprsx2Ga6IW6YKQunPPrQiPSlF2xLECRybZrqWJMc10xrSiUnPeHbPaSFYBz3rmVeun7RLQ27wE4hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4750
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
used once the test_hmm adds zone device public type.

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

