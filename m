Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9650C938B4E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 10:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08A610E42C;
	Mon, 22 Jul 2024 08:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1XfyTwk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A69110E42C;
 Mon, 22 Jul 2024 08:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721637355; x=1753173355;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VIVL9pS6b8ajtxnJEUo9+uEB3Z6eDu9SnOgyjAwq7a8=;
 b=U1XfyTwkYiB/3K1UBvlkzcPLd+e7t6ypf0OOjZPlrvkRIramkJmm2Yyo
 6NY6A/T16xvmM/3dWC9rRn4Z3569WAqwpuZkpA6CXRVs3JWWgBfADxgbz
 HG9ehvikFDo2wz9rk0JpGbFECh2DQnsbBL2qz/3R2slqA2MCVcFCS/i14
 aqpRh23jjDtdGup5AW0bsUU+m/NPGbCLByzjOH4iWKhNDmgVB7rj/3i+G
 UEIujvjbhJPv84QbLzzb7S/lt8VAN2xob4DzNoPsY1BvFS2z9D6LlIXF4
 /28cBM4oVCcwsRlm0bal5IwikXKjFOAparPl9CVsG+Hd92GSA9M5F+Bre g==;
X-CSE-ConnectionGUID: MB7/pJc8SDyW87pu3MMUXA==
X-CSE-MsgGUID: //MqhRQxQKG9hvOG9w32KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="19321859"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="19321859"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 01:35:55 -0700
X-CSE-ConnectionGUID: 3EhI52MSS5y2NqB6bojqhA==
X-CSE-MsgGUID: 1jGXaZR7TRK8LhgU8/08pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="82454849"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 01:35:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 01:35:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 01:35:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 01:35:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2OgVEEbWC2w2f62nWyqepdvwYiRcvF/l65n3IRXYtI30i5Alr3Ps/be5pfXyNmqMNHjevW2ePMmWl6/tlGzkljI0e1miZjGXSbsQrAyFuoqgcNKWxnMkSUPt0WA2JwGHhMz2Z3c04WGKlFyurck8Gcbi8GxRj2vgMY3ygc3Gpxg4DDSzuL+wj4MFOxDb+aHdoY6u5A7GrYPTJ4YJVFo6VJMLfIGKE+CtpkHlMQmUyUiUmWpPLdCWqAIFFRWd2YZsxXDtAFgFu8OXmAbZDnE3JyxDu7EAlFbcMhm4oR77af9W2M/W+cZjaBm3idN+zzPITAaJONpnh2YscY13lJ1nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQ/M1ZGBa683yxwxHMrZQaQN0zJJFTx5ReRc/FfC+jU=;
 b=BcenO2KYAhvnfBngXKT4ana2JmwpqMKz7U2Ta5FAb9GfsH4pK7LwhOTBfsuZRpnmOBAbqs++vm6GrUV6M2gjeWjQEdAGQnECfyn1XSITcCUwolpWVI7sKaxM/Ut8Hl5DWB8l+evY1GQ0JckBUwi8PMTIiMzATZVwLsT5mTaWgMk0bUcJyirIoL7cMLYWXhVLagc/tSw6s4oVZFL05pgB5aiyKgCobGruFb6JlUHj0uFjW+cbW3xRYgS16ZD7xh2TEqjY4lv3HzTdorWK4u0cj4s/mLZq+cGC4lcBXll1m0yMPgu9UQnOUCHFl02G31AlAoBb11Z74n3IMnsWEn0SFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 MW3PR11MB4524.namprd11.prod.outlook.com (2603:10b6:303:2c::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.29; Mon, 22 Jul 2024 08:35:52 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7784.015; Mon, 22 Jul 2024
 08:35:51 +0000
Message-ID: <dd60b8a1-11d5-4c1d-9751-2343f3247522@intel.com>
Date: Mon, 22 Jul 2024 10:35:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] drm/xe/lnl: Offload system clear page activity to
 GPU
To: Matthew Brost <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20240719095506.4068-1-nirmoy.das@intel.com>
 <20240719095506.4068-3-nirmoy.das@intel.com>
 <Zp4PRK1mlL9Kmdmj@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <Zp4PRK1mlL9Kmdmj@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8PR03CA0016.eurprd03.prod.outlook.com
 (2603:10a6:10:be::29) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|MW3PR11MB4524:EE_
