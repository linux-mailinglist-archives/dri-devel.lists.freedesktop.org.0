Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC5C3EB023
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 08:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F47D6E4FB;
	Fri, 13 Aug 2021 06:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430F66E4E3;
 Fri, 13 Aug 2021 06:32:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/yqxzjGKKMtxC6SKZJxq7t5GnBNBnypbmW9UlA0uiyoQ9F3/KyCg6ZfawM7Jm3Ohhvhz213WjvJ4OnxCzwhChrkuyftW1U7WFE1ZitTxX5KE1vKRc7y+fbnAENZ9YarUT1YzgkXreembg6hhBRKFojudCYKrU2Ra5AQ7GSWNkeoAUagE6wHl4JFJ+vWIH/aW5gtAy34sG+M9JMiNanHNNpmxyDbhHYyAzeGY2FuZBSIZ/Hehsgr25gDEr56SLw59+uNtvxjdjaPCzrd77vOi1YuIBh0ypRnp6+SSRwSl7ysoN/Hi3RjyaM16H37oZ9L+VDKHqGNhlyaxRLlzaRFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JYNbIZyT4GsemXLmS0c1O12FNYR+CKGj4BBJeppL5Q=;
 b=h7FF5dyhPABr32hykHSR3soaAyT+4YBOnOTOaV/PPA1SyYSsrsUEyYMmHDKgwWJRsGGUSwBGQluapKrrdz2XqCTVTIfHAYa0Gp4mQtG7Gdf4F+6WdqqwjcYFELsaRJMsJYaeAhlpAvW29fNP5v4NK/0AxLPv5HpiXdbsrqxIlWilpAFtxR5Qtfb2xjALZa1KyDurRuUUPbyJFZwUYn7xSRXfHC5D1XF93ebNFWp7j9W9+Cg0LUgI9bMA/iB2TFZvW2VlDp7ozTYaaNKDEcwBi0P/aUdrGFH7M3NX046XHFQeqGFqBuXPm2pjZGrrPi/Wph2QzAXoLV9BBFeYW/o1SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JYNbIZyT4GsemXLmS0c1O12FNYR+CKGj4BBJeppL5Q=;
 b=B4VhvBwjKZNqq8rqOAKc33YE9AAKN2hXPrVMmZeY4llqBnCHOTbvYkVl6gcdZXg8gmY7/Bfl6DDbnI440+HLdumD4VAA4vakOXgU1tfEsxca8cZVfThnWUvUPZFLKr+q7gelFbtVNXpCdz8ZEC5YsWXPEYhguwaI4uFuvfSmDmo=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 13 Aug
 2021 06:32:09 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::e828:5445:a5aa:94cb%5]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 06:32:09 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v6 09/13] lib: test_hmm add ioctl to get zone device type
Date: Fri, 13 Aug 2021 01:31:46 -0500
Message-Id: <20210813063150.2938-10-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813063150.2938-1-alex.sierra@amd.com>
References: <20210813063150.2938-1-alex.sierra@amd.com>
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
 15.20.4415.17 via Frontend Transport; Fri, 13 Aug 2021 06:32:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7950325f-1441-498b-87ac-08d95e2413a6
