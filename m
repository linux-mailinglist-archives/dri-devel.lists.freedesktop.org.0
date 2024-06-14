Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D8F90931A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 21:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CEA10E295;
	Fri, 14 Jun 2024 19:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FvDTPoIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FC510E295
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 19:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718394965; x=1749930965;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HnqbpP9Xx1lzkTCCMepR0Z1x/hz23GzE9QFxml3k8ok=;
 b=FvDTPoIn9BXEtu9tK2+AnU74mREi3/dkzwrJxc9EOxaQFMRVAjYQMAnF
 Qtxsz9kltrBgwu95jJFYF4TUlH7ogI41jHuWZP39Soam+fH57LOP6xXlI
 ghlSw3ATz7weeY+oNY1+JUF6xmALxeYCYU9bY4qOF7qaoFMIGt7b3hWn4
 nIBkGVPG9A6SxoDKlyGGPc5rPcqW3nptgeM2w5FV8xnBfW+tywb+UGW38
 BHVeB4mcgeT7U8sCM9Z8Tv952EfWT0XoKxKf0xPKkZG0guczY29VvXxUs
 yhFScw6HRRNipVDJpu5JnYzK6BW7VwA3DL/3hsiw98p84bOSKRuX8iEQ2 w==;
X-CSE-ConnectionGUID: oj5KxmRhQBSPzulDCmCdYA==
X-CSE-MsgGUID: zIRocY/rTamU6PSXmD9EFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="26412329"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="26412329"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 12:56:05 -0700
X-CSE-ConnectionGUID: ls+1SU6dS4iPN+ngTq8l3g==
X-CSE-MsgGUID: MTVP/M/ZTAS2hiNO8Ue8Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40559215"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 12:56:03 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 12:56:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 12:56:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 12:56:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/vSw+xI5TgBUYbhcuCH3A1NwizgQ6EpSv9NS/V5rpylyHu97S4Vy5GiRglriZZ444LE1OfLUwEhm6xSZNSrB3iwTRAO+OezqM7YxpvWhV97nGN+rZh+V8VxhA4EAcW9292fjSeqD/w2oxMPzj6iCbJQoZgltmURrHsW8qfQFK05dWwra5MoD+2kRv326c6W+HatUE4gEZ/SUn3jymrDayMbmfZd1KRlpFFsHDeWMrYXjNWcyRROSuaiwWKwzddghVAFGKFP5KJ9cXlVT7bMpwsJNAULGvGF7dJ4dm7wNyO/8JRqsntBTtpE77+gGaOr3JsxR2rasWxmO31H7m8+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8xIcfTsT0QMQfH+qO0SSUo5aAf5cnN3xLLq3pDpeGA=;
 b=oVxe+Vl+N4Kf8ZT43puJvcMuJaUkFlUbEiMs5Pt1HMi3o7HNDuH3ciBIf1dn948t5rpm0uqvdF67lJzRvjCCmaJFnQBel2jBsmlaMWjyNcXOTE4CRK7PyjX7I35qRdLXlhrJQKFVQ8xOtsrvVuNfHrlfEXSCl5LdWENPutbEycPW/MDDXHcQa4B5lWTrYmJCsaFZxNPbzPjDhyzoxXopuHcwndQOU41VoE2BYGVlosR6dQVZ+M2E3kh+/D2fxdN/Wk3xfCiihTYZiHMDc46lA9Qz3UxNB7+B1FqyJsGmHQ1U1HutrpdlqwzyaQuzGO/rk8TyotdTZcEW7DT04DlIRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA1PR11MB6516.namprd11.prod.outlook.com (2603:10b6:208:3a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 14 Jun
 2024 19:56:00 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 19:56:00 +0000
Message-ID: <da0c9aa7-c988-45be-a29c-8bd35f912b02@intel.com>
Date: Fri, 14 Jun 2024 12:55:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/print: Introduce drm_line_printer
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Jani Nikula
 <jani.nikula@intel.com>, <dri-devel@lists.freedesktop.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240528130622.1152-1-michal.wajdeczko@intel.com>
 <1bf31a4b-fede-4044-8390-abb2b833608d@intel.com> <877cfbivrv.fsf@intel.com>
 <496d5b58-51c8-4176-a60a-d238f6407dd2@intel.com>
 <03d83dda-9609-477e-8b63-f33e7b46f649@intel.com>
 <db83249d-a442-4744-8f15-f6a85c3bc10b@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <db83249d-a442-4744-8f15-f6a85c3bc10b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0044.namprd17.prod.outlook.com
 (2603:10b6:a03:167::21) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA1PR11MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bf71a43-1cf7-4a7e-898a-08dc8cac035a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWVubGpNUWJyMWxRMkxGK0JFQ0RLY2UzRkRUOE9xNE9sOXVSNjdZVEMxTmdD?=
 =?utf-8?B?N2ZiUXVJa1EzWVI0UDd0VVhIMFNMbnVucW13MFpFbkhha2xFODFrVDVpUW9o?=
 =?utf-8?B?eTV6ZVdjcEZ0Mk52ZUNEN3FGUVlXanh6WjZrK3JnaWM0SHVnd1JLSlU0ZWZv?=
 =?utf-8?B?R2RXQ2FWSkxuSTBHRjJLVFh3L3h4enF0Y2xNcDk1clVZWHFJeVg4ZjFUUi85?=
 =?utf-8?B?ZloxaW5KcjVwOFM1OGRINFZESzVRSVNUMGpGVDNHdzE1NlgzWjRBNHBXMS9x?=
 =?utf-8?B?UFYxUk9ZWW9GN1dHTVRUM2VRdlJQYlpSNzVVbEpGV3JYWGV1VExzN05GdmRR?=
 =?utf-8?B?Y0RuUlpBdWFlUm5lTHRjNDN4VE9zU04vRmlIWGY0NG5GTmRBRUZrd3d2eXNS?=
 =?utf-8?B?RG9CM0Z2QUVOTW13Tng2Q3ExUVRTbFhmTEliQytOM0o2bG81UC95N0JibXFa?=
 =?utf-8?B?RXFkSW0wRTdiUlBaSEw3QXNkbEZoYkgyc3I3bWNsRHdLSkVIcjQ4dkt6MjVE?=
 =?utf-8?B?SnBROGF2NWZHUzdjMkZwcmhxcnI3RXIyQ3lOVHZSUE5nOUtaSEJ6UmxzcUJj?=
 =?utf-8?B?TnRSUnhZSHZvVzVGblgvR2xjTktzQi90b2FOcU1wT0FjMWdyR0VUL1NBM1l6?=
 =?utf-8?B?aVpPM0ZBSFFxakpad0l1a0ZLbDlaK3NTam93R1VqZDRnTkVqWFJ0QWJyRjV5?=
 =?utf-8?B?ZmJ0V3ExMi8rQXNQb0VJOFdmN0ZoOVpZSmcxcHIwVU5NNVQ3K0JYb0QyclU2?=
 =?utf-8?B?OVFKSk45Q1ZnMDRFQjV1SHl6NnRLNVRIMnM0NVVjL096emtpeFhpZklzK25k?=
 =?utf-8?B?bGs1QmJFMk85R0RpcnNzeVNFQnJHbGIzWUVidGVwSmlQUFc1UW1LYm5sK2t3?=
 =?utf-8?B?YVFpazM2U2trZzlkd2d1b3h4RXlmcHRGNHQvR1Rkd3RiNFBuS3hVVzMvYWl5?=
 =?utf-8?B?SG1EUS96bFdLczIrajVvTnp0M3V4RXg0NTJjWG53Z3hIalVDa2hlaFp6Zzln?=
 =?utf-8?B?NU4vWVcwbDgzbG83emI0MjRib28zcDMrVXBzS1pTSEl1ZUlBSG51Ris3T0Y5?=
 =?utf-8?B?b2dpbjBBR3RhcXZjUngzbFM3Z3pKWXNHSzdGVndKcjFWQWZJRHo5aGZxdy92?=
 =?utf-8?B?d0FaMlpTZ2FnS1ZWbFZHWkZxR2JWY2YvaXZ6cXhQT2pzbDRtcEl6MTZEL3RD?=
 =?utf-8?B?ZkN0VnJYWHZrSW50cit3b3ByUTdCRUkzZUxKaHA5WnphaWtIN3kvbk9qYStT?=
 =?utf-8?B?VGpvNktxeFdmVmQyZ0E1d1Y0L0NMc3VxZDBlSElaSWgyWFQ0RE5ITFJKbEo1?=
 =?utf-8?B?YUdTbVp1S1JpTVI3dTJ4U2grYVduUzRzbk1XOFVVZHZieTB2VjhtNmpuVTVw?=
 =?utf-8?B?bVIzZ2dpdHcwTkFwTzVRTEhrL0htZGJMaWpGSDhkSURDWkp5OWIxckZKWFBQ?=
 =?utf-8?B?Tk1Ea0RtYW9hZklWTzZBcTNneEN1cVZmT3d1bU1ZOE8xd0NIR0ZGdGpnWkpO?=
 =?utf-8?B?ZlpVcWlXZ3p0azBvWU9iSFRHUEVYUCt0MkhkcGZCbEZZa2pGRlcyWk9JRDNL?=
 =?utf-8?B?N0lxWWRYNjBsODVGSk5mNFB5YmY5NHh3ZzdtaFBodklmREM2NGFOUjNhWmZN?=
 =?utf-8?B?VUMvb2JFcENtTEJzRmh0TWJqRUF5cGxnRXRCSlBCMiszUGVWWGJTSEgyT3ND?=
 =?utf-8?B?WXIrU1NsWXFnQUVnQlBwbVY4QSt4NTJzZDgwb2JIcWZnN1lFMy9veFNBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGZzNnRsRGV6SS92eU1rWE5UL2FTdzBkTERkUS8reUZTQmVjRnh4YWhoZzVD?=
 =?utf-8?B?S1orZWFyQmxoTmhhc3ZxU0RIMDZXdkI2VXBLL2h1U1pDaUJiRkZNVG4waWUz?=
 =?utf-8?B?bjVtVHFLWlM2OUpNc2N2RkdqQ1IwN3hnaWJwWmlvVFdBeks5Rlo1d0xrSjR0?=
 =?utf-8?B?QUkyRnU3Q2N3UkhIb0tQdU4yZlhGRVBxc0NLTnFwQnFUMzBiUUEzYThvR084?=
 =?utf-8?B?ZTVuSjkybXpvK0hDcUtLZHY5YTBuWEhpRC9vd1RGZ0cwNWdSVW1JSUtWWEY5?=
 =?utf-8?B?Vjd4Q3hseGJjOXlIb05ETEJFUEVmQy9jeFAzR1pPOFZBMWxQTzBWVWxNQTN5?=
 =?utf-8?B?ZlI1NUFhWFJ5QUJkNkNUMUs5QmRYMnlaV1REMVdCWDA2QVR0VzJGR2g5QlZZ?=
 =?utf-8?B?aHp4NVYzdFhGR2xaWDBxWXovcWZmbXJBSVNIUUNTd2U1ZXRQYlk3eFhDd2Rt?=
 =?utf-8?B?VTZSRUVxb1hsRDdmcWY2VWFwZHZRVnphTG1Hek1yMStJY3RXekhOZmVvdDFR?=
 =?utf-8?B?dy9RazFlNFBXSlYxbWFqUHpoRWkzNE42NXNIdVhuOHhtTjJrVVRUOE9ibkJi?=
 =?utf-8?B?aUVhTk95Y0g5UWRSd2FCVG1DOER0UWUrTTRpT2JQcSt6RWRsTXpFN29NQ0Na?=
 =?utf-8?B?VEJ3MEFydmhiRGNRTEhVWnNodlFNRFdNZUxWVWRwUU1BU0YzcjZsaFNUTGRz?=
 =?utf-8?B?cnlTb1krTnRETzRRcXZSdFR5ZW90SzVVa280S0VEL2JydjBuVVVac1duYkZJ?=
 =?utf-8?B?clVLbWdSUHV4UnZEcGpDcDhmRWcxblhzZk5aWlZWOHNaa1Z2elNTenRsMndS?=
 =?utf-8?B?ZUtVSy9YYklBdCszR0wrcS95bk44c2Y3MkI4YWYxa1l1WWtRT1NPNUpsTHJJ?=
 =?utf-8?B?N2svV0o3NVR2SUxUcFdkamg4VDRWMGZodWx2K3BYSWZrWVdnR0xXQnhCcUk2?=
 =?utf-8?B?OGREdFc5TTZyMVhOWEtId1hvUGs1bVRIUXdoK1RpdG1BL3pibHV0Y0QrWnpa?=
 =?utf-8?B?R1NtL3NPanhyVDJQaGZ3eFp4MUNsYVEyV1cvSURFVCtPeVNRRnpGR3VMRnNr?=
 =?utf-8?B?cGZ2eVJhZXJONnBNMCsxVFNTaFVNVUd0N3d2U1BFRGVsR2xSNVdkSHp6VU5Q?=
 =?utf-8?B?UnpsTkE4anYzK01pNHZBNURBekpReC9Idy9uNSt2QmRVR3RsbmJaY3FibFhj?=
 =?utf-8?B?MFFWeExMODNDdFdLdkk0QnJJK09UTVRPWlNIclFJUGRxLzIxVjBOMUgyNjVz?=
 =?utf-8?B?Qk9wUEU1ZFhDaVVXWHVTTXZZa1l3bCtUUVdwVWhqYkFuU0Zzc3ZLbkZNZUFT?=
 =?utf-8?B?eUdOaFFUVi9zU1FyNElEWm1Dc3pRM202aVBoeTA1cmtSQng4MmMxV3BxMHVF?=
 =?utf-8?B?TXBFTExTbjRHcTVKWHFpaDhvWW5maHlqZks3M0lsNVI5blBxUXNpb3NNYW93?=
 =?utf-8?B?NXlmZlM4aFl6ZGp5YmlGSWFVTmFDMENzT2k0OCtsS1N6TFVReG9lZWQvQkh6?=
 =?utf-8?B?SlkrVHVJRUwzc2hnc0hSek9XY3FpL2Q3WnhXQ3VJSjFjN2NZdnVhSWpRdHlN?=
 =?utf-8?B?T0JOU3ZhWDhQY3ViOFpXbks0NzhFVWtBYjk4THpoN0pLWFNLREd6dm85TnRj?=
 =?utf-8?B?N1JLU05QUFJPcFBqOUJSeEUxa05EYS9hNTVoSXNwYU5aTnlzcjJ1c2pTWHAv?=
 =?utf-8?B?OEFYd3l1NklmT3c2elJHQVV3cFg2Q1NHQ3hXeXNveG5mclNwb01oNlgxc05C?=
 =?utf-8?B?d1RCcVR1Zjc5Nm5pRVEraGNYRlJDZ0lKbEVaTDVQVUZhaE50MVNBeXdxMmFz?=
 =?utf-8?B?YVhObkhRREFESXQ2NmxOenh5d0Vka0dKMklPM0x0Q0ZsTEJIZFZXOFpRTS9L?=
 =?utf-8?B?K1pEUnh5Sm1OYjhnakh2dTlpa2VRaHhXVjk0bTc3Zk0rdDVoRkdmcjhYVlhx?=
 =?utf-8?B?UGN1ZHVua05DbjhldlY2aTZ1NmJEUTdMVGdWNEtDSmF4SFc1THVVVkZqaGdi?=
 =?utf-8?B?M3NXRkpWcFkyK3QwSktDLzJ1RWIyazRuTEo1TkltOWlQL2QxRW5JZEVidVJu?=
 =?utf-8?B?R3E1aDJ3c0txc0dNZ3l3MlVFZFZ5RU9DcVNkMXVjdVNjWSttSUZOK1ZRYXJU?=
 =?utf-8?B?Tk9wSWJsS0I4eHNWWXA4ZjZHdFFyWkZEbnZSckQrN3JTeEpNZjZjL2lnUkZQ?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf71a43-1cf7-4a7e-898a-08dc8cac035a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 19:55:59.9886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kum+ngjwMn8woVYqewL6AmLwTTfS6yCk5PRZ0UCiZSEy5Uh5YTjv690YNUrOc6ve0Daede5aeFwMx0I8wU+knGEHkXJbk0VGr9OxrAEZ+hs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6516
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

On 5/30/2024 14:09, Michal Wajdeczko wrote:
> On 30.05.2024 20:47, John Harrison wrote:
>> On 5/30/2024 02:33, Michal Wajdeczko wrote:
>>> On 30.05.2024 09:49, Jani Nikula wrote:
>>>> On Wed, 29 May 2024, John Harrison <john.c.harrison@intel.com> wrote:
>>>>> On 5/28/2024 06:06, Michal Wajdeczko wrote:
>>>>>> This drm printer wrapper can be used to increase the robustness of
>>>>>> the captured output generated by any other drm_printer to make sure
>>>>>> we didn't lost any intermediate lines of the output by adding line
>>>>>> numbers to each output line. Helpful for capturing some crash data.
>>>>>>
>>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>> Cc: Jani Nikula <jani.nikula@intel.com>
>>>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>>> ---
>>>>>> v2: don't abuse prefix, use union instead (Jani)
>>>>>>        don't use 'dp' as name, prefer 'p' (Jani)
>>>>>>        add support for unique series identifier (John)
>>>>>> ---
>>>>>>     drivers/gpu/drm/drm_print.c | 14 ++++++++
>>>>>>     include/drm/drm_print.h     | 68
>>>>>> ++++++++++++++++++++++++++++++++++++-
>>>>>>     2 files changed, 81 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
>>>>>> index cf2efb44722c..be9cbebff5b3 100644
>>>>>> --- a/drivers/gpu/drm/drm_print.c
>>>>>> +++ b/drivers/gpu/drm/drm_print.c
>>>>>> @@ -214,6 +214,20 @@ void __drm_printfn_err(struct drm_printer *p,
>>>>>> struct va_format *vaf)
>>>>>>     }
>>>>>>     EXPORT_SYMBOL(__drm_printfn_err);
>>>>>>     +void __drm_printfn_line(struct drm_printer *p, struct va_format
>>>>>> *vaf)
>>>>>> +{
>>>>>> +    unsigned int counter = ++p->line.counter;
>>>>> Wrong units, but see below anyway...
>>> it really doesn't matter as it is temporary var used in printf()
>>> actual 'short' counter will wrap on its own unit boundary
>> It should still match. Otherwise the code is ambiguous. Was it meant to
>> be an int? Was it meant to be a short? Just because code compiles
>> doesn't mean it is good.
> it is meant to be "unsigned int" as it is more than "short" counter that
> is initialized from and it will printed in printf() as %u
>
> I really don't get what is wrong here
The fact that you have '<type A> = <type B>;'. That generally implies a 
programming error because types are supposed to match unless there is a 
good reason and an explicit cast to show that the programmer meant the 
change.

>
>>>>>> +    const char *prefix = p->prefix ?: "";
>>>>>> +    const char *pad = p->prefix ? " " : "";
>>>>>> +
>>>>>> +    if (p->line.series)
>>>>>> +        drm_printf(p->arg, "%s%s%u.%u: %pV",
>>>>>> +               prefix, pad, p->line.series, counter, vaf);
>>>>>> +    else
>>>>>> +        drm_printf(p->arg, "%s%s%u: %pV", prefix, pad, counter, vaf);
>>>>>> +}
>>>>>> +EXPORT_SYMBOL(__drm_printfn_line);
>>>>>> +
>>>>>>     /**
>>>>>>      * drm_puts - print a const string to a &drm_printer stream
>>>>>>      * @p: the &drm printer
>>>>>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>>>>>> index 089950ad8681..f4d9b98d7909 100644
>>>>>> --- a/include/drm/drm_print.h
>>>>>> +++ b/include/drm/drm_print.h
>>>>>> @@ -176,7 +176,13 @@ struct drm_printer {
>>>>>>         void (*puts)(struct drm_printer *p, const char *str);
>>>>>>         void *arg;
>>>>>>         const char *prefix;
>>>>>> -    enum drm_debug_category category;
>>>>>> +    union {
>>>>>> +        enum drm_debug_category category;
>>>>>> +        struct {
>>>>>> +            unsigned short series;
>>>>>> +            unsigned short counter;
>>>>> Any particular reason for using 'short' rather than 'int'? Short is
>>>>> only
>>> didn't want to increase the size of the struct drm_printer and with
>>> little luck sizeof two shorts will be less/equal sizeof enum
>> Depending on the compiler, the architecture and what values have been
>> defined within it, an enum is possibly (likely?) to be a char.
> except that is usually a int [1]
>
> but series/counter could be defined as long long int if you really want
> and don't care about struct size
Personally, I don't care about the structure size. I care about the 
output not being ambiguous. I don't know if there is any particular 
reason why this structure's size is important. You would need to ask 
someone who knows more about DRM in general to answer that. You seem to 
think it is critically important though, given that you are adding 
unions and shorts and sacrificing data safety and ultimate usability for 
the sake of a few bytes. Where is your reasoning for that coming from?

>
> [1] https://en.cppreference.com/w/c/language/enum
"If it is not explicitly specified, the underlying type is the 
enumeration’s compatible type, which is either a signed or unsigned 
integer type, or char."

>
>>
>>>>> 16bits right? That might seem huge but a GuC log buffer with 16MB debug
>>>>> log (and minimum sizes for the other sections) when dumped via the
>>>>> original debugfs hexdump mechanism is 1,245,444 lines. That line count
>>> if your capture relies on collecting all 1,245,444 lines then likely you
>>> have other problem that needs solving than line counter overflow
>> Have you ever used a full 16MB GuC log? And read it out via debugfs?
> quite frequently over last 6+ years
>
>> Then that was 1.2 million lines of text that you read out. Did you have
>> other problems that meant reading that file was a waste of your time? Or
>> did it allow you to debug the issue you were working on?
> I read your reply about 1,245,444 lines in context of limitations of
> drm_line_printer planned to be used for dmesg output not about the
> debugfs output
It is the same output. It doesn't matter whether you are reading from 
debugfs or dumping to dmesg. It is the same GuC log and is the same 1.2m 
lines of output. As per the other patch series, I am trying to reduce 
that by using wider lines and such but that only gets you so far. This 
is still fundamentally about spamming huge amounts of output to dmesg 
and needing to get that out with 100% reliability or it is 100% useless.

>
>> The purpose of this patch is to 'improve' the fully working version that
>> was already posted. Causing unwanted wraps in the line count is not an
>> improvement. It is very definitely a bug. And now your argument is that
>> we shouldn't be doing this in the first place? That's a given! Dumping
>> huge streams of data to dmesg is a total hack. We absolutely should not
>> be doing it. But we have no choice because there is no other way
>> (without adding even bigger and more complicated mechanisms involving
>> external debug modules or something).
> my point was that blindly printing 1,245,444 lines of hex data to dmesg
> is rather sub-optimal way to get 'crash data' (as if it wouldn't be a
> crash then likely collecting log over debugfs/devcoredump should work)
>
> one of the idea that could minimize size of collected log data could be
> to actually try to decode it partially and copy only last N entries
> (yes, I know it requires extra development, but maybe in return we will
> be less spamming the dmesg)
Or just use a smaller GuC log buffer in the first place as a trivial way 
to achieve the same result? Sure, that's great until you realise that 
you need N+100 entries to see what went wrong.

The one and only purpose of this is to allow the debugging of very hard 
to reproduce problems. And they are not always a 'crash'. It is by far 
the easiest way to get logs out from a failing self test. Sometimes this 
is the only way to get meaningful logs out of our CI system :(. There 
are numerous reasons why it is useful and there is no reason at all to 
limit it just because it is unwieldy. I know it is unwieldy. It is truly 
horrid that we have to do this. It is an evil hack. But sometimes it is 
the only thing that works. And anything that makes it less useful is 
defeating the whole point of it.

>
>>>>> goes down a lot when you start using longer lines for the dump, but it
>>>>> is still in the tens of thousands of lines.  So limiting to 16 bits is
>>>>> an overflow just waiting to happen.
>>> but even in case of an overflow it should be relatively easy to teach
>>> any parser to deal with line .0 as indicator to restart any tracker
>> Wasn't your earlier argument that trivially parsing out the line count
>> prefix from a debugfs file was far too much effort and cannot possibly
>> be done by a developer. Now you are saying that coping with a broken
>> count is "easy to teach a parser". The one single purpose of this entire
>> change is to guarantee a valid dump can be extracted from a log.
>> Anything that potentially prevents that from working is a fundamental
>> failure.
>>
>>> and it is highly unlikely that any captured logs will miss exactly
>>> 65,536 contiguous lines, but even then it should be noticeable gap
>> Or we could just use an integer count that is not going to wrap and be
>> ambiguous.
> maybe all we need is to define series/counter as:
>
> 	unsigned int series : 8;
> 	unsigned int counter : 24;
>
> which will give you 16,777,215 lines and 255 series without noticeable
> increasing sizeof struct drm_printer
Sure. Although if you are so desperate not to increase the size of the 
DRM structure and and make bad things happen to the rest of the DRM 
drivers, then why bother putting this into the DRM layer at all? Given 
that it is only ever going to be used by one function in the Xe driver 
and can be trivially coded locally in the Xe driver with no adverse 
affects to any other DRM based driver...


>
>>
>>>>>> +        } line;
>>>>>> +    };
>>>>>>     };
>>>>>>        void __drm_printfn_coredump(struct drm_printer *p, struct
>>>>>> va_format *vaf);
>>>>>> @@ -186,6 +192,7 @@ void __drm_puts_seq_file(struct drm_printer *p,
>>>>>> const char *str);
>>>>>>     void __drm_printfn_info(struct drm_printer *p, struct va_format
>>>>>> *vaf);
>>>>>>     void __drm_printfn_dbg(struct drm_printer *p, struct va_format
>>>>>> *vaf);
>>>>>>     void __drm_printfn_err(struct drm_printer *p, struct va_format
>>>>>> *vaf);
>>>>>> +void __drm_printfn_line(struct drm_printer *p, struct va_format
>>>>>> *vaf);
>>>>>>        __printf(2, 3)
>>>>>>     void drm_printf(struct drm_printer *p, const char *f, ...);
>>>>>> @@ -357,6 +364,65 @@ static inline struct drm_printer
>>>>>> drm_err_printer(struct drm_device *drm,
>>>>>>         return p;
>>>>>>     }
>>>>>>     +/**
>>>>>> + * drm_line_printer - construct a &drm_printer that prefixes
>>>>>> outputs with line numbers
>>>>>> + * @p: the &struct drm_printer which actually generates the output
>>>>>> + * @prefix: optional output prefix, or NULL for no prefix
>>>>>> + * @series: optional unique series identifier, or 0 to omit
>>>>>> identifier in the output
>>>>>> + *
>>>>>> + * This printer can be used to increase the robustness of the
>>>>>> captured output
>>>>>> + * to make sure we didn't lost any intermediate lines of the
>>>>>> output. Helpful
>>>>>> + * while capturing some crash data.
>>>>>> + *
>>>>>> + * Example 1::
>>>>>> + *
>>>>>> + *    void crash_dump(struct drm_device *drm)
>>>>>> + *    {
>>>>>> + *        static unsigned short id;
>>>>>> + *        struct drm_printer p = drm_err_printer(drm, "crash");
>>>>>> + *        struct drm_printer lp = drm_line_printer(&p, "dump", ++id);
>>>>> Is there any benefit or other reason to split the prefix across two
>>>>> separate printers? It seems like a source of confusion. As in, the code
>>> it's not any kind of the required 'split', as both printers used here
>>> can treat prefix as optional if NULL, but rather a way to show how to
>>> pass two potentially separated prefixes, as one of them could be already
>>> prepared (like engine name or any other alias) or if the primary printer
>>> does not accept any prefix at all (and this a limitation of our existing
>>> custom GT oriented printers [1] [2])
>>>
>>> [1]
>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/xe/xe_gt_printk.h#L66
>>> [2]
>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/xe/xe_gt_printk.h#L81
>> As per earlier comments, my point is not that you should change the
>> patch to remove one of the prefixes from the code. My point is that the
>> documentation is confusing. You are explicitly splitting a single phrase
>> "crash dump" across two separate printer objects with no explanation as
> but who said it is single phrase "crash dump" ?
Because from the single context of the two lines above, why would it not 
be the phrase "crash dump"?

>
>> to why. And as you just pointed out, there are many use cases where
>> there would not be the option to split it. So it would be much, much
>> clearer to pass NULL to your drm_err_printer example and have a single
>> line comment saying that multiple prefixes could be used if allowed by
>> the printer objects and if useful in the situation. Rather than having a
>> bizarrely split string with no explanation as to why it has been split.
> again, it wasn't a split but example how different prefixes will be
> presented in final output and I assumed that average engineer could
> figure out which part comes from which printer, but from your voice it
> looks that using "crash" and "dump" strings as light reference to
> example function name was too tricky, and you need raw example like:
>
> 	struct drm_printer p = drm_err_printer(drm, "AAA");
> 	struct drm_printer lp = drm_line_printer(&p, "BBB", ++id);
>
> 	[ ] 0000:00:00.0: [drm] *ERROR* AAA BBB 1.1: foo
> 	[ ] 0000:00:00.0: [drm] *ERROR* AAA BBB 1.2: bar
It is exceedingly obvious what string is coming from what printer. My 
point is that your example was using strings which a reasonable person 
might construe as a single phrase but gave no explanation why that 
phrase was being split across to separate print helpers. Even in this 
example, it is still confusing as to why a developer would want to split 
"AAA BBB" across the two helpers. If you add a second line printer "CCC" 
then it would be clearer that you are meaning to sub-divide the output 
into A.B and A.C rather than just split the single AB into A.B for no 
apparent reason. But again, that is just an excessively verbose/complex 
way of saying "the top level printer can also add its own prefix if 
desired". Especially given that not all top level printers can even take 
a prefix.


>
>>>>> will allow a double prefix, there is not much you can do about that
>>>>> because losing the prefix from drm_line_printer would mean no prefix at
>>> but why would we loose the prefix from the primary printer ?
>> I don't know what you mean by the primary printer? As above, I was
> by 'primary' printer I mean the one that is passed to the
> drm_line_printer and the drm_line_printer uses for actual output
>
>> simply trying to say that I am not requesting a code change but just a
>> clarification of the documentation.
>>
>>>>> all when not using drm_err_printer underneath. But why explicitly split
>>>>> the message across both printers in the usage example? This is saying
>>>>> that this is the recommended way to use the interface, but with no
>>>>> explanation of why the split is required or how the split should be
>>>>> done.
>>> the drm_line_printer is flexible and can be used in many configurations,
>>> above is just one of the potential uses that shows full output
>>>
>>>> You could have a printer, and then add two separate line counted blocks.
>>>>
>>>>      struct drm_printer p = drm_err_printer(drm, "parent");
>>>>      struct drm_printer lp1 = drm_line_printer(&p, "child 1", 0);
>>>>
>>>>      ...
>>>>
>>>>      struct drm_printer lp2 = drm_line_printer(&p, "child 2", 0);
>>>>
>>>>      ...
>>>>
>>>> p could be defined elsewhere and passed into separate functions which
>>>> each have the line printing. The two prefixes can be useful.
>>> didn't considered that, but as stated above, drm_line_printer is
>>> flexible and can be used in many different ways, like this new one
>> And you really do not need to list them all out as massively verbose
>> examples with confusing differences between them that are not explained.
>> A single example plus a couple of lines of description would be much
>> clearer.
> but sometimes, especially in case of the formatting functions, it might
> be more beneficial to actually show some true outputs, than just
> describe what you might expect
Sure, but one example usage is sufficient for that. You don't need reams 
of example code to demonstrate completely trivial features.

>
>>>>> Also, there is really no specific connection to crashes. The purpose of
>>>>> this is for allowing the dumping of multi-line blocks of data. One use
>>>>> is for debugging crashes. But there are many debug operations that
>>>>> require the same dump and do not involve a crash. And this support is
>>>>> certainly not intended to be used on general end-user GPU hangs. For
>>>>> those, everything should be part of the devcoredump core file that is
>>>>> produced and accessible via sysfs. We absolutely should not be dumping
>>>>> huge data blocks in customer release drivers except in very extreme
>>>>> circumstances.
>>> if you are trying to convince me that we don't need any custom
>>> drm_printer that would take care of tracking and printing line numbers
>>> in kind of more robust way and instead we should be doing such line
>>> prints in a error prone way on it's own as you did in [3], then sorry,
>>> I'm not convinced, unless you just feel that it shouldn't be part of the
>>> drm yet, but then decision is drm maintainer hands (and also in the Xe
>>> maintainers who don't want to fall into i915-ish private solutions trap)
>>>
>>> [3] https://patchwork.freedesktop.org/patch/594021/?series=133349&rev=2
>> No. I am saying that your example use case seems to be implying a much
>> greater usage for this mechanism than should be expected. I'm saying
>> that it should never occur in an end user system because dumping
>> megabytes of data to dmesg is a bad user experience. It absolutely
> IMO, it's not always a dump of megabytes is where drm_line_printer could
> be beneficial, but again, it's idea was to show that you don't have to
> manually modify each printf to have a line prefix and, what's more
> important, don't pollute output if other printer (debugfs) will be used
So add the line count to the top level kernel printk implementation and 
have it present on all kernel output.

And as already discussed, there is still potential advantage to having 
the line count even in the debugfs file.

>
>> should never be a standard part of handling a GPU hang type 'crash'. The
>> primary purpose is for internal debug by developers only. If a use case
>> gets shipped upstream then it should be an extremely hard to hit corner
>> case for which we are desperate to get any useful debug logs by any
>> means necessary.
> but there are many tools that we shouldn't over use in production
> systems but still we do have them defined as common code
But something like BUG() has thousands of instances across the kernel 
and has no impact at all in a non-debug build. Whereas this will have 
exactly one usage instance and does add complexity and memory usage to 
all builds.

>
>> As for error prone, I am not seeing how the original trivial (and
>> working) code is error prone but this complex abstraction of it is less
>> so. Especially given the integer truncation problem. I mean seriously,
>> how 'error prone' can it be to add a "%d, line++" to a print?! And how
> what if in the future someone else add new printf() but misses or
> misspells that %d, line++ in format line ?
Sure, it is technically possible to put a bug in any piece of code. But 
it is hardly 'error prone'.

>
>> much of a 'private solutions trap' is it to add such a trivial prefix to
>> a couple of prints in a single function that is really a big ugly hack
>> for getting logs out in a really dodgy manner anyway?
>>
>> As you say, it is up to the DRM maintainers as to whether they want this
>> support in the generic DRM layers. If it lands and it is functional
>> (i.e. does not break its sole reason for being by truncating counts
>> partway through a dump) then sure, I'll use it. I just don't see that it
>> is even remotely worth the effort given that it is single use only and
>> given how trivial the local version is.
> if collecting GuC log over dmesg is so helpful/important in some
> situations then likely similar solution could be beneficial on i915, no?
It's been in the i915 driver for quite some time already. And the code 
has been modified by precisely zero other developers with precisely zero 
bugs introduced in the formatting/line-counting since that time.

John.

>
>> John.
>>
>>>> A devcoredump implementation could use a drm_printer too?
>>>>
>>>> Is this only about bikeshedding the example? I'm not sure I get the
>>>> point here.
>>>>
>>>>>> + *
>>>>>> + *        drm_printf(&lp, "foo");
>>>>>> + *        drm_printf(&lp, "bar");
>>>>>> + *    }
>>>>>> + *
>>>>>> + * Above code will print into the dmesg something like::
>>>>>> + *
>>>>>> + *    [ ] 0000:00:00.0: [drm] *ERROR* crash dump 1.1: foo
>>>>>> + *    [ ] 0000:00:00.0: [drm] *ERROR* crash dump 1.2: bar
>>>>>> + *
>>>>>> + * Example 2::
>>>>>> + *
>>>>>> + *    void line_dump(struct device *dev)
>>>>>> + *    {
>>>>>> + *        struct drm_printer p = drm_info_printer(dev);
>>>>>> + *        struct drm_printer lp = drm_line_printer(&p, NULL, 0);
>>>>>> + *
>>>>>> + *        drm_printf(&lp, "foo");
>>>>>> + *        drm_printf(&lp, "bar");
>>>>>> + *    }
>>>>>> + *
>>>>>> + * Above code will print::
>>>>>> + *
>>>>>> + *    [ ] 0000:00:00.0: [drm] 1: foo
>>>>>> + *    [ ] 0000:00:00.0: [drm] 2: bar
>>>>> Not really seeing the point of having two examples listed. The first
>>>>> includes all the optional extras, the second is just repeating with no
>>>>> new information.
>>>> You see how the "series" param behaves?
>>> exactly
>>>
>>>> BR,
>>>> Jani.
>>>>
>>>>> John.
>>>>>
>>>>>> + *
>>>>>> + * RETURNS:
>>>>>> + * The &drm_printer object
>>>>>> + */
>>>>>> +static inline struct drm_printer drm_line_printer(struct
>>>>>> drm_printer *p,
>>>>>> +                          const char *prefix,
>>>>>> +                          unsigned short series)
>>>>>> +{
>>>>>> +    struct drm_printer lp = {
>>>>>> +        .printfn = __drm_printfn_line,
>>>>>> +        .arg = p,
>>>>>> +        .prefix = prefix,
>>>>>> +        .line = { .series = series, },
>>>>>> +    };
>>>>>> +    return lp;
>>>>>> +}
>>>>>> +
>>>>>>     /*
>>>>>>      * struct device based logging
>>>>>>      *

