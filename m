Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH6zA+EDlWlRKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FA915219E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F4810E53B;
	Wed, 18 Feb 2026 00:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WGOhxkEc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012060.outbound.protection.outlook.com [52.101.48.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A28F10E2B7;
 Wed, 18 Feb 2026 00:12:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNnav/Eh7+rsCfw8YfPTE0g0jz6WzIyvmbVdysxJQajxCQnfgyc/YPy99fBBnENXwxeFYV8SjqAAftTjD0dN5F/izPSHIL8Ip9d8usgESgHI6Gr3q/g9ovHMOTc3ziY2v83qaT2b1/AaPYkCV7INTdtiyOaNPHANZVC3MwCV97nsJZbRsrJ8CgUpaJuQwOBhcRxCCsmyeojdvjHYY+8IjSlrKhY1b7oGDOZXMGMgWFLeBNMiJYwCmypahZFvtTqV23RGTZKvhC8oXs4G4HRQAsMaUIcY2x30tqavYQJ1RhyXFTJPpVDgSJHgi+C5ZECMryLX2n7J6gbiGttqH0OJ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlOw0rFA4Emybe4yqUk6FZEFo9Itmki3aD1PsEO7Vws=;
 b=WQW4irWUD2ix6a/pQ7UNZmwTm7Q+jfv/bdmjXTup7AIsA7myCwXzry5OAoB++SrqwRzjCYKEY5Ebqmw1niAJTVbYWBwgFH00WwAKYqRgYvQLvXHdod1MvahU6D/tu7bqvXS2U7D59YALGio5bjrBBIwIb+wtjPuMxPQUtNb05Vf+XiKu2/nTKLqRnwNrpodY00WLGPY27Oxll2uJYXzbBc7g+qh1JmqbviL7eHbR5Ab8E5grL9StISiYxHyoa4aGCws0vVLVOgb2+6c5aqDdxNzu0m9fOg/mgSUAH90V/on/MV4/t/LDOFd3HGhczYcX0yRIVbrHSayKKkWP/Cpweg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlOw0rFA4Emybe4yqUk6FZEFo9Itmki3aD1PsEO7Vws=;
 b=WGOhxkEcVlBxjj1107sx17Tg8mLMkNTJpz+hyWlkfYW0qHn2sLZ/31Tn3hwQ1b4/gFQTY2AYOjkhYZIQNOXeBvdUWoADMFe0PsQKRBT3AmBMFVCyzUprOmtHZXac0GeuA2oVSimmGfZOtLT0YMNcOKmI9y1GeL/MJ7qVfE0EkAuZw8T2Ro8ruC7uzUfjBLhU00HDTOi68y+Waq9GvJ+jQPfGv/9zkq+WUAyo/LZo1cHZeIddPkP2pxaSFJwzgTwqDYJurpgPb/jKAZYGbanL0jHrRhrYuHZY6ucXoO0Bi6rg/v3XUk5n2PIQ+1xYrXWOlF3yMEbSH7zz2nU0Pm3H1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PR12MB8421.namprd12.prod.outlook.com (2603:10b6:208:40f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 00:12:01 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:12:00 +0000
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
Subject: [PATCH RFC 09/26] accel/habanalabs: Use the SGT mapping type
Date: Tue, 17 Feb 2026 20:11:40 -0400
Message-ID: <9-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0239.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::34) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PR12MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: e1192283-7067-45ef-56df-08de6e825576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4x2WySoKIqRocoiPGmMx3qj+vsR2coKHZojE4LZDnbGD2oVMEJ9RhWJloONv?=
 =?us-ascii?Q?crgU7ciN+HOihyYMkDLwmu9F2wLvrsNpPmphJCmCd+vyxfpBX6xXHethnSHk?=
 =?us-ascii?Q?zn2Dd53JOri7eG1jm9sZokG4XzJx2oZXG5p0tihfygeuLimCvNjKFr5Zqkjs?=
 =?us-ascii?Q?Vq13GfiuSf6ocIg3qA5gjjVpseFNboJlTrIwQtfVRvADImJACfKcE5C73ULH?=
 =?us-ascii?Q?IyRKG4UvO0qCwAyuWKEEQEICboPMRfsLoTlvZePGTz9Y7dwGaHpD+qbaqazY?=
 =?us-ascii?Q?WUJh8aAtE43tcZbr8SprlNtwxcs3GIesUa+DUdECSAGabbinnXRwcr/HNQLl?=
 =?us-ascii?Q?ITLxx9Q0cBqEEiz3jrsnV3/Q0UngOF4aFLRjp6gBtYJ4aN/a6vvPNDOedTgT?=
 =?us-ascii?Q?fDh08qA6Anmz7x7Jo7pVgiCuZqzHq/jC/RMTTbVY/RuzHTY27p4lD44SO1LI?=
 =?us-ascii?Q?O4xaSNIGfbslr9IoXpucO0pUX/XgXD/3+f3hicWAfVXfXDmgwbvI0c8uoLKa?=
 =?us-ascii?Q?ZTFeUvRqqZ9D13kfY9tGQbTne17J49DgYDn0iQx3wq2s5gkKWa4r+4qdX0QV?=
 =?us-ascii?Q?vU1TJcBObelQR/6tx4cH16ji2x6BtseFmfJUuK9+Zw7zpGFtMfAFri0JIap9?=
 =?us-ascii?Q?dm+UOhuLrp1iXrDH1B8J/Eys5q2eC/2I4Gqp9LfdetaFGCtSrL9KrrV1uVlh?=
 =?us-ascii?Q?ROeyNizLCQTp+F3mfJ+hmtiODVMj/AvvKavoWDVIsKsodAbzGZLP4m8Tbt/n?=
 =?us-ascii?Q?a5YduAb+Izqwd4LV9MTRKKQbRSBOfC7eygho5L6SnDiSO//Myxsxng7jKJqX?=
 =?us-ascii?Q?WXu4JZhQXpSuR2OuM7MhOB1yq7S5tGasgVVYmgx3Ma+n3GnWyUIHqr/vxuNT?=
 =?us-ascii?Q?0S+/hP8U8TSUjjZIbmhkGg9RA8+YqwytNN91kX/T1gtGZbAIhIXAit7Ozrxu?=
 =?us-ascii?Q?lYOctnzx2nP+DJIw9/89zhP9I70zzgE6P4LsBSjzsNM+eg+qmi/SIlJW8f/a?=
 =?us-ascii?Q?SoDuj2uweR+9a2UQwIYnYK7lGSxn/dLSC8ov6szntHpIys2gGl64gHcxg8MB?=
 =?us-ascii?Q?Ba5ciftysnTo4JV11gfLib/7OhUZpUXW6OTtamwR/nZKt8NnK2P3mGHwJgg0?=
 =?us-ascii?Q?76khDVwj1TEpl20RC48fe3ATlQKkfm/D7svTETRm5enTGIY8AY03c0XVp6/6?=
 =?us-ascii?Q?aOjioTkw7vdFnR6r3rb9qKhoMEgl12X7KTrI32QyGwKvAeiVND6d+XEHJ8y6?=
 =?us-ascii?Q?/2R8UL5CI9lK/W/z/pf50E40ZpWHh46cRCVAPeYvXDA3mHxQMEtSWkTtECsR?=
 =?us-ascii?Q?LBc1lFKdHT+JdeDYGsWnbM2lzUp0RJwV0yUvhkZFzfvyjQlLTW3jm9vEkRJ3?=
 =?us-ascii?Q?IytzeRFn9IKUPeNuLX6yYG8oaZxPA7jRghFvGxMnFPdCiFKumqSrS/R7G+mL?=
 =?us-ascii?Q?NdEwBUvvqsWyrVlw7fbpK2lFwWizwRcosOzZsaXdeejBXaxZXqltF9pQnRta?=
 =?us-ascii?Q?OlGNMnD6/oxwtW7JpnDMSATbZrKSWVpLbDyZkpA5A336sOjOyE778DG7E7XF?=
 =?us-ascii?Q?3mTZLjGex+HumV/jeb4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v4SQIs1PY31KW/C6MXnNjAdJhgGmMgKNSBd2Q3dpU/uG6wkno6It0FE1sRWW?=
 =?us-ascii?Q?vBWidavxjCLGUXHJToxDTraANfFiTSBJ12eTtAVJla0x/99KTgnAGxULqH97?=
 =?us-ascii?Q?bs0vVZu9kmf7sKqQykguCRUMPNG3S8uLCtXP+CHDezLpaJlaurLaIQWYMT8X?=
 =?us-ascii?Q?y7iNXF2GIyR/k5L2yaDPAOlPqTOKA5pv2AkatIECDzltWQ3Q7TA06pPvbhZ/?=
 =?us-ascii?Q?leLkaxLKOSprrr5jFVF00yqwBTIM4Ajy7xRscNWJ5jFLFlscm2I5/QSpKJyu?=
 =?us-ascii?Q?haB/bMwdHi7YemlvPiCsEcYb+WICigC15PGyopN+0iTkdWv2RyzzO5dCmG2r?=
 =?us-ascii?Q?rXP/sZozxpvu1VsKD28PQP9FrHT517CRIRvCtXf0GHDtbyG4W9GroIO0V03o?=
 =?us-ascii?Q?h8SPptS7OsNEgO/miiXueZoVK+U9GQjBCFEqATAmcGn0M4l/dyQYjA+Ai+Zw?=
 =?us-ascii?Q?YIYDbn96ASv2EhyWoY595YNxpf+6xWkPZd0ZZ8fuc+cyjGWDILGvdiFPzd18?=
 =?us-ascii?Q?vL86Phad2KL05GpcXi63Vs51g/Zm6kMtE6VDDU2VNLq7ipP+wmSf7x4VhVgR?=
 =?us-ascii?Q?KonifVcGnvPbKq5g0JQx+YgH/EOU5KldQ3DRqh54mkC3IMn3G9w5zpTZTP2v?=
 =?us-ascii?Q?2F4g65j25dFaica83ngmZcrj0cISQ33Nr3rmbUnAUR34GqZBAE7FWH7BSxXy?=
 =?us-ascii?Q?IEIqzsKR2lYzSohBj5msBymcP+RkdlIL1juH0qP0rZO9cbMW/QLRMTAdHS7i?=
 =?us-ascii?Q?xhdnOUnCDeTqbCQawrgUwfdKvq3ogsf4dKacUdokVqCEad1uCEk9LW++6e2G?=
 =?us-ascii?Q?wqit2ChhCd7JJxVjDAT7j3WUxt4ZgZBKblW2XQkrrYT/zd9a/z9mi3sN2geC?=
 =?us-ascii?Q?LHN3pMa0Fu3wA56dJhYJEhBTYLwgCPLnURxvLvrhBSNVEKEh4Wq7M4ADk3R7?=
 =?us-ascii?Q?1p0XijDlVDTyNXgV3tCqNzHS0L7ANYauUgP4Y0Vzlyda4m3ifTThXEXU1LNP?=
 =?us-ascii?Q?gzoN387dcQv8BwupIQcnj6XB0jeKzgULEM4c3BHJqPglYT7SFWoW/yY5XtAX?=
 =?us-ascii?Q?KaR7EnaQq90lGdYYejObHDoezQyLkmB3gQboIS2rjLxWr3W40/lxlGG++UFX?=
 =?us-ascii?Q?Rw4ugOE0Ju/15jsc7BVwsGwrr8z1DoyoEYzb/E10TnGZE2V2dB1b3squGs6c?=
 =?us-ascii?Q?LVT9jqureGPShjDGdvefh0MZr2ERBPljKZtSdCEdjgmvmZ6CoBjwFx8yklV8?=
 =?us-ascii?Q?LnpEmhMAT+ptjuFOSykXC8q2HRrWn8bC0aA7gO5LmzfuvahwyiTxWk+joB4s?=
 =?us-ascii?Q?YjZybTApjG8mLMKH+ZGQ1hmWx0/eqZSx4vmtsCl+6fqWN21PRdOnIZaWZq+K?=
 =?us-ascii?Q?nF06kiOX2ZwkU+Yc83qoDSMe8l1Pwt0T2eMt8YDyJEPw3ZsjCMiXIoTYNRds?=
 =?us-ascii?Q?qK1apNF4Pjon5jn9SgWyxd22nozZXGiu5mN2LvO4P5taZROfXfqBWBsGwKpn?=
 =?us-ascii?Q?55ljfM95V1sWb4yDC+l1hEzFZ+9jbRvAOwwoJJMh78RptfIKSvTHIvHqJQBf?=
 =?us-ascii?Q?adPc0BaVuBZAwsIe4OHJE4dT1A239DJhtSudzMDZWjC7PXr5BiOPv0ymB4Uo?=
 =?us-ascii?Q?cZ6gz4aXJPTAabyj/mCWV6Hr7t/PDF1r9eot6MS1+c7Es9ycaMbI/YZZxgm2?=
 =?us-ascii?Q?EZLYK0MJeclY51jroAeFVXMmoSk+GRU4x8vengiVPiq5gJFVkfxpJFvsTfui?=
 =?us-ascii?Q?j6523/ZG4w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1192283-7067-45ef-56df-08de6e825576
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:11:59.3993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uH46gbwLSzAH7IKIaVxZJSkd1AJoaLA2ja6HE+oEKqwYrz7oXIE9VsToMCxIAgpp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8421
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
X-Rspamd-Queue-Id: B3FA915219E
X-Rspamd-Action: no action

habana has special code to check pci_p2pdma_distance() and rejects any
importer that cannot do P2P DMA to its MMIO.

Convert this directly to a SGT_P2P match which does the same check
inside the matching logic.

Someday this should be converted to use dma_buf_phys_vec_to_sgt() which
does the P2P checking correctly, for both direct and IOMMU based cases,
instead of this hack.

Remove the now empty attach function.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/accel/habanalabs/common/memory.c | 54 +++++++++++-------------
 1 file changed, 24 insertions(+), 30 deletions(-)

diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index 633db4bff46fc4..58dbc3c7f0877a 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -9,10 +9,10 @@
 #include "habanalabs.h"
 #include "../include/hw_ip/mmu/mmu_general.h"
 
+#include <linux/dma-buf-mapping.h>
 #include <linux/uaccess.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
-#include <linux/pci-p2pdma.h>
 
 MODULE_IMPORT_NS("DMA_BUF");
 
@@ -1704,23 +1704,6 @@ static struct sg_table *alloc_sgt_from_device_pages(struct hl_device *hdev, u64
 	return ERR_PTR(rc);
 }
 
-static int hl_dmabuf_attach(struct dma_buf *dmabuf,
-				struct dma_buf_attachment *attachment)
-{
-	struct hl_dmabuf_priv *hl_dmabuf;
-	struct hl_device *hdev;
-	int rc;
-
-	hl_dmabuf = dmabuf->priv;
-	hdev = hl_dmabuf->ctx->hdev;
-
-	rc = pci_p2pdma_distance(hdev->pdev, attachment->dev, true);
-
-	if (rc < 0)
-		attachment->peer2peer = false;
-	return 0;
-}
-
 static struct sg_table *hl_map_dmabuf(struct dma_buf_attachment *attachment,
 					enum dma_data_direction dir)
 {
@@ -1734,11 +1717,6 @@ static struct sg_table *hl_map_dmabuf(struct dma_buf_attachment *attachment,
 	hl_dmabuf = dma_buf->priv;
 	hdev = hl_dmabuf->ctx->hdev;
 
-	if (!attachment->peer2peer) {
-		dev_dbg(hdev->dev, "Failed to map dmabuf because p2p is disabled\n");
-		return ERR_PTR(-EPERM);
-	}
-
 	exported_size = hl_dmabuf->dmabuf->size;
 	offset = hl_dmabuf->offset;
 	phys_pg_pack = hl_dmabuf->phys_pg_pack;
@@ -1753,8 +1731,10 @@ static struct sg_table *hl_map_dmabuf(struct dma_buf_attachment *attachment,
 		page_size = hl_dmabuf->dmabuf->size;
 	}
 
-	sgt = alloc_sgt_from_device_pages(hdev, pages, npages, page_size, exported_size, offset,
-						attachment->dev, dir);
+	sgt = alloc_sgt_from_device_pages(hdev, pages, npages, page_size,
+					  exported_size, offset,
+					  dma_buf_sgt_dma_device(attachment),
+					  dir);
 	if (IS_ERR(sgt))
 		dev_err(hdev->dev, "failed (%ld) to initialize sgt for dmabuf\n", PTR_ERR(sgt));
 
@@ -1776,9 +1756,9 @@ static void hl_unmap_dmabuf(struct dma_buf_attachment *attachment,
 	 * a sync of the memory to the CPU's cache, as it never resided inside that cache.
 	 */
 	for_each_sgtable_dma_sg(sgt, sg, i)
-		dma_unmap_resource(attachment->dev, sg_dma_address(sg),
-					sg_dma_len(sg), dir,
-					DMA_ATTR_SKIP_CPU_SYNC);
+		dma_unmap_resource(dma_buf_sgt_dma_device(attachment),
+				   sg_dma_address(sg), sg_dma_len(sg), dir,
+				   DMA_ATTR_SKIP_CPU_SYNC);
 
 	/* Need to restore orig_nents because sg_free_table use that field */
 	sgt->orig_nents = sgt->nents;
@@ -1848,11 +1828,25 @@ static void hl_release_dmabuf(struct dma_buf *dmabuf)
 	kfree(hl_dmabuf);
 }
 
-static const struct dma_buf_ops habanalabs_dmabuf_ops = {
-	.attach = hl_dmabuf_attach,
+static const struct dma_buf_mapping_sgt_exp_ops hl_dma_buf_sgt_ops = {
 	.map_dma_buf = hl_map_dmabuf,
 	.unmap_dma_buf = hl_unmap_dmabuf,
+};
+
+static int hl_match_mapping(struct dma_buf_match_args *args)
+{
+	struct hl_dmabuf_priv *hl_dmabuf = args->dmabuf->priv;
+	struct dma_buf_mapping_match sgt_match[] = {
+		DMA_BUF_EMAPPING_SGT_P2P(&hl_dma_buf_sgt_ops,
+					 hl_dmabuf->ctx->hdev->pdev),
+	};
+
+	return dma_buf_match_mapping(args, sgt_match, ARRAY_SIZE(sgt_match));
+}
+
+static const struct dma_buf_ops habanalabs_dmabuf_ops = {
 	.release = hl_release_dmabuf,
+	.match_mapping = hl_match_mapping,
 };
 
 static int export_dmabuf(struct hl_ctx *ctx,
-- 
2.43.0

