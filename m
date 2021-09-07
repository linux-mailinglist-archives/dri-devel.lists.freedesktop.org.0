Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5520B402E90
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 20:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7A66E0BF;
	Tue,  7 Sep 2021 18:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5920A6E0BF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 18:54:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1cUVohAK8feX/+jIq3qOneQqH/ilFjWtrto6E8HLBAOpMe6wkHMq2ANKFfwrLB339pvcbV9jx1ftvxNDJpHwyyOhqXRX9Hab5mAdl7RbUKo9WbHX9w4iOMpbYZ1QIbaIs+oauQceM9fb9TtkGCcZfsAGxWZaMHPL4t4ahlvT549pyi0ydCmyC8Jk2os7zDEpex5P8hl434uX7ns7TFmmCp3vf22VODvwFicAssmmkp73gB6Piytss921/gv9fVZ4zlqZBBifHZgGRsP8uMUlGAilIkVCKyh9L8pxam+ZEmKXc1fVcN9VTdEdmpVsm74PYdDXZ0AGDWHK150b2vCFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=54n8YYqgnNK8QdJt+ht1f8C75ajOluN+uk7swyxgvlc=;
 b=DORvFGGnHIWCKCsFb0QKaSwSQV6TitG2Q4gevALReqEMHAAqDLCFKAoucyQMv+vHYAL9dMo6FKfPOSvJnDnq2X/YbUpoKX807TJ1g+tmhh12Tw1Lzl61n2NCdlk+rQ5uhOmnsKgojt8BA6zCkipNbSrrPTTn/4vMia1Tckv27eYrza+0Z0a3y+9QbmNGAI5v1rCS50dcQ8THPCIYp8EiNL+Ka5+rEKzz8/EaoDnaEHHbCSEJOFxhOFT8xkVMYjA3mv6L96ipHU1TdUJsIlokIw/JBge6SSugHUn3UqjPhfdLcR5knZucytMhDsxUvUTcUm0HCzS7uiuh2XGuXS0IZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54n8YYqgnNK8QdJt+ht1f8C75ajOluN+uk7swyxgvlc=;
 b=xPOo1t4XdsO4DdOsS9m/QjEP4X4E+GKW04EuHWAZfEdMiXyWbhvfsAVmIWhRPtFx//DPjoj6nyVbPPDMPcQVM7N49Mwpj6q/7PW6MZJ3Ipwb4UwGOoUjquUEAXHVtuDJMOPwsVvO4yBiAqtfImvuRQoKf90m6+ZEaEF1JLqfg3E=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4717.namprd12.prod.outlook.com (2603:10b6:805:e2::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 18:54:10 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d%6]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 18:54:10 +0000
Subject: Re: [PATCH v5 02/16] drm/sched: Allow using a dedicated workqueue for
 the timeout/fault tdr
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Emma Anholt <emma@anholt.net>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, Qiang Yu <yuq825@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210629073510.2764391-1-boris.brezillon@collabora.com>
 <20210629073510.2764391-3-boris.brezillon@collabora.com>
 <5b619624-ca5d-6b9a-0600-f122a4d68c58@amd.com>
 <20210629131858.1a598182@collabora.com>
 <532d1f9d-1092-18c3-c87d-463cfda60ed7@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <eaaad39f-832b-0c43-5043-061dc717a756@amd.com>
Date: Tue, 7 Sep 2021 14:53:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <532d1f9d-1092-18c3-c87d-463cfda60ed7@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:49b0:c88d:e1a5:e87b:51ee]
 (2607:fea8:3edf:49b0:c88d:e1a5:e87b:51ee) by
 YTXPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 18:54:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ef30393-1643-4979-e3bd-08d97230e052
