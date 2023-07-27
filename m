Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6DE764AB5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 10:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F5810E52D;
	Thu, 27 Jul 2023 08:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBCF10E52D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:11:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+eR6rjRVi4xgJJ/I206ksobTYabdId8OxrX7VSOOdZzTAaHN13bHwDhYxwJzRk0SuPxrL80aZg+8XzhwcLs4DHDWGSwDssmINx2RF1lp8+FM7r9GIoI+2Oz9UhFjyODPMpZ6ErZpZ+rkAz7NuxA54qMAZDikTn6ZPS/36c3W3ZcXkw48542OhhxKEskFoM7eerwhwqhPAm872MZwk544RNKbigTcM8vL51avMCIrQS5YyQ571Nwbu+c/sWYpgB8QZKJ/KVq2l2Pz0SfW7e07TVyV519l7tFvi9dtGZVFlE2iMPg9foZ1Cxq4KVz5TVioIdIj3hhiyg+EVKo99m3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fTNGjW2NMlPDivE1YiB1d5AFUazY1JhLIiCv+EJ/gI=;
 b=W3hEUMOG0vxhqBm9mVOb66NqA4+SAkiJsD9YaUng4cmNyPddBhv6XH21O6jBSXzOwSm0t9bBcU0ClZkoRlTvGJTzwBBcjgrHxb0HPjH+YPV+82cir8PvAM72xuSVP5s7Iq4jUBPi3sJvis/pM73X8TkzkmjLE5wHCfptUYTopuN8AJCx31bBD09BNVFoIkVW2hf/Sw4c5W0HAtJIdL3fcu87edz4t1d/WS2PdNvUoms24TKqJUapayVOl0ALYo3UQ4VyTHXNGU1SAWtlwuoaBkTl5uXWDOjnLYybE+kOavs3CxpyTUtPaFXlfmnD66tUnyivAenj3rEgVi1lLZT7dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fTNGjW2NMlPDivE1YiB1d5AFUazY1JhLIiCv+EJ/gI=;
 b=UuzuCqAQ1+EHh0gDi3c5+sNaknlHE61+zQbAc6+PTyjPZBjt+KD6VWklEKOgfT9xvxJJDB0ZzOCrus8xzZeGFBFOtvRIjmFSV1txCB+jVKvgiiDb/gI2zqlInsbKPsTnlQuXb94LLZNbJi1SyjSuqvV03S4eROAGZspeqO7FsXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5095.namprd12.prod.outlook.com (2603:10b6:208:31b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 08:11:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 08:11:28 +0000
Message-ID: <54d642a4-d8ad-e626-0fe1-4254aa0708da@amd.com>
Date: Thu, 27 Jul 2023 10:11:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/ttm: check null pointer before accessing when swapping
Content-Language: en-US
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 "Chen, Guchun" <Guchun.Chen@amd.com>
References: <20230724024229.1118444-1-guchun.chen@amd.com>
 <CADnq5_Pfwyen7W6v9-MoT_S=owcRHbu-+TbwJ2KTN-iHcbEY5w@mail.gmail.com>
 <f401e8b1-d2c1-9837-7a0f-35fd9a4ac64d@amd.com>
 <DM5PR12MB2469A467CC44134886BD6F9EF101A@DM5PR12MB2469.namprd12.prod.outlook.com>
 <CABXGCsM_cLPLBJW4Kxk3RBn9UpsMDqLA8bhEOOVyDSERcO-WMw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABXGCsM_cLPLBJW4Kxk3RBn9UpsMDqLA8bhEOOVyDSERcO-WMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5095:EE_
X-MS-Office365-Filtering-Correlation-Id: d3554f4f-a6d3-4d0f-88ab-08db8e79145b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3mws3tXgTzB0H6tLEd8S+ZWr1muk6f100edBnmZ6rReNmAs10ifGDtwroeRfyxHvBeABvjPxIBCcoH9ksLdsWf6vSvJTxjP95H/p4ajBdGdaPc8D36YwNhpCryZqlhDZLzzIhMnz+Zo/zpXy1B1lJJxzKcxt9wQQpOJWdsgCrqXnMyfS183dRj4Ysay6qMIAXxTdkUkc2HoMRJ85PN1o+5iepZ+7Pv/EA4eVmm5W0OsLYGCYhOiU02stEYOf35OjgFGN0mvinLrnJEa/S0LHVucHwQwHpojc5RPpRmuzk9hQLs1Z3k4hICd/zCuhllhwxsDrzdYmtDLhHkzlxf3cipHksnF7mFk9e4apLPyL6jGlMiAntLddRhkQpO62Av8Ct/ubSP+51BddABw2PEd7fEDazF7TO6+lIUmtkC63Ug2YQ9MzhawydUqSWGz/QLYglFGhZZyoFxRLTcK2YQzZzDO/z+dcZ/77pP9owvR/Ph4VkKoFtf05bX2tSQbTnGWT12VpWk+pq7wzI1ceWZ2V+0+3ePHsGPEvc7gtk/KFbcGWoRUefe9OD2kPIJ9x7qujFY28hjU1F3H16pCr4gOuusZ1SrjkCKMrzgwmvJJHkZYLCM7McDDyWi9DYTMBpuXhkGy0D3fmEVR6crc6+EM7Ew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199021)(83380400001)(31686004)(54906003)(110136005)(478600001)(31696002)(66574015)(8936002)(5660300002)(36756003)(41300700001)(2616005)(4744005)(2906002)(8676002)(6506007)(4326008)(66946007)(38100700002)(86362001)(66556008)(66476007)(6636002)(316002)(186003)(53546011)(6512007)(6486002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGYrNG9aUlRKVzB5VGlKSW9TcFRxUnlYRnA2cFdsdHZjWXYxb3Zqemk4QVNw?=
 =?utf-8?B?RjE3YU9LY00vRUhwRm1LcnZzRzFveVA2SUMzeDVEOFJsY0xESEVycmJlbkR1?=
 =?utf-8?B?UWV4bWcvMXlCc050dkFUS3E0ZzAwLy9xQ25zWlFlODZRQmxxSVdFUGhhNzl5?=
 =?utf-8?B?V3JKci8xVUUvRnRwMlNtUDBMSDZlcWhiUmlJUDYyUzZrelV2czJIN2VlVWdY?=
 =?utf-8?B?ditNK0cwUkJTYVdZdUE1cHVYSThmOXpmYVN1QndpUHpoRlZPZWFoZ1JscktR?=
 =?utf-8?B?c0lyYjhzSm9rN2plNkptSmFhZzhwb2hxM1FoRWsvQVpXRFY4akxxcDNPSHU0?=
 =?utf-8?B?aDhibWlOUTJDc2FxVEJ0Y2tpTTgyZ0lXUDdydXdJckhRNDMxWWdQUjBNOGlp?=
 =?utf-8?B?aHczSWxJdmNXNmNuenR4ZEF6aWp1YzMxSkhxTmNhUUdkT3FlVXFMWTlqeDhs?=
 =?utf-8?B?QitQTlFQNHJxanJORGs0NWpMbjRncVJJZkRLMC8wQ0dJN054M2JrbzQ1ZWEy?=
 =?utf-8?B?eWx3WG5SRlFqL3dNZElmTkI2WWdVMVZnWG9PbGdHbkNyeHU4cldOL05DVGdF?=
 =?utf-8?B?MTdQanR0VGI1WllSbWpWeHJJOEJmcnJ2N1lxSk1ZdXlHSXh1bGIrbUZNTEZK?=
 =?utf-8?B?QTY0eDYvYWwzSHROdFJYK2VXNlNBK2RPSVFuYVM4MEM4Uno5MGdwK2dHRnYy?=
 =?utf-8?B?c0d6NWQxb2hFczJMbnF1Mk9RRU80QnM3bkhnTjRQSUVOU3NLN3lqWm1kSk1s?=
 =?utf-8?B?TUhrMjUrbjFCYzI0bE1YLysvMmxMYVZ5eUxPN1ZieDBLQ2FLdlpDMTF2c09Y?=
 =?utf-8?B?bXlPMnN6ZFRraitJUFZVQjAvTCtqcUI1Uk80UHl4VWk0Q2VoeDQvSXZSM2dP?=
 =?utf-8?B?M05zelNWUW95V1kxL05JaXRTdDdTL25wN3FIakFOT21Xd0FzVklETS8zVzVa?=
 =?utf-8?B?WWsyTkNpTkR2NHBPM2hxTUZnTE92Y3E1eXVLTjUxQklHZ2tCTXpGMW9oYUxW?=
 =?utf-8?B?M1ZzdE5xSFBpTm5ieUZDNHhQZXhJRkJtMnlwZzEzVGp0YWhkaHV0Tm9aRTND?=
 =?utf-8?B?dFpOd1NLVDVSK3JNYTRDYVMwa1laNnhTRGJaTHI0dHdkZm9xS3QzYnVnTElq?=
 =?utf-8?B?MmgvL2p1bEhHcUY1cjB6VTgzQzFuOUNKako3Qmp6S25SckUzOXYxM1VlSUto?=
 =?utf-8?B?eklOTWg1ZHpWdHdMTFY3Smd0SEFVYlE3Y0xudmpWOFc4bWdBWE9SUU16QWd6?=
 =?utf-8?B?b1k2MkxMNExUVEczVHF4T24wRTFMMjkxRzM3UzhxZUxXdWFaU2JTckt6MDFa?=
 =?utf-8?B?TTQ0eDdQTXJFYnp6ZUFaYUZPSkhpMlhVVWdjdUk3ekdqMk9lNkhSb3dUSmdt?=
 =?utf-8?B?MUlwMXZVMmdrMk9NSG9SWnljVEVBb3R5U08xeVNYZlY0cUFWQTU0R3R0S1RN?=
 =?utf-8?B?OTJyaDMyWlpoTXpTalRucktSODNTYlplOTZpQUgzT0xjNiswbW1MM2NhcWNS?=
 =?utf-8?B?MEh2aWxIazJFVFc2V2t3eE9ITU5WSVZuR05UeDZNWFd4YktibSt1LzJiRWVl?=
 =?utf-8?B?ZnNpTDFocUY2UTJndVVJVnlZODFTVEZvN1podnVNR2RlWmhtSjM5REZ0bzlJ?=
 =?utf-8?B?UnI1dlhNbDdqLy9ibTFGR0hNR3E5MUd4Z1NkbXBUU2FvYklUeExleEdXODkx?=
 =?utf-8?B?Z3p6SHp2WGZmRDNKcEhnY2NSSDA4S0NkUThlcEpSc0IreUk0WTFoTnNRYzdY?=
 =?utf-8?B?WEdyRHVXYlpUQXNQenNSTG5BSU1wK0VpRm5QSG13YUxsYWVEenlYV3k1cE1K?=
 =?utf-8?B?cnlYbmV0QUlaUmFqVlNIWEgrNmRycWkyclhrZ3JqZnBKVGczMXhidDI2ZmhJ?=
 =?utf-8?B?TS93SDh2UHZDdkJTU1JnWVVsMzk4ZGlyM3pkelpWNW1jVnZMNDZZWW5tTkl4?=
 =?utf-8?B?ZkYvL3J1ZW1oeXh5ZkUrR1F4cklnTlM5TVhnUGFwRG9CbnladjN6am4xSkJO?=
 =?utf-8?B?bDNiSDJFc29CdjdyU0tlWlNCQ0xOK3RyY3NiaWFzZitEeUpwMVoyLzY2cTRr?=
 =?utf-8?B?Y3l2SGszb1l4eGFlQXZRb1M0b0lTejRRNG8zZVdBeFYzaHNhVmpUdjRXczFS?=
 =?utf-8?B?NkdwMCtYZFRLU1lxQzBEZEZqTU1CN21IcFh5YUFNcGpiZHZOT2UrS3pnSjNB?=
 =?utf-8?Q?Gk8HtyrH4t+d7Um4vnhjLTPMeMcvaT0vXgknuWzJ8FsK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3554f4f-a6d3-4d0f-88ab-08db8e79145b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 08:11:28.8709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CyvD3Yvthin1AiyJodWMpeJHL5zeIeBkaOa/Hjpxd1VKt6AaXKVU3Af51z8gldZ7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5095
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.07.23 um 09:39 schrieb Mikhail Gavrilov:
> On Thu, Jul 27, 2023 at 12:33 PM Chen, Guchun <Guchun.Chen@amd.com> wrote:
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>
>>> Has this already been pushed to drm-misc-next?
>>>
>>> Thanks,
>>> Christian.
>> Not yet, Christian, as I don't have push permission. I saw you were on vacation, so I would expect to ping you to push after you are back with full recharge.
> I expect to see it in drm-fixes-6.5 cause the problem appeared during
> the 6.5 release cycle.

Good point. The patch introducing the problem had a CC: stable tag as well.

So I've added the appropriate tags and pushed it to drm-misc-fixes.

Thanks,
Christian.

> And yes, I follow all pull requests. This patch was not included in
> yesterday's pull request :(

