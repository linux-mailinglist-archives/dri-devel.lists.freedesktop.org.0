Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN5HIBwGlWl5KAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:21:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3476415236E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F1910E549;
	Wed, 18 Feb 2026 00:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gB3nRKNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012048.outbound.protection.outlook.com
 [40.107.200.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8855410E549;
 Wed, 18 Feb 2026 00:21:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wpfvTqHwHoc0eOhsVKpJhmXNHqMLa4N8nigEC0QPJqn0QKtz4zDUj+JPcMLYcVUXs1FL7MX6woanKBhYe7waelVm2DdB4JoeQ3os6rI/7HM1NSJ17zK1vnMaZZGqOs1gH4NmqlLpFg9UZUsiPOoBpNVHd3S/CNkTRuTXtexyFEL6WmPI52Z+Trla0JrPMonFxlaFrRD55CcYLhaMIsOUUtmgyZ/YAJGfyxiuBDeACVsbjvtP4RvvwvtYT04odsxIfdz+FiMdoL8OWfMjINF1xfuvvxfY5P420HBsE5bt12vWb+4lQk3lZ4yd1j2kcIMwUmgtsIszRM4DhcxNRNar/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqfrcRURbFQBF2ammul/YzfTE/g/e//hwDZAVS123Xo=;
 b=CvehU122ytDNHhHv+EkD5otO8MsJ+nw4hwcQkgM4+yvKxLc1le1M8gJOROBjeF0Spdqp69r6c8TVNVyV9neSkbzwG+jtmc+WONig+sS4d+UwsNhweHsc/vLEEmOb972NzPEl1WC7HirhqNM/Coo7z6H4vx3+5K4Dz+1QG+qOW2nlAUkCwTxP9soeZeV3UMewZnNaXjZttybFpI9AhK6jJ5XpQuzuLVlyU51RDWdPn6atzGGsKs9D3IPmEclgRjqRCdzID2ALl9eS4UDXSDwWv+iz2RWc00RQmAIvGoZNSQ4PvL/MrPlODpBBtkmJshYX6IfXFwdf7ZUHmFQDQnu97g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqfrcRURbFQBF2ammul/YzfTE/g/e//hwDZAVS123Xo=;
 b=gB3nRKNhJNFKOH8OX/9G7ds0RpojFYxXECd71uwccgsW8S24iRdNARMqCaCezKo50QnmzNLLBWRgUvP953zT7or7Nvr5tGGumJDR/uit/1QGa3Le0Cjw9J3FRw5ZQ4jcXps7g9rYYMLkqu3S4b1cp5INzMHHUjkMEIp2xWz+m5J55Pjov1TBlfEfiXNT2+Nle9pZGsuAWWtBUW7WTiIUPOwdfSAcqRxv4+4D8f9Vml+WHj9A1sNvGU0pSTYCaYjMdrnaVuWKffXgMCiEaCKbVAsTviaHdpaPeiUi6Q3c0+oU6b6jQDzYQiomexIFphN/uKrQDl60D1tdU6MX83xADA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY3PR12MB9629.namprd12.prod.outlook.com (2603:10b6:930:101::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 00:21:38 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:21:38 +0000
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
Subject: [PATCH RFC 21/26] dma-buf: Add the Physical Address List DMA mapping
 type
Date: Tue, 17 Feb 2026 20:11:52 -0400
Message-ID: <21-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0061.namprd15.prod.outlook.com
 (2603:10b6:208:237::30) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY3PR12MB9629:EE_
X-MS-Office365-Filtering-Correlation-Id: 23862799-22ca-4682-9e31-08de6e83aeab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JxE5mIUs3LSeQxT5nmpEYjBITpLz9b70NwVBdKhk5wgA/4G9lmcEfoJKsQbB?=
 =?us-ascii?Q?id0PnDFl9LL5eAEesoTypDOqL7wMJ+YBicTCh576+H1fI5Pgeeleu16J/BsV?=
 =?us-ascii?Q?r+9vIYtSHdU7YgzJZ6CVpHJ6HPUM0OVQSbbR694QBqZ7U/mqVlD05WWnN/LR?=
 =?us-ascii?Q?H6dM31v1AE03mxAQuwDI5MO0oKx55pcTRqYdNbnzjrsmtE5Z5QbGfsWlM2kw?=
 =?us-ascii?Q?b8WtqReyUDnNjPIak0uVfqoPljEBihqWaRUmlVUw41JeiKeCGlsjkwNsZe2c?=
 =?us-ascii?Q?Fd9+ZLCTs79R/osOkw96kWcdGWMPPX0saDyuG6Z5gX6jNKpuYp7uC/QzgzCC?=
 =?us-ascii?Q?2TPh8H8dB9Uk7TAXaT7+n68yQpIQo8XrJtvcUHbP1g2LPcMd1D0BguXG5V+z?=
 =?us-ascii?Q?vrEPZYLkfyMe8Xy0stqPRxQioshkUegDYm+oEJejsJqcv/LxYCpMG61idfHt?=
 =?us-ascii?Q?01gpvybG9LMY6D+AJsMX2qP1nMAjjsgzGrajbfUSC4tPrNM0hJGJ8JjrKpvU?=
 =?us-ascii?Q?xjJKrXNz0ZPrsOrQ14TC2hi+nCuBVfh6H00JBpykOLf/tYj27/Z+FGPqruEc?=
 =?us-ascii?Q?PIwf14u0wAu+EqF1E2MR3wjV15XxqOl1oirAff3lLY2AH6dzsXvnybrX0Gxl?=
 =?us-ascii?Q?HOtE7GVCANkB9yk8GqFl9VFqatBkwXJzRQlzwRa9YVGyrElBeBxhxoYXkxgD?=
 =?us-ascii?Q?NKTJMbvv5i4V4ezrIUj8d7cBFF6ZCeiXbaHudqBWwxsPjxvnj1V7qpmSVEZJ?=
 =?us-ascii?Q?2I6fZzzWxdo94HmQL8Ll/+npWJ304BoYwOrKV5hVpqoNU/4aRAjsg6EjE112?=
 =?us-ascii?Q?KrKnEiIBOTDUf5drCFvwQp7X8Gnhvmy+iAqAHQ6ABZRtFJlTGMEFf81o9tej?=
 =?us-ascii?Q?eZhBYQXM+8hS81rdyx9jN78fHvE4qJOFVEev2WA6+NcUkrlVsztJSTPrMBnf?=
 =?us-ascii?Q?LQc0X7zToMzejXRZqtWXra82CG5tQjPubPThgKqgEUoQj0nAbui/h4u2EaF/?=
 =?us-ascii?Q?ySfgGIO3EB5VL6GZ5tBAx5cQB+dFFNiQdlEqFP0iRRkYar0YUhoI7gSd4w+U?=
 =?us-ascii?Q?84dAoaUCIxHR4t0GtWgB6siE3xnAGhXuHpkunGwCOgm/5Lx+wVjK1U9K9tuq?=
 =?us-ascii?Q?P4ssmjlzqEY+TwGhKMjjTFK2ywhSeVi6v7UeF9s0qujewsTnw2CdrfuR+thf?=
 =?us-ascii?Q?jKMPx3P9vUyYbMrgebsQoiP43QKQcSvegDDWeeRp/6eQoLyhhjTx9GHiWg4j?=
 =?us-ascii?Q?pjLEmz1vVWlzhBK3cyR9MzNGcvs4iF1hdey4/tCWnaTGJhw7zxMg0IGJIQaR?=
 =?us-ascii?Q?02oJ97Rb5nAxcaTspi9a/6cEyd3Go6NV85drSKVTidmgMEpzc0u8q1WtLzqn?=
 =?us-ascii?Q?Pbl6u71z15ugIciCtgOcGD7jf1COZO3AWcVNmhSgAthnpcDkxdP/3Yt4ja4k?=
 =?us-ascii?Q?O2/l9xunAcIKb8IV2Im+QOrIL8um0NlocJ+yhLHubEBwQ8zIDkgCrox4Oqss?=
 =?us-ascii?Q?qiMLTC5uTibPAI4akssVWcg1EL0dfaFWGcMpjUHzWEYtHWTMbd8FB3/JzA+W?=
 =?us-ascii?Q?aT7st04ee+95UnqOpoQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jak9PIRMhOz1n40AJoU+MjvbIYDtMYKxdKz1keJaUPfvZOanaC4rAdzZHBif?=
 =?us-ascii?Q?5gUCCWcw8lFYc6xJV7AvDpsH3OO9KskNkPQTzB8zKKYWnDwK5uG5OjFHAnL2?=
 =?us-ascii?Q?3NrrySGhVh/wTSY3XguaB1uM5rcIOkQuvG32hUhBbU3X4THx9FOak1O4350+?=
 =?us-ascii?Q?OgmiQ3eqnGRsxI3RQo7c8SBNgKd1qMFvL2Z3jxH+E1fHk6SjmZQgRQ66wHaG?=
 =?us-ascii?Q?AbqYHb43br1EW39NtGfPiSOq78029gDVtNQuW/57mntGDRdjKe1oS7+H4ugY?=
 =?us-ascii?Q?CLHnC4ungLL6l02CJVzl6gCIgVOhjICfDErAYP2szMQF+huNB4a1zh0YM8H+?=
 =?us-ascii?Q?+wP+jmRPuius5OQTnFcxJbcoxMOM/MofeqQDjoAkJzznViA9gOlqerdNuI7E?=
 =?us-ascii?Q?Rwp89EERX5oNTJ8rgzr+P5MOLO2vDFS80nSkLozQvrK1UOq4CoV4jOYFy840?=
 =?us-ascii?Q?OZicsdlM+iLs5BMwq6LARug2nCrJkAkvuzgVvtSZlehyg/A9buX1+t33dskg?=
 =?us-ascii?Q?RbOMxMCMS/cCROheXJuELJ89lyXPVfpEHT9wl719jbSLCCFyW7Aco7Lf3qJE?=
 =?us-ascii?Q?02Rh/PG2qST6v4JI9KiF3RGwlZqAFjernipcap2dl1NV7i67cqI0vN22zMCH?=
 =?us-ascii?Q?uMrlCZyLJiGhQaiU+26VSKWLjjSgVz+JpdFX7CZeXxl6WbM+fQBMO4TH2myQ?=
 =?us-ascii?Q?SbcNIVJTzUChkoH54yLC6D1OcwuqhVHCmBiG+GbrciGnA7scU+q53+n1zroc?=
 =?us-ascii?Q?a42eg5PHkP3wlV3N6whb0qz6xLmd+nxEpG0D7jbz7A+FI/UOE2hTfe/fWmIr?=
 =?us-ascii?Q?CAIknIEoWFtk5DhLDgs8Mu+Q6DvgbZJ1V6tRmpZk3hlyj64KYVXcnt8Pdu9V?=
 =?us-ascii?Q?jTYAZXSdKZISyViQ1W2GvaFXvnSiGt63sZebwgVUNcvFkouqnMmZ45Govia6?=
 =?us-ascii?Q?NuAPUJpD3Y98sVFo9TxD8Fp+YZEcWyEEWSUZrZqCv4ODw+gmQ1rAD4BvPd/R?=
 =?us-ascii?Q?IFjeSL4H0l6lZewIPQwhPRJCOev5mzuJQBDgr4KvZXLNdStcAM/UX2nkew/0?=
 =?us-ascii?Q?gBtJt5MZd1dlx6E500Lf1P4fVU+IEvkoQrYiBVDuneAogpp0tikfjgH0Hajg?=
 =?us-ascii?Q?FBhxksSCAFuHb30pHyiiTtIXNiSfAR4JcsE5bj6Kqq4ZDKIU3S0RgVmHQKLl?=
 =?us-ascii?Q?NPIUnuHnbbxLjPw0qCJrROoAMYSPiHo+p9wM8CrunHllFseyfFHtqDUZiysm?=
 =?us-ascii?Q?RLLQonqG084p5/8x8ed6AtzDw4xe/UYu1ygh8pkSBNbUaFDMJcEbhWCl+i+1?=
 =?us-ascii?Q?JJnrys0GTWHLIB2zTNOY2IIW1GrJr1Xk0hlpf0f0ud7zsuVS9XduttwpIckM?=
 =?us-ascii?Q?YTOYRq2i3aBpOctjkYqRQH0i52xlWjn/O2iJDQq0E12hA11xu6aT9X7fMSUG?=
 =?us-ascii?Q?I1fNZLAWnURT8hAIubwsHjPyZy8v6V4tNGdNSlLTo5+vxgZ8RxrvxvJD6dzW?=
 =?us-ascii?Q?jel4pNAuqZhOLejj9yOlujxsrYzab7JE7Oe+vLjFCTaiAjUqw0PFILeElpvM?=
 =?us-ascii?Q?gMVBaCpQKwNEYNo4tNXQTQf1Ovvo9GnInGJ8+Dpd40JpnHH/d8mKg/m4LoWk?=
 =?us-ascii?Q?t76LtBSmCWAQIcggtzTB8TEpK8S7raSiGARQrWVU6V7XDBkAEPCl1z5dGn6G?=
 =?us-ascii?Q?WuJTAR+H5/Ywx9mKIYRPTT8mouqhCyKLY0fR0D8Q6qR9YVGn2QMl6P960Gcp?=
 =?us-ascii?Q?Q1YZXeVZrw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23862799-22ca-4682-9e31-08de6e83aeab
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:21:38.6287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sskir//+2FLvuTIOOt5cQ0LQ+r41G+rER5bnA2AWNZPKNZos7HaWtTj8m/FLxqHs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9629
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 3476415236E
X-Rspamd-Action: no action

This type is required by iommufd and kvm as dmabuf importers.

Due to sensitivity about abusing physical addresses, restrict importers by
using EXPORT_SYMBOL_FOR_MODULES(). Only iommufd can implement an importer,
the kernel module loader will enforce this.

Allow anything to implement an exporter as there are use cases in
DPDK/SPDK to connect GPU memory into VFIO/iommufd and it is hard to abuse
the API as an exporter.

The physical address list exporter returns a physical address list in a
simple kvalloc'd array of struct phys_vec.

For now all entries are assumed to be MMIO and iommufd will map into
the IOMMU using the IOMMU_MMIO flag.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma-buf/dma-buf-mapping.c | 63 +++++++++++++++++++++++++++++++
 include/linux/dma-buf-mapping.h   | 42 +++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index baa96b37e2c6bd..d9d6b9b5bf05c6 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -349,3 +349,66 @@ struct dma_buf_mapping_type dma_buf_mapping_sgt_type = {
 	.debugfs_dump = dma_buf_sgt_debugfs_dump,
 };
 EXPORT_SYMBOL_NS_GPL(dma_buf_mapping_sgt_type, "DMA_BUF");
+
+static const struct dma_buf_mapping_pal_exp_ops *
+to_pal_exp_ops(struct dma_buf_attachment *attach)
+{
+	return container_of(attach->map_type.exp_ops,
+			    struct dma_buf_mapping_pal_exp_ops, ops);
+}
+
+/**
+ * dma_buf_pal_map_phys - Obtain the physical address list for a PAL attachment
+ * @attach: The DMA-buf attachment
+ *
+ * Calls the exporter's map_phys() callback to retrieve the physical address
+ * list for the buffer. The caller must hold the dma-buf's reservation lock.
+ *
+ * This symbol is restricted to iommufd to prevent misuse.
+ *
+ * Returns the physical address list on success, or an ERR_PTR on failure.
+ * The returned list must be freed with dma_buf_pal_unmap_phys().
+ */
+struct dma_buf_phys_list *
+dma_buf_pal_map_phys(struct dma_buf_attachment *attach)
+{
+	dma_resv_assert_held(attach->dmabuf->resv);
+	return to_pal_exp_ops(attach)->map_phys(attach);
+}
+/*
+ * Restricted, iommufd is the only importer allowed to prevent misuse of this
+ * API.
+ */
+EXPORT_SYMBOL_FOR_MODULES(dma_buf_pal_map_phys, "iommufd");
+
+/**
+ * dma_buf_pal_unmap_phys - Unmap a physical address list
+ * @attach: The DMA-buf attachment
+ * @phys: The physical address list returned by dma_buf_pal_map_phys()
+ *
+ * Returns the mapping back to the exporter. After this point the importer may
+ * not touch any of the addresses in any way.
+ */
+void dma_buf_pal_unmap_phys(struct dma_buf_attachment *attach,
+			    struct dma_buf_phys_list *phys)
+{
+	to_pal_exp_ops(attach)->unmap_phys(attach, phys);
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_pal_unmap_phys, "DMA_BUF");
+
+static inline void
+dma_buf_pal_finish_match(struct dma_buf_match_args *args,
+			 const struct dma_buf_mapping_match *exp,
+			 const struct dma_buf_mapping_match *imp)
+{
+	args->attach->map_type = (struct dma_buf_mapping_match){
+		.type = &dma_buf_mapping_pal_type,
+		.exp_ops = exp->exp_ops,
+	};
+}
+
+struct dma_buf_mapping_type dma_buf_mapping_pal_type = {
+	.name = "Physical Address List",
+	.finish_match = dma_buf_pal_finish_match,
+};
+EXPORT_SYMBOL_NS_GPL(dma_buf_mapping_pal_type, "DMA_BUF");
diff --git a/include/linux/dma-buf-mapping.h b/include/linux/dma-buf-mapping.h
index ac859b8913edcd..10831ce2e72851 100644
--- a/include/linux/dma-buf-mapping.h
+++ b/include/linux/dma-buf-mapping.h
@@ -269,4 +269,46 @@ DMA_BUF_EMAPPING_SGT_P2P(const struct dma_buf_mapping_sgt_exp_ops *exp_ops,
 			.exporter_requires_p2p = DMA_SGT_NO_P2P,         \
 		} })
 
