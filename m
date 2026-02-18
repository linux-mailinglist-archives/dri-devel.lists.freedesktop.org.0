Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAAvKNwDlWlRKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD13152179
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 01:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F15610E2BF;
	Wed, 18 Feb 2026 00:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z6eVDTB2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012004.outbound.protection.outlook.com [52.101.48.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DDC10E2B7;
 Wed, 18 Feb 2026 00:12:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egQCboSGBjbs3RTCe3zPBE3Yvj/JNx6uTHbkmSyapvyNpeGnrkQLLcTwVQmUcRWetE7DflXx+Z14TX5gxjVKrOGJPyabxz/lagHSQWFlNIWRW109YukEiLBoPmIF0BNLqLRHloJo8LLzPNt7/N5GQBIhvXNVsepwlV4dy3N6uvUjq/jEe0rhW+HT5Lh6UjDq0n6QM2AvJRSyzr/0AXYfbuole5z+sUTl/H8NKexfrsNXtyqyYf1P8T9d0ZO5li+2dfxU0rlJQCKuyuFimvuNRt/yi3Un/lUULVFezIg5Ty0g45xZNysrQtMzbLRe0Bqy6gcV2Z33WEvwuKGTQTOBuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKtNeGf/Aw7nRXfSZ32Nt2Md2eA0m8hOSb2XYTVCdWg=;
 b=f3dqlxRvouVcn414JTTx2Rrj5l4/WK8FvUpZaaQLNaE2XsE9ffr5ltdKTux3NWjxOmUnML7I2uODw5RLfpCnEBGBshi8juCDqXP3zJjdR7Ft4FyPKfJ19qo6rE/YutBqTYa+y/e0XllUGh++p2Pv7YCvFwa2USgyQNYw5uKHAmoN8HmfFehNX0tchuEx6AmPVR2j5AYnlizI6YKgLmzuW1SgEOfmmWbPavR7y9uZvudI1/Y/B5K4Ch/BVz6jX2rqIENfbAYkEYs8FfcjevBjfs9VTW8ISzbH9IfDqqwkfykdmOmyjE1KEJDnOFM09oyYRXUZlFvjcbi5bMz5iFfuqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKtNeGf/Aw7nRXfSZ32Nt2Md2eA0m8hOSb2XYTVCdWg=;
 b=Z6eVDTB28sd+DoR+4ijwZNqyeMuxHq5iOTsXtCeZ972OOoG4L3f8Fz6mLtnwYgzqL7gtYULji5f5XUOwkf0imS0oVHnPhkCxWXIthOliWgvhshaFT1B6M6VJwpkVNwXTrEHH/MmJ4q4+lL5suSq5vMAfQ2umjeH+VBY6RFigQWy7+kKkMOw1rBJHoOo5mXutlKAsnvTAbzkVPwxd6A0bsMRTNsVwpzaviOvSvOZeOAmB00BGWFG4XfSqrpnGUV9BeQ6pqUN0jVAiGh7efmRrU4+mqUv2i8oXiHNNtzBJs+iCfAKAZpFVOwxbzBWdLS+IqY12I0aKc7iuTLYd8hGsIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PR12MB8421.namprd12.prod.outlook.com (2603:10b6:208:40f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 00:11:59 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 00:11:59 +0000
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
Subject: [PATCH RFC 01/26] dma-buf: Introduce DMA-buf mapping types
Date: Tue, 17 Feb 2026 20:11:32 -0400
Message-ID: <1-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
In-Reply-To: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0238.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::33) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PR12MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: a378edba-f3c6-4989-5734-08de6e82550b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MITiAMLXzna2dP1tnI6n7ojD9GLcojx4oLbZ1ts+rTuMMCzpYXVzyVVi80W9?=
 =?us-ascii?Q?y2ynVhmPNcWCqSeli6urtCCkr3UOG7rEp82AxSebdz3EF8FK5Q9iFPyUhM0H?=
 =?us-ascii?Q?3JzD6jz2tRdZ6UpZGBqC8yhzeOVe0KUv83sfQQD+Z4TaGciRCmFOqkisXQcV?=
 =?us-ascii?Q?PQM0cdblUhDSExSIc+I/rzDQCP4IpPU9hlbiGdIW/fFtjMAO33HxDAj8GUiW?=
 =?us-ascii?Q?qguIedWX4IuqAJ84mh6Z/pa6PvUUZQO7HaaEKctz3vBX/0jhtjVdDIr1btnT?=
 =?us-ascii?Q?Yz1+xp7B+frs3vUTcfAsJE0rHtghKmrBdNz65eyNcJS1QyIKDUZvnPvPFGoA?=
 =?us-ascii?Q?hrfmX6dQ70ioZg8Ate+MU5+J6rq0FhmyOXYAbIwbzdDjwxGxkH3zVEbdn7RM?=
 =?us-ascii?Q?fDgF47odZtyBeDeDJrlLWUYSIZ4jpWjOfeHYiBbG1VSrCJWUEcYshd1iaRcS?=
 =?us-ascii?Q?BvYKka6r++NZdSU6sOT4SrDHUKrnVAbbN1fs0V63Rb/b9R6VTUmXHxdpnvr+?=
 =?us-ascii?Q?DFA+BL4QtK09xTNqcMnmHEDGQnTTSJ2xA8JDJICkDf1Gge/XkGXvWYS8dG3m?=
 =?us-ascii?Q?S8rL45oopM79YT6SKOY9xL1a/5vnadj/edETBm7SuSwUlpaTKTZOjGJSMAoH?=
 =?us-ascii?Q?XkROYR7dmjSSlCS6J3ytlWvtw/J2LNXtgCgmIuhIz3jkpUglKqvOtfgKHUTU?=
 =?us-ascii?Q?pVgAa8maLmNwho/qZr8cvFZxR4x5zkY0fw55ep7YeVEXCbvScKN1kFp18+y+?=
 =?us-ascii?Q?tV5aMF3vhOX92OCNAY0ODMZtLWNtGyxqQtb5/bLDlIEpWeYZjQpA5fsTADcM?=
 =?us-ascii?Q?I8sSsptf0joI75pAyNqNnog/dnRom+tymZ61i9ykeDdyaMea26Y7BmOe1tUo?=
 =?us-ascii?Q?A8C5WQlBZTiPJjFHlA1EieCr6vxWbj0bLVaT/hseYzPsCymu5ajSauAR7jS1?=
 =?us-ascii?Q?XTZ3xf5psQAesG/yAaPbMbvDfzy3/Ubj/sMnACfM8YL6bs/SGHsp2j7gX+ZQ?=
 =?us-ascii?Q?gAjlmnvqTxhOhcrKCBr2SkdTKJcztB29s/azFLIJWyfBOTp4gC5z8JWkJiZT?=
 =?us-ascii?Q?fxLCoQE3V+NTxiQ+3lz3IEe/+InsDIkLuJOSiyC5e7rZyTQ1g01j7gkChEeV?=
 =?us-ascii?Q?Ccch/SKObOHPlMwEC3YAwAWoFhaO57segm4dqMrPfSNGuXWOSvn1/yvKPvr4?=
 =?us-ascii?Q?dFtWAMojA6rfokndynC8WOFqIfvonKsLaWWjH7bMCVlt6xaJ1lSatnxutyoB?=
 =?us-ascii?Q?M7lrHca47IMThb3DQ0WTgwFxXN1Lm+FYfQFTcqMob3nc3JDf3zmYF5AM8yGW?=
 =?us-ascii?Q?DQUmy3b6YLkwht4Aa0dOeyko9jFAlLxkWGQrtgwvr9r+jbPnczJ2qEbQsG88?=
 =?us-ascii?Q?DlLRarhQm/x2NJ4h0Z4I/MJkGWWbapfhz2noWYaxw5fWd8mlyaqeEM0c6Ncn?=
 =?us-ascii?Q?41HTd2Hw1XiK1MeP8d9s3ROcG1oNskCyicosGy1T8WHm6gLDxvd7gi/0C/xb?=
 =?us-ascii?Q?Pd6p0cUjEQebDzmxG9KQL1RrxPbp/sJEZrHVtPRUojKsj9JBelJBPHskTNqZ?=
 =?us-ascii?Q?GQwr+9w4fzKdIRb8Hl0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR12MB9620.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yJVOyF860INwumGd2S1Tp6AIu/EXhaFF5ux/IiSUGOAzvCXTV/vaMZGcezo9?=
 =?us-ascii?Q?M8w4n9jdnLlc9uqhjNzPTPITyUDzU5J0bebYDOababZFY67G9aAIya9dVWm7?=
 =?us-ascii?Q?s64pUsME9CqoIfFK5OhmDmvbVe5rI4RcGql7zLvrI8ot7wzr/rgHkHALn5V1?=
 =?us-ascii?Q?P97XwPWr3SReJnOZkMPfNuyJIhDM4iNSSEZ4Lt7CmQwWRK5XEjEEeBaOShyh?=
 =?us-ascii?Q?Tc4+QzHTxd5QBdwmSyCU98uX4Rxk6li6lcELtCZTn2L3Kl0Dzne0T1j8rINu?=
 =?us-ascii?Q?rYptf6VBDKTangnyBOYpLUD5ehIJy8y1ArdLpBM1aeNKoked3odsMEwifogs?=
 =?us-ascii?Q?3Gc7OcpYnhGMfHlrzczA5VyoG83r7pWnbnutAqM7xsGY+BXv7/Rx88P1SizL?=
 =?us-ascii?Q?aXkv7/jgeko8QW9+f0CeBS6Okm+BiW3MIZZzH71E5xNGMHMX02MTFWeJVYsq?=
 =?us-ascii?Q?myV06m9tlgK19QB/qQM2oaSADAu434Z9If11VTPUyUu/Pihhs783P0oksu4q?=
 =?us-ascii?Q?NDWpQGR6wxBlANHItVMmehhEPL8bR6p73QuV+ROMomvH6SQjNwbskG2eJwj0?=
 =?us-ascii?Q?1Z9UytJmexztNI4bTGUFCGrG64HP8erj3eBMpqyltJ0h8xidYABYOczprgKV?=
 =?us-ascii?Q?O3TQgpA5nDQLGGQpMn2wR6pu/j7aaWutSK0AbIVK/sC/XttnIUl0hepV9hPF?=
 =?us-ascii?Q?swCeRsX1EP9UGuQdx8gznS9juYrNES/k4i6wnO3hVqCSm3V0yvnsuQW9q7RN?=
 =?us-ascii?Q?42od1N6VddATxA93YfkpKXzf3b/abDA1ZIr9iBdOPOd2MDdS8zpof3V06ZRC?=
 =?us-ascii?Q?v8eQ45aK+PB0tzlSun8JenY4stloXL463KlpTBiZq8nv0qYb7n6k0qcT9uyD?=
 =?us-ascii?Q?ZcI4YDO4l/FCcuDta3a6RlEZQwd8N7n72f5L52ozsizMB2IKEd4a1YJHaCAA?=
 =?us-ascii?Q?pDAc0D0YjCJ/8MjjY4gajNZLj8nMyBlF8Bskpzw4av2blaV37A8B6yPUH99U?=
 =?us-ascii?Q?s2Bt2K/AKiyRG908Ldj/fZhCKpSotbxHGAyMaKaYd6pKENfCw66HiU79aYNh?=
 =?us-ascii?Q?VtV5GM115aFxjDUdw/EZYz46dgZgcpi6GKT8FWKzRSxOBZe+SU/4+F96uXDG?=
 =?us-ascii?Q?O0dAW32SkaiKc6bNsJLd+k9vsBTuimUNMo1k6/eFl0chAbgNuYzh7Y9WfO8W?=
 =?us-ascii?Q?c3TFFi5a4KvWEZIu156k1wH9Wj6hztgLu49SdI7bEs7+cqBDa3x37AINa6qf?=
 =?us-ascii?Q?BJB8XJ25m3zN8EaTd7uZ/RZlh33QnXhUBVI4KHXt3YGMMqsJcQUdIf0PSimQ?=
 =?us-ascii?Q?cQUOWtU75XHLOpqXvDhg3vgTcdeVSq8j+VuDB/Q1s0fO/YX1NnfHO61h7kIA?=
 =?us-ascii?Q?jzSPaFI8O+7crEhabuWilQFhfmp4pJ1XfARGocs5OSa2RSzrVPSr2mr/s5kA?=
 =?us-ascii?Q?hn7y9Eq45O7th07Ux1qdcnUdwsWwP2UmiYuAc6h7UapHQW4Nn89ANk31F454?=
 =?us-ascii?Q?37zbGHFph9ECj+myZwn/ccLznlzTtGXpsT+HF2pt8ATIKGFSfX0jClaYEbh3?=
 =?us-ascii?Q?B9RkHOSeAQLv5ItG8MyASTQoLpSRHiILP2PJHSE9KBuMb99yMJ5U5lAqbMGf?=
 =?us-ascii?Q?y4lDxw2XQnRsQKk3RH8fyCDNDdPx6bjX/OwGaXrwxWbnJyYCcN5t8f3nPYLu?=
 =?us-ascii?Q?5Rf8SH3/UbtarljCNTHHGXKUAKUvYXzXiVuCuitwvA7yYZunDgmTGUkV9NCu?=
 =?us-ascii?Q?veaNEuPYwQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a378edba-f3c6-4989-5734-08de6e82550b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 00:11:58.8454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iI91naraWYEJQQ+fC1LQNznbP1AOCkftwUyRa//3gNBz4U18DIJlC4oiRGMKXmW
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
X-Rspamd-Queue-Id: 4FD13152179
X-Rspamd-Action: no action

DMA-buf mapping types allow the importer and exporter to negotiate the
format of the map/unmap to be used during the attachment.

Currently DMA-buf only supports struct scatterlist as the attachment map
operation.  This is not sufficient for all use cases as dma_addr_t is a
very specific and limited type.

With mapping types the importing driver can declare what it supports. For
example:

	struct dma_buf_mapping_match imp_match[] = {
		DMA_BUF_IMAPPING_MY_DRIVER(dev, ...),
		DMA_BUF_IMAPPING_SGT(dev, false),
	};
	attach = dma_buf_mapping_attach(dmabuf, imp_match, ...)

And the exporting driver can declare what it supports:

int exporter_match_mapping(struct dma_buf_match_args *args)
{
	struct dma_buf_mapping_match exp_match[] = {
		DMA_BUF_EMAPPING_MY_DRIVER(my_ops, dev, ...),
		DMA_BUF_EMAPPING_SGT(sgt_ops, dev, false),
		DMA_BUF_EMAPPING_PAL(PAL_ops),
	};
	return dma_buf_match_mapping(args, exp_match, ...);
}

During dma_buf_mapping_attach() the core code will select a mutual match
between the importer and exporter and record it in the attach->map_type.

Add the basic types:

struct dma_buf_mapping_type
   Type tag and ops for each mapping type.

struct dma_buf_mapping_match
   Entry in a list of importer or exporter match specifications.
   The match specification can be extended by the mapping type with
   unique data.

dma_buf_match_mapping() / struct dma_buf_match_args
   Helper to do the matching. Called by the exporting driver
   via a dma_buf_ops callback.

struct dma_buf_mapping_exp_ops
   Base type for the per-mapping type exporter provided functions. This
   would be the map/unmap callbacks. Each mapping type can provide its own
   functions for map/unmap type operations with optimal type signatures.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/dma-buf/dma-buf-mapping.c | 46 +++++++++++++++++++
 include/linux/dma-buf-mapping.h   | 76 +++++++++++++++++++++++++++++++
 include/linux/dma-buf.h           | 18 ++++++++
 3 files changed, 140 insertions(+)

diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index b7352e609fbdfa..459c204cabb803 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -5,6 +5,7 @@
  */
 #include <linux/dma-buf-mapping.h>
 #include <linux/dma-resv.h>
+#include <linux/dma-buf.h>
 
 static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
 					 dma_addr_t addr)
