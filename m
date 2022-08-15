Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A850592C35
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 12:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17FCB5628;
	Mon, 15 Aug 2022 10:51:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E93FAF675
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 10:51:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGAviiRDqThd7GSmGpSQz2VVlLp34WkAgBdq+TV5vLmnX3KsknOMrXjz4h1KkUrMV99BxR0LNo+40B86mFmztdxXkTudPeRtdtmqI+z7qCbEpbxfZbBDGc1qv6+WFgvmm2pDcK3Nfm7ELJLWJE12kWarz62q57dP+2TnfslV9bb4C+rOwy9fRJukjxnuXFJPQhqiKgoiqTgztJSvNz34EdB7NUxjwXdOkLKvGCBKtQ48YWwz/JraHou+HNs7eU0WVaYeOb9QLDacxXJ38uVqEo8q0Cy17X/BUYulHCMyLwn0Iv0wBwlUm7wgcYoPrcjS3moZnxelCMPoSFKlp9D4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Tgiv53NsWYoN74iEuZueQIdYjz4ya+eJ2Dde/RobPM=;
 b=icCIXRa5su7kxZ1mdtZim3RQmlIqbywtkuys8stmRyalXFOKDwszNKOn3mOphB9gQLe0iayM05gW+O2VNS6MzUaf75RZU0jKky+oZ/BxfPSqXNV0WoQVpnrRZnvkCAVEwgAnxUWb2fopUcY9AVdS33h0uEQB/rTPK0lSMB9X49FBk8m0OGL3GYfGG5l4QTe1LhSi9COuOUolGDsjf1/9dcoTBTBuK9k8PVJQG9LuRSH/TfZ9TjYUIAe0bt4KaaRPHaa2z3MJpS8aHsA1aZ7jUCP0W9rtWVIPAilcbgueKugLJir0o2e3t/V99wNKbxVbtnu4cySN+vrrypgqzqEIew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Tgiv53NsWYoN74iEuZueQIdYjz4ya+eJ2Dde/RobPM=;
 b=mKcXCJjf75RC3fPtCrMgANqclsFf9ReaKg5/qsA/b0DBMB6NHVDFTidj17t3KLyz3z4P4r4zIky71arDVFfge/2FHz9jjLyuelj1a7/pJkWFAXBn5Ho/4SpKjQqr99fuNUVG6bhab0fIrlBPVbSSSYASZusnCfYxp12HypPkask=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR12MB1297.namprd12.prod.outlook.com (2603:10b6:404:14::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 10:51:09 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 15 Aug 2022
 10:51:09 +0000
Message-ID: <57562db8-bacf-e82d-8417-ab6343c1d2fa@amd.com>
Date: Mon, 15 Aug 2022 12:51:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] drm/ttm: Refcount allocated tail pages
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Trigger Huang <Trigger.Huang@gmail.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20220815095423.11131-1-dmitry.osipenko@collabora.com>
 <8230a356-be38-f228-4a8e-95124e8e8db6@amd.com>
 <134bce02-58d6-8553-bb73-42dfda18a595@collabora.com>
 <8caf3008-dcf3-985a-631e-e019b277c6f0@amd.com>
 <4fcc4739-2da9-1b89-209c-876129604d7d@amd.com>
 <14be3b22-1d60-732b-c695-ddacc6b21055@collabora.com>
 <2df57a30-2afb-23dc-c7f5-f61c113dd5b4@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2df57a30-2afb-23dc-c7f5-f61c113dd5b4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P250CA0012.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b573563c-8429-41a2-a060-08da7eac0f8b
