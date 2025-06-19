Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B24FADFE09
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 08:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6903D10E9AB;
	Thu, 19 Jun 2025 06:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSDVLsP/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D1110E9B7;
 Thu, 19 Jun 2025 06:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750315892; x=1781851892;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RRjaSuPVkt7/sYC1x/hXay9HgFDu0f4nD3he09KRwPE=;
 b=RSDVLsP//fZT+GNjJplwgXybtzcyClSBJHrop8KA2LENerUsiboECX2g
 kDM+bDEQOwrEP8ETlO7ERfDw4MSPkXhyY1Oi0DZ9P3ZuRJDy1ZaIBaZNx
 wgQxwse/S6kMPMVO+LqKlC+XSgA40sjq/K3o0vYq3yL3RO+ABNnwLBg2A
 ajEZlk4dztbf8W90pt3Qdk6wBrDGIMFBDgPDrnqwc1boNkm8/+rUiu4pl
 rAqbqMh7UUjw39XtwxRKdU0OV+47zlyWE95dsPAonoYQVAyhqTHXaon13
 zobzCdqKQ3slhvU+W1iZfEOeYSpXm0/fefpddtM4GtqqZ5RZhVKMo7oMH A==;
X-CSE-ConnectionGUID: CzilSs4xS/6wKF5c0iayYg==
X-CSE-MsgGUID: Y8lIBXQRTpm4Ms5n0RCLxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56379761"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="56379761"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 23:51:32 -0700
X-CSE-ConnectionGUID: dhVG4eNmQHOOPX9xS+ymaQ==
X-CSE-MsgGUID: ORiC73lpSRy1xjlr4Fs/nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="150845383"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 23:51:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 23:51:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 23:51:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.86)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 23:51:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+81q0CIkTD1TRJyCI7Tsx3cY8zo3TiuyVWofrKxp73eLpSMerffoX11fc9o0/6HxtjYfh6Pr0LHRJLfMqjNCO1ehsxGw8Ok5EPSmfPJhsqht/X4XcBtyuSDismqwE+iPSUf7XbDSN+tgr0z+qcAbcmOwdRwDIcXAPY3OYMv3nUylKVazc4oUhyfIoM2KaH4D6mTNWd/tQXaF/teHJFFslT6sL13Ixz2kM4vm/5NSVAM2veGujv1FgY7U7dw5UJMzVT7Rp+XpSVe3xMzT48ZzQoQhsNmU7mYSiVasCYp51M9MPqt03qdvJpxuuhN+DoSwCXyEXFmNwhvaasmlvXcIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNUZbOARQIwRoLtzh6Sc9VohUG2yN6EyzgpvQYibPxg=;
 b=IDrzkmjUptDapLeIoiU9wLnyiKu3NA2z3CmXw3rklIpryMFrWPyHc9MdPdLosRQxN4KkJa4HvRTz8FJg5f8SNBE0n8L9GI2fkEVtWIdeB4SZxwn+dC568zu3wP4ZQwWE5E08UFvl3fabP2EshdAXWWKlXvBN/i5r8n3GyV1Nap3F9uF6goqcadrwAKqNmHM/aAyomQhOlJqYph+1VX+brEQRB8k6+P013b5RBXYlkwkWj1mN/sxnaxTlY1FHHNMGlpN9d5mjwlhQWBnavrlHGKqYxe2eBVXPK/X6I135FU39RF8X9ZGDCGIebz6Y9EmySChOENMs0J0owZgnoOo4zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by IA1PR11MB7856.namprd11.prod.outlook.com (2603:10b6:208:3f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 06:51:18 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::e353:636a:37f:21ef%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 06:51:18 +0000
Message-ID: <3fad6292-cbdb-4724-8e28-5315bb735d78@intel.com>
Date: Thu, 19 Jun 2025 12:21:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/10] drm/xe/xe_late_bind_fw: Introduce debug fs node
 to disable late binding
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>, <jgg@nvidia.com>
References: <20250618190007.2932322-1-badal.nilawar@intel.com>
 <20250618190007.2932322-9-badal.nilawar@intel.com>
 <b9a468c0-53ed-4da4-a044-76c5e8461b95@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <b9a468c0-53ed-4da4-a044-76c5e8461b95@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::19) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|IA1PR11MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 972c8355-dda9-4920-e7e4-08ddaefdb192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFd2MStsb2hSODduZHJ3NDkvWkxqZDFyRU8wMStpWU41ekx5RGdjSlhUaWFl?=
 =?utf-8?B?WVNmM01sYVAvYzdQek9oMU9vUG1oakhnendqc0JZa1Bzb0dxQWpJK293OFBY?=
 =?utf-8?B?VmFmNWVxR3R3OVYrTFFKcXFkZHArb3dadTdpSXJJckhtYmZvSFoxT0Y3ZWxU?=
 =?utf-8?B?VTJYWVV1VGIzd0J1WkRFMkszL2luVG1Bay83QVkvc3JGSERoS09HNFJHV1ZI?=
 =?utf-8?B?V3Q4TmEydExFY0JOWndWdmRpZDB0RS8rN1MyMm9wajJMRVlyMW41Q0pWbnVI?=
 =?utf-8?B?WFVRRGErL2xOd2Vhb3QyV1BvbUQ4VkJ1ZTdaQTVFYWMzVEptZEp4NFZHcGlt?=
 =?utf-8?B?YjZYVkU3VnplaW5NWk5JQlRSTFA0NWRnaE5zRDVJZzFtb09Yc2J0MGVUbEdv?=
 =?utf-8?B?c29SdUdtS1BHdTVYT1NGWlhCSWp0V0VsZHpCMGFGSXdUQk4yckJKUUtyUUM0?=
 =?utf-8?B?cDNmbit1S1Mzc3NtTGpTTzBibEZQdXZka285NjhBb1lBV1I0azJ2aEViMmlq?=
 =?utf-8?B?RTMzTU1tb2Y4SkNESjBaNEFwNTVpb3JESEJ3eXVKTmJJbUpTTms1RXRwVjcr?=
 =?utf-8?B?NGxkeHBNRklzdXVIbmxHczhEVUxoODdJQWZwY2lDYmUwU0JMcFRmUlNYeTMr?=
 =?utf-8?B?T1gwd2hMc1UrNzMwT3BhQ0VFTWJScitVTit3MC9BRytUeDZGS0NHYlRiUWxI?=
 =?utf-8?B?bTNRZzF1cjdsY0FaT0xtdFB3dUNjbzRBMlNZdm5ma1Z1YmtnTVFXZ1QwTXZO?=
 =?utf-8?B?R292YjdxTitta1BBb1FZdFRMUWNGcC95N3phRXFHNzNySUN4azB3alh0dFR6?=
 =?utf-8?B?VjJENlFlWTlTaTMxUnNLcTVuVWoxNlRSQi9yS2RkY3VrVTNRQ1JXdjAxNDlD?=
 =?utf-8?B?cVB0NzEvNllyY21nd1ZMMU1GRW12OXVJSkRTUFUvWVZiNXdiM0lCOVpqRWUz?=
 =?utf-8?B?YTVOWW1LTFEvSmVCWVNtVE55QlJHb1U0by9DbWhyWkREMlFsN2poc1BDUHFR?=
 =?utf-8?B?MGZuU2hFSEN5Q0pmbFdjT0UyWG11RmFYb2p0aUx3WndOMlFOOHFBR2NoaThG?=
 =?utf-8?B?eHZKSlRxUFhNUElkN2hhWmVPRmcwUHVOWk15SlVnK0VXNkJMWXZvdFBMQlln?=
 =?utf-8?B?VFdodFFjZVJDY3JZVFJQeGZOMXNNZW1lSDM3a3JBUkUzM2VpWHk1cnpIQ0Rv?=
 =?utf-8?B?eXg4KzViaTJtZU9sc0FXaEpDWmJsb0xpejdpYktFYkg2ZGRHTzRDZ1FnT2R6?=
 =?utf-8?B?dUVqSk9udnJFVGRoVEd0RnhYZVFiTlpWN0Z1bEpiN3F1UEx1Z1RwcE8yRm15?=
 =?utf-8?B?Wnk1SzlUSkRvUG9UM0J2U2FVWE1EQUNxM3FzcjRmSFJKRFdFSW11Q3JkSms5?=
 =?utf-8?B?bld5TTlYNjJqWEtjY040OGYxSkhQRHo5cWlsOVJBUGpQS1ZKME1aYjYyS3Va?=
 =?utf-8?B?dDFndnkyVFJUakZ0MFRWVTdkc2lRdGFBM1VHUGlseXhhM2tmNFpqUHR4RjlP?=
 =?utf-8?B?cXR4SVhlRlFpVExhNTVVUUJnUTcyeWZkRjFydVhraFBVZUlVMDFHQW5LaVhl?=
 =?utf-8?B?UERqNDVkVTNiVkhXSHFDMnZFRU5ZV25zeEhrMnRXelEvc2xCTzdKbXdYZm1v?=
 =?utf-8?B?emYrVTdHN0cxZ2xTS01qVXJKK2NxMUtnbnRjangvdUZSQTNCcEJkaEZ3L0Vv?=
 =?utf-8?B?TnA5SllpQ1VEMjdiaittdlNuTlJaaEZjeldmNklFL08yWWc5UW54RytWU0cz?=
 =?utf-8?B?UG1CL291cDNvS2ZUT0xuL0x1QUR2VTh4cDU3KzZHU1R0bTh1dTVUbzdob0tv?=
 =?utf-8?B?OVVHZERmSlNOcTZEV1J3UlJpczZPOUQ4YUNVcGZNbC9sQnBYeGEyYStSZkdp?=
 =?utf-8?B?MTVSbGlZcU80dnFwaGc2Nm1GV1NCUzAyZitvVDRmeDNIZGNjSkZpdm43T2xt?=
 =?utf-8?Q?ttQXr51DLNQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5536.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVBZWkRncGgvRGlsZzg0WW9YRE9iNktpMEJXaytrR0NvVWlZb2hLMlcvSzc4?=
 =?utf-8?B?MmZkbTJwUnhWQTc4MlloOWZRRkdGUytxLzUzbC9WbnpBSG1ZcFhGbkV6NGRL?=
 =?utf-8?B?ZUxiRDVjMW9Pai9LSEhNRitpNldubjA2MmFuVGt3cU55RnZmSkQvRk50Yytr?=
 =?utf-8?B?SDkzQ2Z5ckZtdU9PN0hXbUptVnVBY1k4Y3lNZUZCMlNKRldkWE5ZaHo1SXdh?=
 =?utf-8?B?bnorWW1ZNXA2T2wzelhvcGVEbU9HV3RSTmxsUEpMayttcEhqR21qTkt6QnZZ?=
 =?utf-8?B?VXFUQ3Z6blV1MkU3b3FBbWRHMndna1lXb1B0Y1haVmJyS1pFTEpFSDJxa21P?=
 =?utf-8?B?RzJpbXBnMEV1eDJtbkhTcjVDaGhUWjZ2ejhkZ1J5S1NTbkNGNEV2SlZQZ2Jw?=
 =?utf-8?B?UkxyMC9ScDZuemVpd2Rsbk1EdHhWVXUreC9vZHVRaDI3VmlMNU04bVRpb3cy?=
 =?utf-8?B?VHlybXNlanI0MG45YWZtMU14SElvR0dJdnArYWxmdjNvOXZMVnkrazRzUFB6?=
 =?utf-8?B?MVdIRFpTRFFESFBvOWdhSVB4WUdiK3V0TVhKdStZMk9LQWhGUVZQOGk1K0NN?=
 =?utf-8?B?TjNsTytTb21KYmp4MVZIeThVWC9zd0JnVlBaVkxWSkJielJvZmJLUnd3Qi9t?=
 =?utf-8?B?ZEZudUxxR0xZc0VPQkNZWnhidEdDVFNwZ0ZRK0loYi9lWnRrMFFmRk9Hdm5z?=
 =?utf-8?B?VWNic1AzU09iNmFYRk9STjNSVFQ0Y0wzdVNFa0FQVkFKSXRKYWhTcjdMVFZX?=
 =?utf-8?B?Yzk4Q1M3UjRyRzh0QnhnaXZQaHVlbEdmYnM5MitTdloyajFpcVFQRWN1aXBa?=
 =?utf-8?B?a3h2UFR2aW9rNUowekMvOUw1dlFvOUJuMWNnenBqK01ocjgyWE0xWU5ZeEsx?=
 =?utf-8?B?cXRlQkdaYjd0UlVEdjEzZ2FlVitDUlNvblNlb0tqSUE5Q1B6ZzRTYzk0bE5Y?=
 =?utf-8?B?VGhxak9GdHZnWjcxQktDK3pLQ0w3eGROblN0TDRxazVLYzBTeXN2bEVDcmR6?=
 =?utf-8?B?VkdHNjczSEFZN0ZDVWJEM0t6YmFmdHBqZy9ReUNDdUNHTTZKQzJER29VMU9p?=
 =?utf-8?B?dkVMR3d5cjY2NGFQRUJaeUMxUjJGL1owNCtGYlFmMkkvdnIxRzE0MWRqUlVl?=
 =?utf-8?B?SkV1cWNhaW5Jb2hTU2krQmFwYXppc1M4RFVNTUdhUTZhOWxhS3l5WGlIZHly?=
 =?utf-8?B?cXNHZW95eGI4bWl0eVlkWWNuVTJmZlNkb1VXd1dpaG1UZ1p6ZGxyYlRzWlUw?=
 =?utf-8?B?WUVPYnFTdGhkMnlvUTJJWE5aN1V5bEZhWldRTmZWNThKK3JNVEF5eURDOXBV?=
 =?utf-8?B?M0o2S0pGOTdGTFYzSE92dGRKUG03ajl5S1dRRXVJYUpha2l1c0xxcVhpYXNq?=
 =?utf-8?B?MlVTdnJWWW8wa2tycnRONzVtQmt1dEo4WTY1MUdtQllnNlJZSHRnK3c2QS83?=
 =?utf-8?B?K3BoS3llYk8zV3Nua0UxVU1VUFBtNlhlMFpSSlV3aVBlVUJXaGthR01RV2pq?=
 =?utf-8?B?cnlCUnZYbmpHbkFpblJ1dkZXcExYYkU4cTBra241TWNnNkMvZW9XMnFIMjRW?=
 =?utf-8?B?RURZMUNXMEV5dHVkNUlOUVBoWEVOYURrVkxPZWsybGlEY0sxZDFHNzdGT09i?=
 =?utf-8?B?Y2RTbXlRaHF1bkhiTGhNVHpSczlZVjMvSFdEc0VTZ0FodjZTMkZjcDk3MUNX?=
 =?utf-8?B?emlWTm93T25rYjFrK2NML3BHYjc3V0wvdU03cS8raHlnVkZMS25TMXBXU0dJ?=
 =?utf-8?B?UVd5YWpUR214SFpHZHVkNVU0WTd6aTdWcHNaV3JHZ1Q4UFhuUFArcGNJZndU?=
 =?utf-8?B?V2VRWmVkYUVkZi9UeHF0czdjbUVWTlBwdnRRMW9JUWZ3WWlTMGZ1SzNWWG9F?=
 =?utf-8?B?M3BDUGN5TFhQYk9OVDN6bTFVamk1VzJYTTgzYVNncitwRXFQb1hoV3RXcy9r?=
 =?utf-8?B?bUMzMzB5eWNjcGtVeGsxOURYN2VaTDk4RTZYUXcvNEtqRDJ5NS9xS2JXRldj?=
 =?utf-8?B?NlRDL3FWbENBdU8xeUxSUWR4SUl6djRYdDRTN1VoRFVPTjFyRU9sK0xvaG1Y?=
 =?utf-8?B?c2xOaGsyQ1BtRTZiQ1QxZCtwSmkvdXN3Y0tOU0xUY0paU2p6My80RjZNZVFO?=
 =?utf-8?B?dlBZa2xpMDJjZFlSdGdJd0l6c0d3R0VSOUFvYkR1ZVcxbnA5bUNjYWNBR3ov?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 972c8355-dda9-4920-e7e4-08ddaefdb192
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 06:51:18.6979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXfWO14gO9s7mv73PIqHKYo/Ekei6Zf3u+jVxfNNjCfy6UqKBRFW9UIM1sJtKKfUf1BJhb8X1XJww8XsgUNWVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7856
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


