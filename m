Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B02374F90EE
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 10:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B497310E56C;
	Fri,  8 Apr 2022 08:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9762410E56C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 08:34:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDQXlAX/88reo7YTpYdaA4UpKN179fajUH/b5448XQfpJSvTnhO9mNxSyoJWM8XSoiLAkH9cIUPI2o+PKEowqFjv4AKLJVgJpxRC6eBsZJQ5YGftZF1Ju/pUaXibWw8bcMuIfJIvLuEYeEzBNxkdrOjnOoLtkd/EjJL5VoLijqrf9LrllXvJ4Gc6Atc6HQxb31vyHwyvAADDfvI3x/DCYd/FVPi4omII0ptbqcN+h2Zuk0MsFn71/F2rg7PTIF+OSRTNXlcoW6Wtp3MUO8nVZ9aLQC+oKLGpzjqwVVfLrGscf4OzXaOuHx8skDaMyJk4CUonveXxtqfLWUcERVKEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqZTcDnfcdtaezLC+KYCABtl2sz503uarCFezvmIH3U=;
 b=nZesaEshhObh0UCpS2IWpfJtxJ65+ajHFHIQo5OZULtMgCnkNm/kmqu07Rh6a/DZPHCmUNOu+s6UqAPcFxVZ7pM4RxBG2GEGBLfgzuZXUqAsM4QCAvpIhYowgUrnDKp2RBZ4F4Kjf6cVXa//0z2ffe6lKS4/epkfYtKsxM8YKQTwsH7s5WI/KopR6U6hJ7t+f55UyuUz2tUCsiUgJTeVozvmt4HEqqUZseICuFgcuUpaAFS85lJc8OQeseX69Firhv4X+qDy/2XghuEHMsbuyfzmgIADmZZ8QMaw9J0hT7UpzEzHWw3NyDvsN0woktcGeL7IL2KC5YpVBh8/vu4daQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqZTcDnfcdtaezLC+KYCABtl2sz503uarCFezvmIH3U=;
 b=L4VaHhsp0MZokHuBhsO037yNH/LLX3ugJEQ0gMy3wUkkUgsyz1KP4cXWdAxFfavAIe7Y00wD2zACakZnZRJlOkP9Fy21M5pZFcIR9YMG5Pw9U+FisMekWsy1EaOutDTbff2iakoWe5PhKQ7pX0beTxrg685tE+JS3xs8hTllZuA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MWHPR12MB1920.namprd12.prod.outlook.com (2603:10b6:300:10e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 08:34:12 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 08:34:12 +0000
Message-ID: <f7470dc1-3ff0-3365-be37-421bf30b5b47@amd.com>
Date: Fri, 8 Apr 2022 10:34:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] drm/ttm: Add common debugfs code for resource managers
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Zack Rusin <zackr@vmware.com>
References: <20220407025652.146426-1-zack@kde.org>
 <20220407025652.146426-2-zack@kde.org>
 <b84b40b8-fa7f-efa3-5c5e-2596d80bb94c@amd.com>
 <ba7ade96600cf480e929f58f30ea4cf964b94e4e.camel@vmware.com>
 <Yk/qnkpXjDnO3Wr3@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Yk/qnkpXjDnO3Wr3@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0073.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::27) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c358203-6d1b-4223-29f9-08da193a8eeb
