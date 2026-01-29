Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IF9BDSgze2lJCQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:15:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ABAAE726
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 11:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD5410E849;
	Thu, 29 Jan 2026 10:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jVk2hmPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012031.outbound.protection.outlook.com [52.101.53.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95EF10E849;
 Thu, 29 Jan 2026 10:14:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OifiDUst/aCS0FoqEzz9kL9CV01j7HluopXcdHp1pFgbCwuoTQDJXb4BCfmb6c+75OlcFtEPqNB5n7HjkQi2O0NG6ltOV0lKnssheeT+xqJhz9vJxjYSvY9mX1a53cSp0sgKPug+PDurMWWrP8F9kedh/Z5kQD8nzDvxjrN0gGSogyiVmy7Gvb6zwhO/GLkJi4pasP1dQrLPJpA8Htu3m63icmCt/lyfirLGJE2SJlDmIiacBOOgl2ra/t1i7vIru9FQEfuEb537d0PDzrMx60n1ScPX7hDrQRvpiCVP+Wgv3uOT/YJ5gc7Q6bYDQshdalSd5t3bmYWBFdPUGC0ckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsJ9Ojs78hKX217IaTw2L4OGtoM2fnVEbKvvjjsLGG8=;
 b=MeK+gwRdTd9WpYA90ZFV7xe6pq6JDliUtwaoTD7OLhGX6QZS8UNsB/n8xZS2luzzs8bz/SwL4TIGayisnywRtqpHcDyDP64wpopRm2Vh7Kr7AJ+FUeOvPvVfaUR3UwberLv8xZ3vfEB/RvJ/qOTg76UWOUfIhbFnRrMkPJJQAbFOAdlIDrIUTlhUqHDAYo2uWeHG+RpHxk5w4jDnAI/7EOeWwLOqa/f10Lto3LgFV+ckmOLgrXa+Fg17zfrd9KjQhBazsovbe+ZUsFzwlsfXJxHy0jHZa/7wC7ARwYidzdI2w6DBTSWqQhCmrnCselmYicn+FckOCqwgdc9U8T40LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsJ9Ojs78hKX217IaTw2L4OGtoM2fnVEbKvvjjsLGG8=;
 b=jVk2hmPT5wksisI33fUrsizG87cOMjMRmPLFSqNW9dohTu9cT5QzVY0pUjaQrMaKkTRcrpYj9PoHexhqH4x6Ra0KT3wzWFfsCeRMfvv4TxjIudDzU1RolsgaVuxRSUTw2Wu2TUIHnV5FIR9JiEW8dzVy3Xb+yQyLQ/1Df4PqLp4siSan9LwUbUSDcXYKDguxVSlOTaKSxXLqzEKIG5qH7P9O8MA/SNGcmKXCvvezvx3lm8EiducHHoMB8qU5ZHD//aGoTvFym+BmKOaGXRBQUognZd0rpA7qlqliPDxWgQfJ4l+LvYnrTO0H3bZLAZDIVkXtfiOaMD67KuJ4IDP8BQ==
Received: from BLAPR03CA0075.namprd03.prod.outlook.com (2603:10b6:208:329::20)
 by CY8PR12MB7660.namprd12.prod.outlook.com (2603:10b6:930:84::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 10:14:52 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::1) by BLAPR03CA0075.outlook.office365.com
 (2603:10b6:208:329::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Thu,
 29 Jan 2026 10:14:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 10:14:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 02:14:33 -0800
Received: from localhost (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 02:14:33 -0800
Date: Thu, 29 Jan 2026 12:14:27 +0200
From: Leon Romanovsky <leonro@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH v3 04/11] drm/pagemap: Use dma-map IOVA alloc, link,
 and sync API for DRM pagemap
Message-ID: <20260129101427.GE10992@unreal>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-5-matthew.brost@intel.com>
 <20260128142853.GH40916@unreal>
 <aXpLhN08jVbltQC0@lstrano-desk.jf.intel.com>
 <20260128175531.GR1641016@ziepe.ca>
 <aXpjk5sAgOzE3OcR@lstrano-desk.jf.intel.com>
 <20260128194540.GA10992@unreal>
 <aXp58fqfeeDD6YI+@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXp58fqfeeDD6YI+@lstrano-desk.jf.intel.com>
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|CY8PR12MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: ae70f007-37e3-4499-c88e-08de5f1f3e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zm9NUXVUVFdQZEM3dEdybVlNdWZldmVSWTMvMHB0R3lCRXFBYVJ5L0g4Qk9M?=
 =?utf-8?B?YlQxNzVnNHFOTk1heXh3c2xLV0pDbGhRRVo2SXRhVVRRWDRhdFErQ0pJUEYy?=
 =?utf-8?B?U2NmUjkzYzlLdmxpS2U5cjdjVjNGQnpYYUFBOTUwV1pUS0NnNlpnVUFqek5P?=
 =?utf-8?B?Mlk5dTJHcm1FNWNqaUg2VzUwMDFXU0x0QmlJWFdHMVdrUTZjTlNqL1lyRWgw?=
 =?utf-8?B?OFAvaEU5SE5EQ1pWbm1HT1ZVQTdjcVhMRHZ2N2dvWFNpNlp5RlNITy8yK05J?=
 =?utf-8?B?cHkwcmY2bzUyOG5HOHJhM1NEOHdhRzVVVFBuaDdjUkRmUFRSQ1I2OTF1ZGQr?=
 =?utf-8?B?cVJhcytZQnpZN2d1SDBtK1ZEdTFGMVdwejg3Q0VKRXpKdWxhYytxcEZCNGkr?=
 =?utf-8?B?R3hWTGg4QmxBbncxNnFwMHlDVHhvcVNOSHFFdldSLy9pQ3BIQk04MXFWUkNI?=
 =?utf-8?B?WW9Gd08ycTBmMERVNkFsbDkyRDRLeUtRSXo4RmorRE5pWGp3bUNzU2IxbFNF?=
 =?utf-8?B?L29aaGlqOWhlZTlIS2I4Y0g4cGl5REsvKy9pL3VSTHM5VTYwcVJBR2RtMFB3?=
 =?utf-8?B?R0t5R25iS3p6NUNod2toL25TM2M5Ui9LK3dzdkFlZmRpbUlKTXBOd2VTMzdn?=
 =?utf-8?B?ZXNIU3lCS2tYOUpzUE5aM0tiZ1VRT1Rjbkw2ZzRMRkhoeVg3eG02UW0vUlRh?=
 =?utf-8?B?SUdJZm8ySWpQa3RYNTc0MlFZYVNuaHYyQThKMG9nR21DWGZkYUEva0dvNklC?=
 =?utf-8?B?VEd0bkpXN1RkTEdaL2s1NkJHNFAwdTBDc0FsRVF3S2x3V0NuMjU4RW9ObkNS?=
 =?utf-8?B?dlRoUlNiSzJQQ25PeGhNS2JqWW9PNHZMbzU0a0xXei9xRTljSjNZZDdXVXZD?=
 =?utf-8?B?ZWVYQ3ArdWovUGRNdDRwclFacUM5Ni9ld3c1NTNFa041bHROUmNFTVVzRDhZ?=
 =?utf-8?B?aEVhenhHMHdMQ2NpbUtDN1lYK1EwRlBWNTRaUk5CaXlIQjJYby9JWkN4bklR?=
 =?utf-8?B?cHFSbHhkS3N4V3FtRnlpSjlSN2pkVVVqRWx6aEdOTFY0Y2NmTTIyRkhXVnVD?=
 =?utf-8?B?aEpTY1pURnB2dk5BY1grNFgwVlFpZjVuV3FwekpTeGtyakszMFR3NUhUYVlt?=
 =?utf-8?B?bFFzbGozV1IrOGwxUWVDY2d2NGFKSUt2MWRwNkY3cW8vWklka3M4bm1mVHE1?=
 =?utf-8?B?TGdXeUFVTEh2Tk94WjZ0dm5IWHlCVHZOeHZIL0JTdUlPS25NME1PRjV0aDZu?=
 =?utf-8?B?aWxudUZvWW1KakVSM2xpd29DRnF4MDl0Q3hZQVdmbzBCempoNk54bi9NSlNY?=
 =?utf-8?B?dDRoSTRhTkt1R3JXWU1jQ0Y2eEdqd2VIak53ZTUxNFRzOG14UjAvQjVxUGFX?=
 =?utf-8?B?dXRrcldHTVJ0QUMvUVRLSER6bUFOUk1May9udUtpNSs5Nm4wTXlvYkljMk9r?=
 =?utf-8?B?QVFncnBFbnZGYlJJUGdTSGRucFBSRnk4WUNIU0J3amtDYUxsTTdTejFyVXFu?=
 =?utf-8?B?MmMweUIycU40cWg2b3F1cVhqMjRVZ2J6bEFibTFBdzRDUjB1WTBoYksxajBl?=
 =?utf-8?B?dXRMbnJuZHpEeUZrejhETHhJZHR6OGdPS2xETWRTSFlQWVNMbE5ITHdKdS9K?=
 =?utf-8?B?M1hpRDJvRGk0SUdpdkh2WlJGYitTWnVtR2tJNC9kaVlRQmtzMXo3UTBydDBn?=
 =?utf-8?B?QjJ1TmlDU2xudUNpaDhWN3NXOCtad3hzSmsweUJQU3BFSzNxOGRRUVZNWjZ0?=
 =?utf-8?B?UGk3bUUyUGRZVWdZREpmbGplNTl6NGdqT250aWZHSlhwd21VSHVEcWlTd2tK?=
 =?utf-8?B?cWxMdEd0a3dNZGJZU1hEL0VGT0k4NlluUzNkbVYxWEJuS0dUa3YwS0MzeXE0?=
 =?utf-8?B?VS9qZ3p3TTh6ZXlYK0ZKTWtiMUE2L1RIVGhQeGxkQnVmdmtPUk9CTnpEU3JH?=
 =?utf-8?B?UGJFZldaK2NtaXBkMEtSVkhETlBacm5nRWVudmZ3Zml4S1FCbW5sanVUOGtv?=
 =?utf-8?B?d1k0eFQ1SytBWG80dG0yK0wzQXFUVUJ2cFJ4RlIzVjBtVXRpSFFMRTNmU2Qx?=
 =?utf-8?B?cWpZYXlTMURzcGpQb2VZN0d5L2hETms1TGQxVFVlNno5Um8wZTRrWWFyL0p3?=
 =?utf-8?B?OTlKcWVOcXJzWkVYdDJqUnJ3L0FJRHozRVlLWWFxL0R5RFJ5dC9lSHZPS0Rs?=
 =?utf-8?B?eXFxcDRnMjlROEtKb2syYlR3WDVkYUtnQUMyOWtqL0NmbFNqazViK3lCdSt4?=
 =?utf-8?B?M2lUSkpZdmJZYU4rbmhCYWVWNklnPT0=?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 10:14:52.1692 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae70f007-37e3-4499-c88e-08de5f1f3e18
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7660
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
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leonro@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B7ABAAE726
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 01:04:49PM -0800, Matthew Brost wrote:
> On Wed, Jan 28, 2026 at 09:45:40PM +0200, Leon Romanovsky wrote:
> > On Wed, Jan 28, 2026 at 11:29:23AM -0800, Matthew Brost wrote:
> > > On Wed, Jan 28, 2026 at 01:55:31PM -0400, Jason Gunthorpe wrote:
> > > > On Wed, Jan 28, 2026 at 09:46:44AM -0800, Matthew Brost wrote:
> > > > 
> > > > > It is intended to fill holes. The input pages come from the
> > > > > migrate_vma_* functions, which can return a sparsely populated array of
> > > > > pages for a region (e.g., it scans a 2M range but only finds several of
> > > > > the 512 pages eligible for migration). As a result, if (!page) is true
> > > > > for many entries.
> > > > 
> > > > This is migration?? So something is DMA'ing from A -> B - why put
> > > > holes in the first place? Can you tightly pack the pages in the IOVA?
> > > > 
> > > 
> > > This could probably could be made to work. I think it would be an
> > > initial pass to figure out the IOVA size then tightly pack.
> > > 
> > > Let me look at this. Probably better too as installing dummy pages is a
> > > non-zero cost as I assume dma_iova_link is a radix tree walk.
> > > 
> > > > If there is no iommu then the addresses are scattered all over anyhow
> > > > so it can't be relying on some dma_addr_t relationship?
> > > 
> > > Scattered dma-addresses is already handled in the copy code, likewise
> > > holes so non-issue.
> > > 
> > > > 
> > > > You don't have to fully populate the allocated iova, you can link from
> > > > A-B and then unlink from A-B even if B is less than the total size
> > > > requested.
> > > > 
> > > > The hmm users have the holes because hmm is dynamically
> > > > adding/removing pages as it runs and it can't do anything to pack the
> > > > mapping.
> > > > 
> > > > > > IOVA space? If so, what necessitates those holes? You can have less mapped
> > > > > > than IOVA and dma_iova_*() API can handle it.
> > > > > 
> > > > > I was actually going to ask you about this, so I’m glad you brought it
> > > > > up here. Again, this is a hack to avoid holes — the holes are never
> > > > > touched by our copy function, but rather skipped, so we just jam in a
> > > > > dummy address so the entire IOVA range has valid IOMMU pages.
> > > > 
> > > > I would say what you are doing is trying to optimize unmap by
> > > 
> > > Yes and make the code simplish.
> > > 
> > > > unmapping everything in one shot instead of just the mapped areas, and
> > > > the WARN_ON is telling you that it isn't allowed to unmap across a
> > > > hole.
> > > > 
> > > > > at the moment I’m not sure whether this warning affects actual
> > > > > functionality or if we could just delete it. 
> > > > 
> > > > It means the iommu page table stopped unmapping when it hit a hole and
> > > > there is a bunch of left over maps in the page table that shouldn't be
> > > > there. So yes, it is serious and cannot be deleted.
> > > >
> > > 
> > > Cool, this explains the warning.
> > >  
> > > > This is a possible option to teach things to detect the holes and
> > > > ignore them..
> > > 
> > > Another option — and IMO probably the best one — as it makes potential
> > > usages with holes the simplest at the driver level. Let me look at this
> > > too.
> > 
> > It would be ideal if we could code a more general solution. In HMM we
> > release pages one by one, and it would be preferable to have a single-shot
> > unmap routine instead. In similar to NVMe which release all IOVA space
> > with one call to dma_iova_destroy().
> > 
> > HMM chain:
> > 
> > ib_umem_odp_unmap_dma_pages()
> >  -> for (...)
> >    -> hmm_dma_unmap_pfn()
> > 
> > After giving more thought to my earlier suggestion to use
> > hmm_pfn_to_phys(), I began to wonder why did not you use the
> > hmm_dma_*() API instead?
> > 
> 
> That is ill-suited for high-speed fabrics, but so is our existing
> implementation — we’re just in slightly better shape (?). It also seems
> ill-suited [1][2][3] for variable page sizes (which are possible with
> our API), as well as the way we currently program device PTEs in our
> driver. We also receive PFNs from the migrate_vma_* layer, which must
> also be mapped.
> 
> I also believe the hmm_dma_* code predates the DRM code being merged, or
> was merged around the same time.
> 
> We could work to unify the HMM helpers and make them usable, but that
> won’t happen overnight. The HMM layer needs quite a bit of work to
> useable, and then we’d have to propagate everything upward through
> DRM/Xe and any new users. Let me play around with this though a bit
> though to get rough idea what would need to be done here.
> 
> [1] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/infiniband/core/umem_odp.c#L255
> [2] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/infiniband/core/umem_odp.c#L193
> [3] https://elixir.bootlin.com/linux/v6.18.6/source/drivers/infiniband/core/umem_odp.c#L104 
> 
> Also this is some odd stuff going... Why sync after every mapping [4].

Right now, hmm_dma_map_pfn() user is page-based one, we need to sync
after every pagefault.

> Blindly doing BIDIRECTIONAL [5]... 

It was promoted from old code, callers can provide direction.

> 
> [4] https://elixir.bootlin.com/linux/v6.18.6/source/mm/hmm.c#L826
> [5] https://elixir.bootlin.com/linux/v6.18.6/source/mm/hmm.c#L821
> 
> > > 
> > > Do you think we need flag somewhere for 'ignore holes' or can I just
> > > blindly skip them?
> > 
> > Better if we will have something like dma_iova_with_holes_destroy()
> > function call to make sure that we don't hurt performance of existing
> > dma_iova_destroy() users.
> >
> 
> Yes, I think this is the best route for the time being. Let me look at
> this.
> 
> Matt
> 
> > Thanks
> > 
> > > 
> > > Matt
> > > 
> > > > 
> > > > Jason