X-MS-Office365-Filtering-Correlation-Id: f519b94a-9678-49af-feef-08dcaa294b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXAvQTlGTzNPZkE0VkF5VVA3OHRLamFmS0c2SlJiMXpaWjBjeWRNbHZ1aWVr?=
 =?utf-8?B?aTZUM2NJM1lYRndDcFRZK2NBM25zSTVrNjNGNVRSTTF0YVYyU3M1MTZad3My?=
 =?utf-8?B?RmtidjM2K1NiQ2RWVkdqak5WWmRyVi9BOEpLeGg0MFhJY2tqRTBzU2JqeGhQ?=
 =?utf-8?B?TGdxQUpBbldtQlFFY29LN0d0L1lmUms0Nm80WU9pK1ppMkhLNXpFZWRrNkZM?=
 =?utf-8?B?SmZzVkRxNnNKc1R3Q05nWTBkZ3RMUFR5MUJhelV2L2R4RE1ISkJIMjl1UkxJ?=
 =?utf-8?B?VzFrZ1BDazcwN2xOL1dWZ0xEWXRxSmFPSStlOEhMUnkwTGN5UDJJRitqQWhu?=
 =?utf-8?B?WWhKWTJxKzIrQ1lMMWFlUS85eDJ1MXpaMkcxYWU3QjI1QzhScWFubm5NTkhE?=
 =?utf-8?B?MmZsbWNzTkV4c0dad052eHlFcjFqdXpEaDJHenFhaDJmTjFHUFJZbzhkTkdk?=
 =?utf-8?B?UnN2NVB6MjlKL2hlaXkwV2pwZDl4QTU5ZG8vcXo4UkJHZmRVTDkzQU93cmRX?=
 =?utf-8?B?WTdCSTF2OUhQb283WWp5cE9BT0xjTCtYQWx0Z0lWckZUM25QUkxWK1NGSjRR?=
 =?utf-8?B?RE8yMmpGbXZqZ2oxYlp1bWVBVStpR3BwNWVteUo1MVFjNXQwalFUN3Noa2tR?=
 =?utf-8?B?eks1c1RHZjY0ZGVkL2RMWEJ1TlFOT3lDTkQ5SUFRU0VOaWdPdndRcjB2Mmor?=
 =?utf-8?B?eTEvNzgwZlpYaXZ6NDhyVWQrYSszR0hFZkRIOUNvdGZEYXNXcEExME9QNTkr?=
 =?utf-8?B?aDhVbG5mTzBoM0dnNUIvemZRdXM1a3YzWFdYamxHZTBENjI5UnE1U1pRMHF0?=
 =?utf-8?B?UHJpMDRiZ2ZPVnZXSWNJN2QwYU02ZnJoaVhmZGhiajJYMjVwODJpOHFYamRv?=
 =?utf-8?B?WTRScUpZYWN3ZDJvUlYxejRkMUszLzVmaXpTL2xTS00yN1V5V1Z0bjB6NmlE?=
 =?utf-8?B?SEQ3YTRLZmljZTZKc1czWTFVUS9BcngwRmcrK0ZacUVHN3BIZU40WUJxcm1h?=
 =?utf-8?B?Mk5nY1p0cVhyRDJSYVhrWVM4Wi9Bd05obmpjS1drdEI1a2dDcEJGZkx3KzQw?=
 =?utf-8?B?OWVuRFdYNlBpODB1cXl4RU0yY05wVU9TU1EvY3d6ZTNNS1FER3UrUUlJYWdK?=
 =?utf-8?B?Tk1LdWpEWUd3d2dpUEVJc2x5aEdxY210Wkw5RUJHL3JqbitCTkJMQUxnODdZ?=
 =?utf-8?B?UDZXRkUxN245SzFhTWRyR29WQVE1N0V3bzFVSTlsL0YwMWRyaVY0VFNUVDFa?=
 =?utf-8?B?ZUIrU2lmc2ZmNms4dmkzanhqZjZjT3VLOUhIRmg1MEtOcUNON2I2WWtFblNs?=
 =?utf-8?B?Y0pwUXg5RXNYM0IxNkEzZWFXMWNTbW9ER01OQisxSGtueTVVWnU5SHUvbC9y?=
 =?utf-8?B?TDBMZklsU2w1L3loTU9PaGlTOURIU0drS1hkclRQVlovcnNLU01MbTFxK3FO?=
 =?utf-8?B?cjYyQW1KT3psT2VKWUFEZFZlTkRWSVNwTjFNdklTQTZNclZDTUQ0VTFXb2Nl?=
 =?utf-8?B?SVZVRVl1clNOZzYwTGtaWmlyUFB5ZDNhL2tmVWxQQUU0Q2REUmZnQ3luL0V2?=
 =?utf-8?B?dHZNeldrbXN6OXoveTNKcE1ia3FaVWx5SEhUb1BsRDJIVXdBRmJ1cHJLeTN1?=
 =?utf-8?B?VVl1SDNZWUc0aGxKdmx0V01IZnpaRHgwcldLcDhEWGlIeXdRQSt6T2NXZjdz?=
 =?utf-8?B?ZmM3WXljLzg1UUNQOEFPU1B3SUZxcDRSVU41bGQ0bUwySXE1eTYrSmlDa0cv?=
 =?utf-8?B?V0drL01CWkloVHZLRDF2cnVxQ2pCZ3VuMms4Rmx3ZktMa3BoTGdGWTB6Z2NV?=
 =?utf-8?B?MEF5ditEbjRKLzg0empZUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDQ5YUxmV3E2TkVYRnlrQ054Zyt6WXFFejE0anNzSWlxbzltWWF0emtPMGhY?=
 =?utf-8?B?V0ZPcFBaby9wc2JkcWM2VGVoS1F3enVGMSt3b1N3eDIyZmxzWmFHVGl5bG9W?=
 =?utf-8?B?OXgwUTQ0dGhBTjA2N0ZQa055OVIwTEh0TGhTVFRnejNDMHIrdEROdUZxcDN5?=
 =?utf-8?B?VkNHc2FlZFBOejJrYmt4VkNYQjg3OTQ4YnpZTlRvUUxhVW5Jamt1M0hVRnFK?=
 =?utf-8?B?eVcyamVFTW15ai9MK0pIRFF2dFJoR1VxQ3NUNkg5eWdMMHhlU3dRVFpWeTda?=
 =?utf-8?B?OUEvd2dUVEE1NmNNNVBkbWk3TldUNUlPQkZ1QUdrbm00UTNNUzJ5dWJUMUZH?=
 =?utf-8?B?c25uaWhWVU9JRXhNT1dnN2NIR3ZWdFZkT0ZOcmF2dzEwUzdOYllhWEtXV2c2?=
 =?utf-8?B?dkVXZmIxQ2xQY0o4Vjd2NjZ3K1l5RFpXMlE2TWFzNVNCanM5NXZHM2ZHVDN2?=
 =?utf-8?B?akdXdUc0TWhMN3VPY0hrTmtCVUZ0czJVZUNtZ0lZS1dPUkdhY2N0NUFiWUU4?=
 =?utf-8?B?d05XMUF2RDRuc1I0a2pIYXllbkcxMlh2cWVFZFp0blV0MWdYWDQ0U0RaRnNw?=
 =?utf-8?B?b2krQmpYSnhmQW5hS016ZmtXU3dRVEYyRVZ4VGR0aW94V2ltcEkzbmpIM3ds?=
 =?utf-8?B?M1k0TEsycURYeGJTVmxwd2tmS2VIdksxZWxIK0t6ZTdyR3kyZGZFaHQzZXEx?=
 =?utf-8?B?RUd0YVdFUHhtek1hb2ZMbDRlSjF2TW1XRnMwQUV6cVBwcWVVRnArR04ybi9Q?=
 =?utf-8?B?N3lncFlSRk5LaW0rZ2NMaFcwUGR3Y215b3IxQjZ0V0FObGcwQjhLOVljdlNw?=
 =?utf-8?B?ZXA1ODBxNWU5K2RmS243Vi9PVC8rQkpvSFM2VURVNDZrVGdhS2lrQTM5SXZk?=
 =?utf-8?B?OHppb3d3UXRzSDV1b2tQY29TTGtWRG44akVTNUJWZ3YxNzhVWFlhUWhKSUpj?=
 =?utf-8?B?Z3N5VW9QMTBlbjVNRHJPMHhwSUk4ZUE3dnk4aUlCZDk5UmhCcGRYYXlLTDFZ?=
 =?utf-8?B?dVM3MEZ2bks3ZEpoaUtxRmo1NEgwZTNJbkFTUENjMmNqYmlHQ0hyVTJZYm9U?=
 =?utf-8?B?Sml3a2Fma21jTU1SU3hhQTZiL2NjUFdPNzFzbzA0MTl6VFpoR0pnZmJoTTBE?=
 =?utf-8?B?RFJmalhhSnR1dVkrVzgxUDladFZBamNxajVaRTRPK2N4UEZyT1JacDRKaVp3?=
 =?utf-8?B?M2J3dEhCd0RpcDlRcW5uQ2NoakY2RHZsNGZCMkUzenlTbjNxMHpVQ0J2UXFw?=
 =?utf-8?B?SEl1ZHkvcldTQTVQSkYvdUxFTUtrWFJHWFdROUNsNFpMd0FGbG51TEF0bVpK?=
 =?utf-8?B?VzVWWndGTnFZUzRRbTV2RzBQVWdrc2V2alZWeXJZV3ROZFU5bzlZeVVzRlVR?=
 =?utf-8?B?KzhSUmZ3RUxlczUyWG5sOVArMVY5WTJFVWEvUEp4Uy9VSmNieGd3U3Y2eER6?=
 =?utf-8?B?eVIvQmlHNEdFdEt2L25JSktUVngxdlhxdVhseWQ4THlSMk1HdURXL2MycEFn?=
 =?utf-8?B?MWtDbjBEQVdHRnRSSTcrVDVVdmFnNDNnUG9GU2FoN2FuRlkzdkJKZ2grQmZh?=
 =?utf-8?B?ZUNEeFhSL0ZEZ1ZvT3R5Z1ZqbDlBNkFCSzQxUFY2N1JmckNUaTJDRGN5UVVN?=
 =?utf-8?B?eUlkQ08xM0ZnaWZ1Z1p3YS9wS0JWWTB0eExUbUROQStSbUFKcDJldG84Z3Vz?=
 =?utf-8?B?bGtoMTA1VE92MFJwcHJzekY1ZktGZ3VMK3o4NG1Dc0dvbnMwUUJTdXhzNkh0?=
 =?utf-8?B?c1A5NGY0cDlZdXJEZ0FpNGpEbG9Dbzk1ZUlBeHRqL0krY01KaHhRUDAyYlRs?=
 =?utf-8?B?R2JTUjVXcXdZMWtING1VUHhiNS9nRFVKM0RrbUpzT0VXYmRSNTZIc0xrTVpT?=
 =?utf-8?B?OGFqV1RTdU11QlBIKzg2M2ZqK3lFenlGc2oyclBzemFCUXNOdlNWcjR6Rzk3?=
 =?utf-8?B?N1lZa3pHMDh0Y3NveU5LS2lvRFY5QU9jR0xsalZDSjhuVSt4dGt3OG1ZT1NC?=
 =?utf-8?B?eGJYTlJJZU9zSnhWQ29QdzY3eS9JUUQ2Tmtxcy9SeW43eVZWSlpCSmN4blZj?=
 =?utf-8?B?cXJ2YWVtNFRKdWFzVldnRGo3ZHNvR1BBUUZTS2JIODA4L2pHNzFoZ0xCOGVj?=
 =?utf-8?Q?sLPROy6vUGDxcGJCilhkZBppE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f519b94a-9678-49af-feef-08dcaa294b75
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 08:35:51.8040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwP8F8d9hSm6B1C+3zE50e2LlxcbtMgNZy5EUvMYMexenYEJMWeYStktdoBQyNh4gydWkT9ysV0PoQYdK2a41A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4524
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


