Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1750373BC31
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE00E10E66E;
	Fri, 23 Jun 2023 15:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2071.outbound.protection.outlook.com [40.107.212.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA6D10E66C;
 Fri, 23 Jun 2023 15:57:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFAcH6jq06O1RB7YNxECT/Om9864ujE9BsaT4kVUwWRS6WJ7IsBtS7njteDJvHHdIXXDz0Rd/nml2mMehi/fAztWok0hgBB6ewrIeMz20iW1iIhJ+GwjcDyNzoGs1jG9qU669ZPraiob1VP7Cz5T63a7PNq7fx7KmtY88AcJTYZkw2pZcmM9P8GISwyX1VFQeoHZ0R+XaL7f+Lm8kCoLC2DNiQSwVuOkNc9W6RGTbliwHoHlL2bsJcjCb3CZsEQscl3OPFaKguJwaa0UqbtUGUGEWBj+97eZT3ejHaHHhdi5DoXBCjawajGZcyubnZz1K9Thr4fgyPK9FIfjjZILNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oR2qzTnpzZknE59fPBE2Y4DMQIUgO5q7n0zsC2ybtGA=;
 b=Bf0JIxF5fay93CFqlnM75dV88UcychhNXoX4t/ROnyKkM7QhTGkyql2Q/7L0lsDEx+lBVAOiiFCZvDetcazbYBPCDZUu+nnv4slV4JFoaRpmynu0xzjklPaMz6iSWeeDi2zZzCWbMYFnp6NKZuHwlAoAc69McxiTDIjrSnkiFgtuN6rEL197wgVbjjXdzR48Bub9rJpYx+xAj7jFG2AdzKnhajfiTBnQ7ZALXMYGBgrAYVMIlS9Y0+ymWJaCM5J7A+dtSzmSRf48/vMMOgvdj75ZJtg5aBVHjneY76uZvk6SUoSP8mROekS8baAIS5mGHAIieP77+QZxJ1OoLTVgvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oR2qzTnpzZknE59fPBE2Y4DMQIUgO5q7n0zsC2ybtGA=;
 b=kPu5JfAezCfznHAEuDqKiDIrY1f3Q6AzquXZoEzSurIfGpXHnNH4Mj6aJXFpf4ZvKEkTUgXH6tLSQeQjTfVNJvKBQCpgCkQMeK1yZdIaJm0Wl92bGIOMfkdMcbIOmQRyUiYE/+xMLvFdTFluftm3Ow1isofyPxKxN55lsBwYDjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL0PR12MB4852.namprd12.prod.outlook.com (2603:10b6:208:1ce::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 23 Jun
 2023 15:57:44 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 15:57:44 +0000
Message-ID: <c518da2a-5ba5-af7e-e26d-1973db7b4c9e@amd.com>
Date: Fri, 23 Jun 2023 10:57:38 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V4 1/8] drivers/acpi: Add support for Wifi band RF
 mitigations
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>, Evan Quan <evan.quan@amd.com>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-2-evan.quan@amd.com>
 <CAJZ5v0iqy0yMJP5H7ub67R8R6i42=TcS_6+VF-+fWrM-9tYFQA@mail.gmail.com>
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <CAJZ5v0iqy0yMJP5H7ub67R8R6i42=TcS_6+VF-+fWrM-9tYFQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:806:21::8) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL0PR12MB4852:EE_
X-MS-Office365-Filtering-Correlation-Id: f826f283-658c-4ae8-c688-08db740294d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yHbifiwkpBG0pgCNKYkagCWDIbtIjd5sU+5g1dKBZMrwGcADkrZGTNfaMhYsVMLQTyZ47PvsLzw6+L/3WCFZj8tnEHTZ0uRezCssx6y+tFhh5CTZx2PUNZr85KPdWcuUd7u6DFG6FffRS9XLt+atLOULE3sbsRYYV8qouvFZlqgGzpW8pz5vVFywIb6pp9oNPaKeFIBDUlfY1SfRFACWEJcTROzIml2D0RTEiKR1a0ErG8Due0+U/bz9obD8+9SLUp67E+Q7LLTWcMmJonGUV+rs+WsoGCJarS4xvezogvCxlVSPvSj3IcE+WSgN/8T8LReLHadXXaY0LtU7eo+a6xOkaVXfwDD5bbAZaTkNzDmXZqK2QG55gy3p0AS508REofOW3+abJFkgGPlEX3wfPaZimvnVvvAJCDhV7hfvFtA85oM1EzNGEcWzQ8np8EbPN8XpgU0EN3MbkyADwNyLVR8aXGtO4oLR0tN9AgIFjrx2F/Ipce/xGWld31smEsrYsyE2pohLddene6Qb8S9a2+FgFhrDsAc8ar8XvB3C1dxVbHqIDN0129u+mP9xeicxQq2j5x/BcB/NvtOTQsUTLcFmpFWINZQsDIn8/Y48w4CJBFRfp373AeetUu4NmIaT9gIGt/0ypLTUMaUeowbjrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199021)(316002)(83380400001)(41300700001)(7416002)(26005)(5660300002)(2906002)(8676002)(36756003)(8936002)(38100700002)(6512007)(6506007)(53546011)(6666004)(186003)(31686004)(6486002)(66476007)(66556008)(6636002)(4326008)(66946007)(478600001)(31696002)(86362001)(110136005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVNtMW1BY1NIYmQrZCtJdU0yV3lUaE1hbmQ0UytJWVZwQm1OQVBvd2dTTnF2?=
 =?utf-8?B?V2puMlczVy9QRExBek5hYnV4R1N4dDlpQm5wTXVna0FicWh2NFVhSnJMalJr?=
 =?utf-8?B?VjkzV3Q3cFNoMmtRSWIxR3A5b09JazVjQXdpcEsxRlJieUpDQ3dseHhpTHJQ?=
 =?utf-8?B?dG9yTGI3YWQ5R3dURUJmRE85Y0t4cjZQZkI5RlAwS2xZMk5mdWZiNnVJdHMx?=
 =?utf-8?B?SHIzSVhuZXpheGhiNzFzTDl2a1pndTliNHgxS2x6c3piRUxCcGVTK3VJUFZP?=
 =?utf-8?B?RlI1bFN5ZlVLM0NKcllPcGhHdWVyK0tIU3ZuYmhOckVSbVB2SHp0Zy9Ka0VM?=
 =?utf-8?B?QXJTbnRtUVNDOG1tcmFaT2NCMXNyN1VkMEVhT3k1d1hVTDdKWFhPQ29QZ3Rr?=
 =?utf-8?B?MGc4bDdleThQKzFmVmNmbklBZk05dmVCRCtjaVFlZGV5cm1qM3ZGN05mSnA4?=
 =?utf-8?B?WGlNN1NwRzhTbnpQRUYyL1RHMHlJdkpaNHdneXQvSmN1U1I4SytoOGlnVzE1?=
 =?utf-8?B?ZWIzQ204WlFGSk5pM2pqa2grSUQ2V1dqdDQrWnIyeDY0U1pVOEppRlZIcXpr?=
 =?utf-8?B?emJ4SnEwak4vaTFzV29mUkNNMllMdVYwbGtPdUxxN2pxVDlzWUQxN0t2bEd2?=
 =?utf-8?B?WjFaYkNhT0VjeXhoempJZUREdE55VGszMUlvalROUnFVeG1xZXdtQkV3Yzkw?=
 =?utf-8?B?OTJpZ2U2YXpIRmdHV1ZDd3YybklSRk1PdDAzaEJNcno3RWQ2alJGTWFIcjZV?=
 =?utf-8?B?OUFDb2NwTi8vMmNUcTl4dWpYSms1Y0lkNHBOa1lsNjVNNk9YMXlZRzVSbjl1?=
 =?utf-8?B?eWoxYmFIWmo3b3p2UFUxYmR2MjlOOXlOM3lmbVBNUVl4UHFaZDB6U1ZIR2FL?=
 =?utf-8?B?ZHhITFBJNzNoR0FQVlp6Q3VrQTI1YXZhK3hsRWRIK0s5TzJWdTFUUUZlTU1O?=
 =?utf-8?B?cCtyck0xa2cyeUo3bk1uL1JaZ1VrN1ZNWW0wbXJNYWxub2IrYis5NDl3QnZt?=
 =?utf-8?B?MU9ZYm9XZ3ZFT3J2NmpZUDlJbHlnblZiODdFODFNUkVETFFxOTFFekVGdkxP?=
 =?utf-8?B?RmpKTUs0OFBlbDQ2bWwxa2doL0dZRW9ZcW1KRkpFeFJwY3F3VWMvd0hiZ09T?=
 =?utf-8?B?RjVkV2g2cSs1akJNVkZrcWd2MUFFOWs5cGtLbFVOc3FhV1FDUER1M0ZOSGV6?=
 =?utf-8?B?NEhwYlUxR2NMVW5XaHh2WEprTXYvYzdBUDViR2JjRXdFcVV1d0pRSjlQN2tY?=
 =?utf-8?B?a2lzM25PTHZ1Q3NHMVk2UXJYTjA3ZkxpcXVjSTdkdXNXeWpWZStHTU00N3hF?=
 =?utf-8?B?QUg1KzlScXJTQ0hnem5wU0xsNEkwN25rQ3ExVVNhcjR5MDViT2p3Uk1xV2xU?=
 =?utf-8?B?a0ZlUnVDL0VSZXFHV3ZSODBteHNKKzhNNTdzNGhpdXdiQXVkK21uc0FSQVg4?=
 =?utf-8?B?aE4yeDdjVTJuUlhTRmJtcFMzQlZuRnBERjZYYWZ4WWtENzRmeFg2OHZac0Ri?=
 =?utf-8?B?L2ZVWC9laFpXYXc3cWxtNU1xTHhzcTNpRTB0Y2hNdGl6UFZvYjdZbTVzRFd1?=
 =?utf-8?B?NHY5dG5lakFldU9GaVdoSEVtMER6djlmb3FjZXdhMlFHemJPRTVrUUswUVVu?=
 =?utf-8?B?Q2hsaSsycHR3SkVVck45V0trS0pUdjRObXpxbzBHQmxtT2NIdm13VUFjbjJh?=
 =?utf-8?B?b29BNlBDV1RpWFpOTmVtU0RHQmJtQWE4YVN1My9LV24vYkYrTzQzUTFOMmR3?=
 =?utf-8?B?M3R3MkxBM2l6YlJyaUpoT0ptQVFZMEJuZ2dhb1ZSWjA3bjdwaDlGZnVpc3dl?=
 =?utf-8?B?d1RYclRIMllpMlBjOS95amZQQ3F6LzNOK01LYVp1N0JCaGFNclBtaEw0QUM3?=
 =?utf-8?B?TzgzaHRhRXRTdHVOdFFhTzRIOG5FRmhZMStlWllWaUVjSkJwYXZLYWlTcVl5?=
 =?utf-8?B?T2tkYmtUQ3VETEl1MFNnS1pRZlNZR1o5SGlCb1IvNnhvb3FvcHdZM0IrWWpW?=
 =?utf-8?B?N3F4bU1aMGN6S0t2ek5RVGRTdHlEajBJRU5GeWFndXVuNC9Fam1JQUxaVEYv?=
 =?utf-8?B?Y2lCNTA4VWQyOUVIQU00ZE53M0l4eFRHQnIrbXR3WGsxYTExL3R2MUViSnUz?=
 =?utf-8?Q?JTe9gbihbSVaDgYryHdZWyPUT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f826f283-658c-4ae8-c688-08db740294d6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 15:57:44.0737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NnqcKdHsq+V0BIvL+9epx1eVOVtJFHDq6RD40gxrI3vJd9vO7acuh1wQHVNEXZXgXSwTOpLxjYr2IhOjVGHnYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4852
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
Cc: jingyuwang_vip@163.com, bellosilicio@gmail.com, trix@redhat.com,
 lijo.lazar@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mdaenzer@redhat.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com, arnd@arndb.de,
 hdegoede@redhat.com, netdev@vger.kernel.org, Xinhui.Pan@amd.com,
 linux-wireless@vger.kernel.org, edumazet@google.com, christian.koenig@amd.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, johannes@sipsolutions.net,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/23/2023 9:52 AM, Rafael J. Wysocki wrote:
> On Wed, Jun 21, 2023 at 7:47 AM Evan Quan <evan.quan@amd.com> wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> Due to electrical and mechanical constraints in certain platform designs
>> there may be likely interference of relatively high-powered harmonics of
>> the (G-)DDR memory clocks with local radio module frequency bands used
>> by Wifi 6/6e/7.
>>
>> To mitigate this, AMD has introduced an ACPI based mechanism that
>> devices can use to notify active use of particular frequencies so
>> that devices can make relative internal adjustments as necessary
>> to avoid this resonance.
>>
>> In order for a device to support this, the expected flow for device
>> driver or subsystems:
>>
>> Drivers/subsystems contributing frequencies:
>>
>> 1) During probe, check `wbrf_supported_producer` to see if WBRF supported
> The prefix should be acpi_wbrf_ or acpi_amd_wbrf_ even, so it is clear
> that this uses ACPI and is AMD-specific.

I guess if we end up with an intermediary library approach
wbrf_supported_producer makes sense and that could call acpi_wbrf_*.

But with no intermediate library your suggestion makes sense.

I would prefer not to make it acpi_amd as there is no reason that
this exact same problem couldn't happen on an
Wifi 6e + Intel SOC + AMD dGPU design too and OEMs could use the
same mitigation mechanism as Wifi6e + AMD SOC + AMD dGPU too.

>
> Whether or not there needs to be an intermediate library wrapped
> around this is a different matter.
