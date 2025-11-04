Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27F5C30FB4
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 13:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836BD10E5CB;
	Tue,  4 Nov 2025 12:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hjCZV7vF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151BE10E439;
 Tue,  4 Nov 2025 12:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762259376; x=1793795376;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HwRHYWvoOYmYflprkcC3wBTHEOUgNg5K7b7ORllQ6zY=;
 b=hjCZV7vFFvlnqDzwTTQ94DIVPYZAgn331YrqK9UZ+ilXoL6GEse+kAaz
 MIEMiZl3oqDsh046vdqGuZ37LrPFOo9P5r2Gfr5LUdlcL7b8QvnZD6I/B
 6bcjM5cPDZGXqvZz6zedvxzmaO9hXWxMXlQ5W/4HuhLK2jsjmN3mMMWN3
 VDml3IvL44WLH3XN5xrCN+BhAMWpuMbYQHg/aRFVu/Ic9OWHITMo0CuKg
 7uVmwCBIyHF+2KwTVev9jRQa0ftkgJCXsEFmJl+sYpAAxQRH4EbildlP4
 y7EjzgYa6VgiUTBZknBrkHWk4QWxSIBiUJ67rQj7TSA8sJOSNX+qTfAvh w==;
X-CSE-ConnectionGUID: pcLq/1XGR3mnogfJYo7daQ==
X-CSE-MsgGUID: 2HtnxUPySwOxI9YcKITZNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63362931"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="63362931"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 04:29:35 -0800
X-CSE-ConnectionGUID: bfsHjCGcTEiofpIHvwg7Pw==
X-CSE-MsgGUID: ICOHF6GCTdGdud7KKVt+Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="192315693"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 04:29:35 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 04:29:34 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 04:29:34 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 04:29:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJx/KHC2jP9495ftR8X044cDIHG5fnKlTd/xyJp2BPEL/9F5juPMahGOrOJHAOV/JnxltEmWfOdCuDhnzwaREqegm+YuR7SsgxtcMTk051wGXH0gtoK+BhdGv41PeqDNkdqQLQ+5pYAnAuN9G0yBS/VA42PlVbDBi7HyaOoyHTnDRPDf9iwIi8i5t9R8HesNwEEk70f9M5UyAgHwoQXHBQa7AOwugPPVRSp3/aE4FcuzX02TfeuxQfOxP4BWh6czEL3rlqPja3C75LCNVBSnkiMYBrKoVyNrE8KGtXo4L1tDWwL93CiQiK8oXkEpnfVD+38l49LbDKSJkZJ53AMSKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bhxoBnQz3ZXTArGCJBto0KwUd2sBUOeZNB5FGQ+Qco=;
 b=b6gbGIQ8JL5C66NQ5diSwFWo6bEkGOqo3+JRQw193l23rcHFx9zj5f8XD2o0vePGIKAEFKkynw3jkQyk1ax3Xbf2QObdfmkfCyAAc4NIST553neXCBfCiKUwjd0+XvyzDXZpD10f4poB4iMvRwYF6CndwQ7CnC7wcI1dn22yFHcNt1KelO7ZoTasiJIIg2mtKbb0d/kwtddaiFMiXUCt3tMqf2+vrKS5a5WYx213UQVVGfH3uaRlv7d/RW2UP67LpvZX3NcOmCOZGHSBAY4MgLpnzJbBgaOjocPT81msRM7N2OIgXxtiuwoqgrqaAwAt0UNlxdG3K4gF/7xIN4IGZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH0PR11MB4934.namprd11.prod.outlook.com (2603:10b6:510:30::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.7; Tue, 4 Nov 2025 12:29:32 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9275.011; Tue, 4 Nov 2025
 12:29:32 +0000
Date: Tue, 4 Nov 2025 13:29:28 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Subject: Re: [PATCH v3 19/28] drm/xe/pf: Handle MMIO migration data as part
 of PF control
Message-ID: <75wxtpocoxc5qaxcdxmqzazwny3eoqtdmiudt5j4ep5e7t3x5q@wxefgbt3m7lm>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-20-michal.winiarski@intel.com>
 <63446059-7af2-45b8-906b-4ba0688ed0d4@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63446059-7af2-45b8-906b-4ba0688ed0d4@intel.com>
X-ClientProxiedBy: VI1P195CA0074.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::27) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH0PR11MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: c4daa625-6936-4ed6-0115-08de1b9dceaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEtWbkdnN000TVQ2b090dVNBamRtekRYUXR0LytaeFJRLytaVGh2bFR5a0Nv?=
 =?utf-8?B?TDRod3N6dGticEp6c0YyUGUwTkZlcStmZHhXM21TbzIxRHFMd1RVZnoxZm1W?=
 =?utf-8?B?UmhtVE4wL2gweGVJMExLdFBza3E1SGNaWWVwbzMzME16eTUwdW9GaXFjNThw?=
 =?utf-8?B?bUh4bFFsZGprMVl3aTkxdXZqRkZsdnFkUFNqVldiUFdpYjhmaHp5VjBscmVE?=
 =?utf-8?B?WE00dUJMMCtBTzN5U1NCMEwwbG1IZm1KT3pMemRDLzdSTG9IL1RGRFlvN1p5?=
 =?utf-8?B?REJOK083ZkhJN3VhWGhvT3dQZjNFM3BkR05uWUs1aFZYOXYxem9WZHpJcnRX?=
 =?utf-8?B?cGpobFhYTUszNUFYdndLU0cxTllPSFRJd2RKeWpVZkZNSlZZdFFFdlE5SEk1?=
 =?utf-8?B?SU1xTVQ3UVVqbVA5V01EQlRSTlRlc2NIb2JPeFdlVnJiZFRBeGErOFg2RkVF?=
 =?utf-8?B?R3ZLK2dMQ3VVQ1Fid0ZwRzlJNDAwSkdjUWxXR2RwRkdXRkMzcjhDTVlYSUdj?=
 =?utf-8?B?Y1FZTjRPKzB6OENYOWlLOE9rSjR6MmQ2bFNDcFhHZUZXQjFFd0J0MzBqZlk3?=
 =?utf-8?B?N2ZGODBrQ1N5L1FVbjZhUFhQSlhQZ3RoZStXcENmZE14anRRN3ZvNXVjeDFy?=
 =?utf-8?B?eUNQUGM1SHpMN1JmSmdnazBUZ1Axa21LZkVpRWRudWZqeEwwUzFmNE9qc2xq?=
 =?utf-8?B?SThMbjlhZUg5Mmo1VTJkNDRYYWM1bFJDdTJrRS9HT2w4ckFZUHZRNmpkOEdt?=
 =?utf-8?B?b0xXV0s3d2hZRnVMQjY2TUtGdUFqdVI5WkxXWmR5cVAvNXVvVm1HSW1DQk5h?=
 =?utf-8?B?eC9Nc0FXSlpxSXZaYUxsQk5UQzd0SC9PUUhZN0ZYekN0SGViTlRSNThLU25W?=
 =?utf-8?B?dzUyME1SS1ZyNGZwb2FRZXk1SW9rQzU5TkIvUDgxOTNPeGdYZnJGR2Roazg0?=
 =?utf-8?B?QUZCMkxyZlcvZ2FjbWxMTURHMGxjcHk1UkpKSEZoRnlhK1dFbjhXYVlnUDRy?=
 =?utf-8?B?cW5zUjJacXd3T1l5MzFNbEwvQ0V2QTR6LzVSKzBUMW9jbU9VcjRVci9CRGNC?=
 =?utf-8?B?NCtlUE9CWkF6M1U4SFUwOGl3VzdDNzhwVmY1NUFLQjdhM013cjE5OGkyN05k?=
 =?utf-8?B?c3dmdWc2d3RqaFdLNTJ4RnNrdmswaW9pR3ZXM1pyTFZVVktyb3ZKam00UDBh?=
 =?utf-8?B?Vm5zcTBlWXhyV3dld2QxYWpvWDlCa0p0T2pRNUVKVXJCM0krSTdaS3hCN2N0?=
 =?utf-8?B?SzM3Yy8vamJjN1NndTFpQTE0Tm1rc0FoK1VuRFZ4UEpqNVpmNk1UVjduQnlO?=
 =?utf-8?B?a0liRmtseVVCdUQ1TkVrcVU1UTA0ejh0bWxPcHlYbE5FM1g5T3RFWEl4aUR1?=
 =?utf-8?B?cVg2NklCNlNLMDFURnFJK0lzODBDSDNyd3VGaEtCWTBLUWVDYXg0aTlwOTNs?=
 =?utf-8?B?OEVQYUxjMERtUnVCVVNDbTV2Y0d0djZKYWhzdzRlUnZIalNqWFVVVGc2SzBl?=
 =?utf-8?B?QUlYRzJOS0JySmpKQmZDVE4vQUFFSm5IcHlFUHJnbVV3VmtBMkNDcU5KRXYv?=
 =?utf-8?B?TEk2K1NyL3lGcnhhL2JGSTh4RHlDVmFrNW5Nd3V5MFJXVEVMUEVaVnFvZmZE?=
 =?utf-8?B?Z2ozVXgzYTY0U0l0TGxBWDhQLzlWS2dhZUVQM1ZOdklpZ2FmTlVlUWh6eVJB?=
 =?utf-8?B?SEJvdWIvbjNmY29aTzNNMUEzaWlZV213TTZvTm5GSTJvZm96SmFlMGRpandO?=
 =?utf-8?B?djl2K1NGWFdtdkNwZ1hTOGFSSGxEUVpJM3VIeXd3Wm5LYTRvL3IrTHFONEts?=
 =?utf-8?B?dnFXdVNiSnZ5YzF4cE1BdGlMTVZZTkplejl2TDNNWXJaRkozR0ZVSUxCZFIv?=
 =?utf-8?B?b1kzQlZwTUprSGE4Unk3YzVEandaNmxQWWxvaXJPSkprUjVHemJ1b1lEc2RF?=
 =?utf-8?Q?OFtsKKlwPN5xZKxMy/gRvmJ+FZI7gsie?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVZLTGMwT3MyVmh1UWVZUW5vOUpEVlYrdlN4OXJWM1k0eXc4NGkrUk55SGxq?=
 =?utf-8?B?OFM5bHhjc0J4WVZlY21PNW9QZU5Oa1lZNGZ0Y0x1Tmg3R1h2N05mV3RRUmM3?=
 =?utf-8?B?QzRsNVNRZk54ZVcrKzZqQkZQRjNmL1duK0pmNnFEdE5ibi9oRHg2SUh1NXRq?=
 =?utf-8?B?cXZRVEFVSW9WcTh5S2J3SVdxazNSOEdBVStnMnRxU0JvQWNPUGFJa1UxSmE5?=
 =?utf-8?B?R05HelY2UE85TnhNZ2dvMndmRlBUcnpZQS9NNmIzRUpvZ2Fyd0QwRGhya0Fp?=
 =?utf-8?B?ekpkRk50TnJoS2VQNXUxRCtaMll3dEs2T1VER2VhRGwvOUlkMWozdUdmSkNG?=
 =?utf-8?B?VWhPblAwT2pXNi9hcTQ0eVRFSjIvdHZkMnlaSHA3Qk1HN2FiWnQ2bkd0V1JB?=
 =?utf-8?B?SkdFckVsUjFTVTVXdHF1eTVqWmdXTFErSFVTdVo5WFphL3BuSWFmYUpDbWNy?=
 =?utf-8?B?VDNtcnVxYjhoUFRQcnJsK3BtWWdoZHRLb3hMeU4zRnhzQVRnZHY3OXl1VmR3?=
 =?utf-8?B?S0x0cmk3eklPb1BGYnVFdE1mb1I3bkR5Sjh0WlJtbGQzQ3lQWEdiS09QTnVu?=
 =?utf-8?B?NTZieGUrQTFsZ2g1bXdqeHFjRlV4L3lWekdiNklqN1BqNmdSVElub1Z2bjVF?=
 =?utf-8?B?UmVmQmNjZktzVDZ5U1ZmdnFnejJqWWQxY3RnUXhaSzE5OFc4RDdyYnVXNEIy?=
 =?utf-8?B?VGdoSHluOHpzaE1vUnRLeGJzQ0JGQS9IWFZRYUFZS1ROWkJ6TEtqL1M3Q2dX?=
 =?utf-8?B?SFNXd0prc2NXYzlYUWpPS1dXWkZpamtOU3BOOEZINU9YUXBMWndSU0cwVTdT?=
 =?utf-8?B?aTg3bjJvbVJuVThtVittdEE4NkdYVjNON1ZpRCt0MzVvaHp6V3Rvbmg0RjJM?=
 =?utf-8?B?RUFVZUlMdTN4TmhVVXJJNEJQenB4cFgzRStVZkFKRnIvRlhrMlJuT1FLWmV4?=
 =?utf-8?B?eXVnNzVJQUlxOGN3MXNsSWhiS2lDcEwzWW1vRFhzMzROL2o3bUxKS2xPMUdE?=
 =?utf-8?B?Rk1vVSs1ZHB5c2o5cSsxeC85a0VJRzNyOFhPc1JGMlNmWlc4ZFVHVHFmcnNx?=
 =?utf-8?B?S2s3VS9RdnZzK3duZHdTbEVPWkU2ekQ0YlFEVDAvdTgxNkV6dHdDbEFyTXBq?=
 =?utf-8?B?eUZicEZsdWFRSk1jT2piNzY2dVFPdlJnRTFXQVhXVUtucFhuMUd4ZzhBZEhE?=
 =?utf-8?B?T3JPTjNLVnNyTXczRGNZYlZCblBlMCsvekVNT3NrOTRYUWNhdzR3djg3M0JB?=
 =?utf-8?B?Rm9aTFRsSlRsc3JSd251Y1dYbzRTVXduUEk5MityZ0sxOGVnOTVWdGE3N2Vr?=
 =?utf-8?B?Yjd1c2QrUW15aUxheFBHLzQ1c29mZTZ3L1RoZm1PQnFvOVFTeVp6RTk3dzZz?=
 =?utf-8?B?M2dkYlFFbGFyeVZ3NUlBM09tYVB5eWZza3VTc0RCMWpLcTNEWnRBNjVXcVBQ?=
 =?utf-8?B?ZGpGWEJQYjdZWDlPc3FxQVdQYUN1clNlMUN0OVkweEFuMFJid01wdVR4VUpr?=
 =?utf-8?B?UGNpRkJNYmlPeUFRd0lwdFFLdU5HaWJZajdraFNaNVVMQm1Ta0NvQWlKb2tU?=
 =?utf-8?B?Z1NHVldmeFozMWZNM0RNSyt6d2JtSE0ycG5EdmpEeFo4ZGl2N0dEVE5ETGtt?=
 =?utf-8?B?M2Y1YTRXSEh3cFpGR2EvNWJvRldnVmV5UmFVNVp5amxOSGJOOU9iY28wNWY2?=
 =?utf-8?B?UWIvdElMVGlCS21SS2FvZXk5S0R6SEQrUGxnWnFJd3dieTZLRHB6M2E4aUxx?=
 =?utf-8?B?RW1BbFhVRllHSFJqeThsa1RIc3FKbi8rY0pUekpMMWRySWFSZVQ5ekJlbFdx?=
 =?utf-8?B?cUVUYU5na1hhV3dlOHBRWDdjQ0NPVmJtRy9IMGx2L3RlaWRRZXhpVnFGTjhn?=
 =?utf-8?B?MzVPSFZrMU96dG9QYWs0dzFjSlUya0RjeXF0T0poSjN1M05tcUpHT2N2dEVu?=
 =?utf-8?B?WVlvSTlTc3kwa1IrZC9pZjJyVUw2SXFiQVlQamlLLzEzRXpwSko0Mmg3RElC?=
 =?utf-8?B?dlZYcHMwNTY3c0lLSXZFMGNvN3M5VFk0R2dyOXFPVlN3Umx1MWdrNWtKUXpn?=
 =?utf-8?B?Wk9rblRVdWhkYXcwQWFxSWhqRVJLZHEySHZqSVNOUFdmQTkxdDRCWGFoeUNL?=
 =?utf-8?B?Z3g3Q3VETG1mVUs4cENlS3QwR1FSdjVod2llYjlCaFBMNHRWbTdiMDU0OTFh?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4daa625-6936-4ed6-0115-08de1b9dceaf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 12:29:32.7366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTffo731DpOR0e5ws4xfmGetqG0rF4Z1g/ON9oECl18vVTgQDkWDd4DYcCgs/DUGi16pju+JrYn/gjU5V2tAZXG3H7S2wRhO69vQbuUz9Cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4934
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