X-MS-TrafficTypeDiagnostic: MWHPR12MB1920:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1920BB502688F56AE12DCD6D83E99@MWHPR12MB1920.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RQUvN6cj19HqwI4VgWtCfARqwunlPWab+sN0HaxPtB5pglxnN2AiKaiycUboR4nldfAIiQHCquZsht40sYZnUtBOPkdaGWOLvLIaWV6NgWUkMfM6KvV00KVfEeqCzOxbelCFBZo1+SaVKhCe5UPgu1MP+t3t+4kOWAFLMZzFEjGFMa/mD6kswKgF9KlKrWjzRhBSkdlcq9+bSdbAfndRPSiv8n2A5MTcmJzOIt88KXaAzZuevo0QG3jCpAcfJGTxe1yWn5WJPw0wjoPfeXX9E32b7l7nfagnddFiipzk41rOQW3V/49BEsjy83LY91hHtTzemNOevGgQldrcHpp70eqt4kkfQKzgpjGh8dujpYZb1hLjuxdbqF3qMvRrQ46zqIduIQSrxplmTH1E3/w74eXZSUuGmdeQhnkvqFMh841CnPILZbyxpnuhvy9cZXxdL1ABONyDYHjLRU2REi00DZdwJdN2L1MlmLmpn59xgTSTKt7lMWyoOnwJS7QigRvFh/K7fS22HKyPwCL70wlNvR5U5qJvxKa1nG9C07+S1mY1QlYw3/sTbKKBCKqyimkzkSomY/ojCKiv8k5j62yNNRJMdO+OcXwxeA8KZssScn4o20TjWhDdgRFVjVsrI48S2F6u1MNpZ8bKub2cBAzIE1GkH68icq/HbPkyPv+X4C70807QWEyHSKlwVlxJu4Vx8DVx5q/oOq6sTpuHOooYBJCCVBE8/lfiL1bElXCIlOED8r2Z4+7izY++HL7BeVWX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(6506007)(6666004)(110136005)(54906003)(38100700002)(31696002)(6486002)(86362001)(2906002)(36756003)(508600001)(2616005)(5660300002)(66574015)(83380400001)(4326008)(186003)(316002)(66476007)(8676002)(66946007)(66556008)(31686004)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXpkQ0NJSXlMQXdFUisrS05OWTNzbVJtUG5LckhZTjdLQXZ3Q0J0NEhNOVlL?=
 =?utf-8?B?SjNaak5pN0tUM2hJbVc5K1NFQVVFRGQ3bWdVTE9iUFVwc1p4UURZUXBSK0xQ?=
 =?utf-8?B?czBBaWZINWMrd3FtK0s1ZEFJNUJLR2E2SG5tN2JLbjF4dWVIQnNkdmJ4UlJ0?=
 =?utf-8?B?Z3RTcDJNbktaaDJydmN1RW1HbXkwTERPOXRTT1NxcnFmNnhVUmJENG81WWoy?=
 =?utf-8?B?dWY2bXVudjRRblVoZ1BOSDZ2M1lMUkdtakU0UGdjNWdEUXdHRFdHS04wbjRv?=
 =?utf-8?B?OHoxNDFhOUwwOEtmbytJUkFlcENwWXQ1U2tJOWtWTGE4Zks5OGFMZ3B4MnFE?=
 =?utf-8?B?M0I5d2hObFZuVFVwWnEybWhXUXNRazRSN2ZHT1FwNEZUUm9kZ05NdjByMVds?=
 =?utf-8?B?TkFaY2hHMUZmVHJUN2NFU3FMSWZ4aGs3SXhPU3RNNDRlMERlSGxYUi9wZGRX?=
 =?utf-8?B?RTNDRGNHcDN4Z25BMEF2OGFqbGRiVUFlaHhHRlAxY0dRQ2puWmRhRVJSK3Ny?=
 =?utf-8?B?V0ZkTVEyL21Sb0Z2amw4TDNBMU5PU1BQNTRobGpxeks5cGlGb1Q3dm5lajIx?=
 =?utf-8?B?Q3ErQzBaU0tHeE5YcDR3STdxM1JtUXEvZFFHcDZja0xvNnJ6UWlXL21GZWlN?=
 =?utf-8?B?WXdORnc2UzRCR1JwNGxBMEYzdjZ3ZnJ1eFdiOUd0WDU0RFZJMjZBdHUxZHNa?=
 =?utf-8?B?MVNOU0tRTlloN0d3ZzJEY2Nuc3NGYVFYUFlGYUZIUkl4OWhCVFBINWw5VGZj?=
 =?utf-8?B?T253bzlWTmZpM2Z6a0l0bUJISktzTktKVVkzQ241RytWbFVwR0lZcldHcXZn?=
 =?utf-8?B?RVFUZ2k5UTdkL29IeGpJNUFXNmk3ZjRVQm9IUTBOR2pscW0xN2VwM3hnY3d3?=
 =?utf-8?B?bEc4V2RxQ2o4WExlZ3ZjN3hIcGgrOEVoZUM2THgyOHNXREJ2OGhmR0Fpdi9t?=
 =?utf-8?B?WHViWXJQekNEcnNyN1lvaHE1L05zUG5wNE9iQ2hRNE9CSlMwUmxqRWdxODdK?=
 =?utf-8?B?amFmVHZ5YXRPUkMyd21OUjBza1E3aDRJVGxLVFBVTUp3Rm5KRUVZSkdDc2gv?=
 =?utf-8?B?TmFzc3NYL0ZoeGhYTXB2aXlYSnJWUDI4SnhsYkMwVzBMaSs5bHJLVkhIZVR4?=
 =?utf-8?B?QkovajI5RkhIa3ZGOWJ0WDlxUFpISVh3NVJ1UU80a05QWDRFSXZMcVBGQTBw?=
 =?utf-8?B?Skk3NlBxOStkM213WmVmWENxc2VEazJRUFlwdzhhcVFwNlhRQkh4dDN6Tkd4?=
 =?utf-8?B?L3NyVjMwSU1sSzhpMGxQZE5YN0QrdUJrdktGRXRtRjdrY1MrRWFUbVhST29L?=
 =?utf-8?B?U3FDOUpwV0haLzdXL3BhTTF4b1E4Y1NsK3NlSUx4MTBqblROcXV0V2IrR2Rw?=
 =?utf-8?B?QnQvYnVpOFk3UC9pWGJRbEtVMUNDSUt1TGNtd2ltUEloazFJNmVYQXYzdk1Y?=
 =?utf-8?B?YTFONFVSdGhNbXRFTzBRcHlSOEtCcGgzUG1KWmRCdHV1V2lMMzNUdGduYXEy?=
 =?utf-8?B?dm5NUzBITCs3d0ZFV0plZUNUcCtBSUJsUmo1cmdld05hL1VtbVVoZU1kcG9Q?=
 =?utf-8?B?b25WWWR2RkVhUm1zSHhmRTVyVmlwcWEzRHFkVzAvZkx3WU1Hb3hobHdObTY0?=
 =?utf-8?B?T1AwTEYvOTM1NTd0WUJxZEJzNHAvOEZ4TXpGYm5SdHdxNU5BTWxsRnhpN0JN?=
 =?utf-8?B?akJOZHdhUnIyejc5RXZHekJRL3l4TWEvc0NiU203MGoraVBlRWZBaDdyS3o5?=
 =?utf-8?B?SVZpUWEvRzhyc3p2YXRYUXBOdUJJNDZKYUo5bEY1ZjZyaWNXMnN4L3RmN2ZD?=
 =?utf-8?B?ODRkaVdwcXRPWjZjZS9jbzJNWmhCOE9FVGxZVXNKempWT1BvOHVHbWEyY1NW?=
 =?utf-8?B?S28vaGdFbjhKdHg5SHVQeDdUeiswZzYzeThKRk1RR3FaYjVodXoxdURwNHd6?=
 =?utf-8?B?VVZGbzVwS1UrUmFxQy9laHF2NUxrQ2ptYlV1eXFzRkVuQnRFY3pEaWZuTjJQ?=
 =?utf-8?B?TjJKR0p0dDIvN1NHUzhXYlZyNzZ2N3F4TFdtQ2NOU2YwcXZjeUVBTjRPYkZ4?=
 =?utf-8?B?Q1RQSGdKcFltT0Q3ejFIN2RENGhqeTJBR2pMM2JjRVZ6SmZqd25VSGZ4VlEz?=
 =?utf-8?B?dUw3a1RuT1E0SzNXNWx6WHZuM3p2ZmMzWGZyOU92QU1NMUhzdHl1MStpbCtN?=
 =?utf-8?B?RzI2eHZxcDdYclJ6UDI3ZWJxSlJQRHRlMWhtKzZNWEFmQXM0SnlITWoxOE5T?=
 =?utf-8?B?YzlwcG1hV0JpeWxmWHRwTDRaV0IzMFJpdGluazdpYlNqeGd0bVlwaE43ZEdr?=
 =?utf-8?B?andINWdITnk4cjJSWEFWdmRDNzRueE1ySndaWG84VHJnd3VRMnlGV2NpemRr?=
 =?utf-8?Q?9OwzxEVPNJu5Vs9/0RT+4+RnzdxMqD6rLhmLWYU41anj8?=
