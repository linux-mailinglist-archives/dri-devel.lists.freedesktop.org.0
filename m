Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704255B2054
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 16:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A9010EB1E;
	Thu,  8 Sep 2022 14:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4ED110EB1E;
 Thu,  8 Sep 2022 14:17:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiG7dnDghZs8eorEvpg9XDIEg146QdsZlNNS1Ulpi5OBe2bpShWgmRMUOBNwJoZMK84qBJCoW0FxX5Y9WqhRSp2lsyoAoIt5QFccEkoWycuFqIDCNbsmk7gsIgL3Kd09doVTXd6LZ6w1XoCem9OwW0EfUSLvgofeO+nPu9SSElUYoj5Ac1NyqODNglBqlRWlBCKSHVuJoGTu/vNu/JdB8KX0VSTGto2nIc15eKtbrOpI6fOoQCIfcZBNZNSbUVkZU60GRJTlEnQdTR4ncXopwoGQ8XWCn+vL4nMPSEn8j+FgcY5KZ92NtyReMc486PHZh4Qwk1qlptg0Qc91OWXiuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHsKzpnAG6l4wWNuR/QqRvkEUVDDxw8kplCOYWBAjB0=;
 b=VItKrgotyO2HAj120moIo+jCq0o+e4Fo7myxKicn/05+O5wKRlUxfsNBvJPni1qsu0ZHJzv6PX+0sJtDzPDXQMvc04seQn0nd6hTngEuXLIjrGFu6taAm3HHC+nPJ3KaDeqhrsinl68vM6QBPLDx8/Wb4O1Fx8DtU5tJilx8vDOCqHFbreUzTsqzklsfRn8yMYtXD3tMAVoMqPoADzSWFH8YNpyBUP4Jvgx8/cJmg/R4E4qvTrV54nInMa8meQmfn2z3wJy8ovJMM8nB/VU9AFuc5p1z7lKyGyghStP41u1GcUdaeH/EpaTr7sHBXXtmBeuK9p5RW6VrPTWEiT03JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHsKzpnAG6l4wWNuR/QqRvkEUVDDxw8kplCOYWBAjB0=;
 b=hFyEw2A2k5rNSxR5lHo+vTovSVgTrvm/90k2WblrJMi/v4cM2bwTvWsUMW/2/ppPhvV+Plj4Her+qmeA9fu5zSZi1I2em5gknjb8Sd4S6HACQGyjDMIGS/KUfyZTHdugZLeWW/N7T9ZIUj3I8PHejXlPLJGgqhhntewVtrNBPXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16)
 by DM4PR12MB5054.namprd12.prod.outlook.com (2603:10b6:5:389::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 14:17:24 +0000
Received: from DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::d503:c616:dcf8:2ae8]) by DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::d503:c616:dcf8:2ae8%8]) with mapi id 15.20.5588.018; Thu, 8 Sep 2022
 14:17:24 +0000
Message-ID: <f0f334ce-ca38-8a84-330e-c586fd813f58@amd.com>
Date: Thu, 8 Sep 2022 10:17:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/4] drm/sched: returns struct drm_gpu_scheduler ** for
 drm_sched_pick_best
Content-Language: en-CA
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 James Zhu <James.Zhu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20220907205705.934688-1-James.Zhu@amd.com>
 <79af80cb-7438-1105-c24e-d3a874a0b4ca@amd.com>
