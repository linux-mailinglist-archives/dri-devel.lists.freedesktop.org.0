Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A4173A23B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 15:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DBB10E563;
	Thu, 22 Jun 2023 13:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD9310E563;
 Thu, 22 Jun 2023 13:54:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7ckdXmc5r339tqodzgh1XyiZoiKynvuSGLIlPwqRsw/Vg26CROsoQk1BHXHmD2DVOsv0CiJM1i2/5npUMwwgb3FlyjU8t64AT8FwZND0QkZWKXcIcCJWCof2rTXdT+7ijQ4RBf0mL+OZr8SgVOqXAAwAyojGNpPI8xaVw5Lfw9sM/hLqFAQ7HexbgO/pUdOZ7smc8fToVdNLkVHMMvoLHqJ3lH/eWjDwPQkG4IEwePqoJAqlNrrLEHz3WWOQ8AlPD2cf7KqlY7Qv5pokHaasv+v/6RFFr3skUKqYIYrlgCvLcbf9inU6NylE6YghNTMyaMi7/X16PROeFt/IopBiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+shdh6NGArwfLr6NFjRBJWkoog4c2JJdwtGauzW2dQ=;
 b=T2+c98VI/xfr6bcu4dk3RF06pJBMdOz9Vauj224Hz7iAosZL5fuoDrmyDSFk39E4LudkYsbIOlg/gRQutUXgK2ulNql4TNd8hdrAuIeZoEdma5t4+ONY6qrxXx298CFDDg94hwXkvVgYsNY4o9T7jCRBr+rAxH4A9nrogoWPDfAsddG8xoOlgeMnJS2RQG34x1ROAzIRAXKSkiqYupYC3spAMLOoFyK06/PgdVAEr8yOx8LSs8ambTCq+ZZ68DO5s3ED0qv9a8xSzAnbhJhdqQKxIFLUE555fTW53vLPPqOH1I/G7rVYUbs2AEW8O/LqMxXSUhjMfZK1BHx35LRT9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+shdh6NGArwfLr6NFjRBJWkoog4c2JJdwtGauzW2dQ=;
 b=N3mpkoDx6nTOPq97Y+YmeT/XIT+qYZ2dY6A84VAI4oVqDUS2OQbA+YtdfvFCDiedWXOaYWif9LDF3SqaTrii9kgHT3gYxT12BkKDWmgqoC8ZngRYNkBDL4aqK4CX5g15Q5B4g6yin8MEBaJfnpTHXJp630i/kPswt4uT4Pb9JIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB6683.namprd12.prod.outlook.com (2603:10b6:303:1e2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 13:54:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 13:54:57 +0000
Message-ID: <41aecd10-9956-0752-2838-34c97834f0c8@amd.com>
Date: Thu, 22 Jun 2023 15:54:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH drm-next v5 03/14] drm: manager to keep track of GPUs VA
 mappings
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
References: <20230620004217.4700-1-dakr@redhat.com>
 <20230620004217.4700-4-dakr@redhat.com>
 <cf6846ea-5bd0-0b41-b7e6-901c70701751@amd.com>
 <a8edf75b-e0f7-a6c7-7d29-f0d39923549b@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <a8edf75b-e0f7-a6c7-7d29-f0d39923549b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB6683:EE_
