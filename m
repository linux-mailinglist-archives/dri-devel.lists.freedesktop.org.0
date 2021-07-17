Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22DD3CC5CA
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 21:22:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F251F6EAB2;
	Sat, 17 Jul 2021 19:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7167F6EAA3;
 Sat, 17 Jul 2021 19:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ck1XYBAwg49OuSsqLxQBMe7cjklBJsIGR9gywgVasnAPDk9eWDLS8bljbdq7cJmMX9Js5ACuR/DfNxGnykjRy7eTiZxHR0RXW8XfgqFFKG8LrB/z/Fugl1aUgN6Aw7A+bZWM2hiw/tUJXJt/zFEB6/cQu7lCeP3+2Ztcct8EYl0FroIVZ1dijDSSPrSChdAnHcwvtu+5NAMwbrjxQqSKUvqIUCHRuWbSmTg/akErvWWHSoFCwdnOrZxGPl+WF4mXrx0gUp7aIqUai8fiIEC/cct/ugaVFCfLjXcJqBtu1ELI9EM+ZWSz+P/a6AndYDEeMiGSywml1vgmwTd3DDZ94A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JYNbIZyT4GsemXLmS0c1O12FNYR+CKGj4BBJeppL5Q=;
 b=MF2XcKWBIWRdX94oJGlDH4TvjaYotr78tCc9zwhViYo5k/mm+vYgmnlnXWELqNoVhutxL5utJmF0OQqwUrXvOrKn2O50KBUcdCZxNa1inOo8l9dYfbtUR52f7irCFNq9uUPLclnkph19bPXTo7sgyA8v3cH8Fb4fUkDf6xdbUofJq7khPFAdY3hpPDHElu9HG+IUOk7fgQ1f918voAX1qBSgbcvzZ6UPZhk9Shqam4SpX7kKgQuQP+jYCDist4mxSBdgPEYfs0GCybr7f/nxmSQ+YEnwEFsUditPZKYl4/e8agGJba/7O16TkaYYTPhrgh+FWLrPpEeDECCN7VqonQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JYNbIZyT4GsemXLmS0c1O12FNYR+CKGj4BBJeppL5Q=;
 b=kfY9Qmf02zxLbPe+TpHwd6/NZ+mQC6YZdr8HfKNBaDx5Ec2P0gWzX+PHqJF0VZFw5KFly0W3bim72evknBEQh5DEKnQIW2eZJJyXsbNtwbpeR9HiHlQ0aMIVXNCf9VADu0npEGjg5SVe/gvdpQp/ATWuf++NUrfwY8j0+GvQvgs=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB4670.namprd12.prod.outlook.com (2603:10b6:805:11::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Sat, 17 Jul
 2021 19:21:57 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::d0d3:a97e:6b7f:ab39%7]) with mapi id 15.20.4331.029; Sat, 17 Jul 2021
 19:21:57 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v4 09/13] lib: test_hmm add ioctl to get zone device type
