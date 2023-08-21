Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C46857830E5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 21:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C900110E15B;
	Mon, 21 Aug 2023 19:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487E610E15B;
 Mon, 21 Aug 2023 19:17:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFsuOvzBEj1dcloD9lycOsyq5Vk/FBd6PnfaMyzGmqEImHX5O9ro8DX5D5hskds217W1gm+sEj+BKkhQ+23vBrNvIvRQs+Nk5ShZen+K8QoLLxDiKLfqLyjd9U8NzuhAuk9yx/Rn3oWB8lYdWdqjRwTwTjyc4Pe69rNFIe8nIOwonf2VlEbTwPnFwFxCiOtQ52oy6jI93yoEXW+ui8NwjLIU6WbaE2n92633lfswnyGGSbb6qqSliAHuzZZhR6JT8wItT1fK1u/NpTBokWhmCsSgkTh6tWKBsj5hsN2E4vZ6uhkMD5dX7qdBihA1hyflGGIm+xsyQ1gFrsv1iTKkrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnV3QHRuxu69c9/n9xhIKLgtOz9yEFwgVVTFST1moao=;
 b=UyccvLqk4NCwXsbgtizM4m1PV+iBzMxEUR5KE1+NLG3LEzxFqR9yNQArMc4+c7w6QJIM+tFDXY0eTBVO4OqgAHs8ZCej125GCvherlJp8cfvozCHtVBq9M/wswm90I9ow/Dhd8u8OPZuzvzQmyNG/X/cZaKTtJjXpLgXZclvITG8FwMyKI+KfLdVDXwO2LA7L7PVK7O2oEozYXb09hYXPHkLGr8W4lZZaA93bGgslE+GIiG8MGSZgBgeRJKWGjElbiY6ELgdCDpf2U1ybtCUN/ejYzUbal3DTwN9iRqjzGcFZs2wPIWTTahSV9HN9+8hcDrYZAl9sJigEBD/w4cWyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnV3QHRuxu69c9/n9xhIKLgtOz9yEFwgVVTFST1moao=;
 b=Lv7GQc/cUr5opt/uU+rGgwy0ufuTor/j3Smtd/l9UiWQGxTrevgR+Mh6iRXV99n7dSyiwF2hH8I1FoJHqpeLCzHhuU+ZcELK4k/tSqsXHKkBm7WfckpxMs56aIiMRF/GC4xq+DXh0qEpTF0WZs0l54mSKEiyZU4OK9ZHxEgn/ac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM6PR12MB4074.namprd12.prod.outlook.com (2603:10b6:5:218::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 19:17:49 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 19:17:48 +0000
Message-ID: <637ce3f5-a7a9-6a1f-812a-5987211f84f7@amd.com>
Date: Mon, 21 Aug 2023 15:17:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Implement svm without BO concept in xe driver
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>, Dave Airlie <airlied@gmail.com>
References: <SA1PR11MB699192A66D7A2CC7305A59569214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991F9E3107C963BDF95E04E9214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <e0d7d6a2-5c9d-6e17-4b4b-be03deb6c130@amd.com>
 <SA1PR11MB69918E5603E286961789DE6D9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <3c125b60-df60-2037-c23f-918734e4973f@amd.com>
 <SA1PR11MB69916E51CE5A9217D447B91C9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <7ae5f112-d0e9-cc52-2b22-7265ea435cc2@amd.com>
 <CAPM=9tyots9C8wEU0TgGnFmLOkfqn62ngaYYjV2yuTf7jwDGFw@mail.gmail.com>
 <SA1PR11MB6991D7E239EAB23CC8A9A36B921AA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <CAPM=9tw3wGhZ3ByfizM8+G4Ny5wQLwf4fw8pD4sySVk08355tg@mail.gmail.com>
 <SA1PR11MB69911D8AB895EEC13A64EBCE921EA@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB69912B9C5363E40A50B74B35921EA@SA1PR11MB6991.namprd11.prod.outlook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <SA1PR11MB69912B9C5363E40A50B74B35921EA@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::14) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM6PR12MB4074:EE_