On 19-06-2025 02:49, Daniele Ceraolo Spurio wrote:
>
>
> On 6/18/2025 12:00 PM, Badal Nilawar wrote:
>> Introduce a debug filesystem node to disable late binding fw reload
>> during the system or runtime resume. This is intended for situations
>> where the late binding fw needs to be loaded from user mode.
>
> You haven't replied to my question on the previous rev in regards to 
> the expected use-case here.
> Is this for testing only, or something an actual user might want to 
> do? If we only need this for testing, please specify so.

Apologies for the oversight. Yes, this is only necessary for testing the 
binary before releasing it for up-streaming. There is internal
tool which uses IGSC lib to download the binary. To avoid clash between 
the binaries, this debug fs node is provided.

>
> Also, what happens if we suspend with a user-loaded binary? userspace 
> doesn't have visibility to know that they have to re-load their binary.

If the device enters D3 cold state, the binary needs to be reloaded. 
However, the kernel mode driver (KMD) does not have control over 
binaries downloaded via the IGSC library.
If needed D3 cold can be disabled from BIOS or by setting up 
vram_threshold = 0.

Regards,
Badal

> Daniele
>
>>
>> v2:
>>    -s/(uval == 1) ? true : false/!!uval/ (Daniele)
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c            | 41 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c       |  3 ++
>>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h |  3 ++
>>   3 files changed, 47 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c 
>> b/drivers/gpu/drm/xe/xe_debugfs.c
>> index d83cd6ed3fa8..d1f6f556efa2 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -226,6 +226,44 @@ static const struct file_operations 
>> atomic_svm_timeslice_ms_fops = {
>>       .write = atomic_svm_timeslice_ms_set,
>>   };
>>   +static ssize_t disable_late_binding_show(struct file *f, char 
>> __user *ubuf,
>> +                     size_t size, loff_t *pos)
>> +{
>> +    struct xe_device *xe = file_inode(f)->i_private;
>> +    struct xe_late_bind *late_bind = &xe->late_bind;
>> +    char buf[32];
>> +    int len;
>> +
>> +    len = scnprintf(buf, sizeof(buf), "%d\n", late_bind->disable);
>> +
>> +    return simple_read_from_buffer(ubuf, size, pos, buf, len);
>> +}
>> +
>> +static ssize_t disable_late_binding_set(struct file *f, const char 
>> __user *ubuf,
>> +                    size_t size, loff_t *pos)
>> +{
>> +    struct xe_device *xe = file_inode(f)->i_private;
>> +    struct xe_late_bind *late_bind = &xe->late_bind;
>> +    u32 uval;
>> +    ssize_t ret;
>> +
>> +    ret = kstrtouint_from_user(ubuf, size, sizeof(uval), &uval);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (uval > 1)
>> +        return -EINVAL;
>> +
>> +    late_bind->disable = !!uval;
>> +    return size;
>> +}
>> +
>> +static const struct file_operations disable_late_binding_fops = {
>> +    .owner = THIS_MODULE,
>> +    .read = disable_late_binding_show,
>> +    .write = disable_late_binding_set,
>> +};
>> +
>>   void xe_debugfs_register(struct xe_device *xe)
>>   {
>>       struct ttm_device *bdev = &xe->ttm;
>> @@ -249,6 +287,9 @@ void xe_debugfs_register(struct xe_device *xe)
>>       debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
>>                   &atomic_svm_timeslice_ms_fops);
>>   +    debugfs_create_file("disable_late_binding", 0600, root, xe,
>> +                &disable_late_binding_fops);
>> +
>>       for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; 
>> ++mem_type) {
>>           man = ttm_manager_type(bdev, mem_type);
>>   diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index c0be9611c73b..001e526e569a 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -129,6 +129,9 @@ int xe_late_bind_fw_load(struct xe_late_bind 
>> *late_bind)
>>       if (!late_bind->component_added)
>>           return -EINVAL;
>>   +    if (late_bind->disable)
>> +        return 0;
>> +
>>       for (fw_id = 0; fw_id < MAX_FW_ID; fw_id++) {
>>           lbfw = &late_bind->late_bind_fw[fw_id];
>>           if (lbfw->valid)
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> index d256f53d59e6..f79f0c0b2c4a 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> @@ -71,6 +71,9 @@ struct xe_late_bind {
>>       struct xe_late_bind_fw late_bind_fw[MAX_FW_ID];
>>       /** @late_bind.wq: workqueue to submit request to download late 
>> bind blob */
>>       struct workqueue_struct *wq;
>> +
>> +    /** @late_bind.disable to block late binding reload during pm 
>> resume flow*/
>> +    bool disable;
>>   };
>>     #endif
>
