Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7799FB138DA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 12:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551F010E4CE;
	Mon, 28 Jul 2025 10:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NH6jTIdW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533B410E4CD;
 Mon, 28 Jul 2025 10:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753698100; x=1785234100;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YmNeLovovkA3nlwInOd4+oEKK8Tr6GjB7Bj5Mp8b320=;
 b=NH6jTIdWdKiLGdYRKb0dI9rtc2ObhCZA5PzydhJTOyr9f4WeTj47j/me
 Xs2AHa2MA0Hq6jlgH6W/oqiIrBP+R8PCBkIIaMNVswtYhHQrEAXR2nR7H
 bVZq9bcvN3EQsW/PLSohCQPZsALXXEbOaBjR16hvos+Q6Lbvi7MyB1OGI
 LckPri/1LMgJ9WwXPhi3RjqZNlOh8PGFTGKcVFV/LkmSTIQ+XT0I9zLQq
 EJMHbuj9bE1gs+Oo0aOK2guOiBfh+Yt+gt2Ib0jiIvN5EmYERHnHPLbax
 Aoj4vU0gkKhiD59FSQn/RqHZGdCGaYrh/JTcfg1mKK8bIFuM+fO7FNsCD Q==;
X-CSE-ConnectionGUID: WezkOyFWQ2CQmttygiKk+A==
X-CSE-MsgGUID: ne7pyYg4SJaAMkqN3lxlng==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56091569"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56091569"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:21:40 -0700
X-CSE-ConnectionGUID: 453OGbN2S2S7sbxfIJV9+w==
X-CSE-MsgGUID: h2bNoi1dS0aumLGVRkG8Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167789063"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 03:21:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 03:21:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 03:21:39 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.86) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 03:21:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+nDeZnBC9B0BWjVWu/1xeVKlruaXyaQpzyFvyk/t4eOosKxtGWuyO2eZy1e79G1c7OHOmyvga+2TtZVLAaqByok+Xuaeg0LSU1u6L1Mt3un6yxGFxgSmIDnbHt/ZmhkgQTUlnF7YeaP1iydU6S0zLGyiWkbaeVbn222JcZ7FOq1lCnngUqyEG7gCJaiR4kLonGkID+aHGa3QsKqeKYyyF7jpgJzEM8cxgHJUpLRbPPG1qxk6JO+3mijS9Jq4guOtFTqOPNjIWZRpM9C1A4k2cQAlOvya3GZ9a/s8ncsCT3l282ZYdvx52OmaZMQypAllfWS8wMKHxUOYuAF2zVI6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEAc05FFDXqE65dtptpaoy+MQQzJIVBtjlQN1nKw2dI=;
 b=kQ0PYeNTozNkwzPS+Jb48q0KdFCA9HoZj53n6tOUWgraYaJXQp9Gl1ls71qjz+ma6cKQ3smRRxwfQIEW8Bp36mzvCrQjHO/nnTy0ADXXtHaFhp2CqqdhWdtWhvdLX9eJJWROKskknnyPFd2/qpRX8++b29ukqguAh39rPIrvWVBI3iq3y+hnr0WSjUgAGoPstFY4mIk4Oe2rinVnk4AwxiBm1OXGEaYA5trMRXGIiOnkXIa+I3iZly2mpGur+VaU89stgbdBgMkYR+oyqytTAQAVFhnes0bFH7a2etD9gn7QmO3odb2p18drrSNWLBN+2lVQkY11WC2af5EW48JqJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MW4PR11MB5912.namprd11.prod.outlook.com
 (2603:10b6:303:18a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 10:21:37 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::6acb:cbaa:6326:112e%8]) with mapi id 15.20.8964.021; Mon, 28 Jul 2025
 10:21:37 +0000
Message-ID: <fb180f1c-78f6-4114-b77b-53ffddf1c0f5@intel.com>
Date: Mon, 28 Jul 2025 15:50:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/23] Introduce drm_gpuvm_sm_map_ops_flags enums for
 sm_map_ops
