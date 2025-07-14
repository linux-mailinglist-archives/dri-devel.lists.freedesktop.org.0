Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D556B03CD0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 13:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4750710E462;
	Mon, 14 Jul 2025 11:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="l2D2Rj/d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED5510E462
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 11:03:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+sFWesmcrb96i5p32kPw+AcIYuvt3TCG6IdAL4djttiX/6Z3WdbclC44q07/3X2hq5Wmcl1jrlVbFDnslfWuXsCwkQBiwIfrELg1fZsip/hz2oVqlb6RrWXeibl9aTHwWiojyDwQDD5sSDf0uaq1y5S5845NYrhjqRwqMrVkyTO5TSpsTa3UPG1EizKnIZnUITrL3toRJeqxsfcJtgNh79DyqwzjmGM7Ac8FAFY8EOX296mfV1bahrBGs/WJ3U1NA4YbNKvsFK1GPEbyCMX7mom6UFY5gc6yvllV4oUI2UEOKfQn7OziGSpq/og/VnJnepVOuZLZxV3HAFZlk+iRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFIs5I9Y1w6x06cJ5/leBc6BTkrTeFeWDWUcrJ+gAvk=;
 b=B5hbKyJHtgOYdV500jGmro88rBNn/yB17XzQsoYEKfsxydjtKvsVKWhIzbtFm7qPaUzEdd2FErlCeXnRzkjMo9Hg0nWFw6qOQ1G3BZa+Hej5/c3m3xWuIeMK/JxJo4PvmusdUIAMbakE0dTA0hIk9VuWFbgjyX6gM6fjWqzT5YM18UT9E+wzWgFRmWhaR0igdeYdxg0DLssKAoZjdvUvKy04y0LuJOVd/IEFdgCq6ZSVsxpWpvii+Uzaxjr7fivM6ME4XbdoX7P9tEvFJH9k6i065M9EZmheSrWKUOwAXbuLjaVYPr5jGm3hRk007kX8wDOFctwe0Ccve5b9Yhr7rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFIs5I9Y1w6x06cJ5/leBc6BTkrTeFeWDWUcrJ+gAvk=;
 b=l2D2Rj/dwJf77+PMQ7wIQruiCCm5uudDrPSsjPtkhx/SE8kzTXIvOW2prvIXa4gYQirav0jKNzIvMxADTo8TZIHhWHeoRNN2v4jNJGwEUaI9+pK/c+Q0B/b06JlQ3fVg9eS28AALsnyLvsSo3QgyXZfhFBW1suYCXp+qc8b68m4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6060.namprd12.prod.outlook.com (2603:10b6:930:2f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Mon, 14 Jul
 2025 11:03:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Mon, 14 Jul 2025
 11:03:33 +0000
Message-ID: <e6b3ae07-4d9b-4012-a328-b2749d88a6d7@amd.com>
Date: Mon, 14 Jul 2025 13:03:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when killing app with
 dependent jobs
To: "Lin.Cao" <lincao12@amd.com>, dri-devel@lists.freedesktop.org
Cc: zhenguo.yin@amd.com, Emily.Deng@amd.com, phasta@kernel.org,
 dakr@kernel.org, matthew.brost@intel.com
References: <20250714062349.588235-1-lincao12@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250714062349.588235-1-lincao12@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6060:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ce305c-fb16-487d-9350-08ddc2c612c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnhVL0ZaOTc5QlZzZ2hIdDdiMmZlVFBwUU11MlVDbGRsaWNacVN6alpqdmFn?=
 =?utf-8?B?U0Z4bXZ2TmthdVJwb2E5MHdyTHY2bktrN0ZROThWc1lwZDFoRlZzcWkzRGov?=
 =?utf-8?B?MExYWHlmeE9oK2ExdkpjSE55VGpUTkJycXp0dEhDaG1pYkI1b2NiQ3BuVWFu?=
 =?utf-8?B?YmtZOUo4N1RQTFVqcm5aakhMQjk3LzF2VUdwMk01LzB1aFNSLzcyR2xON0Iw?=
 =?utf-8?B?UzBFRHVKREI0VFB1dE5sQUtNS1pNTEU1RFN4S2JRdDA5dDhYNFY4NHZ0MElo?=
 =?utf-8?B?Z3dDbEhNc3FueXh0OUZsZmtRY2RyTElGRGV4OVJvTlo0Wmg4N0FQa2p3bFpq?=
 =?utf-8?B?ZGNiNzN3cW8zbTJ0NExPRy9vUDdBdWduUkFPTUMyb1hsK2pLVDBCVVhsY3BO?=
 =?utf-8?B?bWNIMU5hdHBnSGtKNXI2bXlGcUxNVVEwdkZ5OStqQ3U5Lytuck9YZWsxQS9l?=
 =?utf-8?B?K3R1dm15cnV4c2NOMStBODZaL3A1empZMVpaUEZYQi9pVWdsYml2S3A4bm4v?=
 =?utf-8?B?L2ZEWEpWUWM4b0E3SHV1OEFwanN6b05nTERYeWNFRTFXNTMyOUJnbUt4TndX?=
 =?utf-8?B?aHJjVkdTSHpUVDBrcXNrbGhNeGs2Tlh4TGFKbGlQOExnT3dzYi9PUEtwUVpl?=
 =?utf-8?B?Y1lQM2RqSW5kKzRGMHQvd3FwOGVEMXhtdEhEL1BzNXVsNGN5cFpvdFJ1K2RH?=
 =?utf-8?B?N09lNmNQZHlValBpdUUyVnRwUmRxdEJXcFY3eGtuMCtWcEdEelpST3FqQUN4?=
 =?utf-8?B?Vm8rQk1LQ0NteGlWTmZ1RzRWNnNYdUVaRmlXWWE1cmpybG93aUc1QnM5c09F?=
 =?utf-8?B?Mlhxem15bk1VNDZHLzBIbWpRNTVqTnNzeThyNmFyU0lrVVNoQko3azQ4SlYy?=
 =?utf-8?B?OFpTekR1L3daaFhsRWY5dS81VnoySmZEMmlhQjFZZDdEdXg3NXFDcS9SZ01y?=
 =?utf-8?B?ZVFTb3ZzZlJ2VElGcFAzcERidWlQQ3dCUFpRSWlBUHlYTDNNcXdpUnhBVjZO?=
 =?utf-8?B?UFllTFdLaW85bUZpYmp6aHgxd21XWExXaDEwaXhEblF2N1l4YkJOTkJLNWRE?=
 =?utf-8?B?V1RLdCtlaHBxRWs4cC8yMlA5WW44TzVMMXNkMkcweWJzeGJQeCsvdXFHenlL?=
 =?utf-8?B?cnZaNlZ5dEVKczNYUzNtSWIvNStkR3J4dmo4U2pOTEhnaGFFaDlqbzd3dkxO?=
 =?utf-8?B?UzZ6VEVOL0oxWE1FcWRqV1dHdmlESktJaGk5dGxNTDNSRUM2SENyUzVCZ2t5?=
 =?utf-8?B?NjV4ZU0zdXhSZmxEK0JpTUthRU1jSEQzWDFabksvVG5JN2NFRFpnTnhZdlFp?=
 =?utf-8?B?QUdaeTFadS9Oc1I2eXNQUEN5K3RRR2lISHpzVGJNdkt0WXZ0U1BTWkg2RE12?=
 =?utf-8?B?bEhFN3hwRVBVdzh6QnA1c1lQYllsRm1QYXpoV0xDQVFsTFBoMGdGV2wxeCtY?=
 =?utf-8?B?TDBrTXFsT01pQXdSRkF4WWlsNnd0Mi80ejJHU3pLdFpETndDbHdPMlVqa2l1?=
 =?utf-8?B?Y25paFI0ek5yRTZWMEpyU0VNYXF4Yk1zQ3QzZEthalhYdUhNZVBYQUk2Qi8y?=
 =?utf-8?B?dHBPMVRFdnRubEpoMlRvWlYrVFEwTUorK0RHbzBobDc2ODZFaGRYcHQwOFFN?=
 =?utf-8?B?NlFpK29sU2cvclVZaHdML3V6TFQrbkQwSDg2V3Zoa0trVzBIanl2TEZSQitU?=
 =?utf-8?B?VG9XdnpHclN2aFE5WVlXN2dFNTY0TnFkVkpCYURoM0dhWitRWmhZZGRIYzhT?=
 =?utf-8?B?RCtwb05JK3hTMEowUVZQeHp2dTFqY2VocnY3amJYMVRmRm04OHRaS0ZmcWw3?=
 =?utf-8?B?VjdCMEhlWkZPRE1GNlVXY09XSy9mbDJ4bncvRkFRVDhCSlBJNEF6cDFCQ2Jr?=
 =?utf-8?B?QzVML2h6c256azgxc0NpZWZVeFJsY3VxZTB3T05OMCs5dTgwemkyaVo1WVFt?=
 =?utf-8?Q?UeCD/SRqwEA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkpuU1dTcElVWFRvbUx5Y1R5aDZZUXkyUnVqeVRwSnF2MGtjbmd5K1JrZjdX?=
 =?utf-8?B?VDlpTW9vaGw3Q1p2emNpL0RHaExoRUJXeHNFK2U3QmV2STR5dEhDSW9qdzg4?=
 =?utf-8?B?N3k0QlZ6L1UwZkdWVUticE5PdXdQcjJWV29hdnh6K2xUU3Uxb0drTUpWc0sx?=
 =?utf-8?B?MlEwbXZPMmJzTXlSSDFPMDVSVE5lRmYrM25OUVNCdkpCenB5ZktTeno1K2M2?=
 =?utf-8?B?THpIaVNOZlVYKzhjM3lZWkVWa2haRTQycm15YnRmQ0FUV2tIOFhJdExrTlk1?=
 =?utf-8?B?QXo1K3dCOHRIcVB3OEFPdlZwd1pyUGlOUmRYTmRWeTFMWkRTdy9RRzdybHNL?=
 =?utf-8?B?UDJiYzNHRXd2NEcxc0VMTVVUbkFlbFlaK2tHb2pMdTFRU3liNWdCdWxDT2F6?=
 =?utf-8?B?R0FSd2o4VFN0SUxGcVN4MmU2bk5iVk5mQXNweTl0OGtRZ09mdW03SkhYSUlY?=
 =?utf-8?B?RFY0TVR2QW4rTGYwdVBEbWFuTFhUa1puUmQwQkFIYkh3UE12eGwxWGNGeGpa?=
 =?utf-8?B?dkl0OVR0SWhzMm9nUkxjcnByWmZacmlaa0dwRUJZNnQvWXI3UXRtL3RuU0tM?=
 =?utf-8?B?QTRvOHNSZjRVc1Z3eWtYR1lGS2t2dEoyK0dYY0hxT0I4ejZ5TjlVbVhiTDZ2?=
 =?utf-8?B?MTlYQzRMb0R6M0JMNlBUR0s1ZkdlNEVNek9kaDRtVjRsTzRqNGVXSnY0cDIz?=
 =?utf-8?B?NHhPVlFQK1R4aE9McVljU2tLaDljM0VUZGI2R0lqckhCamRiVUs3c2VaT1pk?=
 =?utf-8?B?aXpHeXlWMFJ2Z0hiUnF2aEtIKzl6RHgzTldhd1NSU1FHSXdyNjVXNnZ5ZFp6?=
 =?utf-8?B?Qkp3Q0dlYjNYUnU4eWhhTmR1bkkvam1BWlFUOUc0UDhiRFFmRjFRT1FaclhK?=
 =?utf-8?B?Q252bEZWU3Z2eTdKUU5rMzhqajZ3Rm5YcERlcWNTSUpwSHlQcHRFTlBScE12?=
 =?utf-8?B?Uitad0NvWnY1anJ6OUZTLzFhTnZqbnVWZ1dVbEYvenEwZnhyb2lCbXJreGlp?=
 =?utf-8?B?MlNVYWVicVBFWkpxR0NUcVEzYmRnYktyR29LdnFxeWtHTXZES0lZOE54OEtE?=
 =?utf-8?B?bGRycmQyZExseExuKzZIaHhxSy8zNmxodkxoNXlDdVZsQjJzdU1hQXpVamlz?=
 =?utf-8?B?aWJRMk5BMmtvVWpNQ215NVhqNEtJM3RVaE9ReGYwRUJzY085SmFKSkFDMFZW?=
 =?utf-8?B?NVppLy9Nd0xscGNTWm0rUzZFMU8vVHBOdTZJWEt2a2dJZ1ptc0l0Z0t3anVI?=
 =?utf-8?B?bFJnazNKOWIwSk1PbW5lZWx2TFhtSXZmYUhZb3JOeFhnUHVpV2JOdHZWaVFL?=
 =?utf-8?B?YTBmc3F6b0lMMmhzbHk2b21QNGdJdytyTjZxQnFTVzB5L25CcVRDbjlkYjNt?=
 =?utf-8?B?NVIvdW5VQTZzdGw2STVsZmJ1MWoydmhXZGNTMEVSZ2dLZitjc3h1VlR3cWRz?=
 =?utf-8?B?d3hCWk9LRGhHTk1TK0FTZGx5RUJNWlk2NzRuT0RQV1pzb1QvaGVuR25RYjA3?=
 =?utf-8?B?cHU5UTBzZUl2U3ExYmpuYktIam1laXRnNHJRSHZ4QW5XMVluSVBlRkYyRVBz?=
 =?utf-8?B?K01aSUhNZ3pBenFjR251OXZwMnFJeHZqTzk0ZXBwdWZjc211N3ZqbTZqa3Rm?=
 =?utf-8?B?TzJXUE9XMFNUU0t6YitiNXRRM08rUXlNQjQ2MFphclVhK1JuazhNWTNrSjRR?=
 =?utf-8?B?VFZnc0FmcUZHU1pFQVFFNTFEcWErMkh6OE9pZkhzL2ErSE1ocHZxUVA4d09H?=
 =?utf-8?B?NjIxTGpqaHU1eitPZURKS0xWMjJyWGhuWlIzb05sSzRoczhkRlY1VnhINEYw?=
 =?utf-8?B?YUZpRE1zRzdyUVpCdS9MWjdOVWZDUi94bG9ZYnk4bmRKYlZKTWNPOHBCWlM3?=
 =?utf-8?B?WmU4WGd2TGdXZU1XZWNMM2lUcVpFd013bTZXa3NpNVA4dXVvWHNrbDF6a2NR?=
 =?utf-8?B?Q3hycmdqZUc0bFpuYlh4N0FVQWNGa01PMFdsWm9Qc1JMS0o4eEJXL3hxdUpl?=
 =?utf-8?B?MUliMm5TS0Zlc2JuL3pxbTREZ0F6bnl3WE5pRmhudzRKYkJPZ1NLRkYyWkdC?=
 =?utf-8?B?MGM3Z0tVWEVKQmdIUWgzaWwweUxtcTFSSUhSUXR6N2tOODVyZm0vRGpYR2Z3?=
 =?utf-8?Q?4DssBr26M4vixCMjcWMol5udk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ce305c-fb16-487d-9350-08ddc2c612c3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 11:03:33.3700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nrnu43kMKc9YW7VqM+dgvAQr303trbBePVKreKNgbRK8fSC3IUBEGkXT+jY9DMb+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6060
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

On 14.07.25 08:23, Lin.Cao wrote:
> When Application A submits jobs (a1, a2, a3) and application B submits
> job b1 with a dependency on a2's scheduler fence, killing application A
> before run_job(a1) causes drm_sched_entity_kill_jobs_work() to force
> signal all jobs sequentially. However, due to missing work_run_job or
> work_free_job in entity_kill_job_work(), the scheduler enters sleep
> state, causing application B hang.
> 
> Add drm_sched_wakeup() when entity_kill_job_work() to preventing
> scheduler sleep and subsequent application hangs.
> 
> v2:
> - Move drm_sched_wakeup() to after drm_sched_fence_scheduled()
> 
> Signed-off-by: Lin.Cao <lincao12@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index e671aa241720..66f2a43c58fd 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -177,6 +177,7 @@ static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>  	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
>  
>  	drm_sched_fence_scheduled(job->s_fence, NULL);
> +	drm_sched_wakeup(job->sched);
>  	drm_sched_fence_finished(job->s_fence, -ESRCH);
>  	WARN_ON(job->s_fence->parent);
>  	job->sched->ops->free_job(job);