On 7/22/2024 9:50 AM, Matthew Brost wrote:
> On Fri, Jul 19, 2024 at 11:55:06AM +0200, Nirmoy Das wrote:
>
> Not a complete review, just a few comments.
>
>> On LNL because of flat CCS, driver creates a migrate job to clear
>> CCS meta data. Extend that to also clear system pages using GPU.
>> Inform TTM to allocate pages without __GFP_ZERO to avoid double page
>> clearing by clearing out TTM_TT_FLAG_ZERO_ALLOC flag and set
>> TTM_TT_FLAG_CLEARED_ON_FREE while freeing to skip ttm pool's
>> clearn-on-free as XE now takes care of clearing pages. If a bo
>> is in system placement and there is a cpu map then for such BO gpu
>> clear will be avoided as there is no dma mapping for such BO at
>> that moment.
>>
>> To test the patch, created a small test that tries to submit a job
>> after binding various sizes of buffer which shows good gains for larger
>> buffer. For lower buffer sizes, the result is not very reliable as the
>> results vary a lot for both CPU and GPU page clearing.
>>
> I could see at smaller BO sizes the CPU being faster and results varying
> a bit,


CPU clearing should be faster for non-CCS based platform where we have 
to create a migration job  and that would

cause large latency for small BO size but for LNL, I think even for 
small BO size, GPU clear won't be an issue because we already clear

