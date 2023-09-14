Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D0779F8FA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 05:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCD510E153;
	Thu, 14 Sep 2023 03:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2059.outbound.protection.outlook.com [40.107.212.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0D010E153;
 Thu, 14 Sep 2023 03:41:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/Q+J1TubV+0ER5n2nU6N4AiV76fMQzYRrmsbuzlRSciVXmsKW4T6ZXC2zOzNM8kEho8s1olAlrjs7oUGpQRg2cg26Oq4oD9rCm/658VRcVMYs8v02jtF2R79caQm67VuoZ0Obst3QcIN38B8fyEmJQcRDzV9J43bLDussaPfPs0Ih1e2YgUklwL2FW3SSlqzOmPDHCi8DJPNi7QGpi0hD+Y1J6C/1boJ1ro+4rAWA7UE5sHQP+V4sf6HY/AFRy3lyyd489gO5I0wzDb4PHvc3xGYJCbJOrZX89dVvjxMu/EzYGS/KU+JSgexZcyetjbRomStgZbl7RVUr0AI40XKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uR0Q8tuI63RlrbH1GDIA5jTtCqAgwwsT3/SiAd1pZF8=;
 b=IfvITXjoQ4xYy/uuPzQM6aavjirSD88QzakNgKuDkJKRi9SiaZQX2Ip29aBmfAvQTyMCW1GCqncNl8zC4XQ844mxMadUCYsmQ+4cKZCCEhjg62k9L+ivOvODU6PpYWFWiyaXeF0OAE3MTYlHc/e1y7cnfp9+YPYY0mtf9Sqt3MVuY8sEGZgnP8vfIRk3i81vRxVU+Iaj2p0avm4BavU/8eajPCqFBfuVrQBT1MqateFqfPklNvxA7+qW7p3vc5RiFLcYkaf2Hm35ALtCLgc1LQcx63YbJrhVD/IzEyJXk8sfMTJlztaWQU65O+fZsfuK2+2toCdrKUOjlIV6IVx5/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uR0Q8tuI63RlrbH1GDIA5jTtCqAgwwsT3/SiAd1pZF8=;
 b=qRqpomJNy925zIYeDizlhj3VYezWxvn12sHSQGNhEZpRJjIoZAugMm/3rpBUSskqNnRopsGzOv1iQMvgQtLfBULXk2uqs3dW2fmBLLXL07N5Gs+0nxaUA+3J14jdV+szGWweTkEXFCiTkZg62pTrHrPjJ/SOhUT5g8KnFdLtN0E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 BL1PR12MB5239.namprd12.prod.outlook.com (2603:10b6:208:315::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 03:41:41 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 03:41:41 +0000
Message-ID: <e7b3c18e-8feb-43f8-8bc7-35c325d284ec@amd.com>
Date: Wed, 13 Sep 2023 23:41:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.2.2
Subject: Re: [PATCH v3 02/13] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-3-matthew.brost@intel.com>
 <20230912092953.36a7cdf1@collabora.com>
 <ZQB9fVvxWULKj1Jn@DUT025-TGLU.fm.intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <ZQB9fVvxWULKj1Jn@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0378.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::6) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|BL1PR12MB5239:EE_
X-MS-Office365-Filtering-Correlation-Id: 1723dc42-ec6b-4474-19ef-08dbb4d4821e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EaIxIT57W1GX3hTcxIF9Df4c3ApYhc088BzFkDWEmIduiCmqRxxlPjd7q5tFgMulWqOdLD4Czna9mrg7MspSP6JB9oSb3zj5mPhbFKIvxhY/dzayk/zd3CTFMciD58wjBMJOZuEOYcQXEW01osnPK95UD8+Z8oQQUKWvWAoDsG8Rkh106S46EDgfeyVshQwZXzjSg7iJbo/xu4lNNaR7WtXS/dgmv7qaFY47kasdDuEZhWOgNwW8ltC+b2umACTNEdLr2dHIKr2bmD0/PZEDz/LP/qhSDTyHmRBn1086ieSq1pGFl49mR1cbjqh/r+yS9yP2BZU9NR76V8UotyqTlqR5QvJTlj0ihh1AtYwVZE2ACKMMeX2CGqSMqgwGdSoEflnuMk7xph9rv+kBOb7w5IloG+AplemaZTuKDbGaWgZf2e+Yla9fNFrSluGAtdN6I2nAxcmchr5ZVWuAZFjza7jvfZdwuRsqKBxSg6Nc96m8w07OhwCfui8VpXKVnJRJo06nFAEtuwrXr/fCLGBD4OYRSqHWASg7wwVwrUXSt3gXch+s769Ce5lTLk8iR8XmaXFpEopYsDHYgQuyK0MYD/akBVM/T2VtAWvG5TxA+oZ9HdKpnY3M11Rym4EUELuaX2wKQFR+vSEELv3IwklkSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(186009)(1800799009)(451199024)(86362001)(31696002)(5660300002)(44832011)(4326008)(8676002)(8936002)(2906002)(7416002)(36756003)(478600001)(6666004)(53546011)(6512007)(6486002)(6506007)(38100700002)(31686004)(26005)(2616005)(83380400001)(66946007)(66556008)(66476007)(316002)(110136005)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDNaWE00azZGa0RUY2JaMmp5d2Y4QnJIcUFoWkJIcUNySHVtamQ0a09SMzlv?=
 =?utf-8?B?dThLVjB6TCtnaElsSWFYQ1ZJQ3Q1QkVJT2dxMjFRaS9YcmxHSVlhaWNrckZK?=
 =?utf-8?B?OHJOZC9ETlRhRll4QnE4bllMNmVsVDlDckwxejVUcDdCSENWVGVkR0J5dWdP?=
 =?utf-8?B?KzRqbXMyUndQUVp6bERCUzVjc2dBdGNNd0VqZW1nSlBGb1preTFYa2dkemtG?=
 =?utf-8?B?QUh0NGV4Y2EzTUhxamdncGpDRG16S0s3VGVvNVc0a0lOSDFPWmJZamczM3Za?=
 =?utf-8?B?Y0p1OGNTRmMxRmxNS0N6TnovNzNmTndVYjV2KzljNVhXS05VcldwUng3aUQw?=
 =?utf-8?B?NjdpaEQrZ2NyTnRlbGw5eGtxcHAzaVY4MG9XRHVQTnF6VHJTeFFNZWd2Skkv?=
 =?utf-8?B?VHFKeWc0Mlp4UEl6N3NCSTIxNWFTclB6a0hOWStEYnJNcVRrTXRjUXZLdVlG?=
 =?utf-8?B?cXBqaFVabjlQNWdNVFcxdW9TUXB3VDZmUlNFbXY0RUJwSXdPa0U5enIvTTd5?=
 =?utf-8?B?eW0wbExFTjJQK2Ricm9rT0JMU3dKWHZveXV5QXhPeGgwWDVudGxLUXRZRHB4?=
 =?utf-8?B?a1lUc0VnOXNzb0xHaDlaZDFhSXl0d0FoMmtMUHNYY3UrTCtBanFDS0FHSXM0?=
 =?utf-8?B?cnRhRUdWbjhIYmM5QlVVb0dPT2FNMFliK1NhTUNweUZCcW11WHh1Nm1laGJF?=
 =?utf-8?B?Rk9CcTlFM0NOaSt3b1NmSVFjcUZuTjhnUmFuWFJyc1duMVQzOXlRNjZ2Q2xR?=
 =?utf-8?B?TUpDdzNxM2hHdnk3WWYxazBYclFkcDMreXdHSDYyeDZTeEZmTHlzempPRTht?=
 =?utf-8?B?TExyTHVvWXZLMjV1RUFGZWIzM1QrVmtvemJreTlEOWs5NEdZVU5ITHlmWVRN?=
 =?utf-8?B?eXRqTDE4bHU0TTAvMy9QMHZlNXFyMGxwRlZNUEJlWTdHZk9DeUFQbXVhZ3ll?=
 =?utf-8?B?S1orMXJsYnA5blBPZHZkR3o2NGxtVlB0bk1hajRucTlGVDUzWEppYzRwWDhS?=
 =?utf-8?B?eThIaUpldHcvYkVCay9hbnhrWElaNjFxMUFGV1k2b242aTN5UHpnSXhIQkNT?=
 =?utf-8?B?c1U1TzNpa0hvdGU0T0hNTkthYklXaWRCcHJEc0lmeFpyTHFiWWYxWVc1TGlz?=
 =?utf-8?B?RDdCL2JLdnVlWWwzR1B2bEo5TzNkeWdybEw3SEVLZWRoQStzMG5rSXIwU3Jp?=
 =?utf-8?B?cHdTWmVFZndQbzl3ellFbkNGWUcra1FKUHoxSHpOeXVOUlpsRk84TGZLVnpQ?=
 =?utf-8?B?Z0hRS1VIczczbzBoZUVUYy90M1dIN0Y1c1N2L2VoRWlOdkJiWXdyKzRIVTlR?=
 =?utf-8?B?R0k3aW5QeUlIeE5LcCtydjdLNFJMSHpjb0krV21ER2x4YnJwWGVjaDNXNHIz?=
 =?utf-8?B?ZVBvcTl0aUIzODJDOGVlTmR3VlZ4dy9KS29pTXp4bGZnekw2V3prMmtLMmE2?=
 =?utf-8?B?Qjl2MitmK1l6OTZVRmJxZmpXQmREZlRTcWNkZVk5allGUEZwaFM5NGowbjA2?=
 =?utf-8?B?RGU3MnRaa05WL1dMcFUvdzFkd0YyK2lwQWZGcUZjVzBTNjRUczhjbWw1TUxK?=
 =?utf-8?B?WTZERVlsTlhWSWZrL2pNMWRwamdIb0taTTdTUUtiVEd4eFBRSUlWMkRHbnc2?=
 =?utf-8?B?QTFaZGh0K09ZVXJsYndieDI2akx2VU1PcUY1TGZFdFpjRUVET01kVG4rdmND?=
 =?utf-8?B?UWRXY2E5RStDZy9EWDVTTkpibVZmd0hkT1h3K0pHK05sTkRRbU5PYjVBSVk2?=
 =?utf-8?B?Y1htdEl6cXBJdUJnTlRzOENNSlpQY1pGZCt2MDAvMHl1N3pXN3ArMDJnV0po?=
 =?utf-8?B?MmJUYjhFQXlGZzB4RGY4dTJsOWdpMklFK2lPQ2tGYTZXMW1OcEU2WnZjZ0xk?=
 =?utf-8?B?TnMyak90bGlkR2JLTXhMU1dPOEtJb0xRVzFRaFJCaEZSSEEvOHZPbVV6S0t3?=
 =?utf-8?B?Y2lEeXp0dXJqVEo1eVpIS1hOeitkMXZHd1EveHRUbTdRS21udTh0NW9QcjM1?=
 =?utf-8?B?VnorSm9EblZsTkxBdkEzekFQZ1ExWlMrQXNzMmpNOWVGVFRxQTRYMHBQUGdi?=
 =?utf-8?B?VHBsMnp3Z29vLzI5VmV3WmZ5bUlyQ2pmbGFOYlk4V0J4Ykx3YXh3NUdvcGZ4?=
 =?utf-8?Q?prEhP9buuwt/+I1i+756at2XW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1723dc42-ec6b-4474-19ef-08dbb4d4821e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 03:41:41.3379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xA/mEeLGb/JAsGngc03wZn9IxEOOTFswoB6sPR78VvthVzTrPb9ucelAL4tY0tG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5239
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
 intel-xe@lists.freedesktop.org, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-12 11:02, Matthew Brost wrote:
> On Tue, Sep 12, 2023 at 09:29:53AM +0200, Boris Brezillon wrote:
>> On Mon, 11 Sep 2023 19:16:04 -0700
>> Matthew Brost <matthew.brost@intel.com> wrote:
>>
>>> @@ -1071,6 +1063,7 @@ static int drm_sched_main(void *param)
>>>   *
>>>   * @sched: scheduler instance
>>>   * @ops: backend operations for this scheduler
>>> + * @submit_wq: workqueue to use for submission. If NULL, the system_wq is used
>>>   * @hw_submission: number of hw submissions that can be in flight
>>>   * @hang_limit: number of times to allow a job to hang before dropping it
>>>   * @timeout: timeout value in jiffies for the scheduler
>>> @@ -1084,14 +1077,16 @@ static int drm_sched_main(void *param)
>>>   */
>>>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>  		   const struct drm_sched_backend_ops *ops,
>>> +		   struct workqueue_struct *submit_wq,
>>>  		   unsigned hw_submission, unsigned hang_limit,
>>>  		   long timeout, struct workqueue_struct *timeout_wq,
>>>  		   atomic_t *score, const char *name, struct device *dev)
>>>  {
>>> -	int i, ret;
>>> +	int i;
>>>  	sched->ops = ops;
>>>  	sched->hw_submission_limit = hw_submission;
>>>  	sched->name = name;
>>> +	sched->submit_wq = submit_wq ? : system_wq;
>>
>> My understanding is that the new design is based on the idea of
>> splitting the drm_sched_main function into work items that can be
>> scheduled independently so users/drivers can insert their own
>> steps/works without requiring changes to drm_sched. This approach is
>> relying on the properties of ordered workqueues (1 work executed at a
>> time, FIFO behavior) to guarantee that these steps are still executed
>> in order, and one at a time.
>>
>> Given what you're trying to achieve I think we should create an ordered
>> workqueue instead of using the system_wq when submit_wq is NULL,
>> otherwise you lose this ordering/serialization guarantee which both
>> the dedicated kthread and ordered wq provide. It will probably work for
>> most drivers, but might lead to subtle/hard to spot ordering issues.
>>
> 
> I debated chosing between a system_wq or creating an ordered-wq by
> default myself. Indeed using the system_wq by default subtlety changes
> the behavior as run_job & free_job workers can run in parallel. To be
> safe, agree the default use be an ordered-wq. If drivers are fine with
> run_job() and free_job() running in parallel, they are free to set
> submit_wq == system_wq. Will change in next rev.
> 
> Matt

So, yes, this is very good--do make that change. However, in case
of parallelism between run_job() and free_job(), perhaps we should
have a function parameter, to control this, and then internally,
we decide whether to use system_wq (perhaps not) or our own
workqueue which is just not ordered. This will give us some flexibility
should we need to have better control/reporting/etc., of our workqueue.
-- 
Regards,
Luben

> 
>>>  	sched->timeout = timeout;
>>>  	sched->timeout_wq = timeout_wq ? : system_wq;
>>>  	sched->hang_limit = hang_limit;
>>> @@ -1100,23 +1095,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>  	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
>>>  		drm_sched_rq_init(sched, &sched->sched_rq[i]);
>>>  
>>> -	init_waitqueue_head(&sched->wake_up_worker);
>>>  	init_waitqueue_head(&sched->job_scheduled);
>>>  	INIT_LIST_HEAD(&sched->pending_list);
>>>  	spin_lock_init(&sched->job_list_lock);
>>>  	atomic_set(&sched->hw_rq_count, 0);
>>>  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>>> +	INIT_WORK(&sched->work_submit, drm_sched_main);
>>>  	atomic_set(&sched->_score, 0);
>>>  	atomic64_set(&sched->job_id_count, 0);
>>> -
>>> -	/* Each scheduler will run on a seperate kernel thread */
>>> -	sched->thread = kthread_run(drm_sched_main, sched, sched->name);
>>> -	if (IS_ERR(sched->thread)) {
>>> -		ret = PTR_ERR(sched->thread);
>>> -		sched->thread = NULL;
>>> -		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
>>> -		return ret;
>>> -	}
>>> +	sched->pause_submit = false;
>>>  
>>>  	sched->ready = true;
>>>  	return 0;