On Fri, Oct 31, 2025 at 07:39:58PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 10/30/2025 9:31 PM, Michał Winiarski wrote:
> > Implement the helpers and use them for save and restore of MMIO
> > migration data in stop_copy / resume device state.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf.h           |   2 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  13 ++
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 158 ++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   3 +
> >  4 files changed, 176 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> > index e7fde3f9937af..c0dcbb1054e4d 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> > @@ -6,6 +6,8 @@
> >  #ifndef _XE_GT_SRIOV_PF_H_
> >  #define _XE_GT_SRIOV_PF_H_
> >  
> > +#include <linux/types.h>
> 
> ?

Oops, leftover from previous iterations.

> 
> > +
> >  struct xe_gt;
> >  
> >  #ifdef CONFIG_PCI_IOV
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > index e7ea9b88fd246..7cd7cae950bc7 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > @@ -870,6 +870,16 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
> >  		return -EAGAIN;
> >  	}
> >  
> > +	if (xe_gt_sriov_pf_migration_save_test(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_MMIO)) {
> > +		ret = xe_gt_sriov_pf_migration_mmio_save(gt, vfid);
> > +		if (ret)
> > +			return ret;
> > +
> > +		xe_gt_sriov_pf_migration_save_clear(gt, vfid, XE_SRIOV_MIGRATION_DATA_TYPE_MMIO);
> > +
> > +		return -EAGAIN;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > @@ -1079,6 +1089,9 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
> >  	case XE_SRIOV_MIGRATION_DATA_TYPE_GGTT:
> >  		ret = xe_gt_sriov_pf_migration_ggtt_restore(gt, vfid, data);
> >  		break;
> > +	case XE_SRIOV_MIGRATION_DATA_TYPE_MMIO:
> > +		ret = xe_gt_sriov_pf_migration_mmio_restore(gt, vfid, data);
> > +		break;
> >  	case XE_SRIOV_MIGRATION_DATA_TYPE_GUC:
> >  		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
> >  		break;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index 6f2ee5820bdd4..5e90aeafeeb41 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -5,10 +5,13 @@
> >  
> >  #include <drm/drm_managed.h>
> >  
> > +#include "regs/xe_guc_regs.h"
> > +
> >  #include "abi/guc_actions_sriov_abi.h"
> >  #include "xe_bo.h"
> >  #include "xe_ggtt.h"
> >  #include "xe_gt.h"
> > +#include "xe_gt_sriov_pf.h"
> >  #include "xe_gt_sriov_pf_config.h"
> >  #include "xe_gt_sriov_pf_control.h"
> >  #include "xe_gt_sriov_pf_helpers.h"
> > @@ -16,6 +19,7 @@
> >  #include "xe_gt_sriov_printk.h"
> >  #include "xe_guc_buf.h"
> >  #include "xe_guc_ct.h"
> > +#include "xe_mmio.h"
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_migration_data.h"
> >  #include "xe_sriov_pf_migration.h"
> > @@ -357,6 +361,150 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
> >  	return pf_restore_vf_guc_state(gt, vfid, data);
> >  }
> >  
> > +static ssize_t pf_migration_mmio_size(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (xe_gt_is_media_type(gt))
> > +		return MED_VF_SW_FLAG_COUNT * sizeof(u32);
> > +	else
> > +		return VF_SW_FLAG_COUNT * sizeof(u32);
> > +}
> > +
> > +static int pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size)
> > +{
> > +	struct xe_mmio mmio;
> > +	u32 *regs = buf;
> > +	int n;
> > +
> > +	xe_mmio_init_vf_view(&mmio, &gt->mmio, vfid);
> > +
> > +	if (size != pf_migration_mmio_size(gt, vfid))
> > +		return -EINVAL;
> 
> you may want to check that first (before init vf view)

Ok.

> 
> > +
> > +	if (xe_gt_is_media_type(gt))
> > +		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
> > +			regs[n] = xe_mmio_read32(&gt->mmio, MED_VF_SW_FLAG(n));
> > +	else
> > +		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
> > +			regs[n] = xe_mmio_read32(&gt->mmio, VF_SW_FLAG(n));
> > +
> > +	return 0;
> > +}
> > +
> > +static int pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
> > +				     const void *buf, size_t size)
> > +{
> > +	const u32 *regs = buf;
> > +	struct xe_mmio mmio;
> > +	int n;
> > +
> > +	xe_mmio_init_vf_view(&mmio, &gt->mmio, vfid);
> > +
> > +	if (size != pf_migration_mmio_size(gt, vfid))
> > +		return -EINVAL;
> 
> ditto

Ok.

> 
> > +
> > +	if (xe_gt_is_media_type(gt))
> > +		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
> > +			xe_mmio_write32(&gt->mmio, MED_VF_SW_FLAG(n), regs[n]);
> > +	else
> > +		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
> > +			xe_mmio_write32(&gt->mmio, VF_SW_FLAG(n), regs[n]);
> > +
> > +	return 0;
> > +}
> > +
> > +static int pf_save_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_sriov_migration_data *data;
> > +	size_t size;
> > +	int ret;
> > +
> > +	size = pf_migration_mmio_size(gt, vfid);
> > +	xe_gt_assert(gt, size);
> > +
> > +	data = xe_sriov_migration_data_alloc(gt_to_xe(gt));
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	ret = xe_sriov_migration_data_init(data, gt->tile->id, gt->info.id,
> > +					   XE_SRIOV_MIGRATION_DATA_TYPE_MMIO, 0, size);
> > +	if (ret)
> > +		goto fail;
> > +
> > +	ret = pf_migration_mmio_save(gt, vfid, data->vaddr, size);
> > +	if (ret)
> > +		goto fail;
> > +
> > +	xe_gt_sriov_dbg_verbose(gt, "VF%u MMIO data save (%zu bytes)\n", vfid, size);
> 
> maybe make it part of the pf_dump_mig_data() ?
> 
> 	pf_dump_mig_data(gt, vfid, data, "MMIO saved");