CCS with a migration job.

>   certainly once BOs are larger I'd expect to see reliable perf
> improvements. See my comment below on with / without as that info might
> be helpful.
>
>> With the patch

Sorry, this should read as  "without the patch", I messed up here.


>> sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run
>> basic-store-benchmark
>> IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
>> Using IGT_SRANDOM=1719237905 for randomisation
>> Opened device: /dev/dri/card0
>> Starting subtest: basic-store-benchmark
>> Starting dynamic subtest: WC
>> Dynamic subtest WC: SUCCESS (0.000s)
>> Time taken for size SZ_4K: 9493 us
>> Time taken for size SZ_2M: 5503 us
>> Time taken for size SZ_64M: 13016 us
>> Time taken for size SZ_128M: 29464 us
>> Time taken for size SZ_256M: 38408 us
>> Time taken for size SZ_1G: 148758 us
>> Starting dynamic subtest: WB
>> Dynamic subtest WB: SUCCESS (0.000s)
>> Time taken for size SZ_4K: 3889 us
>> Time taken for size SZ_2M: 6091 us
>> Time taken for size SZ_64M: 20920 us
>> Time taken for size SZ_128M: 32394 us
>> Time taken for size SZ_256M: 61710 us
>> Time taken for size SZ_1G: 215437 us
>> Subtest basic-store-benchmark: SUCCESS (0.589s)
>>
>> With the patch:
> Both results 'with the patch'? What does it look like without?