X-MS-Exchange-AntiSpam-MessageData-1: 1tv8ZgzTvRwzPw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c358203-6d1b-4223-29f9-08da193a8eeb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 08:34:12.4951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOjOsEHdHprLukkDm/LsAIm6SgK0M7krqqo0UbTIEgxp9uMcdsl7mSfs0kwN4ILN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1920
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Martin Krastev <krastevm@vmware.com>,
 "ray.huang@amd.com" <ray.huang@amd.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.04.22 um 09:56 schrieb Daniel Vetter:
> On Thu, Apr 07, 2022 at 02:15:52PM +0000, Zack Rusin wrote:
>> On Thu, 2022-04-07 at 08:01 +0200, Christian König wrote:
>>> Am 07.04.22 um 04:56 schrieb Zack Rusin:
>>>> From: Zack Rusin <zackr@vmware.com>
>>>>
>>>> Drivers duplicate the code required to add debugfs entries for
>>>> various
>>>> ttm resource managers. To fix it add common TTM resource manager
>>>> code that each driver can reuse.
>>>>
>>>> Because TTM resource managers can be initialized and set a lot
>>>> later
>>>> than TTM device initialization a seperate init function is
>>>> required.
>>>> Specific resource managers can overwrite
>>>> ttm_resource_manager_func::debug to get more information from those
>>>> debugfs entries.
>>>>
>>>> Signed-off-by: Zack Rusin <zackr@vmware.com>
>>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>>> Cc: Huang Rui <ray.huang@amd.com>
>>>> Cc: David Airlie <airlied@linux.ie>
>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Ah, yes that was on my TODO list for quite a while as well.
>>>
>>>> ---
>>>>    drivers/gpu/drm/ttm/ttm_resource.c | 65
>>>> ++++++++++++++++++++++++++++++
>>>>    include/drm/ttm/ttm_resource.h     |  4 ++
>>>>    2 files changed, 69 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
>>>> b/drivers/gpu/drm/ttm/ttm_resource.c
>>>> index 492ba3157e75..6392ad3e9a88 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>>> @@ -29,6 +29,8 @@
>>>>    #include <drm/ttm/ttm_resource.h>
>>>>    #include <drm/ttm/ttm_bo_driver.h>
>>>>
>>>> +#include "ttm_module.h"
>>>> +
>>>>    /**
>>>>     * ttm_lru_bulk_move_init - initialize a bulk move structure
>>>>     * @bulk: the structure to init
>>>> @@ -644,3 +646,66 @@ ttm_kmap_iter_linear_io_fini(struct
>>>> ttm_kmap_iter_linear_io *iter_io,
>>>>
>>>>        ttm_mem_io_free(bdev, mem);
>>>>    }
>>>> +
>>>> +#if defined(CONFIG_DEBUG_FS)
>>>> +
>>>> +#define TTM_RES_MAN_SHOW(i) \
>>>> +     static int ttm_resource_manager##i##_show(struct seq_file *m,
>>>> void *unused) \
>>>> +     { \
>>>> +             struct ttm_device *bdev = (struct ttm_device *)m-
>>>>> private; \
>>>> +             struct ttm_resource_manager *man =
>>>> ttm_manager_type(bdev, i); \
>>>> +             struct drm_printer p = drm_seq_file_printer(m); \
>>>> +             ttm_resource_manager_debug(man, &p); \
>>>> +             return 0; \
>>>> +     }\
>>>> +     DEFINE_SHOW_ATTRIBUTE(ttm_resource_manager##i)
>>>> +
>>>> +TTM_RES_MAN_SHOW(0);
>>>> +TTM_RES_MAN_SHOW(1);
>>>> +TTM_RES_MAN_SHOW(2);
>>>> +TTM_RES_MAN_SHOW(3);
>>>> +TTM_RES_MAN_SHOW(4);
>>>> +TTM_RES_MAN_SHOW(5);
>>>> +TTM_RES_MAN_SHOW(6);
>>> Uff, please not a static array.
>>>
>>>> +
>>>> +#endif
>>>> +
>>>> +/**
>>>> + * ttm_resource_manager_debugfs_init - Setup debugfs entries for
>>>> specified
>>>> + * resource managers.
>>>> + * @bdev: The TTM device
>>>> + * @file_names: A mapping between TTM_TT placements and the
>>>> debugfs file
>>>> + * names
>>>> + * @num_file_names: The array size of @file_names.
>>>> + *
>>>> + * This function setups up debugfs files that can be used to look
>>>> + * at debug statistics of the specified ttm_resource_managers.
>>>> + * @file_names array is used to figure out which ttm placements
>>>> + * will get debugfs files created for them.
>>>> + */
>>>> +void
>>>> +ttm_resource_manager_debugfs_init(struct ttm_device *bdev,
>>>> +                               const char * const file_names[],
>>>> +                               uint32_t num_file_names)
>>>> +{
>>>> +#if defined(CONFIG_DEBUG_FS)
>>>> +     uint32_t i;
>>>> +     const struct file_operations *fops[] = {
>>>> +             &ttm_resource_manager0_fops,
>>>> +             &ttm_resource_manager1_fops,
>>>> +             &ttm_resource_manager2_fops,
>>>> +             &ttm_resource_manager3_fops,
>>>> +             &ttm_resource_manager4_fops,
>>>> +             &ttm_resource_manager5_fops,
>>>> +             &ttm_resource_manager6_fops,
>>>> +     };
>>>> +
>>>> +     WARN_ON(num_file_names > ARRAY_SIZE(fops));
>>>> +
>>>> +     for (i = 0; i < num_file_names; ++i)
>>>> +             if (file_names[i] && fops[i])
>>>> +                     debugfs_create_file(file_names[i], 0444,
>>>> +                                         ttm_debugfs_root, bdev,
>>>> fops[i]);
>>> You can give the ttm_resource_manager directly as parameter here
>>> instead
>>> of the bdev and avoid the whole handling with the macro and global
>>> arrays.
>> We could but that does change the behaviour. I was trying to preserve
>> the old semantics. Because the lifetimes of driver specific managers
>> are not handled by ttm, there's nothing preventing the drivers from,
>> e.g. during reset, deleting the old and setting up new resource
>> managers. By always using ttm_manager_type() we make sure that we're
>> always using the current one. Passing ttm_resource_manager directly
>> makes it impossible to validate that at _show() time
>> ttm_resource_manager is still valid. It's not a problem for vmwgfx
>> because we never reset the resource managers but I didn't feel
>> comfortable changing the semantics like that for all drivers. It could
>> lead to weird crashes, but if you prefer that approach I'm happy to
>> change it.
> Uh resetting resource managers during the lifetime of a drm_device sounds
> very broken. I guess it's somewhat ok over suspend/resume or so when
> userspace cannot access the driver, but even then it smells fishy.
>
> Unless we have a driver doing that I don't think this is a use-case we
> should support.

Yes, completely agree.

We often use the placement enum only because it used to be a flag and 
I'm working on to get rid of that and use a pointer to the manager where 
an allocation comes from directly.

Regards,
Christian.

> -Daniel