Different patch - but I'll merge the two.

> 
> > +	pf_dump_mig_data(gt, vfid, data);
> > +
> > +	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
> > +	if (ret)
> > +		goto fail;
> > +
> > +	return 0;
> > +
> > +fail:
> > +	xe_sriov_migration_data_free(data);
> > +	xe_gt_sriov_err(gt, "Failed to save VF%u MMIO data (%pe)\n", vfid, ERR_PTR(ret));
> > +	return ret;
> > +}
> > +
> > +static int pf_restore_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid,
> > +				       struct xe_sriov_migration_data *data)
> > +{
> > +	int ret;
> > +
> > +	xe_gt_sriov_dbg_verbose(gt, "VF%u MMIO data restore (%llu bytes)\n", vfid, data->size);
> 
> and here:

Ok.

> 
> 	pf_dump_mig_data(gt, vfid, data, "restoring MMIO");
> > +	pf_dump_mig_data(gt, vfid, data);
> > +
> > +	ret = pf_migration_mmio_restore(gt, vfid, data->vaddr, data->size);
> > +	if (ret) {
> > +		xe_gt_sriov_err(gt, "Failed to restore VF%u MMIO data (%pe)\n",
> > +				vfid, ERR_PTR(ret));
> > +
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_mmio_save() - Save VF MMIO migration data.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier (can't be 0)
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > +	xe_gt_assert(gt, vfid != PFID);
> > +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> > +
> > +	return pf_save_vf_mmio_mig_data(gt, vfid);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_mmio_restore() - Restore VF MMIO migration data.
> > + * @gt: the &xe_gt
> > + * @vfid: the VF identifier (can't be 0)
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
> > +					  struct xe_sriov_migration_data *data)
> > +{
> > +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > +	xe_gt_assert(gt, vfid != PFID);
> > +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> > +
> > +	return pf_restore_vf_mmio_mig_data(gt, vfid, data);
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
> >   * @gt: the &xe_gt
> > @@ -389,6 +537,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
> >  		size += sizeof(struct xe_sriov_pf_migration_hdr);
> >  	total += size;
> >  
> > +	size = pf_migration_mmio_size(gt, vfid);
> > +	if (size < 0)
> > +		return size;
> > +	if (size > 0)
> > +		size += sizeof(struct xe_sriov_pf_migration_hdr);
> > +	total += size;
> > +
> >  	return total;
> >  }
> >  
> > @@ -453,6 +608,9 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
> >  
> >  	if (pf_migration_ggtt_size(gt, vfid) > 0)
> >  		set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_GGTT, &migration->save.data_remaining);
> > +
> > +	xe_gt_assert(gt, pf_migration_mmio_size(gt, vfid) > 0);
> > +	set_bit(XE_SRIOV_MIGRATION_DATA_TYPE_MMIO, &migration->save.data_remaining);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > index bc201d8f3147a..b0eec94fea3a6 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > @@ -22,6 +22,9 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
> >  int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
> >  					  struct xe_sriov_migration_data *data);
> > +int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid);
> > +int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
> > +					  struct xe_sriov_migration_data *data);
> >  
> >  ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
> >  
> 
> but patch looks ok, so with #include fixed (and maybe with better dump helper),
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 

Thanks,
-Michał