X-MS-TrafficTypeDiagnostic: SN6PR12MB4717:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB47177F64F58D7E6E44FD0F38EAD39@SN6PR12MB4717.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rhrn7FeouA7SIOCtt3C5WAnHFSgd9ubYK1wvP3yDUJDdT9hIZ5aqHwlYxyyyZx7EnmGSCgPM8My18GhX1IZj/Oh61kPLsA8QMTztFBbU3oSbofrQbAuS80YLaq3ldTyamLVercLBnU08rmNtP6HHyUy1KWwdIc+5UDnRNDOhp7N7+kD18KX99ODcKQK+WXB6v8qGDdJxZUYfHHYDNUL0xTJ1FV32fFQxeu2j5k7xt99xURHFjkfWTONqCiWcRlcJ+OAPRDeb5EfIrAa3Rrbbij9mEYwVfLSmle/HgjdeQrCjm3LV97+O1+3IsRCFcPks4nWVsYAfuWPuXCJbiONT6SNj1EHigqfVenn/J+7/0SFtl4jxIWeqK0RaSgIEKKYAX4m4EspxAFEVqk8Q3epBqsPNZkdKDt8xYnWsyV9ZhCXv1TYOBTGd0l21usgCZo/G4DmP6w7EYQcrlc24aBBnV/moZfxBtYanpECkvSlP76dyCyKPhK/LfDceTidcK8uoJ7XYuWAekUC9nRUEwRSPzQGX8WUQIdj2cTTV+BxEI+uYtOslkaMzl+7D95+TX5jyec7uoeDI1TNe1d60OyJTRDRARG0m0CvgpFPEmMF9uevx83r1VLJE4rWzMOnzcxcSR3/tRaOiNL6X6+HlbGiuzV+SiyFEcIH+jbe+DSW717MDZULK83doJdNIlVK36U1HWfmZEyCuEoFJ4od454GrfjL8UWKMEsZF/5e0EVZicTw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(6666004)(316002)(83380400001)(66946007)(6486002)(8936002)(53546011)(4326008)(36756003)(66476007)(54906003)(110136005)(2906002)(31696002)(66556008)(478600001)(186003)(5660300002)(2616005)(44832011)(86362001)(8676002)(38100700002)(31686004)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW5wWXI0Q1lYTjZLQkhBcDNZRit2V2JyTmM0OXFMaTRmZWIvUkFudHU3OWVh?=
 =?utf-8?B?cmVCbS9hU1BLT2dzMUNlckFDNklyTVZnNWdRVDk4MWM4N01tUWxmS2VramRE?=
 =?utf-8?B?S1JoeDBxVXJ3c0I1cDV0aUIvdGF1MjlIZnJMc1R2SWowVXE4Y0N3U1lrNytO?=
 =?utf-8?B?WlFiZExKbWgxajdkcWY5VVlFZU02Lys0WmdmbzVZTlJIa1BVSG1vUUZLdUJJ?=
 =?utf-8?B?bDRGNnVJRXpPMkwxeG43YlFiSGhYMkNlcmdLb3RraHgvVmhNR1hwTjBnSGpo?=
 =?utf-8?B?ZjZuTWMzWHJyaDREaWx3dktnVWV6bnpqVEFUUXFVWStVZGNSdkdPaUQ0bDAv?=
 =?utf-8?B?U0E2WkNzbWxUNW9Yc3lzSlF5RkpweWp5NFhTdVVsejdIS2JjZG1FVTlRbXVi?=
 =?utf-8?B?eTYyTkp6aVpHOE5vN0twenQvSGJqSWV3SGZuODZXTTlHb29iRHBydUk4ZURp?=
 =?utf-8?B?dFVLZjMySEZkVzlMNnRDYnVjM01tRExWeW5EZ2V1bTlqekt2OVo1a0lRbHll?=
 =?utf-8?B?MUFZN0tYZkJVQzBEdmRlMTBtNS9qYUVOME9JU3VNNFZRdnpKMzVCeWI5UWd1?=
 =?utf-8?B?ZmJoUmNtMWZNRlVQckwvdVJ1Y2lHS0ZaNE83ckwrK1NMc3ZMQThMTFdFTGM2?=
 =?utf-8?B?bnhQbnA5bFI3QjJLbjZ1SEJabVoyRUxyTGdjcDk4VVpwSWU1ZW0xMElBekdH?=
 =?utf-8?B?TDkydmlSdmh6d2hXWlJBZEtUQ1pYVE5xSEZmeWRLV01qdGY3alUweHlDVURo?=
 =?utf-8?B?YUVGRCt1cHUyVlJDbDZWWGl5UmlxeGN1aXFJQkRuOFFMM3RaR052V21EM1RY?=
 =?utf-8?B?TmVNS3A1T0tmOUpOcW9Nekd5aXdENlNkdUY4enNtRnpqR3FBS21JZG1Nc2NQ?=
 =?utf-8?B?aVc1emd0VmFyMTA0eVZyazFGSHJQVWZMaGJQWC9lQWpNWkw1cGh5SEZqejVC?=
 =?utf-8?B?SWdIUXVtVW80WjRhT0hROHNSL25WK1BQeXJQT3ZsK3NGNDA1elBXcnNLMjdv?=
 =?utf-8?B?TDlBNFg4WDFsTERqdGhwelg1VHJGTlZVMlZTV0xJa2x6dElTMW03RWtZcW1m?=
 =?utf-8?B?ZmRxU0VFUnZFd1N0NWEwT0Radm1hUys4eUpnSDVSRWhKcFBxZWlFbUEvTm8x?=
 =?utf-8?B?bzVzb0lPREg0eCszQTUwTHdPZXRKWVB4b0xoRThodWViTlVjOXk2RDRIc3h3?=
 =?utf-8?B?SGhYM1h0SWk3VnZ2VFY3eDhmeThlRkF1UlJYbkNzbk83cENIYXZ6eTBSY2U1?=
 =?utf-8?B?Zm94RmZYUFo1QW1jYkNqREljSFlkd3ErK3pUZlA2ajY4cldNYmVRdmpQVmZz?=
 =?utf-8?B?NmN5emhKd2Z6SiszSUhBaWRicmNOcmh3UTJFN2dpdFI5NVo2WTF0UStEMkQ0?=
 =?utf-8?B?VTFHdmJhRzBEdVRGc3lyeVdsekJzSkxnd3hpdGF5R05kU2ZPbjB0ajlXK3d4?=
 =?utf-8?B?aENJUGxOakVIUFZqRk9PMVVINUVJT3JibldwV2Y3NTZxOWd5bENzYTV0cTNa?=
 =?utf-8?B?ZkluZ0dCZ2JoaGVtYXlxREZDZEd5YWYxT3IwZVNlaVVjcndSamM4V3RFS0JR?=
 =?utf-8?B?TXdXempobjUrLzRKOUxLYlNOdUxSam1ETFJ2K0ZuWlRiYjdKT0VDczl2ZkFJ?=
 =?utf-8?B?N1FoK0sweVlEQ1d1ZGR0NEFuWnpwaWlKbWJvZk90NTM1Q0VycmlFdU5jcEx2?=
 =?utf-8?B?SW1nV1IrVDlRRUVwR3liTjI1M3BhTytHMkk2SVNhOXJGVUdoTzRKU1VtM1R6?=
 =?utf-8?B?eTJZWFdzU1RaODRFNkphTW44UGFuMS9CT3BaRzBqaW5EVDk5Z0lnNG1IcURR?=
 =?utf-8?B?S0tRM3hpcGwxMXRLclFtUXMvaG1LVzhUUGp1STNuR1pBcFcrSlBueTNrbEhT?=
 =?utf-8?Q?/Y0APu4ETM5DM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef30393-1643-4979-e3bd-08d97230e052
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 18:54:10.0379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: po/11J+Bm7cik0rvxGFGFUqcjiTmUFPprVxMutZfNBXklJ9iUH6+az8lMcB4JsHp/Gg7/2LkccHtl95/7hZceA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4717
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-29 7:24 a.m., Christian König wrote:

