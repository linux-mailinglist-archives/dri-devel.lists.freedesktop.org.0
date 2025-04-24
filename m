Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92B0A9BA5A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 00:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E1010E878;
	Thu, 24 Apr 2025 22:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="acTooKvk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE7510E876;
 Thu, 24 Apr 2025 22:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745532026; x=1777068026;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=g3cdA+in3ue5TbiOT29LvKKvyba3ojBbzOGI+dTBfCE=;
 b=acTooKvk4pEn1LY06urwUlYnvEwuzBPB2k/O50/pCJzRZvZBWLyNT/DN
 LNeF620wYKDh9lUIddTPv7nW4oy4YP1EKuTJdPUdWdHB6B3A5os40PBcy
 cVCcP1LJuWmj4rRLvUYV4QnMbBfltxvO+K414KGCwNpDFdrky3uUUlk/K
 LjN/1G+dTyQbbfoE2BBYyRxlQJPEZ9K3fATiGFr9CqBvMwxpGX+JqeOUr
 2fwpf0pFMqho3g84T1YstvNVa5RrQu6WDQsuepY47vjZuCwekYapJHeDO
 ZNBBCJSmdRHBS/8d0h1HkkcQeTPsSuyS9azO9wgKVl5CdmCjYdO9h/qrS Q==;