X-MS-Office365-Filtering-Correlation-Id: 86173352-2906-4dd4-8fd6-08dba27b4e47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ySEZ9kM9M7/gbwo+FDrUiKcYMxgJrs/gQIM/xLLFH69mu5G4bp0Cd40D+oH7lVDsQp8xJiFiYCY8QQ2iJwuDIFH/TpA6oV3uXbJYiDMLcxwm0Ol5mSIJPgIBMwHd/QzDWGfb8vCpxXA0BBkC6i47MSbUYnv4/Ft4MABFUrwfyxt9zSyKGlW4/MN/SD3TpIDLy1rgYUyesf8+sLWUw3MCSSkSofaUewKipinSd+OncgAc+d14viVZ+hrn3+6cTtjrSTlsEKrfwk1GLDRo00jI7cjcTY/mE3KYxStAo7uPS4tj7whMTjnrgdEVR3DBVKq+KJf8SPNIMz1+qYQweoAZSDo294pMaIj6BmjhCsJ++/Wo5qW/Rdx8up4XEzq3o7cd5+m3y7N/17BoI79osZGc9qo9XGA2vg7WwmXHKAszyK5TC8oQ5+i4ZPxR8j/OKa3CpljJd8ZMNNYOfww8GyWx5pNCvghu5snshze1+pGyhRG4TrlqcPNMNu3m/GbqnWbTtu0f3ebWNl474hT+RZzXb2oo6qbqQtZnctRWEkOGF7udsij9ax5CGf2LrraDAo+ITL+g3ny107+7kcH2aRBnT4KmAbwF5kWrH6bzCidAbGbNAYwjl+Aeyq87Xid/71C0YB8aY+MNc3uVmYb1juzDMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199024)(1800799009)(186009)(66574015)(2906002)(53546011)(38100700002)(36916002)(6486002)(6506007)(83380400001)(5660300002)(44832011)(26005)(86362001)(31686004)(31696002)(8676002)(8936002)(2616005)(4326008)(316002)(66946007)(6512007)(54906003)(66556008)(66476007)(110136005)(478600001)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1dMMW9ubFNndVZKTWY1M1kzR1VlM1hrUFBwa3FZUXJYNnlXc05kRlBycG4w?=
 =?utf-8?B?bjQrdHZ5N0ZCT00ybU9xRjQ1QkViSjRjUWN6WmNWQVByTHd6UTgwQUFDSUZJ?=
 =?utf-8?B?dXpEaVRaS0RjNnhrMmJaZFBOOWtRNnZsb0EweVgzSDJ4UzMvN2JVaVg5R042?=
 =?utf-8?B?M2NmY0lTc2t4alVCU0Q2dTlkVmVQTVkwS3VkbmJUdmNWekpRMEE1QWpUd0lr?=
 =?utf-8?B?WG0zRmhmUGJvazhVQ0dhSURZTXNjUzF3djBjTjZrbVdDY0pYbmdMdjVBamNa?=
 =?utf-8?B?TGd0MkxpY284Mm9Za2Q3ckxzTEpvUjNFV0puRVNSc3pmeFJOajRzc3Q0azZt?=
 =?utf-8?B?QW9kRHBnUGRwUGQ5RmJXVnAzTUdCK251dDRxY3NmWStUTUtyNUNPM01zV2ov?=
 =?utf-8?B?ZVVjbHBrMWJPL09ZcnhHMytmQ3FMdkRDdWtBYVdHVFd5STQrNlhEaHlJMXpi?=
 =?utf-8?B?UzhpV2JIbWZUUzNPRENKK0RxeVpQKzdialFtdTJEbnRTeW8vZVhxMGwveHp5?=
 =?utf-8?B?WjQ4bDhnZkpiS3hlSHNDSUx4L25uT3d5TlZoM2lVVHZBbDhwdGFQa0R5cWlR?=
 =?utf-8?B?TU1FYkFlU1VPUFRHZnorSGFONEhaekFUQ0JJRlFGUUdJU3oyVVdYbGhFSjFG?=
 =?utf-8?B?cDRraW4vZWI2N3gyYWRUclB6c3ZqdXFGcnJzUjRlT0Z1Y0FRWHBDVEVDR2Vs?=
 =?utf-8?B?dU04K2JTK0t2bmg5VSsrUjJ0WmlCU0c2RmlTZzNNVUNqaDBtOFFaTVcxdkZS?=
 =?utf-8?B?Y2VVMTJyUk0rWDNsamo1V2VXbTlTU0R1Nm1DUUV1ZFlEWEVyNk1JT0pMZVdS?=
 =?utf-8?B?TzJYK0pOQ3hHeWhwT3JFTEJ5UXlpMHZBd2lNc3dqRVJEUHlGVVVmbkRxWFNN?=
 =?utf-8?B?K0syUDNZU2tuS2p3K1k3eU1WUWNMcEQ5WFpySDdOcklVanpCVTdlUkFlUjlC?=
 =?utf-8?B?V1ZtN09PeloyZExKUFlNZnFCM2UxZVMrRjFOVWtVU054MTlEM2QyUTV0eUl3?=
 =?utf-8?B?QXZUQ3FYU20vYnh6VnlNZGR0V2o5enUyVDhqcDNLakJsY3FSSzRiQTZ3K1Fk?=
 =?utf-8?B?dlJyc0pzKzRsbTJRQXZnazVOODl4S3VhSHQzbkNDbmhKdktuQ0FZMUtKdVlZ?=
 =?utf-8?B?ZUNpQ2huUEN3NHIrTzMvbjNXQm5XZHNZZ3hzd2pza2JRTmVyQ3B0eXBsdUxQ?=
 =?utf-8?B?eEdxanMyWll6UURVQklrbXk0YVNvZGRlS0taNXR0S25scVczY0RlMThoZWpS?=
 =?utf-8?B?Zlh5M3dWUlA3TkFCNm56RVB6ck9NWURpMnp1Z3NhNUdHOG5yeVM3dlUxaW50?=
 =?utf-8?B?UFhVTldKMVRGWk85WVUvb1UzQjN3NDBIOEJsaXkrem80TkhoNTQwNzM4NFYx?=
 =?utf-8?B?VXl1WmozcHhWQWxNbXMvY1pTcnlVQ2F3VTAyQVdURDFhTWhkWHVLWXQvYXBW?=
 =?utf-8?B?NTZIdGlMMklDVGd0MXhNOGUySk5jMEl2WmpnSE1WUkhUeXorNnJremJ2SDl0?=
 =?utf-8?B?Yjh4OC9qSm9lVkhUdGpCUzBadVpIdVJzUTZhUStjaVBwRlBBaUU4MC9jQ3hm?=
 =?utf-8?B?ZkVkRytXL0RzMGxBcFpnOFU2TldiZ2l6N3V1dWNhdS9Oa3JEczFyQ1F0SkNI?=
 =?utf-8?B?cjhrTDFuclE0TUZxMWEzaXNVb1JWZkRPY3Zwa1VjR3A4TGQxb0lkTTBNamU2?=
 =?utf-8?B?M20xdC9aMUgyRmYvY1JrWG9iVlFpejRBTFRhK3FXc3pqUlhhc1pFNitPNzZ5?=
 =?utf-8?B?TkkwZWNWZ2ZmNlg4S2F2a2hLbmI2SXFkSk1TbW5oMkVwMzd3Qy85TnBpQlR2?=
 =?utf-8?B?a2VPaTdIUjRMcHBSNGlRNVcxSnVhbW5yNVUvRkMydXEyUnp3bWVZbUFSWUNL?=
 =?utf-8?B?Y1dVbnR6amlMQ1hpQVhIZEpJbEJGdzNEYUJxOU5kQmRQOUlBa2xkenhvQ0x2?=
 =?utf-8?B?THJrZGY5MEVPT0NsYmdwQjVlT2xSUkttUHBqc0RkOEo5aEhPS2dTOHp2QTl4?=
 =?utf-8?B?T1Qxa1V0RDhvMlBtZk5QT0s4dkFSQklJbGdHdEZXMXJkYVlFdkdnbi9SYXRF?=
 =?utf-8?B?ZTdaMGQvZVRUaGJQd3dTYWM4dEhORmlhakJUUVhKYjFtMktQK3B2dGtsdHVE?=
 =?utf-8?Q?1097OArpfiYC9JssMJTskboMp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86173352-2906-4dd4-8fd6-08dba27b4e47
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 19:17:48.2207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mz11Amo0WXr9LfRTxh0lsIeVulH9XPCOIhkk9W4VjmkbD6m0TEUPxZf7+PN/mKoqA5FJGkv2bfPLFBRKp1bz4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4074
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Philip Yang <Philip.Yang@amd.com>, "Welty, Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-08-21 11:10, Zeng, Oak wrote:
> Accidently deleted Brian. Add back.
>
> Thanks,
> Oak
>
>> -----Original Message-----
>> From: Zeng, Oak
>> Sent: August 21, 2023 11:07 AM
>> To: Dave Airlie <airlied@gmail.com>
>> Cc: Brost, Matthew <matthew.brost@intel.com>; Thomas Hellström
>> <thomas.hellstrom@linux.intel.com>; Philip Yang <Philip.Yang@amd.com>; Felix
>> Kuehling <felix.kuehling@amd.com>; dri-devel@lists.freedesktop.org; intel-
>> xe@lists.freedesktop.org; Vishwanathapura, Niranjana
>> <niranjana.vishwanathapura@intel.com>; Christian König
>> <christian.koenig@amd.com>
>> Subject: RE: Implement svm without BO concept in xe driver
>>
>>> -----Original Message-----
>>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Dave
>>> Airlie
>>> Sent: August 20, 2023 6:21 PM
>>> To: Zeng, Oak <oak.zeng@intel.com>
>>> Cc: Brost, Matthew <matthew.brost@intel.com>; Thomas Hellström
>>> <thomas.hellstrom@linux.intel.com>; Philip Yang <Philip.Yang@amd.com>;
>> Felix
>>> Kuehling <felix.kuehling@amd.com>; Welty, Brian <brian.welty@intel.com>;
>> dri-
>>> devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Vishwanathapura,
>>> Niranjana <niranjana.vishwanathapura@intel.com>; Christian König
>>> <christian.koenig@amd.com>
>>> Subject: Re: Implement svm without BO concept in xe driver
>>>
>>> On Thu, 17 Aug 2023 at 12:13, Zeng, Oak <oak.zeng@intel.com> wrote:
>>>>> -----Original Message-----
>>>>> From: Dave Airlie <airlied@gmail.com>
>>>>> Sent: August 16, 2023 6:52 PM
>>>>> To: Felix Kuehling <felix.kuehling@amd.com>
>>>>> Cc: Zeng, Oak <oak.zeng@intel.com>; Christian König
>>>>> <christian.koenig@amd.com>; Thomas Hellström
>>>>> <thomas.hellstrom@linux.intel.com>; Brost, Matthew
>>>>> <matthew.brost@intel.com>; maarten.lankhorst@linux.intel.com;
>>>>> Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>;
>> Welty,
>>>>> Brian <brian.welty@intel.com>; Philip Yang <Philip.Yang@amd.com>; intel-
>>>>> xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>>>> Subject: Re: Implement svm without BO concept in xe driver
>>>>>
>>>>> On Thu, 17 Aug 2023 at 08:15, Felix Kuehling <felix.kuehling@amd.com>
>>> wrote:
>>>>>> On 2023-08-16 13:30, Zeng, Oak wrote:
>>>>>>> I spoke with Thomas. We discussed two approaches:
>>>>>>>
>>>>>>> 1) make ttm_resource a central place for vram management functions
>>> such as
>>>>> eviction, cgroup memory accounting. Both the BO-based driver and BO-less
>>> SVM
>>>>> codes call into ttm_resource_alloc/free functions for vram allocation/free.
>>>>>>>       *This way BO driver and SVM driver shares the eviction/cgroup logic,
>> no
>>>>> need to reimplment LRU eviction list in SVM driver. Cgroup logic should be
>> in
>>>>> ttm_resource layer. +Maarten.
>>>>>>>       *ttm_resource is not a perfect match for SVM to allocate vram. It is
>> still
>>> a
>>>>> big overhead. The *bo* member of ttm_resource is not needed for SVM -
>>> this
>>>>> might end up with invasive changes to ttm...need to look into more details
>>>>>> Overhead is a problem. We'd want to be able to allocate, free and evict
>>>>>> memory at a similar granularity as our preferred migration and page
>>>>>> fault granularity, which defaults to 2MB in our SVM implementation.
>>>>>>
>>>>>>
>>>>>>> 2) svm code allocate memory directly from drm-buddy allocator, and
>>> expose
>>>>> memory eviction functions from both ttm and svm so they can evict
>> memory
>>>>> from each other. For example, expose the ttm_mem_evict_first function
>>> from
>>>>> ttm side so hmm/svm code can call it; expose a similar function from svm
>> side
>>> so
>>>>> ttm can evict hmm memory.
>>>>>> I like this option. One thing that needs some thought with this is how
>>>>>> to get some semblance of fairness between the two types of clients.
>>>>>> Basically how to choose what to evict. And what share of the available
>>>>>> memory does each side get to use on average. E.g. an idle client may get
>>>>>> all its memory evicted while a busy client may get a bigger share of the
>>>>>> available memory.
>>>>> I'd also like to suggest we try to write any management/generic code
>>>>> in driver agnostic way as much as possible here. I don't really see
>>>>> much hw difference should be influencing it.
>>>>>
>>>>> I do worry about having effectively 2 LRUs here, you can't really have
>>>>> two "leasts".
>>>>>
>>>>> Like if we hit the shrinker paths who goes first? do we shrink one
>>>>> object from each side in turn?
>>>> One way to solve this fairness problem is to create a driver agnostic
>>> drm_vram_mgr. Maintain a single LRU in drm_vram_mgr. Move the memory
>>> eviction/cgroups memory accounting logic from ttm_resource manager to
>>> drm_vram_mgr. Both BO-based driver and SVM driver calls to drm_vram_mgr
>> to
>>> allocate/free memory.
>>>> I am not sure whether this meets the 2M allocate/free/evict granularity
>>> requirement Felix mentioned above. SVM can allocate 2M size blocks. But BO
>>> driver should be able to allocate any arbitrary sized blocks - So the eviction is
>> also
>>> arbitrary size.
>>>>> Also will we have systems where we can expose system SVM but userspace
>>>>> may choose to not use the fine grained SVM and use one of the older
>>>>> modes, will that path get emulated on top of SVM or use the BO paths?
>>>> If by "older modes" you meant the gem_bo_create (such as xe_gem_create
>> or
>>> amdgpu_gem_create), then today both amd and intel implement those
>>> interfaces using BO path. We don't have a plan to emulate that old mode on
>> tope
>>> of SVM, afaict.
>>>
>>> I'm not sure how the older modes manifest in the kernel I assume as bo
>>> creates (but they may use userptr), SVM isn't a specific thing, it's a
>>> group of 3 things.
>>>
>>> 1) coarse-grained SVM which I think is BO
>>> 2) fine-grained SVM which is page level
>>> 3) fine-grained system SVM which is HMM
>>>
>>> I suppose I'm asking about the previous versions and how they would
>>> operate in a system SVM capable system.
>> I got your question now.
>>
>> As I understand it, the system SVM provides similar functionality as BO-based
>> SVM (i.e., share virtual address space b/t cpu and gpu program, no explicit
>> memory placement for gpu program), but they have different user interface
>> (malloc, mmap vs bo create, vm bind).
>>
>>  From functionality perspective, on a system SVM capable system, we don't need
>> #1/#2. Once #3 is implemented and turned out be as performant as #1/#2, we
>> can ask user space to switch to #3.
>>
>> As far as I know, AMD doesn't have #1/#2 - their BO-based driver *requires* all
>> valid GPU virtual address be mapped to GPU page table *before* GPU kernel
>> submission, aka a GPU page fault is treated as fatal. Felix please fix me, as my
>> AMD knowledge is fading away...