X-MS-Office365-Filtering-Correlation-Id: 118ca507-aea3-4868-9e17-08db73284348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cvmjLVgyGqtgULEgTAY23QGsp3qhLhgwVHjMl1XFvM8V+chl84h3IQNdMhcbQUqbBiJAtbWmnby+Oya1JWHJJPwl1es8aYjIdhlNiqwPro88aqVZjYw0l216ulPkituFuBpPHNaI6b8eiw5dA1BkPU9eIFLLdr6CpBLg2nbjzPskw6GtXmKFp+h9ZxlxdELwo6E0uEwQZHJTBRHWVJ6G/AOXnjaHpNXmgR1t58xUXsHW8xMxXVoLIGEA8/YQZt7EzwRWb37+IOf9hHjuFFBiRIWJxMGs46zbJ/Zs+Mjmwgu5DeOU6cLUk/x85ABMuqUad7xNppklN9FFDC0Oi7WCs5B/gZxkbHyYo9kwUS8nmwodgqAArDzfOmaV8h8tX6+Xb1pqqIcL7ouGrsWKg3H6tGgbfPgJUQajcR4tPKVWr83LgQlfkSyw5DUL6XKfN7n6fDnIGrBz0+6TuKDQ6MmpiA4PFP7ykp+8a257Rb3AegrMJzVUv9sQwClS7W65C0OCPSO2LwiRqQWRAr+zXJXyh6nrSJv/LUpYC2o8UlTCUnjmKwUOFgmgZlVSYkeykyBuQCOj8NmtDP6iCJvbnnh4HTbNetllSvcxHpINT+LHZvRfragepisnGnjG/4L2twuRUBm7duNHTdVzMvYpKVSNTkBzjcxdo8EIIXkwOSsfsNo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199021)(2906002)(7416002)(5660300002)(38100700002)(921005)(31696002)(86362001)(36756003)(478600001)(54906003)(6666004)(6486002)(41300700001)(316002)(8676002)(8936002)(66476007)(66556008)(66946007)(4326008)(66574015)(186003)(6512007)(53546011)(6506007)(83380400001)(2616005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c01ZVjNLd0o2Z3N3UnRha3BnV2VJM2krY2ZyQ2d6TkxTS3hLR2p0S1Q4eDNm?=
 =?utf-8?B?NmVZWUtLQTc5WHEzeE5wQnFnSVJIOGNxTnJ3QVFvY1laNS9iSFI4d0RoVlFh?=
 =?utf-8?B?RFRKSERGTGcxRWdsNnV6M1ZLWnVKaVRYUnJwTUJsUENna2ZqNnNscTVwd2Zt?=
 =?utf-8?B?UmxweVdQKytLWmdLK0JkQnVBTk9RZEY4dU5lTGVPL0NLU2tUT05HVEwzK1dr?=
 =?utf-8?B?WDBYNHJFb251N2pzRld0UjE0Ry8xM3c4VHhsOW44K2xldHJ4L2dvWU9BNEZW?=
 =?utf-8?B?amlwNUNNMXhETGJwMXhndHJEN2xIZ0NaMUc4cjYvYnQ2eWViT2t4WHo0RHJ1?=
 =?utf-8?B?dFd0eFBYNzRnTW5ZM1FDZzgyRWhMekFpTlViaVlSTDdKZmNRZUd2dVY0bkhr?=
 =?utf-8?B?V2VqOG1IT2I5bnBBbnZJRzdQSTdPamJzU1FGY3FtZmtNVEFoaXZGTGdtNnJE?=
 =?utf-8?B?dmFVWDQ4TnFVMTFHVmRkQ2FZU2RWNENCMkpuQTMvKyszYlJldTF5V1VEOXBu?=
 =?utf-8?B?WW93THVEbkZKbE1xLzdvRCswNEJlYktaZGh6N0JZMGxKV1pMRmRKb3RYdlFK?=
 =?utf-8?B?bW94WTJnUWRpUDVJTWFvWDJzZlBnSmMwRWRreXAvUmJMcEs2bWtLUXRzU3lG?=
 =?utf-8?B?KzhXclRTakN3Z1R1cDdaUTdPUE1JV2gvaDM1TUhkSlhYbTJDOGxPNFpoQW11?=
 =?utf-8?B?Sm9vbEtEYk4wL1hQYm15Vi9KNUhJdlVITjVXakUzWHNzS09FQXZhZjA4Z1Jq?=
 =?utf-8?B?ZXk0STE0TjdTTUJyTXRCeGVmdDRoOG5DcWFMcWU3RnM4eGt6c3hSNkdoalBo?=
 =?utf-8?B?dlZ4dk05U0o5RHUrSEpVQ1hlSlR2MDRBalVIS2VhbENZQUowKy9ScWNtSVVX?=
 =?utf-8?B?MWhGVVFpdlJUOUs4WUJML1hnY1RKRWM2YWFBVElyVkxIQldFb1VRclVrcVNk?=
 =?utf-8?B?OTNuK2FHdjRMQ3Vobit1bG9iTitCbmNzWTRxeSt3VXJTdTF3VWVOY0VjNjgr?=
 =?utf-8?B?ak0yVExYSGhKYmpoZk9GNDhuUUtGNzNZNEFJN1E3NUk1MGdydkpSRGJodDdo?=
 =?utf-8?B?ZEJLSzRobnVSTm5Fc0hRdzYxRWQ4L3doVlhmb3VDN1BSbzZLSXBoenk5eitY?=
 =?utf-8?B?VDNvNC8wV0JQcExjUUdLSHdxaWdlRXVLWG9oKzNlUUNBQ1plNDJDL24yelZF?=
 =?utf-8?B?OEVaZE9XWDRUeGdyRXBCRUJiNFdQV0ZhREJSZUhKWG1NVXViM0h0VkcxTng3?=
 =?utf-8?B?ZHpJUnVLQVR6S01TN0lSUTBNckFDbDlya3lBOHZrczVPWFBJWjByOG5zUGdM?=
 =?utf-8?B?MWx3QzdsSE9xMlpFckVSVVhaYmNxMk9HcmlEbVRKb3ZSUHhjbEQzQmtMeFdJ?=
 =?utf-8?B?dklEYmxQZis1clgyVDhvaW1HQWJuTVNuZlAyUTI3clZ1RUFVS0FFSW5FeUtN?=
 =?utf-8?B?eC9WbWZtTDN1K3g2VEhWUFhtV3ZTcEgrNlJlUHd2Ny94WWs5TWRnYmQwWUs2?=
 =?utf-8?B?M3I3US8xSHdhTHd6RVpZbE0xWFoxcjFKY3hoL2NjdjRsdEorZ3J6ZlV2S2U4?=
 =?utf-8?B?TDFrcjJMWUZJTUlFN2hVenAvWW9GZ1ZDN1UxUWxncWpuT0Jta1VjOGpMbCto?=
 =?utf-8?B?S3JhVTNWV1dXQzBoL0JDWEgvY0V6bHIwMmhSNFNJN3JxUFBEWnhsdWltZHJm?=
 =?utf-8?B?N0xQVDFnTmMyV2RPbytjbkQzeG52R09yNE11TWs5aTZCSmpmVHcwZ0ttcVJ5?=
 =?utf-8?B?OVlsTFhNd3QwOXpQdWxBNUdBeXBGQ25NNzFwUGtkU2lNMjlIN1N0T3RIMjVI?=
 =?utf-8?B?VUd3SngwRUFSV3A3TlhyNjUvQ2dqUHNvWnJHN3B2L2dHZmtPS0N4VVJxRFJ6?=
 =?utf-8?B?K0laTWY4V2tkMHlqK1BCc1FkZGJrV3dsRTNsU1RmaWNacG1WV0I4amd6QjdD?=
 =?utf-8?B?VXpMYVo4TTdvTFpBbGVDZTBJNjh4LzZ3NDJCaXMrQmpucEI3RDI1Rjd1dnlF?=
 =?utf-8?B?dGJteUNiVWJDOVpYUlNkU3RZSVdzbjRZN09PQkpramVLUEtacTIyQTkzc1N0?=
 =?utf-8?B?eUJPTi9maVQzaVZsSVpndkw0M3prMHRSVHNVZ3FQVWlFUStDMWVvVVRQZlNK?=
 =?utf-8?B?Wmc4R3ZKam9qNXl5eTJkQk0zTERwbngzVXk3aDdnN3pQQUZ2NzlJT05TdHNl?=
 =?utf-8?Q?aFfIkRH4QLvlgmEbPGDZYBomMM7hNGTaO2n3h6fBumRY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 118ca507-aea3-4868-9e17-08db73284348
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 13:54:57.1208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WV9aN4OUL8VmVyvbtRTs5CD04l85uWRAt46eWxkdCkejs8zcG4Esa95Y+aIGnkqY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6683
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Donald Robson <donald.robson@imgtec.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.06.23 um 14:23 schrieb Danilo Krummrich:
> Hi Christian,
>
> On 6/20/23 08:45, Christian König wrote:
>> Hi Danilo,
>>
>> sorry for the delayed reply. I've trying to dig myself out of a hole 
>> at the moment.
>
> No worries, thank you for taking a look anyway!
>
>>
>> Am 20.06.23 um 02:42 schrieb Danilo Krummrich:
>>> [SNIP]
>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>> index bbc721870c13..5ec8148a30ee 100644
>>> --- a/include/drm/drm_gem.h
>>> +++ b/include/drm/drm_gem.h
>>> @@ -36,6 +36,8 @@
>>>   #include <linux/kref.h>
>>>   #include <linux/dma-resv.h>
>>> +#include <linux/list.h>
>>> +#include <linux/mutex.h>
>>>   #include <drm/drm_vma_manager.h>
>>> @@ -379,6 +381,18 @@ struct drm_gem_object {
>>>        */
>>>       struct dma_resv _resv;
>>> +    /**
>>> +     * @gpuva:
>>> +     *
>>> +     * Provides the list of GPU VAs attached to this GEM object.
>>> +     *
>>> +     * Drivers should lock list accesses with the GEMs &dma_resv lock
>>> +     * (&drm_gem_object.resv).
>>> +     */
>>> +    struct {
>>> +        struct list_head list;
>>> +    } gpuva;
>>> +
>>>       /**
>>>        * @funcs:
>>>        *
>>
>> I'm pretty sure that it's not a good idea to attach this directly to 
>> the GEM object.
>
> Why do you think so? IMHO having a common way to connect mappings to 
> their backing buffers is a good thing, since every driver needs this 
> connection anyway.
>
> E.g. when a BO gets evicted, drivers can just iterate the list of 
> mappings and, as the circumstances require, invalidate the 
> corresponding mappings or to unmap all existing mappings of a given 
> buffer.
>
> What would be the advantage to let every driver implement a driver 
> specific way of keeping this connection?

Flexibility. For example on amdgpu the mappings of a BO are groups by VM 
address spaces.

E.g. the BO points to multiple bo_vm structures which in turn have lists 
of their mappings.

Additional to that there is a state maschine associated with the 
mappings, e.g. if the page tables are up to date or need to be updated 
etc....

> Do you see cases where this kind of connection between mappings and 
> backing buffers wouldn't be good enough? If so, which cases do you 
> have in mind? Maybe we can cover them in a common way as well?

Yeah, we have tons of cases like that. But I have no idea how to 
generalize them.

>
>>
>> As you wrote in the commit message it's highly driver specific what 
>> to map and where to map it.
>
> In the end the common case should be that in a VA space at least every 
> mapping being backed by a BO is represented by a struct drm_gpuva.

Oh, no! We also have mappings not backed by a BO at all! For example for 
partial resident textures or data routing to internal hw etc...

You can't be sure that a mapping is backed by a BO at all.

>
>>
>> Instead I suggest to have a separate structure for mappings in a VA 
>> space which driver can then add to their GEM objects or whatever they 
>> want to map into their VMs.
>
> Which kind of separate structure for mappings? Another one analogous 
> to struct drm_gpuva?

Well similar to what amdgpu uses BO -> one structure for each 
combination of BO and VM -> mappings inside that VM

Regards,
Christian.

>
> - Danilo
>
>>
>> Regards,
>> Christian.
>>
>>
>