X-CSE-ConnectionGUID: 27YCjmR4R62o68C+fGphCQ==
X-CSE-MsgGUID: HNosVkfzSJCoJMJBRXWDfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46898640"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="46898640"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 15:00:21 -0700
X-CSE-ConnectionGUID: bp+T+4AQRvOvRGrZH/Oa0Q==
X-CSE-MsgGUID: wh03J9+iS1aX1NWFAyB4pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; d="scan'208";a="169948557"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 15:00:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 15:00:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 15:00:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 15:00:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIoCWzob1aLyQILnQTllbYD4S6LPaM0Xe38RmSdMZaJJ+LpmkB43otFWJqUfbomUvLQXWpwkDVbRLHfdjrhsrP2DSfUUkVrmcoUr79Y6b5HLFRoStgJ62a5FVUplpCfaLOLzbDWxcdIoCB3zU460gVRZkWKM5tglHIhMuItSR6hVBDxE/Ut7WwvoVSirecY4yIS6sRQxrb945YBmnjEnRlxp6iMFVh5rT5WEdLwOmCYBod1FtZD03aEUB3KCCMUWGI3CzsStjDbGn4Jb9UU+IZY30WupXGEiCT2g0DmLS7V2LKZQVJB6Shmzp4QPmWWv4yuc86sgwuAusqytNR5AYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXYvcVOPBGuD8Yt6dCvHB2zC3bXzaqmzNsMDQWKZ8wQ=;
 b=KirxQYtHUuXxCNwup2CIYV+epi0BD4nRv6ZT+f3ys0O8xBh3IHYZ7I03vfXLervE8MGHu4/9KByePvkWjAyxTEC2209/0eDIf4hSzNk/ZEYNwYZ6VsaAdC9m2XWTRl1rUOY4RovL2GDcxyihfJFc9umedOHlTHQKvIo0a/Oxg/nTi7XKnQaUsjbVDXAkxIEgUIJIfsFZUK1ixw/fUBA09xXBj1hfzxjFpgCEQ6vtmSFnE4VGJ3ek9CcNWz8WJRU0xIsl5+OqnevTdOYw8GbRuBayn3jusGtr0JZI/77N+T7GV5vEhBvCXfJg/w3JIcxqKMNsefnXjQKVLW2UGCcVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB8005.namprd11.prod.outlook.com (2603:10b6:a03:523::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 22:00:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Thu, 24 Apr 2025
 22:00:00 +0000
Date: Thu, 24 Apr 2025 15:01:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 5/7] drm/gpusvm: export drm_gpusvm_pages API
Message-ID: <aAq0sYGG/nd/gZKm@lstrano-desk.jf.intel.com>
References: <20250424121827.862729-9-matthew.auld@intel.com>
 <20250424121827.862729-14-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424121827.862729-14-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:303:b7::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: bd99d311-8a39-4f6d-d152-08dd837b5ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?mTWUfab5Y7gv6ttCbbCW9zxejaBmi9NtvOOYlV90DH2tltXa3HxLQ0KBQA?=
 =?iso-8859-1?Q?X1HF4bmODHwOR+EflC1WEyj4HFHhHTQWfwDbQnpCJcRVrmR3hiztMOq8c8?=
 =?iso-8859-1?Q?ATacFVOdms5OSOx3anLFwbMjB3NsN9s3IwUFfqoHTbJbqbPvjB00wGFeV5?=
 =?iso-8859-1?Q?780ED8sxMwp6Ayapnxwrc0YLB6OsgKGmp7KrURGnV7U7Un2X8Q5Eowhhmx?=
 =?iso-8859-1?Q?ddhg18tunL9J6pDHAGLHcPPS4rSFE06HZARYh5qmSMkTLAvoIIZbAbuL3l?=
 =?iso-8859-1?Q?66uMnSgLbbo8W7Z5qsuEMEZDYNZF/yFD8pymqNJ9P9an79jMQZZizVFFF3?=
 =?iso-8859-1?Q?PbOwDocGtbXf83n86jw2mVQS701UMv32L5ZrDr/p4+egfh1xdXgCnOd6At?=
 =?iso-8859-1?Q?Dw9slbstRx4XAoWTC+GrW9RCCTflPgBO+Ojfd6cNG2VkX7php26a1VU0sw?=
 =?iso-8859-1?Q?RqcTiHHCcqGFV2hyOW67dB+VQ7F+q7szYD9IFhkFvxRrcyphZvmbGkpMSs?=
 =?iso-8859-1?Q?CncKU9zB6ch1Wr3wzl4MdbSmowgZnA0jL91slcZW19My3p6wkIKnxnWIsA?=
 =?iso-8859-1?Q?Out3ilaF5+szNpzKoJkPo5VkXn+LeFbhbE6wt9Nff3kWqRwd5cz/xYahrB?=
 =?iso-8859-1?Q?9eiEg7XdyHWEz7x/LMYoLvpvIbWDa0L4fWn/IaQhcZW+tSttqcNlauz3LJ?=
 =?iso-8859-1?Q?BamCsvymg0GBbJ5hKli2p4fU4YT5ZnD+qn3TVZx8TTkHpkEevXmIkZw8ZD?=
 =?iso-8859-1?Q?nExCCKyTz/nSc0R0leNmOovqs3OucvhXPebmMEwa/BXANSDOlfi1OdvybM?=
 =?iso-8859-1?Q?E8o71BNJ8dtHHgd/Uy+VNqA4vfbJFts5WwjKzJavQnj/fOUo5ZQjLdOQyx?=
 =?iso-8859-1?Q?TPLH1zRRJsMfAMXQw2820vsTnMTjgU457qZZLM+hz3l9Z3W1PtBu0SSOAk?=
 =?iso-8859-1?Q?chTYG4Qn9t7/+PV/azu7+lo9b1nICW0o7y5Kdr8rs/mWv00G8wSbwlNdvO?=
 =?iso-8859-1?Q?U6JvOBKz5hrdrtoaJfJ5fzDQX8iRmgLZPg00/vP9JIIQtwFUmAHU//00xj?=
 =?iso-8859-1?Q?OsTBcwsiRlUqLJp4dsdIQj1KPW5UuiyJsH9q7xKe6t1UETGMNXPEzh2Eem?=
 =?iso-8859-1?Q?eymuOriGgFK7K6Z8rviQq2npuSb7pSBnNnpfXYPf1jd6XKOaeNGPh8Gm+k?=
 =?iso-8859-1?Q?MgApeYmMgjKNeaW+USM414L8994jL+4ea1joCplAFsPqj1AonSkWplj7S2?=
 =?iso-8859-1?Q?bloDIs8p12N5fNOOtIJGfP7JnLLW+Pd7keOx1gSxMYxR6lwsZxaeYBFcs5?=
 =?iso-8859-1?Q?IUDEoPXSA5bN2TKFzQa6ImN83d3JhRr2D85v9K2e2FTpM1u+tTh6dhm+e9?=
 =?iso-8859-1?Q?o1o5aHsv08efh3JgkNAR3nxPttzjgW2sgTCumajXt35jXiJN0zQy2ZyzVD?=
 =?iso-8859-1?Q?m0amSkXUIFCSFnK7Ra6TKkxd/VwYcFLDo+hoUc81E6qZ0+tu3d+kB8N3hw?=
 =?iso-8859-1?Q?o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?f9BGaNcwcvlA1qWLNYlStLFRi/fvCb65tGblvOhJ7xIJawJ/r4FLhq7RNZ?=
 =?iso-8859-1?Q?ImMp+0FAwY8+IWs+SRypFsITQ5XxVt0oIMhTM+oh5zHz3YumEeX4FN7Tu/?=
 =?iso-8859-1?Q?ac5+6b76PVWw78hqjqJdqvsiucpp3L3fcYHJUky3Cb9hG7sQqBRjHc4HgA?=
 =?iso-8859-1?Q?D2qO8ib9hNueWgSUQFokHBtHYUj8+hDywp2FYPTofBim/OHrIF31oVDB0S?=
 =?iso-8859-1?Q?ECCDpZk/UH1o8swbujOv3kSkKMcq7mE3q5SBOWnnikA/ylLv/DQSrIZ9M9?=
 =?iso-8859-1?Q?+6jRfN7iQHvJS2CnKHqVFNwsXrfCWcGR++nAAgOqtQc/kjqMDJJC6agpd7?=
 =?iso-8859-1?Q?jt38Z1+AL1vtBFuhY+WsGRzGPUHsW1vfDlJUm6BpfxaoPxG62H79Dj1LSw?=
 =?iso-8859-1?Q?SA+2ii5XnlsYXw1+EUWZjYimx3eyud0CCJQ+i0rCqMPVzehUT9ubE2R2Ku?=
 =?iso-8859-1?Q?OivMZoeYzjwPljBFo+55ziBxurEyASmqmvIVninRYKpjRwRpwP6dKRK0Ws?=
 =?iso-8859-1?Q?UgdNVsbN1gcXW4Jxy7DeSRb26+bTzKh68071/lgTMqtWmTO/8pEErDT6sD?=
 =?iso-8859-1?Q?gUELV4nUS8tAOeiTwEz+hIph2QSQfOo8GZBMn/JQupFtsA7FyxjTeCZZpy?=
 =?iso-8859-1?Q?bi2Vt2R3+A/WTIXgVzud68PeEJNURXLX7MwGDXstrPctsp3YIaU7aEtAs0?=
 =?iso-8859-1?Q?D5fbtKxqZnruTcNWfFjg0McX5nXIw0FX63qPtsJxjM2ks0OYSx/+xVnrDf?=
 =?iso-8859-1?Q?kxjCN1iMm0Xw9CRsrdMex+BO8qS71kDmYn4vMNyh+1S25KjGULz8NEi+jg?=
 =?iso-8859-1?Q?6+/dPiBg6MxQNPJIFHwAvEjfI/9WkWN+/LB6MIqj2COGge3niM64wAeaXy?=
 =?iso-8859-1?Q?wtz8NxV7xr+8mGNAwoC4qklWmu5XxzwkEbNfqVj8BrmI2pTvduMYyZVYdz?=
 =?iso-8859-1?Q?wJz5zWBtwnZujEpUXev8nksNMSy2uSmfNKjnRq/mDt1Di/jeKRWv47b1fp?=
 =?iso-8859-1?Q?OtOVU5UVQ6ogHJaC3kZKGh8FUD/riTaKOGtRwd+ELArYaQEcCSet9bsZMC?=
 =?iso-8859-1?Q?YuLjY3pNewlRJNc6KyJFRlhTDkF8btg6uciLeYqFIIYuvLBc1JgSlCYHmB?=
 =?iso-8859-1?Q?F6jgmUAgKYM49FL1TZVcpPmAm2Uwg8z5xaaCnvoKVsywjdhc3LtxP23Vph?=
 =?iso-8859-1?Q?XVeFWpjk4aMTUcfKg4wu4JyXgkJUEamrjpg7neSdyljHeymZAYRWUKgBxi?=
 =?iso-8859-1?Q?ArDKu/ys+qIXov863illmzXm3+7Xa523zEzZAQWNF8ZnxAdyCto+5ATLpy?=
 =?iso-8859-1?Q?jSLbimiLchtFyNlKPEiUVC/YQgdJwdEAPKX1rAIEoxY3ogcrtNC8hQBuG1?=
 =?iso-8859-1?Q?U2aLWf1SnH+nkyACdKnX2h/QUxFv4XJp7mEiCGkKQvRVLFrr0jiUDb0xIg?=
 =?iso-8859-1?Q?uGR/4svPPwhbKeKttCtXJqf7Rf2Q4Ya2YG1RfY7rcnUhc9RsBGyMCIyvA/?=
 =?iso-8859-1?Q?RVZ/A3SSG6SRFIDTCZuXS8qMnxKdY7n7CDn6vUzFAjwXoD12II+11mks76?=
 =?iso-8859-1?Q?70MPFKaw1WOh20DpKn6aUBmohDCK1TZVhKt6ZYkEViXDEYTWpeR0tElyiV?=
 =?iso-8859-1?Q?WfvyKLLAqWWBBbhFdlqTnqfZvO68bbl8qvWirG3QSEUVxVNF8TYACCHA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd99d311-8a39-4f6d-d152-08dd837b5ba7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 22:00:00.0177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXyfWBhsFovK11QqDpG8tzRUEM52mqMVXCfy7KoCRIxyQWrzH/fSD/WIfIdmhyB+UHmBGNu2Uj6BN0OVGiVvuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8005
