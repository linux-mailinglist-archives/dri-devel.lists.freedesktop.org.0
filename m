Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANU2OukDlWlRKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6DF1521FA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A63610E53E;
	Wed, 18 Feb 2026 00:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bsYb6jMl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010066.outbound.protection.outlook.com [52.101.201.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FD010E53D;
 Wed, 18 Feb 2026 00:12:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQJykZx35AEIZABHjGA2hmFY+++qsLZjPGZ7qDZqO3eXy5RKGZ14Z8WcOCOQDVbgJ7ZJfbRnWBV82PX2p6wZfabuuVBOCphAM6BZHhbxH4AsOlaiPiOKYx33tr0hpW7fkSeQNP4MLWwDRlQNyM4kQ3eRC0GrEVHUrnYp4m/PpdH3JYXKXmhlThueax1xz159tymVQegKobBdjwg+3lpOSeKZYb+kG53zIQoerY4cRqJW7KhOH4thLxpL4HHpfEgzYzgdqmMuxqLrqOGEHVfXmY60JQcrr1SccoD0Oe1X0y8A2F2VFNhOghmCBUVwliblx+YKsTnAh8LQ+39G8DhQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trG8ZTsHmCv+phsXTDQzalpbTXliUOdu8ZQbdqPTbXg=;
 b=cwkLuJX59jZLKlVkRokqDvRp3dudyvuxZcEuY+KqIbdVn8YmQS3wkvROTcXfsMvlIe9Stm6CYa14kwed66yLhJnu2Li8bmK2UvamSdr+bnXoYvaj+8YhPlZRgQr8VsndIVSYpkd5nJAd6tnXMdz50eTg3Doj48B6Oy4HCRnHRMkSxzaAWzI610Kb285+lr2wGOqBQS+wutJ4bdN8IL8j25MbRN0kVi9t0FwtOcgK/rxnDGNKZHEZT+PE/VKexTKkEwh5a49xTLXVJ8nz/ARsNjou/jhSax5XEWm6oXgya0nzulEvne72JRcxiezciDwEhpeEKJc8/La8Am21fNUTRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trG8ZTsHmCv+phsXTDQzalpbTXliUOdu8ZQbdqPTbXg=;
 b=bsYb6jMlQJgujvqYj4t+fNrwTC5a6XVTl6j6e9Wo7IsmZGb8LgJ+YPvHUwOzvEqmBlriaZ4RABkyT+MyvgU4OJxu/YH+uBL844dDxhVVPJpT4PVh/aww2YC+67eXNypVnCTfRugRYrXlpDDD+Qff6KSfk2byWXNO2+R4NmcU0nqWKTMea3Z0WCoCVXuzG6izbIAVIQqX34S4Gh+K+UC3zcsTRRNO2AepAu1t46xPBpdGP7ulayW2tPuf5eB6FzuUd1HBozv/KRhFGLoXUx5fRQWfzdDW6wXHx2g5XcU8HSAhzlnZGlPXuqBBNMl6Rygu4/6RyrFtsPHlhyUpKH2u4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS7PR12MB8202.namprd12.prod.outlook.com (2603:10b6:8:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 00:12:07 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:12:07 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: 
Cc: Christian Koenig <christian.koenig@amd.com>,
 Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
 Kevin Tian <kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH RFC 15/26] functionfs: convert to use the SGT mapping type
Date: Tue, 17 Feb 2026 20:11:46 -0400
Message-ID: <15-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0184.namprd13.prod.outlook.com
 (2603:10b6:208:2be::9) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS7PR12MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 88accc20-a135-48f9-4c2f-08de6e825698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aWzU6nTm1nbnOWrtLQMXBTcgFeryCMXJ9KuBfqU18lVd1LUKfXYdbGZtCbYb?=
 =?us-ascii?Q?mPShp0zSIrZrKq73JLAiYj6wbBNgWubpYuY/UdTu3dK6FcTAojpqtp4wi2e6?=
 =?us-ascii?Q?CxdsHopGUhGvfPL0hYGEh/0plGHKmAv0o+1e3EpDgKeobeDRbbxKtYzx2TRy?=
 =?us-ascii?Q?RC96Q3mGgdMNSvC2eWoPXuOvYemGhQIIIWn+ynGzIMIfVjD4o6Ds39nAlo3h?=
 =?us-ascii?Q?9UD2P457kbpX2U//ChWhoA4jUH6s6D4rDctbeyVO4s2ryAGudy/emjiGHVoy?=
 =?us-ascii?Q?ot1FT6hNUbnKyJKGmljeG4mVWuz8Anto44pGrIoT1q2tx0YXLOvbUpzbJj2x?=
 =?us-ascii?Q?BZc9cd2J0DviWAyjcUESwEJg39Td2jCjJ9NA85/Z1ZoFnmNr4DYX64bgepnA?=
 =?us-ascii?Q?XL1s4zAkXCoIjVxCVxG3sLdVL5LZXCC4aXt78ovS2QYFC5e7FDFgBFJcsylN?=
 =?us-ascii?Q?DbEvLFlgYKL0ezkfRklN6+z3vYmbVtBiMJvhbrs41xxnkSsY//6fkw7q2lpz?=
 =?us-ascii?Q?YtDGqcqETIlRnS3YXeN3Ep2nzyT4N93H1iMqyxhE7MqkduiCjTDXqD4qumWR?=
 =?us-ascii?Q?wC3J43fPoWtniKYxsph5PDYi3TSohYB7ZIwlimIY1K/jPuZgJUGBQvn6cBdF?=
 =?us-ascii?Q?7PBf1JmnR6GEfKq9R+hVv4dvDER8dnszfWSfm4uP7A2LBWfFuHRVcDiFmwSy?=
 =?us-ascii?Q?Ykq9V6Z+iN23P4BZHl9PTuq1aQZ2780bJ+fW0Mo/D64VObwe5I09k7YrsKAy?=
 =?us-ascii?Q?XegXpQ0oXJjHx6cyaDn+ZY+ZK0ZCrjs0VuQ6MfqRfPGX1dBJver9QqAQs2Ig?=
 =?us-ascii?Q?dnAP/OZKCIfM+4RlJhFPEtQgFIcxgff7cEUHHGXIuGBlZPtlr3UExtdEtwIG?=
 =?us-ascii?Q?raNr7gGTlq5h034QAfsBX+vqso83N9Wza3GqcNWVSr8IdpOzHvRxqAfEm9Wv?=
 =?us-ascii?Q?1p8kEuj8PsdGzsvYIN7aaEHEHz+s3u/5xBiujefxhBoRAVfOPjG46EqqWHja?=
 =?us-ascii?Q?fGGmfPC218C8q3AhzfzSJGwlWnxJBHJVFilrhiAWxFYfb+w0gdEADFlFxh/a?=
 =?us-ascii?Q?pg6O8/eC9OU1lMvWaiPCPfdbPup+7yALCG/jgR28ooXRBwKoX+G/ElB/sbsF?=
 =?us-ascii?Q?z4TIT+63WegIwTDgeGuGVwKZTLERl0g49cunC0i5tt/e0JcDYBJ9WFaxckFV?=
 =?us-ascii?Q?WwAdrDbmG4A0T9tvlUax+VKJTt7P0V8DZtPIuqI4c+VBWF3+xHtHddCTleuW?=
 =?us-ascii?Q?HujN0xcwDY6oEvrtsDRymLAA72THVcRSP6YQsjgTpc6e39ersv87BRC6M35G?=
 =?us-ascii?Q?KHg4PzdxbgcjjnCJSMOwwPa4RK8tnXqgNJHczSsLePCQEDzL9/0f691x1dIq?=
 =?us-ascii?Q?ylz2xGp13wv0g31EWn2BKgyZ+jTCtaao6Cowi+9/NEZXEYm/8cfDh7UrPMqi?=
 =?us-ascii?Q?XQr2krL5i8Xa8ua8Pz1/3mLiytWKST9k42+Cgsd39MPypirbM1L4JKAqsaP2?=
 =?us-ascii?Q?fAOSnOa+hc9buduoJf150z72w/MnIJdkrAd2YpGtuznDCkUEJZWZb+HNtOJl?=
 =?us-ascii?Q?2k7SPzeuzUDNDyDak94=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?++CrnDO+VF+B0eYLeAVc1UnBVOK+BSDFOPZSAZ/emp9HLOhtRcVJ67c40qEW?=
 =?us-ascii?Q?ezoeb2Rqnzjxtn6KiYVwcigWzdSdPJ0wpalI1P07FRxH/r22plM4S7ifdeGQ?=
 =?us-ascii?Q?+XFbymxaIvhNC9vvOxZFyqwlPRdVN0kGdOVMdiXlZd3eb+GXX6JKZeRvSPlj?=
 =?us-ascii?Q?WAFFuV0uR7HxZ0/6d6x/3UJUuVoI9kEXmogkIPci3svtfSlReQSteWtB/PsO?=
 =?us-ascii?Q?BuK4JZYZU0oF4ZQCPYc+Ie3Os22YkvqTzsth9AnrcE+ID24+a2B7BXd9ADmY?=
 =?us-ascii?Q?BxbqoIQi5JRnbW0dWTIYrLo/yuxatubUn0HpuJZ5URyE83/C7SzxDCLPyZhV?=
 =?us-ascii?Q?OixfBk7asBZ48pmIj9TJYsAT38SIDmG7roA7TwyY1qgF2qW8oZ48Cmtksymo?=
 =?us-ascii?Q?P+78x+TrUKFlFWjKziYcyLAjk20uf4naNBk8C8SFQtGypafapKLwuBX3Cu2k?=
 =?us-ascii?Q?C73iK5qp4Rq4ee2rO7lbnIOdQQNVsKYYkR0xw3KlzTCjpFPO2rP4xfGb+Nrm?=
 =?us-ascii?Q?slAhW2IME7qBFv9y2WNl3GSTQbdxwjm00x+92xyt3wHcLjrz58cWoER/gNny?=
 =?us-ascii?Q?aeRdNLtilNKJNnYcOQGWrVbmLg4jBTQgYTney8D2mywIeHT62bGsD4xnGkL5?=
 =?us-ascii?Q?mTMcJcuRkFogXWmZuTfIw+NSskClyHCSI+EVXKGlFLAghXRNUrFIicWB99j3?=
 =?us-ascii?Q?a6dCz0lkUxgf1AaulamULCxkFrLSzoqB/NAQm0xSNnFjJSDjlPwv7jEQYj4a?=
 =?us-ascii?Q?OJpuK7HL0rAUtzVFXrRtsEwgdjqe1cuqORsna0H5uDL2q3ssncMmUJZbiL3m?=
 =?us-ascii?Q?RSNOMRWa/0HaI+LfJkdVfrnLmopmMzit8/4KQ3VIM0sp/5OT4ve7oXB/e5pE?=
 =?us-ascii?Q?TChrsJ5+tZ68glszJX+7vGlDL+kAi8mdgXVxBuRI7fVmhINMfTM5MGB4rfRc?=
 =?us-ascii?Q?VNtFLciPNRjMeQzl6gEWMMXZrWxZJLFbELwfz/8O6S19KVZ81nNg94I4mDRO?=
 =?us-ascii?Q?X3HewJc1Iuv3Pjc9AcDEZKYhqSzZeOHSH2rtw4uJRE93XAVc8LC4foxXKhyI?=
 =?us-ascii?Q?YWyQfwISOz+my7PV7/6rF+uICwuQ7b8B2Hv9apz9WAD4BlfSOQ/MnDHCBkbK?=
 =?us-ascii?Q?bEe600qCThhVlHiXCm3Fw0DRUJRQh1hmsV4URHO2HI2rBgJ9QywgdFUeNLos?=
 =?us-ascii?Q?norrl7dIxSD1dQ1zFkk0iMNir8n8lSETi4gkk0Och9lRpKVgMWcwX951qc6x?=
 =?us-ascii?Q?XhvGItatvF7IzJHRZBlppeSyV1uJ1UwTW4H1RVeQpTD4Q7FQ6dPSsKTCCxRP?=
 =?us-ascii?Q?iezmGwIOK6bgnS1oPaP479d9BJNgH044Xv6D0eJZhSWksmZ4UjnrANesmdGg?=
 =?us-ascii?Q?JclexBRN0Qg6/tBeWzOoA2fgILuVAz2mITXv8YzUU5PWz0AS0iF9j1tzOtL3?=
 =?us-ascii?Q?OxgsVPvxpmd/+gmSEBOtfNWOW7Tzhj7sN/F6hqFL7CE9QZ+FqH7C9gYCC3+Y?=
 =?us-ascii?Q?Y6+T47y1ssA/CczDbz4y5i8UjZlJ7iDmAJrAEBUpsPKxbk1KbWyZsK9PUQju?=
 =?us-ascii?Q?47sF5f43+U4DNhhoVmuZj11A56RQHOdPcD+G7qll7ILT/uB++bG+mqWDZ6vE?=
 =?us-ascii?Q?/f7WEjX1XopVdL7sYKed+JZvf/Qbva1fV0sZiFkp/gjdSp4sdwnnJM6VUvsl?=
 =?us-ascii?Q?kmD/ZBwRsAmsj3AprS4HNomj4EWc9a+8uTOqM5jxjzy/yXKx+oLdXqIoi5jK?=
 =?us-ascii?Q?6Z09kjKJeQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88accc20-a135-48f9-4c2f-08de6e825698
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:12:01.3598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOwigTbOBjSej+z5MATorGJM/ZEDDLEFer4f107OFQaphtlKwbmlZKM/10HHWDMC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8202
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 9E6DF1521FA
X-Rspamd-Action: no action

These importer helper functions should call dma_buf_sgt_dma_device() as
they are always working with SGTs.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/usb/gadget/function/f_fs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 05c6750702b609..5c81ea9afa1249 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -16,6 +16,7 @@
 
 #include <linux/blkdev.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 #include <linux/dma-fence.h>
 #include <linux/dma-resv.h>
 #include <linux/pagemap.h>
@@ -1467,7 +1468,7 @@ ffs_dmabuf_find_attachment(struct ffs_epfile *epfile, struct dma_buf *dmabuf)
 	mutex_lock(&epfile->dmabufs_mutex);
 
 	list_for_each_entry(priv, &epfile->dmabufs, entry) {
-		if (priv->attach->dev == dev
+		if (dma_buf_sgt_dma_device(priv->attach) == dev
 		    && priv->attach->dmabuf == dmabuf) {
 			attach = priv->attach;
 			break;
@@ -1569,7 +1570,7 @@ static int ffs_dmabuf_detach(struct file *file, int fd)
 	mutex_lock(&epfile->dmabufs_mutex);
 
 	list_for_each_entry_safe(priv, tmp, &epfile->dmabufs, entry) {
-		if (priv->attach->dev == dev
+		if (dma_buf_sgt_dma_device(priv->attach) == dev
 		    && priv->attach->dmabuf == dmabuf) {
 			/* Cancel any pending transfer */
 			spin_lock_irq(&ffs->eps_lock);
-- 
2.43.0

