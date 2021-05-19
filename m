Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 248A8388C4E
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 13:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9C86ED15;
	Wed, 19 May 2021 11:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500DB6ED14;
 Wed, 19 May 2021 11:03:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvHWT9bMP9f0YcZfGHauv1D9jZIxTNGcHShCbrJVm8MI1b1joZ1TFyVAb95roNw9GEA2uG0v9ORssguTxu0Z1kmUxNrRZqOXjFPSD3/sJrh90Of7UHgC2bv64lzvamVngA6xubNSgMKEsgepou9/biTZSyTT0YOdwDWwOZBlMmA/1XuFToNv/3ZHRXCi3LFtAfvYKYy4kpMc7GYO//F0JtZsNmEcDaNn5klDwjXao9rCotkQvNDxrzAhPZAcSZ6WnTCiho7KrXi3HLm2FbkjA+v22o+50Qdew2q81+6CCfJMo4vjnpxivCMT7IF9NPl4Y7bN4Gp2u5IeeQVDBFbHeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwU1chr3/bPHERdfidrWDrI85usjTMvWIp/EBR1Fb3Y=;
 b=f0dnFGy90KrkEVTPNTM4ErQ6R1v3OGYBFA7KI86OPkUEQetFXV7CxwGyzZ65u9q0ZeklTs6mUaB1VQt98EV/kR54UN8QCRuYpyZNc6DAhmMUsh6vLZHv0mLZr9Q8oGFLBWlkwVdJbn0G1jwIDHJGlbHE+Zf/n7b0ymBnvt9tNPmgaFDbvojDyCBh1ttr76duh+3F8mtXcF8MZAyyfG6SJtJ/970GW9coUd3EfMjrBdXjOeU1zRn4qAP7Q4Y2EBgeIHX9qJccTztS+juczcRNWaIf5Wb23A3QXadlutDpi/tOZZKVj6l54DTB8qD9zT+j/+lvdrrNsrdQqBiwdsa4Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwU1chr3/bPHERdfidrWDrI85usjTMvWIp/EBR1Fb3Y=;
 b=LKc7b7h4OtH1YJimJ6EuvNiKhLdDZOMUmcIjUwmnpaCzlAzqaKpU5NMbfSrefJrpMDqGnNMI1ipuCo68SWCpBrFmACgaTe03t7/xy4Lj3eS3h01mCfpm2vHEfpcJWawgOp/lhQ3dHPfhwEBBbUbSd+pAQSqCGg9lWuD0KDj3KME=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2703.namprd12.prod.outlook.com (2603:10b6:805:75::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 11:03:34 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 11:03:34 +0000
Subject: Re: [PATCH v7 13/16] drm/scheduler: Fix hang when sched_entity
 released
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-14-andrey.grodzovsky@amd.com>
 <9e1270bf-ab62-5d76-b1de-e6cd49dc4841@amd.com>
 <f0c5dea7-af35-9ea5-028e-6286e57a469a@amd.com>
 <34d4e4a8-c577-dfe6-3190-28a5c63a2d23@amd.com>
 <da1f9706-d918-cff8-2807-25da0c01fcde@amd.com>
 <8228ea6b-4faf-bb7e-aaf4-8949932e869a@amd.com>
 <ec157a35-85fb-11e5-226a-c25d699102c6@amd.com>
 <53f281cc-e4c0-ea5d-9415-4413c85a6a16@amd.com>
 <0b49fc7b-ca0b-58c4-3f76-c4a5fab97bdc@amd.com>
 <31febf08-e9c9-77fa-932d-a50505866ec4@amd.com>
 <cd6bbe33-cbc5-43cb-80f7-1cb82a81e65d@amd.com>
 <77efa177-f313-5f1e-e273-6672ed46a90a@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <4a9af53a-564d-62ae-25e1-06ca4129857f@amd.com>
Date: Wed, 19 May 2021 07:03:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <77efa177-f313-5f1e-e273-6672ed46a90a@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:1069:60ba:d67c:3ab3]
X-ClientProxiedBy: YTOPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::39) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:1069:60ba:d67c:3ab3]
 (2607:fea8:3edf:49b0:1069:60ba:d67c:3ab3) by
 YTOPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Wed, 19 May 2021 11:03:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6313ecf1-24fa-4497-e7c0-08d91ab5be9b
