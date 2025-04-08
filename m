Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92726A80FB6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 17:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B11899B7;
	Tue,  8 Apr 2025 15:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aK+ZgPme";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55E7899B7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 15:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744125687; x=1775661687;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uIhqU0QTxZl0Xpv3I5xwk16v7qQPifeKDLmMuARr5M8=;
 b=aK+ZgPmeVTjQmEyUEubD/6dStET08Rnv1/Cgrbi/6XldgRWkztCwNinJ
 zagJQ71cBdCtVAsJPSfws2iQPx9oT2eSyTTRdHqfUB2we4EdU2Fa949rO
 aa70gfq3lcQbbRuHdAfm6KuARLHAyrgod8/+CqRLLFN+4JytSdmeJapEg
 S0T6vZcb2SbgcmH6QBJwigr9/J95PYIgIjLObvVuiLPxzyT+dhdYOF+1f
 lsELQIR0z6BkNGx6hLYRbm/sTUBUeWqAch8uEHnm4LaoCYKu0vxrOujTX
 md91B1VaGrschVZ2zXen5Bt0Va/l2Mvqscd/dTP6aE8canZeZJ/mWCgzI Q==;
X-CSE-ConnectionGUID: 7dyUCrXKR3OwBcUqdMgL2g==
X-CSE-MsgGUID: wsSeNi6MTLWprrlz09Peiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49362374"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="49362374"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 08:21:24 -0700
X-CSE-ConnectionGUID: Cec8IAm8Ryq6+Dr0vnersw==
X-CSE-MsgGUID: qO14zw2MSEmcls7orvioEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="128191969"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2025 08:21:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 8 Apr 2025 08:21:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 08:21:24 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 08:21:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEfTzn4Bjxf3JyECyGXN2uGHnpZE+M0AkbUZ6gZeKomHjZrHVBNvm+kNhuuL2HJqchK2+Qrybq3NEyFbI8pra4p4fRFRH3V2oi9MS+0R5qAWKYD4CDTH2E//d21zJlxSwpRN1T2VwKJ5wYzIyxQch4dYEbK+jrVcQIrLUXQTMso/w+0Dg13yAbR2RnCLV0K3QzVCAhaBg27D/SQoODdsAucRDbd/UaAkZOCgmKlWsx0voAXJreJWZ+qynxtznO+Ul2Jr9NRj7Wn7uteaGYGQD4l+GcJaF/DHUgjSyRtAs8FHD8RVPozokiqf/4YGhlohW6a/wVYRi6/HFQa4ytnmHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJKmZzhNxxUzbkJdXYOiHMOfvibUlmO7cVKRSnzcQKg=;
 b=awHdC62MAgGBbWvO09IjQH8fD4YSwSrtrm53lyrS8W2bDm+KUasq/xuRMMzrEwVhYQzY9QYa3KNtDKa57WcY0UfYtsYBDY9pcULETpQVDSRm+BHQYxQoZW/STp3NZ0cUEQH1/d0Kw4I9HeCyKjji4/2w+pcM+berV231X5iDrBdZf6L1WCkUtnECuDr1Hp530hEMmRG76hcgrle4of16fsMVDr7JwJtJX8k/FjbwFIlLGCCfHtsq2VxfGNNB5bDsaeFYRG6S7OC8NFVRZNE8TdCT1kvmLfoRnZsz/78NA/e6MWZ3xg89qw1rkhlgI7jiR7qSGW0wpVl0x1A3AMKZCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ5PPF1EED2E381.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::817) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 15:21:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 15:21:22 +0000
Date: Tue, 8 Apr 2025 10:21:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>, Anusha Srivatsa
 <asrivats@redhat.com>
Subject: Re: [PATCH 1/3] drm/panel: auo-a030jtn01: Fix compilation build
Message-ID: <r6gh6jdfipcvg7qxcsjnldpz3txsp65xjj7mpqsnlu3yhcijta@n6mk5a76r3ko>
References: <20250408122008.1676235-1-mripard@kernel.org>
 <nyrjnvctqnk6f3x5q7rlmy5nb7iopoti56pgh43zqknici5ms4@cibpldh7epra>
 <20250408-imaginary-khaki-sloth-eeceff@houat>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250408-imaginary-khaki-sloth-eeceff@houat>
