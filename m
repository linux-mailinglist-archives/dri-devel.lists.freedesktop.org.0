Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 031BD6DE55B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 22:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A366310E0C8;
	Tue, 11 Apr 2023 20:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6095610E0C8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 20:06:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tg4kqcPMvoklDFSZGr9/Q0WeMvTfPwqKRcb3Zv6icWrnX4ueJ8IJMra6HVlB1Hd5Kq/+hGV3k60urc9pUubziwPxAcZzYY+HUwDYkXzakBO83kPHFN5N1CM/G2WFtgIcqTUe/e9pY18AM438sUYrrt6CnuuuXPpzKbTWxU2V4+SEMZGqelY6jWr1poTqPuW+UDbzTsuAIuBsotNEiD7s/mSamteqVpiDj0AeU0C9p54MXR6MCJvOZWzXS/CzpLL5/R9A1HDluLVrTZ9ONBoKxVMl5K/ucEggTMtNetma4HlWd4nXfTXxrQgWIXNCE8GIXZ10n4Xdx6Mx1HGmOmxTmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtHQNznrsuJWnMTXs/PTwzxUbUi2vuntq2HXIG5tzQo=;
 b=KP6jk6jDR0AtQS/4gG3BKRGUuRQlp0zFF/yQXtIcqUNvFbXwzemfcrndrmDDmidL2IgocMR3J4DtPtSulxMBkrAR2wSq0pmnYR3ziRGOBtTy4JzHEuhYy0cVYrWDbp9k+i7+bkZzjGvz8sHruZveu/3tEPSQsg+KCmJjRRB4+DxQPKwTvB1XNGovA4OwOWOWCF1TG5/dqtoqT4mx5nXHBtnmLGL7Z04dlofm04NnqITq7hdCrUzaVHV9QqPd0T9uoqU3S/AoVwyXHSCJixYBk+hQj62KPdODnYBEvYsb8RCrf3D33sH9v+8pXYtjzIR/DQtUZPkfzJNvdp1WhuIhwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtHQNznrsuJWnMTXs/PTwzxUbUi2vuntq2HXIG5tzQo=;
 b=wQEhazQPB7nvzwu0FgyjGwF0s+kDC7RYJed9e8Ac1x64YJ6ZhpVZBqSBBNvVaorCMvpExIlEoYp4ED8lKZUsiqyoCF9Q9H/gktcupOgClhxwTx/QjULXbmQ5hlSMAssrbp/L1GBmoh7SkDQsLzWPEbac/MVw5w8Th8bzjANTcHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 IA1PR12MB6305.namprd12.prod.outlook.com (2603:10b6:208:3e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Tue, 11 Apr
 2023 20:06:34 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%6]) with mapi id 15.20.6277.038; Tue, 11 Apr 2023
 20:06:33 +0000
Message-ID: <21c789de-e381-cccd-9093-741dcd7a2dc5@amd.com>
Date: Tue, 11 Apr 2023 16:06:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-CA
To: Danilo Krummrich <dakr@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 airlied@gmail.com, daniel@ffwll.ch, l.stach@pengutronix.de,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
References: <20230331000622.4156-1-dakr@redhat.com>
 <6ad72a7f-302f-4be1-0d53-00ff9dc37ef7@amd.com>
 <ecef210b-dc7d-e385-f9b2-927d55a6777e@amd.com>
 <32c28b47-2a3b-db1d-e927-ae44d52cae0b@redhat.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/scheduler: set entity to NULL in
 drm_sched_entity_pop_job()
