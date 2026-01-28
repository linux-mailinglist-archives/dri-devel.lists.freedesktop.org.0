Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OB70HhMVemlS2QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 14:54:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB355A255C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 14:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E6010E2BB;
	Wed, 28 Jan 2026 13:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LQcS7pOg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013020.outbound.protection.outlook.com
 [40.93.196.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD23B10E2BB;
 Wed, 28 Jan 2026 13:54:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jL5v1qTP1JqfKhkG6Y87zsmArN5kBi3+65UQNs+1350ZjOYlHzP0/7yRgKlSXcCcBkwjBT6o17sLs/ycP+cY5TjZdfZFnJKz2tNzWsrA+dqErHPofUGpJKCZA/3dnGmLgV9fgwWMEoSmgG+7IQnsX8BuHAY6PZ+gnU+6Oeq/qgIB3grHvUXyNTSVKMK4lnwt/0XsBYuF+xM37MOzMatGfJyCS2uWd4ehwh1qwfqBtTc0R/vQ/PdryUlfhBxrni/bOfVeA698zgflqGrC8y9chgbBfE9tMC8tYPoPLn95b5nUvjgTtpbI67ZYJlRwRsFyQMboozaypSSknBXHurX9QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3P0MZmbLKwwSsc2f8gF/Ty73X/0slFfHdCyutkoYAw=;
 b=CxnpB3eO/WqViazskqt+hpK1zX4GPb7GpVuSpwkEGwHsSSH8kvP90ZerLKMtfJ9gam1sUuNxLYfYVtz/w4zisFqw+UlQyVC6piQoJc4zEgGTDiMNAnW5qSJRIPqAVIi+6VtJKnfnvNochcz1XlfIjCMJhecvZgjtFaRZFCDdZvFkL/J/35wJd7nTREgMKknKGbMhJgK2U1zQ4QPg4UJNwlMsNzs0qIfGD9FAl+zeYbvSIUr3NyK40h9fUE20QyrvRJ1kZZDNGzhv7cLbJyWym/Bh2aAdRb4X9hJIIkl2mzEbBk81k8guNFD+0m/hW/jb2+p0sYn0BczRG0/VWc5XEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3P0MZmbLKwwSsc2f8gF/Ty73X/0slFfHdCyutkoYAw=;
 b=LQcS7pOghdbdXM/z1muFmS7TUM2Ym9AHxyV6eac5Z2bvN24tlqO36aYLSDacp+doRtQYky45MXiU0LLjIjRrP7e/yNXStCaR6XzYu5biS6ldtMdLO183JXsv+mhnrQ/DC+nUJi0kq/flYWogSTCk0s9xZFSK+4++tMoeDO95uLW46Ul/yLEoos6bXMYvjHewCGThnhOFXQigcka1EeaIj3jvFqW/uDnHDk3N7Ziy0czhivm9MvlTgm4AJQsygr/N5e2e9AYqbo5rCePXYO7yMaRpP05/QGhsxA/BxQEU4nCAICgbgWKRMoXl3fLyM7voeMn2fT7y4UfN+Q6i3WxKKw==
Received: from SJ0PR13CA0240.namprd13.prod.outlook.com (2603:10b6:a03:2c1::35)
 by SA1PR12MB6824.namprd12.prod.outlook.com (2603:10b6:806:25f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 13:54:14 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::4d) by SJ0PR13CA0240.outlook.office365.com
 (2603:10b6:a03:2c1::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 13:54:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 13:54:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 05:53:54 -0800
Received: from localhost (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 05:53:53 -0800
Date: Wed, 28 Jan 2026 15:53:45 +0200
From: Leon Romanovsky <leonro@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <francois.dugast@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <jgg@ziepe.ca>
Subject: Re: [RFC PATCH v3 01/11] drm/pagemap: Add helper to access
 zone_device_data
Message-ID: <20260128135345.GE40916@unreal>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-2-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260128004841.2436896-2-matthew.brost@intel.com>
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|SA1PR12MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: bd11033d-61e9-4181-5411-08de5e74b899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eWdPeUA+wYyCkq6pgcW7++KdiwT40TtukvFwJ9bAqqx1B2BdhLJO3QX0Fj3S?=
 =?us-ascii?Q?tBUipNpaTKPRalsAvUktGToJwaJJR9DagOFi96XmvzppKGBl6UirGjDCdGLk?=
 =?us-ascii?Q?QIeJmubCKtkj1Bq2kyq8xsw5P/60YSbAIwUIO1wt1K1rFOEhHug4P0SrmyJV?=
 =?us-ascii?Q?Odev7CphyTMMVBhsL8ll7AiRF8Qli/G+fhYEhH2LdtfaQJqLT6zP7ie770il?=
 =?us-ascii?Q?uUft6NTD8A+pcL1sRZ9YjmG5bwWy/8tRW+yNpmUk/ne/BrMhMjcFKgtNNVDJ?=
 =?us-ascii?Q?BUl9xwzOldT9hjh0HwQ5a5wzwUpQRfA534XWmRi3Dm7EDkwiN0+bqagWLpaD?=
 =?us-ascii?Q?/6V6NpS1xDUhFsf7HSFFaNBhGhST2sg4mXRH4wfNJUxqoAYDAnCowxByvQaE?=
 =?us-ascii?Q?aGJ8L95vPYQifJDzMMegrkBbCsAOdTgju8JoeuLbpyNaLFtIW0+ZXmeux1xb?=
 =?us-ascii?Q?1r7FSkukq5NEOM4WGbs6+Dd7xpI1J3PWYUQuMEaVzY83quj1uwvnpfpGDG66?=
 =?us-ascii?Q?SPNxOawDDzXBwgM/WdWXRU+kCuokb8RhgvhFVX/CAWPCmcUPVM4+23ST498M?=
 =?us-ascii?Q?RalOdWxqgI7R6BRI0+cowcszQMM8U8zoZfbB17FCUMoWa/YxbtSpKtwNkfP8?=
 =?us-ascii?Q?4OZIzxA7Mj1AFldU7+eDZa3kjJT7H2misozTVhBvpTY/NJjhBDKCLVUKzFm1?=
 =?us-ascii?Q?PgvZBZqK797ttJblFfnOdn1KeO+Xv8qisBTvNIdhKjs/bKQPK8Sfeb003syE?=
 =?us-ascii?Q?qzoyTnIYBNmEpHVQeymprugzHh2kD8C/KwWrikYZBkVER+JyKLMEmT24AdIN?=
 =?us-ascii?Q?RLoY8cas+l9wj8yaT7vncTwLI63D0NPyi6Mss+wlxsdlMUnXDws6hRBEoHjI?=
 =?us-ascii?Q?d8/nG0h8gn5v7jDGauN8jp6SS7C42BT1IPSVxK4owr2JvGB470SOWgMDVhaG?=
 =?us-ascii?Q?i1bHPNotmauKpFoQ3K5Z5/kBGvO3YMkqYFosTEnQcvyIC9dtdI1komG2R311?=
 =?us-ascii?Q?XQUv7ZunkZlIKwSPrCNukBX1k32KEmNFX/6xNRjI7ZxI55FNGGU8kXI2PDaO?=
 =?us-ascii?Q?3bC3Ka/R/Ss5Hxpk5U7wccYGLT62e36Y+0aL3Ga/VK1AS5ruMZsLiePHVqGK?=
 =?us-ascii?Q?g74r4tdUX83j/a8PGC/LDGQti4VWm82t/t3sjI5r3uXjzGwEBN2eJYq3nqns?=
 =?us-ascii?Q?T8i3g3rSGavTVCWGZuUl0wiINlfQwRKjJPmXimjlcqKUiRYVRJGyxOcLuSfZ?=
 =?us-ascii?Q?f+EsZXJ5GSsCbdApsAsad4alPgjY8PwVYJiTDm4RCAfneRW6jW4Sysm9Y/WT?=
 =?us-ascii?Q?miOeJ3chkENb4ybM7XoBNMGkujv1bEvdTpd1f6SPufg5cMSmtDJXErUnZ2g9?=
 =?us-ascii?Q?pKqfQNFpGe3/r6iER2YmJIgEOym8gu5+iNsnZ1KOkZ5Vi2eMY1poGC6xg0H2?=
 =?us-ascii?Q?PiU9YVj9sxg5/gO3msuszL45w71LJsXFCFG05O3VKp7T/C1GV2O7pT6IVo1f?=
 =?us-ascii?Q?wjbk3p13lR2QeB8S1baLupoumrIOi3E4VYamWNXYMOIY75rCxvlUct1QcMPW?=
 =?us-ascii?Q?dWWTkJrh2TKKzTOtbZKhER/y6DYDOQ1TB08GAgcUe2aaFPuH5BbytXAN8/JU?=
 =?us-ascii?Q?xLUTBCMKs1nboRXsVM+ra2PvCZf/YbxvHTrwBTilFdFtlsjFI6EnetNR3dsV?=
 =?us-ascii?Q?UCoSQg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 13:54:13.7564 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd11033d-61e9-4181-5411-08de5e74b899
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6824
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leonro@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB355A255C
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 04:48:31PM -0800, Matthew Brost wrote:
> From: Francois Dugast <francois.dugast@intel.com>
> 
> This new helper helps ensure all accesses to zone_device_data use the
> correct API whether the page is part of a folio or not.
> 
> v2:
> - Move to drm_pagemap.h, stick to folio_zone_device_data (Matthew Brost)
> - Return struct drm_pagemap_zdd * (Matthew Brost)

The common practice is to put changelog under --- trailer as it doesn't
belong to commit history. There is no value in this changelog while
running git log ....

Thanks

> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c  |  7 +++++--
>  drivers/gpu/drm/drm_pagemap.c | 21 ++++++++++++---------
>  include/drm/drm_pagemap.h     | 14 ++++++++++++++
>  3 files changed, 31 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index aa9a0b60e727..585d913d3d19 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1488,12 +1488,15 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>  		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
>  		if (is_device_private_page(page) ||
>  		    is_device_coherent_page(page)) {
> +			struct drm_pagemap_zdd *__zdd =
> +				drm_pagemap_page_zone_device_data(page);
> +
>  			if (!ctx->allow_mixed &&
> -			    zdd != page->zone_device_data && i > 0) {
> +			    zdd != __zdd && i > 0) {
>  				err = -EOPNOTSUPP;
>  				goto err_unmap;
>  			}
> -			zdd = page->zone_device_data;
> +			zdd = __zdd;
>  			if (pagemap != page_pgmap(page)) {
>  				if (i > 0) {
>  					err = -EOPNOTSUPP;
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 03ee39a761a4..2c67aabd8d65 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -244,7 +244,7 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>  		order = folio_order(folio);
>  
>  		if (is_device_private_page(page)) {
> -			struct drm_pagemap_zdd *zdd = page->zone_device_data;
> +			struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
>  			struct drm_pagemap *dpagemap = zdd->dpagemap;
>  			struct drm_pagemap_addr addr;
>  
> @@ -315,7 +315,7 @@ static void drm_pagemap_migrate_unmap_pages(struct device *dev,
>  			goto next;
>  
>  		if (is_zone_device_page(page)) {
> -			struct drm_pagemap_zdd *zdd = page->zone_device_data;
> +			struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
>  			struct drm_pagemap *dpagemap = zdd->dpagemap;
>  
>  			dpagemap->ops->device_unmap(dpagemap, dev, pagemap_addr[i]);
> @@ -603,7 +603,8 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  
>  		pages[i] = NULL;
>  		if (src_page && is_device_private_page(src_page)) {
> -			struct drm_pagemap_zdd *src_zdd = src_page->zone_device_data;
> +			struct drm_pagemap_zdd *src_zdd =
> +				drm_pagemap_page_zone_device_data(src_page);
>  
>  			if (page_pgmap(src_page) == pagemap &&
>  			    !mdetails->can_migrate_same_pagemap) {
> @@ -725,8 +726,8 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>  			goto next;
>  
>  		if (fault_page) {
> -			if (src_page->zone_device_data !=
> -			    fault_page->zone_device_data)
> +			if (drm_pagemap_page_zone_device_data(src_page) !=
> +			    drm_pagemap_page_zone_device_data(fault_page))
>  				goto next;
>  		}
>  
> @@ -1067,7 +1068,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	void *buf;
>  	int i, err = 0;
>  
> -	zdd = page->zone_device_data;
> +	zdd = drm_pagemap_page_zone_device_data(page);
>  	if (time_before64(get_jiffies_64(), zdd->devmem_allocation->timeslice_expiration))
>  		return 0;
>  
> @@ -1150,7 +1151,9 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>   */
>  static void drm_pagemap_folio_free(struct folio *folio)
>  {
> -	drm_pagemap_zdd_put(folio->page.zone_device_data);
> +	struct page *page = folio_page(folio, 0);
> +
> +	drm_pagemap_zdd_put(drm_pagemap_page_zone_device_data(page));
>  }
>  
>  /**
> @@ -1166,7 +1169,7 @@ static void drm_pagemap_folio_free(struct folio *folio)
>   */
>  static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
>  {
> -	struct drm_pagemap_zdd *zdd = vmf->page->zone_device_data;
> +	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(vmf->page);
>  	int err;
>  
>  	err = __drm_pagemap_migrate_to_ram(vmf->vma,
> @@ -1232,7 +1235,7 @@ EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
>   */
>  struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
>  {
> -	struct drm_pagemap_zdd *zdd = page->zone_device_data;
> +	struct drm_pagemap_zdd *zdd = drm_pagemap_page_zone_device_data(page);
>  
>  	return zdd->devmem_allocation->dpagemap;
>  }
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 2baf0861f78f..14e1db564c25 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -4,6 +4,7 @@
>  
>  #include <linux/dma-direction.h>
>  #include <linux/hmm.h>
> +#include <linux/memremap.h>
>  #include <linux/types.h>
>  
>  #define NR_PAGES(order) (1U << (order))
> @@ -341,6 +342,19 @@ struct drm_pagemap_migrate_details {
>  	u32 source_peer_migrates : 1;
>  };
>  
> +/**
> + * drm_pagemap_page_zone_device_data() - Page to zone_device_data
> + * @page: Pointer to the page
> + *
> + * Return: Page's zone_device_data
> + */
> +static inline struct drm_pagemap_zdd *drm_pagemap_page_zone_device_data(struct page *page)
> +{
> +	struct folio *folio = page_folio(page);
> +
> +	return folio_zone_device_data(folio);
> +}
> +
>  #if IS_ENABLED(CONFIG_ZONE_DEVICE)
>  
>  int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
> -- 
> 2.34.1
> 
