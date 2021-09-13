Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0E14098B8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 18:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C27F89F77;
	Mon, 13 Sep 2021 16:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2064.outbound.protection.outlook.com [40.107.102.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DDD898C2;
 Mon, 13 Sep 2021 16:16:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHTbXJ4JulT234LhU1+9886O4xzrCgcjjVKgmqJlDTaWVRJ/e950xe3CkjRlNKMI0XGjv+1sBl7cFpgjWU+DRkOugxMzwKvh6IKr+G0c0bEsJtQYng9Se0KO/GTl6Hk5XIkRPSKh7mnjIkZ3wvfZuUIi6QNK5st843EKQgFOwkr7/TdcuDC9nXeM5cpnU31UmY6DMeRcGbq4ni0cheBV5iTxEFPkZJJU+AjHvEfrOsV930Bb7xRmSN5GcaFvuPw5N4vX7XGXL7dx5+To6HKk8/jB1UactNFctlI1WFM+Amjv3KSLEtRP+i4SivlS8qBPu63zH9wx5FBtR6KSrQw4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=PfsDeDPTrxHJIIQdDj4G6ondzbiB2t/+YrLe1QVCDLk=;
 b=dLkhaPn4myDbeesEXEO33EkXY1jKSSYrEI3odXwH/mHUL19by+kaESWapvStpplR2q+IHqc1oIhLmuD9TkUUe8mvsBNwm+z4eGyVTmgA2KuJJE7yL3B4Rfroqa8zMQx3g8Erj08VWraCuyDJJWTiWerU1tEQ0ZkoAtTzGKl8xnmZkws+6QYyGb8Y6IcFPcepcK/+sLvx7hCM1jiMT0AlY6E4+HkN/+zPf3dlrEfAz39vvaIj+yMR9mcc+GlvatwQ8JK3rRB60VjcBFdYfK9CoDDNbhQvA038Ze5M69YuS9GVNEqwVeja/vNODiBd5bpSv+QMgxqFcFcXdJYnVTXOpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfsDeDPTrxHJIIQdDj4G6ondzbiB2t/+YrLe1QVCDLk=;
 b=lkxx6opVnZEE5WuMfgesy3UO/c2579fQ6haZE1YYOspviu6GDgJmi1b2VDnSbXby4C0tUZRxz1Mdp+T3bQhQFin7z4HGiUnDjnOO6bFMN4P/+4p1CUTiTOqQNRh7u77BZ3MN4OwV/yKYTXf1T8roOaN0eGoEhFqQE/sESgjLxL4=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN6PR12MB2719.namprd12.prod.outlook.com (2603:10b6:805:6c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 16:16:26 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::f1aa:9adc:b4f:4d14%7]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 16:16:26 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jgg@nvidia.com, jglisse@redhat.com
Subject: [PATCH v2 11/12] tools: update hmm-test to support device public type
Date: Mon, 13 Sep 2021 11:16:03 -0500
Message-Id: <20210913161604.31981-12-alex.sierra@amd.com>
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
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 16:16:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a76e47c2-edb9-4444-1de2-08d976d1d640
X-MS-TrafficTypeDiagnostic: SN6PR12MB2719:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27198FDDE88CC9ED933C0600FDD99@SN6PR12MB2719.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IfO4c1ql0+faGjsdCrN59AHW4/AjlrR+dQRNAQ0q1x1RD8PvtcKv8kEBRdorvlgNZfjxVnf3vq4r4feuKcJESCN9eyvzrMeP9JVjV+nnJtY7qTXzcM6g3/5Sdsx6M/z31rrAglbhTi7abatbcDXXZHqpccSJzT8UJq1mZl/TdRAnqdnKhE8A9GX7gryn2O3DrIyUUO1vu+GFPaSb8/HVWsjYml43ROCz/8dHGbSszjaIEhrt2pMPfcB0ve+jQTE8sxHC/wet5a+G8XGrSlhl0eaUroxD+nsAIkXsFBQ7lo6hAbVDzwxw/68BCgRPZQbX5Odk7Vpps+84P+zUb6s/KXBBP4hDyK6eH0KoneR3NIjZnMlx2SpgVyoMnm2hxgroM6b7Gzs3owRbSsnl2CEJ7gLasahkLySTbJOqFPFn3+jY4ZfSWIfqp0B7BE0U/0jeB//RzMHBkot9kAq+ZioPzl/+yXsVT5fPmECrBpv3IM2PwOXDZsYznpZUY/lQcDnjprO2C4sPU/JMKnn3zmdm3qK9n8aNsXEkydRm7ks4c8ucS0MBWxuWlJTbXv3iQQwqMk8y30PYfez7tgMUgteXHhXHlJt3OSwKe30OTmVUL5lo3WIobfLWQyi6Y+IF7YJWsijI584iFkcihbHPCU72GEwgjx9NhVvXQpX1vjmlWg+3Gk0aQ+dCWOt5DepqsatxuiK2z89JvJ9RH4RKXe9PIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(6486002)(316002)(4326008)(956004)(2616005)(2906002)(66946007)(5660300002)(7416002)(1076003)(15650500001)(52116002)(26005)(7696005)(186003)(478600001)(38100700002)(6666004)(38350700002)(36756003)(44832011)(8936002)(66476007)(8676002)(66556008)(83380400001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8XawayjXBuoKp4OMg0R/tczJNlmrRSnclJcClXyWoOJikJSYFbjJhP/YaCEd?=
 =?us-ascii?Q?xxf9Oiw2l8au11TV5wpitNMZFJAAB1rf+tyHkxz97/OfQgy6Z/zsTw0L/+da?=
 =?us-ascii?Q?ZJD7Ae6eCNJHASt37n2PjQdwq2yb6RvDOBi+xbXkbNvT/zRMgOkSl0JVb0HK?=
 =?us-ascii?Q?3kIqgPg+177e4x0xxDHXX3NiAXvaNB3S0xHbkS4JQD0O09jbiR7v/quhtwNH?=
 =?us-ascii?Q?RVKyEW2WcSF6m2pmE0n6jeGEgcOHhC9kGWSSwRZG83X4hxI1RLbOTczdUgla?=
 =?us-ascii?Q?ek9hZ+3RvkeItaSgf2USJuX4+frALyGUKI+bA0Z4XP6nuxIdPfLoRI67UgtN?=
 =?us-ascii?Q?dQNdvfYdP27Balf5zaeMr2LIrJ3oVOdskZMMq/lCYp/tqKJ8Yrp4RGMx8fgR?=
 =?us-ascii?Q?YXbF6Uy1d8IaoTJ2O+G0iRCCkHlzwyg/aWavUUyW3tW4OUYQ31uQFkqJZDkj?=
 =?us-ascii?Q?lgmgTlrrnKLNTrdkkedWoOcLkdwYPscgZCdBVCBhRUWNTEZTuHSXVdR7I7cz?=
 =?us-ascii?Q?zQPTIojm0A5A7ziFh3TqePbMuOwsdVg/8XHOenH364x3T8Rp0s0jX6RWwMa9?=
 =?us-ascii?Q?WFTeMqSoR6aGLtHSMt1c7yb+OWT6ZBQpASdWfkCewGnhhm1NBGfoVlOUW8DM?=
 =?us-ascii?Q?BuaMssr7rMGqBKcDW3nWmYNQhi2uxhE+GKW0nmrRIvUwqc2+K6JSCQ02z0o7?=
 =?us-ascii?Q?PZQKLFPqAr+Y7eEQGChz4cZmYBrtgsU3AmGLhzBiX+Tvo8Lvzg1D9N9u+7G4?=
 =?us-ascii?Q?XVjsoLru+ODT/LgzP3qvO9SWx0oUTGvSNDJ5i8o2p/IiWsKzNV3YMr7gC5Bn?=
 =?us-ascii?Q?g8SN43PPUYuNgjh8HKmx9LNLHQORHkuwiEYtGV1Xu1ND0o8w8vmExU2ceVDN?=
 =?us-ascii?Q?w0WS68kj29JJIczJo4nVlcWPKqXMdvfyfnecicqqCCJ5BphsQHYq9IgbwOmp?=
 =?us-ascii?Q?/Vg9XObcTE+N5+SN8myYdRyX47xX8OH7KruhXyyM13Lo5xvNAGjDGNqEFEtg?=
 =?us-ascii?Q?XkBzXL5/my22LiS1zZH63ryKw2bi6+9eNqectxretcQQy5iJc0OQIInWsOF0?=
 =?us-ascii?Q?dngHpcM6e+YeKHkYThNrpwn/6bnaydXOYtBorXufYue9h9HNw2E2f+ZTHSBQ?=
 =?us-ascii?Q?b3TdDZhSpYfh77AX7N6bBJ1oJrWdlr4loxlF1BD2MnY3zYHLBYT90LLgSWK/?=
 =?us-ascii?Q?kuAJPhbkiHyT4IGbhrf2Kgqf2ybcZi1q5X4qglp5b+iubmtq+IroMo/NOdCi?=
 =?us-ascii?Q?KzZZphug8XMyUtflVrRsBsUCzY/AaPfvMGXBwDBErajcytEL3P5c/Pg0l15p?=
 =?us-ascii?Q?qUvwJEVS+uGrGVVgGXFGQ7sh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a76e47c2-edb9-4444-1de2-08d976d1d640
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 16:16:26.6335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVL2NAMB0Bqf8pw9GEBo3DoW+6FT6qeT9N7uQYIHKkdJgRjXlayeuayeD3ip7yMa8HId6fmVDFlV1rS5lYmepg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2719
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

Test cases such as migrate_fault and migrate_multiple,
were modified to explicit migrate from device to sys memory
without the need of page faults, when using device public
type.

Snapshot test case updated to read memory device type
first and based on that, get the proper returned results
migrate_ping_pong test case added to test explicit migration
from device to sys memory for both private and public
zone types.

Helpers to migrate from device to sys memory and vicerversa
were also added.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 tools/testing/selftests/vm/hmm-tests.c | 142 +++++++++++++++++++++----
 1 file changed, 124 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index 5d1ac691b9f4..477c6283dd1b 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -44,6 +44,8 @@ struct hmm_buffer {
 	int		fd;
 	uint64_t	cpages;
 	uint64_t	faults;
+	int		zone_device_type;
+	bool		alloc_to_devmem;
 };
 
 #define TWOMEG		(1 << 21)
@@ -133,6 +135,7 @@ static int hmm_dmirror_cmd(int fd,
 	cmd.addr = (__u64)buffer->ptr;
 	cmd.ptr = (__u64)buffer->mirror;
 	cmd.npages = npages;
+	cmd.alloc_to_devmem = buffer->alloc_to_devmem;
 
 	for (;;) {
 		ret = ioctl(fd, request, &cmd);
@@ -144,6 +147,7 @@ static int hmm_dmirror_cmd(int fd,
 	}
 	buffer->cpages = cmd.cpages;
 	buffer->faults = cmd.faults;
+	buffer->zone_device_type = cmd.zone_device_type;
 
 	return 0;
 }
@@ -211,6 +215,34 @@ static void hmm_nanosleep(unsigned int n)
 	nanosleep(&t, NULL);
 }
 
+static int hmm_migrate_sys_to_dev(int fd,
+				   struct hmm_buffer *buffer,
+				   unsigned long npages)
+{
+	buffer->alloc_to_devmem = true;
+	return hmm_dmirror_cmd(fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+}
+
+static int hmm_migrate_dev_to_sys(int fd,
+				   struct hmm_buffer *buffer,
+				   unsigned long npages)
+{
+	buffer->alloc_to_devmem = false;
+	return hmm_dmirror_cmd(fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+}
+
+static int hmm_is_private_device(int fd, bool *res)
+{
+	struct hmm_buffer buffer;
+	int ret;
+
+	buffer.ptr = 0;
+	ret = hmm_dmirror_cmd(fd, HMM_DMIRROR_GET_MEM_DEV_TYPE, &buffer, 1);
+	*res = (buffer.zone_device_type == HMM_DMIRROR_MEMORY_DEVICE_PRIVATE);
+
+	return ret;
+}
+
 /*
  * Simple NULL test of device open/close.
  */
@@ -875,7 +907,7 @@ TEST_F(hmm, migrate)
 		ptr[i] = i;
 
 	/* Migrate memory to device. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, npages);
 
@@ -923,7 +955,7 @@ TEST_F(hmm, migrate_fault)
 		ptr[i] = i;
 
 	/* Migrate memory to device. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, npages);
 
@@ -936,7 +968,7 @@ TEST_F(hmm, migrate_fault)
 		ASSERT_EQ(ptr[i], i);
 
 	/* Migrate memory to the device again. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, npages);
 
@@ -976,7 +1008,7 @@ TEST_F(hmm, migrate_shared)
 	ASSERT_NE(buffer->ptr, MAP_FAILED);
 
 	/* Migrate memory to device. */
-	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 	ASSERT_EQ(ret, -ENOENT);
 
 	hmm_buffer_free(buffer);
@@ -1015,7 +1047,7 @@ TEST_F(hmm2, migrate_mixed)
 	p = buffer->ptr;
 
 	/* Migrating a protected area should be an error. */
-	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, npages);
 	ASSERT_EQ(ret, -EINVAL);
 
 	/* Punch a hole after the first page address. */
@@ -1023,7 +1055,7 @@ TEST_F(hmm2, migrate_mixed)
 	ASSERT_EQ(ret, 0);
 
 	/* We expect an error if the vma doesn't cover the range. */
-	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 3);
+	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 3);
 	ASSERT_EQ(ret, -EINVAL);
 
 	/* Page 2 will be a read-only zero page. */