@@ -246,3 +247,48 @@ void dma_buf_free_sgt(struct dma_buf_attachment *attach, struct sg_table *sgt,
 
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_free_sgt, "DMA_BUF");
+
+/**
+ * dma_buf_match_mapping - Select a mapping type agreed upon by exporter and
+ *                         importer
+ * @args: Match arguments from attach. On success this is updated with the
+ *        matched exporter and importer entries.
+ * @exp: Array of mapping types supported by the exporter, in priority order
+ * @exp_len: Number of entries in @exp
+ *
+ * Iterate over the exporter's supported mapping types and for each one search
+ * the importer's list for a compatible matching type. args and args->attach are
+ * populated with the resulting match.
+ *
+ * Because the exporter list is walked in order, the exporter controls the
+ * priority of mapping types.
+ */
+int dma_buf_match_mapping(struct dma_buf_match_args *args,
+			  const struct dma_buf_mapping_match *exp,
+			  size_t exp_len)
+{
+	const struct dma_buf_mapping_match *exp_end = exp + exp_len;
+	const struct dma_buf_mapping_match *imp_end =
+		args->imp_matches + args->imp_len;
+	int ret;
+
+	for (; exp != exp_end; exp++) {
+		const struct dma_buf_mapping_match *imp = args->imp_matches;
+
+		for (; imp != imp_end; imp++) {
+			if (exp->type != imp->type)
+				continue;
+			if (exp->type->match) {
+				ret = exp->type->match(args->dmabuf, exp, imp);
+				if (ret == -EOPNOTSUPP)
+					continue;
+				if (ret != 0)
+					return ret;
+			}
+			exp->type->finish_match(args, exp, imp);
+			return 0;
+		}
+	}
+	return -EINVAL;
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_match_mapping, "DMA_BUF");
diff --git a/include/linux/dma-buf-mapping.h b/include/linux/dma-buf-mapping.h
index a3c0ce2d3a42fe..080ccbf3a3f8b8 100644
--- a/include/linux/dma-buf-mapping.h
+++ b/include/linux/dma-buf-mapping.h
@@ -7,6 +7,77 @@
 #define __DMA_BUF_MAPPING_H__
 #include <linux/dma-buf.h>
 
