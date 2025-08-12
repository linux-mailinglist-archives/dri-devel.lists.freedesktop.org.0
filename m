Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EE2B2306A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 19:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDD610E628;
	Tue, 12 Aug 2025 17:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQPtjajp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067E910E61F;
 Tue, 12 Aug 2025 17:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755021145; x=1786557145;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HI3Sxm8U7p3KJEoS1O1r5sSNmy5706o1qUAfqWDM4eE=;
 b=RQPtjajpbZyepWQnXVEio/fNSHMBmec43zYB6jZrCFI0TNC5gFCHylpw
 y+PirRG79EQizLvV8BV4iLX+Y71/qUL30AeA0GD4BReukbWW5Yy/VwRyj
 nfa7pvCGj7YwjrR9NitfIp4pVUSj7EzDG/3deDudhdKhcEIpe75OJhWv5
 rx+wYQKF4H7VOv1zRvEXu4qRH6g6R+RDjkMKykhvDuqDzkeAr/SYjRYbs
 Pgl6ANJB6nuo3R7h4t0nEGCt5OsJMo2q6fuZoq+rLf5sDezJud3tHKO/b
 fgxI+OXNDcDRVtt2uUdLJq5fuN3vBkxqg0GhzC3fJu9T5X58HyFN945MI w==;
X-CSE-ConnectionGUID: g2KaNW9CQUmZHa8nA1u02A==
X-CSE-MsgGUID: jcw4tp7qRZmGWuBcP1dCgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57263833"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="57263833"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 10:52:24 -0700
X-CSE-ConnectionGUID: gUxBHX5jS6mzGFhq3pOOBw==
X-CSE-MsgGUID: xf4TkCYmRgSxc0TNtlUWeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="170707907"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 10:52:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 10:52:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 12 Aug 2025 10:52:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.52)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 10:52:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FeA6xgHabw7WFLFR9Gsvrck8JvmjAtse9skOdNJJGacyZLD1j5irozUQGmfmcFOGdsLlOfnLgtD4fPWUukgqig9m2qjlvs1R4jCk3c1obmp0LpOWXbSll9X3iFsyoY282VZO2ZulUfJriEzbT3m7mYy04rzLE1OTVlboh1KG28YlWrS4yJsP8mHZiLWiYYDhamiDWyMgoj8gYy20x5Q2lMKI3pC6yLR9t8Xro5r+lCLz+koDKHKr8cBo+DujJw++y+WZQu+Tt7S5VREMhN0wxUNOjM1NM6pu1pDz7IHj2GgWrGTOGgebK7Ft/t5Sa+HR8IaABsBV5kyw4JAhPg+lDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ax1nlBjTCDy4Cd3g5ldCSG95J5xKr+j7mtvxQFVc8wY=;
 b=Tk4uPfy1WGAmpMFC8bbMfzZEbpQ3/6Qv0Y2OcWF36Etfz9leJhN5nkzYOl5MvJRCCzNTFB9tFz1iD/vyXin3Ag4W+d+RynpjB/kMrMP4IxKw9VPJ3h0aWDKXNHFsbPxZqzKdxL3q/uKD5SMRj/NOX23Y/5RlEyYVIpOGReaVoQYHzHloJdWk88DMnRCKrXXmfCxGcGJPA0dnOjPCbBt/cWW6DgeJO1yhwACW1xMDLBLWFswl+IBZcKWvrT0mfzn2Umf2lpPwzroI2ps5koZ+72ZsTTincBTpFYVT9yslA6o5AycFwhoZ4gtXCPDW15QvYrUMluAcuMiCqtz+UojEqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA1PR11MB6783.namprd11.prod.outlook.com
 (2603:10b6:806:25f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 17:52:21 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%5]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 17:52:20 +0000
Message-ID: <5e3e2518-cbd0-49ee-8c8a-ca2bd464272c@intel.com>
Date: Tue, 12 Aug 2025 23:22:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/26] drm/gpuvm: Introduce
 DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT_MADVISE flag
