Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2005FC416
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 13:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA85710E3CC;
	Wed, 12 Oct 2022 11:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A7110E025;
 Wed, 12 Oct 2022 11:00:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGwrl3q3Gxs+M9TEAfyKl6OErU8an2fK6pVQ+jOWHS65S6D1b8kpgq9PzF9/lUkfdG1QPuyL8spcA7IQpAR97Wi8qC0CnM4meadBM40QJLE1sRezuVT6j5woTw/Ha1Kc/3/l0rRak840YVOHpeWr1vWZ+JDnINCGtpctkP3tFp4zlAS+T5dnhofbjJ5WxKHilOHsLRAJd9aym5ecDy8lMHmHWlFsZSjaUmwI1/8pxMBZQIV20O2lJ8PdeoM+GJHFO2jJf1J312jIT1qqNRMx1APyRtBUVQdfLZAPNO5Io7uKBMPt1IkpmHV6yk9RmJbbHQ/Okv7CL7yC2PI2oJN+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8MwD27d1QvsZ9/wgua2rM2ReOLpzLkIKcE4u7ksQpg=;
 b=LvnaxXHpsXnPdsJo+JH/lloWLgb4jXJPgdmYlmVBH6Hz3S1sfnskzDJm0clKnHFqlTdAdf2ItpBIFzWOpphXF8yD6IZ/djtJtUmoZhCNVX31rHd30SZ/DRzphtqtpMpi8iSzawxHhD2xy+N8OSK6LM9LoYXzuqGVRnfmHPIfCxcVXUfWwoR5Uf3k8IlmzvxoOQLeKMeS8oGnq/tVmfI8sFMJBM/k7dhAf5cxiYtBe4DnVfTQUYa5kQDM/r8/uZh5DNzJm08zgFipE/Srmf3e8vDGZfnKpx+uUouuqtvNM91sikw5VUXo0Ex4pVTuW6/YVXUfc3UqUkRMFya/l+J1DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8MwD27d1QvsZ9/wgua2rM2ReOLpzLkIKcE4u7ksQpg=;
 b=sACE7iDSt1bRI5fU5S2TJ8cavPIJteNJRP2wFvO1FreEVW7Tj8arnNK/OW0ve7Rmr2fThq6DsptSetT9kl3pgstcGWxLMBD9MB2JKajOsAbQvU6OBiP37YAl8AEMlkAqP/G61AkMb361qGf1h3Y8RVaaNW3l7Tr47cvViSCbdyk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Wed, 12 Oct
 2022 11:00:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5709.015; Wed, 12 Oct 2022
 11:00:56 +0000