X-ClientProxiedBy: MW4PR04CA0221.namprd04.prod.outlook.com
 (2603:10b6:303:87::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ5PPF1EED2E381:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b91ba9-ff53-429f-5c83-08dd76b104c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F/4zeMCIZRjwWESWf1hTN+dyg2npKVhIONabmpL/J6G3en82Mo6FXKyuA4s8?=
 =?us-ascii?Q?jvx2J9kEp3TayO3YPQPZIud53OsYnJP5T4aEmDfdj5cE1HngEwG7yDZsJiv5?=
 =?us-ascii?Q?wNiZuqtqYFCBREAYeE9yZvCdtr6hqGjFGX6U+u+g4IEZeLuzOfkrchhm4x7d?=
 =?us-ascii?Q?0qLk5HMBqTnoLm4U9KRvwZHcuG3PVUGhkj7D5vzkHoBQgNJ6o6+Tc9ka8hm7?=
 =?us-ascii?Q?iCNz++CyRd0UHQxA3KobQ4UT56OZqE5MmbuFJ9pGww5Z8NGDQgWn7jWz2E5h?=
 =?us-ascii?Q?to3WvZocnAePgSGE4gmCuDHk3/+iD9ieBq3QPfdFJRGEpspFUh1WG+dtLJ7O?=
 =?us-ascii?Q?sTChsChB2HtPrb1N373KW56SZnFrIOwKiSzEapwoWECNa7CgMhddfI3CLxEw?=
 =?us-ascii?Q?rdwW0uj/2xonMrT0avN1v0y104mZhx8wZ6gLTzre2lj/WOenj6qPrKlMzVtp?=
 =?us-ascii?Q?QhOxy+gOgujkQT07k7+dS1nbU9PynR6+zkPXr6flO4Yc+zgkHuN33o9O8L5+?=
 =?us-ascii?Q?I2k/wKad6oDjsnE4o5HDEWLRmlOgQpEgVsDQHyzpb3qqYnhf8VNRbJn4pkC8?=
 =?us-ascii?Q?JQ3pF+xoR1e84XZrdYec8Fr5YnPdNgy480lNXatrfr7JkzOI13ShWsHkSnL0?=
 =?us-ascii?Q?a6YK6z5gc8irdIa3+xrgrmJgXNuqFWvGapOVhxDepepM1tQ2Mxoi/ZKfF8CL?=
 =?us-ascii?Q?t6FnwRtWQ//pIzOaDTGBoS8IkX0n24sRoJYecwdhNUkkx8xQDvy4b5A4+sYj?=
 =?us-ascii?Q?j3Xp+qRYu7bkzvnEt02mdjU8lqU6cdV2IQA+HJ9uY/J+FMC9rRBnhUN7mngk?=
 =?us-ascii?Q?v2AVQNMTrJbdIs3PsCVtp4G5b5s+2Uw6HUroaG8Bp7AGk9ry4HVij7UDPEf+?=
 =?us-ascii?Q?8B7JEH6sVpd1thhvd+iLfamVwsN1Z+qEJnIo+7xhypRSShZMqB8Zk8zFaZga?=
 =?us-ascii?Q?lWA8fQqnvkv0oUKu7k7nmLwi5S8/TDJbV4jYdNVlcUuK/yLjinQDz3P5eW51?=
 =?us-ascii?Q?2b+67/XVDUCeFe6gMApl8fN+cmEFux59srdNDmlQ1R7S/bokgj1WUPsj1FoK?=
 =?us-ascii?Q?w4AYyDCEkUMjmB6WNy5z92hT2nDJDxzWZAsT5wh6gusEEYBPEjtOWzPUevFQ?=
 =?us-ascii?Q?6sdDkMgOlhRd7C6JsMkr/rTxsqZGBK24WJr4ZZLe9oAigJj771SdvOU9hYUj?=
 =?us-ascii?Q?j6QNJV79iW6IVTONB1zCJ0UturuzWzBxSYi+lc3kQbayMhnMK+zfLVsoFAOf?=
 =?us-ascii?Q?Zt5lMk7YVmhG9VOOyyjp8f/nG8sXP71cy0VjqLPczOkALW7+SqW+EOh6wG01?=
 =?us-ascii?Q?9nXrIeFwJuKy7OytTwjfdqkJEF4u5hPhRouuLjNt+pI3O8Bw64qCmXDVcebO?=
 =?us-ascii?Q?3gnUmbJZI06oBEUr+5bvPhyg8tpm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JeeST5gwyb+Dfa0c/IkPnuDn8HiCLtCBwVBBJMD1V2laDYpVdm++O7awlYe/?=
 =?us-ascii?Q?7+bkDMIDULZjvhdol4YQjBGDD+prZjb9rxCO+Mfo3CoxuTOB9EE03+VRL41M?=
 =?us-ascii?Q?d7wQnVc9Sp0SwyhDsIlHXueozrV5CNF0fehzNG8meUnaDiQqWi/v7BEeADWo?=
 =?us-ascii?Q?7I33zqDGYhMmUo+sWshhMrsbI4srdM9xVhvjc50mx+LLpqCl9bzaSysuJPEW?=
 =?us-ascii?Q?qk/Vb2yUXgYzsM3IIC47scmQpuMyHR2F+Rg5aSTeLagESVAwr2hhLyG7UED4?=
 =?us-ascii?Q?XxG5eM/16uEOpXCT9UhbgXzAlpk4topWemlBPVMcH2eqVEtiqGwSaKJAYBkp?=
 =?us-ascii?Q?XiOKeaMLM9DmTUPN2CsM/O0Rr+MNZMzBMCnnKOnaM0J0Z7JA+/Y7QPvG8EXc?=
 =?us-ascii?Q?Bw42wnofA+8X6JQs/RcRrDhKbPO2FbNVhVcFYcThZz8w+2c2aNeZB2BhM8J0?=
 =?us-ascii?Q?qOgW5o9M3bvD4wjAztJs1Glhqz3v3yvUhkUfbRLlQvYI52lS+WdxSFd6+dDx?=
 =?us-ascii?Q?iU3KlViigUcNviO7UJneDFhsgMkOYAOAO40dp6nRNWP7ekSswYYrYaLhCKPa?=
 =?us-ascii?Q?cicquQCJm2WB48AJBePDGmukWfcHEHBcSw3uaLyVQ4xkviF8nNOxNlCwY64L?=
 =?us-ascii?Q?1lnzS90yHl0NM9GaMrEXxI83bK04D2QrVIiB6ZSZvkJNOebZrQUO0FRn8EUi?=
 =?us-ascii?Q?dN9Z8WyRLRkkM1foUIpre9JFdwUjjc4CtzQNR4RPdCWtdllI2oPSgfgstaGs?=
 =?us-ascii?Q?6E2OwB2VJoF03XxbH1Uo6Ox0zY4MgyRJebUnOaYoS36gBRRTJkfOvx8RO26D?=
 =?us-ascii?Q?AqDVHWMV4ImYD5yZvleAUtdlNNzUMpq6+W5aVbAB6LHAx6s3RudNmHC0+EDS?=
 =?us-ascii?Q?bC6Cd+gsMnFqeqXGpvd0+53fOfm3KgsVKpWgqJ9sp5/X+IcWXdSLhFIe/KBX?=
 =?us-ascii?Q?3LzKE8R+i29aOO54CCybPSAt1tSHRanat+1mbOU2XrrOgS7gFfcaixHLUMJ1?=
 =?us-ascii?Q?jaa9lPpKJiKZXlyBE7OXXmuLlSNeSTss8vtMfnk/WR+QLd58vM7KdAv0jbdz?=
 =?us-ascii?Q?PTkhB1BG1DKdSMqGvqZRknUZwGR+dgf2kYmgkRsxKtbpoDmRRDcRVaHxW/Nl?=
 =?us-ascii?Q?8BoqTVsRt8Uayl49vNSy8XDKabNZ4YaafiiYWS/W+S2II78/w7oLN2tMptc5?=
 =?us-ascii?Q?+yhuNe53PbPGd//yzcExxNVmHyOyCWOg8nFABnCxODuNJZdAQ0sMMuWp0unN?=
 =?us-ascii?Q?nRcvzmJaW3FrOmV7RNuRKPOwe4WjCbFodvVu1mc0YHYqmZAVi64UGr+X2iq6?=
 =?us-ascii?Q?kKVuF4H8rI7YyeoBLcwSExw4lsmijESOcTZNue8dkRcuW2rBa5zU5uBN3IcG?=
 =?us-ascii?Q?0K7wLgTQI0mO9+88bglo5xIZdM+p+HvTFmcsrqEORSqu+oPzgBs7WJvjRt0Z?=
 =?us-ascii?Q?Huea2bTG2d34NYa78PdfgelbRPr/OKvtZKzQKJhMKEf1gOAuUxlbHs+lciLc?=
 =?us-ascii?Q?6oAxB5LqbGN6P74niVkOdO0U/UjY3iMSeCrSQgn1subpmjgp5Js2TBKC/HwW?=
 =?us-ascii?Q?JTPE2qdXbXgEpRAN3d95dcbqFvEDodM7ahyWMP7rKBWXvi4cyWv4TQPZA5G/?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b91ba9-ff53-429f-5c83-08dd76b104c8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 15:21:22.0164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZUsPOz1FLCDTyCk7UX6KejJclsIcciiGz+yAa0JsAEVUeD0IWUV2JRyfzWwU03UxKkR2jyleentGF2s8zndLEtf492b7HGMbbD+pA88Zt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1EED2E381
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

On Tue, Apr 08, 2025 at 04:57:44PM +0200, Maxime Ripard wrote:
>Hi Lucas,
>
>On Tue, Apr 08, 2025 at 09:34:22AM -0500, Lucas De Marchi wrote:
>> On Tue, Apr 08, 2025 at 02:20:06PM +0200, Maxime Ripard wrote:
>> > Commit 9d7d7c3c9a19 ("panel/auo-a030jtn01: Use refcounted allocation in
>> > place of devm_kzalloc()") switched from a kmalloc + drm_panel_init call
>> > to a devm_drm_panel_alloc one.
>> >
>> > However, the variable it was storing the allocated pointer in doesn't
>> > exist, resulting in a compilation breakage.
>> >
>> > Fixes: 9d7d7c3c9a19 ("panel/auo-a030jtn01: Use refcounted allocation in place of devm_kzalloc()")
>> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>>
>> I still get a failure in modpost:
>>
>> 	ERROR: modpost: "__devm_drm_panel_alloc" [drivers/gpu/drm/panel/panel-auo-a030jtn01.ko] undefined!
>>
>> because that entire block is:
>>
>> 	#ifdef CONFIG_OF
>>
>> Based on the header, I think the intention wasn't to add those functions
>> there, right? Moving it outside the ifdef at least fixes the build for
>> me.
>>
>> Lucas De Marchi
>>
>> -------8<------------
>> Subject: [PATCH] drm/panel: Fix build error on !CONFIG_OF
>>
>> Move helpers outside of CONFIG_OF, so basic allocation also works
>> without it.
>>
>> Fixes: ed9c594d495d ("drm/panel: Add new helpers for refcounted panel allocatons")
>> Fixes: dcba396f6907 ("drm/panel: Add refcount support")
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/drm_panel.c | 76 ++++++++++++++++++-------------------
>>  1 file changed, 38 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
>> index 870bf8d471ee9..99b348782ce31 100644
>> --- a/drivers/gpu/drm/drm_panel.c
>> +++ b/drivers/gpu/drm/drm_panel.c
>> @@ -318,44 +318,6 @@ int drm_panel_get_modes(struct drm_panel *panel,
>>  }
>>  EXPORT_SYMBOL(drm_panel_get_modes);
>> -#ifdef CONFIG_OF
>> -/**
>> - * of_drm_find_panel - look up a panel using a device tree node
>> - * @np: device tree node of the panel
>> - *
>> - * Searches the set of registered panels for one that matches the given device
>> - * tree node. If a matching panel is found, return a pointer to it.
>> - *
>> - * Return: A pointer to the panel registered for the specified device tree
>> - * node or an ERR_PTR() if no panel matching the device tree node can be found.
>> - *
>> - * Possible error codes returned by this function:
>> - *
>> - * - EPROBE_DEFER: the panel device has not been probed yet, and the caller
>> - *   should retry later
>> - * - ENODEV: the device is not available (status != "okay" or "ok")
>> - */
>> -struct drm_panel *of_drm_find_panel(const struct device_node *np)
>> -{
>> -	struct drm_panel *panel;
>> -
>> -	if (!of_device_is_available(np))
>> -		return ERR_PTR(-ENODEV);
>> -
>> -	mutex_lock(&panel_lock);
>> -
>> -	list_for_each_entry(panel, &panel_list, list) {
>> -		if (panel->dev->of_node == np) {
>> -			mutex_unlock(&panel_lock);
>> -			return panel;
>> -		}
>> -	}
>> -
>> -	mutex_unlock(&panel_lock);
>> -	return ERR_PTR(-EPROBE_DEFER);
>> -}
>> -EXPORT_SYMBOL(of_drm_find_panel);
>> -
>>  static void __drm_panel_free(struct kref *kref)
>>  {
>>  	struct drm_panel *panel = container_of(kref, struct drm_panel, refcount);
>> @@ -443,6 +405,44 @@ void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t offset,
>>  }
>>  EXPORT_SYMBOL(__devm_drm_panel_alloc);
>> +#ifdef CONFIG_OF
>> +/**
>> + * of_drm_find_panel - look up a panel using a device tree node
>> + * @np: device tree node of the panel
>> + *
>> + * Searches the set of registered panels for one that matches the given device
>> + * tree node. If a matching panel is found, return a pointer to it.
>> + *
>> + * Return: A pointer to the panel registered for the specified device tree
>> + * node or an ERR_PTR() if no panel matching the device tree node can be found.
>> + *
>> + * Possible error codes returned by this function:
>> + *
>> + * - EPROBE_DEFER: the panel device has not been probed yet, and the caller
>> + *   should retry later
>> + * - ENODEV: the device is not available (status != "okay" or "ok")
>> + */
>> +struct drm_panel *of_drm_find_panel(const struct device_node *np)
>> +{
>> +	struct drm_panel *panel;
>> +
>> +	if (!of_device_is_available(np))
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	mutex_lock(&panel_lock);
>> +
>> +	list_for_each_entry(panel, &panel_list, list) {
>> +		if (panel->dev->of_node == np) {
>> +			mutex_unlock(&panel_lock);
>> +			return panel;
>> +		}
>> +	}
>> +
>> +	mutex_unlock(&panel_lock);
>> +	return ERR_PTR(-EPROBE_DEFER);
>> +}
>> +EXPORT_SYMBOL(of_drm_find_panel);
>> +
>>  /**
>>   * of_drm_get_panel_orientation - look up the orientation of the panel through
>>   * the "rotation" binding from a device tree node
>
>It's a bit hard to read with that change log, but assuming this doesn't
>change of_drm_find_panel,
>
>Reviewed-by: Maxime Ripard <mripard@kernel.org>

unfortunately in plain text we don't have the equivalent of
`git show --color-moved`. I confirmed here it's only moving code outside
the ifdef so the only functions inside it are the of_* ones. I will push
them to drm-misc-next soon

thanks
Lucas De Marchi

>
>Maxime