To: Danilo Krummrich <dakr@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Boris
 Brezillon" <bbrezillon@kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-5-himal.prasad.ghimiray@intel.com>
 <DBXXHBNTM105.2DTBKIO95D5UI@kernel.org>
 <f5d6e986-abc7-476c-b27b-ba22e5d114a2@intel.com>
 <DC0KTIPCIM2X.YRWQ3K2RLHIG@kernel.org>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <DC0KTIPCIM2X.YRWQ3K2RLHIG@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::33) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA1PR11MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: 89ec6a64-f175-4c20-e770-08ddd9c8fc54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUNWNTVqOW9DM1FHWElRMXhsYjBDTUs5Q21vM3JGdDEwWUFNRTVHZ2Z0akhX?=
 =?utf-8?B?SVh3K05yTUMzaFJ6WVdvOGVMZU5GRmRqekJmK0poUW9Zdi9QUzRNRVhqTU9I?=
 =?utf-8?B?SVg4NTloeXNUbTVEeU1NUTR0TXprbTVtQnNIbU9Wc0VBRnpJWkpuSnQ3bkd0?=
 =?utf-8?B?K3FzR2trSExlWFo3dk5GdjlEUXkxNHEyVjZ2bTlZd3JPVWNaY0pROFNScytR?=
 =?utf-8?B?a3NSaitVNjZMeXVQUmhVb0N2azVOTmtZZ2d0T2RzWkNyQW81UWwyY2NIVFdO?=
 =?utf-8?B?TFhXaG9OKzBDQmJuakt5bER1bjNmVUZiaGRGWGJJT1R3RnA1cWpjYnI0U0Vp?=
 =?utf-8?B?NjI5blVXRlNPZVVvWE5OVTRsVjBvMTVIU3g5b2xPQW9DemRHWXNMSmw2ZnFw?=
 =?utf-8?B?VFc4eEJCWG5NWU9mYkM3NTRVODB0K1N1ZElzUmhvbHlncGlxdzJwNFk0ZWdM?=
 =?utf-8?B?RGZSdVRlZDVkL2lLWlpqdGhBTDJSTVRYWmwveGlOWFVacjBnMFFlS0xxTWVs?=
 =?utf-8?B?NWdMMy9hbG9OYmNoejZsTmZ0cHppbE5wUnhhOFpWbXVZTFpxcTRSaWFIL0t6?=
 =?utf-8?B?SjkzOU5ZQkRFbzY1d05WSVh0ZExJemthV1NQbW1tQjM3WXJkTDkydVpIQ0lH?=
 =?utf-8?B?NG5OUzVUR1FHYkVDRVJmT0s5a1l0MnpHaGtEUzhNSGZHSjJyRlZuUnAyVnFG?=
 =?utf-8?B?TWRLdFZWc29RSUk3Unh3TUhtTjhtMzZhT2hYOXNncGNSTUYyZlUrN3hhUEZH?=
 =?utf-8?B?eTE0MGIvV2k1eDNsTlo2V2tlUEhobitHOHhES0E4K1JrZ0dBNVNlTldKaDhH?=
 =?utf-8?B?cHcxRStyQi9rSEJFaFIwNFIvZm50eEtVUm5zS1cyekw5WWMrUW14TlYzUHdC?=
 =?utf-8?B?cmRjV2xIS2FOZlhCdnpmM2Jjb3dsbGRUYm05NmlXWDVtWnNURjFVbDZPYnpZ?=
 =?utf-8?B?eHJvbjdOb2ZWcUNTZE9tVVhaSGlSdEFaZCt1clVwZ0ZYSjlwaG5XeGFiUUZo?=
 =?utf-8?B?Vkdlbjh1OHpGbUxZcThPQUFySW9DQkxzTzBqMlpyOUZxKytISStPYUx5blZF?=
 =?utf-8?B?dDFVUXMzVWhSWGdUN2pXeWRkY2FSQ3JVM2p0UXZ5RlNHV3lHVnVaS1pyajMv?=
 =?utf-8?B?bUY5cWN2WWJrOUtaYnFRNEgyby9GUGlDN2FlUlAzMjEzeTc0RnVOdjEwTkVX?=
 =?utf-8?B?cEZXanJ4SGNhaWkybHJIZ0lha1VqVU1CcjBxdkZqWjlqQWhIT3dZQi9YVXR4?=
 =?utf-8?B?Vm9wU0ptNVUrd0JkNm0wZVpBaUwwUlVuWEpMeFRCeGhhVGlraVA3eThTVWhj?=
 =?utf-8?B?K0hXQjJtaE1QbE5OZENJYVNaUVJUd2JpN2NCalVnWU5BU0thMXNyemxlUmN3?=
 =?utf-8?B?SW9PMmRvb3lSV3BuNWM2bEYzQXVkRU10YXpqVEVreWVHOElpMTJNMEFSLy82?=
 =?utf-8?B?dHNicWptVllDVk9HNUJqeHd4dGhiWERscUFxTmY5SnpiT1VmeE45WlB0c1NN?=
 =?utf-8?B?aFFMenQveStoQkFjSXU5UFFzdmxLMndPc3oxM1BPRHZ0YUV5a3JHdjdlY0Q5?=
 =?utf-8?B?V29CSW43OWdKUEdpNUhjYVhEclZPbWE0VDJRaGZ0ckxnTlE4Vk1jVVRkbUlP?=
 =?utf-8?B?NCtQdmdSVUR2YlRwZ1I2VmxNaEN5RGI3TDNXWXdsbW9HeWsvbDRGU3AzUDl2?=
 =?utf-8?B?WEtqNGQ0TDdtVVNRdWdxZGNCdE11Y0dKZkJNTlNlakRFL2VncEw4aFAvcnNX?=
 =?utf-8?B?RExpMlVLTGQ2VFJ5cm1mMkRYa1NWdmtjUlFucXRWOGxCUFppenZzNndIYTV3?=
 =?utf-8?Q?RpHgx08xxI7NjUyP+Rv8M35KzcmRvA+95Py58=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTJ1amRSVGN0YzNhN25yMmUyZDhkZHJ2bFlvNWwvdXkzdDM1czBLWDhqZHNw?=
 =?utf-8?B?L1ZHQkg1V09yOTFNYTdYazErZDFXckc5SGk1ZGszTVFxaFR3aStNSllhcnhp?=
 =?utf-8?B?OWYxTDAxeVN2dUxIY3FMVmx5SHNvaW9sdGhBS0JORWtEUjY4OHJMclg1blQ1?=
 =?utf-8?B?WE0wNjZYZm9vLy9sVW8wdUkrcFBHV2NxQ1VkOUlJZUxpVitpOFljUG1sVEkv?=
 =?utf-8?B?NTV6Tkk1U2cvaGcvZ1gzZThMdkJoeEVDYU5RY3ZhTS9UdzZBNzdvUXNuV1lL?=
 =?utf-8?B?blFPOWdObVBtMDE4VVYxSlN3dWFhLytkS1k4U0QrN25LUDBPS3RldHd4TXRw?=
 =?utf-8?B?K0tET3J0dmxzcFpZelpFVFp4S2FkY0pidS9mK205MFFiYS9zMjFHY29US2pO?=
 =?utf-8?B?dXJmdjFrNWIyQ1ladzdQZEdQcjEvYzhvN0VSaTlRTUhDOTFJR2FDaW1JNGdU?=
 =?utf-8?B?L0dCS2tMckdVdmIydEF5V3p0SlJ0RGsxMmZNOVhUNm56UVVqdGlFWlVVTTVT?=
 =?utf-8?B?R0N3NkxCT0pDblNtWjUxVld1MlFScC9VbUNyU1U5aW5RaGEzYUFPYnNqdFpB?=
 =?utf-8?B?ZzkwY2NVUHRrUDlUMmJoWWdBQzRONzd0TE5sL240WmRtQlNEK0FlVS9WN0ND?=
 =?utf-8?B?b1pLODVJYVZKcEFsYWZyM1IzNXFmY09hd21kV09TRnAxbUh5UzBxT25kZUh0?=
 =?utf-8?B?S3JnOXZlZ1BtRUhqbHRxT2JrYUtMVlh0NENDSGlYaGZxeXZjT0R0ZFpjd3k2?=
 =?utf-8?B?V0dlLzBNQUxMclNpM2xuV1NjV0Y0b3F6Mkt3OTFIL1hUSkZjTW5zMWpGbVpp?=
 =?utf-8?B?bG9nTzRDV05ZRjhaOGFrZnRUVzMxOU53dFVBU2lYOVlZTXVHWlNnMHZxVHlJ?=
 =?utf-8?B?L0tUOE05OGFzQythMmR4V21zZEI5M2V0UGIxdDVpR2hnVjBlZFN2UlZFUHFH?=
 =?utf-8?B?dTZHdmgyQUVOU3RRb2EwcTI4bkpMK1NXY0krU2RKbTdlN0kwQnhCd1FHV21z?=
 =?utf-8?B?ZTc0UTliR2MySndjcHI4d2Ntd21OMzVUWGZJQStndmNmMjFTbVpHYUNIaVlp?=
 =?utf-8?B?TWtKL2ZmdlB2NUJobWo1SzJla0NCeSsvODJ5Zlk2K0t6TVJRdVpOcThQN3Mx?=
 =?utf-8?B?TTg5TlVNaHBnc2lPc3FpSGNVVWNOOW5aMDRNVUlhd2I0bTZTSzZ5ejJjQlp4?=
 =?utf-8?B?MWMzQlRCV1VxeUhqSGd4bGZ6dktFc3F1TkpJdmRoTXVIVk5iMWM1R2NLV1JR?=
 =?utf-8?B?SzJSS3pDOWpwSWUySDduRVRqZmNRRXhjdGNTUWlobWlhc1FvOEN6TVJFTzlp?=
 =?utf-8?B?UGg4NklBUjVIalh5QnFERVMwcjZuN0Jrbkp4SEs1QlhwY1YwNW1sTmtaOC9H?=
 =?utf-8?B?NEF6SHhHZmNNWmFLTi96cm56b3VEdTN5dFYxaU9wVHA3ODJPSkoyQS9RY2ZO?=
 =?utf-8?B?TUdtVlZMeG1GRHR5SFRNN29KMVVCbVlJMjFidXhuV0w3VTJMT1pUNE1USUVL?=
 =?utf-8?B?VFdOTTdRSi9wOE56bXhnMWZCb3VmdlNaYTFXZjljdncwSkFWN1IxbUI0bzRW?=
 =?utf-8?B?SmljK2lEbzRpRHVQdDJGRVZieDZCNGdCamRLVmJKSTNJQURmNTA3alJWNmRj?=
 =?utf-8?B?OUpsdG5Iak5mRmRCdjRVeGFSZTFBMHYzV21OeE4xNkFGNmhYSG9KT3YzSTBw?=
 =?utf-8?B?ckoyY3BIZy9qS05RU243bjl2OE1tUGE2aDhjZStxZ092UE5uT2pJWHdYcm9x?=
 =?utf-8?B?aVdqdkYwdlFTNWovZEVYZjZDVVdrRlhNZjlia2ZZQkdmR0tINi90S0s3ZUZW?=
 =?utf-8?B?WHA0bW5mZldXMURhYWxFQ1k4bkxmR3BCcFRBV3ZxcFVGeU5TLzZFYzNodkhr?=
 =?utf-8?B?K0NVdlpxMkpIbCtBSGFDVFlNUGxkY0hFTWRSb2wvamNVZ0FTbEd5ck0xTG4z?=
 =?utf-8?B?VlBiZnBqbXh6K0V2K203Zmd4bU85Z0pXVVhVQklFSHRhMjVoNFpnVlRrcHor?=
 =?utf-8?B?SXE2Y29tWkdoOVhHajFXVmwwS1hTT2FhQlY3VlhXUGNVSktLY1JKU0w5M2Fx?=
 =?utf-8?B?THJwMUxTUkpkODhrbXk2WUZyNmExMW9WU1NieGw1MWFMd3RBNHNtaitDYjNW?=
 =?utf-8?B?dHlpekpjcUFFcG1ZM2RqeU1sU1IwdUczR3hTU1QvWUdaM2Z3M1JWTFlvKzhj?=
 =?utf-8?Q?VT9LOKJdw7U1kKec0XXhZx8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ec6a64-f175-4c20-e770-08ddd9c8fc54
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 17:52:20.8379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aeDXlDfKMHXSvc6loRexamlcaRazCwQFP5BEOro+VFuBWdewc3u93nPquBH/tBdkQmY6sPoiUx+klT2Itm6dpTEIovDY3uQlpdFqrWvG/kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6783
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