@@ -1055,13 +1087,13 @@ TEST_F(hmm2, migrate_mixed)
 
 	/* Now try to migrate pages 2-5 to device 1. */
 	buffer->ptr = p + 2 * self->page_size;
-	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 4);
+	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 4);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, 4);
 
 	/* Page 5 won't be migrated to device 0 because it's on device 1. */
 	buffer->ptr = p + 5 * self->page_size;
-	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_MIGRATE, buffer, 1);
+	ret = hmm_migrate_sys_to_dev(self->fd0, buffer, 1);
 	ASSERT_EQ(ret, -ENOENT);
 	buffer->ptr = p;
 
@@ -1070,8 +1102,12 @@ TEST_F(hmm2, migrate_mixed)
 }
 
 /*
- * Migrate anonymous memory to device private memory and fault it back to system
- * memory multiple times.
+ * Migrate anonymous memory to device memory and back to system memory
+ * multiple times. In case of private zone configuration, this is done
+ * through fault pages accessed by CPU. In case of public zone configuration,
+ * the pages from the device should be explicitly migrated back to system memory.
+ * The reason is Generic device zone has coherent access to CPU, therefore
+ * it will not generate any page fault.
  */
 TEST_F(hmm, migrate_multiple)
 {
@@ -1082,7 +1118,9 @@ TEST_F(hmm, migrate_multiple)
 	unsigned long c;
 	int *ptr;
 	int ret;
+	bool is_private;
 
+	ASSERT_EQ(hmm_is_private_device(self->fd, &is_private), 0);
 	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
 	ASSERT_NE(npages, 0);
 	size = npages << self->page_shift;
@@ -1107,8 +1145,7 @@ TEST_F(hmm, migrate_multiple)
 			ptr[i] = i;
 
 		/* Migrate memory to device. */
-		ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer,
-				      npages);
+		ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
 		ASSERT_EQ(ret, 0);
 		ASSERT_EQ(buffer->cpages, npages);
 
