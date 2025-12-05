Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EEDCA7824
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 13:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720A510EAD6;
	Fri,  5 Dec 2025 12:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQYPDtln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5853910EAD6;
 Fri,  5 Dec 2025 12:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764936327; x=1796472327;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qkkyenEy0qYQnVw0GABqD5ZM6YIjEpART53+0DPAkwo=;
 b=FQYPDtlnY75ydl5aI+hFvWVW7Tb6q+EXC9NLxRHi5Em9FApRn+FMgVfI
 afe6LLco78CRtns+8+M0DGoYlt3+9+9BnK2P1C9AgljVxJSUI+arH+A3P
 rX75nZyWlYd1vrVpMnlsudeA13pS2L3hGveQIvawr2JAJ0G6kGEUxDEhS
 AyknOGI2rm+f07QD42f5D5pPYRfEiEX2sE5VARoDBvffGJHyKasGSLjXV
 TTETXxj8qARzi7QJO0ufL4JgOSxJVjZzia0yy6jBRR7Qf1azRui01gk7U
 rLeJj798QSyQuJ0hffjqjFON4mGc2oIGcYHKlU2pGuY1kowWElHEt5jor g==;
X-CSE-ConnectionGUID: +jTkPNAXQ5ev9uRwjOzapg==
X-CSE-MsgGUID: 0TcWX7mJScaFrBLtX8U+7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78434754"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="78434754"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 04:05:26 -0800
X-CSE-ConnectionGUID: dSnm+nqVTkKbsnLLNM3l0Q==
X-CSE-MsgGUID: notEq8pqQsuEtUXztwooZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="199720990"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 04:05:25 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 04:05:24 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 04:05:24 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 04:05:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLFrWzjyCErKjE0RsT2NOu9aOyPHl1kLGWjF29lJT+79anH8xgO5CAq+snKYAnhFoOpuCRH+CA3M9bnrNYDpT8UPfp5RLljSvY6qiGofiYqYFRdh4lzP1aLo9LRthbPIhRopkSsmjCruzdSq6mBzfAu8SzRVVNxapxIYruDgSDnasMwZQqW9Pb1wRGpxu0WVHZuN4yVXfVYJrVrpvYnCV9I7s9a8o+85TATTmOh2/SX8xHBtfDCJ06YPDM8JdLvdJ++ioylkSb3EXp21VaXgXBUr6WRSzg4aL2oqjJ9IXUPiBaeV8f3SXqUoeGn1XAT4EIfvvHjWj7SLmVOjhggW0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBKLa/U4KH3kMa9uv1wOUjU8mMNGR4volmdffNi/tBo=;
 b=ogb4BwcNJGjOGKN+JKzu8gGuAmcSYWHHhnnwpLs+vj75W/KXfyT2IiWDWyLOyXPMKjOyOA0GwTitCelU1Y1Dhn311555IGqjNxR2IQe3iA18zWWCBD52aYkDOnIumP1ukkgY2hEeeC2mY9i7s8FWCrZfu/Mo5ziG7pyy47uMOMomR6FCRz6EFY+tpgMPQ6Y5SqcDdt/oHgOTJdu2VMWd9Iq7pkBZgutXQGEbg8IdokKeGRY2MAMmaSD4rEGwi6Mfb6kmHePB3Azhon0Lh2M+AkvCBSGW9F/VuGfrIQb042jqx2lHAvCCAXW9zC3NoCbc+PYIb2Rn8SOvez0SKP0Cvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 12:05:22 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 12:05:22 +0000
Message-ID: <e963b9a5-77db-4f3a-b172-a5e9a66d937d@intel.com>
Date: Fri, 5 Dec 2025 13:05:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] drm/xe/xe_sriov_vfio: Fix return value in
 xe_sriov_vfio_migration_supported()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kernel-janitors@vger.kernel.org>