X-MS-TrafficTypeDiagnostic: SN6PR12MB2703:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27034F61A81C0A054D398CD0EA2B9@SN6PR12MB2703.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aem5QTFgf/G5aHFz8o7aWiXvAPwtChB7zmV+yIMzIna6jKme0OmasXAhXMNssMzbFIcHh3gz76skaVJbrSDO5xKJ+PcdSnLQz/ujelz+/FEkt8vkW4IDNFFkAA8X4ZDAYe4gTZnCAJYUp21+dW7yClFQ43qcKFk8q10TVebiB9o8bMOPO6j3fWJHc9ZTqZjdg/Fo5QKNJDPcvY3XHQyHWI2ADRKNX+6VHOALm9i2u76ByFBxwSRfuKQxDE/TON9wCKrkIEo2RZgXWqbVQ2XqDvSrsMAmAtXezdVnbBwyUapLKuOW6AU9fyljmwnvdEZ/BdKUzn3RoYITqMnbgj4W7Unwd8S/lvP0Abeorl51/lYpmS3CrrOC518rJMsq3YwekFdFGQAIZ7aWErCI+we7vCR3gHit/UGZ041xaQ4VbP9KnMwm9zTyYCx9NGd4k0s4aNpj1mjRgAXbLMLtjlPneIf0BwVvHXg8GkTaU1BdBXdG0VIjaClwRqFbSaQwEO0K9nqPh2jaW+3aYam/8cUSxtjDEnpQg8rv7Q4KgDTdnZwE2R5PB39pqUSnG1lJnWjUyj5szn0I753WAg/3uwLu/mKfsfLB126drwTWfe9z7hiO/XJeG+281OmyiJKcfpKxyvpV46ebDsS/lmZ07oSFU5wyaDvH0QaT8IyoEk0uFNfhNjm6vTdoeXD6wpjig11YsnH3+FkScjQLIBlWMi6cGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(366004)(136003)(346002)(16526019)(45080400002)(4326008)(66946007)(83380400001)(6636002)(36756003)(6486002)(2616005)(5660300002)(31686004)(66476007)(186003)(8676002)(38100700002)(86362001)(44832011)(966005)(316002)(478600001)(8936002)(52116002)(110136005)(53546011)(2906002)(31696002)(66574015)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VnQ3K00rSjRHM0VLVExpRWl3ZG82elVtSUFxM3BEZk54RHlZYngxbExIdm9Z?=
 =?utf-8?B?WjNYeHpSb3dRYlBLNHhFQnNiek1COGZwaCtYMGVLdE1YRHZHVkIzMUo0QXND?=
 =?utf-8?B?Z1kyR0Yvc0RqT2JiWTlqMjA5OENLQkVhQkVOZlpVUWQ2VjlLemI2TnE4elBa?=
 =?utf-8?B?cHo0anN2K0cyR0JzUE9Fb2diR1FaWXlSdEVtajRlOVdCenNWSjNtMUl6azE0?=
 =?utf-8?B?UUhJMWhBZmFiMGIvaytFdjU5bVExUDh6ejNGSTUxS3F0Qm5TcStxVkhLQjQw?=
 =?utf-8?B?ZmJGMmJBcS9iRDczU0tRMGd0N3d2MjJVWVFqZmsyOEk5dnIvdlgwT2VoTmEv?=
 =?utf-8?B?NFBhNGJFck9tNC81VTNDeEthQlBrbTFQNjBXd0V1WC9JaHZiWmowY2c2bGxI?=
 =?utf-8?B?OXFKd01QbUY4WXVsdGJUUUIySjEwUlRueGtSVzdaOGJ5aTZXZXUwV21Ec1A4?=
 =?utf-8?B?THlucXpkdzczQnBpYkJXMi9taGFncm9ienlGUGN4dE1LbFN0dTNyRmFwcWZo?=
 =?utf-8?B?UmpGTHI3RFJzT21QeHl2WkxWWGJENzV3UHJrYnMxdkw4TjQ3T2VUQmV4ejJS?=
 =?utf-8?B?QWNIRzg4ejNCWklFYUpPeGJlQnJWeDdodWRNL1FiZTJvSnVxU0FuKzNZV1gy?=
 =?utf-8?B?dDk4dnF6QjZMdDh3ZEpsYXpkQ1pHY29SM0xuY1ZsQzNaUXhFYmdRVnhoRHdk?=
 =?utf-8?B?VVIzRmh3dUE3cUlwNVdnUVVPWWowZTZ1YjF1T0NhSWJBcXVrUW9LSytZelRh?=
 =?utf-8?B?c2RWeVlZdFE1ZUo3Tmp5dCtSYTQ5d2dUTldmWHBwSGRBQi80UjNOT0hBTU1K?=
 =?utf-8?B?cTdzNTB1WnpMSGE0Y0ZFZDBjYlBOZE1lcTBuVmVodUJGdm5VeVZiczByU3do?=
 =?utf-8?B?NTJEcnFocVF5R0FOanBtYW5RTUZaTFd6YUJ5S3J1ZVU5WDJJeVJTem0vb21k?=
 =?utf-8?B?QWZrTWZGRTZMaFY2YUdFaHd3dkNKRjRyUXU4dHB4alBBUzZzdUpHOUEvRllK?=
 =?utf-8?B?UUJ1Q2F1ODVpTmoyVzY4UWNhL3RhSGFpYzAwRXBtbVRuREFDMWVQOWhWbTM4?=
 =?utf-8?B?NWJiKzFFOFZFK1RPc1hra2ttbllCcGxiQTR3dFhuY09scUluc2xsM3pISVNP?=
 =?utf-8?B?Sk9kU0FRSHlIQTM3R1FPV2FiQ2hpNFlVbVFTblpSZnVVZElZWFl4Z3NKZzk5?=
 =?utf-8?B?Qm9ZN2VwNXJLVGQ1My83bmZFemdqS2QvK3U5NWdYVU1zbTROOU83aittZW1w?=
 =?utf-8?B?UnNUUE5rRC9Vb0I4TXkzemphNmdwUHhnQXRnV0JYeS9JbGVKQWNadVJRZENr?=
 =?utf-8?B?eUVodTYwZlNtbE5lbUVhZVdiUURJQTVtc0hkN0JKelZKZXdORFdsanE4WG4z?=
 =?utf-8?B?RzN1YnYrT0lNRjR0dXFxV2c1QlkxOHh4TEJYU2pJRFpnTGFXRUpQd3FKeXFF?=
 =?utf-8?B?bzBTZ3phSUR0V1c4djUvRVUzc3pKSXFOa2V0RENIcC9YWHBzQUd5dzVYNXNu?=
 =?utf-8?B?ZGFtRndpRjdWOVhhdVRRUkFJQTFQUDd6ZHYrbGNWUjBjVmt5WFo1YlpQWXNs?=
 =?utf-8?B?bnB1QXpKc21yYXNvbTBKSWxxTW9LdmM4NnEvU2RJZVBuSkZWMDE4aG5paVlh?=
 =?utf-8?B?L2UwdXN5L1hjUUlkMCs2UTZvRmRrVHJvVDhZTjVKWUhHYnh0VGpucW9DSkc4?=
 =?utf-8?B?SHQ0Vkk2NkNtQ1o4SVkzVnJMRmFpTk1YKzZJVDZBTGI2WUM5MVprK0NjcXRT?=
 =?utf-8?B?OFFEZzZGUkl2NE1CT2JCcnJxUWZCM2EwUTdDV0ZPTHNSM0VXT1NBc0F4OHBu?=
 =?utf-8?B?RytEQW43RmMvOWZ1TUtmaFpRZmxEZlVSbU8xNEJ4N25kazNBb0Nia250SXBF?=
 =?utf-8?Q?7LJu2EWmJ0FcG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6313ecf1-24fa-4497-e7c0-08d91ab5be9b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 11:03:34.0286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nA/LKq/3kNIwrFqH7SP23M9yTBK6lTaxZZcEWO+bz0KOnWo57o+z8h3CGBLu7cAYxxTRfVRA0DaOu6TiQaa7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2703
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-05-19 6:57 a.m., Christian König wrote:
> Am 18.05.21 um 20:48 schrieb Andrey Grodzovsky:
>> [SNIP]
>>>>
>>>> Would this be the right way to do it ?
>>>
>>> Yes, it is at least a start. Question is if we can wait blocking here 
>>> or not.
>>>
>>> We install a callback a bit lower to avoid blocking, so I'm pretty 
>>> sure that won't work as expected.
>>>
>>> Christian.
>>
>> I can't see why this would create problems, as long as the dependencies
>> complete or force competed if they are from same device (extracted) but
>> on a different ring then looks to me it should work. I will give it
>> a try.
> 
> Ok, but please also test the case for a killed process.
> 
> Christian.

You mean something like run glxgears and then simply
terminate it ? Because I done that. Or something more ?

Andrey


> 
>>
>> Andrey
> 
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cce1252e55fae4338710d08d91ab4de01%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637570186393107071%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=vGqxY5sxpEIiQGFBNn2PWkKqVjviM29r34Yjv0wujf4%3D&amp;reserved=0 
> 