On 12-08-2025 21:36, Danilo Krummrich wrote:
> On Mon Aug 11, 2025 at 8:52 AM CEST, Himal Prasad Ghimiray wrote:
>> On 09-08-2025 18:53, Danilo Krummrich wrote:
>> Possible scenarios for ops functionality based on input start and end
>> address from user:
>>
>> a) User-provided range is a subset of an existing drm_gpuva
>> Expected Result: Same behavior as the default sm_map logic.
>> Reference: Case 1 from [1].
>>
>> b) Either start or end (but not both) is not aligned with a drm_gpuva
>> boundary
>> Expected Result: One REMAP and one MAP operation.
>> Reference: Case 3 from [1].
>>
>> Existing GPUVMAs:
>>
>>            drm_gpuva1                        drm_gpuva2
>> 	[a----------------------------b-1][b-------------------c-1]
>>
>> User Input to ops:
>>     start = inside drm_gpuva1
>>     end   = exactly at c-1 (end of drm_gpuva2)
>>
>> Resulting Mapping:
>> 	drm_gpuva1:pre       drm_gpuva:New map     drm_gpuva2
>> 	[a---------start-1][start------- b-1] [b------------c-1]
>>
>> Ops Created:
>>     REMAP:UNMAP drm_gpuva1 a to b
>>     REMAP:PREV a to start - 1
>>     MAP: start to b-1
>>
>> Note: No unmap of drm_gpuvma2 and no merging of New map and drm_gpuva2.
>>
>> c) Both start and end are not aligned with drm_gpuva boundaries, and
>> they fall within different drm_gpuva regions
>> Expected Result: Two REMAP operations and two MAP operations.
>> Reference: Case 2 from [1].
>>
>>
>> d) User-provided range does not overlap with any existing drm_gpuva
>> Expected Result: No operations.
>> start and end exactly match the boundaries of one or more existing
>> drm_gpuva regions
>>
>> e) This includes cases where start is at the beginning of drm_gpuva1 and
>> end is at the end of drm_gpuva2 (drm_gpuva1 and drm_gpuva2 can be same
>> or different).
>> Expected Result: No operations
>>
>> [1]
>> https://lore.kernel.org/intel-xe/4203f450-4b49-401d-81a8-cdcca02035f9@intel.com/
> 
> <snip>
> 
>> I’ve tried to explain the behavior/usecase with madvise and expected
>> outcomes of the ops logic in detail in [1]. Could you please take a
>> moment to review that and let me know if the explanation is sufficient
>> or if any part needs further clarification?
> 
> Thanks a lot for writing this up!
> 
> I think this clarifies everything, the examples from [1] are good (sorry that
> your reply from the RFC got lost somehow on my end).
> 
>>> Please add a separate section about madvise operations to the documentation at
>>> the beginning of the drivers/gpu/drm/drm_gpuvm.c file.
>>
>> Sure will do that.
> 
> Great, this will help users (as well as reviewers) a lot. Please also add your
> examples from [1] to this entry, similar to the existing examples for sm_map.
> 
>>>> v2
>>>> - use drm_gpuvm_sm_map_ops_create with flags instead of defining new
>>>>     ops_create (Danilo)
>>>
>>> If this turns out not to be what I thought semantically and we still agree it's
>>> the correct approach, I think I have to take this back and it should indeed be
>>> an entirely separate code path. But let's wait for your answers above.
> 
> Having the correct understanding of how this is supposed to work (and seeing how
> the code turns out) I think it's still OK to integrate it into sm_map().
> 
> However, it probably makes sense to factor out the code into a common function
> and then build the madvise() and sm_map() functions on top of it.

__drm_gpuvm_sm_map is that common function, and does 
drm_gpuvm_madvise_ops_create sound OK? With separate functions for 
sm_map and madvise, I see there's no need to add a flag to 
drm_gpuvm_map_req at this moment. I will drop [1] in the next version.

[1] https://patchwork.freedesktop.org/patch/667561/?series=149550&rev=6

Thanks
> 
> Please also find some more comments on the patch itself.
> 
>>> Again, I really think this needs some proper documentation like in the
>>> "DOC: Split and Merge" documentation section.
>>
>> Sure
> 
> Thanks!

