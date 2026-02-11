Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NRzN5iajGlkrgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:04:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AED31256AB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 16:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D654E10E5FC;
	Wed, 11 Feb 2026 15:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BGTDOS5M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010024.outbound.protection.outlook.com [52.101.201.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CE010E081;
 Wed, 11 Feb 2026 15:04:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0DKvSEz6s2+WpDIbeRuBiNeT1FJlmpMee2Ms2JvYiNwtGoKyDF7xpHgPitOEtjaalZMxkX/6Y04wFK/uh0KqFfkG97JmS4jNev1dhcqFTk/IXpx4g0WoKMbnxEcC6W0rc/IVkNA+x8OmczMk24lwRHRe41dWuJDxI9ogSUA+do9E9TPtbJk2eLLh7ALzYIREPnyxG9zlHr51KpvrOWZQET6VDdQv3ndfdVTyhnFgdojJalpir7eq+kS8AUhVqHtdjzxa4RT6wMSr5KUnf1c3iKMP1iDa5H/a343pCIXKtStIgNtmIrQP9y5JqaIynl1E/Ink8mg/O79f4vV0LQObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZTEhLHUMdttZFp097p8Vt8dIq44ocsJj2X9BliuBho=;
 b=X9GsqXbR54VgTi0hUFomUxbMRekeaTdwS0rsCUFpPqOV0UrC13Y+uTEb7XKD4pmwJ/v/4kyFOPKU4/y9uBbpipt2CLP+TNaydpMoO19bV0MfUQaGC3AHZXJSOrjvCckouUB0UUjre08VULJ2FuO7QTgnRFGOS+YqZsiY6Iy/ql2Xf6oYYBjfAiKvmcbn+0hprQagVl3Xvj0B71eK8Gmxbu60k14QaUaQLZXhHUCscHSuDNiZPqQbJ/jcMsgBOfhMkbDYd0b3MVLwLrj2HhyMkGx0rRQahjNly+A/e6Do2GiPTe9eOjtsI2OiLWCVWlAzyBe12slspf1v//9fziXn+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZTEhLHUMdttZFp097p8Vt8dIq44ocsJj2X9BliuBho=;
 b=BGTDOS5MPETZ93GNOABU92Jc08NdgJ59Og2WqxIc4QHKHsJdOZJQIH4iF+5lsiFfnpKhm0sUD2SW1IDJ21bXUdnLfd/OPdxm0T14ZX1N1T77CRE3TzoTbZUKqH8Pg3V+1pSo7J0NpTG58v8qMfi0kIzOKm2hyZG5ndkEf2Y9viA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4105.namprd12.prod.outlook.com (2603:10b6:5:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Wed, 11 Feb
 2026 15:04:47 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 15:04:47 +0000
Message-ID: <5e3cbeb9-bd22-47e8-9780-fe575e50eab8@amd.com>
Date: Wed, 11 Feb 2026 09:04:41 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: add module param to disable immediate
 vblank off
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Michele Palazzi <sysdadmin@m1k.cloud>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 Rodrigo.Siqueira@igalia.com, alex.hung@amd.com, aurabindo.pillai@amd.com
References: <20260211074529.131290-1-sysdadmin@m1k.cloud>
 <2026021146-mockup-pushup-5f47@gregkh>
 <7a1fa826-cddc-4f8d-ae45-afe6ddecd6e0@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <7a1fa826-cddc-4f8d-ae45-afe6ddecd6e0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0035.namprd11.prod.outlook.com
 (2603:10b6:806:d0::10) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB4105:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d36854b-1664-4313-f48e-08de697ee5b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UE8waVdNR0pXdUdUT2lCUWFRNEp0cDBqMklVSXVUVmtWSmJqcVR6VVk0Qk9V?=
 =?utf-8?B?cmVBTkdLTUpnOVpPSDRHNDJlbVBjRVFFSFVhMGxZNU5ZV0s4b2htQWVPWDZm?=
 =?utf-8?B?Y0haL01wM0o1ajJUL2tGU1hCeDVVV052Y01MSGcxcEU5emY0UVYzeTdsQ1Nq?=
 =?utf-8?B?eUhXOGFTcmJnWHZ3WlNZbTBvdFRWcmxQR1FMTG1qSllqQ21VQ21FT01BQ3gz?=
 =?utf-8?B?NnArWXIzUzFGZkd6dm9pdlRaeFJadTZkWk5NUWZxOWRhK2wrRXVpUHZtemJh?=
 =?utf-8?B?T1QxL2Exc0lVbk1mNTlCTUlia1M3WVFXV1hmc0pFOVIyRFR1VHBvMktRSHFl?=
 =?utf-8?B?dVYxMGZYNGhONkxOeFE0Nzh4NXdnVnYrSTlUSkM0enpydGxOS2NIWmtVVXpR?=
 =?utf-8?B?dTc1U0h5RVlrWStuMXdQYWRxRjdVUS95Q3RIa3RNWFgwRGVxTU16d1pNdzRL?=
 =?utf-8?B?ZG1pZCtMWUFnWm5IREFZWWVlbklNWGQxdEFUZlRjampHNG1qOHErSU14VmVy?=
 =?utf-8?B?Z1pnakpibHpiNE5TUEhjWFR6L1FvcWRPSUxhL3UvRVBMUTdNYmdkMmVOcDB0?=
 =?utf-8?B?MXJZMHorYUMranozN2JHOW8rYTJDMXpuUVdNd2lnV0JaVTRibVpMaVlFcHp4?=
 =?utf-8?B?dXhyVU1QOTJpdXJGaWF1OXlJYzNDT1VKckN4TEI5RElVa0JLYVUwQkxMUFIv?=
 =?utf-8?B?eS9oTTdzYXFiOWlyVDNWTnV1YWRuUG8rV2VDSENoTzNLRVg2cTVaNHFBenFq?=
 =?utf-8?B?eHkvQ2JqbW92T09sNkVUNFBVdmZCb0d3OWtoY1NlendUeG5MamFxYk41dGRX?=
 =?utf-8?B?eDJweEJyVjZ2RlVaZTVZMUtEckxzWXI5bXdGUmpPWlF3blpWblhiK1RiK2hH?=
 =?utf-8?B?TVRROFR1RFdGeW0rVjRyWmQ5Z3VzQ1RrMjZiT1ZraVFEb0ZsMkR5Q0xOdjA5?=
 =?utf-8?B?WjVWUFVtVTNLdFNXUmRXaE5oN0x0MjFEcEYrOHJKLzdJbGlZRDZ0QlB0OWFV?=
 =?utf-8?B?NFZ3emJwNUFHTFI2MHBuKzBmK2Jab0F3Zkk2LzN4QXZNaU5tYitxSjY4M0hW?=
 =?utf-8?B?c0RyaEpaOHlGWkpmYVJLNXRMZXFHY0lEOUhkRytFcllWcHBYenNOdmJPd2pH?=
 =?utf-8?B?WC9xaUpld3dOVEs5NzdVY1NaQ0lZWE5meldzSW1JdTk2SkM1OHk2NlFEdFUy?=
 =?utf-8?B?Y21NbnA3ajZWT0hoY2lPZ0t6Q1hDQ002QTZNQzlWQTd1MitiNHo2TnFPNXpj?=
 =?utf-8?B?L0U4WGdtSGtBaTF5c0tYbHY4TEtRYWNYVXd6d2djNkpyV1M1QkswNjlJUWMy?=
 =?utf-8?B?c2UyaktaU1VySjFXOGNsSVF5QmtORWFHUWhFSW9zQkRqdStSRWdremxrdzVs?=
 =?utf-8?B?cC91YjMyOU5mQ2syWFpUQnFGNFppQTdkR3ZnUHcwUmRzMzNLMFBSN0hscFZo?=
 =?utf-8?B?cVhCVnN2QVhCbnRJRDFsSk1oSEgxcmRnS1RZZTROTFJrU2VONEY2YklKUWlG?=
 =?utf-8?B?WWlsTDR6cXlSeXJMY0cwNHA3VjRGTjhzRkJWVS8rS3Q3eU5adzloV0Vhb0VL?=
 =?utf-8?B?cE5mZGpDZXR1dWR4OHY1dDRXdytDT1N6OUlqM1JqSURnZURoaHQ3NVpjVTN5?=
 =?utf-8?B?ZlM4bGZhdVNzbFdRMW5RcTVkWTFPWlc4ajRkNGRsbUZTOER1cWdRZjZ2eUo1?=
 =?utf-8?B?a3JMOXM5S1AyRkZZQWRRd0pSK1VOdGY4MThQRkxyMDVXQUV1dWxYd0Jqektm?=
 =?utf-8?B?dTZmR09sdHdtWmtkcFdZRmxRNks5Q2wxVndGNFJrUGQyK0VxZ3gxcFQvTU1S?=
 =?utf-8?B?L0IwZTh3K1gvc295cSszbVNYNlMrUkFPZElDdXRzSnU2RWU3V2ZmQzlXZUdQ?=
 =?utf-8?B?TGtMZTNxQlZLM2Z2Nk5nRzhrVkkyNmlVUndVd3UxZkNZRTd5L3NRcXBOV1JH?=
 =?utf-8?B?cTUrd0RBRFd4UTJGQ0pZcTJUZC9ESUtoeGhHS0c2MDdZMktBdUNKWFVpaVNy?=
 =?utf-8?B?QWl6NzBYRG5wNVVhVEU2NjhSS1NJSWIxZnZOeC83OEdsTHEzV3N6WVhDTXlh?=
 =?utf-8?B?YlpVTk5zMSs5cmxsQzVZQURoVGg2azBQc09acGRTZlRpUmFid0g3K3k4YUg4?=
 =?utf-8?Q?tXvg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmlnU2RsUEk3OE1SNGVJeEVPRTVTZWNpMmQwVXFVVjNmcWZ2MTV5UzFtcXNO?=
 =?utf-8?B?ejlWQlAwdUh5OC9rc0lrRXZKWWl4KzRSVXMwRndHSng0K29vOXRVb1BtZUh4?=
 =?utf-8?B?UUVzNlpNMS83T1V1T2VUSkY5M0I0RXRTNlh3Z2pRRVRsNDYrMXVFdDFzQytU?=
 =?utf-8?B?WWVpVEUzUnZNN1d6TFF0YVV1SlV3TjVHVUwvbHgyM3JqczErejNvVzZkY0ZF?=
 =?utf-8?B?aWdvN05hdnF0TWI1TE5sbXlCUStMZU1BNndXcGlNdUYrbklDVnVxWVNhMnpm?=
 =?utf-8?B?S2duVEdqenl1aFlXSnV5L1YyVnFsTk11TnBBOVRNRE10eE5zNGxneFM5TktQ?=
 =?utf-8?B?UnVwQ1FXazNtdHp4UXJvVnp6S0Z6MFFpcmhDNFQvaHUvT0kzcDFxNkdsVDB1?=
 =?utf-8?B?Mzc1aUJoRnpCcWFaRVllRGtxbGlEYWx0MUI4V3FIMW9GNldaeittcVhyd3Bp?=
 =?utf-8?B?LzdBQXliVmw1NzdlSVJDb3YzMDd5L3BGN2tsdkZrZlFJcnZ2SEhZa28vWVBI?=
 =?utf-8?B?em5uODRyRjkrQkpLdmpCWTdYdEpYRzc2UUU4S29jeVZVZXFLeTBvaFpDb1Rn?=
 =?utf-8?B?Y0xBMzlROW5ITzZyYjBzMEZRbjIvQXZBdUpYWUpGc3RJTER6NmhTb3QvRG9E?=
 =?utf-8?B?ZC9VZTdGbU9ZamowYnB2TFUraXhLd2pCUmRPQ1pjSUowMldNd091MjE4bXhp?=
 =?utf-8?B?d005M2xoNVR0OVM3c2ptU3BuUGR4cHVuM2EzSktUTkJ3QURuYmtZb2ZkU2dY?=
 =?utf-8?B?bGJnWFU2U1NBZkdqd3pXUWdmMzZwSkl6RFBVRURNaDRxdnEwVC83b0N6cjBJ?=
 =?utf-8?B?WTl0WkRTRGwwYWJCYkZWZ0ZoSXdVMkZoWkhGTTJIS3NtckZCUVBPMmFLVWFq?=
 =?utf-8?B?YUJLdTZtTjFNU1hvN1NGK3R3SnpmNnh1ZHpGQ1RoeHNXd0ZvYnY3bnVSZ01X?=
 =?utf-8?B?R2liU3BkTGZsdTcvTSt4dXY3YUxkbnlkQXNySnVaRVM1K0tUR3Z6d0pVUS9X?=
 =?utf-8?B?ZmVxZ3ZKR241b2lSY0VCZDBNN01UZWQzUWJmQmx0NHhGOVlVMUNlK3hRcmZK?=
 =?utf-8?B?Mk9jZ0VRaVo1b0lHM09ORm1JT3lHY3FDWWl6SjYxRFhWOVRIRWM0Q0RBSFVC?=
 =?utf-8?B?ekxvS1BKY2hZNWZKMURkeTA0THE5Uzlob1lIR3h2UWxXdmtGNUV0WDVoSWhM?=
 =?utf-8?B?MDFLVS9rcXlQdkZLMXFwSzBwMXNpYm1FcUJiTFRKbGlkejVNOE02UzVyRWt3?=
 =?utf-8?B?dDJoVUcvS0FoamJybTBiS2lkYzRjWkVUcHZoY2duZXdyaUh1SitZRm1CYnpm?=
 =?utf-8?B?eGR0aWVyMVZNUTYwY0pFanFBVnBIa05tR3VJN0twS3pQU004YTlib2pBZWVP?=
 =?utf-8?B?d09taXhNUUNvN1FmNzBwNW1LakdaN3NoaTE5TGdJK3FGNldZYUFVTm5FNVhW?=
 =?utf-8?B?NXV0YlMxQnNRMEJ6T00rVTgxbW1GODI2anhDd296L0Uxa2RqdDhmY2FOY085?=
 =?utf-8?B?TFpxOE5kU2hZZzBhbmNURzVXeENLUFNYaGtVbFlnT0lpM01WbFhuMjA4MUhx?=
 =?utf-8?B?TU5KVGNFbU02bmJ0MG1CbFNTMTJjZkVUNDN4c1RDZEVHRC9WUzJibVluZHZG?=
 =?utf-8?B?WFdCWEFxeVlBMzdXVTR3S0laYzdGSFBDSTRWL1JDd0tWNmFET1EwZHMvay9L?=
 =?utf-8?B?c0xCVlMrZ2V4RXNCaG5ZSDVMYUQ0cWhaR1NneVpoNVU3dHByRjNYM2hxTk1n?=
 =?utf-8?B?RGwxZ0o4SW5CSlAxSHFrcXRnbWx1WGU1V0VFcThYRnVUY1ljbks5M0NTbnZi?=
 =?utf-8?B?eklIdkVaWXpNWHpnMVhXV3grbE5GTGI4OVBZNGxTQ1lTdUN3Q1E4YW53NWtu?=
 =?utf-8?B?bThmdlYwYzdXTXlBQjZwWEFYdzQ0MVVlUHZLRXJRYUpRQW5WR1RtKzYycTRj?=
 =?utf-8?B?alJsVnpkMWVMUW9vQ3IrSTA3L0gvTWpmMlNZY0t2MG9Ta0puZmNPeU50SEh4?=
 =?utf-8?B?a2M3dHdBSDZlTm5zcGF0QWFXT0FPTDlXU1VhVE5YOVBNbEZNcjMwSW1qakE2?=
 =?utf-8?B?YjF4WVRPWW5UQVhDeHRSNG1XOEErSnF5REkvY2JRbzJGbEY2RGF5dUFuaUtM?=
 =?utf-8?B?MmRjVDU0bTRaQnMwZHgxTHRpeWpuWXpzRkVnbGxKc3M4SU1YNndyUGhHYk5D?=
 =?utf-8?B?ZUV6ZDd4V295UWI5VVJkYzFXdmZaMWNCRjhoQkVHc2xTamROMEFRM0xYOHly?=
 =?utf-8?B?ekFxaFJSWXBCZ1J1L295b2VIUWVOalB6d1NCSzBJQTRtM3g5S3FROTJYOEZx?=
 =?utf-8?Q?0JrZbi1NnXitXlImii?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d36854b-1664-4313-f48e-08de697ee5b8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 15:04:47.6245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndof+EFaFnUKu+AcgJFXXiyJrCryENlfE5GE7bv0wXr6MemW01Zt/OIj0e2qYda/OqNhh1lUw4JEKZAeJizSdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4105
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 7AED31256AB
X-Rspamd-Action: no action

On 2/11/26 4:07 AM, Christian König wrote:
> Dropping stable, putting Grep on BCC.
> 
> On 2/11/26 10:19, Greg KH wrote:
>> On Wed, Feb 11, 2026 at 08:45:29AM +0100, Michele Palazzi wrote:
>>> Add amdgpu.no_vblank_immediate parameter to optionally disable the
>>> immediate vblank disable path on DCN35+ non-PSR CRTCs. When set to 1,
>>> a 2-frame offdelay is used instead, matching the behavior used for
>>> older hardware and DGPUs.
>>
>> Please no more module parameters, this is not the 1990's with only one
>> one device in the system.  Please fix this the proper way.
> 
> I just wanted to write the same.
> 
> We can of course implement something in DAL/DC, but clearly not behind a module parameter.
> 
> Or is there any other negative consequence except for that the display blanking is delayed by ~40ms?
> 

If there is a strong enough interest in keeping something like this as a 
debugging mechanism, there is already an amdgpu.dcdebugmask parameter. 
This accepts a bitmask of debug bits.  Assign this functionality to a 
new bit.
