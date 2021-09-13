Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F3A4098BB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 18:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739906E1EE;
	Mon, 13 Sep 2021 16:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2077.outbound.protection.outlook.com [40.107.100.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76F66E1F7;
 Mon, 13 Sep 2021 16:16:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TX3w5kUexJUMhoC5qIyYzd0gVokdEVhGrOOnrOYrTDTojF1MLBBeiuYjmy5Tv6fZjtS8IyTL7PgjvSitU5jiyiyOg9La/DGEHUWXZJ9IXjSmqtmDHwNHdmWaO/K4xtHUQyLtmRx9JX8/Qmr2/2QkghWJzFXa6eoe/Z1lQ/tIyzkP+j+z6W4dr5HgpVUnu0RxnfX6HdmDkZrIDbE2ObRc1v+bq2Ptxp6lqTEDg+KIs34hbhhMfDxxFBRdhCiNep53/bwue6iBzitCzLyRl8z/uXtKtZ3wHOaJO/fvzIjDWFaQuOPAKBZEfJOSOaSvcLGg2UEVFpKPxGNwfTUMubDDvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=dKC0SDJcXNMoavar9nuqOgDG5SsEzpi3aevSualtrlA=;
 b=NzL4yqV7kgRABOtmIJHdflqS2WaQtDrTgWs+a4D3DW70NKfX0shYmDtpK30as6Uy14O9G54S4K8hn4uWxxiSfaigyVQRodxu4gBJY+UqoyRTgERUXYv5vkDjb15OoFdCrsCa+OkqJnxTNKA+YRd5lA6687WY3fMsSCkhsMfnZ5d7bWheyOK7zohZ1/2p3YzAib2NT0zXlmjslqJCMLFWUvC7LF1JQaCpacJ27JeOau+HBlGEAxIRRerlcGUdZFQYAp7LnOIT5pAQEFXA3opDFTXoESGLVgqarUYs3hZ9xJYq2lBzPguXrJU6qQgWNxENzsVW41Y4oKPv2N2uYyjkGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKC0SDJcXNMoavar9nuqOgDG5SsEzpi3aevSualtrlA=;
 b=keO9mHR1ET6lgbJZbLNocY0/3JsE6uFHEUNadunKKVfhh1LG1E7zI4HGRETTteLyGc8giqFeze+5d2WSHuJaLP00KeQdWQ4RGY+/VJOmiNm7p5+81rjOilGpZH6lMTVqC3yvg5DfFuLCU0II442NJQKbqwTqsr4BvqAhwNoM/B4=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SA0PR12MB4349.namprd12.prod.outlook.com (2603:10b6:806:98::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Mon, 13 Sep
 2021 16:16:23 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14%7]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 16:16:23 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v2 08/12] lib: test_hmm add ioctl to get zone device type