Message-ID: <4d058402-5379-8eaa-7f71-8bdc73685e58@amd.com>
Date: Wed, 12 Oct 2022 13:00:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH] drm/syncobj: add IOCTL to register an eventfd for a
 timeline
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20221009144001.161124-1-contact@emersion.fr>
 <09e87ee7-4500-df21-1e20-641303a67b5c@amd.com>
 <YlRyF1ugXQAIFNoNIuFRmDek7S85or_YpAz26fHKaaQIYeCB3RVGSjEaYhw6nI0iH_k6vDjPYeF6ekmVeEgUWyf5V5w4aMm8Z5oVPjGQKh4=@emersion.fr>
 <240b0135-5219-b923-ac08-1ed574dcb901@amd.com>
 <WVB2bcT7aLthDz-fKpP-_--tlos1G_EAuXbA2g5qnlTcZ4BK0z595RaTDjhaC8kK6R4P6dqvYOlgBf-ef8eAV7KMSZ_-v8HAztLFv0-_lA8=@emersion.fr>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <WVB2bcT7aLthDz-fKpP-_--tlos1G_EAuXbA2g5qnlTcZ4BK0z595RaTDjhaC8kK6R4P6dqvYOlgBf-ef8eAV7KMSZ_-v8HAztLFv0-_lA8=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR05CA0003.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::29) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c059d0-5e50-4922-4c1c-08daac4109eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sjz4Ih793WNExiTxhVIhjCGsarXMExS+u90b/vg1szbhOMc58SzY5Ii+MfXfLhjYxmU2tRTdCUzoWLzE07fMc1+Vd7pcdkjhS39bQDweU7JP3SDo+d+SFOfNEUQYU2EfJyKP8fusOgkdYbw06/NO1TS22UD7Zmtp8P/g38C0HFT7lYmQE4d5t/EPnL58LlPayQaBnvILeOedeDRRBiRnfEEe1Meu6Ez29ky+QPsWKaDLq1Mt1ScqJ77qhKBIIj6wSlVDTmLvusY2PuMAU6MU0LPEb0x4T3ilQrip7u9Ye4CHzngLyU9Dpc2AdXEuMNHkmrCfbl7E4CX0OwtIAlFnxEMWTggwd7yd8l0HG4XMfb/eRPYlSWyxZL60exWfW34cBEgAgSmPWdcSn4qhFil+L1eUSR44i0kFW7MnNwJIOH3VJ60kHFAgLk4lAVeeHDdcEGEfRyNG14JJwo7h5JVgdadlzR66rZrAPKhBWq9CsbauuDxLLpVFjmjXHRM2DrTGuXY0UX0h2cYmrin7xNHF8Qiz8EA4d4qtCiLtR2epeoOiEMDMVGFBR/KY9g2k1uUkFp+iidIP3emULz1IxRQIL0qVuGv+ZiotT6+3DpxlXqjodGZGEtciQbcB5/lPuoV1sfXYdvBBq1aCTVPerO0jn0AggGKV8eEOAqgtsCsipPfTbNaOU1O7QC81vISB54L26vigxHwVgTsfhPF2aiI9thJ4l54WEwgYSskEN0jlkTeId5dgbty6SlBjn/zLXRBOantyEYNCr279QF8t3+YPeunnsJNDpPstSilbjQ4RfpY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(376002)(366004)(451199015)(31686004)(36756003)(41300700001)(2616005)(6512007)(6506007)(4326008)(6486002)(66946007)(66556008)(66476007)(8676002)(478600001)(38100700002)(86362001)(31696002)(8936002)(186003)(5660300002)(54906003)(6916009)(2906002)(316002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2lkS210aWhVTHBzbmFmTmFYbUFLcUJJZlVOWitKc2U0WWh4ZmV2S3YvSnRF?=
 =?utf-8?B?bjRwb3p4M3Vwb1NOYStPWm81LzJhck5XWVFLOFVkZTRRZ1BrWC9CWHBRaDRV?=
 =?utf-8?B?UkxEb3Q3SzhWMzBxbnVjblJDWDVJYkwyeWlMZmlqQ203Y2tSbm4rSlgzL1p1?=
 =?utf-8?B?Q0RxV1FOUWxranF1T2tQMVhnbmZxK1hodWYwajZUWUppdG5uWDNxMVdoTTJ5?=
 =?utf-8?B?MHlHeko2azdmaHVBejdoQmhzTTR2OUhDS25HWXYzNU5NMktXRFpJNXBxdjZj?=
 =?utf-8?B?OExzWmJKTlNwUlo0ekVtb2Q1RHMyK0VzNWFrQjZSVFpHbkFUdG5pbExZL3lo?=
 =?utf-8?B?dEdJK1hlL1ZYdUd3dmZkbnM1TFV5d0ZZWDAxcWZvZTB0MHc0eTNPOWR4WWhV?=
 =?utf-8?B?VlNEQ2ZwVzBiOCt5eE9QL3REdFl3ZDJXckJDVHphNlRaUGcxWUtnY1BTdzlF?=
 =?utf-8?B?bzRiVFBXcTdta3Nwc09RY24zN0xOMEY3TThtQklkci9JSnkxVTFNdEUzbzZ6?=
 =?utf-8?B?anJNMVBsUE0zL0l5cnVMb2NOM1lLUURnNkhrWGR5MHI1OE1NRXljTGdqN1U5?=
 =?utf-8?B?blJnaEJRcEFMRC9YNy95VjlmSEpPQUlFMWh3OTdUb3VjWmVUZGN0bGlkT2Ry?=
 =?utf-8?B?K2IrTzVvSGZhMEhGdnp3ZGNDQndjUzBXMjVVQ1VjTUZPUUdUTll6b1Z2WDRP?=
 =?utf-8?B?TDRXSnFCVklKbkNwZFo0QzZaTis5S1VjMXBLSUlROG03WGljaXBVWmJRQ3l6?=
 =?utf-8?B?YVZ2ZmUrb1dVUi8rd0d4NDczc0xYRDU4V2I0K1BXbU5tSFdXNUN0eVdNTmdw?=
 =?utf-8?B?enBNOU9OWC9FN284TXJ4OFEyMThIdTJRRXN0VHN0VjlkREtqd3lVZ2hsWU12?=
 =?utf-8?B?djRMcVUybkFTWlordGc0WUJrVGZmMjNEZ1I5SG1rV1FieS9vbzVpaXJFdU5z?=
 =?utf-8?B?d0pIaGd1SE1jQ250NGszdENUZFlBbFFnb3lsMUFiRGF3Ylo1dUEwYkJobDdn?=
 =?utf-8?B?WHVUOGRqeVZHdGlCN0J3anJNTDZhWkY1Qkt0emprL1BsU0djVXYvNURRSEFN?=
 =?utf-8?B?dGZJUHVvTTFjME1xZW9SSSt2OFJjVWhUNnZmOWVLR0lvSnB1cVNHK0UzZGgx?=
 =?utf-8?B?S082ZGhoQmNiOTB5aEFNQnpKZzdiNU5KNWtFdFRCeXk2SHdXNmUxRUxmUXUx?=
 =?utf-8?B?SnVlSWVEeHBGK2lURURrTkYrQVprN2x4MzBsenNGaDRia3d2bG5aZXlzYzFF?=
 =?utf-8?B?VWJDTmJXbnk1bHhVQWRoOFVVcEV4QmxUSDNCM21ZbkFsUnF6SHBOVmFPOEpU?=
 =?utf-8?B?MkFjenhOU21IeUErckVGeHpaZVp6ajJscks4aS96eGh3eUNKMjFkZTlPYXZ1?=
 =?utf-8?B?WFdyNjlMUDIvTjNpVExCeTFhc1gwa1UrdWNrRnVrNFkvQkIyazlQVGVwL2RI?=
 =?utf-8?B?YkhXVG84Vk9aMGZiL29zaHR0Q1VyQXN1OTBLbjRLQWFlRG1ud2xFeURZeG9z?=
 =?utf-8?B?djFNaHNSeFNZMTQxTHdFSnp5cVJNRnI4S3FHVS9mNVQ1OENxZ3hJMTM5WFAr?=
 =?utf-8?B?c2piK3Y4c1k1RGdqTS9RbVlUVlY5V0VZZG1vQUlSUFVmRzl4K3FlYk16NEZI?=
 =?utf-8?B?YmJkOW1HRk5wWjJHNVk4LzNjR1VLbVdzZjhxb0dkaGFuTHpTTWh6ME1rRHNz?=
 =?utf-8?B?dWtKdU1RaVdNazR4dGpXZThiRmdpanpIZC9KNGo3d1NmQnFERzlIc041dVR3?=
 =?utf-8?B?QWZObzBhUjlYMW02ZVFxNHVmTzVFUTI5bDhNREs0Vld4alVNOXVnRGpYcFZE?=
 =?utf-8?B?azdLY1BhVWJyWWpaaDdzcGlvNWNtcUJzSXVlTXdJcitkamMraUx1dWpSUWlj?=
 =?utf-8?B?UTdNaHAwSkc4Q0E5dGYwVndRZ3ZwSWRyUkgxWjkrQnpUSnRXeE1uek9URVJQ?=
 =?utf-8?B?ZkhmdnZYT1I1LzBRZm96TFlJOXdrNG5QYjM4blRuMFYycGtwOFV0UjdwQmY2?=
 =?utf-8?B?YTJUYWllU1lJcVowK2RBREtJVUgyMGRmT0RzaU1vOFJHMkJ5SmN0SWFWN2w2?=
 =?utf-8?B?M012Z083VEg5SW9UN2hJOG9vUXowSUNZaVZhRDJUbEllRDhickFMOGpJU1VY?=
 =?utf-8?B?RmFOTkFrL1IxWHFVbWhtclR1REE0dUd5aFY3QWsyWlVlYmV1alVuTjRLZU1F?=
 =?utf-8?Q?jenZFvmubCPFrCdoeneDBXYaXJNgZmt2W17zwtS7frr0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c059d0-5e50-4922-4c1c-08daac4109eb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 11:00:56.8425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51clI1UTgcKxm8A0kGIropxrFBZJfEZPHge7batNHWrC5HpL38We66o1/Ayici+m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6786
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, James Jones <jajones@nvidia.com>,
 wayland-devel@lists.freedesktop.org, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.10.22 um 12:25 schrieb Simon Ser:
> On Tuesday, October 11th, 2022 at 14:10, Christian König <christian.koenig@amd.com> wrote:
>
>> Am 10.10.22 um 11:13 schrieb Simon Ser:
>>> On Sunday, October 9th, 2022 at 20:00, Christian König <christian.koenig@amd.com> wrote:
>>>
>>>> Am 09.10.22 um 16:40 schrieb Simon Ser:
>>>>
>>>>> Introduce a new DRM_IOCTL_SYNCOBJ_TIMELINE_REGISTER_EVENTFD IOCTL
>>>>> which signals an eventfd when a timeline point completes.
>>>> I was entertaining the same though for quite a while, but I would even
>>>> go a step further and actually always base the wait before signal
>>>> functionality of the drm_syncobj and the eventfd functionality. That
>>>> would save us quite a bit of complexity I think.
>>> Hm what do you mean exactly? I'm not sure I'm following.
>> Essentially we have the syncobj_wait_entry structure which is added to
>> the list whenever somebody starts to wait for a sequence which hasn't
>> materialized yet.
>>
>> Instead of extending this maybe just completely nuke the
>> syncobj_wait_entry handling and replace it with your implementation here.
> Hm, no sure I understand how that would work. We don't have an eventfd in the
> WAIT IOCTL...
>
> We could merge the two structs and figure out which callback to invoke based
> on which fields are filled, but I figured two separate structs would be make
> for a cleaner split.

In this case feel free to go ahead with this approach.

Just make sure that you always add the eventfd structure to the right 
list. For example the list_add in drm_syncobj_add_eventfd() doesn't seem 
to be correct of hand.

Regards,
Christian.
