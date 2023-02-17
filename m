Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D8F69AFEB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 16:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8CC10E1A5;
	Fri, 17 Feb 2023 15:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596C710E1A5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 15:55:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8e7YWbxR42qE4Ase++PjGmywm0Dx9zeJxWWGalbM2FlKCi+82ZYx5atiLozpYD/ltyP0C2Gl1F0LY4Sc46mmvlTdIskJEKHTGgy0MBKGj6qp4HXuBuQi25mjHnbRfQswfHOCfOckFvMbtcbOSsS0t3ZcKgc6rvUGClMDQlpYeQ4XmNOm1Y25hxayEmBqoCtOHUPiOY3wvfytdm+AEobiL6ouXP6t+HjSMZXc7lpjNGUQgraEczn7dI3PT2YDQnlBAHr9evbFzGqKBmCZrjLy2BbUVVaBBg2WccgT1S0IBApGkP6HZKox6XcgrIOX5zywArjggRxwiLVSou92uP8sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXsrGrWlEOzVfXmdwxZWW3DSa2AlYhr3ikJZyH3QaVs=;
 b=HHJ/MU6KrJV2U25ElfG97HEhc+lb+b+MdknI+vHCZGp2SM0JketZCmp9+ZGzD/DsQjIhKxIgVi9qREoPrTCCfBpADglj8xqeYiyIzfEfC2C2PcFUXDzq18gYsr3bZLYc2n1xH08f7Knxvt0ewu2T2Yb0S+/B30HldGoJAgtFAj+JMQFPDqj+nK86Y7Wz+V+qerHv2vLzQnGFWldLhWcNhFy18aLfmicAyZ5gk9iFxoTJdPn1pdGphOCi+IATHMctmVzus6MSucg6fjFW+CNQHv27czHO2G3p1vusNg0snJQnMFFA/oiPSB9ItUGzlnzHOVRFyHeUqqRJcQ79pZdeKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXsrGrWlEOzVfXmdwxZWW3DSa2AlYhr3ikJZyH3QaVs=;
 b=SDzojbrfCNMo22Av/jdqr9idTrZUOhg/45Fmob/WH/Anajrhs4VGFxheV6NAmFs5Ry6ep7LmuhdGfcymL2abFhHPeRA9hah3DcwgkhG7HJxnCjC7HLHF4upV00kthD3eE/eIQO2s0mNvGkrhg6LbH/9IlBGZu9NatdBATeClpxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Fri, 17 Feb
 2023 15:55:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 15:55:33 +0000
Message-ID: <17f64e37-4ad4-d42d-ce0b-175f01a24957@amd.com>
Date: Fri, 17 Feb 2023 16:55:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/3] drm/debugfs: remove dev->debugfs_list and
 debugfs_mutex
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <20230209081838.45273-4-christian.koenig@amd.com>
 <Y+4UdBzk6RkQzcsI@phenom.ffwll.local>
 <20230216163757.GK2849548@linux.intel.com> <87lekxzgih.fsf@intel.com>
 <20230217103501.GC2862577@linux.intel.com> <871qmozhve.fsf@intel.com>
 <20230217113621.GD2862577@linux.intel.com>
 <5c6fe661-9e96-d122-1a7a-110ecbd8a6c6@gmail.com> <87r0uoxyby.fsf@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <87r0uoxyby.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5286:EE_