Date: Mon, 13 Sep 2021 11:16:00 -0500
Message-Id: <20210913161604.31981-9-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210913161604.31981-1-alex.sierra@amd.com>
References: <20210913161604.31981-1-alex.sierra@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::20) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 SA9P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:16:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f7d4d8e-e771-4e9c-1771-08d976d1d42c
X-MS-TrafficTypeDiagnostic: SA0PR12MB4349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4349C10358568AE91F13D26DFDD99@SA0PR12MB4349.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gt7CixnATMIwlAqO65soFRDWyZfxO6BJMk8dcRb2pCP5LqTuq4N99uyluTgA+1hYAwXMPEBLkqSi3srqRxDYU3FYDgBZuOV6/V3e8vorj/CnBBqOeajH/J3/HucKCvfvXAAN0KZn0t7ZYQILnBJh0zPbJ3BxPF0kdFA7bV8yTdJcp7Q8bnk3CB37kZd3f5C7Ua1Hkj+ItnKR4oynv9R5x1YyJxxVMOL7dVeZRQNA9o9/hImepSwJRsRUzaQMFqFmSBo580YvOZQtIJyzn2fpeTTHQWI12Xz3lChj5aL5WMSRF9w5IbAFcKfinpxDSk68MGrs0mSLbrjWQ5++Am4OCwcvBXV5fPuXRfbq19k06EUrWg4skxm0eOBn1WcG4mBJAgM3RXZG72NZdKHVicRJGKuht9ft49e7jLU7CzMeZRM51vf9qqPBN+mqGpi134qOaINQw2GILmLlGCWdTMVGSrzf1fy1bkqCq90650wp5cTLT9GXf3HcpbHO2yC0YFcNiPf60JuZvCFLXHRht5ojzEORiNX7DPRl2Et0WLIjNXJRNonjMXVzWxphGaZNdFQWTFcIKJlYv3Z04aXXl0tjVoYdEJi0h2G/PImpvcJy19sYCH1ouXn9R7QeyoRwrf0KCsN43IaSu3nMxfWLKF14f5y+OYoec3xNZbBimvzaTd9Mw55PAPnGMhXfdwPWppya
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(66556008)(52116002)(86362001)(66946007)(1076003)(186003)(7696005)(478600001)(44832011)(6666004)(38350700002)(26005)(38100700002)(66476007)(316002)(2906002)(83380400001)(956004)(2616005)(4326008)(8936002)(36756003)(8676002)(5660300002)(6486002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QJZpihtJDtk9j3wSmqFQsJPY6gdWi6fVuAzkn0jfueGyyxg3d7oPlpgU/IlM?=
 =?us-ascii?Q?XEnBzi7YEzY/PVbh75Fy2Gzw8I3BTJb3yK4Nv0KH2347UruRGuTT190gdnHu?=
 =?us-ascii?Q?WumSVV7iiKKCMgBXrpGmI+9uIinFVI4rCHO0udowL6CaQjOaXDjdI2pPU02W?=
 =?us-ascii?Q?MDSY5c917BTcaPTNXkF2fxA4bo9Ws/dsQJydVjnnStirDV9EW+QxfNUza0Hi?=
 =?us-ascii?Q?b4X0U0xnGFMh26MbxMQJcIfqMCX6mUOdg5/mrW8YoWvvXpFerkKBub4pQVmW?=
 =?us-ascii?Q?shRILfOYkMQx8IQPOARHGlAGlQePyYf8Yx9lxWEZGzL3CXPDxoVjKi3LW0MD?=
 =?us-ascii?Q?ej+2I4NAx6iZTwZbF6m91swjYaF6zz0mBVb/hU48TOT2iVn1soxFbryFzfiM?=
 =?us-ascii?Q?6lyKw5ZarJIUh9al21e00kN2IkwyHQY6sJsBq2+vkTAfO0TJ6PYtCciqhiiS?=
 =?us-ascii?Q?V8cp9fxpvEzXe1xuBxp/w+x8K82vUn+ZZkQyU6w/osPyLbCI7dDcUHIQl8nT?=
 =?us-ascii?Q?+khucQ2I3Ng4vhdHSeWspdAjIDjSDf1K5RwLkTifru9ueOGeWjP6qClf3i7W?=
 =?us-ascii?Q?ZqlakKCXXblIU0JOcVFNAEtoxSt8JkygSTgpGoz1gUwJUlWscGsySNVJkIod?=
 =?us-ascii?Q?Qnh98vwT1Redus/Ce+I0MImDu+tJYK+warb2UawJGo+jpZg0diEYcAiVQ+je?=
 =?us-ascii?Q?Q8wSJGS60C2a2l08JsHhc4FPjtOu24pkgo8Hdllafqzb9lIBGeVgGlVAFj41?=
 =?us-ascii?Q?2m31j7L3e7F6lDVQNWMjf0po8zkLH4fDLl0brVPn2afZPNF8j7rAS3UxUsMR?=
 =?us-ascii?Q?eqGIRUm4LRMPFoGNTLyXw5bm51N0mOGIdOopmcyTQN+lRDGk9srJqu4XjKmx?=
 =?us-ascii?Q?DZ6W7hxnvyUBsqB94QJHTFmXrrw4ahFc32AUHdt6KPv9ZTk41gg9zlZZ9o3g?=
 =?us-ascii?Q?VzkBMbWj9HNhBCwbJK0YN5HEgDXsKzU3YlSS9AlojcVxbA363XsC4ZtDRfEm?=
 =?us-ascii?Q?4dBvJB4knOy7lxeUw9M7D4X8rjsawxREdXUCLdZJfGZQfgW3CxVpmI9416cH?=
 =?us-ascii?Q?O425KxFjJWdaQVuE+SDkICOvmC20lz75pFqX/Qf+irpne1Qn/5INFqF0gmkI?=
 =?us-ascii?Q?UVTr+mmg8v4KoRZ6VklGbYvlVbj32osFGNwkXM78VUGJNQ1wC1cPeIprsOA5?=
 =?us-ascii?Q?x8ikC+KKTmgYbONAxxuFusp2UkF2A/ySi5WQPfAWBpgSmgdW5v6QDpNaKQiX?=
 =?us-ascii?Q?wz2MXjiyrB9YW/l4JWXoIvYBdSwKGe2ZztdjmCrZKfgdP0MroSUUMYsd1uX3?=
 =?us-ascii?Q?Hq0Wqbu/HA+9KEoqOWF1hmUX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7d4d8e-e771-4e9c-1771-08d976d1d42c
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:16:23.5820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgne6P/mS3B5DWF1burbTt8qgSDrHjYRawWXBMGwDGL//PwCdZrQlgNctGJNTLfW0/KjauHU5Vx+zjC7Sh7SLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4349
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

