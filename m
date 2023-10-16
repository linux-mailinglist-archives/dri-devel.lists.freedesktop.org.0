Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 350F97CADD1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 17:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F5510E212;
	Mon, 16 Oct 2023 15:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2056.outbound.protection.outlook.com [40.107.96.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5473889BE;
 Mon, 16 Oct 2023 15:42:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFpASWrjuTyMyZQhvWolSwFDoO8bEzLQdB75ec9RbSiFKJsW/w1SjlqoZy8dlB15ggHyPQjG7Vw+jZIRPJ95bj8lGiZBtESWdMRDNmpcwOQqHb6niJH8AjDjGcy2m1EUrigK6VzpSlJ9UQsMbJkoQ1NrD7QP8J7Ynb/XXec8PIWS7ft7bC/nBHis1SUxiI+s9A2eaps1HYBiABurq1fUfqKIDBDYh0cqkViOBoOQEFsNMk35SJP9YmqGkzAuIUzKs59uJ7z0nNXl4ny1TxKljw0Iueqf7VdV2dbPOfALz5+MQZvNtkmJYY5tvlDTGmU8jb6i2OCzKunXzg9fYv2Oiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uH9sDYjVQV6nPr7Bj4lSJVI70GMuvrvmfYi8FBlI8p0=;
 b=mPSNt8mu+U3HEEKeb9eb0jKdEqMdMLbdGpIhxprUvZvPqrL3r3HofNkBwupdTwRJP1ecGP/B67lvn6VcQ1tW9L/TqW21rjSyJRvcnAhADbgi7tJLHyn/IkzUTb8gd7yWGqnlLkCNAIYYxQpPfHaafrfg84UcXbYLgsMfcVr/KRhMt7MSNoiZ11kpNLF9SElcNw3heWQbYYsyrjXYgwo5pgBRa9SFy7no5Xwo6m36HelqbX3U7HSifAal5f9DOgh9gpJAdQN7SkMnnYNKzQNW06GCiVbtxakozd39SbjACufEWM9xE5RK11pqIAjr2mSU9MkN/JHsyXF01xs9sLJ8Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uH9sDYjVQV6nPr7Bj4lSJVI70GMuvrvmfYi8FBlI8p0=;
 b=H2s5J+A5nLuIAUr0iWbi9ZW4MftVHmT6Nca8IFxKaCTTEbY/QlBW99gRI0yozowVdZKLdBSkPk8jmm4YCX10sthtzCKphdwGDimk3m8qdbf86mzX6At33m23g1i3ptzfHyHXttfsn2hAURLLj5Acad1C7bEpQ4TMmPfR6oazbXI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 15:42:38 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:42:38 +0000
Message-ID: <69200e4b-722f-4927-a82a-e4b9b8a4da4c@amd.com>
Date: Mon, 16 Oct 2023 11:42:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v5 5/7] drm/sched: Split free_job into own work item
Content-Language: en-CA, en-US
From: Luben Tuikov <luben.tuikov@amd.com>
To: Matthew Brost <matthew.brost@intel.com>
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-6-matthew.brost@intel.com>
 <23cceeb8-5d86-4923-a072-b9e72b74d36b@amd.com>
 <c91d3a47-df4a-4be8-8f27-c850289df281@amd.com>
 <ZS1SyZUvMLJFEEbB@DUT025-TGLU.fm.intel.com>
 <4e88b776-8003-49eb-8d9c-36abd340f129@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <4e88b776-8003-49eb-8d9c-36abd340f129@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0155.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::28) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH7PR12MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: f4358ec6-f3aa-4688-4948-08dbce5e8665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SF+6VXoE9/EgG8hxjtHJ7bbZegawTVf9LT5P+tn6egFs9q/kJ0NuVDa0icu9Resn7POXXGQhjiXcTXCn0gZK8uABQC63eE/dkBqMj9aOozZ3fEboUF2YHu/NQqeHTh7AZmrr/Vy2AYaAxr2NQ2S8m+E6Q6YiPfNd65XYOWnr+gyO/SsbQcdot4wItYYjrP7haPpI2/UsC6c4+srthXtZLtVKrZiDSoNtdbkRBX+3vGffKQuQQTkqGrOzRgKFrm3CBpQ3779S0WplWTk45gH78EnyCl3panHXaW/4M+ItJ2eeQAKmp2fB/h+FmC04TscrsfV3P3grVgwTOKZvqzmPgue5NIPPfPfLYFYVWleVaALpqp6Ctkao87XuWen0MAVf1P8tywl6PJTGsiDEjwnU/ULiUZW9bAtN4k7SMXIf/I9GDzRnwRVqQjWb2+b3/d8f4G98v6p08ryblKroIah7pYS7ER9GyHArIrxxoQ09n6bHWaP3CT6TR66k0foTAAcwjZfpdlTo6ivhrAcoro8Cn5dMWZ6dsk9idVQhRpU4j+tPxWgr99uUxlcr0PTVqL0hDKWu1yUndi1olHLVlZakKBBmnXUx+U3dmz2pJd4UVZTsvfdIKXHZ9/BM23iofhW6CI4hvTEjpczk+i2bjcyI8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(376002)(366004)(346002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(6512007)(2616005)(26005)(6506007)(6666004)(53546011)(66556008)(83380400001)(44832011)(41300700001)(4326008)(5660300002)(8676002)(2906002)(4001150100001)(6486002)(7416002)(478600001)(8936002)(316002)(66476007)(66946007)(6916009)(31696002)(38100700002)(86362001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2cwM0NtVzlsZCtscHREbGdndWM0N2dOVk9CNUZSVVRUKzlZaXI1S1RwTEZ4?=
 =?utf-8?B?NVU0QnlueERYM1NXRit5M05PcmlpanZSczVDRkdnb3BubUlQWmlMeFdJVzRC?=
 =?utf-8?B?R2gvd2hSOTFsK1hxK3haT1labDdzazlpUk1oL2VueEJUa1VrdCtlUTZDQmpv?=
 =?utf-8?B?bExCS2JxSEY2K2tuWG8rZEU1bDNza0JpZ2orNkFZWmFkaUhEVEtSODZWL1I5?=
 =?utf-8?B?c2NDQUN5YzhkYnR2aVJ4RGg4VG5UOVJBL0dsSWtYdkh2bkZFRGV3UnpORlN6?=
 =?utf-8?B?ZHFsbEt4RmdqZFo0cXJnYjFhYjZHYllVa1ZRSUR0UldOUGZaZlRtZnJOVVFV?=
 =?utf-8?B?WTdKRCtTRDd4ODBpSVRMODdjcXk5dTFIN3NnNGtBMXM1N2FzVk5CVTN2Qm0v?=
 =?utf-8?B?UlhKc0lPSS9PdERoVEJpZC8zYUlDK3BNY0FuYVVZSVZZeHhxeEVLRGRZZVBY?=
 =?utf-8?B?cHI5REh1OXhqc2M4QVZFK0VCY2pMbGFtUUJCd0NVU3F1ekhkQzRpMzBOdUgy?=
 =?utf-8?B?NFI3SmZLMXNLa1JxYUU0TTR3VDVLdzdnQ21wa0IvM0pxeGU3YzhjR1piRS9U?=
 =?utf-8?B?N2Jqb0paK3hLczlLRkp6Q2RyVXZxQmI5STc1VjRlM0hTbklsTWx3L2U1NEUr?=
 =?utf-8?B?bVFoeEVuYWlwRnR4SDR0THBUbnFPM3ltdERtRzRscVFuRURaL0ZTWHRpOXA3?=
 =?utf-8?B?OTRBZkYvT3hVNCtrQ1RNOVpMTU45K21xY1RFZFV5NVVlL2wzQ0Rzd3BFaEM5?=
 =?utf-8?B?c3RZdERKdFVOcmptN042eUxSeHptcHNzYXhpcTloZFI1UVorNEFxbXZjTGcx?=
 =?utf-8?B?N0hWVjdBY0JHODZudVBIdDBhTS8va3VEY2I5bkV0Y2ZnU3dwMTUyMUduNWNY?=
 =?utf-8?B?OWVzbEYyZGYwMk9ET0UxZzhXMzBhYVJtRExLYzlidlZOaVZ0cHVOT0tpK0xV?=
 =?utf-8?B?QXNRZFN6Rlo2Z2VRR3REcVk0eUFWN2NyMFNnT0JJMTNhQXBIb3JXM1dsQkhO?=
 =?utf-8?B?K3o4cHpBQUowa3k5RFZwTVN6VlVTUSs3SlpEcDdVeDFJMkY1ZXV3UHVQT2pN?=
 =?utf-8?B?NTFkN2JMWkR2M0lKamdKemxZOE83Z2g4TmhVWWJreFU2d1NHcVVIdklIU1dT?=
 =?utf-8?B?cG5HTDZaSDR5VklQN0ZKQml6emE3WHo0WUo0R3Zha1phaDMzemFhdU41dkE1?=
 =?utf-8?B?ZFN6Y1BFSlVIb0l2SmlvMStCaW14YWhKT3J4V3ltaWo1Tk16alR3dXJyL0Vy?=
 =?utf-8?B?WWpwVGIwOEF6NnNxdTh4SXpJM09ZTHIrd0dkcmhKSDI5VGlZQU82bENXanE2?=
 =?utf-8?B?RWgxN01SNUhnVXJIeVZFaVBXS3VnckJuY2twaEh6b1V2L2o1RkFSWjluaFBu?=
 =?utf-8?B?Vmt3eTN3a1JoT2hBNWNOZnRJbytMOGVjendJWlJlaG41bUZvNEJPbFJYanhl?=
 =?utf-8?B?SWJhM3NWd25jc0tnb0FiU0w1bjVCQmJiNjZoUUZRbEprdTdWQ1Y4L1EzZGJC?=
 =?utf-8?B?NFg1TEliUXNjOWthVGc1dzBSTzB1bkhUWmRxOE9tL0N3cURON2RxeTJlY3Jt?=
 =?utf-8?B?Wk9VTWdMb0hBeHFyTVdEL3JZc0JQWlRNU1R6T08vbHllcVdjTEw0ZWViTzZq?=
 =?utf-8?B?dXpMN0RESHAxZExjallTOW9MZ1RvZXRwTzhuanBRRDE3ZFlHYm8va21tNmY4?=
 =?utf-8?B?RWJqUGZnOHFkcmR1dW1IcHpuY3BaemZvdDVCMVIwMjljQnJXc3BjYjJrOEpI?=
 =?utf-8?B?TWFhODY1TDFBOHNKSEcrbnFwek9YUHgyY0krMUtNTlI2czE0bU4vSEJpMHlt?=
 =?utf-8?B?OEFzVE1uTWZYVW9JTjRtSjlHYkdibU14bCtpOW9sN0sva0g0ZmUyeWxZWnZ6?=
 =?utf-8?B?MHlZT0xsazJLM0JTZnhCQUI3UjRhZVM4WWRYYm5POC9WYmZVN3QybC9YaTln?=
 =?utf-8?B?b1dMblBXZjJlSDExcDd0S09xT3JIUVlpb283ZTBlalpYckN6Q1pMN28yRW1S?=
 =?utf-8?B?RFRwaVhYMTVmcFN3VGZnSmg5ZVpZUFpnR29VUm1aZm1nVlNXWUpBSlBBa0dN?=
 =?utf-8?B?akNsR1Jic3VPbElyU3F2Ykc4L1pacWg4aGlNRXlKN1FFamlPc0xPblk4YVFO?=
 =?utf-8?Q?dh4k=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4358ec6-f3aa-4688-4948-08dbce5e8665
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:42:38.1089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKL1c8sOorniKXHoJcl2ugnKeLXhNXoJQ0iPwMtg/1kqDk1Mt1C9MSnuMl8u4jFC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6858
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-16 11:29, Luben Tuikov wrote:
> On 2023-10-16 11:12, Matthew Brost wrote:
>> On Sat, Oct 14, 2023 at 08:09:31PM -0400, Luben Tuikov wrote:
>>> On 2023-10-13 22:49, Luben Tuikov wrote:
>>>> On 2023-10-11 19:58, Matthew Brost wrote:
>>>>> Rather than call free_job and run_job in same work item have a dedicated
>>>>> work item for each. This aligns with the design and intended use of work
>>>>> queues.
>>>>>
>>>>> v2:
>>>>>    - Test for DMA_FENCE_FLAG_TIMESTAMP_BIT before setting
>>>>>      timestamp in free_job() work item (Danilo)
>>>>> v3:
>>>>>   - Drop forward dec of drm_sched_select_entity (Boris)
>>>>>   - Return in drm_sched_run_job_work if entity NULL (Boris)
>>>>> v4:
>>>>>   - Replace dequeue with peek and invert logic (Luben)
>>>>>   - Wrap to 100 lines (Luben)
>>>>>   - Update comments for *_queue / *_queue_if_ready functions (Luben)
>>>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>
>>>> I wasn't able to apply this patch on top of drm-misc-next at a48e2cc92835fa.
>>>>
>>>> Create a branch off of a *clean* drm-misc-next and rebase/reapply/cherry-pick all
>>>> 7 patches on top of that clean drm-misc-next branch. You should also run
>>>> scripts/checkpatch.pl --strict on all your patches, or integrate it into the precommit
>>>> hook, see githooks(5), so you don't have to run it manually.
>>>>
>>>> Set format.useAutobase to whenAble somewhere in your Git configs (global/local),
>>>> or use --base=auto to git-format-patch when you format your patches before
>>>> git-send-email-ing them.
>>>>
>>>> Repost your patches.
>>>>
>>>> The base commit will be added to the bottom of the cover letter. It should
>>>> be an ancestor (or tip) of drm-misc-next (git branch --contains <base> --list etc.).
>>>> If it is not, your base tree wasn't clean, and you should redo this process.
>>>
>>> Poking around I found out that this patch set is based off of drm-misc-fixes.
>>> Had the base been included, it would've made this easier.
>>
>> I believe I based this off of drm-tip. Will follow the flow mentioned above in next rev.
> 
> Sure. You can use drm-tip, drm-misc-next, drm-misc-fixes, just make sure --base=auto
> is set as outlined above, and if you're including a cover letter (a free format text),
> you can mention the base branch in there too, even though useAutobase has included the SHA,
> it makes it easier.

Using -fixes or -tip is better as it includes Christian's dma_fence_timestamp() helper, and we want that in.
-- 
Regards,
Luben