So above is without the series and below is with the series.


>
>> sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run
>> basic-store-benchmark
>> IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
>> Using IGT_SRANDOM=1719238062 for randomisation
>> Opened device: /dev/dri/card0
>> Starting subtest: basic-store-benchmark
>> Starting dynamic subtest: WC
>> Dynamic subtest WC: SUCCESS (0.000s)
>> Time taken for size SZ_4K: 11803 us
>> Time taken for size SZ_2M: 4237 us
>> Time taken for size SZ_64M: 8649 us
>> Time taken for size SZ_128M: 14682 us
>> Time taken for size SZ_256M: 22156 us
>> Time taken for size SZ_1G: 74457 us
>> Starting dynamic subtest: WB
>> Dynamic subtest WB: SUCCESS (0.000s)
>> Time taken for size SZ_4K: 5129 us
>> Time taken for size SZ_2M: 12563 us
>> Time taken for size SZ_64M: 14860 us
>> Time taken for size SZ_128M: 26064 us
>> Time taken for size SZ_256M: 47167 us
>> Time taken for size SZ_1G: 170304 us
>> Subtest basic-store-benchmark: SUCCESS (0.417s)
>>
>> With the patch and init_on_alloc=0
> Can you explain what init_on_alloc means in this context? A GPU clear is
> skipped?

If CONFIG_INIT_ON_ALLOC_DEFAULT_ON/init_on_alloc=1 then there will be 
CPU clear even if driver

doesn't pass __GFP_ZERO. Which why when init_on_alloc is 0 then for WB, 
the reduction is much higher

170304 us to 84746 us. init_on_alloc doesn't have much effect on WC as 
there is a pool to cache zeroed page.


I should probably disable gpu clear when init_on_alloc is set as then 
there will be double clear, one from CPU and another from GPU.


