Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE728FE7A8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 15:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4129410E037;
	Thu,  6 Jun 2024 13:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cLToC/3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C1F10E037
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 13:23:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdmqBFD20Idoe49dwlItUL7n96t3MRwB0Pungy6966seuLj2Z8bL5ZYn6X5HBrEVlUgIT3TzhWHZpahP/ck1lrmana+xxSpDnkMxV5YxgQ3e5T+WIUZJ2RhOoGF+tz4Qrtda86pALCZNOW3SLNT45w7327bcZ2HBt7jYHsXnVm9Avec9gadC+52teitZrOnCMsX8ektDc7u+Du/th/uWzzLwlUI75A//9WfxEApFNBBV3CJpwNMLCoStyvoUTN7teTTMFJIyB5EbFRWL+1GWa55Ye+eVRd6VCkN6+CrFlwXNGk9+V3E4XOpqW8o9W1vuO7tH87d2mN2QbpxCm7v2fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ku6wcHizlkOQXIWDXxGUhbixV03PjsKoYhI8GZr6weA=;
 b=QnUa/PIClmAUu7cdZAyxmrNZM9gx+xZWYuQVbIvewetvrwn8AZK6oTMjoSjHbDnpvH3u90tG+qlO1gkr1MKnHTMD7f/cV/s6t80PtTa3pX749UPadd9z+/aEU0hIQoGlJPnGy0zL2pvFThWCJ+0hMeWN+JCWlatlElWF1LVnIcw5APd2CEdn924/1j3gUBDlMkWtEbQg0SYxMiwfP15R0OmOMdq+BRCIdNM808RbSMaOzd80Yj7C3xBehSIRkP2npv5n5wlBFv1Wvuq2Z1TlnsihX9AibaoVhbzYeNnz8gDSzZiTMLl4qZI1/HFMaEROXa8AI056xoKFB3rOmwPJ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ku6wcHizlkOQXIWDXxGUhbixV03PjsKoYhI8GZr6weA=;
 b=cLToC/3oB2NbYdY2rkt+Tznz9M2RRhrBwyddk/4uNnAETfpR8TxcDlWPbo2rXK2+FkqJ0KtBGl7h9Ujad9Qa478083rTM2JvFs+TUHzFRHo1BHN84YABMUQpAV6dRcuyaelQ8iExV2TeDX7hwPcn8fsDCGNS9wVHAXodkHRMQes=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL1PR12MB5994.namprd12.prod.outlook.com (2603:10b6:208:39a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Thu, 6 Jun
 2024 13:23:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 13:23:33 +0000
Message-ID: <aa21806f-3978-44cd-8cdf-c5a21066999d@amd.com>
Date: Thu, 6 Jun 2024 15:23:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/sched: cleanup gpu_scheduler trace events
To: Steven Rostedt <rostedt@goodmis.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: alexander.deucher@amd.com, ltuikov89@gmail.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
References: <20240606130629.214827-1-pierre-eric.pelloux-prayer@amd.com>
 <20240606130629.214827-4-pierre-eric.pelloux-prayer@amd.com>
 <20240606091929.6be2f8c2@gandalf.local.home>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240606091929.6be2f8c2@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0352.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL1PR12MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: a8921beb-b33a-4dda-3e5d-08dc862bdd66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|7416005|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STIxRWRDRzBiaVpBYVBlTzdwTjhwcGFoSEorSUlEYXZnU05LYnFLUWJqalZC?=
 =?utf-8?B?Z01LZDF0VWthZTZESlI0SDdQeEo1K0JGQ0crVGVka254aW5ad2k2bFpCdGwx?=
 =?utf-8?B?eDUwemlhWFJDbStuNjJ2RUIvOVdrTENSM2RIcGRwSkJMSTN2aUlhRVVVU0VI?=
 =?utf-8?B?VDlJeWpLVEtrU1l1blhzRHl4bktDMVgrbXlzVDRoVHdsNHRkL2JaZFZjaUpF?=
 =?utf-8?B?azY2QTUvcWRydCtzd0hyK1pkdjB3eVhGNDY3VkNLS3BrVVQvd0tMcGdva3lU?=
 =?utf-8?B?TVJ4S0g1Uy9ydHlYelBkWmhIRUJvUUVQOGw3b1h6QkM2aXJ4VHNKbkJpcGd1?=
 =?utf-8?B?TXhFTGxabWphV2t2TWFJcThaNUt3Z084blNKb0dYNGZ0TEltenNHZmV4MWt5?=
 =?utf-8?B?K2tpcGlHMHpCNGFoVDVoeXJmenpGZ3E1eGJkZ3BScnJCSFhMdnJTK2oybzVw?=
 =?utf-8?B?cVRGUUZDbkJEUWJWcWtZSWx5Sk1KQzRNTjB6dWtTRkRnazQ0a2Y1dHJyc0tJ?=
 =?utf-8?B?QUt0REhERUxFenJheVRGZmlTbHlMTXlGQjlqTWV2QUZXWEdaNVd1ekFUQWor?=
 =?utf-8?B?R1dyTlNqUzJvYUF1VWJ3dlBPQWFyeU9SY1dPZWpnaGw1bFRXcHFiYnQxcS9C?=
 =?utf-8?B?SnphdFFCQmE2cnI1RENJaFM1RjUzS1dBampmZElLZzFncUhPU2tUT0hTcDRi?=
 =?utf-8?B?THB3a01oYjhrUzNKL3lVQ0lpZHJERFB0Tm8zMVNSaCtwMDdORjJScVVCUnli?=
 =?utf-8?B?UzJkMzJuVDRmcmt1QkNQV0x1eldObkhSNGhIWHd5WDZKRVFtOTdlbmJSNDZ0?=
 =?utf-8?B?bXBseFEzME5SZjk2V2FvTEgranNqbFZGSFNhcm4veFpWeUVnN0xQZm5Zb2FK?=
 =?utf-8?B?R05mWkIvZW02WEpYaTZnT2swbEMzV2FRTGVPOERubytRa3R5cWg2STdRMlU1?=
 =?utf-8?B?Tk96QkwybHlvNExPTGZ1bTBpeWtWaVJtUzBtd0l2VUh6SzFVTkZuU1VFYUo3?=
 =?utf-8?B?T05wd1FaMnBOL0hhU0pyeGdoYXFhdEhDMzRaNlBtSmtMcG1BVTlnWjVJejhZ?=
 =?utf-8?B?KzY4M1RmWHJ3b0RLcjQ0NXFZSDNGMFNCdURlQjkzZzc4eVVLYUZtUXJpU0xW?=
 =?utf-8?B?cWlTUGtvOXBzdElEa2xLSVpQTEY3M1FTdkpEMU9HNWNxKzlVcVpwTDJKK2Qv?=
 =?utf-8?B?KzQ2azFaMlVodVdQU0RibElmRWdnaUI3dmNObjFSNCsyWTdLamh2N1FYb1NK?=
 =?utf-8?B?Y2lPMHJFakFCdk0xRXpwU29SWHdUM2NZUGV4a3ZWSC85U05WaFJvUEQ1c1pD?=
 =?utf-8?B?VE80bnVPeHhFcUQ5ZWJ4K1kyeUZ3eHdRRUV3TWlxQWlNRk0xTyt4b0pPZ1Z6?=
 =?utf-8?B?ekZmQmh5Q1BpVDcwZUlJZkFxeTVJYWM0Rmtyci92aEFjOHQ5V0tKbFVCOEJo?=
 =?utf-8?B?dnRJc05KaEI3bUR0ZjE0ZXd5QTlDTFFwQWNoK2s2eC90TVhPL1k4cHUvRDFa?=
 =?utf-8?B?WEUwUi9SanYzWXFLY3c2QnBQcjlEZzkvTWR0alFNQk5JbHhqeEk5bXk3NTN6?=
 =?utf-8?B?U0N2NWFqK2JScHg3RDlBOG5GOW5RVmMrcU42SlRPL0x6bGE1TFV4c2hlRWZH?=
 =?utf-8?B?NW1Qc29Pa0Vud1FtREh6T3JxRkg3SDdyckowK0ZWWDc4QnFIN2pSa2FGQXBZ?=
 =?utf-8?B?VEpvRzlJaHczZXhxWExrb29aT3YzTWtuU1pnbThtNkw1aWJYY0JZL1pWQUh3?=
 =?utf-8?Q?MvWDwhdrKaUCimxU8vwFTgCXkf0j6L4Wb3WiKzW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2twZ2lKYXI4RllwWm5kZFQvWkNBV3NieUhjWTcyT2tiODRnL2ZLeXJ0NFlL?=
 =?utf-8?B?NkpybXZjTndOKzkwQ01UTEJheDIvMXVtVXdCVVVGZlhRSlB4bUMybzd0bnE5?=
 =?utf-8?B?VDd5UzRZVEhBOVpSWWRkYkdYeWJsaFdCSkFLK3ZUS2h0eE01VytDRTVxMzdk?=
 =?utf-8?B?Q0I4TEYvSm9RMzNXdFlwM0hqMlJuVU82dGZLMHA0a01xWmJJTklDWXZjYklK?=
 =?utf-8?B?ZEFMMlo4MFRRc1E1WmwySm4vS1pSL2JvaisrSTNYU1Q3ekF3VW4wb2NoK1JB?=
 =?utf-8?B?SmhqRFJ6K3dPejIrZVhGSEt6VURZdVFBaFFUNXF0VDg0Z0NleGQwK3JFRnlH?=
 =?utf-8?B?Sk41SzM3TjA2a2xtR1ZpaUYyc0NCeTJwajdCY1ZwNmUwSmJlKy81MlNsd1Fw?=
 =?utf-8?B?WkN3dFZMTGVTbEUrYlBCQ1ZiN0tPUGF2Q05RT3gzUW9Lb2RJNmlEdThxTGww?=
 =?utf-8?B?UGh2YUdRTG5HeHZIaThBc0hGdzlhajloQ1R2bldJZmlOUlp4dUVqYjBpYUpr?=
 =?utf-8?B?SldvY2U3Z3U5SCtBVHgvK08rS21xQS9rQmlBYUkybzcyU3NwS0VJbzdqZkVw?=
 =?utf-8?B?dVhDT3FDSjFUZXNpVU81M2ZSOXNRVnlYcnFyQ3Y3M2UzMEZZNDNLR2pIVDZ4?=
 =?utf-8?B?c0IvZWNoeEU4MlYvM3dVNnJuUWoxUlRXMWNaTjRBUlZEb1lVTEpUWmpaRVRB?=
 =?utf-8?B?VTZyRXZzcGJZdHZEV00zNGtGRlEyc05FQmQ0OTlhU3hsbkRiSWRSVEFLTkZz?=
 =?utf-8?B?elU0VHBtR1NSVWJWdnhsanhqcHdmellYVXJJa3QzMDM3L3kvMnladm5lKzZM?=
 =?utf-8?B?U21kbENyR2hjZHoyT3lkYVlZNzhZSENQRTJqNEFPVEoyMXJtUDNXSW9CODdB?=
 =?utf-8?B?ektreDFNZHNPcVVRQXgzOFd4a2hXNXdzMERVYTNJc1lvQytDVE5wY3NlTThY?=
 =?utf-8?B?RWMvVWY0VHRMejA5bFlORkZPaGw2c285VEVmU0lhMjRSRzJuUVJ5TXBjUTFY?=
 =?utf-8?B?RzFaUE9aVVhGZGkxN0U2dFlncGtlcVgrY0NzemJPZjdScEY2cUp0ZDhraWlP?=
 =?utf-8?B?MGt5U1JKUEdhUFBIYnpWQTVnS2hudmM0UlNxd1BCU05NY2w2Nyt3eUdQbnhX?=
 =?utf-8?B?T3NCMVg5UmlZUDhtRnl4bmU3cGtEVVhqWG5sOUNVRS9aRjQvY0d3d0xzOXZ5?=
 =?utf-8?B?Rkh3Tzh2cHhhWGUrREYwZHlqS0RybnBHdm1OS21WWC9kUWJGUGlUVks1OWNj?=
 =?utf-8?B?ZWZSaW9QVEtSRGRqYlpEL0ZJZkJyblJ3ckxVMjZXZ3phdStueDI3Y205cTh0?=
 =?utf-8?B?dWdCVXVvaWp6V2h0TWJ4MXRnRWVqbVNKOHBPM0JIRjg5OXVFYTNOenByRXYx?=
 =?utf-8?B?Z1o5T2Z6cUpPNW50eGZWRCtjSnFTM1VjckZZOWhmcU5nbEdxY3hkMGZVSm80?=
 =?utf-8?B?Njc2cTlORSswWUd4VkpmcmhpNzFEWndVOXNDTnJjeWNqTzhlYzE3RnJpUjlC?=
 =?utf-8?B?bUJhRFd0TWNwbzhkOGRrcnBJVFRTWDlLWE5kdGMwUEZ5WlAxMm1DNDFJNWxo?=
 =?utf-8?B?WUZwelM4dzJBTjJTR0hud2U0dFludkhBaElFM1hiRUNMWlVvK1hDaTNpb09z?=
 =?utf-8?B?a0xBcXdrWUdmVi9mQ25YUG95RDF5MWVHNzd0YUFCVVJsVklGNE42UmpXZERn?=
 =?utf-8?B?VkIxWUtGTU9xYjE4UWs1b1pXQlExV2pCVTIxNDExK1BGQkFxTmpORWZqMEpH?=
 =?utf-8?B?emxVbCtvNWozS0NjYXRXVGUySUh6eVFRZ1FVSEQzZDhWcDRLMEtoUy9ka2V3?=
 =?utf-8?B?Y2E0RnZDMVhVWktMbGJuTnFkQWF3SjNCNS9HOFVuWkgxR3hoODFxSWc4SHVZ?=
 =?utf-8?B?U3Rvd2lhTGNkcjZJSW1KRWtqZFBSODA5Wmp3ZDg2bmVHL3dLYkQrajFmTG44?=
 =?utf-8?B?SEtITzVMWk4wb1UyK2p4SVdUSEVuOG1DMm13bEgrdkFGd3FDWFAyanBodzNa?=
 =?utf-8?B?emx5TkFhZzlvL1o1UjVrV3kvNTRJcjFHenFsYXp4TEs3R0dzZUFKbDZZa1ZG?=
 =?utf-8?B?TFdmUWtuYW9uREk0SEorYWJOV1BxK0F1bHNrMC9aMUk5SGVob0tsdHB0d0xx?=
 =?utf-8?Q?NxobFeiOdRIZEko6RsZF7b/1P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8921beb-b33a-4dda-3e5d-08dc862bdd66
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 13:23:33.8702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdEO86iAtlXEwcRemr02tuoGHkDFqttQqUlND3CFGAKlUa1uQaMoX0J9upckGWPZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5994
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

Am 06.06.24 um 15:19 schrieb Steven Rostedt:
> On Thu, 6 Jun 2024 15:06:24 +0200
> Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com> wrote:
>
>> Print identifiers instead of pointers:
>> * "fence=%p" is replaced by "fence=(context:%llu, seqno:%lld)" to have a
>> coherent way to print the fence. A possible follow up change would be
>> to use the same format in traces/../dma-fence.h.
>> * "entity=%p" is removed because the fence's context is already an
>> identifier of the job owner.
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 27 ++++++++++---------
>>   1 file changed, 15 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> index 0a19c121bda5..2d7f2252eb5d 100644
>> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>> @@ -58,9 +58,9 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>>   				   &sched_job->sched->credit_count);
>>   			   __entry->dev_index = sched_job->sched->dev->primary->index;
>>   			   ),
>> -	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
>> -		      __entry->entity, __entry->id,
>> -		      __entry->fence, __get_str(name),
>> +	    TP_printk("id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
>> +		      __entry->id,
>> +		      __entry->fence->context, __entry->fence->seqno, __get_str(name),
>>   		      __entry->job_count, __entry->hw_job_count)
>>   );
>>   
>> @@ -72,9 +72,9 @@ DEFINE_EVENT(drm_sched_job, drm_sched_job,
>>   DEFINE_EVENT_PRINT(drm_sched_job, drm_run_job,
>>   	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
>>   	    TP_ARGS(sched_job, entity),
>> -	    TP_printk("dev_index=%d entity=%p id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
>> -		      __entry->dev_index, __entry->entity, __entry->id,
>> -		      __entry->fence, __get_str(name),
>> +	    TP_printk("dev_index=%d id=%llu, fence=(context:%llu, seqno:%lld), ring=%s, job count:%u, hw job count:%d",
>> +		      __entry->dev_index, __entry->id,
>> +		      __entry->fence->context, __entry->fence->seqno, __get_str(name),
>>   		      __entry->job_count, __entry->hw_job_count)
> NACK!
>
> You can't dereference pointers from TP_printk(). This is called seconds,
> minutes, hours, even days or months after that pointer was assigned. How do
> you know that pointer still points to anything?

Yeah, just wanted to reply the same thing. That is a really really bad idea.

You could in theory grab a reference to the fence, but we usually try to 
avoid that as well since it prevents modules from unloading.

Rather move the context and seqno directly as values into the trace event.

Christian.

>
> -- Steve
>
>
>>   );
>>   
>> @@ -88,7 +88,8 @@ TRACE_EVENT(drm_sched_process_job,
>>   	    TP_fast_assign(
>>   		    __entry->fence = &fence->finished;
>>   		    ),
>> -	    TP_printk("fence=%p signaled", __entry->fence)
>> +	    TP_printk("fence=(context:%llu, seqno:%lld) signaled",
>> +		      __entry->fence->context, __entry->fence->seqno)
>>   );
>>   
>>   TRACE_EVENT(drm_sched_job_wait_dep,
>> @@ -96,23 +97,25 @@ TRACE_EVENT(drm_sched_job_wait_dep,
>>   	    TP_ARGS(sched_job, fence),
>>   	    TP_STRUCT__entry(
>>   			     __string(name, sched_job->sched->name)
>> +			     __field(uint64_t, fence_context)
>>   			     __field(uint64_t, id)
>>   			     __field(struct dma_fence *, fence)
>>   			     __field(uint64_t, ctx)
>> -			     __field(unsigned, seqno)
>> +			     __field(uint64_t, seqno)
>>   			     ),
>>   
>>   	    TP_fast_assign(
>>   			   __assign_str(name);
>> +			   /* Store the hw exec fence context. */
>> +			   __entry->fence_context = sched_job->entity->fence_context + 1;
>>   			   __entry->id = sched_job->id;
>>   			   __entry->fence = fence;
>>   			   __entry->ctx = fence->context;
>>   			   __entry->seqno = fence->seqno;
>>   			   ),
>> -	    TP_printk("job ring=%s, id=%llu, depends fence=%p, context=%llu, seq=%u",
>> -		      __get_str(name), __entry->id,
>> -		      __entry->fence, __entry->ctx,
>> -		      __entry->seqno)
>> +	    TP_printk("job ring=%s, fence_context=%llu, id=%llu, depends fence=(context:%llu, seqno:%lld)",
>> +		      __get_str(name), __entry->fence_context, __entry->id,
>> +		      __entry->ctx, __entry->seqno)
>>   );
>>   
>>   #endif

