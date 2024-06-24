Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB6C9149BF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 14:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A916D10E417;
	Mon, 24 Jun 2024 12:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lxuoAZNA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B88510E099;
 Mon, 24 Jun 2024 12:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719231851; x=1750767851;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uEYhFiwPQe3TWtEBqok+gGl7gSszwcw3FABMp3/eA0c=;
 b=lxuoAZNAHxCgjjk/pzknW9TPBv2Vev/yqjaVWGj0oCkEtQdwQ5UgJGTm
 iWOolJG8ToBwGqRyGdOTRq05KfufioO0VhEQgmFai+/9ySTW6rHYWKG8P
 eN1tIpKWZIgH4q1xuXZvmxN5H/d3J48N7faRbEbb5QrTlJ83zgHco+Ueu
 hsto0dsnhWu1rKAAF65LJou/WwhDOuRPSp1r1Z9/punIRk9sBCitZ39a/
 pllDQiEqjIYb70yS3X0oiYL+hbN1MzUDULg3X4rBw0cm0vPPl0VmZiR1m
 RIEZu2FH3ad7gzwl3TEOnWkLThz1mphoifUrmWTRVWKvm+8YBZSuIdI3H w==;
X-CSE-ConnectionGUID: ed6KZgUrRYCmIWVDKyZl0w==
X-CSE-MsgGUID: xLAJR1Q2RUO4KUWq5zyY/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="26788601"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="26788601"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:24:10 -0700
X-CSE-ConnectionGUID: V8z3iUMFQsmlQ71Na2yZrw==
X-CSE-MsgGUID: TXXVG0jmSWSqIAMeUMsqrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="43093526"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 05:24:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 05:24:08 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 05:24:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 05:24:08 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 05:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9SZbXq0C6g/vsM3WcL3HVpOP+Fw34iNzmrhLV0LFPVR+7+TNrqMHrDZiBuamiK6wX7LgkaZCjpnqiPilaMXzzLq6WWovwqapP/jHHukUPgaYFZUPUf/DIah0UX8nx/5UdnKjAbJyDQ8YTtTaMYZqDdIg2VTPGKJYLNRA6TcY3Cc1Y9FOZH//yhSUOcEooH09X0C4QogePYkOCir9MlOkdPBmgwbZWqF8ESXAgnDkCszHMNQSJtXI4Hpi0BoYexIrn+3MZzvpfHqIVKbWLZdT9HRvRWgwVFjlW0zTNOE64dbe7QAJ1tNEzDexkyYo4p+6lmWHoe/Yzl2TZp3kZo/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ivr9Z4zzJJK6178db8Am+MRcM9ulAppHp+6yiJ3dBg4=;
 b=Hfpd/nEwQ9et0mFwKujjRUpe760dzxxKL/amz2RAbXKKYkQ+TECOnzuO+jj1nbrYkUP1LcwP/6PFTbL3G+koFDcHuFduZXxtNMiTeFXVxmKYDJsmh7uo2zvGKN+XB6pidal5LkdPszbAEYoU42B86mXT/zOkIfskQwNwkmij76JdAW313R5UbcQumgtfLY5Ss3n6CN/2iBJapMwv9sbJWXK+LaRfHfhnJx0FGK0jYtT0nZ/NgLvT5m29WDL1mSuv0JwixZtI5fdvHSVbtnuUY2bGt06AEZWd+UEyNpaeM9XbJM2cRcGFlGHAtEgtndc+kiDn92at/8RBkH5RUcV8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 LV8PR11MB8462.namprd11.prod.outlook.com (2603:10b6:408:1e8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38; Mon, 24 Jun
 2024 12:24:05 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 12:24:05 +0000
Message-ID: <8f4e5ac2-a3cc-47ca-bf12-da96086e5862@intel.com>
Date: Mon, 24 Jun 2024 14:24:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Add a flag to allow drivers to skip clear-on-free
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240624100721.24331-1-nirmoy.das@intel.com>
 <7d576b58-81f7-4f2c-8932-70b96764c634@amd.com>
 <dd330f73-d83f-4894-a48b-aa2ad004a82e@intel.com>
 <2f5884bb-7eca-4273-8bc6-c376341ee930@amd.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <2f5884bb-7eca-4273-8bc6-c376341ee930@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0197.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::11) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|LV8PR11MB8462:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa8539c-ae39-45f0-ad88-08dc94488a0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WU1UOEdHcjR0SEdacndJeDVWYi9mNGlFbm50cGNPNEhkeVR4TWlLaGpBSy84?=
 =?utf-8?B?UlRJa3FlUmpFVGFlaFlYK1dqUURFWExyeW1aN2dNRmJ3WVpiT2Qyb2Q0bmxO?=
 =?utf-8?B?RUJ1dDhBcWVmRk8vWFF1bFpYOVlhbC9DdEY4dU1pYVlMaXJqem9Ca0JWejVo?=
 =?utf-8?B?eVpKTFBRWFJDZTBoTER5SmtVR1ZIaFNDakRxY2wvbnoxcndoaWhSei90N1NZ?=
 =?utf-8?B?cWxlMjNRdVQ2bzc5VnJHcWRQbXhzbnlPYkRYbzBZYTJYQWNaWDFydmdhNGM0?=
 =?utf-8?B?MjV1VER1Z2pnY1RCZDNENitGM1NQS29RODduSHJ4K2tjTG1nRGhWaFBwLzJW?=
 =?utf-8?B?alVKVWhUWlpOY0dEcng4RGJpNFRRL3oxUlFLb2dVYngzV0F4dTNtSERaLzc0?=
 =?utf-8?B?TmhtZkI2SnBJOEpSbTBEYVRDUXBWbXpzd3NYZXQyeVpsdUtvUVBTdEgrd0tB?=
 =?utf-8?B?Q3JQLytzcy9aWlhwTUI5ekhTYmF0aExQVnFtbUpqWXFsMjlOTkJjbCtCQUhM?=
 =?utf-8?B?UVVnRkhHK3Rob3A2Z0lXNEowZEZ1cE54VkF1VDNJNVByeDNCSTVtNFovdGs0?=
 =?utf-8?B?UG9zZXg4NzFncnNEZlZGVGZuUjF0NTUvUTlJcis4TGpWaWFBMFB5a1BIZEwv?=
 =?utf-8?B?cElOV28vUmtnRlZQU0FNTjE1UFJyYVNUL3B4V0Z6aFJNeVZuenVXV3FaY2l5?=
 =?utf-8?B?V3cwNWZUdElxb2cyN3VYU3ozSUtQSHFFak5pYTMvQWJ1S0JWb1lpWW9VYXlU?=
 =?utf-8?B?MDZHa1lEOVBOTDJkQlNYR3FBZE8vOUpkT0dRZHdiQm9Gdks1R2pvOE1INnBP?=
 =?utf-8?B?L3c3ajVraERHeFArc2pLanhiYVRWaUJxNWhLeVpEamErWXdpclBOMXBLYkZs?=
 =?utf-8?B?aC9GckhJQ1JkNkYwdEFubWFoZitFLzZET2tMTE1iS0tLbDBFaU5INzNLcHNT?=
 =?utf-8?B?ZUQ5V2YvemVObEM0aXVkWXNhNHRaUEJYRXBZSUFoNXJNTVZQQk9pbWFhc2xz?=
 =?utf-8?B?a2xoemQ0ejJtcDVEUjFnN1RVNERMQ0M0NmtpTjg2TG4rYWNXdWU0NHM3Tks5?=
 =?utf-8?B?SFh6bjdUWklnKzRlaTlPcjBEUzNUNmxYckFvQThFblBZbzUyaHI2cWozQ0t1?=
 =?utf-8?B?Wk1Tek0veHNEbit5UkhOVTZEZUVpRElBcHplMFAvS3NtTkV1cDZEbDdxYVNO?=
 =?utf-8?B?TDVSUE5vNDJYOGRFa3pTL3VjN3BTeTBVcEJyeW9OZ3VFaTRXYi82elpWVXJs?=
 =?utf-8?B?dGZmWDlsbXZyVU9VQmI2WEo5bVJWaUJ0a1l1cGZIOU5MVHlSbHkySk5pVHZ3?=
 =?utf-8?B?WTQ1Y1dhWnZaeDdXSjVhR0R5RHYvSTIzZUpxS01Nc1RGT3RudGpqT0p1aEZx?=
 =?utf-8?B?WWJVNUZXMkp4RVh6NUYrM3JkVW9RVktiTElBTGNiZ0F4VUk5QmlvS2JNaHRN?=
 =?utf-8?B?Z0Z2T3l5ZmtFbEl2aE9FSEl6c0JHZlUvb29neXhiNFNqaW1DNWg5cUZYUlFn?=
 =?utf-8?B?ek1qWTZNdmFLRjhOa3pYWU9NR0I3WHBCeGd6aUQvM3AyREo4MkcrTXFpOE1R?=
 =?utf-8?B?WmtqV2RrUU1Dc21wS2hkZnBXQ3ZoeWtWWEwyUDFzSm1IWUxFUnhGVGFGWkdV?=
 =?utf-8?B?STc1UWF3dUhDRGtROUJxNzJvNVJoVzdSYlNyTUZKWFZPRFdOeWpFNUw1aDRy?=
 =?utf-8?B?UzBCVGpwYmlPV2w2QTJ3M2V4OEMvUGd0cGVOTGV3OGsxcDZyMzk4ek0xMUZr?=
 =?utf-8?Q?lTqTLzwmbvYizGbfCZ0JVpFt1J3i+cnGDWaq+lN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDZtNXJkUSswYVlHMCsyVGkwM3pFL0Mwd2tnclpXdm8xMlRqNDQrL2dNNUVl?=
 =?utf-8?B?THI0OVNRVlc3eXgvODBRYlVna2ZWNHZJanZqcTFZc3pDZHlab0dKd0treWZR?=
 =?utf-8?B?Nld6Q1RCQXNlVkN3QlhkemwwK2NpUE5ralRnWWU3YnIrTDJTbVZtaHFia0dC?=
 =?utf-8?B?RUszbjFtMzcwbFJHWDVFd1lvMzY4Nnc4K2hsMTFVcUhxNWxMeFFpTXphVkdP?=
 =?utf-8?B?cW1XNWQ0Tk9Na0ZxcFlyU1lpYnpGbmFBMDQwRnNnUDlnK2VKTmhDSzdCZVNU?=
 =?utf-8?B?R3dYdlFTWW1LbU1YN1ZkUDhHQk1Pekt4d25yeHJ6NXR4akdEYVJ5Z0NwZHh6?=
 =?utf-8?B?Rll1bmwwODhhdGFJMG43QmZhNVVpbXJnU1ZpbUdXSEtCa0ZHaCtpVWV0M1dq?=
 =?utf-8?B?TzBqYUNuUXNvaHM4U0MzdDFNUk1mOXFaTkFkY1JJakhPcnVtZVNkc3VSVlVX?=
 =?utf-8?B?QytkZ0pkU1Ryb1BvRUNSbWlSc0wxbEord1B2dFl3YU9IR1VBYm9jcGE5NGJ4?=
 =?utf-8?B?ZUNCVFd6cWFITEROZWVVOHRVVWZwUG9SeUluU2RSWVlaVGhFL29YcGx2c3BL?=
 =?utf-8?B?S3VCQi9MbEFEaXlMWi9WalZXbzJETHlkOXNaUXlaemhCSDFBa0ZlYXN0YUJm?=
 =?utf-8?B?SVJHSWZTaC9JZ2ViTW0vZXdrV0N2UWxMZm15bU44b0EzOE1lbUJTMjFVVHpQ?=
 =?utf-8?B?M05lVUZBRFlrYUlVT3pFWHMyN3paaGt2QmcvRm91aCtmNnQramNkVy9jWi9G?=
 =?utf-8?B?dU0wd202QWVwdkNlbERjZEVDZGk5ZDJELzJKcXNmMmFRYnNwaURQUVUrdVRv?=
 =?utf-8?B?Vmc5b1E5V1YxOVhwR0R4K081STR1L2FOSUpsMElXNi9SNFQ3eStudk5zR3l5?=
 =?utf-8?B?b3Juem9qamRjb1d2RVZPd3ViYStHWmpTZDNvOXI0Qkg1VmhwbjNHWVhjc2pa?=
 =?utf-8?B?N0IxQmhZWFdrcTRzWnF6bCtlMGlyQXRsalFzM1NPTld1ek5XdWN5VUtDOXFa?=
 =?utf-8?B?bHU4d25lWU03V1RqY0RSZXNsNkRaOXhzK0RuWU5tREE5SEJsTHZBWU1OcGhY?=
 =?utf-8?B?bG83bGhhWDZWM09wclF6UGdDTmJKS3JPL2hzbC9jcG9nZEczalkvalplYzVT?=
 =?utf-8?B?M1pvN3R4YnFMdlh0THV3cTZJdnE5bW5Kb1ZKZFdyVWYwelhtTGN1aENNT0dQ?=
 =?utf-8?B?OEVhVnhINlR2akRMdjU4RGdlbnNoSkNDSFNWVERLYUpjdzdHV0xDUHBuM0Qr?=
 =?utf-8?B?T2JablhDV1FoMGZJRGFWV0d4NW1zWE1pclZEcjExbnEvcndyRHlsQ0x1K2w4?=
 =?utf-8?B?T2ZpWXJpQlFUS1FPRzVrVDRXR1lEVmMwSkJONzhHb1RBTlQ0WGhWOE9mNjBE?=
 =?utf-8?B?K25KbXRxZ1BXcHdieTBCSUo0dGpZeUV2bHNMR05pZ0EvT3V2NlE2eTFOVmU5?=
 =?utf-8?B?KzhINXFOaWpIQ213MFFTYTViSFZGaHorcTE0OHJwdVlveGNrNk9FNW1kV1pJ?=
 =?utf-8?B?bVpPOFV3VVFCcnRaRmRDTHN3dHN4QW5yV0JLVEpOclNtWGpDYnZpTVQ0RHRa?=
 =?utf-8?B?NFRFRGl6cEpjZElNNGI0MlBmWC95Q1JRSkgvbTNiNnhzMk9GRjVybnJITVlQ?=
 =?utf-8?B?akMyNjNWZ1p6L1pxMXY3aEdWME9GdEhjeGo4amdXM1JYdWNJcVBHRmt4cGYv?=
 =?utf-8?B?WFh4L2pKTjkxRjVubEt1ZTdXdmhJWHFSUEV1YXJtVWdFQUZJdXJBNGVGU1F5?=
 =?utf-8?B?SmZ3Q3gwUmJLS0pWa3JNRzUrSkNvTVl3ZWd4QjVYYUJVcjhHbXpILzBOdXRM?=
 =?utf-8?B?RnF0cU5QWGxNczhNYnlDTTQzRGxtNzhKZDNvMWN1TENPMmVnNWRjMDBoL0ty?=
 =?utf-8?B?Skl2Z1ljTDh1MHNFd2thRU5ia1k1TGZwZlk4R0tXb3hLTGp5cjh5cE1TdWNK?=
 =?utf-8?B?VTF4aFgxajdPSXQ4S3RJZXNMV0k1am9yenRFR0FNYUVTSEFlMHBiRnNZWUtO?=
 =?utf-8?B?UW9lazQ5d2pqRnh0ZTg1SkVLRWhqbjVVZlM5TktrMGNwT1hXNmMybmFsQnRr?=
 =?utf-8?B?NWJQRis0cDRoam16VGs4bUViUEJWQU5nSFgyc3lsenZzVmxFTXQxTFh5ajA1?=
 =?utf-8?Q?1tD2/wrzegaGZZYAdOeGY8Vmx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa8539c-ae39-45f0-ad88-08dc94488a0b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 12:24:05.6240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NWpoDfHXTn3w+e1Xt7oBzAsvYhuw6cxqMlSd8SG61K5lgfxDsTY/2kqxHdpCJKYfXbqKVc1xgsw+zge4pSFCYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8462
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

