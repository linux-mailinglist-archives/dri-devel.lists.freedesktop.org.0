Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD869750D28
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 17:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCD410E57A;
	Wed, 12 Jul 2023 15:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820B110E57E;
 Wed, 12 Jul 2023 15:53:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZsLFbdvL5thIB9hmCWfjW3EqHlOb9NBjgPUJw1UeCrBUBXkVzzFVOipp+4pEq6QPzGhIbiu9Zo0hqj1/zb8CaCJhvbQ4nPxZPqB/WStdLb8YwS9GtstVbXeoJL+qOzVq7dRLi08GldC26QlufWjZOsC99nkw4BX+LrRgXl558frgMiTT7G/AC2XSoH9j4mF7/D/8BEID6OwyN+XWJA2on23zGFXvgHpBvtUwkEW/kYLSMMrNelQ0aWdyV4qeIodlT+oea3oggXSAMnZS3rjK5nLgU9ZiuwB0TaNBrIPJrPRBf3upOAVCyjXHKHSvmt6xcxQqQHlr+2r5+LvFy0Jjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oukCLwSD6tgY+ZCT9HMt3MH37DkkFbZ9MVfOZkWyp8k=;
 b=VCQVW5Bd17PcB0oDhgWCrgTpdEu+0v83eK+RKPHBYZ1vA/Vhe2F2LzhBywVmhDw1JsT20XYcSDmiH/9kCzpuqM3++xbuGUS+U41KFn/29Hvw7Ut5TVMJVcdTC5inEVs5flxO4R3h8zc/e6ZhEaZu1FbTXHAJTrG6l5x4YVEITbH1w7G+/EybS1NFXKyoFw/H7nVvOtyoQfiL3bDsV0cphWUlpZ39/sOYPoUiz+8I5n2DuGj+t5Z0zU/f228pTphuGKLhpUZ80wAbzghQ4J5jXBbbZ2/hq/4vAwgU8w/LMIf5UcwSRUq/FivumC86dub4i/qJWzrmHqwZPTWaT1CYUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oukCLwSD6tgY+ZCT9HMt3MH37DkkFbZ9MVfOZkWyp8k=;
 b=ywzk4LBu5D6GgEY57sk6nnIF1qjgo1aG5N0KJdEP7FOaaAVThFiUwBapBF0RiFgK3poOPgLhfjw7eFGoA5I6VuWlkbXuA+5EcylJ1Ni213pVNKrC6qy0lnXWjUN2b2qi/V9U+rY5CuGbMLsSuoMFBGOJKGAUbZ7gu8AALSIum5Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by SJ0PR12MB6990.namprd12.prod.outlook.com (2603:10b6:a03:449::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Wed, 12 Jul
 2023 15:53:52 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::e02a:b0f7:e051:10cd]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::e02a:b0f7:e051:10cd%5]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 15:53:52 +0000
Message-ID: <10365aad-37fa-5953-d71d-2bfe8fc68fca@amd.com>
Date: Wed, 12 Jul 2023 11:53:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/amd/display: Program OTG vtotal min/max
 selectors unconditionally for DCN1+"
