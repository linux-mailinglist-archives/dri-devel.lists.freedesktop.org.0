Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id c8fcCP+DjWmQ3gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 08:40:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715C512AFC4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 08:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7811810E6E7;
	Thu, 12 Feb 2026 07:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MmFidTEP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010068.outbound.protection.outlook.com
 [40.93.198.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8A210E063;
 Thu, 12 Feb 2026 07:40:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0Ci6ITj0vibniHxcFOEKiv+h9JUc6K//emKqrTiEstBr8pvFyLtl1yrXWTx67OsOudIB73Gpwuo7wNwd17V6FIuiZ7cKtQad3zjXNuL/PQ/FeaEr6vN8iut8VNs2NVAuSu/CTCGDEO2w3rXMlaCvE7OnCztrvCroyQ+Xkxj+09f9lEHuxvI9RIwuBzwTSkOo1YtbDog/eaRFms5kjut9zB2qkIhvhDD9SY5wB+anIN+bsKRO+dU89TryZqCH5HIi0mkaYg5vCtF8kF0352TOOL9dFmapnbSPZeDZzvWrrQ7syxhUYgy02RHT2eYdt1A0uqr6/EjJm6bcSXR7+5vDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NG6kEKXECdKPZwYl/5ciS40d3I1CqARrFi2egaatcvA=;
 b=lhArxx50qhIDxi/QRRh3wQg2CiJnMCT2uwq3X0qJfgmJPaHl+hJniKvXsYZbl07V4N9vsjg7kiHavB8ihNwn9fsMatSp7w3bZ2sHd/p9Tn19p1sp8rU08OZyvlABCpYAq78rhRDo+kgKDMmmzgiWX7+JGSdNF43eS1FlH69bu5Ufnf8dSoB2K2eA+OfW5rhT+HlnnFHK7CssarTOkT2YtCyQz86FJuZuUSH9oY3FwD0V/cbjOKPZQPZ5ptH9wxDV6NuCAc6XZa751UGckQa3bZUStsvJsqc4RNJuJ40WWtiadKLle+9Zodr4Vpg3vVaVwlnWA2q0KBOvvHg6KZx82Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NG6kEKXECdKPZwYl/5ciS40d3I1CqARrFi2egaatcvA=;
 b=MmFidTEPK460+DzW46XuPJOivJ5FzqWo8K0yDKFBgQcNoKsuw1Zgnm5BtxcPpVq1OdQhVmu9MVZbXuuBK01Z/awDyD9CM2O4o4ohvtpCtRIazoCEC0zf2YhUm6W9Cfi7MIMSznVjeeWe4NdPrrYdYHCvgeIkrzwFVehcItYFRsg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by CH3PR12MB8657.namprd12.prod.outlook.com (2603:10b6:610:172::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 07:40:38 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 07:40:38 +0000
Message-ID: <3a205ac1-5917-4e24-b6e6-f8989678a54d@amd.com>
Date: Thu, 12 Feb 2026 13:10:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/buddy: Add kernel-doc for allocator structures
 and flags
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthew Auld <matthew.auld@intel.com>
References: <20260211053123.260037-4-sanjay.kumar.yadav@intel.com>
 <20260211053123.260037-5-sanjay.kumar.yadav@intel.com>
 <f1660888-9682-4c74-9241-063750bd63ef@amd.com>
Content-Language: en-US
In-Reply-To: <f1660888-9682-4c74-9241-063750bd63ef@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0168.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::10) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|CH3PR12MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0c4ac2-13f8-4301-aeb2-08de6a0a03ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlJIM1NwOVA5dURGNkxySTlMUDNDMElGc3QybzRpV2d4a05ZVDNFWnplSDls?=
 =?utf-8?B?dUFjeHF6OXhMVTBLWnhpOWhhMDlkbnRxdW5oemVqV0x6c045cnVhcTMzMDhx?=
 =?utf-8?B?WXpmME1naE90a2pZL3pQOENrM21KamlvaWE0WXZoMFRPN1FLU2l1dDNXYVJr?=
 =?utf-8?B?WEZKWC81TzNIWVpxTnBBbFdzNmlid3R3cHNiNDZhOXhIMk05UlNWSjNCZTls?=
 =?utf-8?B?dUpxTXh6SE1LV2VoZ1o0cGgyQ0daODQwUy96SGsyQ0lHQWVVaG1qY0hnODUr?=
 =?utf-8?B?QkRJVnlTdWZSS1hLWnU5U2tySEdQMVBLM2lQaXpKY2g5U0VNSFI1NkhNYU5s?=
 =?utf-8?B?WnNKdXJhVm9wbWYvTkltaTRLeWdnelpOck9yd0liWnY0enFyM0pOWmRzUldq?=
 =?utf-8?B?aE14ZlQ0OG54Nk9yT3R1ZXBma1Z1cisxL3QwM1grTVdSbUkwbFd4Y0VJeEUr?=
 =?utf-8?B?Z2ZHMHUzSks4cGNuSEorZzBPd3FoZ0xIYXJ3b1hWWWNneEN4SklRaGlyWWtW?=
 =?utf-8?B?Qm9laU9tMU0wRzV4VEpXYnNIaGtlQWdNcS9icGdUenY3YnpYaXRDQ2dCODhp?=
 =?utf-8?B?amsyb01pTkxyR0ZjM3FHTU5TbmxnV29OQjZac0VVQ0taODRsTy9xZVE1YjIx?=
 =?utf-8?B?TTJKemRVSXZwNm1YeWJZRVVBQ1VLdVhEa2hQejJYWXRIV2hwRldJT3MxMll0?=
 =?utf-8?B?SWVDMm8wQmFhaCtuWnJ1ZUgvbnFLNFhDSVlRUlRHZER3YXFYQlVJZzJ1M2tW?=
 =?utf-8?B?ZXpybGNVbW9ERWFFb0dmeHJjelJKYjVGSGs4ZzNFZFZMTEJ6ellLRW82SGNm?=
 =?utf-8?B?aFRoZUdLcTZ4TXF1eGNQTU9SdjNOSFhyZW50c2RkUlJieDFranZxL1FWVVdX?=
 =?utf-8?B?REY1K2kxc25pd2pRdG84aDZYejdZajdkdVhHdkhZUkFhRmkvMHJwWGVCZHVU?=
 =?utf-8?B?d2VjRUhKZG5HMkkrVTYyeWZpUUVMZitKMFduOEh5K2ZrTTZ5RVlsZENXTXE4?=
 =?utf-8?B?MHFKYm1ZQ2V6dEJ4eGRUYllvT1JYQ2w5dGJsbkNzU01sb2QyeTZqUjdZWTNZ?=
 =?utf-8?B?SXZlaFk3N0RJOEhxQzB5aGQzYTIxUWtRaFc0M0NMNlRnZlpGcUVzL1loV0dx?=
 =?utf-8?B?d01DR1hVcCt5KzlsNUlYMUpzbVd2d3hZaUNkVHp0RGJuNXRIN2M4dTl4d050?=
 =?utf-8?B?NnEwQnFScitzMW42aXE0eitib25HMWVWa1dPUGtPamN4cDl2Q3djSGw2aVNY?=
 =?utf-8?B?TUM1UnczQ2FvbTZLNkRTTU53Q0JEUVB2bjNwcURILzBSbEZCUWVlckJSd1dQ?=
 =?utf-8?B?REJPOUJtQVVtL01Vb1VkSXF0MGdEOEJCR0cveHVvYVFzaEtpME9sVVJWUTl3?=
 =?utf-8?B?ZXhFeFExbVBHdjR0ZHNZdHM0Q0o4OVJLaFVOblZhQUF2ZWRaVWpOTk1rUzZ3?=
 =?utf-8?B?d25KNTJVeVdYd3FXeU1ycjR6a21YWnRxVWtzYnIzMVRTZlU0c3JtVDlkdFdq?=
 =?utf-8?B?OWh1NUhqZWtMcjkzamVVTEFzSHIyeVhIT1ZydE9hYVNic3IrU2UwUTlPN2xD?=
 =?utf-8?B?c1FzaGxWK3VPSkZhTWlBNWU0SnpRZGI0OFVMZk40Nm5QeWF6Q3hYbGNYZmNQ?=
 =?utf-8?B?cnpocCtTUjgvNDZlRzV6bzZZUitaSkU5c0JocGJ6NzgzODNBcDQ5SjQ0SWtF?=
 =?utf-8?B?YUFoNVZHbzI4bkxaaXFFWGMva2J5ZWdscVhONjJvcFNDNHpuMHpsUHJsZkZo?=
 =?utf-8?B?UmVITzlxVjhubzh0ZGtFVXZza0FJdUxaRmkvZ0ZZY3FxaU9WeldWTy9vWXJZ?=
 =?utf-8?B?OGtZSmdQek1LMndGOGE3VzZMSkpwUVdLdTFsOXRWUkM5TlljdUM5NStpZzVM?=
 =?utf-8?B?eTVvVGhrYkhwUHpScFdNOU1OMWZFQnM5Z3dWM0JpRzZnYTV1UFhRaGhKRXJm?=
 =?utf-8?B?dmpkQjNVZHZSRk1KcE9XQ3JBVmJPK3lVQ3RBSUE0WlROL0JqRTBFbEU3V0pW?=
 =?utf-8?B?K2twZEVUbVdGN1B2d2VjUXkvUUp1bFNnaTRlbzQ5OTlmc3hCdWpDWmtYNExr?=
 =?utf-8?B?NVNJNUEwZy93T2VHbE5oMURYTEZFK3YyWThkWGQwTWZ2TDdJQ3BQVTBKSUh6?=
 =?utf-8?Q?nAgY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEhNL1FXT3JnSkpYSldxOEY2NjhxMGRzb1F4bG1DY3MzeTMveU9RV2pmdTk1?=
 =?utf-8?B?Y3RoRjdscnNaNUlnbC9INFFiYmN1eDR4USt3azEvUE9mYlUxRmVpUHlhRlJy?=
 =?utf-8?B?VFdOdUFNQlVRQ21FUXFDTDBIZCtJWXQwaFhHRDNDd2NOZFVBbm5UQ3JKczFn?=
 =?utf-8?B?VksrMXNOK3VPbHJzZnRRRXRVRFRZRGVJZm5aM0Y0LzBhL25SdXN3ZGRIMjNt?=
 =?utf-8?B?VG4renNFZnBLRSswMk90UFhPdWJ6VXFoSWJNS2M1dHpaSkRPNmVpcGpBQStI?=
 =?utf-8?B?MzFoRWgvTHpiak9WMXMrc3YzanFrTDZtamZOK3FTWDE1N2E3Vmp5TURKN0pO?=
 =?utf-8?B?Q1pwVHJKUnVmMGpMa1dDQ1BuWExLbHJvck1HUWwwMUNOUlRrVmFIb05nc3hO?=
 =?utf-8?B?a3hGb1MxdjVtY2lYWDJuR2RFWHBHL0FJeUZuNkMvVDJWOHBVQUVWT1FMTStl?=
 =?utf-8?B?R1QxZTl6VUNMSHMwWkZGR0FWK1E0WGgwZkJUd3dnOGtSOWdZbEUwcGdmaFpz?=
 =?utf-8?B?QVFpcEJOQmJyMWtaQ3hpM0Jqd1hGTm5kVjlDL3haMzNGSXk1b2xZU1R1VEI1?=
 =?utf-8?B?N1Q1MkVpWUs0UHRRaGxid2FrdWROODN5RHVoUzdYb2V4Ulo1T090MS9JdE1w?=
 =?utf-8?B?UjZXcCtkVnppU2xlMExOSTRJSHlsQlNUbnFFMWV6VFRHaFpNc2p1VWs1bjc5?=
 =?utf-8?B?SklqUnZWYXFFNVQ5WDBYWWFKZjJudFRxZ3dDYzRkMW8xMHhGbnVXN0hOVWxU?=
 =?utf-8?B?QTNXVnVhalhqMGNPNnV4V1FnY2E0T1Z1V0NhQ2tVcENwY1E3ZkUwMm0rWmd2?=
 =?utf-8?B?NDBEUUZqU2xFempQUnh0RXZEOXRFUWJDcnlpcHl0bWxvVFFNY1RuMmhmcEdC?=
 =?utf-8?B?T3UySEtLbXBtR0VrUFBNdVo5WXBHc21WMXBLTWNMUTVuSlZhaWx6VlhvcXhs?=
 =?utf-8?B?aG1MU1A4ZGY0WFNUL0swM3BHS3lsaFpOMDlqSDFnOGNubHM4WU5UKzRWVVhh?=
 =?utf-8?B?SWpVTEVqbEFjamVsVGpBK0F0V1VVc0tITnhCMEpOUEh1TmV0MTRsTmNTRHQ4?=
 =?utf-8?B?cS9pejJobTJJbml3UGE3dUVxdjBCNEVkWjBwMk9wZ0tweGROSFFVOUVkSExN?=
 =?utf-8?B?elJ1c09wOE5IVUw0cFlkcG0vZ3c0elh3TU1EQVJ0VWt4T3g5cTFnRWlwbjlZ?=
 =?utf-8?B?SzNhMUxBb0JIdlpxSWVuRlNqcVBjWm9jLzYvcXRWYThmQzBvU20vZHJLZGhv?=
 =?utf-8?B?c1AvUHFWdVdaaWJzQjd2YTFkOTNVRVN0YVRPZy8rM3dzdExMaDlxcTU5VVJm?=
 =?utf-8?B?RXplUlhzYUl0MTgzTEwwcjd3YXJDTGpvUWM0a2dqVmVFMVo4dU1Pb2E5Q2dj?=
 =?utf-8?B?ZnNjMi90SkxQSWFIenNZMEZZR3FzY3p3V3VaYThOak5Vc2pRd2JHOEtHY2lO?=
 =?utf-8?B?U0o0YTVEbGZVNU1HMlRZK2pWRDRIVjByNy9GM2FWbElhNUpLVnNtT3dtVnpl?=
 =?utf-8?B?aFJvTkdLM2tCZlc2TVJ1dW9CMDhCbWlOVm5CZzB6U0FOcHM5WDFxdEVCcEkv?=
 =?utf-8?B?N04xaG1vNnB6dDAvREV2bE9UaUl2OHJtL2RXTzMwVDJ2amhycGdRQTdQOTZP?=
 =?utf-8?B?Z1I5MHNlb1hWQ1hKaWhCOVgva08vUjVseWF2RjR5MVFmTmFlamZsZ29qV3lB?=
 =?utf-8?B?bUJ3RllSMWtCVy9GaThRUTRoK3ZFSkM4OUFjdUVuY3ZmdDk0VjBYbzVFY2ZV?=
 =?utf-8?B?U2VMcE1IcGJWYlh6eWFqeWNOMHNTajI3MUZ0ZXB5NlFJQzBiblJBUDhaWHBO?=
 =?utf-8?B?cDJoRUFvRVBUeW04YXd5ZTdOd1IxNzFEY3M0cWI4cWc5aEFNTmRYbVdSU0ZY?=
 =?utf-8?B?YlZRMGZJRjRzV3hHY0tuSnJTWHN0Y3hoeU9yMlRMK013S0NkR2ZJRmcrTUlG?=
 =?utf-8?B?UElObzhsSnVGdElpNXYvTDk5MU1ETUIyT1RzV1JPc2RJUXRaalZNem9LRk53?=
 =?utf-8?B?dS8rNXZpTmpVbFVpWFFKdFpJMDVtUlpsNVlFQmpXM2pzQXd2QnpYRUU1Z0pq?=
 =?utf-8?B?bm51YkdFT3hkbGNwTTI5RS9sSm5xNC94MjJzM2VjQWdvQ2tjZWIyRXorcUpY?=
 =?utf-8?B?dnQya3dtUFVzQ2pvTS9SZlRnL2Q4N1dlMGx2UStJS2pib3JlYVZjZCtlS2x6?=
 =?utf-8?B?N2NGdjVsN003STdKa2JiMjNvYjd2ZXI1Q01palpHUjJ5QUNOZHBpQ25sU3RO?=
 =?utf-8?B?NnpPWWJ3NkFGTWlMWUVkOU5Pa3pwSXFzNEF0djRPUmhYejh6MExBeElhbVl3?=
 =?utf-8?B?MzJRQ0d0NGZBbXZWaTRlcitQcFVEazcwSit2Nk53dDJaQWhlcTkydz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0c4ac2-13f8-4301-aeb2-08de6a0a03ae
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 07:40:38.0680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwjhA4L17OXJHhweh3DcS3GDPDo8Qt6L7+FdvoHNhUFsn/qnGmMcH52V6EgyvtgBYX2/AcKDIwzyVXbt3EADgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8657
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[arunpravin.paneerselvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 715C512AFC4
X-Rspamd-Action: no action



On 2/12/2026 1:08 PM, Arunpravin Paneer Selvam wrote:
>
>
> On 2/11/2026 11:01 AM, Sanjay Yadav wrote:
>> Add missing kernel-doc for GPU buddy allocator flags,
>> gpu_buddy_block, and gpu_buddy. The documentation covers block
>> header fields, allocator roots, free trees, and allocation flags
>> such as RANGE, TOPDOWN, CONTIGUOUS, CLEAR, and TRIM_DISABLE.
>> Private members are marked with kernel-doc private markers
>> and documented with regular comments.
>>
>> No functional changes.
>>
>> v2:
>> - Corrected GPU_BUDDY_CLEAR_TREE and GPU_BUDDY_DIRTY_TREE index values (Arun)
>> - Rebased after DRM buddy allocator moved to drivers/gpu/
>> - Updated commit message
>>
>> Cc: Christian König<christian.koenig@amd.com>
>> Cc: Arunpravin Paneer Selvam<Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Matthew Auld<matthew.auld@intel.com>
>> Signed-off-by: Sanjay Yadav<sanjay.kumar.yadav@intel.com>
>> ---
>>   include/linux/gpu_buddy.h | 122 +++++++++++++++++++++++++++++++-------
>>   1 file changed, 102 insertions(+), 20 deletions(-)
>>
>> diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
>> index 07ac65db6d2e..b06241c78437 100644
>> --- a/include/linux/gpu_buddy.h
>> +++ b/include/linux/gpu_buddy.h
>> @@ -12,11 +12,58 @@
>>   #include <linux/sched.h>
>>   #include <linux/rbtree.h>
>>   
>> +/**
>> + * GPU_BUDDY_RANGE_ALLOCATION - Allocate within a specific address range
>> + *
>> + * When set, allocation is restricted to the range [start, end) specified
>> + * in gpu_buddy_alloc_blocks(). Without this flag, start/end are ignored
>> + * and allocation can use any free space.
>> + */
>>   #define GPU_BUDDY_RANGE_ALLOCATION		BIT(0)
>> +
>> +/**
>> + * GPU_BUDDY_TOPDOWN_ALLOCATION - Allocate from top of address space
>> + *
>> + * Allocate starting from high addresses and working down. Useful for
>> + * separating different allocation types (e.g., kernel vs userspace)
>> + * to reduce fragmentation.
>> + */
>>   #define GPU_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
>> +
>> +/**
>> + * GPU_BUDDY_CONTIGUOUS_ALLOCATION - Require physically contiguous blocks
>> + *
>> + * The allocation must be satisfied with a single contiguous block.
>> + * If the requested size cannot be allocated contiguously, the
>> + * allocation fails with -ENOSPC.
>> + */
>>   #define GPU_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
>> +
>> +/**
>> + * GPU_BUDDY_CLEAR_ALLOCATION - Prefer pre-cleared (zeroed) memory
>> + *
>> + * Attempt to allocate from the clear tree first. If insufficient clear
>> + * memory is available, falls back to dirty memory. Useful when the
>> + * caller needs zeroed memory and wants to avoid GPU clear operations.
>> + */
>>   #define GPU_BUDDY_CLEAR_ALLOCATION		BIT(3)
>> +
>> +/**
>> + * GPU_BUDDY_CLEARED - Mark returned blocks as cleared
>> + *
>> + * Used with gpu_buddy_free_list() to indicate that the memory being
>> + * freed has been cleared (zeroed). The blocks will be placed in the
>> + * clear tree for future GPU_BUDDY_CLEAR_ALLOCATION requests.
>> + */
>>   #define GPU_BUDDY_CLEARED			BIT(4)
>> +
>> +/**
>> + * GPU_BUDDY_TRIM_DISABLE - Disable automatic block trimming
>> + *
>> + * By default, if an allocation is smaller than the allocated block,
>> + * excess memory is trimmed and returned to the free pool. This flag
>> + * disables trimming, keeping the full power-of-two block size.
>> + */
>>   #define GPU_BUDDY_TRIM_DISABLE			BIT(5)
>>   
>>   enum gpu_buddy_free_tree {
>> @@ -28,7 +75,27 @@ enum gpu_buddy_free_tree {
>>   #define for_each_free_tree(tree) \
>>   	for ((tree) = 0; (tree) < GPU_BUDDY_MAX_FREE_TREES; (tree)++)
>>   
>> +/**
>> + * struct gpu_buddy_block - Block within a buddy allocator
>> + *
>> + * Each block in the buddy allocator is represented by this structure.
>> + * Blocks are organized in a binary tree where each parent block can be
>> + * split into two children (left and right buddies). The allocator manages
>> + * blocks at various orders (power-of-2 sizes) from chunk_size up to the
>> + * largest contiguous region.
>> + *
>> + * @private: Private data owned by the allocator user (e.g., driver-specific data)
>> + * @link: List node for user ownership while block is allocated
>> + */
>>   struct gpu_buddy_block {
>> +/* private: */
>> +	/*
>> +	 * Header bit layout:
>> +	 * - Bits 63:12: block offset within the address space
>> +	 * - Bits 11:10: state (ALLOCATED, FREE, or SPLIT)
>> +	 * - Bit 9: clear bit (1 if memory is zeroed)
> I think we should add
> - Bits 8:9: reserved
it should be -Bits 8:6: reserved
>
> Apart from that, looks good to me.
> Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> +	 * - Bits 5:0: order (log2 of size relative to chunk_size)
>> +	 */
>>   #define GPU_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>   #define GPU_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
>>   #define   GPU_BUDDY_ALLOCATED	   (1 << 10)
>> @@ -43,7 +110,7 @@ struct gpu_buddy_block {
>>   	struct gpu_buddy_block *left;
>>   	struct gpu_buddy_block *right;
>>   	struct gpu_buddy_block *parent;
>> -
>> +/* public: */
>>   	void *private; /* owned by creator */
>>   
>>   	/*
>> @@ -53,43 +120,58 @@ struct gpu_buddy_block {
>>   	 * gpu_buddy_free* ownership is given back to the mm.
>>   	 */
>>   	union {
>> +/* private: */
>>   		struct rb_node rb;
>> +/* public: */
>>   		struct list_head link;
>>   	};
>> -
>> +/* private: */
>>   	struct list_head tmp_link;
>>   };
>>   
>>   /* Order-zero must be at least SZ_4K */
>>   #define GPU_BUDDY_MAX_ORDER (63 - 12)
>>   
>> -/*
>> - * Binary Buddy System.
>> +/**
>> + * struct gpu_buddy - GPU binary buddy allocator
>> + *
>> + * The buddy allocator provides efficient power-of-two memory allocation
>> + * with fast allocation and free operations. It is commonly used for GPU
>> + * memory management where allocations can be split into power-of-two
>> + * block sizes.
>>    *
>> - * Locking should be handled by the user, a simple mutex around
>> - * gpu_buddy_alloc* and gpu_buddy_free* should suffice.
>> + * Locking should be handled by the user; a simple mutex around
>> + * gpu_buddy_alloc_blocks() and gpu_buddy_free_block()/gpu_buddy_free_list()
>> + * should suffice.
>> + *
>> + * @n_roots: Number of root blocks in the roots array.
>> + * @max_order: Maximum block order (log2 of largest block size / chunk_size).
>> + * @chunk_size: Minimum allocation granularity in bytes. Must be at least SZ_4K.
>> + * @size: Total size of the address space managed by this allocator in bytes.
>> + * @avail: Total free space currently available for allocation in bytes.
>> + * @clear_avail: Free space available in the clear tree (zeroed memory) in bytes.
>> + *               This is a subset of @avail.
>>    */
>>   struct gpu_buddy {
>> -	/* Maintain a free list for each order. */
>> -	struct rb_root **free_trees;
>> -
>> +/* private: */
>>   	/*
>> -	 * Maintain explicit binary tree(s) to track the allocation of the
>> -	 * address space. This gives us a simple way of finding a buddy block
>> -	 * and performing the potentially recursive merge step when freeing a
>> -	 * block.  Nodes are either allocated or free, in which case they will
>> -	 * also exist on the respective free list.
>> +	 * Array of red-black trees for free block management.
>> +	 * Indexed as free_trees[clear/dirty][order] where:
>> +	 * - Index 0 (GPU_BUDDY_CLEAR_TREE): blocks with zeroed content
>> +	 * - Index 1 (GPU_BUDDY_DIRTY_TREE): blocks with unknown content
>> +	 * Each tree holds free blocks of the corresponding order.
>>   	 */
>> -	struct gpu_buddy_block **roots;
>> -
>> +	struct rb_root **free_trees;
>>   	/*
>> -	 * Anything from here is public, and remains static for the lifetime of
>> -	 * the mm. Everything above is considered do-not-touch.
>> +	 * Array of root blocks representing the top-level blocks of the
>> +	 * binary tree(s). Multiple roots exist when the total size is not
>> +	 * a power of two, with each root being the largest power-of-two
>> +	 * that fits in the remaining space.
>>   	 */
>> +	struct gpu_buddy_block **roots;
>> +/* public: */
>>   	unsigned int n_roots;
>>   	unsigned int max_order;
>> -
>> -	/* Must be at least SZ_4K */
>>   	u64 chunk_size;
>>   	u64 size;
>>   	u64 avail;
>