+struct device;
+struct dma_buf;
+struct dma_buf_attachment;
+struct dma_buf_mapping_exp_ops;
+
+/* Type tag for all mapping operations */
+struct dma_buf_mapping_exp_ops {};
+
+/*
+ * Internal struct to pass arguments from the attach function to the matching
+ * function
+ */
+struct dma_buf_match_args {
+	struct dma_buf *dmabuf;
+	struct dma_buf_attachment *attach;
+	const struct dma_buf_mapping_match *imp_matches;
+	size_t imp_len;
+};
+
+/**
+ * struct dma_buf_mapping_type - Operations for a DMA-buf mapping type
+ *
+ * Each mapping type provides a singleton instance of this struct to describe
+ * the mapping type and its operations.
+ */
+struct dma_buf_mapping_type {
+	/**
+	 * @name: Human-readable name for this mapping type, used in debugfs
+	 *        output
+	 */
+	const char *name;
+
+	/**
+	 * @match:
+	 *
+	 * Called during attach from dma_buf_match_mapping(). &exp and &imp are
+	 * single items from the importer and exporter mapping match lists.
+	 * Both will have the same instance of this struct as their type member.
+	 *
+	 * It determines if the exporter/importer are compatible.
+	 *
+	 * Returns: 0 on success
+	 *   -EOPNOTSUPP means ignore the failure and continue
+	 *   Everything else aborts the search and returns the -errno
+	 */
+	int (*match)(struct dma_buf *dmabuf,
+		     const struct dma_buf_mapping_match *exp,
+		     const struct dma_buf_mapping_match *imp);
+
+	/**
+	 * @finish_match:
+	 *
+	 * Called by dma_buf_match_mapping() after a successful match to store
+	 * the negotiated result in @args->attach. The matched @exp and @imp
+	 * entries are provided so the callback can copy type-specific data into
+	 * the attachment.
+	 */
+	void (*finish_match)(struct dma_buf_match_args *args,
+			     const struct dma_buf_mapping_match *exp,
+			     const struct dma_buf_mapping_match *imp);
+
+	/**
+	 * @debugfs_dump:
+	 *
+	 * Optional callback to write mapping-type-specific diagnostic
+	 * information about @attach to the debugfs seq_file @s.
+	 */
+	void (*debugfs_dump)(struct seq_file *s,
+			     struct dma_buf_attachment *attach);
+};
+
 struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
 					 struct p2pdma_provider *provider,
 					 struct dma_buf_phys_vec *phys_vec,