References: <aTLEZ4g-FD-iMQ2V@stanley.mountain>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aTLEZ4g-FD-iMQ2V@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0019.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::32) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a6e6d2c-1fb1-4acd-dfe6-08de33f690e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnRydGhMUzBqN0F0b3JRSDB6Zjg2UEs2MElSRHJnT0FtQjJzbVE0dzhiUTlk?=
 =?utf-8?B?eU14SmVlSVRRNVNUUVU3R3R0TUVxNm9CWDlJNlVqN2kyWU1Kc3ZISUt3VFRi?=
 =?utf-8?B?bWtWTU9yQzRndGdvN1RPM2FWSk9jUHV1NmxPYjBDeGVreWxOeUNUeGdBc3Zw?=
 =?utf-8?B?R2cyMlFRdTU0VFV2UzRyWjlXdGJCemI3Snd1N1poZ3pTS2JsWVBCRE40QTBI?=
 =?utf-8?B?RnBGZGhGdDFia1g1UmhDZXpGdU5CcElrTDdqUkd5bHYvaDNuOWs3YlNnQmFS?=
 =?utf-8?B?U1pSemc5SVljS2Eyd0IvTThMei9SWEx6Z1IxZCtCckVWdGJnRGpHZEhSbzVT?=
 =?utf-8?B?V1k4aUJVbGlYTXdndGFoK1k4aXRWbXptMHQzZ2xGNFZSRkZRVml4bmpEK3pE?=
 =?utf-8?B?MTErVVRIQlF1MVpGdko1U29XMnJVR2FJdnJGTWxNMkV0OU5XbWh3eGFIN291?=
 =?utf-8?B?VlNlRm1rUVAwc045SkMyU0d4UTJmb0lobHF6VlM5c0xzcnplckhYOVoxWWhD?=
 =?utf-8?B?cjZPcEZHTFpFV1c4Uy9TYXgyVjRyYk92dU11MXdZM0xqZ0I5M1ZkazQwcWVZ?=
 =?utf-8?B?TTlGMC85Y0NteVBMRjgzelZMMDBVT2lsbU01TTQybEJLZmgzRk9YbjJUcTVp?=
 =?utf-8?B?V0FkQmVPcHF1Rk9oNzZ5RWZJSEc4UFRLQm50RGhuZTNrdWdxWlJzSkt3MVNy?=
 =?utf-8?B?OFNVRkFmendXL1laSktQREV3N3BlMnIxcWlROE92VVFTMEZjMHN3bnFWczRa?=
 =?utf-8?B?a0ZUSnVmV01YeUxpOTJBRlM2ellNOVJJQjBmV0MxelNtTE5wcnlSbUw3d0dp?=
 =?utf-8?B?WGNXZW9PZDllVk1VajhFQmFCYzBIdEwyeTdFM0RkUmRyMHlhckZLdVVDM09a?=
 =?utf-8?B?bFhqTzBTUUV2QytaVEsyTS9BK0dOYjZCRTJ6ZjRtSVJqLzNNRkdoZlpjdXEw?=
 =?utf-8?B?bEsycnpUakpzM3NEdnBBa3JPUkkwaGZWUzJ4OFFnYXJva3kvd1FCRmJiT29q?=
 =?utf-8?B?cE95YmdzbkI1OFhwY1VIM21EaDJBOEcwMDFoY3hQM2RydS9KalYvVXhubkVX?=
 =?utf-8?B?VTdHMG53cmw3dWkvVWxmcDFLdURsY0U5dThTa21RTkRMZHVYVEduOTBHa0Jv?=
 =?utf-8?B?dExOYS9YUWhZQ3o3OHRZWXpuWWdjTS9rUzhhZGd4MlZzZlQ5eVBYOUUzcU10?=
 =?utf-8?B?eG5EZnhJZFV2ZmpiWDVWQ2FYL3o5aTJFYmF3NjlhVHlkMjhIYXRZWXhIajQ3?=
 =?utf-8?B?TnF4NTdPMVpaa05oMWhxWmNWYi9TT2I5QWtOc2p0RmdYWDNweEJ6UjRHQVZN?=
 =?utf-8?B?WVpZbE1LKzlqRXBzZDFtOGRzUHh3SEdGNU02R2tNOXpqRGgySHN6aUxkdW4z?=
 =?utf-8?B?SDZUOWFQM29JTjVCQVVsV25jY0NGa2xkZk1YNDVZMGtWbFlGQ1VQYWtpRVJW?=
 =?utf-8?B?U0d3MzJlS3hIbDFUT0J1ak5sVG9mOXVWaXZxRklrd1VqSE52Mk5rVFpJQldJ?=
 =?utf-8?B?OGVIMXBDY1RmaW0yRUVZVkFuUVlWTXJtbDIrblFIcGUvdmExWFBTbC9zNzFE?=
 =?utf-8?B?V3pYeFBScUxpcDFVYVkvTGxwUEZZSjlkdHNZMXNWWVpCdVY4elN6SVVmQlhj?=
 =?utf-8?B?MUxRSUVXYkdsQzNJNXNNRTZuVzFaT244S0ViWHdsV3Z1OWFHSDVlVmcrdkFX?=
 =?utf-8?B?bDRlYWJsRVBRWHdBNW8ySDFLZ0hWeU4rVUJpM1RKZ1UvY0xiKzNFR1psUW1Q?=
 =?utf-8?B?eWYrSDNWbzdGQ2ZIbFF6cTB2cnlPVnEzRUJNaEk0UlB1aHFuQUNBUU9pUytz?=
 =?utf-8?B?VFlKbmdWMmlHN28wSXQ0Q0JiVTkxQmpXSTh6aDZKQ3lpTy9kdDRreGVvZklv?=
 =?utf-8?B?SVc0WkNkYm1YSDFKcjFvUVJuNmdMWlNGR2c4MlhsOEFZVSttZEI3UmpzM1JL?=
 =?utf-8?Q?0GFHykt0Sv9Xlv26KZBw6AktdFeyPnXe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0cxMHNablI1YndHbUdkbFdScC9laFp5ajJaNkpUZXJCYWlzeGtkMTl2RWYx?=
 =?utf-8?B?eVVqYmd5cDFFSzAzek9CUjVOamxWSFNLSlAweUJ0Z1Mrb2pIYnlkdE5qNWdo?=
 =?utf-8?B?L09DTjQwbmdKeVRLR0Q3ZSszT0lLaHFwTXdsaFBReUhFZXdSSUtrMG9YSlpW?=
 =?utf-8?B?ZnpDTk5jTkxOUzBXRndmZnBtdHVVSEppdm9GNUxzNUxELzZXUmNSd3ZjaVJP?=
 =?utf-8?B?cXN6ZUQ1ZjFzMksyMldVNUhyZ28yTUJKdmVocWdCMkU4ZGx4bFBDRUZNMmJS?=
 =?utf-8?B?VFJlVk9nS2VOdVozRzhiaC81QUZycEpFK0tuRzFNYVNKS3JZSDhTbjI3U3ZZ?=
 =?utf-8?B?bnp0cXBpekhOZ2RqWjVuRWxORGpjdU1ZeHNmY2xhYUtqQlNycnNadDlxcUc5?=
 =?utf-8?B?b0NKNUJTY2RJMEpWRTMwTi84S2JtcUlXeWxvZUNZTVdyQWN2TmQ2VXp6MEVi?=
 =?utf-8?B?cjJJdzFoSXoyL2RHQmhpa1hkYU0zUWxIL25VaFdhSVlNMXpQaGswQks5Zk1i?=
 =?utf-8?B?V09qRjVLVXBlbFRWYS9xek5ra3ZNdnhDRHZMMWhJV1FhcHA1VEg4a0N3M20w?=
 =?utf-8?B?ZkxIV2pSYStEUEJOVXFWc20xR3Z0Mnl3Zm9UYllxQzhFVDFkS3Yra2NSTkU1?=
 =?utf-8?B?ZmJPelNybzZMZVJjdWZUbEVwVUdIVE14N3I3cHJSWHBGQXJmTnRlaDhGV1Fi?=
 =?utf-8?B?T1pid0VlK1U1R2tsei9sVXc1UFhWTHZCUW91MHgzeG80cjRualJpYWJTOWJm?=
 =?utf-8?B?N3VJZE95UVZTQjJKbUVFOUpGMXh6cEtaSFMrcENwbkRkRXVRa3MrZVFTZzN5?=
 =?utf-8?B?dUtaZGlNZnZmdnhyTzFXMUJTc01kMmZGRHd2SGdaMXphMjBOanl4bDhPU3cw?=
 =?utf-8?B?TXRnZU5Jc1VCRXVMR3BtcUxtYXFXODhnbm9PNWFFZ0w3TDFZT25YOS9LZEcy?=
 =?utf-8?B?eXZBVlRRRVUzM2FhWEtqWE9XaUF6RWNMYkRnZkxvRnE2VmluR2VOTXlDN2FF?=
 =?utf-8?B?bXQ0dG5Ebm1kdWFZVXdLMEM2UWRuYytmUWRtVTlIclY5SUJBSUJsMDFKV1pl?=
 =?utf-8?B?RFJNbGRWSy9iL0NYV1Y2VW5YTTlYVUdncTZ3NFFxYjVPYkw4eEovQUkxZENs?=
 =?utf-8?B?YTd3R3FYbWxCYWo5Tm5RNzZjVmxHTDJabnZBOWk0blQ1c3Z0TWdPV1A5MjBR?=
 =?utf-8?B?TXMxMndPUEtHcUQ4aXM5dlhyc0NEUnEydVp5TkhFSlZ1R3hCYWdBK2xTdmsw?=
 =?utf-8?B?WVl3QUJGUXdLUkN1Wm9GOUVCV2xiK1M4K3VqZDQ4NjVoOGFYRk5xdzBRMTVL?=
 =?utf-8?B?YkZZc2JTYzJDcEV6cyt6cFFmVjJISHlrRkI0UFkxWGxWakdkckZVY05tcEVi?=
 =?utf-8?B?YnhieEQ1YmxTMmMyMlpidGl4ZlBLbjkrZEl4UXlGb2F1TVY1cDlxZzF2M1c2?=
 =?utf-8?B?OEN4RXdrbTNidGxGaU5pL3VRblgyblhTMFZRcVRjSGJpWXJ3NWJQUzJ5bFJ4?=
 =?utf-8?B?c0RQZVpDa1NJZGJHSW0zQ05WYkJYZ3NRUWxKcDJFRmRXTHdubzlxT1FDSTYz?=
 =?utf-8?B?RDNBMlV4UHkyUmJwOWNaSjdQOGJjTndvL1VwZ0ZpWXczTGkvVXRqV2hxUU9a?=
 =?utf-8?B?aUU4ME5uMjQ3VkhTcW9EdnBlWnN5SXJOT21Nd2szQklXRVVZZDYvRnJvOVJO?=
 =?utf-8?B?cTVUSlhaTTU3SWFvNHlzbk5xSTlEVVFuQmNXNklBUXkrZWpKamNHUVhxMDEy?=
 =?utf-8?B?ZFpwTURJVWhpd0xsYmpyZi92UFRWZ2NrL2VPL2tGOEoxK1IwVnhuZkRNczho?=
 =?utf-8?B?cGlXUGxCMXlNeWY2eGNnMStvM1IzVWpDNWc1c2dRSHk5VndMVHBicFBEY2NJ?=
 =?utf-8?B?bWhCOVV4LzVwWmsrNFQrUG1MU2xnN0o2MUFXeDNKakdFU3ltTk4xV1BxSXZV?=
 =?utf-8?B?Vms0bnozeE1SR2QxSkhKdnpMN3Y2Nzh4YjJPUDhLbGdCbGEwR3VJckNXWWtp?=
 =?utf-8?B?ZGhJVnVIOUFNL2tnUWhVYU9JcmlrREYrWlJmNi8yRW9SdlZza0FRODhhWG5Q?=
 =?utf-8?B?SENxbzR5cTNTSkpQV2pCcmNkZFRRZlp1Z3N5TnFrZERNSkVwTkNVYVNIaUdy?=
 =?utf-8?B?VDdPM2syN2VldlVRVTdWMUtzanlVSkQwUDlCbmpYalVONjNVMUxqSEZTNHAx?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a6e6d2c-1fb1-4acd-dfe6-08de33f690e8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 12:05:22.1370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHmnka7/toVweQy2/LT52rGE77s8rfYvOCIYF3wBGI4qq+jZ+rw30h2kb8Ww873NY8lhUwf7wzWfZrLaJ7pGpLHxZvrwSmoL9GIarOJJ32c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
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



On 12/5/2025 12:39 PM, Dan Carpenter wrote:
> The xe_sriov_vfio_migration_supported() function is type bool so
> returning -EPERM means returning true.  Return false instead.
> 
> Fixes: 17f22465c5a5 ("drm/xe/pf: Export helpers for VFIO")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_sriov_vfio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vfio.c b/drivers/gpu/drm/xe/xe_sriov_vfio.c
> index e9a7615bb5c5..3da81af97b8b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vfio.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vfio.c
> @@ -21,7 +21,7 @@ EXPORT_SYMBOL_FOR_MODULES(xe_sriov_vfio_get_pf, "xe-vfio-pci");
>  bool xe_sriov_vfio_migration_supported(struct xe_device *xe)
>  {
>  	if (!IS_SRIOV_PF(xe))
> -		return -EPERM;
> +		return false;
>  
>  	return xe_sriov_pf_migration_supported(xe);
>  }

