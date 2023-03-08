Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 065126B03A3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 11:03:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF08F10E663;
	Wed,  8 Mar 2023 10:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5103B10E663
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 10:03:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NT5Kj2rcwakiF+ocNm4x72JNFZrVMZ8xtATuRldKlRMfVzlq7lSDZTb4TeJY1hbnA0MR76Wn8qHxbnq7O39L48Uum7q5JEg8mO01iKHB0hw9huUdLX/GYqZWMqEqjnXeB/PkWfn9+YtQ3JK8uWRpq180AtUJdzFBZtPhA/bSeW5lgEykv2yE5z27RVwgr74tPNeGjK186yubHp+cl4BO0vgSKXtSjbUFPLUObdEi/DhPb08MM3fTyzuzYg/7g33Y8K2e3YR/1Q70/LXqW9rGUXNlLW0QbAc539fLJlg8S46UQdBV0Cg3y1vpXiSw6SzoDSUrsESCWyYoPSiPx41asQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtGQQioFZY3WnVYG8MwM/oAfTmRdHiEFvZGhESpeido=;
 b=isLlGpYX+KZmCFn2yeK3hVNdhDj+ilho+VMuKnC5Ws+bHTMzkAW3ayfi0PE90lxii26AZJkIvz9A5GSGRgAykK/A1OvpWSqjoDpU6L2O5Dd5x4oOoBtrGy/UKWImRS1f5eHIxyg4pjKDZBpkJOvshPjzznDvbmlWTROGo0XhDE7a4bHC7VmKnnl3xzXyoUACLN83jPOWRVKmWPSO3JCVsDW5A8vAYZcPGE8tJ2ysqnWY2BhLATuP+ZhOjxaS1R9WNFzayxH6CxwE/yzOBadvIPeGbopzl4cQSytjK4lhF198elI6JGjB2H0VExbQ2Dp1PAY9A3FAol5xLq/pgfRzcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtGQQioFZY3WnVYG8MwM/oAfTmRdHiEFvZGhESpeido=;
 b=HFsLbOnaTIaBUy28zW+seFiXcyYuGkzyE+/fCWiTi8FWuVA7/oZYYd4wp/ODu2QNZYZHFtXBXFSyN2vWJGGU42b/DoGR2MU5UHBAL2sKw8ZMg58HvuHP2D+g6qsRTIGfuKRAOuVnOrVJyRoTl3DI/WcOVTnQDsKPQEENVFKdEko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CO6PR12MB5428.namprd12.prod.outlook.com (2603:10b6:5:35c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Wed, 8 Mar
 2023 10:03:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 10:03:43 +0000
Message-ID: <585fa052-4eff-940e-b307-2415c315686a@amd.com>
Date: Wed, 8 Mar 2023 11:03:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC 11/18] drm/scheduler: Clean up jobs when the scheduler
 is torn down
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Asahi Lina <lina@asahilina.net>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-11-917ff5bc80a8@asahilina.net>
 <bbd7c5ee-c2f0-3e19-757d-a9aff1a26d3d@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <bbd7c5ee-c2f0-3e19-757d-a9aff1a26d3d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CO6PR12MB5428:EE_