X-OriginatorOrg: intel.com
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

On Thu, Apr 24, 2025 at 01:18:33PM +0100, Matthew Auld wrote:
> Export get/unmap/free pages API. We also need to tweak the SVM init to
> allow skipping much of the unneeded parts.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 66 ++++++++++++++++++++++++++++--------
>  include/drm/drm_gpusvm.h     | 16 +++++++++
>  2 files changed, 67 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index fbe0d70ef163..0e0a3c995b4b 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -539,6 +539,12 @@ static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
>   *
>   * This function initializes the GPU SVM.
>   *
> + * Note: If only using the simple drm_gpusvm_pages API (get/unmap/free),
> + * then only @gpusvm, @name, and @drm are expected. However, the same base
> + * @gpusvm can also be used with both modes together in which case the full
> + * setup is needed, where the core drm_gpusvm_pages API will simply never use
> + * the other fields.
> + *
>   * Return: 0 on success, a negative error code on failure.
>   */
>  int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> @@ -549,8 +555,16 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
>  		    const struct drm_gpusvm_ops *ops,
>  		    const unsigned long *chunk_sizes, int num_chunks)
>  {
> -	if (!ops->invalidate || !num_chunks)
> -		return -EINVAL;
> +	if (mm) {

Do you still need this if statement if GPU SVM is shared between userptr
and SVM? Shouldn't we always pass in the MM?

Or is this for the mode where SVM is disabled in Xe and we just use the
get_pages functionality?

Matt

> +		if (!ops->invalidate || !num_chunks)
> +			return -EINVAL;
> +		mmgrab(mm);
> +	} else {
> +		/* No full SVM mode, only core drm_gpusvm_pages API. */
> +		if (ops || num_chunks || mm_range || notifier_size ||
> +		    device_private_page_owner)
> +			return -EINVAL;
> +	}
>  
>  	gpusvm->name = name;
>  	gpusvm->drm = drm;
> @@ -563,7 +577,6 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
>  	gpusvm->chunk_sizes = chunk_sizes;
>  	gpusvm->num_chunks = num_chunks;
>  
> -	mmgrab(mm);
>  	gpusvm->root = RB_ROOT_CACHED;
>  	INIT_LIST_HEAD(&gpusvm->notifier_list);
>  
> @@ -671,7 +684,8 @@ void drm_gpusvm_fini(struct drm_gpusvm *gpusvm)
>  			drm_gpusvm_range_remove(gpusvm, range);
>  	}
>  
> -	mmdrop(gpusvm->mm);
> +	if (gpusvm->mm)
> +		mmdrop(gpusvm->mm);
>  	WARN_ON(!RB_EMPTY_ROOT(&gpusvm->root.rb_root));
>  }
>  EXPORT_SYMBOL_GPL(drm_gpusvm_fini);
> @@ -1185,6 +1199,27 @@ static void __drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
>  	}
>  }
>  
> +/**
> + * drm_gpusvm_free_pages() - Free dma-mapping associated with GPU SVM pages
> + * struct
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @svm_pages: Pointer to the GPU SVM pages structure
> + * @npages: Number of mapped pages
> + *
> + * This function unmaps and frees the dma address array associated with a GPU
> + * SVM pages struct.
> + */
> +void drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
> +			   struct drm_gpusvm_pages *svm_pages,
> +			   unsigned long npages)
> +{
> +	drm_gpusvm_notifier_lock(gpusvm);
> +	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, npages);
> +	__drm_gpusvm_free_pages(gpusvm, svm_pages);
> +	drm_gpusvm_notifier_unlock(gpusvm);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpusvm_free_pages);
> +
>  /**
>   * drm_gpusvm_range_remove() - Remove GPU SVM range
>   * @gpusvm: Pointer to the GPU SVM structure
> @@ -1360,13 +1395,12 @@ static bool drm_gpusvm_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
>   *
>   * Return: 0 on success, negative error code on failure.
>   */
> -static int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
> -				struct drm_gpusvm_pages *svm_pages,
> -				struct mm_struct *mm,
> -				struct mmu_interval_notifier *notifier,
> -				unsigned long pages_start,
> -				unsigned long pages_end,
> -				const struct drm_gpusvm_ctx *ctx)
> +int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
> +			 struct drm_gpusvm_pages *svm_pages,
> +			 struct mm_struct *mm,
> +			 struct mmu_interval_notifier *notifier,
> +			 unsigned long pages_start, unsigned long pages_end,
> +			 const struct drm_gpusvm_ctx *ctx)
>  {
>  	struct hmm_range hmm_range = {
>  		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
> @@ -1548,6 +1582,7 @@ static int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>  		goto retry;
>  	return err;
>  }
> +EXPORT_SYMBOL_GPL(drm_gpusvm_get_pages);
>  
>  /**
>   * drm_gpusvm_range_get_pages() - Get pages for a GPU SVM range
> @@ -1583,10 +1618,10 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
>   * Must be called in the invalidate() callback of the corresponding notifier for
>   * IOMMU security model.
>   */
> -static void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
> -				   struct drm_gpusvm_pages *svm_pages,
> -				   unsigned long npages,
> -				   const struct drm_gpusvm_ctx *ctx)
> +void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
> +			    struct drm_gpusvm_pages *svm_pages,
> +			    unsigned long npages,
> +			    const struct drm_gpusvm_ctx *ctx)
>  {
>  	if (ctx->in_notifier)
>  		lockdep_assert_held_write(&gpusvm->notifier_lock);
> @@ -1598,6 +1633,7 @@ static void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
>  	if (!ctx->in_notifier)
>  		drm_gpusvm_notifier_unlock(gpusvm);
>  }
> +EXPORT_SYMBOL_GPL(drm_gpusvm_unmap_pages);
>  
>  /**
>   * drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range
> diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> index 1b7ed4f4a8e2..611aaba1ac80 100644
> --- a/include/drm/drm_gpusvm.h
> +++ b/include/drm/drm_gpusvm.h
> @@ -370,6 +370,22 @@ void drm_gpusvm_devmem_init(struct drm_gpusvm_devmem *devmem_allocation,
>  			    const struct drm_gpusvm_devmem_ops *ops,
>  			    struct drm_pagemap *dpagemap, size_t size);
>  
> +int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
> +			 struct drm_gpusvm_pages *svm_pages,
> +			 struct mm_struct *mm,
> +			 struct mmu_interval_notifier *notifier,
> +			 unsigned long pages_start, unsigned long pages_end,
> +			 const struct drm_gpusvm_ctx *ctx);
> +
> +void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
> +			    struct drm_gpusvm_pages *svm_pages,
> +			    unsigned long npages,
> +			    const struct drm_gpusvm_ctx *ctx);
> +
> +void drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
> +			   struct drm_gpusvm_pages *svm_pages,
> +			   unsigned long npages);
> +
>  #ifdef CONFIG_LOCKDEP
>  /**
>   * drm_gpusvm_driver_set_lock() - Set the lock protecting accesses to GPU SVM
> -- 
> 2.49.0
> 
