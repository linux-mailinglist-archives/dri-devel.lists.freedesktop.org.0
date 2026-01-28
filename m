Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFhuOY1nemmB5gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 20:46:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E47A83E7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 20:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98C910E75E;
	Wed, 28 Jan 2026 19:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E8GQh/CH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013000.outbound.protection.outlook.com
 [40.93.201.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A8010E2E6;
 Wed, 28 Jan 2026 19:46:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0bKR7shwTKHX49rlh50M5zDtGBN6I8Flt42DUPdZVAiVy/nG8jezZCMf4l07XnsQ+0ez6jzdnw5vnz+lZJX9enfIE49ZGe3vtC7znMhhCISuKGT5nKW+apXd9fu3RnZDln/zN2sPnnfxE1PTY2Avgq0r4otwIlFRHRg6RsGqpD7663h3R0uCd3w8UO5/HnYQQvQ0amT9FuwXnHjHSGdX5pHEvEhuC1BbPcvuA9WMkxAfc7RKvNiyaOGPbdHYoPsTjx3LIDzQXzcCL2/UjtBdW6FQ9O6scEb9txqlxbq0PeI9JEiY1PX8U9pjdTP4ISQ5MCi4pc4ScwrsnbzkD6uMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2jGOfRXJZ+P2TZ1qMST73n3tYDmOvSqndkBrt1/5sA=;
 b=nYzB0rINdeBQ3xUG6m6hdHkYau8XkpJsKTzcZ8aLbQBFkOAhHCDLXdoHWei7EzZqOsp5z/lU1Ud0t9n6SMUkktKlMY38WqXKGvxc4HIV+bffvvwJKmlSjRgcOcW3JS9QN+oX1vdPX6t0LmhriHkVdAsE3bdFhx7CFlH8OAvrq5hJ5ALCw8tmSsuseF4BCLRkROb13+beJjDtrt2v05mDrtBwq/1V1/DsV1yiSs3TJ1P+7tWbAeLrs/4fng7W0bz8HNz6fj2MqauobEWT+Mjh0w/NiY/0lcilY2Gyiih3bxjAAPc5jOt8tlF9wCzadpBJJrcRJlhsQQJEucPodGRn5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2jGOfRXJZ+P2TZ1qMST73n3tYDmOvSqndkBrt1/5sA=;
 b=E8GQh/CH09Ucl2BtwoTYRFBr0m4oQiE8KDaoU1eRL0udxPsrJRQJ4QMlmMuNhfwVz5IGMq+abhUph8nFhtYEHJXiWI6Ebs/rqXrBhDyl4PF4IwO1bYhGUOhxSggOlCgTYq8DMVQtseobygrAzJCG07qFK1ck6cDSjX1uKLERg0yL/++1/z+scrKxVjIuSMvIU/F9pReA2nej9VpXj+3wRB78xuHRKG/OROmGTfz4Jm2eoCS+jdjtvrBoPafQM0NJUU1SRf94SLvv0d2mTE9AL6QtI+nmhsDtN8fEJaERBknQ46NKPMbwkIXzl35372loR6jaPoRPUdo8iDditmnS5g==
Received: from DS7PR03CA0145.namprd03.prod.outlook.com (2603:10b6:5:3b4::30)
 by IA1PR12MB6284.namprd12.prod.outlook.com (2603:10b6:208:3e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 19:46:10 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com (2603:10b6:5:3b4::4)
 by DS7PR03CA0145.outlook.office365.com (2603:10b6:5:3b4::30) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8
 via Frontend Transport; Wed, 28 Jan 2026 19:46:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 19:46:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 11:45:45 -0800
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 11:45:44 -0800
Date: Wed, 28 Jan 2026 21:45:40 +0200
From: Leon Romanovsky <leonro@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH v3 04/11] drm/pagemap: Use dma-map IOVA alloc, link,
 and sync API for DRM pagemap
Message-ID: <20260128194540.GA10992@unreal>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-5-matthew.brost@intel.com>
 <20260128142853.GH40916@unreal>
 <aXpLhN08jVbltQC0@lstrano-desk.jf.intel.com>
 <20260128175531.GR1641016@ziepe.ca>
 <aXpjk5sAgOzE3OcR@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXpjk5sAgOzE3OcR@lstrano-desk.jf.intel.com>
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|IA1PR12MB6284:EE_
X-MS-Office365-Filtering-Correlation-Id: 06272f32-8b0e-4d50-0f9c-08de5ea5e2b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTdiQTdpK1dOOE5HVytXTGRoLzMydmZRMHQ4Y3NZdmp1MTVJTjlLMEZsWnJt?=
 =?utf-8?B?MUo0SWczRE4xem44TGR6N0ZpMXczK1JTV0UwcXh0MER5VWI4eVhMaVlmb3h6?=
 =?utf-8?B?ZEoybGZXcS8xOElSWlUyNE5vRnJEUENSZzIvbGlNN1B1ME96eEtGUkZnR294?=
 =?utf-8?B?aVpSbWR4enlBcEJlTmNsODRlTmdGMmdSVmZsUERwaDNpSjJiUk1QbFhyMVcr?=
 =?utf-8?B?aG1FMG92K1dwNkhYOVh3U1VrZk9ZeUJqNmg2VkRYcDNlMS9EK21uTVQ4WGVt?=
 =?utf-8?B?amRUV25wSTlvVVVzM0NQUmpJejNXZ3kyTTlvSDh5dVhYZjJWY2haZklrQmFl?=
 =?utf-8?B?NzNWeGpyREdNMHVmaVpBOHhWc2xqOXQ5RGdCT1F0Ukx1TzBGMFl6b3FFeTBU?=
 =?utf-8?B?M0NDN3puMGtCY3RkQjVJU3VuY0R1RVl5ajNKWTNXYjJJVTI2NmR3VG9mYjVD?=
 =?utf-8?B?YTR0L0hpSjJxaGllSEx5UkZ4ZFpmZXQ4RGJ2bGg5ZzdKZ1MrdFJnWis3YmM0?=
 =?utf-8?B?eGN3Nk5YaVUzVjdic3dBTXlaTWF1L0xMTlVCaFR6ZW5BeGpQWE8rbnExU3c5?=
 =?utf-8?B?UENRNUhsS0tHdG1TMUZDSGo0aUJmemw0RVNLQUowUDBaclR2SSsyYnh4NzNj?=
 =?utf-8?B?d3BUQjBFbDRqdlFXODNKUWFNUXpXbjF6K3hISnNrcGZmRXVNdSsxbUVaZWlu?=
 =?utf-8?B?bHFKd1lWUTdJQWNDWjRzU1IyWVJvemJrUUhIS080STEza2plYTFQdnRxMU5v?=
 =?utf-8?B?U0FpTDBmc0dpMDNSbXhlb096YkJTdnRVbmdSYVd4WkFTNDRIZWZVeWk1Y3Br?=
 =?utf-8?B?L3ZJUXk0aWs0dE1neE01Ym4xdnpwVUh6SzNLelBXenZZUWRoRXprcEFURzhi?=
 =?utf-8?B?eTlNWFVjWEpMTElRblhaWGxIOEIzQkp3eG1HQWVkMXhpUkthdGdtblN3VENT?=
 =?utf-8?B?Vys2Vzlid3RXZmJOTzliZkdjL1p4L2VQZFJkcHZJMi9PbC9pMmZxWGlUWUlR?=
 =?utf-8?B?ajVlWUN1aSs5a3FuYmZIeHJJaVdQNENIRVkvcE02MDRaQytweGZQQnBYUFFV?=
 =?utf-8?B?TG9jQUJIM3NUc0p0VVpYWkNHUkxxMHRESXZxQnNaWldURHgvdXlRQ3lBNVpa?=
 =?utf-8?B?N1A1K0NzYkRyL1FPazRvY25wRExOZHRYT1M1MVM4U05YcGhUUm9qK1c4ZVJ4?=
 =?utf-8?B?aEtYMXR1K2g3UngwemtqbzFtanYxeENHaTA2YWNDZlF2RkNINVl0V2dheVNj?=
 =?utf-8?B?L0I3V3dLMFBzR3VTaDdJK3dGRlpGSFVTU3d4RjEweEJqbTh1SlNvTldtMVJn?=
 =?utf-8?B?TnZibzYzTnRrYVVMcEFBbW9XVjZWMy81T1Zqb1NSV0NkN2Fidkx0dFlHcGw5?=
 =?utf-8?B?VjgrWDY3NnlYTW5RdU1KakJRREQ5cG9rZ1VCR0c5UFk4TnRRQWlqVzM2WW83?=
 =?utf-8?B?bklQVkVjVW5RalJidk5wc1k2QlpldHd5MlE3THg0RmFRdzczc0l4MWxpTkpH?=
 =?utf-8?B?NkhpcWVCK1Q1VTNhMUFWakJrVnFiK0dQQWtMZThZblV1Y1JVZkszLzFtbExJ?=
 =?utf-8?B?QU1UcTRES2JSS0Q0ejdyNnhHN3pFK1BUeXEwNGNISUwvZnFwYkZMaUI4M3c2?=
 =?utf-8?B?R2poejg0TlR4NGluSmFiMnAzRUs3TUh6TmlHcVpuR0YzS0J6M0c1czYrbUVn?=
 =?utf-8?B?bDh0SVRLUmp5eE85SUVpRUNsZ0J2WjdiMFVCZWxGd3RMRlZZak84ckdTaG9V?=
 =?utf-8?B?M1NJeUtYczdaNzRyanpEekgxY1ZnUFZqazFRbktuZ1lHTjRTY0hCRGlXRUxN?=
 =?utf-8?B?YmZDKzZrUXNxWUdDcTdKckRNdXQ1dWgyY3M0bDNnMWdIVlc4Rm14THFoY1lV?=
 =?utf-8?B?dGRXblJNcGM0d3ZHVmRDN1VOYjBvb09Hc0tqYkk2VWFkaHlTbERsTFg1Nk5U?=
 =?utf-8?B?Zi93em1qS1FiemkvWFlXdks3ZjFHY0tMTVpzM0hwWVZ0WUlZcngzdXlTbEk3?=
 =?utf-8?B?S3QxcEd3bEN4bHRkejRFT0V2bm41NTJLVStWOUh4OTVWTUpkVXRGdkRpY1h1?=
 =?utf-8?B?cVdOakZKZUgxUVYxZkphclAvZUJZT040YmxJUHQwbGhFUVFlUkJPMGFPbTFH?=
 =?utf-8?B?VjVGZmwyVzlMZ3k5UFBpS3Fvd1RjSkxQNVNkcFpyNkdjYXY3OUFPVGM2M0NR?=
 =?utf-8?B?bzFNUHpFSHlMdzlUZ3ZSdi9QSEFEdkozbU0xb28zYVZENnNMK3JMYmMyZU4r?=
 =?utf-8?B?eXhGSExvOE5PNnljT0hIMzMrY3B3PT0=?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 19:46:09.8423 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06272f32-8b0e-4d50-0f9c-08de5ea5e2b9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6284
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
X-Rspamd-Queue-Id: 70E47A83E7
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 11:29:23AM -0800, Matthew Brost wrote:
> On Wed, Jan 28, 2026 at 01:55:31PM -0400, Jason Gunthorpe wrote:
> > On Wed, Jan 28, 2026 at 09:46:44AM -0800, Matthew Brost wrote:
> > 
> > > It is intended to fill holes. The input pages come from the
> > > migrate_vma_* functions, which can return a sparsely populated array of
> > > pages for a region (e.g., it scans a 2M range but only finds several of
> > > the 512 pages eligible for migration). As a result, if (!page) is true
> > > for many entries.
> > 
> > This is migration?? So something is DMA'ing from A -> B - why put
> > holes in the first place? Can you tightly pack the pages in the IOVA?
> > 
> 
> This could probably could be made to work. I think it would be an
> initial pass to figure out the IOVA size then tightly pack.
> 
> Let me look at this. Probably better too as installing dummy pages is a
> non-zero cost as I assume dma_iova_link is a radix tree walk.
> 
> > If there is no iommu then the addresses are scattered all over anyhow
> > so it can't be relying on some dma_addr_t relationship?
> 
> Scattered dma-addresses is already handled in the copy code, likewise
> holes so non-issue.
> 
> > 
> > You don't have to fully populate the allocated iova, you can link from
> > A-B and then unlink from A-B even if B is less than the total size
> > requested.
> > 
> > The hmm users have the holes because hmm is dynamically
> > adding/removing pages as it runs and it can't do anything to pack the
> > mapping.
> > 
> > > > IOVA space? If so, what necessitates those holes? You can have less mapped
> > > > than IOVA and dma_iova_*() API can handle it.
> > > 
> > > I was actually going to ask you about this, so I’m glad you brought it
> > > up here. Again, this is a hack to avoid holes — the holes are never
> > > touched by our copy function, but rather skipped, so we just jam in a
> > > dummy address so the entire IOVA range has valid IOMMU pages.
> > 
> > I would say what you are doing is trying to optimize unmap by
> 
> Yes and make the code simplish.
> 
> > unmapping everything in one shot instead of just the mapped areas, and
> > the WARN_ON is telling you that it isn't allowed to unmap across a
> > hole.
> > 
> > > at the moment I’m not sure whether this warning affects actual
> > > functionality or if we could just delete it. 
> > 
> > It means the iommu page table stopped unmapping when it hit a hole and
> > there is a bunch of left over maps in the page table that shouldn't be
> > there. So yes, it is serious and cannot be deleted.
> >
> 
> Cool, this explains the warning.
>  
> > This is a possible option to teach things to detect the holes and
> > ignore them..
> 
> Another option — and IMO probably the best one — as it makes potential
> usages with holes the simplest at the driver level. Let me look at this
> too.

It would be ideal if we could code a more general solution. In HMM we
release pages one by one, and it would be preferable to have a single-shot
unmap routine instead. In similar to NVMe which release all IOVA space
with one call to dma_iova_destroy().

HMM chain:

ib_umem_odp_unmap_dma_pages()
 -> for (...)
   -> hmm_dma_unmap_pfn()

After giving more thought to my earlier suggestion to use
hmm_pfn_to_phys(), I began to wonder why did not you use the
hmm_dma_*() API instead?

> 
> Do you think we need flag somewhere for 'ignore holes' or can I just
> blindly skip them?

Better if we will have something like dma_iova_with_holes_destroy()
function call to make sure that we don't hurt performance of existing
dma_iova_destroy() users.

Thanks

> 
> Matt
> 
> > 
> > Jason