X-MS-Office365-Filtering-Correlation-Id: ae63679b-9ba6-4deb-425e-08db1fbc6620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XJc1G3LZMO8nOZ673xXspa1p6jg1at0s5UDnG1sf0cVsVqAEkid0Eq5ZY90tj0l1jZLvcoBAgsxOtLbatmCermB1vwPyZzAh2ZPYm2Xw+B4T60vYkBmHCuqdk/IiqT1MQWiH0KUlSuZSHWRWnaw3MjnCk8JYEugHra+h8xQlCUjstInPS1DoPb16HarED23hP24Hw1lkbTxnyjYGZX17Mftg9Yn6YPRDGnbRE1lL3ZPoXp5YqmkfTlDppV5VW9KX6COHUweSzgyBBK/2EoFzsTyA1TZ3/p/jlKXQUG6t4/mxFYf/bc6zW2u5M2j2FgkBCxU9Tx5xca1qDVixLIscnGWIRyUqN+ZDNoADNT6MmSTsUteHwgjOp4lxrR5s0EaFGRIW3Nxo347YHOOXAkAmn2gSd9rgdq+ieGYeLu9j0y6kDthDO25wDH6+o8J6DEJUhEHpgWj/Xs27ruUxWiMt6FgYhyelTf/F4aoj9zaiZeonbYfOvDwd/GoDTo2X6+pnzq8XG4S4gXFxD8IEp5iojq8h850EwDxbUWJRf283JBuNGUsp7k3kjuz1MC5u11QSo3eqzMMaTOvcYLbR1m6BeQDLTPkQFG12oVtpbYRp89PuKgPn4Azsr56NBegxwOvGDo7RQOnT5dDNR+xuFFf9LWVdvQzL6QYHnK5+Z0towUjZdVM97xjK1KwyvQNXXKVaPMO3l8+3zVJQChDl2QetBX18pswXxDVePAirAyoqr9XicBMqdIXQFLUgTG/n/w0P
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(451199018)(6666004)(110136005)(31696002)(54906003)(41300700001)(8676002)(86362001)(83380400001)(4326008)(36756003)(316002)(8936002)(66946007)(66476007)(478600001)(66556008)(7416002)(6486002)(5660300002)(186003)(921005)(2906002)(38100700002)(2616005)(31686004)(6512007)(53546011)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlU2VlViYnZ5SWF2Zk1ZU0QyZFBndjEvbGNaTDJhOGU1VVNGUWZ0N2gzNU5M?=
 =?utf-8?B?dDhleHZRcC9GZm1hZlFnaVpFckllN250Z3VRYW9IRmljLzIrLzdJL3g5ckYz?=
 =?utf-8?B?V0NhNXh0d3RXQ2JSTVlza09XY1dOVGpuL1BHUmZCamFDa2J5YVptL0tSV05p?=
 =?utf-8?B?Ym8yYmd1cGhmY3o4RDRnSHlaZDRvTFhnRVZjUU1zVG1QNXJNd3V4dldxM0d2?=
 =?utf-8?B?RndNVnE5TWVCL0tDaE5EenF6dnh1ZHhqaFNMSW1WSkVXVFJDckdLVE4xTVpa?=
 =?utf-8?B?YW5xaDEybE8rT0FMeDJ0eFArb1BuVVdEYkFUUVpaSVpub09rM2kwdTVCc0g3?=
 =?utf-8?B?NDdqZ1hMZ1lkdGhsZzRFQlNXUlNRRmNkNW80dkFYYUo2NXBkUUE2Znl6ZkVS?=
 =?utf-8?B?Y1kwaUNhM3VqU1lyWjdzdUNqdlRIS3BlU1h2cGowMFRMUys2dWxxNEhlYUgr?=
 =?utf-8?B?VWdpNTVKbVpEOFN2STFUNExZNnZ1dzNzcmNoeHBXd1N1ODlhNnlpNklESGF4?=
 =?utf-8?B?VU92ZVRzaXZET1FwVUJOeWl4cmZIMFBkQ0hHSUNhQU9qK3NEbVJneFlyc1pF?=
 =?utf-8?B?YXZnUm1NamhrdU9yL0kwKzRDb1dVbUVnMGZESDFjNlVBQ1NJS3lRUW4zaUxY?=
 =?utf-8?B?aERkdE11RWpoTlNBQ0lZcGY3MFZIaHZPMmxlek1DV0IyQS9zN245SEJad2du?=
 =?utf-8?B?VzZ5d1lKWW1jZ0tuNHJLRWF4MHdmWUR2OENGU2ExTjl4ZDJjUG9FRDZwd0FO?=
 =?utf-8?B?ZmtiYXJGc2k1YUpCcEpnYTVzOVhxUlJxUmxnRXEyekRtRTJrdTdmaVczNGlX?=
 =?utf-8?B?bUtobkZlbEFMS2xCa1NRRTB5SXYyWlVuTE1vSGJpeXFXV1l6WExWSFRhRm80?=
 =?utf-8?B?d2h4SnNvVjNLQkt5SnViMXdxdEdyTXlkdCtjeWRQRGNuallPK2VmK2o4UW9F?=
 =?utf-8?B?dnN5UVZrYVVpVk1YTjVSV3BrVkFCVUxKNThPMlpucVdPV1BVRzh5bnFNZml5?=
 =?utf-8?B?azM2dm5SWSthdjh3bDR4T1JsTXZrREFKTU5SQk03eU5JcHI1VERnMW4wT2NO?=
 =?utf-8?B?RXpTQTRpeE5BVVZJc0dYQnkrQ3ZSNWlGOVI3ZXczMTU0a3E5WUJpQUVyT0Fq?=
 =?utf-8?B?Zmpzc3ZhRTVINEZlenp0ejhnK2t4ZURCY0xJTktSQlgwWUJQVUwxS3Q5QXJI?=
 =?utf-8?B?c20xVTJ4Yk4wL0JDVGQ2a0hjaXZQS2p0R24vODVVOGQxbmM3RU5MQkQ3VkhX?=
 =?utf-8?B?QzNaamJCcUFIbnYyeXgrYkd3aXhXNHhHcmR6NUdrS2thZmxCa2RnNGxWRmdO?=
 =?utf-8?B?UXZoTVpNWkh6RFNyUXVyYVpHMVUwU0dCNXRWZDhoU1orTmxja251Yzg0MWJL?=
 =?utf-8?B?NmRuaytPOVFhVDU4OTN0M1AxWGRuSnJubHFNMk1naW9oN3doNUlRR3JVaGcv?=
 =?utf-8?B?VWhNYTdPM2hYcTJ2NlNZa3NqUW1qYkRSbGgvRjhWeFR3VnIrS2tsc2Q0QTRt?=
 =?utf-8?B?a2ZtdXZKdTlrV2hIb3hkdjFKVVVpaWxDc1NCaGYzOWtTUGJsUDRhWEgxQ3Nt?=
 =?utf-8?B?bVhRSlhJdHR6MjF4bUFPMnlKWmp3eFlrU3g5M0tUZTh2b1VNcUNkKzNvOTE1?=
 =?utf-8?B?VlZ5RWVoK25RelcxRjB4ZDFEVDlrY2daN2pTcXR6OEdSaXZMVEIrSm1NZjZD?=
 =?utf-8?B?WGd5VzcrdW51SDVIWTczUlBmM1pFUTYzeGg0djlSbWxXUGQrcWtqeTYvQVFn?=
 =?utf-8?B?UmUzT3hJRE5acU5LaXU2ajNUdTNlamQ4M0pBS0orcjkvVDgzSnhtNFlhVXZs?=
 =?utf-8?B?RTJwdTY0WFZNSHFwd1lDM2pmeHNBUWE1Zi9aL2FSZzRuNlQybVhaK3VWdzVK?=
 =?utf-8?B?djgrTHhOWXhqSjhpQzNaaG9pZ1ljU0IxV1RkaURxL3dyNmo1YjIzS2Y5dWdM?=
 =?utf-8?B?SE05YldhdGZjU0hhU01xcTVkOUVCd2VKZFZoQnlTK2h4UzdyVDBGc25iWkdu?=
 =?utf-8?B?Y3M5UjJkQXl5ZFNhSXpub21qaVNLbjduMC9VcmR1RzFiLzlzL25FclpxSXB2?=
 =?utf-8?B?WExZUjlvK2FNdVJ3NGk4UFZjcmF5MHV3dkRBdEtrdDdNTzVDNHZMQXI1UTd4?=
 =?utf-8?B?TUhXNllDb1RCSCtscjRuSnVJVUtXVXJBUzQyVVpDaG9SNTVMdjBTU1ZzNFg3?=
 =?utf-8?Q?mk9RBqtfTLcv+PJl3LnYPqL1zWMSt4HpbfvCLLbJID7l?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae63679b-9ba6-4deb-425e-08db1fbc6620
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 10:03:43.3416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbG/BPxCVsUuU+KCrLKjYUjqpvXH1ocAgT9JtQosCvJtf0z3vsgpB3QjJZwVk2NI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5428
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.03.23 um 10:57 schrieb Maarten Lankhorst:
>
> On 2023-03-07 15:25, Asahi Lina wrote:
>> drm_sched_fini() currently leaves any pending jobs dangling, which
>> causes segfaults and other badness when job completion fences are
>> signaled after the scheduler is torn down.
>>
>> Explicitly detach all jobs from their completion callbacks and free
>> them. This makes it possible to write a sensible safe abstraction for
>> drm_sched, without having to externally duplicate the tracking of
>> in-flight jobs.
>>
>> This shouldn't regress any existing drivers, since calling
>> drm_sched_fini() with any pending jobs is broken and this change should
>> be a no-op if there are no pending jobs.
>>
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 27 
>> +++++++++++++++++++++++++--
>>   1 file changed, 25 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 5c0add2c7546..0aab1e0aebdd 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -1119,10 +1119,33 @@ EXPORT_SYMBOL(drm_sched_init);
>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>   {
>>       struct drm_sched_entity *s_entity;
>> +    struct drm_sched_job *s_job, *tmp;
>>       int i;
>>   -    if (sched->thread)
>> -        kthread_stop(sched->thread);
>> +    if (!sched->thread)
>> +        return;
>> +
>> +    /*
>> +     * Stop the scheduler, detaching all jobs from their hardware 
>> callbacks
>> +     * and cleaning up complete jobs.
>> +     */
>> +    drm_sched_stop(sched, NULL);
>> +
>> +    /*
>> +     * Iterate through the pending job list and free all jobs.
>> +     * This assumes the driver has either guaranteed jobs are 
>> already stopped, or that
>> +     * otherwise it is responsible for keeping any necessary data 
>> structures for
>> +     * in-progress jobs alive even when the free_job() callback is 
>> called early (e.g. by
>> +     * putting them in its own queue or doing its own refcounting).
>> +     */
>> +    list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>> +        spin_lock(&sched->job_list_lock);
>> +        list_del_init(&s_job->list);
>> +        spin_unlock(&sched->job_list_lock);
>> +        sched->ops->free_job(s_job);
>> +    }
>
> I would stop the kthread first, then delete all jobs without spinlock 
> since nothing else can race against sched_fini?
>
> If you do need the spinlock, It would need to guard 
> list_for_each_entry too.

Well this case here actually should not happen in the first place.

Jobs depend on their device, so as long as there are jobs there should 
also be a reference to the scheduler.

What could be is that you have allocated a scheduler instance 
dynamically, but even then you should first tear down all entities and 
then the scheduler.

Regards,
Christian.

>
>> +
>> +    kthread_stop(sched->thread);
>>         for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= 
>> DRM_SCHED_PRIORITY_MIN; i--) {
>>           struct drm_sched_rq *rq = &sched->sched_rq[i];
>>