From: James Zhu <jamesz@amd.com>
In-Reply-To: <79af80cb-7438-1105-c24e-d3a874a0b4ca@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0426.namprd03.prod.outlook.com
 (2603:10b6:610:10e::10) To DM5PR12MB1753.namprd12.prod.outlook.com
 (2603:10b6:3:10d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab85845e-4f93-48d7-010a-08da91a4da29
X-MS-TrafficTypeDiagnostic: DM4PR12MB5054:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gtzKq6kI0h/INhGiKkigfsSp3xS/w3SoFr4Mgw5AbTjTeOeuc/UUMkMp/gsO1KvDfJpr1dl46au+pTMl/DWWI78iD+dq88AIpZ9D+Zqpp/LP0jReVKgfA7bPtZEP5WAKFYvYP+8VqnsapWAIhgx2t6jRwBIKV2nvDjndrhT4R9rkMQ1Q2apntUh/ypeGqJPosqAM+HxpzRs4WEJnT8RjvyN7B89baaELpYWiH5ga97tkUldQGsV0lDenwIR9k4Ge3PIjUDV4MiDCV721MSow2F9MFWkc073nRibltPAn5d2njiZL3orCsZpM9UyIXjyThW3zXFaCiVbB9kGkRErfzEnDwVIHarPQ3lHqCSu/sQUOUeaksaD5ZKbK/nL9uFp+t9mxP6D2cWXSpm06IsoOq+LZTndUFKide36pcehD/RZG9IFduzC4lismGPwZkJtH9TgLdn6w5Ljjfc7fMH9LTyi89jXS/WnUk4Y8vQn4e246C0Ey+af9BUNh6unl+gBJgfpz38xPjNEJbQ3Ad9PhbVsaLZPDbfzBT95+ktesbmViSam32DAhqZpF3ASAmuLv0qIE5JFCQfvgXPlv9ku8Rr+I3YMFwwerxO3LPavX00lA6LStbJcx9tFQxWaAPFxdU4qqzkPYMCa+IeCQCc+JELW/XTr9T0E2Hi6Lin/QBPlq0u3mKNP+nLBYeGrqc/7+EETl+tU2Agat2/5k86YX6IGPT8GTdHljynxGl/+2W/oKE39oM1cWAdkgMtRnfJDepi1TtwHRmYswFrDf7E1fJAaFjHriDZL61TUpQYp4410=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(2616005)(6486002)(186003)(53546011)(5660300002)(4326008)(66476007)(2906002)(450100002)(8936002)(8676002)(66556008)(66946007)(6506007)(36756003)(31686004)(6512007)(83380400001)(41300700001)(478600001)(31696002)(26005)(110136005)(316002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2NpMVM2LzNMbVJTVXZkMVlwT2h2bUVZcXJjQ21odWFaUUdicjVON2J4S09h?=
 =?utf-8?B?a2drcWFkMEVUQnNxaFpwQUE3eTNRVHp6TWk4VHpLQWdBZDd5QUJCblVDa1U2?=
 =?utf-8?B?RG5WZ3lrWDBFMFplNGtHWHJnTUtnSzRXVDVJMUlKdnJFWEI5RklETk91NFFU?=
 =?utf-8?B?R1UyWTV2aURRRlZ6Vm5lV01meGZYSFhHNC9xajVpek5MWXNVUitVdzEzSVZR?=
 =?utf-8?B?R0NMOUp2TTE0QW1UYkRLeUhzWkYzdHUwSGZZNTJ6dmo0d0pqZ3BnMDZoUDhk?=
 =?utf-8?B?Nk9lV2k4Wk83UU40OTZXTTF1aE9pNS9QMjE3ZTMzaExTNkNPSmhVSWxpd2t5?=
 =?utf-8?B?TlZaNUVDWXhmMmtFZlZzQWMvRmR4S1VPZExsNjJqVXlFYnhDckJHcVkwcUxS?=
 =?utf-8?B?L1lCck84MG1ER0tpZ05Ta2duZ0ZiN2JhOXNMK0VoaE9YT0x1a3U3NlhhUTZW?=
 =?utf-8?B?WkwxQW1ObnVZckkxZkZmelh5TENOVVV6YzNiQjNVMENXMlE2Qmx2T0RHR0l2?=
 =?utf-8?B?ZlcvUEQ2MXpUT3RvRS8xUU1CUXFhNGpZdHJtKzNTTHF6cEErNlhwRzBvekho?=
 =?utf-8?B?NEhmbXhRNGZmUDB4VFNCeWRmY1FROC8yMUVZaUkrM0ZTYmRWRXJadmRueDBC?=
 =?utf-8?B?RGllNGltYnAyaHRqRzc3elJDSmFoWWdWRHdVR2dDdFE0QkhnK0RSZU9tY3JT?=
 =?utf-8?B?N2VpK2taeWtnZ1VTM0hLUDE1L3R2U0NoYzN1V1BTaFV1RkpQc0R6Z2JEYndE?=
 =?utf-8?B?ZlJkeG1IUklvZkd5UE5NZW92WFI5bWhhN3I5QytxNFgvd2poYUZxQTFjdWZC?=
 =?utf-8?B?NlRSVmdEUEtvRElDQjdhbTcrQWhDeWNlM3E4SVNCUW93dUd3SFlTRXdKRDVq?=
 =?utf-8?B?SlVMcGVMeTlabFlFVGhaLzd1U1B6SXl3OW0vc0hZU1U3ZlN0OWZycm00ME5W?=
 =?utf-8?B?dU5PSGw5SnFaWUdWR1NNU09nNDN5UVlzQm5hZE4yeXJGd2dWd082YnZhZk9u?=
 =?utf-8?B?RmtpVWIyTVpOWVF4bGIvZzUyNXQzclRiSXM3MWZjWGJrckhXMGpjR0YzV3J1?=
 =?utf-8?B?S21SaU5EblpJdW40Zk4rV1d4WDFBMHJiazVwb1o4NEpWeVlZZVJCc0hVNjZ4?=
 =?utf-8?B?S1h0VkVQaEVCbDJidHdXb1lMQzBTc3NOaWNwdDg5NGppT1IrZ1dsbWpNZm5E?=
 =?utf-8?B?YlRsRmhoSHU5YUJndXI2L2ZTNFMrZXRjYXNFakhJaVFOL0ZGbngrR1JmajVz?=
 =?utf-8?B?VTRpMWZScjBwVWFJa01wRm9aaU01blJPUnRIRGxUT1REbTMrdXZlMWxERjQ0?=
 =?utf-8?B?RUMvdmFMUTdwdlhkS2hmeXJqQlFHRzVtdFZ1N2NSV1JHcTFKVFRkaUJDdDRs?=
 =?utf-8?B?eGphdlhTL2p2cHdBT0VsTE1wa1ZQNnpqeVY2OUhoajlyNHl0Ky81Y2tIZHBH?=
 =?utf-8?B?MzU2b3d6ZXNwWkRMSVlTUVgzbE9ENjY3OXZ0SzZNQ25LRDAvSTYxUlJxcnhp?=
 =?utf-8?B?R25ScDFjWUlhYUU5MFNlNGhLaWVXYXpaY2l6bEpCY0lrZVZQVTQrYmZ1dTlO?=
 =?utf-8?B?NDNJb1NadnFuY3QyL1UrK3BXSjhGMUE2UEk5YmpBQTExdGtLWFhTaEdIekZw?=
 =?utf-8?B?cFJ2c1RvRHJCenUrRi9GeHBjbkIxamg5UkY5bGNhNWozbGFuRFFoaVlNbzhi?=
 =?utf-8?B?MUg5RTFqYlB2SVRncXd4TDM1VTN2TzJYbmN0VjVRREUwTitrVXJuSHkzaWIx?=
 =?utf-8?B?ZzBzV2RKdHpqTFlUb1h3VkNHdmJCeVZLemZQWXRCMnFEVmR2R2tBMThMbGEw?=
 =?utf-8?B?bjQ3TzlaS2pYNU5TWVljRlJWRldSU1Q2ZDNOOEFrVUpCSitncGZHOVkvRkR2?=
 =?utf-8?B?TkNkMklkNDUrdE53bzJTNTI4VHAvNVBVMmt0RUpoSDhDc1FJdEZ4aUNzMTVj?=
 =?utf-8?B?NEhwdmxEbnZ0UExNSTZyeVNVQ040RHpEd2MyT0h3cm9zaVRVU0FDWTZYNGo4?=
 =?utf-8?B?aWtkMk5Bb0tYWEV0dWpJWlZlMnoybHFQaDNEZ0NZU242TC9mak1FV2dlTkV0?=
 =?utf-8?B?SzU1cmo4di82MzhzektQODd4YWdBV2NWYmg1RXJ4S1czZjUvTmk0YTBZQ3M0?=
 =?utf-8?Q?8ivP4Y8pQi45ISr35BF5aduUj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab85845e-4f93-48d7-010a-08da91a4da29
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 14:17:24.8537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBXybEo+z9HzL94HiB8XImgo1HWWqFVdAfZqmauhdpM3dj/fWeiQeptAE/8/vMv7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5054
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrey

Basically this entire patch set are derived from patch [3/4]: 
entity->sched_list = num_sched_list > 1 ? sched_list : NULL;

I think no special reason to treat single and multiple schedule list here.

Best Regards!

James

On 2022-09-08 10:08 a.m., Andrey Grodzovsky wrote:
> What's the reason for this entire patch set ?
>
> Andrey
>
> On 2022-09-07 16:57, James Zhu wrote:
>> drm_sched_pick_best returns struct drm_gpu_scheduler ** instead of
>> struct drm_gpu_scheduler *
>>
>> Signed-off-by: James Zhu <James.Zhu@amd.com>
>> ---
>>   include/drm/gpu_scheduler.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 0fca8f38bee4..011f70a43397 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -529,7 +529,7 @@ void drm_sched_fence_finished(struct 
>> drm_sched_fence *fence);
>>   unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler 
>> *sched);
>>   void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
>>                           unsigned long remaining);
>> -struct drm_gpu_scheduler *
>> +struct drm_gpu_scheduler **
>>   drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>>                unsigned int num_sched_list);