Date: Sat, 17 Jul 2021 14:21:31 -0500
Message-Id: <20210717192135.9030-10-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717192135.9030-1-alex.sierra@amd.com>
References: <20210717192135.9030-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0067.namprd02.prod.outlook.com
 (2603:10b6:803:20::29) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SN4PR0201CA0067.namprd02.prod.outlook.com (2603:10b6:803:20::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Sat, 17 Jul 2021 19:21:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 165330f9-1a02-495d-ae74-08d949582196
X-MS-TrafficTypeDiagnostic: SN6PR12MB4670:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB46702276C13B45533CCF6888FD109@SN6PR12MB4670.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /xRhQnbRTtfHiTppS8Fm42b3Z46DPZJtx8T81K6qE9s0yjhQrmxh5zO3WzpXHuqYRNJ5hvU2mwgu4iKO88/J2KpkmTZY2JcA5WqgCROXspXCLIrppxmdcfDzrTbXwaFL09RacKUtYl1S1AOr7d9wXdvujryIcWE3KB8BGdvao5KDwasFGq2XIKAN17iFlYAQywF+hV2S/2v/hOKYRKoiVxcz+e7lLLt6VY5AHe2Vd0RMS9fDaBQVoCrw1MdpK+hqZRjcz5jmn0T6WEvYerHYQwDc6GjIslJDVYE31A1kG4ST/KlYp1CSNESWSiBTzB0LFgy+QR5c6FIuIASvuc6mBuAW1n9/Qe+TYHN9WY9snqP8obB5hra7Sr4Ak8BeyrHgVKEv6xN3ootFG+M76KO7WbSe+MjvH9VQWJMmoqvQ+pd1/zHUUShOJGOuVLcDLbIBIvk3V1FIl1AajL66x0mo4iFKZeO7Ydrx+A+gdsS7dQVEHasXP5Vsr0aaCZhucQgAAJMmZv+i1mIrPA6NxEJzsAeufiNdIfhk6dbvytsQf06jEoHQzUV9aiVFiiywKhGM7HYceoPYm/Lzm49wJdenASkHQZgLw5bMZmBuiMELYlMTsoALNC1TRCmfvLKPDxpkUFZVjL2K0u1NHKgYzi8OTaDVRRXRiN2ywcO9RrtujG25oB/UIwt5VqPcp6hy6Hhm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(2616005)(26005)(5660300002)(2906002)(7696005)(7416002)(1076003)(4326008)(6486002)(6666004)(186003)(8676002)(956004)(66946007)(86362001)(316002)(36756003)(44832011)(8936002)(38350700002)(38100700002)(66476007)(83380400001)(508600001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZfW8EcFVP0UL5b/1qQlIxzHb5M16wwycv8Fbfsszzn8fXyknHToLs8/yfklg?=
 =?us-ascii?Q?NRYgpYehb+buZN22XUYafRsvKoT0toznxfhqpof3vD9odSjm+WqTA3LahrsX?=
 =?us-ascii?Q?xUuejjeDO/mQ7WeCSmldTOZ2xtD0Y5LuJeiGwt26KbgkQ87C3gD8ORilAeSZ?=
 =?us-ascii?Q?EV6KhpBb+eaVEM9rglxx78yRYNsUj+PzGcRKUPnn49u31z4LTTAvzwFccaEG?=
 =?us-ascii?Q?n5mGK4X1wj1DYmhxyZOR40JX+WvKtWO/+1S8lSUlXPH2ZN9yaheypTYYBPcm?=
 =?us-ascii?Q?fsVPnc2Dzu0cl7vux2tZfIbvXd0WcCawoVG6ABhj1C3EzSIkbsrLzXFoHcjY?=
 =?us-ascii?Q?+qG3gtKhX0fd1grz0Z9GP6oth2rgnybhS8JRLPCJLl0d4hQR8GsZcMp/6mig?=
 =?us-ascii?Q?Hm5lOgYCl971uFZx6CBGk2PcDvqC3vF5JOjHgS3y0JUFZY+P9LuLTKdS8xpU?=
 =?us-ascii?Q?pZgviLnTKvUV/Ne8JzKtevNMBe+GeDaQx/Gl5jeawqp2Omfwyu4tLyy/ss1U?=
 =?us-ascii?Q?v/LFCjKHg6STetRzIhCeyOEHNdpKfNLRuR3/KhPFOgxC1TiY3acLRH6LmMSG?=
 =?us-ascii?Q?g+eqaxdU4aKSQ6lNaBinCVIpq85dk+AtiAEwrtm/IZ0V/Sd0uj4JfWbPlPn3?=
 =?us-ascii?Q?vjT4m2NezuBt77zl4WYcUNwW0LpG6kv1tvpeyU72qPJMx+gbGbGsTiQUmqSF?=
 =?us-ascii?Q?7+lcrSNJbNhqOCLfN4lRjDuS9lyWYyGoqsdpgYo9WZxuh8f5Hsth8W8UPRVJ?=
 =?us-ascii?Q?ZQaVbSIEofTV2ix7vm0ueUjBH8hJIao58gnrEWNchwvLEDQke8ciqjOfHf7B?=
 =?us-ascii?Q?AehkHWyYIYnud6nXs56cX5+r/vl+ChIsE0aujZL/NQVMyAL6tX+GFzgBZph5?=
 =?us-ascii?Q?/o95egdYj0UOKjoOHQxOcN46Qoa6EWc5mWrBoEbkHa7ye7onQqaAkP+ueajI?=
 =?us-ascii?Q?xZcm4mmANQYXjMhxbVU6u28UNdj8zWKh3JpR8Zmx2QhY4ZHFUc7gKTyKsTrY?=
 =?us-ascii?Q?djH7HahqIKgGzXzzUBSgimZmMToPIRGEbDSD5n1VqeHyJtlUtvcGI0VjDdde?=
 =?us-ascii?Q?XgsSVMrcCRLgeRehvfrITHpLJEX7o+qwg5Vvr7vHejTXH2uxSZRQr+EJumkI?=
 =?us-ascii?Q?dsJA70PW17SG55UfaK/gPS0JMqpkPj4k7f6xmJFzR9JFoR5Gkeo0J2uQEjbt?=
 =?us-ascii?Q?OgOsGQ22lVi3SufVPYObP92w0kC8wR1LBLA0Ixv+5fPlJ9Jv9NOy/96hoTH1?=
 =?us-ascii?Q?QNwK67nhbEROwZ8XHMjQOfdL1T7itq1BzD+WKMpJ6083BXHnbLZoKWsMLzVs?=
 =?us-ascii?Q?RPSGOKWM847omUJzx4+V5bKQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 165330f9-1a02-495d-ae74-08d949582196
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2021 19:21:52.0383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYFCoGdpKtLQoBFaOp02In5Nn5IDUnyU38fbBjfdWNc4zPAXUHnlYCLPsGes5VJPip0RWZom7nnOqsaUHNhg6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4670
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
Cc: jglisse@redhat.com, jgg@nvidia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, hch@lst.de
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