X-MS-Office365-Filtering-Correlation-Id: eee3b7d2-f180-4ebb-66dd-08db10ff66f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FJw0po4MdoAI8CL4p9Bv0TL91eIhegwAlBt6zVK05SbbK6QCVMZIlVQiVfynUe0GQCcK7X6rFhvI9f3CMizmQFwzhu9VbyT96DwrZ202MwpeojPQsdhrYQpEJWNEaEtWcw0iVry9apU8oAW4XDr8tBjq5bIcmpMTFgF0Czhd7bjX9m5Glfn3luygeFvJv6+3s/XRc+LlTrq7N8IhuJIxh36qwGposMqCShNf+/TZDzjO0iIsx1JNvmgCuqV8WyuXL+X24zTi6Tvk381oqHPYMTby8OYs0mni/NBOtD4T/U0s5OcijQlhyA0WI6avwbyiOswFM6fgmgrhX4WqSqxnYfiu4qc001j+En1kE7CHssEvkwBEIKF72n/3JL/jNLEQkI3wY2ioFRrdvTyhITd20C4F7W7B0RUrc38BsVNSTGPlYoWFk4kaKyrZlmdZXdgeE64s5eDLwPa7PyKQ9XgjWLEqPvRJRjRqqqaePf/gofm1CFXwxhDhnvRgH3/DKYmllq3aJ6TEMpPy1iexF7lxZC0mqYrGMntZOgsHN+8e0GeeX71FU0kEf7AK2/5l3/t1OtzwH2sPnnEr7pPTUIP6X4X+DQA8lRiDW14XD3A9uvoq/N5LDaVnDOj2voZFHM5/w6iE/dNqRAr15V7TP8f7K90BCqD82XrYa0O8dOh8oLheGTiTH6kre8gF+/fCGLgr0ngL58sZLzbKAlXMTgjJlq2jtyKZURA08nJxM+EPBKo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199018)(38100700002)(31696002)(86362001)(36756003)(316002)(66476007)(4326008)(66556008)(41300700001)(66946007)(110136005)(5660300002)(8936002)(2616005)(478600001)(6486002)(6506007)(6512007)(6666004)(186003)(2906002)(8676002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1dCQ3FZa2p1N3hvNDdQYU4zNkl5M214a2FKR3VQdHphakpwdEhtMDArcUVS?=
 =?utf-8?B?TWFVUXgvSmhNcnFrV1NoSUNST0w2cjF2S0c2NzNqNlBnZFpoTWVKa0wxZXJQ?=
 =?utf-8?B?bGF0cGh1bmc3L1F3N2oxRlJoU1RwL241Y0xXN0VNcWxYTUVXUk85NTVKL0pJ?=
 =?utf-8?B?ZkJGVGIvNWQwL1J1U2doZjFFNEJsYm04VkEvMXZTcjlZZm5SZVJDNVBMWGFX?=
 =?utf-8?B?L09QOGZicWsxck9LZUxCSUVrblRSRHlYN3ZubGVMcmZ6U0QyVXJyOUtOSGlQ?=
 =?utf-8?B?ZndTZnl6M0VueTVqNkdwV2JjZUJyd04zdHhuSE1FZzBRaGIwYnVUYktOODZG?=
 =?utf-8?B?SE9DalBPU1dUdmdHdm92VkU1cS9kMHo0QnBOTG5RMGZBSDdFeW1XancwaWRP?=
 =?utf-8?B?WVRUWTBRTmx0U29ncnhmWXVCWUxTWXF3K3luSjlycFJPNzlUVGZmR0t3WjZ3?=
 =?utf-8?B?aC9CdjFkM0ZXOXd3ajNrSU4xSW9tWmpkbkRUNjl2VFVHbGRoRERpTW05ZUdH?=
 =?utf-8?B?ZDE1M2svZWdPUmRsMFlBYjA1RFlGMzhMdkJmN3JnUHVEOFlPd2JjVnVsQjVn?=
 =?utf-8?B?ZUF6RFJIdGw0bjlKbmpjNERTd0JtUmxiZFRsRkNaVi8yeUxDWVh1Tk1MdFhU?=
 =?utf-8?B?elhJOWs0NHRsb2xtOExhZnBCL2QzSkhEQmVQczRPakRwNDdVZDdES2x2aG5S?=
 =?utf-8?B?QWY5bGpFL0ZXTDlEZm5WdURrV1N4SFc0UlBBdmxGZzZxaWZzR3NEcnNUbFQ5?=
 =?utf-8?B?SUhQaEtEQmw4aWY3VmlhL09jdE8wMHdPYmxaSUY1R0oyUlF0T0t1MzR4OXFu?=
 =?utf-8?B?bkpQNFBNek10dUpEc3N4cVdiVExIM0FHOVFUUnMydllKajJZU2RYMXZGdjN5?=
 =?utf-8?B?cFBpTVBNOC9nTm5nMDVPUjhOckdTYjR1VGpDVjh0RUdTZ2xWVmtKVkZNODF4?=
 =?utf-8?B?S05SNjRSQ0xJSzNXWXNSM1QrOXQvajVyaDUxYXVzZXdKK3lrMHNUZTJlQ3BU?=
 =?utf-8?B?K3B3c0lNaXAvaTRnRmNPc0JMd0pPTWlYQ2E2SWtZNFdUQ3VyYks0MHoyckdY?=
 =?utf-8?B?cmg4N0xDaXV6dVhHSVlIWHQxT2N4VkswOWEzZGE0Szk0cXBRTm5jbHgxYW4w?=
 =?utf-8?B?ODRkN3R0YnlmSWlQQW9ybjJRRHphTVdDZml1T2t6UUgxQWd6a2RrUnB2QXNi?=
 =?utf-8?B?emFENEg5eFJUeWJBSGFJWHdub2J6WjJDaGVwWUlwU0JVMDIyTFpVbzJEV204?=
 =?utf-8?B?bG56cmZ3clU4OWU1L0ltZGFhRmRyS016WDNRUnhMZVIxeVBySmJCczRpQ3lt?=
 =?utf-8?B?SUxpZFdJbkxpQUlqMFF1dkhMeWVtRkRMTU5FRDFMOEluNkVKeXJRUHVjNUN4?=
 =?utf-8?B?cWZCdkFjblA2eHZVbVNISERTNmJvaUNyUFQ5QWxVRUJ1TUY0VCtWRUlNR3NW?=
 =?utf-8?B?TUVYN0pWWE91QWVFOE9xOGtVcFYrUEV2OUhBU3kxUVR1dExBK3hiWXBMVnNu?=
 =?utf-8?B?VXhtNlJ0VHY0c2NlS3hpRHhWNlF3THpqNHRwdkIyUkJqam1lRHF6ZmR0Q1Rq?=
 =?utf-8?B?NDd1bGoyUFlCc21ZVS9WOTUyMFJORUlTTTF1aDRpR1VoVzdGSDhYZ2xNVXdG?=
 =?utf-8?B?TFFNSjRjaXgwd25TN1FwdWVWclhKZDFsYm15VDJsTkNrR0VuelFMTUNjY1BW?=
 =?utf-8?B?Yy92L0lmNHpqZ2FIb0N1L01rQ0R6QTFucWtiSncrYmVPajkxUXEweWdvU2NO?=
 =?utf-8?B?cXpJblVLMHp4UW5Pd25pRjNYSG5qd3pqZW4zeUZWMk9YNld2S0VLYWlZckcv?=
 =?utf-8?B?dTVWaXRpdkowNnllbFIwdDc5SlBFa0I4RmxocWNKTnZjQkp6d3FIZnBXbnJt?=
 =?utf-8?B?RjNseHVBemFJbVVhQ005WCsvdjlmdWNJN1BYbUJKOTVkU1IxM29OYjVwcHFY?=
 =?utf-8?B?c2RyamZuLzl5eEZqK2V3VUF3NzcyOWh2bHF6OVBoZVZUaGZPNzNFZjNvdTlW?=
 =?utf-8?B?Nm9welRBdlBBZFc2UG13MkdtOG42TnhSb090anU1ZTBUbGhTQnJTU01IbDFa?=
 =?utf-8?B?Yy80YWlleUdZaDJJUm9FZ0czYzUvZGhzS3UvMjNRdEIwcjU2My9tUjNvd05j?=
 =?utf-8?B?M1Bldm13MnFtV1orL1pXTTBhSFNGUjlLWGJGdDNnb3BKNTErRW1tbDZNbmY5?=
 =?utf-8?Q?nXqSSjHjh38CVscGLNFoWYHzMykoUehk2IPYALyWxrK6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee3b7d2-f180-4ebb-66dd-08db10ff66f3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 15:55:33.7833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3dUiquXnH+PToyOGgc5K/Aa3jzk5cBp/afVQTH1XW8rseJcSKAxA/zyD8FsuRTo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5286
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
Cc: daniel.vetter@ffwll.ch, mcanal@igalia.com, dri-devel@lists.freedesktop.org,
 mwen@igalia.com, mairacanal@riseup.net, maxime@cerno.tech,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.02.23 um 13:37 schrieb Jani Nikula:
> On Fri, 17 Feb 2023, Christian König <ckoenig.leichtzumerken@gmail.com> wrote:
>> If i915 have such structural problems then I strongly suggest to solve
>> them inside i915 and not make common code out of that.
> All other things aside, that's just a completely unnecessary and
> unhelpful remark.

Sorry, but why?

We have gone through the same problems on radeon and it was massively 
painful, what I try here is to prevent others from using this bad design 
as well. And yes I think devm_ and drmm_ is a bit questionable in that 
regard as well.

The goal is not to make it as simple as possible to write a driver, but 
rather as defensive as possible. In other words automatically releasing 
memory when an object is destroyed might be helpful, but it isn't 
automatically a good idea.

What can easily happen for example is that you run into use after free 
situations on object reference decommissions, e.g. parent is freed 
before child for example.

Regards,
Christian.

>
>
> BR,
> Jani.
>
>

