Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DAB5ACA13
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 07:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D7710E145;
	Mon,  5 Sep 2022 05:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E215510E144;
 Mon,  5 Sep 2022 05:57:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5bziuQ+qVSDwtMzvLF9wL2xzmygyXEtd+fkMc+I09XUeIe0cPqM9NqH65FKwYlLC9SAwZYfIYqNWg8FV5WZD6BsjcWi0I8leXLntIQs9G+oYzPo4X1wORyTul8JhRshO9tIBwozh0cylYGsIpJsnSo1s2Zj7DIvndlx0R2O2i1OoSEzgDPUbHSM2h2VuzW3Jbrghvj/6At3uwvmOlHtmpZP5VxOYokcPmz6CZBfMF4P+yHyKCwzKLnRp1lWdKuWKn8kmRYHrDfRJLaHSNUDH5yf225QHjxxqlpV+eVXh1pXShuA/RoI4N1/8TwoNjW/k98D84sO975BefbEQGEd9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lC8vGtRwT/KRZ6x7pRO7qgJQFrlS4DTqsFROwOjQK9Y=;
 b=oAN2SoVrfJOwQMVw7AlhD53JnAIottPZCLHuBaCkT/rLH0oC4qrUuLbsXjqjs5eBduNCeS0E9FaNo12TMVV4joho6J1pJrHqGGtxOqLqMcY+4szcj1wuBEfQiMTEE5YNlzE7g2h2cve5vzJXMxec9SNcLZ7ms881Vmi4Gwx4CYKJUoUZ2sHmKnVBNxibD/27t1C5Bz42B8OcFA6EopkbQ9z5SYhqcQ0To2HdZOPcvm5fQRM/FUAkEAuMB3JyiUNySg5sQg67bEgZfrhm5MS+t/0RSCUMb4MIgONFt6cogQgpowCv634bHgzgWFmbp1O3VvMISzog8ywzF7RSnARXSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lC8vGtRwT/KRZ6x7pRO7qgJQFrlS4DTqsFROwOjQK9Y=;
 b=07d+2dizhnwPD/gn2b23NNoBO4pAKnmKxqVJtSI9NU9osiO1DOxlEOaJlpaB/og6P1IxRjjCXJTDEXIEWXJv0oNfF5NP9XKFJuHpKV9Bv8opRs4WXVCGEEv2vjeVF7Xgg3bwJukaGwflYgxF9k4DYfAEtHSQTSYD6z4bA6Jjulg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4113.namprd12.prod.outlook.com (2603:10b6:a03:207::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 05:57:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 05:57:44 +0000
Message-ID: <9cc09bec-650d-cfbb-f8be-89fa81343004@amd.com>
Date: Mon, 5 Sep 2022 07:57:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/sced: Add FIFO sched policy to rq
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20220903024817.528107-1-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220903024817.528107-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0013.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::23) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85e7506e-3950-4d91-2e01-08da8f038d49
X-MS-TrafficTypeDiagnostic: BY5PR12MB4113:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zL9pJwT+l7HM7pMnuX/eSsP8owpaxe6Uxuv7gnhgmzenkYg58mJJtb9WmGI0QnqXXTrJ3KBLd2CbcBK8bbDb3bKDQ1POEi0+T6fO8m5Wxj3+ITbPrcMmKbYhPFIuJJWNW3aKvjB/XA4+GAXa+xdH9rSbZR6HllqumF6/lXBMFXtcbVNji+PUToEKhGrckdJyEDv7rTxC4txLRthJ9GvOlgeYSVHOnmbQPXKR6nzV3h0zsxLhXwsjNrPolCtIiTccXdFs5zsNSaiZX63bLHCEcL4yLcVtGgV/3osZ8B965D4Pwnyla0wSKIiB7IrKutDMrZDSl7YSDST43BgcaPw8KDi+3nQZfsimQaBkg0g1YBZlpMlJTxw4hrqHvVL+uuWCZwkwNAg1ZskWdU9wrPoeFN8npJnYvhM9jHxFq/eXgbsZmyXyrFrTid0LX0gN1inTzY3v7ZaNBgaXCa30KDQLLeiqCjjhSJroL1MlR0bmgwRyCX41fe42VbtEyyFQi1uLY9ebN9j0DCWk2IK55uqOTRqqPZpI5f0lQI2osr5k0QLhduBu9j6mDZAGMrriRmP4P8GI5pdS8gxYfsog3H9x5GO4nWXEXF8WB3Eg4InlsHuN2RHyDlHD5zMkWXRNEKEhZ45br/Ot40Y+9RXHVMnJPnz64brG6BkazDAu7W5FN30JZxU1CUdktpiZoXvHVfsjxKFfnR+bsNMFeIJc3qK6UX99+h/KN7RMnkfc7hourKsVhIvB+jpexfUx6pE4smCi+nuX5owYJTrqMSf8BmWGc6B0xvgG4YD6mpQTKCXcSRY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39850400004)(136003)(396003)(346002)(366004)(6512007)(2616005)(186003)(5660300002)(26005)(8936002)(86362001)(36756003)(31696002)(31686004)(41300700001)(6666004)(6486002)(6506007)(478600001)(83380400001)(316002)(66946007)(450100002)(38100700002)(2906002)(66476007)(4326008)(8676002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WElYNmlTLy90bDVpcTl5ZzJ6T1dwRWNIWjExVzVQV0V1R1lOK2o4UXNKRTZy?=
 =?utf-8?B?WHZlRDk2UWNOd2xSbjkrYUM5MlZVYWpXNFljWW1zZGxwUEJUajlSQ1IzY0E3?=
 =?utf-8?B?S0lMYTJMdk5qclljZk9RNGdFZEROaFR2S1didlJhMGljOVp1OW91Q2ZIM0Vi?=
 =?utf-8?B?QWFDN2JCRVpQdzRYK0dVTThwVnNKZWc5YzVoTEQwQWtLWWtxVUIzTkUzWlhD?=
 =?utf-8?B?UFlQaDZycTN4NWdVeTVPd3RlMDZML2xzSlp5OEZxeXJGZzBlVzNxVmhFeEF2?=
 =?utf-8?B?SVMvL1kzTHdOb0VoMHh2QmdFOGZRejRqQk1hNDN5YWFUVW9VTElKMGQwL0Iz?=
 =?utf-8?B?anhSTGF4STRHdEVPUFBIQlpTb3BOb1B5S21IVVliNkxRbzRnT2JHZ0l0NnFP?=
 =?utf-8?B?ZTRvbjNSMFkwQy9LMUpCcmxRUVBXWmFFZ2kyTW8vSlpNVGZjUUNXRlhRWmRq?=
 =?utf-8?B?eHlXMlFnVkZsVmk4MFpWRUorUXExUGdxcFRkZ1lVTDJyVHd1Z0MvMGUrZjdJ?=
 =?utf-8?B?Wk5HVTlrckUvMGZGZWUyYTUrZU5FRHkyeVFrdktsUlpKU0ZUYUdOTy9JeDdY?=
 =?utf-8?B?N2NCc1VUNWYwMW40VFBWMzBoS0szN0RnNmtKTmlJYnUvaDk2WS9nNEtEZXNs?=
 =?utf-8?B?Um0wZ1Zpc2dWc0Fsdk1rd3pPZmpaQkNtM1lmQVltbGZXYlZmY3JYbTdIZ2R0?=
 =?utf-8?B?dG5xUVVuekMzU1RsR1lqTlNlOVFjZ0w2cFQ3MDBzbVN2UGNqVW90ang5bWJC?=
 =?utf-8?B?MjBmTWpDeGp4RjlqZHFWQ05OSUNDZnZEUVNzZG5jdlQ1bE92eGN5dWhqeFZt?=
 =?utf-8?B?b2dpaDB3ak5ISjY4ZzY0OGVmcnBGN2FETno3SFlJbGhuSE1Ed0YrdHVjYTM1?=
 =?utf-8?B?MHArci9XT0FEMVFSZmc1MW1BajRaNXNPMUVsOG1KVXd1dkpJUUVxN0JRV2Zk?=
 =?utf-8?B?ZWd6alVEZ2x3Z0ZOVExzandHdkcrU1ZXdjBxaVVFYWMrOFJLY1ZWYnlRQXh6?=
 =?utf-8?B?U0NHeENDWmZHelViY3ppeDlyYTFOOWE0OWFDWElJZ1pycU00bDg4UlVtWHhh?=
 =?utf-8?B?bEtra3o2cXRZWjV0N1pMcW0rWXBWRGh4NjlaQzRIQzNLc1JYTUR2MW5Ta2RC?=
 =?utf-8?B?YXV1Z1BXT3VEMlJYM3NINlU4bU5URm9ra2JNNWczeG5iaDM4M2hHazE2MFgv?=
 =?utf-8?B?bXh6RXBCbGpHN1BmckFXSzFRUlpGQy95L1pjd0NSMWc4ZmNjNWdDVjV4YUV0?=
 =?utf-8?B?OHBCc3kxcVo1dllLcFRIb09LSmVVQW96emFHUm0rZVBqSG9JYTNuajFpMDIr?=
 =?utf-8?B?b29kb3hRYm56R0t1NUdoejNmRDFHRmdleU5jMm8rR3FGNWZGY1hRZHpTaFVp?=
 =?utf-8?B?MVlrQ3MzK3Z1SWxGamgyaXJYeEJVS2NFODV5RVh4Ui9iL2VmclYrOUJDckND?=
 =?utf-8?B?c0tqVlZYOUJEQ2hTRmZHMDc4NzF1QTFRRW1tY1lINkx1SEdRb0ZBNjNCeGVF?=
 =?utf-8?B?QXpLQ1lLODlVVXNmb1llVWxWWllndThwT0F4WVFpZWh3b09mM3JyVTlGUjIz?=
 =?utf-8?B?aTQwaVl1QzdhMmxONEJkRDcxRDA1cy94Qyt2ZWZJWkkzOGZIWEVtdUE5dVlh?=
 =?utf-8?B?bXc4MzRFYnlBeEgzbHJ0RUw3UmZuQVFCZ0JJa25SMFVDRDBTR1MvWXNpcEs0?=
 =?utf-8?B?OERBOXM2NGpqcnBHUlFpVFZlTXQ2M1g4c1BLVGJoK3cyTDZadnIvZlRnVVlu?=
 =?utf-8?B?TnRrQ2xMdGs3eUJ0c1lGMVA4WHUxcXdVUEZxNEFGNEJkbE1LOWdDUXd1SDJZ?=
 =?utf-8?B?T1oxaXFtbEpxZVFiR2R4K3ZxUHlYYXNGMzgzTWgvL05DZW5xeURFaWJnM0lD?=
 =?utf-8?B?WWl3UzVMV3B2bzJ1L0lFdklQc1BpMWJWNTFETnRlZnBYT3hrZ0ZUcHZMRzdT?=
 =?utf-8?B?aFNNNkFQMkdld0dCU1F3MFJHRDhLTllpUHN4aTE4OTErTVJJRWgyMkJvbzRT?=
 =?utf-8?B?WHVpbWxzaFJmWFg5Z050VERucWhQUWxQK09ZdnBVUzJ4ZWFGMW5Kb2pwV0NX?=
 =?utf-8?B?Y3JsTHJ2Q0kxQkxlb3BKbE9kUk5WOXNFVHJtYytJdWM5SHlsVFVoZlo4NW1U?=
 =?utf-8?Q?WTxY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e7506e-3950-4d91-2e01-08da8f038d49
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 05:57:44.7372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fW303F8PKYYCY4U+JFngChO2n/6froYwHVuPyDcPtwQTjIJqy4JdQ41R47aZliy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4113
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
Cc: Li Yunxiang <Yunxiang.Li@amd.com>, luben.tuikov@amd.com,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 03.09.22 um 04:48 schrieb Andrey Grodzovsky:
> Poblem: Given many entities competing for same rq on
> same scheduler an uncceptabliy long wait time for some
> jobs waiting stuck in rq before being picked up are
> observed (seen using  GPUVis).
> The issue is due to Round Robin policy used by scheduler
> to pick up the next entity for execution. Under stress
> of many entities and long job queus within entity some
> jobs could be stack for very long time in it's entity's
> queue before being popped from the queue and executed
> while for other entites with samller job queues a job
> might execute ealier even though that job arrived later
> then the job in the long queue.
>
> Fix:
> Add FIFO selection policy to entites in RQ, chose next enitity
> on rq in such order that if job on one entity arrived
> ealrier then job on another entity the first job will start
> executing ealier regardless of the length of the entity's job
> queue.
>
> v2:
> Switch to rb tree structure for entites based on TS of
> oldest job waiting in job queue of enitity. Improves next
> enitity extraction to O(1). Enitity TS update
> O(log(number of entites in rq))
>
> Drop default option in module control parameter.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Tested-by: Li Yunxiang (Teddy) <Yunxiang.Li@amd.com>
[SNIP]
>   /**
> @@ -313,6 +330,14 @@ struct drm_sched_job {
>   
>   	/** @last_dependency: tracks @dependencies as they signal */
>   	unsigned long			last_dependency;
> +
> +
> +	/**
> +	* @submit_ts:
> +	*
> +	* Marks job submit time

Maybe write something like "When the job was pushed into the entity queue."

Apart from that I leave it to Luben and you to get this stuff upstream.

Thanks,
Christian.

> +	*/
> +	ktime_t                         submit_ts;
>   };
>   
>   static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
> @@ -501,6 +526,10 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   				struct drm_sched_entity *entity);
>   
> +void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts,
> +			      bool remove_only);
> +
> +
>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>   			  enum drm_sched_priority priority,
>   			  struct drm_gpu_scheduler **sched_list,