X-MS-TrafficTypeDiagnostic: SN6PR12MB2782:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB278244A959EB07CAF749D8F5FDFA9@SN6PR12MB2782.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xHMFYiIYJ4XMADOEx3g/HpJ3N/Ac43Ib9Y3pK62P3bynBpqOEyZ3oAmHj9ymRleAeVFghC1VVX+KcKVwI11T3Lb2Jdks9PyB7RCHrjGg6CO4/uApJddKmU6bP7Iy6iTZecqP0FGk3RfzzwtR2clOMgLD+W29Bw9OgA0V5Lnfdnr7Ahp9be3eeouovSUxmAZDxA4JJvCH7XA3/q34DYUTmw2wP/J+fWcET5mwSQhA4xXGsRHs3afiKj+k0ayGoTN3QhgGL6cSAbDpHc5whE3o7wRl+r/v5+q2UbqSEp2ZwCeBh2v0c4nrLoAoiyAoLTWE5WPZFTz96Ld7qh63PkhA1b+f9+uRKkLrixjZY20EL4le9WunRvHtE5vUlq8Yq87rKVJ8tZkSKefP8JWUP8PgKHVoNKfQS+zDHNyCyBZivlgmYEx3kfvcUxuNNaxC/hsr79i8FV6r+l/8avJcxa4+3eII8zAL0Qy8vMe7wGr4OguaMsYFGRk4OMdjuzQSbyApyk01TOlNMvUBYUXVPK4GgAhZhRLnIkacwruwUgV2rTHaey8dcMoxKibCtXAskAUAuMebWPlcObFS0ZW7spIsQZ5bpa3PCiu8SOAikpkVaiDGwcf8+imH87zq9alGnP1HMVyPXSjG2CR7lWThKzZkda1siy98KSngyDfOUoI+Zn01+EAtdmmyLGiaW+tHn123
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(316002)(2616005)(956004)(7416002)(38350700002)(7696005)(38100700002)(66946007)(66556008)(4326008)(52116002)(36756003)(6666004)(66476007)(1076003)(8936002)(5660300002)(83380400001)(44832011)(2906002)(478600001)(26005)(6486002)(186003)(8676002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YaTcSpaGInWmNGP99O6ENAsCr3IlaSsP1TRYCk5Yunq1zzCyhP49AolG7f8o?=
 =?us-ascii?Q?zaELPhR4RSABnjH4NKGrwIoXitfqW7b/DjCh5v7BrficsLjC8oSOVD/yBgD/?=
 =?us-ascii?Q?QIE/IdSXrdQPDx1yOAXJ9yYg2IhE2AnLPGYgu9VRHpIkdlks4a10KRvGlMqJ?=
 =?us-ascii?Q?lTR6ZKHPo2oF1EsFq79a3GXnTPKks96Qs/rhSJhaXLeg8eVZflmmUpxdkZZu?=
 =?us-ascii?Q?zvxYOCA135/vO3qu7NQpwPhb+md1Z2Nzr4GPJy+oaxd62Zk1dTFSLDeqnjdn?=
 =?us-ascii?Q?CwHPvdmGNUQn2fi1gGMg+IDtAKGootesr6A1nCxcYif0If/o6AZlWLZz6TWD?=
 =?us-ascii?Q?zmw1PIuRqCj0W44RyEhYLTt0SoroBArV5u1Q9lXdQQj+/eJJ7wru9TfpXvn7?=
 =?us-ascii?Q?s3l2pppp8ZR+F2Ox9d0iyWRD7Sf8DHGT0Ripy2byrkbDKn5FbqlO30Jigd2X?=
 =?us-ascii?Q?yguj0HtJE3nRfGYwftk+CEv6IAV7vIttdN9QDv/eYxfE5+nvt7kQmQ7Xi9/B?=
 =?us-ascii?Q?3HMkNEqcXvKiPHe8TX82xVe55XcBWRRHtEO5CE1OrpRXQuRT+tU6fxodiXGU?=
 =?us-ascii?Q?5wzyVTzNbF5xYlM8CVhewQZwg8Is2Nvk4CFf0d+NUwcitMnMdBjrp/mNKU0E?=
 =?us-ascii?Q?cB/2kz1O5rHek25bDUli5gY5wF5JlSTJ+bIcyb312oXW826R4+J8LyvllItO?=
 =?us-ascii?Q?qUYObIkai8UrKaarEPmw3TIHMhPq2OJa9E4ZSFGDuL5LAqFxWzLmnxEH0GUB?=
 =?us-ascii?Q?gZ3orjnOBQwWbc4g8KJRGMkp7R3GccL7J6lux4lcwRo5n8BzZR/bbOnbN85E?=
 =?us-ascii?Q?IekRVTK27kSnXfwsvjVewm1ONyvb1yz8WPLjd/2V9gh/USgggRNFhT678GkA?=
 =?us-ascii?Q?zF1czjz0+uDLvACCOV3J50HmmdZpP0RnHtmqVKywxZoSGnE6joIVYHUYaYgR?=
 =?us-ascii?Q?ZHfHT9JKN2NfBQCkDjbrbC6sMNYJ/FbER2MtOaK7X4aZr4oBWsO0INk1X6gj?=
 =?us-ascii?Q?URLT/VHCX0v0dh36D0+QBzMdr9w0S3uA6ga/0ygvLz3Sg6iMopyOGZI5jTub?=
 =?us-ascii?Q?BCziBTI50cNVbN2kzlbAQOyecgWgS0tCLjKkRiVpNdigdMubIV34n/aalD/o?=
 =?us-ascii?Q?c9aue4iO4LDbLPcSCK/EwRIy8DzrVVL8Tqtgf5+TnkTeON4PWsO+zus7sYQH?=
 =?us-ascii?Q?0jpqGVXCVIpuLbxo6SMM89Eeknq5A4AQb7xPbpLGCkCn7qKFDxk0xw+nzw1h?=
 =?us-ascii?Q?TnIwNp6e5c/8hhE+7C0B1nzlaJbAB+OZVu+jx3iLXvpyDYToiTo8v4Axr+Xu?=
 =?us-ascii?Q?0JCjDgEQ6qDM+np5r+B/NP6I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7950325f-1441-498b-87ac-08d95e2413a6
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:32:09.2305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Se+77Pgv4nwaXO0ni4QWQwVe551eqtFH/83Ant/uFuckdZmZyRoikpIEmpTtyJLNMwD+ivzPDxwItB3uEhtrIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2782
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

