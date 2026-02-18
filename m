Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHBKNt0DlWlRKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E43E152181
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5198810E2C3;
	Wed, 18 Feb 2026 00:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hKmgvDlo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010039.outbound.protection.outlook.com [52.101.56.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3282C10E2BF;
 Wed, 18 Feb 2026 00:12:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mh62rgtzcXPTNTf25IzITRxqZj1IrmppSZ/zuaqv+xPvp6UyjNRJH6QY6tF0LQfmHYthxVhCY7pEWsprogErHfR8avoDj6O26dzAJV5PblZSXfXXmaz/0jLxiYfVFatiIKpWWR8MtriokOkBgcR99Cs72dVOjXcE+Gsa8W3rlVdsc7ORQtHyClwgSiEEbg/g86COqbyISh4m8sxz5jvVxrjYoJDtB0xwu5vMtHivZzQCteuNJzupAwsRdAhm3T1hVKp8T218/Plx2rix/h71OrD+TTVg2cJ9xydDycdh6QJOW9mPkaYBEAGTjJdROwWIC/dXhjxbndSYyLwziOPGZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOVNAl5a+YNb8Sb4ZsYAIuPFnKJjvUje5tsgRaZRKPE=;
 b=K0wFBEf1rXLoloNtOiD/Bw4D/Exa8xBzhnaSR5z3/IZsoH50eW7zAop+Xrz8GRVS4uJ4LQo/WCBk2rINcBIgsGonf1aYUtTXl2mU/ASFkanQmyasBso1lpO+v1h2SaSCgXslE1FKO1EI0skqs5oPc7b6HiZ43ShEAqAi6Y3DpI6+1uKLcrvNaMbv9QVATXUdG2xFAtqnHHHFHW3nDzSoF38L0MV+eacLii4EC+o4IfTM9PK9+9CycVrPxyf6Qm0iYV51ncZ5d8ojs15cMcS0D+/xnCAYVo5/D6TQbe/HKOkodNsT2MxHnmMj71XEDTsWyvJRTUMjxny1kIUKOHM4cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOVNAl5a+YNb8Sb4ZsYAIuPFnKJjvUje5tsgRaZRKPE=;
 b=hKmgvDlowIiEjUEc2+BSjrF+iw5/T+5Lh9i8X/LE5czXXd749IajIEPXZyfEssPlufhDtURzwBJSmOvj/PHSaoPdj1MhR2DY5PFz5Wtign+MDxGLSdjygUBrZVus0MpK1LIBGKpL7HR74ySQC3fzbaLkNFUET0+Bwym2xvE1eZ7GJ20haem0+cjMYs3673vtLjKCKPhzof5oJ9NlpeVWiwqrNFyZ0rauLoLvHBZ0SIt2FEgfaiIeJXAiPLMhuGdKzUi/kwEDq09l3+zRC1GkQv+ZmUctw3Zot65BCO2l96a+MJ6krQN5G98IWBKE4EqK6eVJp0h54O8Oa6HX1iZWRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PR12MB8421.namprd12.prod.outlook.com (2603:10b6:208:40f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 00:12:02 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:12:02 +0000
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
Subject: [PATCH RFC 08/26] drm/vmwgfx: Use match_mapping instead of dummy calls
Date: Tue, 17 Feb 2026 20:11:39 -0400
Message-ID: <8-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0017.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::35) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PR12MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: 3460a050-7a41-48b0-6b8b-08de6e8255ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5vjqzrZ+QLiFDMAFotTFJEP0Q122Eajj7w6RWgHe38pVrLPZ1cOd/KifkI5w?=
 =?us-ascii?Q?0T5O33N7qEPEuh9apTgGf+eGfi2duXSqVIxR57RYmaekqw4YS+ep7XJby95i?=
 =?us-ascii?Q?SQACgx35GC36CCoTJ07ldUKDZnJsy2w6TJeAZ+oALOfYMwN4suEuaaLYxcgN?=
 =?us-ascii?Q?1X9VXtlan6ZiQ3Pj034pHLjqu3JkGn+S9o5GpaoZMokcWIRS1C3zeV3/7/KS?=
 =?us-ascii?Q?EQRswR395q2+W3AHKDvrlsv+B4Z0itdJ4uozfIWNUWxViwPouNkUKpEvhTvy?=
 =?us-ascii?Q?0/FSdgBSSuBySbisEgIAV6Ae3vInOg4XWTFZWI5SZKx4O7Ee2rhqElzqb92M?=
 =?us-ascii?Q?iJJtD7CoWbqAkP8n9oUfLYW8Adb7lCoPKFxZGsbRBHd6Jn75HqCu8Rg+QDqn?=
 =?us-ascii?Q?5/RiX0Wpu3v3lLgEAPQeQhZG4yNNVDkUgV3hiAZb/l50uj0bjZ9ra+Lg2R/0?=
 =?us-ascii?Q?AhA6kUepaqbuWlHg+JC4OxjCnL6uL5EWcmfvg9/QWR96GIXmabLgIHyqspFi?=
 =?us-ascii?Q?yo+yKdrrNu90ionFM5AcJvAFz+L9PVTcyiI/T1I1aMw8wDMqka8Uerysfj/t?=
 =?us-ascii?Q?W7e46RYoATluhoDB6YjOtZ3bIWAFLRMeZVisLB1+RVhrxS9Dl/gkkJGZd670?=
 =?us-ascii?Q?mEVbpnbJCJ7PN84kexkKaCPe1ZJHvbhyrpRleiINkEjv1JqaSVFoSIlc8+bn?=
 =?us-ascii?Q?DwaWSr8/YxLk/4W76QN+5+A91iLfv/m6axUnJUh1+9BY9P/MmvigIkCs5FHd?=
 =?us-ascii?Q?3pfqoCciTqqtoEqY0GacceT40DPGP00VDqz6lp7satL87u8CyRwY7HWgvmvZ?=
 =?us-ascii?Q?/YZkncYmSL4QpZK0YryTJg+MOmlF+qZdRSoihoddD58YctxgSea7Qr5+IzHU?=
 =?us-ascii?Q?VlNkGtHRG8z8GeGRLKksoux+G2RW9h8We4YM822zPGps9ojouSB+C1yTnkY0?=
 =?us-ascii?Q?vJrVuaLGrp1rjRb2Pq7SU0Qk17jCRrk25v7mhaoAXTEZ59zQIgDGkgvIKD21?=
 =?us-ascii?Q?0nRAhA9xxTC6QoCnj7VdbdP1KB6caG/MLV3cSRej9gDjZeQkXx9vHbfDzYOD?=
 =?us-ascii?Q?7oDkXiKsL3vs8a4B+hVLyYsXXswVMOF545eAzIHYXFkDmg3XCPUeD8HlpNGL?=
 =?us-ascii?Q?YB9FcfNAYWcQd2aQeDVHhrvZJHa7+c/oArw6TU47Cd4TrfRXVuNORJAr8qrq?=
 =?us-ascii?Q?Mi0vQsS4xMh8O4sS0fk96O7SkZ6GPBUM2wV+4j6hd5dW3/92pPZzKqgNZ9tZ?=
 =?us-ascii?Q?xGbo/xPvvQFmm21DHEnU+sPrQtMsKJ3MmbGCd880F9Wk54CsoqX+orK6uWaj?=
 =?us-ascii?Q?lyLxuXKW2aFjgLC9MmtxhxTpGI3QQITMvp6zJ8rq3JXTjSZKuyl7rdhc6FUr?=
 =?us-ascii?Q?jR2OrEApieo2fU7R2vZxuypj/INTIib09uleFtnpwybQtDVJH4OsXJMBAFCw?=
 =?us-ascii?Q?amFDnF4wNmrK5CjPysqLIVyJs5gX0padRkSrIyJ4PMVGr25bk9pb4/JobBgr?=
 =?us-ascii?Q?4m807/DiEkZ0UtyPKQwo4yiadp0PhQLgSMJ+3V9HstsOrX37XSLqBbWjGRMi?=
 =?us-ascii?Q?UWxCgKf63oZjRM+7Ccw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oZCr2k21qFtXi7eZ7r4QENE9Sbc6NHCm9DhwZH7Zdanabnw3YXOz9F4Uz9Pp?=
 =?us-ascii?Q?/3DikOxeu2asR3wuwtymp5VuERwlIJPwYIrQmMX6ZEyGpstHjSeDi4LGiBTX?=
 =?us-ascii?Q?V51OBYw2ctjCC43e1utiXkr3fdibKvdd0EUmnJkZBqRlDIALAwOft1FvzYZQ?=
 =?us-ascii?Q?dK5lz2HMA5EsMtgaluGDUAd4VXn4LcdoP3EW+LPlLmJGSoDdlD+wZfJDBevC?=
 =?us-ascii?Q?a7XFTBto1DG6aVRex3YW70RfinUOu8EFZnISFgvyx2Aeqso8IgUJ69/Rlyml?=
 =?us-ascii?Q?QZlSs7EcKZbdcrDYiJMqaXrhg+TQ/3QY3rmjqVhsXRJjkVbuJeyUhn4FN2Qo?=
 =?us-ascii?Q?4jh+F5L78QHrc5MWgC78B4CkhKUCPgBEg8itxDNYsJN9pyr1bUDXaFUuh4qA?=
 =?us-ascii?Q?uMues02ot4tSnjKavFRYr8PgE4D6X1+Uki5Ow0TDjTBjS94HBhE1sY/42RA6?=
 =?us-ascii?Q?sm185sQOKks3eLb7jxPDaj0hjWk9p9VnGj9j2La3SPUAnEqNGudYZJzwDLrw?=
 =?us-ascii?Q?LmvzTzZ5eT2etCX1R6gcKiN59YcodBSUhhW8dqwfSLofc+V57JMPwENw3OQp?=
 =?us-ascii?Q?hLNvJq+qvQyfMbD/LWW9ohFBiKflpT3miSvM5Rp6Q5tUWja+xcNxQ7XpmkG9?=
 =?us-ascii?Q?YvS2tjjQYYBm+evwGZGpiDwXWR+cr9xJ/7B+8cIlhKYl8kifuVz7oUc3T6ql?=
 =?us-ascii?Q?+nEYy22XepQxNHVBcroZJZSpBfj7979EM6qaKQW551MufTF2LRhEpHRfmVq/?=
 =?us-ascii?Q?KDPEFCb0+1fDEQK2jfHk3MOHtc4siFokPb4VH5p/dXEcZ25K5gFaiXxhDIjm?=
 =?us-ascii?Q?X6KGf8N3I/V8Sm8Du+fHZq1WV/v7pNzbO0J4Lj0HXPDBQMKpgZYoO0wRiuZK?=
 =?us-ascii?Q?LG6wvpNTV/QNcvY2h/MWmw9uGdeFDnBnUye+nJ9jfIBIrMuET0vI3hL0uUUi?=
 =?us-ascii?Q?ypZwoPhiy4fpve5MkxIdj6KqAPHaQIUi7Y9ZJhzc0cZGOyeUgUBwZ2CttcHH?=
 =?us-ascii?Q?G2DqwMkZ5Ec1ycq1lz6zDwoVX9YIoiThdUQnjqQSJVsRmqo8yi+PNb5r6DMo?=
 =?us-ascii?Q?3xbFIhLC/3wdKZm1eKLRtmnqASue56w6PXz+yrlLz4cCdlmhakxZom/+m3FY?=
 =?us-ascii?Q?x+FLulck1SkRA+hc7wUiUMDLCifzmSHu4le6J6qEhGRRYKAV1imHkieymgQo?=
 =?us-ascii?Q?lMDJuQeP28WRDSuh/u0c/tvd1z7fM9w+whd1HFw7skTYZfgQ2k3lLCufTBJd?=
 =?us-ascii?Q?gODLtDrbgA9Q6kDpQMlgfeZjgOGpDcCd/7LAbSp0xEtsLNPgS403iXNCa3E5?=
 =?us-ascii?Q?N+471Go9Nnbuc8PpicLQ538knVnDPxDCEng3+bD0T+ZKXqyGH3hmnbZwuK6P?=
 =?us-ascii?Q?IYnp3OgvrS6f/gK4gsDHRJpGbcwf7t0gp+XV7kfDvN3jjJcC4klcCpIoSUn0?=
 =?us-ascii?Q?L0u6xpqS+i1himSZFYXT0cpKq1rDuFD7TM/0cGsLI4xhVV7o1mmc9WpM22Ll?=
 =?us-ascii?Q?BUaNzfooX3fF27HSqTyAV3YQzY9o+ripaUriKi/msS/Sib4oGLaKRJ1DiaLo?=
 =?us-ascii?Q?a189K+CJFk1NVcY59fdN1B4SeioaYH/mg5R3/zeWwbbal45XZGGjXcCN9OOP?=
 =?us-ascii?Q?mXIqLEg5WlAj85Avfx3BBuGWCF7ZWhuCH6WUt4fW96Wa67jklmT4V6ApiNxw?=
 =?us-ascii?Q?GGgFtr5mwXQQhjwVrnaBSah/WTIqNPjiMTbOj0ENq/Qp+5zpINJi9G1CQNUF?=
 =?us-ascii?Q?PiXmKeobEQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3460a050-7a41-48b0-6b8b-08de6e8255ea
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:12:00.1927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpFC6B0xLVDN3LlnX5O0aR5sMu2zoi9tK8oBaXZ9YVP6qJupuil67dOV9WHlqPa1
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
X-Rspamd-Queue-Id: 8E43E152181
X-Rspamd-Action: no action

vmwgfx is creating a DMA-buf that cannot be attached by providing
always fail functions for dma_buf_ops.

The attach/detach callbacks are already optional inside DMA-buf, but
dma_buf_export() is checking for non-null map/unmap callbacks.

Instead use the mapping type interface and provide an always fail
match_mapping(). Remove the unused SGT and attach/detach functions, they
can never be called if match_mapping() fails.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_prime.c | 32 +++++----------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_prime.c b/drivers/gpu/drm/vmwgfx/vmwgfx_prime.c
index 598b90ac7590b5..90e4342a378d5d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_prime.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_prime.c
@@ -35,41 +35,19 @@
 #include "vmwgfx_bo.h"
 #include "ttm_object.h"
 #include <linux/dma-buf.h>
+#include <linux/dma-buf-mapping.h>
 
 /*
- * DMA-BUF attach- and mapping methods. No need to implement
- * these until we have other virtual devices use them.
+ * No need to implement these until we have other virtual devices use them.
  */
-
-static int vmw_prime_map_attach(struct dma_buf *dma_buf,
-				struct dma_buf_attachment *attach)
-{
-	return -ENOSYS;
-}
-
-static void vmw_prime_map_detach(struct dma_buf *dma_buf,
-				 struct dma_buf_attachment *attach)
-{
-}
-
-static struct sg_table *vmw_prime_map_dma_buf(struct dma_buf_attachment *attach,
-					      enum dma_data_direction dir)
-{
-	return ERR_PTR(-ENOSYS);
-}
-
-static void vmw_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
-				    struct sg_table *sgb,
-				    enum dma_data_direction dir)
+static int vmw_prime_match_mapping(struct dma_buf_match_args *args)
 {
+	return -EOPNOTSUPP;
 }
 
 const struct dma_buf_ops vmw_prime_dmabuf_ops =  {
-	.attach = vmw_prime_map_attach,
-	.detach = vmw_prime_map_detach,
-	.map_dma_buf = vmw_prime_map_dma_buf,
-	.unmap_dma_buf = vmw_prime_unmap_dma_buf,
 	.release = NULL,
+	.match_mapping = vmw_prime_match_mapping,
 };
 
 int vmw_prime_fd_to_handle(struct drm_device *dev,
-- 
2.43.0