X-MS-TrafficTypeDiagnostic: BN6PR12MB1297:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KVFozuItucHq5XWkNNyOSbfWxMkUmJZCoZYZFvdHS9zXiutpqc9uAkDsetuaRB9jOJr8aovvZQWSWzTcmITf3KvszrhM4QgO7d0uceFrns15+0i8TIEVn26g3BH/1AYSkTFDmvxZujGWSn0ohBn595zowXvLpjHSVK9gZt7Je7fswquvSBHaxFlOXkbhLeNqUsD6j3HmVrJpp2TDkqDTwIJcRVMar2N2MturLwZSWtmva+qjjqso+UvG0jGrEkPPg+Dr8H/2ReCcd37xmHK0X8bHXE31f8Mk/tS998zmjG+maVqOUjuE7evOruqotp9F1IK1y84BMgTvmCRqc1xP/wF/1TpqfHofuLymqusKx+hlC/Rvp7dqjKIHe2Ae5clPq/rgh+EuC2fWG2FEtdYu6A8i394Ag6pT9IWaHAGZNzxPgmoqCNPVG/927oZhI09CTJ8uaTu00YouT0RQ6tLxPzoEKn6AVbxL1GF6PQQ8Ptnkm1H9yE0wNHfEaUco3aB+xAN60qBEZcOfY1u+H+KxlVqR9tzG9iscd03qIjJyS4sjBYd9QzNrUiAnJLJYxgjMVkwJZt95vZY4OOK0pNxueJ9pRgLXVdMSJF2rcRbg5UlR2F1SaY1VWoeVhya3zRRNASchFQFtuMSFvLdpBNrKeennLQ8uUX0AjnIk+L4gz/LABixJrJxrX93Jy1pn9U6+rk4EpRwnPz1OSMqamfMAFW9iWyeB1MF96CYnV7jbBQ5C6K2iAauRcUUD9BldzoQACwPc4CHAdpwV01nvp/ZYh5h38MbZYu2E98cAUrK7vXUgdVbuaJnDu6GKuh4qlt9cQSVRIHNNJmWDdntoWk5Llg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(316002)(6486002)(6512007)(31696002)(6666004)(38100700002)(53546011)(8676002)(66476007)(4326008)(66556008)(66946007)(6506007)(478600001)(83380400001)(41300700001)(110136005)(36756003)(186003)(2906002)(2616005)(66574015)(5660300002)(7416002)(31686004)(8936002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk5lUDFzK2xqa3o4djJRcUR4N3ZZMU1lOFI3UHZpVGtHOUNmb3EwSDlWc1FC?=
 =?utf-8?B?N2Q4ZHBIS3FwOVVCcUFEaXVrNU80TWp5WkdqRTRJcTJuWEZ0UXhVNG5zcXZu?=
 =?utf-8?B?RnVTZnQ2djhJY1JuTTZISkVqTTJLOUVWZVNuZFZxY2VzZE1KY2hKMUEvWjJI?=
 =?utf-8?B?eFVSNXRscy9yS1ZBVTRmQXVqWjU0bVR4UEtmRTdmM0QzS3dkR1ptUmhEa2gv?=
 =?utf-8?B?MDYyL2F1VTFmQ3ZibnZDK1F1QjlnUjhRVVZKTlZNVTJ6dzVUTXF3R2xxbWla?=
 =?utf-8?B?TTQxbW9FYVBGajgwclFsWm5MdmwxWUsvRUkycWNNYld2T3ExN3Fma0d4WFJm?=
 =?utf-8?B?VVBQQ2FBRkhuV2tDNFRqN1l2NDRYbDFHNjFVdHRrMS9RS0U1ZlB5UmlqaTBC?=
 =?utf-8?B?L2kwQjNrSnhWSEZlZkc4SXp4ZU9zczdxK3lIR083WUh3RkRuYzZ5WXp0MXJp?=
 =?utf-8?B?V25TUW5uMnVpQ0xMVVV4dEtsRTNIdCt3SU5oSFBoL1pIRGgwUVE2YVY4Unk3?=
 =?utf-8?B?VGovZm8vV0RGSTQ3M0E0eDNVSjlIbjZYSWQ4SXI1VmE2QW5kcjdvQkxIUzIx?=
 =?utf-8?B?RHpjRlZkWkMxbTZWa0FVSVhaaUlqVzkweTJZWk1RRGlUR3UyZG5lN3QxUFYr?=
 =?utf-8?B?dUdCRStYbmphWFc3U1VyZE91ZmNwbWdyejBkYmpCaXdzK28yYVNZcXZneUxF?=
 =?utf-8?B?U05pem1OblpjaTRTVklHQ1dPZ3hIZXJ0UU1Xa1kxcitlbHY5YUtBS29JMEpj?=
 =?utf-8?B?aDFwbWlKSVhhUEp0QnVocGVXWkdteE5ZOERiRVFkSTRJclA2eFY1R2puclVN?=
 =?utf-8?B?emJXR1ArM0FuN0ZOb1dGcW9WZXZTRC9QUFFvQTY1RjVFT0I5clJMNXBXcTNP?=
 =?utf-8?B?Skd2a3pwaEhNbXludXlGWjNCUWZwUGFUOTY2ZWpBeC9QMUh3bStiVSt5MW83?=
 =?utf-8?B?K0xOeklodWxtQ2l5bFhkNTRGRGZhaG52b0RIenR1VU9UcTZXTmxtWnFXbEpT?=
 =?utf-8?B?ZjVjMzFkZXBZYjVQTHI5YmhOZjgwWTExQXpYV2sycUdZYnQrNkIvOVZJM1pv?=
 =?utf-8?B?T2FqKzBZa0tqN1RhSHF4V1ZtRXk1NDZlakNSOWhXWnJZMWZNM2hUM2pKWWNs?=
 =?utf-8?B?RzMvU2gyYWszcHhJLzZVRUd2RW1TblVFSDA0N3pxajI0U2NEbEozSGhqalNq?=
 =?utf-8?B?LzNoWllnZksrU2tsVmpkbXRMU1ZLNUhwbXh3anRCK25QVG16dEVWQzhSY2Jw?=
 =?utf-8?B?K3hVazZkQ1pERkk2Qk5tZjlYdm4rVXpyN1ZONjRUdVovT1pkQVA0MTFVZVNh?=
 =?utf-8?B?MTh0NDBQWmp2a0VUUGJSUS95d05CQ3lGQ3VIUGFXWXpSVUxlWWdTdXhYcnMz?=
 =?utf-8?B?Z0htR2d2RVM5REtHY2drdzNZYlp1em1YQjJzNWpCcU81cUo3N2w0c2lrRkh6?=
 =?utf-8?B?VTEvSDBmK0hYZlB1S1lTWTJMR1dQdlRFLzZvc1RDQ2Q4ZlN4VDYvcUFzMkJu?=
 =?utf-8?B?STZkMDdHaWl3eHZWcXZ1RGQ0WkFtZTFUSVNkNmJndlBXYUxJWFd5T3VsNkhP?=
 =?utf-8?B?cUVmT1NRajdqSXQvWHpkQjJuVGhja0I0ajhxZTc1aDhSRmw2ckE0MW8rNU5y?=
 =?utf-8?B?cTNVRE9PUGlLRFlTWGNRK0d6NjYydkdIekF6Njh4ZlZQUEQreU0rbkg4ZGhj?=
 =?utf-8?B?clc5OGxXYm9mLzRzNVU2N3h4cDBKcGR1UzRYRDlLbjNHQStsNys4akJMWUVx?=
 =?utf-8?B?RVNkeEs1Y25BYnVjcEQvQXhwR3M5aFBjZzg0NGNtZExmWkVrUDd6WEZhTzdw?=
 =?utf-8?B?QUpUTFE0bGI3YUxrbUczazZEdUl3Z0RWS3J5UHRVOFdQZmYvM3I5R0tmZGwz?=
 =?utf-8?B?blVNWFpvYWIwcVZCSUpTVTg4SE14YVQ0WDlsNHdrNmVZQWtoZmVNTWQ2dmtn?=
 =?utf-8?B?YkxVMElLTjg2VXBvYVBmL1hQZ1FSc2Y3c2NWMkdYZXpZYkVyM1hsa2N4cTZQ?=
 =?utf-8?B?aGhQZmlEeGRidjBwaXljR0hIRjhTZzRrMHY3Y3U1eU1UWVZPUUphMHRYR3Jy?=
 =?utf-8?B?aFphVlQ1VVRrRzVhV0VDdCsyL3daQW43cTNQTzhqc3hscks1Y1J5bjBrN0Rt?=
 =?utf-8?B?TXNiem1TVkdvWHFJNDdLL1JnSEsvdDRGVjlMUkoybE1HWTZ6RUg2clprdFpY?=
 =?utf-8?Q?DeKC7oDJvAZA7/dR97/7A/kmXDnOnVPIwRmwvHXugRdi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b573563c-8429-41a2-a060-08da7eac0f8b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 10:51:08.8973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JcvsjCGdy0ZWL5dwb25N4w0AIDvw5kD2cbqLcN6zhIDKX6e8Irf5d/0TPf3owXI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1297
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.08.22 um 12:47 schrieb Dmitry Osipenko:
> On 8/15/22 13:18, Dmitry Osipenko wrote:
>> On 8/15/22 13:14, Christian König wrote:
>>> Am 15.08.22 um 12:11 schrieb Christian König:
>>>> Am 15.08.22 um 12:09 schrieb Dmitry Osipenko:
>>>>> On 8/15/22 13:05, Christian König wrote:
>>>>>> Am 15.08.22 um 11:54 schrieb Dmitry Osipenko:
>>>>>>> Higher order pages allocated using alloc_pages() aren't refcounted and
>>>>>>> they
>>>>>>> need to be refcounted, otherwise it's impossible to map them by
>>>>>>> KVM. This
>>>>>>> patch sets the refcount of the tail pages and fixes the KVM memory
>>>>>>> mapping
>>>>>>> faults.
>>>>>>>
>>>>>>> Without this change guest virgl driver can't map host buffers into
>>>>>>> guest
>>>>>>> and can't provide OpenGL 4.5 profile support to the guest. The host
>>>>>>> mappings are also needed for enabling the Venus driver using host GPU
>>>>>>> drivers that are utilizing TTM.
>>>>>>>
>>>>>>> Based on a patch proposed by Trigger Huang.
>>>>>> Well I can't count how often I have repeated this: This is an
>>>>>> absolutely
>>>>>> clear NAK!
>>>>>>
>>>>>> TTM pages are not reference counted in the first place and because of
>>>>>> this giving them to virgl is illegal.
>>>>> A? The first page is refcounted when allocated, the tail pages are not.
>>>> No they aren't. The first page is just by coincident initialized with
>>>> a refcount of 1. This refcount is completely ignored and not used at all.
>>>>
>>>> Incrementing the reference count and by this mapping the page into
>>>> some other address space is illegal and corrupts the internal state
>>>> tracking of TTM.
>>> See this comment in the source code as well:
>>>
>>>          /* Don't set the __GFP_COMP flag for higher order allocations.
>>>           * Mapping pages directly into an userspace process and calling
>>>           * put_page() on a TTM allocated page is illegal.
>>>           */
>>>
>>> I have absolutely no idea how somebody had the idea he could do this.
>> I saw this comment, but it doesn't make sense because it doesn't explain
>> why it's illegal. Hence it looks like a bogus comment since the
>> refcouting certainly works, at least to a some degree because I haven't
>> noticed any problems in practice, maybe by luck :)
>>
>> I'll try to dig out the older discussions, thank you for the quick reply!
> Are you sure it was really discussed in public previously? All I can
> find is yours two answers to a similar patches where you're saying that
> this it's a wrong solution without in-depth explanation and further
> discussions.

Yeah, that's my problem as well I can't find that of hand.

But yes it certainly was discussed in public.

>
> Maybe it was discussed privately? In this case I will be happy to get
> more info from you about the root of the problem so I could start to
> look at how to fix it properly. It's not apparent where the problem is
> to a TTM newbie like me.
>

Well this is completely unfixable. See the whole purpose of TTM is to 
allow tracing where what is mapped of a buffer object.

If you circumvent that and increase the page reference yourself than 
that whole functionality can't work correctly any more.

Regards,
Christian.