@@ -1116,7 +1153,12 @@ TEST_F(hmm, migrate_multiple)
 		for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
 			ASSERT_EQ(ptr[i], i);
 
-		/* Fault pages back to system memory and check them. */
+		/* Migrate back to system memory and check them. */
+		if (!is_private) {
+			ret = hmm_migrate_dev_to_sys(self->fd, buffer, npages);
+			ASSERT_EQ(ret, 0);
+		}
+
 		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
 			ASSERT_EQ(ptr[i], i);
 
@@ -1261,10 +1303,12 @@ TEST_F(hmm2, snapshot)
 	unsigned char *m;
 	int ret;
 	int val;
+	bool is_private;
 
 	npages = 7;
 	size = npages << self->page_shift;
 
+	ASSERT_EQ(hmm_is_private_device(self->fd0, &is_private), 0);
 	buffer = malloc(sizeof(*buffer));
 	ASSERT_NE(buffer, NULL);
 
@@ -1312,13 +1356,13 @@ TEST_F(hmm2, snapshot)
 
 	/* Page 5 will be migrated to device 0. */
 	buffer->ptr = p + 5 * self->page_size;
-	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_MIGRATE, buffer, 1);
+	ret = hmm_migrate_sys_to_dev(self->fd0, buffer, 1);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, 1);
 
 	/* Page 6 will be migrated to device 1. */
 	buffer->ptr = p + 6 * self->page_size;
