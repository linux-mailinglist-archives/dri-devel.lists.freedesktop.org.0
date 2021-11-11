Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C29F44D5EE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 12:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D1E36E09F;
	Thu, 11 Nov 2021 11:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FDB6E09F;
 Thu, 11 Nov 2021 11:36:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxjsjkRUugh16AQOyIKmg8mawSmqpx2OR1W3CoXgRtiWlRroD5bAalGrm3LKgAJ6OiLPLqFUIR/Vin1fetfm3Ejbbg7X0Mm/sZ5opH9JH3ZPknQGuE+Mi70vdj3Hveo7JYAHaI5FLZfJ0px3RLf0gWbpEMNUROMjoNvht8vWBGoGgTHQfknznmlRZTXFTHUl58VYLePZg3Ora+9RiW6XI8GQKkGzBRAyNqzeogRfuQqP9rXdLGyH1UcQS8fLTTWXKD+wNpWfV9MTXlCcmo8XQ3ZAuiifrpDqsWpxmp9oN5ckYO53GUMhuqScSQtJlZNy0r9OE/nHvRHpQ8zlVvZpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffrnAwBdzKrchNUKw0vItkKwfPAr8pqK9VQQMWq72Sw=;
 b=ExgadrwDpbop5UT7xRS98WZXWtiuQHrYtY0ArAn/QjcyWf9S383H1fvstqqBO5l9IHQIQG9+8/Uh12UebwFdukGzkkYrMcCP6icO6oBR4SGoBuu8iaiKGbs7CSuFxZiVahIxuKE646zKoYSjTPVlaoXSftbi4s1lWvn41j1mdU2vBZ5ASfcscmwf7Hde/cUva0BBxdJYu4AOVH4nXJubdddXJA8EqLbSwfiXG6Uobvv2AX5vpHacRe4ekh9V/h0rB/spBCpeC2ccFJ5pAtnOotVfsx63Pbu8u2dXMUkps7ONZaBYiHejA3V9cku5sp2kMORChCSHLSYAMrl9aATahQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffrnAwBdzKrchNUKw0vItkKwfPAr8pqK9VQQMWq72Sw=;
 b=yHC2/VgSucPpEKDz7eRdzYKh6lh/5mBH7rRPFSsXTCwHxadwbICUrVGSyu/TivDVol1P25IlDJsHfLsMj19AM6V7kZtbatutohO5L1UrJPCb3Z8pLK+6kW9ln0FC0upxDeYVzUYxjeeGGrfnzK9lRqQjoQ9rlKLh+eubHF6d7ug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4491.namprd12.prod.outlook.com
 (2603:10b6:303:5c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Thu, 11 Nov
 2021 11:36:55 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4669.018; Thu, 11 Nov 2021
 11:36:55 +0000
Subject: Re: [Intel-gfx] [PATCH 02/28] drm/i915: use new iterator in
 i915_gem_object_wait_reservation
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-2-maarten.lankhorst@linux.intel.com>
 <022f8ecb-37c0-3d67-563f-012f0a3651df@amd.com>
 <c7c82fa5-6fe5-33e2-e224-c5433020100c@linux.intel.com>
 <007050d3-0207-5226-0cbe-7a3d8679811c@linux.intel.com>
 <810de535-0902-04ef-be13-35c978fd80bc@amd.com>
 <YXrCAaGhLVtduUfa@phenom.ffwll.local>
 <f62922a7-344d-3e81-b391-840298f833d4@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3c419c82-65b7-d9a6-59d9-6683c359933d@amd.com>
Date: Thu, 11 Nov 2021 12:36:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <f62922a7-344d-3e81-b391-840298f833d4@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM4PR0701CA0041.eurprd07.prod.outlook.com
 (2603:10a6:200:42::51) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (79.194.4.163) by
 AM4PR0701CA0041.eurprd07.prod.outlook.com (2603:10a6:200:42::51) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Thu, 11 Nov 2021 11:36:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fb327b0-be16-4561-827c-08d9a507902d
X-MS-TrafficTypeDiagnostic: MW3PR12MB4491:
X-Microsoft-Antispam-PRVS: <MW3PR12MB449166D330E1326864DFE6B383949@MW3PR12MB4491.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SZFNP2iTREFXxkh49LKic+nfL/5V8Qf8SVRBQrK0yaX7n+jMxq+Rwor0t8FcrnTNyVI/O2M56HEV2RvWQf9wj8T8wHUiQcxXkUveOXKVW65+w0/0B1z46Qr+4PDVnLnoyb/5mISvPLOhCvN/cDneQoh7m/Q5aHEehkCSa6VaAvw9Q1HeU2Gpt0lZSZQjTr0TmgdT2uWJhubro4sxTyuK6DpjohDdtgrgqSkzMT46iijVhmEt8NeQ+89dKwi58MtFEMenXnzwRKZHB8BLa6B7Jhn1XYsZzulfFx8zgxPymTbGADiDHsfe6+LqDwg7/5iHVJENmhk1O2c2mOQFzTEv95NlGhBK9Xq2iv1TDzCSsLaULDFOzCvjQb6lf48ZCxFbtaPafr9qm5xDpGYlqLMwvQSBAU5BVF1nCjzp1Lv8TgrQTUCcN4g9sGwAEeljnaVokZjfxp7J5peKps/WsObpplHv1D7x/cNUj/dIzzoUjEyrloRFGMNtLaTPkvwSlTiXVmn9TCxoafx37c5KCmGDcoJnoUthdcrHmeKD+6iUmnn7XB7QGBZO+rnSPjfoV5QQ8Ur680vEaNg5rI18rrnqu83Uk626RVjAzUJ2aesonqf22DFYK8QUUsjlHpnbaDjqpl8TX6bInlC9Y1r4aMjaVID/C8hgXa+PnadzpSqIkcY6NHwi8P4T4xv0iqvFXFw7ZrT8F4+BOUMJvViO1uBrBa21JbYFaA4UgY/WLk0660AGJI3wiVijeUSlzPU7pley
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(86362001)(8936002)(110136005)(26005)(66574015)(66946007)(66556008)(8676002)(38100700002)(31686004)(83380400001)(66476007)(36756003)(53546011)(5660300002)(2906002)(6666004)(186003)(956004)(31696002)(4326008)(2616005)(16576012)(316002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aERjcEtRRUUyM1pJWUtheThWMWQzbjllMXFGSkllMjRJd0VvNlJUeEpIeTI5?=
 =?utf-8?B?ZG1kOXVTdkdweGpuRXQvZEh6VEhHaEo4WlVkK28rbjlHRUp2cWdIYVlWZ2li?=
 =?utf-8?B?emRMMWlXZDhrK2JHWGJRRWVyRy9pa1hQRjBYTFlsMkNnR3FaU1VlZXRBZzhq?=
 =?utf-8?B?YzIrV1dnUHBwN2FlQml2Nm1veUd1bVJkZkNxRkl6MmJVOEdBbWcxQ1Q2RG5F?=
 =?utf-8?B?M0xBRTlTZU1kaklKZzVDOU1KMjNpeVJWTk9qWnQyekExRjdWUmJYRE9LSFhx?=
 =?utf-8?B?dlZsd0NScnlzZnlEaEpuRXNUVlJmNEtPNnlHZGEvZ3krWWN0STR1bEN3WWFQ?=
 =?utf-8?B?WnA2MFVqcGVyM0FwYUVuNzRrL0NqRVA2NEQvTk40VlNMdlpRcUxJR3NZUHBN?=
 =?utf-8?B?cGxxakdPMHJ1S0RidjQ5VFlUMWg5ME1lVy83MExRQlNXc3lBYmwzVUtGV3Vm?=
 =?utf-8?B?UVcrdmRWRUZ2dmdxUVZ4UnZlMUJkYXFqVU1xelluSkVxdTRianFPdkpVakV5?=
 =?utf-8?B?L1RtdEh2anVmTTYrVmZUakU1V2JhcDk4MnBWUUQzM1ErdDBKOGppOThsM2Vu?=
 =?utf-8?B?bE5DL0IyWlpTTFU5a3hZM2V5eHR5ejdNSkJmRklwcEFVOEIxWU9PYkYvaVRv?=
 =?utf-8?B?RVYzdVNRR0MzWGIwWFljTHhaTDRCZ3k5Sk5wWW9FemtTVmZNbUZKQXRJUDR0?=
 =?utf-8?B?cUoySzVXbWVGWHQyeUlMYmRKcFRpVHVQejYyWWpHSkRIcGhVczZ1c1ZjbndQ?=
 =?utf-8?B?RXk4ck02bmt3Y2ppYTR5cGhnbVk2Wk1kamlRRURNVWZCN28rZ0ZDUko5czVQ?=
 =?utf-8?B?RVlrVy9hLy9CdHVobmdkUEhBaEh2T0g4U2djOEVYYVVsZllJM0Y3MUdlNkpl?=
 =?utf-8?B?TmRnWWZrUGFVV010R2JoRGlpdUJTYkRySktIckRkVHRmWU41aTNFRGZjellD?=
 =?utf-8?B?YmhLTjBacWQzR0NqYmh6THh2dTh0Um1UeTc1UlA0bHZ1UHVHQ3NsOXFTWCti?=
 =?utf-8?B?ZUhpZWpxNThnV0lyQlIwaUVqZGtWVmtSSTZSalhnRGFYT2N0MFpjSVBxRjM4?=
 =?utf-8?B?dnBpNi9mQkFtTVFOVHVtVWtvT3NsajBzY3VpdG11aFFZMXJ4SGJOMTkwVnpP?=
 =?utf-8?B?eTJmaS9IMXNlQm91MithYXBBWmdFQW1jQ0wwYUR6aDRRQjNBemhKVkEvd2pj?=
 =?utf-8?B?RmE2MDBIdDBuckhma2NLWUtCQlJEU3cyRVhoVUMzamdrRVhLSDVlRDYwck5w?=
 =?utf-8?B?Zm81enRQd2RrRmgzY1BjU3ZFZkFtYlFJZnlaQytBRUUyUFFRT3JOejBpUEJF?=
 =?utf-8?B?MUhEWVdvUEZCaFhCVk5OWUp1d05jNmpsRjFTd0NBQnVzRW5tck4vNUl1d3dO?=
 =?utf-8?B?VkcrR1dXSmg0L1J4RWdSSXNUdzRHOGgwZCszRXpGSW5zRjU5MlIzZ0xsdzVh?=
 =?utf-8?B?aGZkTFlKWHBLc09EcWE2REdtQStGeWpwUkdJYm9ZRnVyOXVXR0RDT0VpdHNJ?=
 =?utf-8?B?MnU5QnRJNU42aktXbW1JN09CNXphQ0ZIeUs1S282Mm5rc1U5ekRBcEtJUHJO?=
 =?utf-8?B?OGhpd2VGeklVUHVjbmRaTTYvc2pKdkVvMEp4MSttTUo5QkJDTCtOTFAzcnlq?=
 =?utf-8?B?WkxmZFphaU8xcjhKak5CendaUDc3S1BlZUpCeHBmbWVwaU9mVlpnMkFoczIw?=
 =?utf-8?B?NTJySms1Q0JWTTV3OXYvUFFUYjRPRDh3eXJnaEtuRUNFekh6N0ZjRDdzK3BL?=
 =?utf-8?B?SDFDSHlubkxFa2oxY29rTklCbm9wbnlsWU96OHhyUWl0VHBpSVlWbUpIMmlj?=
 =?utf-8?B?bHVTOXVSclRHVGxZQksxeUhPYVhuOE0vU0U3cVEyUlBETkJlMnE5NW0vdmYr?=
 =?utf-8?B?QlVGYXJMRnR2Smw5c2RqeW1kY3BpYkVvOTlHd29XVnkyemJzVVpZQkI5OUow?=
 =?utf-8?B?aWl1TDJNdUZaTEYwT2ZBSEs1dHlZdzJucGExdXlMSEoxTEZUcVJ0cEt3VXpU?=
 =?utf-8?B?RnhROE44SEhVMGs5TnA2N3dwY0RpWUx2YWcyYTBQSXZBN1ZwdkNseWlVdTF2?=
 =?utf-8?B?dUkvRmNDNnFDU00zMEJ0RTY1UzJqZmJSY1JJcXZCZnVXdE5hNmhHaDk5VU1r?=
 =?utf-8?Q?NeC0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb327b0-be16-4561-827c-08d9a507902d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 11:36:55.6229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HVmuRl+rJ5VkmuQJcbZsyyF8n6OxLngez39+0HzRrnLZYKSaVC6CKQZbe6vgbvL1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4491
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.11.21 um 10:41 schrieb Tvrtko Ursulin:
>
> On 28/10/2021 16:30, Daniel Vetter wrote:
>> On Thu, Oct 28, 2021 at 10:41:38AM +0200, Christian König wrote:
>>> Am 21.10.21 um 13:13 schrieb Tvrtko Ursulin:
>>>>
>>>> On 21/10/2021 12:06, Maarten Lankhorst wrote:
>>>>> Op 21-10-2021 om 12:38 schreef Christian König:
>>>>>> Am 21.10.21 um 12:35 schrieb Maarten Lankhorst:
>>>>>>> From: Christian König <christian.koenig@amd.com>
>>>>>>>
>>>>>>> Simplifying the code a bit.
>>>>>>>
>>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>>> [mlankhorst: Handle timeout = 0 correctly, use new
>>>>>>> i915_request_wait_timeout.]
>>>>>>> Signed-off-by: Maarten Lankhorst 
>>>>>>> <maarten.lankhorst@linux.intel.com>
>>>>>>
>>>>>> LGTM, do you want to push it or should I pick it up into 
>>>>>> drm-misc-next?
>>>>>
>>>>> I think it can be applied to drm-intel-gt-next, after a backmerge.
>>>>> It needs patch 1 too, which fixes
>>>>>
>>>>> i915_request_wait semantics when used in dma-fence. It exports a
>>>>> dma-fence compatible i915_request_wait_timeout function, used in
>>>>> this patch.
>>>
>>> What about the other i915 patches? I guess you then want to merge them
>>> through drm-intel-gt-next as well.
>>>
>>>> I don't think my open has been resolved, at least I haven't seen a 
>>>> reply
>>>> from Daniel on the topic of potential for infinite waits with 
>>>> untrusted
>>>> clients after this change. +Daniel
>>>
>>> Please resolve that internally and let me know the result. I'm fine 
>>> to use
>>> any of the possible approaches, I just need to know which one.
>>
>> I thought I explained this in the patch set from Maarten. This isn't an
>> issue, since the exact same thing can happen if you get interrupts and
>> stuff.
>
> Ah were you trying to point out all this time the infinite wait just 
> got moved from inside the "old" dma_resv_get_fences to the new 
> iterator caller?

At least I think so, yes. But Daniel needs to answer that.

>
> Regards,
>
> Tvrtko
>
>>
>> The only proper fix for bounding the waits is a) compositor grabs a 
>> stable
>> set of dma_fence from the dma-buf through the proposed fence export 
>> ioctl
>> b) compositor waits on that fence (or drm_syncobj).
>>
>> Everything else is cargo-culted nonsense, and very much includes that 
>> igt
>> patch that's floating around internally.
>>
>> I can also whack this into drm-next if this is stuck in this silly
>> bikeshed.

Can we move forward with those patches? I still don't see them in 
drm-misc-next.

I you want I can also pick Maartens modified version here up and send it 
out with the reset of the i915 patches once more.

Everything else is already pushed.

Thanks,
Christian.

>> -Daniel
>>