To: Caterina Shablia <caterina.shablia@collabora.com>, Danilo Krummrich
 <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Danilo Krummrich <dakr@redhat.com>,
 "Boris Brezillon" <bbrezillon@kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <DBIMILMUUV20.YED53M3X50H5@kernel.org>
 <aIGBzCnTAcyb6v1H@lstrano-desk.jf.intel.com> <2304014.vFx2qVVIhK@xps>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <2304014.vFx2qVVIhK@xps>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::19) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MW4PR11MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 7324fa7a-61f2-4061-16c1-08ddcdc088e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1NpRkVvOUNrbGhObmtCQXloamN6dWQyWnNvUEY1bkRtRDFEY2NUMGhiTE1a?=
 =?utf-8?B?RndLMG9NV1lJWmo1bldNUDJUMnc0eDdEd0NYRHB5MlpnbFNKbkowMGErVEY2?=
 =?utf-8?B?ays2c3JzbkRDWElyVlZmc1FnZDZzdlN0Q0MvcGJOOTVpZlFOQnZxVDRlVlJE?=
 =?utf-8?B?NENqOU1uMStyaHM4SVprRlNzT0hiMWlyaTJNT3dFV0F1TEJTOUh3aDRyRCto?=
 =?utf-8?B?ZnlYS0VqMXcwU1lEM0xhczZaYk5hTzZvREhDY2h4NUpIYllMUlZPbUdiZFAr?=
 =?utf-8?B?NmFWRnBFRzhKQStxbTZieVN5a0dRbjBMTTRmdkUyajBNZFUyR01TWlFvOU82?=
 =?utf-8?B?U3RPWXBqV2Vnc2VPemQ4T2ZTd05UQUNFU2M4OWRQa25rR1BxQjYzb293S1dP?=
 =?utf-8?B?aFZMRFZMb0FjZ3g0elN5c3N2ZlB6SUFJamt3Z0NWYWJhbFp5cHpzUk5LUU5S?=
 =?utf-8?B?YitncUJBcFlUWEY1bHpDUC9ueTJtSitYaXhtNllQZ3ZmUkhFVytJVE1HeVg0?=
 =?utf-8?B?TGhlZ05wd2VnYlhadGwveGQ4UThNeS9zdnVoV2piUW56OFUyK0liZysvZERv?=
 =?utf-8?B?VG9VWkR4YmNWT2ZNV1VQSmxDejBaNUt1dGtuR2w1a0txdERaV0pTTmRZQk9J?=
 =?utf-8?B?V3YyWng2dVIzWllqRGtXVmNXby9Mei94aDYzcmlGWlZCeVNhWnV0dlAyZEts?=
 =?utf-8?B?aDZJRUYyejluNTdUazhLYkZBUzFHMVptS3B0KzJYcnhPSisrM05HRU1sbHl1?=
 =?utf-8?B?aEZ6MmlJUVJuV0hIdVRsMVBGOVdkZURpMmdZTGd4UTIvZnlleTErejIvMGtq?=
 =?utf-8?B?LzNtQ2V5OWdNZUtPRXIrU2tBQ2h5dUcyelAzczRxWk9xRXJLM0l2aEFGUytR?=
 =?utf-8?B?Tzl4VFoxYjNoMUxWVmlCeHdSNXJPK3FwazJFNklIeCtKcFFVSXphdHJVanRN?=
 =?utf-8?B?R1Btbk5KSDJTdTZPbzlzWlRJVHd3N0RHTjR1b0drT0NnSy9tNklwSlJSZUZ6?=
 =?utf-8?B?blhIdGd2SEJCdXZlMkZqY0dLa29URkVwSlptUWdtZUNWZzFpS2p6NWxsdGdi?=
 =?utf-8?B?eXFpelR0YnFGQWo3d0pXUGRFa0lZZU15T2l3SitvVU92NW5tMllldmdKL01Z?=
 =?utf-8?B?S2VvRHlYMEltSFFEQXA2SE1mT3NTM21PSlo5TjBEdFA1SXdlZlhING1lYVRx?=
 =?utf-8?B?QXpOZ2MwVjZMYXNpcXM0RERCM3FGNVBKNVBjaVpHemVrbjFwczVoTkVmZ2xD?=
 =?utf-8?B?S3lsejNkeGpHT3dqR2pOR3VYYmVQa2J2T1hTNHFsMkh0Y293R1B4dzNqZU03?=
 =?utf-8?B?bm9YWnhUSXBhb211cGpLVDBYUE9iTkNuY2MzR1Q5ZDNEVGVCcmcyU3NvZ040?=
 =?utf-8?B?cGJ0TENiZ1hqbmJqOHJSbGxXbXoyaCtMTlBTUUVNUWhScVpFMWlmb3hUeEVx?=
 =?utf-8?B?bUh4Q1h1QmxrMER2M1UybElRYWhhaHoyTjlYbm1oU0VaSjMwM3FhcDB2TStt?=
 =?utf-8?B?NlhtaG5xV2NVeXZwNkx4TFlFc1VwZFF4Rm5teW5DZ1ZoTnY1aGtVeVFnN1Q5?=
 =?utf-8?B?UHd6QUF0UTlBSU5MdWVtRWFuWDRKYWtLQ3dPRDBCbVpNSTNMdnJ6NE1hdnFF?=
 =?utf-8?B?anpSbWRTWkxIdlNUU0M0OXNoNkZ0RStnZUZGWmJVN3ZLQTVWUWNxQlBZUWdw?=
 =?utf-8?B?SS8zL042WnBDVzFodFQyZmlPNmQzK3JOclBOcStHVmM3V09MZmpKelVkMlc0?=
 =?utf-8?B?L2ZNUFFvcC90a0tMRFp5QnNGUkpJb0pOSEZuY04yeVplMjYwWFhmN0xUWmho?=
 =?utf-8?B?OUFLUzV3eEFsUEZheEVEQWNLWEhDblhVVjQ1ZXlqdU1Nb2VTNWY5M0psNGpV?=
 =?utf-8?B?andRN2dZK2hKY3pwMmxtYmdySGdPWTUrcDdkSTVMVm0wV2k4bm1VK2lISDFw?=
 =?utf-8?Q?MbWTPQg9bnw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Smk5a0REVlVNeENoVGNneUhxTTJsLzJEVlZuTWRhSTJ1Y1U5WW9QQkhnM1Qx?=
 =?utf-8?B?YjdIcmZHV005K2ExKzRHZEcxZ20zaXJ6NCt0U2RkSWtCS2hlSkMvNEJPZ0Y2?=
 =?utf-8?B?OVV3dnFQSjRZa1NwbDNwNlVSaUM5MWxWNEpzRzFYWHhmeW0xVFNaS0VIS1ZZ?=
 =?utf-8?B?UnpzQU9McGZsdFRTRlNTMzlnN3p0aGNjemdPdmFKdlhmaVNqOFpMcWU0eVJU?=
 =?utf-8?B?YjBNTmNESmtPYnVRK2VHK3d5U2dyTXVxNDR6bkhOQlh5N2FIc2NOS3VFNTNM?=
 =?utf-8?B?NCt6RWt4NWNYUGJobE8yanRodlIrbEhsT2ZEWFBja1ROM0xsT20wdi9BTXMz?=
 =?utf-8?B?dnBMR1p1NVhYYXplNExHUzhuZVdYakROVG1GSzFFdmNPSUtib2s4QTZoT1BY?=
 =?utf-8?B?MjN4aDNUY1pXNkEwTnBlNldueTJmUnM5U1Vsd1dNT1R3L21OY3p1ZEw3RHVG?=
 =?utf-8?B?VVZ1aVhBSGhNVzYvT1NTR2dYZm1ZazJSZHJsK3RwMEVZZENoSmhGRS9ad1Vk?=
 =?utf-8?B?T0szbVYwRGVZcjNudFdWb3gzbDRsT1MrMm0rcHo1aTVsWVBJYzhYUy9uYWU0?=
 =?utf-8?B?QS9ZZnVDZ1piUUZuMGpwRDZFOUx2NjVyVnRsVFc3bHlQVW9GQUQrQUtMSkhQ?=
 =?utf-8?B?OFdaZlhUNG9hUkxIMjkra3BUU0NYcGtqbmZkTlNETmZMdTJ2bG42aGlGWmtw?=
 =?utf-8?B?QjNWSGUzbDVnQ05JaTRqdWVKUVl0SFd3L2FxRGl6eHJZNXhjQ3lKci9kUUww?=
 =?utf-8?B?TTNsNHhOZHUySENKRkNVRkdPOGNvcDVoc1pwc01UWmMreXhIbWd4WHVZZGMy?=
 =?utf-8?B?RkNOaUpLUE9nMEZHZmRjcm14VGZUVDZtc2RiaVRZZENsYWJvN042QTA3NGh3?=
 =?utf-8?B?K09ObW9UOXgrQlRiMWgvQnliYjhPWjJJaDFHTXptYkQ5WmxDTDdab05HVlpm?=
 =?utf-8?B?b1pHU002SllpaEpsSTJtZkRCWWY3Q3NadmI4ejh0dk56dXBQODZKK1RyV0U3?=
 =?utf-8?B?ZUhGSTM2cDBDMGE0dVhVT0o5bmhVT1NpbGo1TzN0VWpyblNmUzUyWGcrMnlV?=
 =?utf-8?B?dVJaVVRoVC93M29JQnl2bFhvOGhNVm0ybGlvbEUxRjBWWERaK05qWHo0L29G?=
 =?utf-8?B?UVErWmlJbkppQ3FLRjEyUFZqS2F0YTRRbUp4NVVtMFJBUFdxVGFYSllHUG5L?=
 =?utf-8?B?UTJQWUZCR09DMHh2QkxMU255WHIzOUJRQlI5Uk9FUnlIRVowMkNHbEMzNGpX?=
 =?utf-8?B?SURpZ0JiMVQwZEZ5MWMzMlF2VktsZHltWnNreFRtSCtScExFMU1sUHkzLzlF?=
 =?utf-8?B?aVhQeFNSTW1qamZ2RXZQazRxWXlIUktrSVNDOEIxdVFSZERZNlpiN3ljNkZ1?=
 =?utf-8?B?OGxzMkxiS0R4ZmlJa2xJd3FIL0NqWEFGZkNyTlBrVnoyUkY5encrQUNYekVw?=
 =?utf-8?B?NFhFRkFoRWwzWnVEamxheTM5SlpZaHdJYXJ0MEN3cDZvNUtRbXMvZXFPY1k5?=
 =?utf-8?B?NHJXdnZheEE3aXZVSEt6R1pLQlQ2cGJxanYvRU9wTEVZTXJJbVlCaE10SEFu?=
 =?utf-8?B?TEZaMitaUnFQaTY3RFBycHFxK0NoWCtKazQ4d2I3NCttYk9uQmZDMWNSa1BE?=
 =?utf-8?B?dTFmR2NaSmIzbHYxYUVJTy82UzBCSjEvaUpZMXRWRitMMW1VYnRrVmFxOGN5?=
 =?utf-8?B?enN4NXh1TzRRK2pQME1rSnE1SlZhaGlJV2haN3lmcGk2TEZCRDJVMXA5eTJa?=
 =?utf-8?B?ZE1nNTFVL3VhZnlnNmhlb1FFYkZlUkFMQU9LUmFCeGtFU3lldWNKeSsvRE1V?=
 =?utf-8?B?QzJVZ2NMa0pZeVVsbmtoUWNwejVQaFM4R2RKVlNVY1F4SStmRXNHRHhNbWQ3?=
 =?utf-8?B?T2dsUzJrcGxhR0NLdVJ1UWFvTWdyL2ZKTjRHN1JxQXNxTzBHOVFyRVp5T1dC?=
 =?utf-8?B?WTlkaXlUV2VxeVJyTVdlYVVnRDFNSy9aZ0JGNUVXUmVQVUFhTTBiVU1mbHdG?=
 =?utf-8?B?MCtWaVpTcXZXbGdqaGdUWCtyR3Zzb3BOSldQclIrTGxpT1F1dEhYSUI0em1O?=
 =?utf-8?B?VVBEOStjWmQ0QVB4eGVCbU04dFZKWldjNHlCRjJYM2RiNGZkWHlLbTZ5cGxy?=
 =?utf-8?B?TitEbWtPOGEyRHVoSEc0b0pmRVJlZHhnRkVhOWpaNXBVS01yYldSbzVQVm1Q?=
 =?utf-8?Q?g0/NRxiD6JtATycSrVAGfFg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7324fa7a-61f2-4061-16c1-08ddcdc088e5
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 10:21:37.2248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKMyo4RAtxCvd53naN1TjNYDmnYRw29gxid5NJffvXh5XlTBVYxv5fSokT6GdvU0sPbPdNT7SDLOmAlG9YH9bUuW/BTLH92sde8qwSkJtLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5912
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