-	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 1);
+	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 1);
 	ASSERT_EQ(ret, 0);
 	ASSERT_EQ(buffer->cpages, 1);
 
@@ -1335,9 +1379,16 @@ TEST_F(hmm2, snapshot)
 	ASSERT_EQ(m[2], HMM_DMIRROR_PROT_ZERO | HMM_DMIRROR_PROT_READ);
 	ASSERT_EQ(m[3], HMM_DMIRROR_PROT_READ);
 	ASSERT_EQ(m[4], HMM_DMIRROR_PROT_WRITE);
-	ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL |
-			HMM_DMIRROR_PROT_WRITE);
-	ASSERT_EQ(m[6], HMM_DMIRROR_PROT_NONE);
+	if (is_private) {
+		ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL |
+				HMM_DMIRROR_PROT_WRITE);
+		ASSERT_EQ(m[6], HMM_DMIRROR_PROT_NONE);
+	} else {
+		ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PUBLIC |
+				HMM_DMIRROR_PROT_WRITE);
+		ASSERT_EQ(m[6], HMM_DMIRROR_PROT_DEV_PUBLIC |
+				HMM_DMIRROR_PROT_WRITE);
+	}
 
 	hmm_buffer_free(buffer);
 }
@@ -1485,4 +1536,59 @@ TEST_F(hmm2, double_map)
 	hmm_buffer_free(buffer);
 }
 