This is correct. The AMD driver can only handle recoverable page faults 
for virtual address ranges managed by system SVM.

That said, if you want performance parity with #1/#2, you basically need 
to pre-fault things even for #3. Device page faults just add too much 
latency.


>>
>>  From interface perspective, i.e., to keep UMD which using #1/#2 continue to run
>> without modification, we need #1/#2 to continue exist.

Agreed.


>>
>> Should we emulate #1/#2 on top of #3? I feel the BO-based memory
>> management and the struct page/hmm based memory management are quite
>> different design philosophy. Trying to emulate one on top of another can run into
>> serious difficulty. For example, how do we emulate a vm_bind on top of #3?
>> Remember for #1/#2 virtual address space is managed by user space while #3	
>> virtual address space is managed by kernel core mm (vma struct...). It is a hard
>> conflict here...

I have thought about emulating BO allocation APIs on top of system SVM. 
This was in the context of KFD where memory management is not tied into 
command submissions APIs, which would add a whole other layer of 
complexity. The main unsolved (unsolvable?) problem I ran into was, that 
there is no way to share SVM memory as DMABufs. So there is no good way 
to support applications that expect to share memory in that way.

You may be able to emulate that with file-backed memory (e.g. POSIX 
IPC), but it adds overhead at allocation time and HMM migration 
currently doesn't work with file-backed memory.

Regards,
   Felix


>>
>> Thanks again for the great question!
>> Oak
>>
>>> Dave.
>>>> Thanks,
>>>> Oak
>>>>
>>>>> Dave.