In-Reply-To: <32c28b47-2a3b-db1d-e927-ae44d52cae0b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0228.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::17) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|IA1PR12MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cb6f583-604f-432b-7221-08db3ac83f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: seXpWW/bWyhf7r2/2hZ7Iyt+idGqkkSuyBwtq0lgLUh72y1cEaakxQ4CETg5pNM3BXibAuZ+S/NGqaEnxtmg4dRt2EfoLPTMMdwAw7AoLv9J+FILBlZKpnda/I1yuLjhuYt2tDDSX3evYPebFQXMwFIiWTFNLCFzv579+Z2kxzlnztC1JT4rhkJeACd/gVRGg84YY1ei1g5SNFRgP78yMXz4VyRuxWpUVAPPLJ2ndszOwVoGwDXtUqsonnzuj0mOkI/vgJU3/jG65a+XfJSfe/H82AfnS1RJ/RFe/WjEsBYKMMYNMbRZu5RBY6X9ynkwbvRaS3gp6e9WVmswGyWN76Wd+w2RSw/LnOGvyh2JFABBHJZn8qzpyPajcB1Otql+86DI7MChXMWLdlZYsVKTbWtaZKJIgPVPh4GjmxEpCU9dJr/IPynS8HNYZXdpIB5dc+SZrvjreIowMYiIobERRmcJHA+XPYlQf2EUPahlTtP2Kpl6QcUtaWkZfnBWq7A2nZuKthnheQO2KbwLdPrNd9blhv48CSnYFASqDkFn0IKcZ1zZlcavxtfZgjHEyBX8GFxO2a7VzIslW9n8+lngrxn0v2GgicpEdDpAYB72ru1ebQ2IrhaIU8lLeUZksd9xrqQdtKip3fV6AO0h1xXUrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199021)(316002)(31686004)(110136005)(6636002)(38100700002)(66556008)(66476007)(8676002)(66946007)(4326008)(31696002)(86362001)(478600001)(66574015)(2616005)(186003)(83380400001)(36756003)(41300700001)(53546011)(2906002)(6506007)(6512007)(26005)(44832011)(8936002)(5660300002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTdDeXRLWG1ZQUxKNytkdnhyQ2R5NjlxbmVKdHpXUzBWMHI5YTZOdGs1S1ZL?=
 =?utf-8?B?bDJIL2U4WnYrQkZlNklrblJGOVFDbzJaTFc3U1NCVUlHc3lHZktGcmxlT2RT?=
 =?utf-8?B?TEhqdjNJNElFY3ZGd0RieFU0SGt1bVZINit6SmlaOXBtVFMzV3Aybk9PRnpS?=
 =?utf-8?B?NVVVQzgxNnUvUitteXBDYksza2dXRFpmblhzWFdBZWFtRGw4ZUJDbEUrVi9u?=
 =?utf-8?B?MDc2b3MrZCtMbEo3eGovN2FxOVU4VHM5eFlYSUl2d1lyNkdXYnBVdWgvbElS?=
 =?utf-8?B?bmJFeVVUVlVEZ3l2allkMktwQW40eHAyb2l6aXNVaUVndEVFTzEzTndXanQ3?=
 =?utf-8?B?WXh1QmR3VGo1aEU1QWxmZktkKy9KV2RZUzZIeTV4QnRiZHhMUjEvbGRPR0RN?=
 =?utf-8?B?aE1BT3RBQW1ZdTdWb3IwYXBYWkh6dTRUbWpoRVYwbUVURDVLS3hYZnZLTzlh?=
 =?utf-8?B?ZmZEZm9qSWV1Rjc5NzViREZCeGVkZWpRMmk3OXBnbjZVd3pzYkhieVdqSUdN?=
 =?utf-8?B?WnRGVFZVSTBwVVBhaGx0bzNSYmFJSi9SM21nSVVYVVNMa0lZSE5iS210SkFI?=
 =?utf-8?B?TkFJZ3R1TTRtR00wU3cxdm94V3V5M1FvREM4Uk1GRWc1a0xRa2EzR1FFSjJv?=
 =?utf-8?B?VmpCVWFmTDUvYUFBbCtITmZ4TWxNK01VK0hranNmR1B5QkNndWs2UHc0dlcr?=
 =?utf-8?B?dXppMlVpRHV2SHhGN2NvWVhsVlZJZDZwSmZrNUZWanhZRWRwUUdTdFdYZmxS?=
 =?utf-8?B?cFcxQm5lWTU4RWFUSFZaM0FBbmZoMkxUc0o0QU45cnVNMmcwLzdGZlErbzlQ?=
 =?utf-8?B?M2JpbWlIQTRwL2VWQ2lvMkt0MEFLK1RNUWY1R0UrTzJ4QmpRQ0w3Tk5XUHA3?=
 =?utf-8?B?bE5JZjdPemxnbTN5MWJ2ZTVQQjFYUmlLNDJaN24zM0ZhQXZ0VzFwVytLMUhw?=
 =?utf-8?B?S0FzUE1hOUZmUWF1K3Q1QXZXWFBtc3pmd09CMk5FdnVXS2lJZXoyRllsMXo4?=
 =?utf-8?B?a09JNmtUaWFVdmtDcWQwVHRWMzB5d3pLQTdzUjBVYmtKVldOa3BBL3FFQ0li?=
 =?utf-8?B?VWpPVVhhVWduWVBUckY0aG5uQkNwbTk4ZlYxcUJSSjhDakZLRE92dGRTcDFH?=
 =?utf-8?B?Tk5rNXFmUVhPdi92VGJncXkveC9oMUFkSjRvUmxNQmcxQm1XMVpRY3h2Vmp0?=
 =?utf-8?B?WElVaE1qQ2NpV2Z5S3o5MW1waEZQQllXYjRQbnNYUnMzSCtaUDVrRWdKdDJS?=
 =?utf-8?B?L2MrVEVoeHhycUxmN1VYVWdwTE1UZllCSEVISjN0aU5SZGMzTFM0M1BzZXVV?=
 =?utf-8?B?Z1ZEUmZtWWdhUGROUThFMW50YjRtS3hvcUV5b3NkSTNCdkNoOWJkQU1QYlFJ?=
 =?utf-8?B?QzdzR2dJc1ErSlRNNXY4L3lCQVdWeWhOdzNwbk9lYkg4V0F6SUI2VVVqRG1E?=
 =?utf-8?B?di9mL0tpWnFXbVB2VHdoVTlXQXpYeEllQWlQUEpPeWh1QlM2YUoxcHhvaHlD?=
 =?utf-8?B?cCtqZE50UXk4OFgrNTg1cFJ6K1p2cllzQ0lBblR5bWNFUGg4UHFUOGlEU0Jx?=
 =?utf-8?B?aTFxOFhialExRW1kWFo5WFFvTUhSbzBFZTYwWWZQeXdmdWhENFpsQzFpSHhu?=
 =?utf-8?B?bjc0TU1TSDVSTFFSd3RTYzRYbmJETDlQV2FBQWxLWThLV1k5OTl2ME9yMnNY?=
 =?utf-8?B?MXV1RzUzU2hDZUFKQTA2RW1pU0xYcjNOSmt6SjVCcTlKSUVkOVZpeFgrRlNp?=
 =?utf-8?B?L3dsMTE1dWsxcUVXU1FoV0UxaXYwdk8vQ1F2Q0NReVVxTnhaalJFbEFWTWhL?=
 =?utf-8?B?aW8rc29sQWI3T1pmQnhrczdwZndEc0I4TWRrQjJOT2tIV0I3SUNLR2wySEZK?=
 =?utf-8?B?RDZHM0pEY1VzdjJjSis4eGp4aVpNRTYxUGtGeTQ2WlNuTlE1UUdwZzNuQTZz?=
 =?utf-8?B?NWl0TEozQnlmZ1dpUGdGaVpqZy9UNzIyUWVjNVhMdHpOK3R0WmZ5aHh4ajkv?=
 =?utf-8?B?OGVjbDJTVWNVQ0g1cXp5NDdEWStuMmJMdStWNkp6bVJrV2NqVnJWdUtlTmNR?=
 =?utf-8?B?R2NHSUsxL2pvSjV0YjJXTEVVb2thVmRwbHRlSnFRUXAzczFlajFMMC8wdDJu?=
 =?utf-8?Q?tv9+ksukbjlOgU3C82cfUJUFk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb6f583-604f-432b-7221-08db3ac83f48
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 20:06:33.5004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vb+MWhGFkJDv3SAbdXnv+UOM60ejVOlH+TmYAGuanD4vJi3SdIu5/9Dq1p2gLcK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6305
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-11 14:13, Danilo Krummrich wrote:
> On 4/5/23 19:39, Luben Tuikov wrote:
>> On 2023-03-31 01:59, Christian König wrote:
>>> Am 31.03.23 um 02:06 schrieb Danilo Krummrich:
>>>> It already happend a few times that patches slipped through which
>>>> implemented access to an entity through a job that was already removed
>>>> from the entities queue. Since jobs and entities might have different
>>>> lifecycles, this can potentially cause UAF bugs.
>>>>
>>>> In order to make it obvious that a jobs entity pointer shouldn't be
>>>> accessed after drm_sched_entity_pop_job() was called successfully, set
>>>> the jobs entity pointer to NULL once the job is removed from the entity
>>>> queue.
>>>>
>>>> Moreover, debugging a potential NULL pointer dereference is way easier
>>>> than potentially corrupted memory through a UAF.
>>>>
>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>
>>> In general "YES PLEASE!", but I fear that this will break amdgpus reset
>>> sequence.
>>>
>>> On the other hand when amdgpu still relies on that pointer it's clearly
>>> a bug (which I pointed out tons of times before).
>>>
>>> Luben any opinion on that? Could you drive cleaning that up as well?
>>
>> I didn't find any references to scheduling entity after the job
>> is submitted to the hardware. (I commented the same in the other
>> thread, we just need to decide which way to go.)
> 
> AFAICS from the other mail thread it seems to be consensus to not 
> ref-count entities and handle job statistics differently.
> 
> Should we go ahead and take this patch then? Maybe it also makes sense 
> to send a V2 additionally adding a comment to the drm_sched_job 
> structure mentioning that .entity must not be used after the job was 
> taken from the entities queue.

Yes, please send a v2, but instead of mentioning (or in addition to)
that the job was taken from the "entities queue", mention that
once the job is pushed to the hardware, i.e. the pending queue,
from then on, the "entity" should not be referenced anymore. IOW, we
want to mention that it is going from X to Y, as opposed to just
that it's taken from X, because the latter begs the question "Where
is it going to then?".

For the record, I think that using kref would give us the most
stability, even if we skipped "entity" and let the scheduler, or
even the controller keep a kref on submitted commands down to
the GPU. On reset, we block command submission to the GPU from
the outermost boundary, and then start peeling the layers from
the innermost boundary.

Using kref also forces us to think objectively and set explicit
(clear) dependencies from the outset--i.e. who gets freed and when
and under what circumstances.

And using kref might even expose the wrong dependencies, thus
prompting a redesign and thus a fix.
-- 
Regards,
Luben