On 24-07-2025 16:02, Caterina Shablia wrote:
> El jueves, 24 de julio de 2025 2:43:56 (hora de verano de Europa central),
> Matthew Brost escribió:
>> On Tue, Jul 22, 2025 at 03:38:14PM +0200, Danilo Krummrich wrote:
>>> (Cc: Caterina)
>>>
>>> On Tue Jul 22, 2025 at 3:35 PM CEST, Himal Prasad Ghimiray wrote:
>>>> - DRM_GPUVM_SM_MAP_NOT_MADVISE: Default sm_map operations for the input
>>>>
>>>>    range.
>>>>
>>>> - DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
>>>>
>>>>    drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
>>>>
>>>> user-provided range and split the existing non-GEM object VMA if the
>>>> start or end of the input range lies within it. The operations can
>>>> create up to 2 REMAPS and 2 MAPs. The purpose of this operation is to be
>>>> used by the Xe driver to assign attributes to GPUVMA's within the
>>>> user-defined range. Unlike drm_gpuvm_sm_map_ops_flags in default mode,
>>>> the operation with this flag will never have UNMAPs and
>>>> merges, and can be without any final operations.
>>>>
>>>> v2
>>>> - use drm_gpuvm_sm_map_ops_create with flags instead of defining new
>>>>
>>>>    ops_create (Danilo)
>>>>
>>>> - Add doc (Danilo)
>>>>
>>>> v3
>>>> - Fix doc
>>>> - Fix unmapping check
>>>>
>>>> v4
>>>> - Fix mapping for non madvise ops
>>>>
>>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Boris Brezillon <bbrezillon@kernel.org>
>>>> Cc: <dri-devel@lists.freedesktop.org>
>>>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>>>> ---
>>>>
>>>>   drivers/gpu/drm/drm_gpuvm.c            | 93 ++++++++++++++++++++------
>>>>   drivers/gpu/drm/nouveau/nouveau_uvmm.c |  1 +
>>>>   drivers/gpu/drm/xe/xe_vm.c             |  1 +
>>>
>>> What about the other drivers using GPUVM, aren't they affected by the
>>> changes?
>> Yes, this seemly would break the build or other users. If the baseline
>> includes the patch below that I suggest to pull in this is a moot point
>> though.
>>
>>>>   include/drm/drm_gpuvm.h                | 25 ++++++-
>>>>   4 files changed, 98 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>>>> index e89b932e987c..c7779588ea38 100644
>>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>>> @@ -2103,10 +2103,13 @@ static int
>>>>
>>>>   __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>>>   
>>>>   		   const struct drm_gpuvm_ops *ops, void *priv,
>>>>   		   u64 req_addr, u64 req_range,
>>>>
>>>> +		   enum drm_gpuvm_sm_map_ops_flags flags,
>>>
>>> Please coordinate with Boris and Caterina here. They're adding a new
>>> request structure, struct drm_gpuvm_map_req.
>>>
>>> I think we can define it as
>>>
>>> 	struct drm_gpuvm_map_req {
>>> 	
>>> 		struct drm_gpuva_op_map map;
>>> 		struct drm_gpuvm_sm_map_ops_flags flags;
>>> 	
>>> 	}
>>
>> +1, I see the patch [2] and the suggested change to drm_gpuva_op_map
>> [3]. Both patch and your suggestion look good to me.
>>
>> Perhaps we try to accelerate [2] landing ahead of either series as
>> overall just looks like a good cleanup which can be merged asap.
> I'm not sure my patchset would be in a mergeable state any time soon -- I've
> discovered some issues with split/merge of repeated mappings while writing the
> doc, so it will be a while before I'll be submitting that again. [2] itself is
> in a good shape, absolutely feel free to submit that as part of your series.