@@ -14,4 +85,9 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
 					 enum dma_data_direction dir);
 void dma_buf_free_sgt(struct dma_buf_attachment *attach, struct sg_table *sgt,
 		      enum dma_data_direction dir);
+
+int dma_buf_match_mapping(struct dma_buf_match_args *args,
+			  const struct dma_buf_mapping_match *exp_mappings,
+			  size_t exp_len);
+
 #endif
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 0bc492090237ed..a2b01b13026810 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -27,6 +27,21 @@
 struct device;
 struct dma_buf;
 struct dma_buf_attachment;
+struct dma_buf_mapping_type;
+struct dma_buf_mapping_exp_ops;
+
+/*
+ * Match items are generated by the importer using the DMA_BUF_IMAPPING_*() and
+ * the exporter using the DMA_BUF_EMAPPING_*() functions. Each mapping type
+ * defines its own signature with its own data to make the match and attachment.
+ */
+struct dma_buf_mapping_match {
+	const struct dma_buf_mapping_type *type;
+	const struct dma_buf_mapping_exp_ops *exp_ops;
+	union {
+		/* Each mapping_type has unique match parameters here */
+	};
+};
 
 /**
  * struct dma_buf_ops - operations possible on struct dma_buf
@@ -488,6 +503,8 @@ struct dma_buf_attach_ops {
  * @importer_ops: importer operations for this attachment, if provided
  * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
  * @importer_priv: importer specific attachment data.
+ * @map_type: The match that defines the mutually compatible mapping type to use
+ *            for this attachment.
  *
  * This structure holds the attachment information between the dma_buf buffer
  * and its user device(s). The list contains one attachment struct per device
@@ -506,6 +523,7 @@ struct dma_buf_attachment {
 	const struct dma_buf_attach_ops *importer_ops;
 	void *importer_priv;
 	void *priv;
+	struct dma_buf_mapping_match map_type;
 };
 
 /**
-- 
2.43.0