Hi Christian,

On 6/24/2024 2:21 PM, Christian König wrote:
> Am 24.06.24 um 14:19 schrieb Nirmoy Das:
>> Hi Christian,
>>
>> On 6/24/2024 1:39 PM, Christian König wrote:
>>> Am 24.06.24 um 12:07 schrieb Nirmoy Das:
>>>> Add TTM_TT_FLAG_CLEARED_ON_FREE, which DRM drivers can set before
>>>> releasing backing stores if they want to skip clear-on-free.
>>>>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Thanks a lot. Could you also please help get this merge ?
>
> I can push it to drm-misc-next, but for that I also need a patch 
> actually using it.

Ah okay.


>
> On the other hand feel free to merge that through the i915 or xe 
> branch as well. The patch is small enough so that it probably won't 
> cause any merge conflict.

I need to polish the XE patch a bit. I will get that merge through xe 
branch then.


Thanks,

Nirmoy

>
> Regards,
> Christian.
>
>>
>>
>> Regards,
>>
>> Nirmoy
>>
>>>
>>>> ---
>>>>   drivers/gpu/drm/ttm/ttm_pool.c | 18 +++++++++++-------
>>>>   include/drm/ttm/ttm_tt.h       |  6 +++++-
>>>>   2 files changed, 16 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c 
>>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>>> index 6e1fd6985ffc..b78ee7524bcf 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>>> @@ -222,15 +222,18 @@ static void ttm_pool_unmap(struct ttm_pool 
>>>> *pool, dma_addr_t dma_addr,
>>>>   }
>>>>     /* Give pages into a specific pool_type */
>>>> -static void ttm_pool_type_give(struct ttm_pool_type *pt, struct 
>>>> page *p)
>>>> +static void ttm_pool_type_give(struct ttm_pool_type *pt, struct 
>>>> page *p,
>>>> +                   bool cleared)
>>>>   {
>>>>       unsigned int i, num_pages = 1 << pt->order;
>>>>   -    for (i = 0; i < num_pages; ++i) {
>>>> -        if (PageHighMem(p))
>>>> -            clear_highpage(p + i);
>>>> -        else
>>>> -            clear_page(page_address(p + i));
>>>> +    if (!cleared) {
>>>> +        for (i = 0; i < num_pages; ++i) {
>>>> +            if (PageHighMem(p))
>>>> +                clear_highpage(p + i);
>>>> +            else
>>>> +                clear_page(page_address(p + i));
>>>> +        }
>>>>       }
>>>>         spin_lock(&pt->lock);
>>>> @@ -394,6 +397,7 @@ static void ttm_pool_free_range(struct ttm_pool 
>>>> *pool, struct ttm_tt *tt,
>>>>                   pgoff_t start_page, pgoff_t end_page)
>>>>   {
>>>>       struct page **pages = &tt->pages[start_page];
>>>> +    bool cleared = tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE;
>>>>       unsigned int order;
>>>>       pgoff_t i, nr;
>>>>   @@ -407,7 +411,7 @@ static void ttm_pool_free_range(struct 
>>>> ttm_pool *pool, struct ttm_tt *tt,
>>>>             pt = ttm_pool_select_type(pool, caching, order);
>>>>           if (pt)
>>>> -            ttm_pool_type_give(pt, *pages);
>>>> +            ttm_pool_type_give(pt, *pages, cleared);
>>>>           else
>>>>               ttm_pool_free_page(pool, caching, order, *pages);
>>>>       }
>>>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>>>> index 2b9d856ff388..cfaf49de2419 100644
>>>> --- a/include/drm/ttm/ttm_tt.h
>>>> +++ b/include/drm/ttm/ttm_tt.h
>>>> @@ -85,6 +85,9 @@ struct ttm_tt {
>>>>        * fault handling abuses the DMA api a bit and dma_map_attrs 
>>>> can't be
>>>>        * used to assure pgprot always matches.
>>>>        *
>>>> +     * TTM_TT_FLAG_CLEARED_ON_FREE: Set this if a drm driver handles
>>>> +     * clearing backing store
>>>> +     *
>>>>        * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. 
>>>> This is
>>>>        * set by TTM after ttm_tt_populate() has successfully 
>>>> returned, and is
>>>>        * then unset when TTM calls ttm_tt_unpopulate().
>>>> @@ -94,8 +97,9 @@ struct ttm_tt {
>>>>   #define TTM_TT_FLAG_EXTERNAL        BIT(2)
>>>>   #define TTM_TT_FLAG_EXTERNAL_MAPPABLE    BIT(3)
>>>>   #define TTM_TT_FLAG_DECRYPTED        BIT(4)
>>>> +#define TTM_TT_FLAG_CLEARED_ON_FREE    BIT(5)
>>>>   -#define TTM_TT_FLAG_PRIV_POPULATED    BIT(5)
>>>> +#define TTM_TT_FLAG_PRIV_POPULATED    BIT(6)
>>>>       uint32_t page_flags;
>>>>       /** @num_pages: Number of pages in the page array. */
>>>>       uint32_t num_pages;
>>>
>