Thanks for the confirmation. Will update next rev accordingly.

>>
>> Himal - I'd rebase on top [2], with Danilo suggestion in [3] if this
>> hasn't landed by your next rev.
>>
>> [2]
>> https://lore.kernel.org/all/20250707170442.1437009-4-caterina.shablia@colla
>> bora.com/ [3]
>> https://lore.kernel.org/all/DB61N61AKIJ3.FG7GUJBG386P@kernel.org/
>>> eventually.
>>>
>>> Please also coordinate on the changes in __drm_gpuvm_sm_map() below
>>> regarding Caterina's series [1], it looks like they're conflicting.
>>
>> It looks pretty minor actually. I'm sure if really matter who this is
>> race but yes, always good to coordinate.
>>
>>> [1]
>>> https://lore.kernel.org/all/20250707170442.1437009-1-caterina.shablia@col
>>> labora.com/>
>>>> +/**
>>>> + * enum drm_gpuvm_sm_map_ops_flags - flags for drm_gpuvm split/merge
>>>> ops
>>>> + */
>>>> +enum drm_gpuvm_sm_map_ops_flags {
>>>> +	/**
>>>> +	 * @DRM_GPUVM_SM_MAP_NOT_MADVISE: DEFAULT sm_map ops
>>>> +	 */
>>>> +	DRM_GPUVM_SM_MAP_NOT_MADVISE = 0,
>>>
>>> Why would we name this "NOT_MADVISE"? What if we add more flags for other
>>> purposes?
>>
>> How about...
>>
>> s/DRM_GPUVM_SM_MAP_NOT_MADVISE/DRM_GPUVM_SM_MAP_OPS_FLAG_NONE/
>>
>>>> +	/**
>>>> +	 * @DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
>>>> +	 * drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
>>>> +	 * user-provided range and split the existing non-GEM object VMA
> if
>>>> the
>>>> +	 * start or end of the input range lies within it. The operations
> can
>>>> +	 * create up to 2 REMAPS and 2 MAPs. Unlike
> drm_gpuvm_sm_map_ops_flags
>>>> +	 * in default mode, the operation with this flag will never have
>>>> UNMAPs and +	 * merges, and can be without any final operations.
>>>> +	 */
>>>> +	DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE = BIT(0),
>>
>> Then normalize this one...
>>
>> s/DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE/DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MA
>> DVISE/
>>
>> Matt
>>
>>>> +};
> 
> 
> 
> 