+/*
+ * Physical Address List mapping type
+ *
+ * Use of the Physical Address List type is restricted to prevent abuse of the
+ * physical addresses API. Please check with the DMA BUF maintainers before
+ * trying to use it.
+ */
+struct dma_buf_phys_list {
+	size_t length;
+	struct dma_buf_phys_vec phys[] __counted_by(length);
+};
+
+extern struct dma_buf_mapping_type dma_buf_mapping_pal_type;
+
+struct dma_buf_mapping_pal_exp_ops {
+	struct dma_buf_mapping_exp_ops ops;
+	struct dma_buf_phys_list *(*map_phys)(struct dma_buf_attachment *attach);
+	void (*unmap_phys)(struct dma_buf_attachment *attach,
+			   struct dma_buf_phys_list *phys);
+};
+
+struct dma_buf_phys_list *
+dma_buf_pal_map_phys(struct dma_buf_attachment *attach);
+void dma_buf_pal_unmap_phys(struct dma_buf_attachment *attach,
+			    struct dma_buf_phys_list *phys);
+
+static inline struct dma_buf_mapping_match DMA_BUF_IMAPPING_PAL(void)
+{
+	return (struct dma_buf_mapping_match){
+		.type = &dma_buf_mapping_pal_type,
+	};
+}
+
+static inline struct dma_buf_mapping_match
+DMA_BUF_EMAPPING_PAL(const struct dma_buf_mapping_pal_exp_ops *exp_ops)
+{
+	return (struct dma_buf_mapping_match){
+		.type = &dma_buf_mapping_pal_type,
+		.exp_ops = &exp_ops->ops,
+	};
+}
+
 #endif
-- 
2.43.0