+/*
+ * Migrate anonymous memory to device memory and migrate back to system memory
+ * explicitly, without generating a page fault.
+ */
+TEST_F(hmm, migrate_ping_pong)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages;
+	unsigned long size;
+	unsigned long i;
+	int *ptr;
+	int ret;
+
+	npages = ALIGN(HMM_BUFFER_SIZE, self->page_size) >> self->page_shift;
+	ASSERT_NE(npages, 0);
+	size = npages << self->page_shift;
+
+	buffer = malloc(sizeof(*buffer));
+	ASSERT_NE(buffer, NULL);
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	buffer->alloc_to_devmem = true;
+	ASSERT_NE(buffer->mirror, NULL);
+
+	buffer->ptr = mmap(NULL, size,
+			   PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS,
+			   buffer->fd, 0);
+	ASSERT_NE(buffer->ptr, MAP_FAILED);
+
+	/* Initialize buffer in system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ptr[i] = i;
+
+	/* Migrate memory to device. */
+	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Migrate memory back to system mem. */
+	ret = hmm_migrate_dev_to_sys(self->fd, buffer, npages);
+	ASSERT_EQ(ret, 0);
+
+	/* Check the buffer migrated back to system memory. */
+	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	hmm_buffer_free(buffer);
+}
+
 TEST_HARNESS_MAIN
-- 
2.32.0