> Am 29.06.21 um 13:18 schrieb Boris Brezillon:
>> Hi Christian,
>>
>> On Tue, 29 Jun 2021 13:03:58 +0200
>> Christian König <christian.koenig@amd.com> wrote:
>>
>>> Am 29.06.21 um 09:34 schrieb Boris Brezillon:
>>>> Mali Midgard/Bifrost GPUs have 3 hardware queues but only a global GPU
>>>> reset. This leads to extra complexity when we need to synchronize 
>>>> timeout
>>>> works with the reset work. One solution to address that is to have an
>>>> ordered workqueue at the driver level that will be used by the 
>>>> different
>>>> schedulers to queue their timeout work. Thanks to the serialization
>>>> provided by the ordered workqueue we are guaranteed that timeout
>>>> handlers are executed sequentially, and can thus easily reset the GPU
>>>> from the timeout handler without extra synchronization.
>>> Well, we had already tried this and it didn't worked the way it is 
>>> expected.
>>>
>>> The major problem is that you not only want to serialize the queue, but
>>> rather have a single reset for all queues.
>>>
>>> Otherwise you schedule multiple resets for each hardware queue. E.g. 
>>> for
>>> your 3 hardware queues you would reset the GPU 3 times if all of them
>>> time out at the same time (which is rather likely).
>>>
>>> Using a single delayed work item doesn't work either because you then
>>> only have one timeout.
>>>
>>> What could be done is to cancel all delayed work items from all stopped
>>> schedulers.
>> drm_sched_stop() does that already, and since we call drm_sched_stop()
>> on all queues in the timeout handler, we end up with only one global
>> reset happening even if several queues report a timeout at the same
>> time.
>
> Ah, nice. Yeah, in this case it should indeed work as expected.
>
> Feel free to add an Acked-by: Christian König 
> <christian.koenig@amd.com> to it.
>
> Regards,
> Christian.


Seems to me that for this to work we need to change cancel_delayed_work 
to cancel_delayed_work_sync
so not only pending TO handlers  are cancelled but also any in progress 
are waited for and to to prevent rearming.
Also move it right after kthread_park - before we start touching pending 
list.

Andrey


>
>>
>> Regards,
>>
>> Boris
>