Content-Language: en-CA
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230702164407.6547-1-gpiccoli@igalia.com>
 <54092b91-a9c6-7276-1633-13b83a92524d@amd.com>
 <3e4892a5-f8a8-805b-aaf9-c9aec64d9607@igalia.com>
 <CH0PR12MB52846616C04D37205DD1B70C8B36A@CH0PR12MB5284.namprd12.prod.outlook.com>
 <ed9963a1-b065-e1bf-60a4-d3dd4e57313b@igalia.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <ed9963a1-b065-e1bf-60a4-d3dd4e57313b@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::25) To CH0PR12MB5284.namprd12.prod.outlook.com
 (2603:10b6:610:d7::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR12MB5284:EE_|SJ0PR12MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: 61933c5d-5042-404f-6126-08db82f030ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yMrd6EwGNqTMvAw7yQI7Nk7bjmoJFXnKNXBRt0+ygHcjIQMR0cAS0lyu4j+EI3/1O8Db4yEK9t9BDplyAI+rtk0b9xHyYxFzO+sRWYrKFBREIvp/W/za7FxdvP94OWpcKbIbko9JN7Dlmxy1B/szSX5bKW5eDjMV6ZP/woRxal8Q14ZiApWOf7Dr08W+ScibHANYfp6BP0IvWu0JDwbztQv2M08ZIxTpR8JUG4AF6pHBkvLh+qU2QmezqBm99fJepgPu7lHxYI6a9Ja2UKqgg0CP8+C1dvwUhi7qHd9EzklhfOuckvE3gdLqK6MxqSPVn4St7u5Ip/yJ2RGFWvGu72Gf3AnxqpDUYeSk5wjPM9s3ZEE1Nv3oshJrl0cxAMGMrJBC2IVspyrh0kuF2QZ6g3sx33Wf1YFnX98st364U1b9wcSJyJ7Npynm34Ie4vAccXrKoCnO7D+cQlL4xDvuHZYUIfD9HPP4XKJabdFOAAcBpRNt2fRkUbok5rZ3aVqvdA9Z/ebQV5HBQuychTsE1g5OvKGO8Xjb+20LhUYOUf+h/4qP306yyKm0seolZsanh1Xktm9SPPbKvjow6o8BRm1UcwCy7HwIJA4ObNfxitfQCXHNAQRbhwaGxr7Wy7UIabcNvXK7fdlkMqSfMtc+pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199021)(86362001)(38100700002)(31696002)(31686004)(36756003)(6486002)(110136005)(54906003)(6666004)(26005)(6506007)(186003)(2906002)(6512007)(53546011)(478600001)(2616005)(316002)(5660300002)(66556008)(66946007)(66476007)(8936002)(8676002)(83380400001)(44832011)(41300700001)(6636002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUU3SU8zWE91N0ZDV2FpN1M3aTJIWWFsL3Fhblo3TDRnTE96K2xBeVZ3ZFFJ?=
 =?utf-8?B?d0xGWVgzUjB0YmMycStKbVdKajMzb0UyQUJKZ0NoUG1PYjc1T0JraWU2YTM5?=
 =?utf-8?B?NEhvUjhKY0NPbHFYcHV4QURHT3ExVlZ2VVFOaE4xYmhxcWRza1dzSXdMQWNV?=
 =?utf-8?B?YmZFaGNyWXRsTC9uTVlzT1p0TEk5dGlQT1hTQ0xWdE9LczRidTF0amEwVlJm?=
 =?utf-8?B?OERMczZjdjNiOVc3QmpRb0w3Rzh2bjFHSE9ONG4yOUY4R1VQcnlyR2VjYXB0?=
 =?utf-8?B?WnRoVytEaHEyeDZZWi8wUkswYUt5WGZyRVd0TWdocnhFSjMxNWJIMCsyUEtx?=
 =?utf-8?B?cGE2bXIrbFJqTEE4dG9tVURtMFVEK0RHRXQvV3lKQ3pWMHl3dTNJUFVDYS81?=
 =?utf-8?B?K0RQYWtmTjlQdlFoMEpnVS9hdlBsQXR2ZnBYZUdReFNwMmhGeGptdzZLMDJ6?=
 =?utf-8?B?YnBpcElzZTJjeW9XZWRmZmpmTVhoSXUySnQyT2JhVDNLelRoZFlBV3pER3dx?=
 =?utf-8?B?L0lBSmYzVm9KL1dJcjdRSCtCQkpIQXpvNWtkQ2RCc1REMUNNSkRJZWlhbTdR?=
 =?utf-8?B?bkptREp1MDUyTzgyK29helRwWjUvcHRrNDVzRTBxK1A4QjFkdnRSUzVHaUh4?=
 =?utf-8?B?b1hMVmFpd1pOWE1oY3hWczNqbkxrVHFqdWhhOFg2Y0VId1ZiVERUOWNFSlBr?=
 =?utf-8?B?ODg2TS9mQUV6RXh0aXQ1L1QvbGE1STJkOTRiUHJJeFpxZS9UVnpNWTFoVGFK?=
 =?utf-8?B?TEFyMnVLeTNIYnBoU2MvMDJ2dW8yUTVwUWhSQnNRTE1HbzNRNmZRYmZNTjJJ?=
 =?utf-8?B?cWFPVndFb3JsdGZIcWZ3WlBCblYvRWp5MVNTSEhZNzZSS3lJaUo2VlFGWmVn?=
 =?utf-8?B?bWpUS2R4dWI4WWNrYXhYNlVFa0RkRnA4UjZWbTByZG1BVzA3SEV0dFhEVGVC?=
 =?utf-8?B?OXlNMTZVU1hnV1NiYzJBYXlEZFljZkxMb3puOG9rcTR0V3docW1lY0MrdXpa?=
 =?utf-8?B?T0UxT1hXYzZiVEY2bkQ0WHR6YVZQZ3ZSOUoycUk3UEZrVTlCUmJYSXNiUjZT?=
 =?utf-8?B?empsVUdtSVBhVUF6OGJEbitPQ1RXM0R1Nk5WelZuK3NMOFhZT2dDUTM0MUhS?=
 =?utf-8?B?bnEyVkR5OHFaUWxUQXJIWXBEckRYeG9BR0dWQkRnTjRrWHpPTUFwTHE0cDFx?=
 =?utf-8?B?Z08zcUFZQUlEcUlxQ290Z0JkeE1QZmNMV3Q2VVNNTDZmZlduamliVFJSenl6?=
 =?utf-8?B?K0FGaGdLR3kxdWZSS213Q0lnRDFEUW4wSmdNS0V2dnVxS3BTT1BFT1hDVWJj?=
 =?utf-8?B?Q3gwcytKUWwraEx0VzBlSWlVcm9qVjA0NjN1LzJEQWpvTHM4amVGQ2l0blEz?=
 =?utf-8?B?L00zTDZ4K01EL05Xemh2OWdpejlQOVpuTnZ2REZCZlVuY21lRXlpbWRzN0xx?=
 =?utf-8?B?R084NitjSEJBb2FpbEl2cFVCSjNvUVhIS0NSTXZnNEFHaTdRSWRpQUwvZ2RS?=
 =?utf-8?B?eEdnbWxJVU44OTErQU5XTTZjVWthTjlQUzVieG1kVXk1cFM3SHovUndYRW84?=
 =?utf-8?B?Ym1LVU1ReUxmemZqQTViK3hsYVFLZ3VFSnk0Nk1ySVNPRWk1UDFWdUVjS2xD?=
 =?utf-8?B?cmRPeHhHeFlrNmxNbnJLV2YxeGJEd2FRNnhWN1Q5ckZiNlo3Y0pIbSs5OTE1?=
 =?utf-8?B?b1NUUDRDS1VyUFJHRFFHL1JXV0ZpTVhwMnBGVTg4NWdFWHE1c3B5VlU1VThC?=
 =?utf-8?B?am5zYTVKWnNsTFBNbkxScE1zZ1NyaWw0VW94VW5xcUJGMzA5VkJ0RUY0WUdw?=
 =?utf-8?B?dUVJbmtaaVpLTjNGTHlpQ1dxbzFWK29RdVBKdUg5emN6ZHAwV2o1cytkWkxy?=
 =?utf-8?B?eXVBZWFMRHFRQ3FpaXZHOTdHeDludzV2RUJGNDBtYzhjNy9xRzV0N0NQaUZt?=
 =?utf-8?B?czNDdUYvOWNQbjhsdEM1SmpXbmhudS9IV3Z0ZnkzSjhKNWhURjR4VytVU2xX?=
 =?utf-8?B?YXhIUHE4UVZwTUNBV0g0RWtJbnFVV2lqWXBEQVFRV0QwZERjMUhwZHpmcWVW?=
 =?utf-8?B?NjRJUC9tbU5ySXpHbzZoV1JOUEhJeWc3Zm9TdWJ0Wjl1OW52MHNQc3Q0NjF6?=
 =?utf-8?Q?XoeFR66M3HCg/jT5r6/JFxNA1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61933c5d-5042-404f-6126-08db82f030ab
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 15:53:52.5032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSGyCS2+Hl8xP68YJEWXUznS43oPXYZRaZBpqQy7GJk+EcD5beo9CDhqTZkE0bqLTQDst1pfw0NkR9Euin7D6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6990
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
Cc: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, "Patel,
 Swapnil" <Swapnil.Patel@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 "cristian.ciocaltea@collabora.com" <cristian.ciocaltea@collabora.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/12/2023 11:50 AM, Guilherme G. Piccoli wrote:
> On 12/07/2023 11:47, Pillai, Aurabindo wrote:
>> Hi Guilherme,
>>
>> Sorry there was one more patch which I missed to attach. Please add this
>> 3^rd  patch and retry.
>>
>> Reverting that patch would cause high power consumption on Navi2x GPU
>> also cause hangs on certain multi monitor configurations. With these 3
>> patches, you're getting the same effect as reverting the aforementioned
>> patches, but it makes the reverted sequence available only for Steam
>> deck hardware.
>>
> 
> Thanks a lot for your detailed explanation, and the 3rd patch! Indeed,
> amdgpu works fine on Deck with that - great =)
> 
> Feel free to add my:
> Tested-by: Guilherme G. Piccoli <gpiccoli@igalia.com> #Steam Deck
> 
> Oh, a fixes tag would also makes sense, I guess.
> BTW, if possible to submit the 3 patches in a proper series to get it
> merged on 6.5-rc cycle (the sooner the better), I'd really appreciate!
> 

Thanks for confirmation! I'll add the fixes tag so that it gets picked up.
