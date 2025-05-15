Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F11AB814C
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 10:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E4610E035;
	Thu, 15 May 2025 08:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BZ6AbjJI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5977310E035;
 Thu, 15 May 2025 08:48:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4D5eT0JkdL9O6C98ytcxh2tC2Ytmg7AFH1iLz8Ua0/MyFGVn7NukqE+HCItJRcWr+VGr069FyAqq5/t0QLbsVXmuD9ciiXEtQ/gefVnB7XqiLK7KT8fWVqVWMb6D4G4jE94RKM0UHqUZD27R1nK+yQPlFQeyDav9T1PrH/D3D5n/UVB70m2ibH0ftyQgJIpIC1SWd0s1NCPf+NtWXSaOxjcuQEho27Ky+k97iabLS5pKz1IoPzAvttdS2JbeCnojG0bODdD5sohBzknYL5hiC0JedZ/uNh8U3rRM/7ZcfHNxjouXR/7TM+K/UpnM66wAzh23ZlBTNctYuuF+9FhMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKUKXEAuRgzTzTXLf88kxm3ODQ24lKdZ92UE3EMa+vk=;
 b=fM3eSvLx7TTZ8kuEEMuEoMUv4XkAMVmfzXm+THc+BtyM02Wy46hLMQBDmQwQcIrQ9GUQMpqWIukEFC5SOnNy9qvBS+AQs4ja7cNqE/ENLQkq6Hpr27rOaifTR/7TxQYxm3WrE+neRrzC56I8798Fll7vQAuXqbtSnUyWkpvm6jbPM/BlCG9Be22vrgWsADfWHrUz85+Iy1bLPT4xT8LuxcD/fjNGuiN13wuK1xQdfick9ZPCjjy9sV0aP5W0HkSV7euc935f7P12D4ivga1cdEaKPTtMgseuRk0JorI9MFNFcWe3gdGC4E70yKSyue5JvivG13ldtaqHBz1O+t5JQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKUKXEAuRgzTzTXLf88kxm3ODQ24lKdZ92UE3EMa+vk=;
 b=BZ6AbjJI3SUCaGYk8+Zoz7PMs3nc7flXMMJryjD4fDnegtzsSsEIA8aiLP4x4ByRMDEBCmc+J2vkYEiVhvxHfKDHobRdID86VXyimolbInASPcBeuI5/Domk2iis47ZC0Gfz6OszHmZS7ZWmfUVYDCZFgdeZvYFXSWFJbxYijdw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW3PR12MB4362.namprd12.prod.outlook.com (2603:10b6:303:5d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 08:48:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 08:48:19 +0000
Message-ID: <74e69f8c-a918-478d-b3f1-24c405abbb71@amd.com>
Date: Thu, 15 May 2025 10:48:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/scheduler: signal scheduled fence when kill job
To: "Lin.Cao" <lincao12@amd.com>, dri-devel@lists.freedesktop.org,
 aamd-gfx@lists.freedesktop.org
Cc: haijun.chang@amd.com, zhenguo.yin@amd.com,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
References: <20250515020713.1110476-1-lincao12@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250515020713.1110476-1-lincao12@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0033.namprd02.prod.outlook.com
 (2603:10b6:207:3c::46) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW3PR12MB4362:EE_
X-MS-Office365-Filtering-Correlation-Id: 093c068b-951e-4826-e3a3-08dd938d3db8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVE4Zzkxc3RqV0k2MGpkSnZtWFJadDBxcVBpL29uUUtybEkza2VVMi9zM2lB?=
 =?utf-8?B?Z0ZRV3FLcWxtcnpxc3Y1ZWo5b0NIY0puNUNIRkFZNGRuNWhDakhlWGNjU3B1?=
 =?utf-8?B?OFgrYll1NDhIMzNscHRtUUZNcTJIZm1DMkhTZFJUbFlaMUpQTFdoY3A2L3l0?=
 =?utf-8?B?ZHN3WHBETEJpZlJmZVF0c2tHZ01WWEttaFMwd1FWZWJsZTE1MkFiem1NcnFs?=
 =?utf-8?B?VTV3cnBlRm9helM3T0hGY0Y5SHMxNTNINFZEdDk2ZnFxdS82Q3NEdTRFQXV2?=
 =?utf-8?B?Q21pTTJEdXZFNFZLRzJRN0tnNTBFcDgyWERQK2gzZ3d2Y3ZQK2ZNdGNjd1Vi?=
 =?utf-8?B?eGFBOVJVVnpkNjg4VUIwdU1QUC9wdXlXSVMvdFF5WTNjdnNMRU0yQ2lHb3pO?=
 =?utf-8?B?NmFOVnRZZzRYczZiYXZTUnFGVWpQSnBJemcyY1pkZ1ZxemRVeUNYRjlvV3pY?=
 =?utf-8?B?V2k5U2tLNGIvQ3dMdnJnNS9qdVQ3MzdpanVOM1AwVUJuTHJwdDB1Mkt5Z3gr?=
 =?utf-8?B?YTZzdjNXVVJiL0lObTF6aDdMWWxaRFlPREZEaFdlRkh0MmhDVVU2RlZzcjR3?=
 =?utf-8?B?Wks3VWphaDBXWGovcmJ2N1l5ZEN0ZU1NTWk4RElFZnRldFlDUStNUVVrL1NI?=
 =?utf-8?B?SHZnUzNLZFYzMy9IcWJEeXdaQ1FURlpsdWlqNnBvdkJCb1crN1lEQ0VGcC9U?=
 =?utf-8?B?S25wVjkzZ3ZSMTlndkdVYVFtaGRQQkszRzBnYkNpRGZtWmhlMjNZa1M4a2F5?=
 =?utf-8?B?Vk5ybmFtWkxuRkpyYldhSkZsaHcrdUdwZVpwZFJRQStPeDZLejRkdzEwVy85?=
 =?utf-8?B?QXNQamxmS2lyaE1zSk5HaE12UlJGTWY5SzBpTFZQLzFRbFhDY0FOZTI1elVX?=
 =?utf-8?B?MU5rTHk4c2lsNHdYL2RSK01LeWdla2xqeXJ2WUNMUks1N2lXNjE1eUpaZThV?=
 =?utf-8?B?Um1tV0Z5emphL0VtdjR4bmRvTksveUdUOSttaUFnQU1JYllodUcrVmxFMklr?=
 =?utf-8?B?eVJzUGpsZzFTaGs2MUVzMGpxMXZ5ZDdLWWtsbHhFbWRTRnRnNVNjbEtEWHJK?=
 =?utf-8?B?eGtVYW96YkdJQXhrOFpCcnlqdXJqamtlajZmeENvTjQ5c2RkeDBIbk1LMEpD?=
 =?utf-8?B?VCtrelhWRVQzTzVqcVVXMU1jczFpOERrQUVoUVFYcDdSZkhnTXdkWS8vYzU4?=
 =?utf-8?B?c1ZwMk5QYzFJK2N5MGNnMktIenMyRkdqbFZ2T3lSalhldzFiMzk5aVVTZVRD?=
 =?utf-8?B?SVpLaHUyZGZNZzBNTGFYUmtjVm41UjBGTkVSRzZXSTZyM0Z0QXBLaUxQcks5?=
 =?utf-8?B?UmdjQ0ZBNEYzdTZXRWVXZ09UTW9XbC9meDZmZExkTngzcDRlekxkSWowWUxh?=
 =?utf-8?B?TEZMNDl4UWg2VHZuajNLV29haEdBbWRmNWhTRVFodU9pSzdvcTJWVDNGNHZC?=
 =?utf-8?B?aXpNZEZwTmd2TjBzQnR2MHhOUlBkUmRWMWs2d2FjMlhiRGFVSUlLaHJEZjk2?=
 =?utf-8?B?U2xuK1lyekMxdW9SZzcvVWJwQ0N5dS81RjBqdG4waTg4M2dyVDc5UC9uYUlL?=
 =?utf-8?B?RVFoU1Z4Z0JILzVJSVJtcVJVdFFJM0pGMzdJQ3VvaDduN3ZiRlFpZjFnazc3?=
 =?utf-8?B?RzRxNnNZUTU0NkRVUkZEK1Z5eWtyWnlNWDFsS0hlbHFnNmxhM3ZBOXc1VjNk?=
 =?utf-8?B?RFJKTVFZeFpkOEovV0hSaExVNFNVTTRkZUptWHgwVnlWN3BBaEhXU0FTeWFi?=
 =?utf-8?B?ME1YQlpZNUVQSW9BZTdWekFuY0lmbWpnUVRoQ0VNeU5IeG4zSkg0aVgxUmlO?=
 =?utf-8?B?bWhPZ3UrK09HN3BvalRIYnpqMFBFR0c5OFVRb0hmMXBCcGQvcnRZVTdRRFN2?=
 =?utf-8?B?SUdTNDhmOG1xNDRRRUhqVHZEdGR0ZnpqaDltMXNSRjhEY2owVmJkYnZjOGR0?=
 =?utf-8?Q?EAiOXvIO4T4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1FSZThaZzZmdlpHRStMZmtYYldlYms0RnI0OWhmS21CdlFlWjlYYnFaUVdy?=
 =?utf-8?B?eXRtSXpaampqOU1oWEN4VWVOSmxDNTA2SUdSMGhtZFVYakNOS25XNUNvdDdD?=
 =?utf-8?B?dndXYWx4NmE0NW9TeGtFREJsTVg1Ry9Ic0YydHVZRVFRTU1sbXBHVHg3c0sw?=
 =?utf-8?B?Sm90ZzRpaFp1WXl1a21XelBwR1o5aFQrWDFYeWx6VFdkU2xpNmRDUkV3UDc5?=
 =?utf-8?B?Y2Jrckt4ZkRCL3B3UXdGSlU4Q3AwMk9zUG5rVHpnL3IrUk5zVDJBVC9ITUho?=
 =?utf-8?B?QlZNcFczWURZaERxdmhrcTBnbTlWam1naGRSdElpTmVvWFBGSWtSSFcyNkZH?=
 =?utf-8?B?YlJDaU9xalBBQisvOUJPenROeVdzTVQ4cFNVMncyQ09xbURqS0prSVJWM0dp?=
 =?utf-8?B?K0NrYUJZZVNkMXlRMEREUHBvbktlOWpIdzlJS0xrL0d5SzhRU0E3WHJkMWRu?=
 =?utf-8?B?L2c4cjB2NXFpT2g1REw0dDVkOHJncmxjUWQxSytlOXI5R1JtL25VRFB5cnNu?=
 =?utf-8?B?eUdhZUVETkFoNHFGY29hMFVzVWd1ZkIxTDNvVi9nbXZ0YVg5dmRMU3BKZTI3?=
 =?utf-8?B?WExEUFdvYkh4KzNOanA3Rmw5TDg5RkpxeTc1Z1ltWW9TYXFPNmV2NE9CUWNC?=
 =?utf-8?B?Q1VuNGRBYmVpc2lTcmloTEt3SDg3VVk1Ymx4bTNlWksyaTJtRDVOUFZoUzBV?=
 =?utf-8?B?MnVPcUc5bXJOM1oweThGY0xMVFpIUWNuOTJqcUU5aEQ4V2lBQisvNEpkeUx2?=
 =?utf-8?B?ZnZqMXBvK3hNdUZLOWZxWnJhWUwyZ21aMXFLdCtZQk1jZUwrcDFWOVlZL0tJ?=
 =?utf-8?B?cDN1TkVSY3ljQ2t0N2ZlUms4Ti9SYjJKck5GU3JJVGdiT2lSNnlOR2dtOFZP?=
 =?utf-8?B?VEVqbVBrN0IxOXhNQUdWK2txTkNPR2pneG41cmt4N1RLYWN5ZHFOeEwvdFpK?=
 =?utf-8?B?b1hzVkRqUDEyYXlvMWRiZHR0NHBGZlBqRzlpNlhQa0hUNDhES085T1psYWZZ?=
 =?utf-8?B?Tnozb0JJMFc1Y0FrVjdOTm9TeDl4M3cyc0hsZ3lzZXJ5bGZGWnNoT05CZWR1?=
 =?utf-8?B?SmZUeHRFbXRTV0pjOUNpRzMvd0l6WlRORXhQZ1lQalRRRHIxRzVwMkVldlFY?=
 =?utf-8?B?UkF2T0grd1FFbDUvS1NRWldaT3Q4bC92RGhOTTBGTWNSL0gvVU1NMmFpNitx?=
 =?utf-8?B?c3BaNXVrSmFETVhaT3pzazRQRjF2aVU3ZUJlcktlL1M1MU1HZWt3TEtoSWlR?=
 =?utf-8?B?Mm9tRXFhcFRobVBPLy90eDkxaStIQ3pLbCs1RmJtT2ZHVVgrMy95VVRYMGR5?=
 =?utf-8?B?ZHhocDg5QlYzOU1MMDY4ZnY4bHV5OFR6Z3Fsb21FWUZlaVRZSE9Eek9aNzhP?=
 =?utf-8?B?MTRtbGpQUjN5WnJRUi9MOWZjdEQ2eEVWM1BuclE2WGdZUW01dStnVXFJRElq?=
 =?utf-8?B?TlNhVmo1aG1jSXZYRmxGRXpZMmRpL0RnLzFQYkFTUjZFaHFFaEJtSDNiUEdY?=
 =?utf-8?B?K1k4VG5zaGhPNHFxNnRuV1NzYXZtRU1DVzJzSnoxSFFxWmhrNGl2QzY1VnVH?=
 =?utf-8?B?MFdOYWlibSs1RmpEMVNubCtCcnBPZ2twQTVreDdLeFpQSTFPdTNqZ2VsbDFa?=
 =?utf-8?B?SjE4U0xUNnhiTStKMFlqOFdVb2NKQ0pCbEY4cEZlSkRLTUlJM2VLNTByS3FS?=
 =?utf-8?B?TmQ4L2NadnJYTWp0RnQraFNCSUlmS2VHV0Nxc21uS0tpTTZkWnF5YlJhYW42?=
 =?utf-8?B?ZnJkZmtVMzNkVGN2OHhSMDNmbmhYNjFOeFg3Y3lWZnUxaXEzbFZudWRibGZs?=
 =?utf-8?B?Qy9VbzZBQ1F2OVYxTVd4dW1rWnVKbFRuOTNNa2pFQjZhdFc2OWJjcGZaQkVx?=
 =?utf-8?B?RTRyZmRaalh0UW5Hc0tBVzBNSlczZ2xWdHpzUlhYbXF2NU95enRxcFoyNHdU?=
 =?utf-8?B?VktxOFJmQzVsOE8vRHMwS0VNVzR3Q2JPTmZuTktJYVdqTkdyOU9jWU5uSmtv?=
 =?utf-8?B?TU9kTVRuaWs4TEl0Q2hZOUNFbDNHaW04eUM4aEZ5T0liZllUMWRSdWdEUm5a?=
 =?utf-8?B?RzVKQnVUblZqMmpXdzF5Ylo0V0ZDVFF6L0tldWNOUXQzWmNadnBoR3dPWEhP?=
 =?utf-8?Q?2iEA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 093c068b-951e-4826-e3a3-08dd938d3db8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 08:48:19.5696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoFBkZWPIkpk+4RAoOUFCUeiBT0Ay64511dnzofvRXPxAai2s1viyVEnsaCVCeje
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4362
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

Explicitly adding the scheduler maintainers.

On 5/15/25 04:07, Lin.Cao wrote:
> Previously we only signaled finished fence which may cause some
> submission's dependency cannot be cleared the cause benchmark hang.
> Signal both scheduled fence and finished fence could fix this issue.
> 
> Signed-off-by: Lin.Cao <lincao12@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Danilo & Philipp can we quickly get an rb for that? I'm volunteering to push it to drm-misc-fixes and add the necessary stable tags since this is a fix for a rather ugly bug.

Regards,
Christian.


> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index bd39db7bb240..e671aa241720 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -176,6 +176,7 @@ static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>  {
>  	struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
>  
> +	drm_sched_fence_scheduled(job->s_fence, NULL);
>  	drm_sched_fence_finished(job->s_fence, -ESRCH);
>  	WARN_ON(job->s_fence->parent);
>  	job->sched->ops->free_job(job);