>
>> sudo  ~/igt-gpu-tools/build/tests/xe_exec_store --run
>> basic-store-benchmark
>> IGT-Version: 1.28-g2ed908c0b (x86_64) (Linux: 6.10.0-rc2-xe+ x86_64)
>> Using IGT_SRANDOM=1719238219 for randomisation
>> Opened device: /dev/dri/card0
>> Starting subtest: basic-store-benchmark
>> Starting dynamic subtest: WC
>> Dynamic subtest WC: SUCCESS (0.000s)
>> Time taken for size SZ_4K: 4803 us
>> Time taken for size SZ_2M: 9212 us
>> Time taken for size SZ_64M: 9643 us
>> Time taken for size SZ_128M: 13479 us
>> Time taken for size SZ_256M: 22429 us
>> Time taken for size SZ_1G: 83110 us
>> Starting dynamic subtest: WB
>> Dynamic subtest WB: SUCCESS (0.000s)
>> Time taken for size SZ_4K: 4003 us
>> Time taken for size SZ_2M: 4443 us
>> Time taken for size SZ_64M: 12960 us
>> Time taken for size SZ_128M: 13741 us
>> Time taken for size SZ_256M: 26841 us
>> Time taken for size SZ_1G: 84746 us
>> Subtest basic-store-benchmark: SUCCESS (0.290s)
>>
>> v2: Handle regression on dgfx(Himal)
>>      Update commit message as no ttm API changes needed.
>> v3: Fix Kunit test.
>> v4: handle data leak on cpu mmap(Thomas)
>> v5: s/gpu_page_clear/gpu_page_clear_sys and move setting
>>      it to xe_ttm_sys_mgr_init() and other nits (Matt Auld)
>>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c           | 26 ++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>>   drivers/gpu/drm/xe/xe_ttm_sys_mgr.c  |  8 ++++++++
>>   3 files changed, 34 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 0b7202dd4c9e..668c4c0f5ff0 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -396,6 +396,14 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>>   		caching = ttm_uncached;
>>   	}
>>   
>> +	/*
>> +	 * If the device can support gpu clear system pages then set proper ttm
>> +	 * flag. Zeroed pages are only required for ttm_bo_type_device so
>> +	 * unwanted data is not leaked to userspace.
>> +	 */
>> +	if (ttm_bo->type == ttm_bo_type_device && xe->mem.gpu_page_clear_sys)
>> +		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
>> +
>>   	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
>>   	if (err) {
>>   		kfree(tt);
>> @@ -417,6 +425,10 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
>>   	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
>>   		return 0;
>>   
>> +	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear system pages */
>> +	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
>> +		tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
>> +
>>   	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
>>   	if (err)
>>   		return err;
>> @@ -659,8 +671,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   	bool needs_clear;
>>   	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
>>   				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
>> +	bool clear_system_pages;
>>   	int ret = 0;
>>   
>> +	/*
>> +	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path when
>> +	 * moving to system as the bo doesn't have dma_mapping.
>> +	 */
>> +	if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
>> +		ttm->page_flags &= ~TTM_TT_FLAG_CLEARED_ON_FREE;
>> +
>>   	/* Bo creation path, moving to system or TT. */
>>   	if ((!old_mem && ttm) && !handle_system_ccs) {
>>   		if (new_mem->mem_type == XE_PL_TT)
>> @@ -683,8 +703,10 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
>>   						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
>>   
>> +	clear_system_pages = ttm && (ttm->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE);
>>   	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
>> -		(!ttm && ttm_bo->type == ttm_bo_type_device);
>> +		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
>> +		clear_system_pages;
>>   
>>   	if (new_mem->mem_type == XE_PL_TT) {
>>   		ret = xe_tt_map_sg(ttm);
>> @@ -796,7 +818,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   		if (move_lacks_source) {
>>   			u32 flags = 0;
>>   
>> -			if (mem_type_is_vram(new_mem->mem_type))
>> +			if (mem_type_is_vram(new_mem->mem_type) || clear_system_pages)
>>   				flags |= XE_MIGRATE_CLEAR_FLAG_FULL;
>>   			else if (handle_system_ccs)
>>   				flags |= XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 36252d5b1663..203ad50c894e 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -332,6 +332,8 @@ struct xe_device {
>>   		struct xe_mem_region vram;
>>   		/** @mem.sys_mgr: system TTM manager */
>>   		struct ttm_resource_manager sys_mgr;
>> +		/** @mem.gpu_page_clear_sys: clear system pages offloaded to GPU */
>> +		bool gpu_page_clear_sys;
>>   	} mem;
>>   
>>   	/** @sriov: device level virtualization data */
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> index 9844a8edbfe1..fde0512a838a 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> @@ -117,5 +117,13 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
>>   	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
>>   	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, man);
>>   	ttm_resource_manager_set_used(man, true);
>> +
>> +	/*
>> +	 * On iGFX device with flat CCS, we clear CCS metadata, let's extend that
>> +	 * and use GPU to clear pages as well.
>> +	 */
>> +	if (xe_device_has_flat_ccs(xe) && !IS_DGFX(xe))
>> +		xe->mem.gpu_page_clear_sys = true;
> Seems like a xe->info might be better place with this being a platform
> thing setup in xe_pci.c.


Now this indeed looks like a platform related but I think we might want 
to extend this for other platform without flatccs but for larger page size.

So I want to keep it as non-platform feature.


Regards,

Nirmoy

>
> Matt
>
>> +
>>   	return drmm_add_action_or_reset(&xe->drm, ttm_sys_mgr_fini, xe);
>>   }
>> -- 
>> 2.42.0
>>
