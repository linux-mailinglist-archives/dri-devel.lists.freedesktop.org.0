Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FE53B1D73
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 17:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBBB6E934;
	Wed, 23 Jun 2021 15:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27726E934;
 Wed, 23 Jun 2021 15:15:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uj8KNlxR7ZKsRLhsMVibdck3YCd5HWgdu/SsHlePfElJiZrw/c/I2CtN/opHPcZbdT8EYBSd/XM7VMfSbzMY3rMxS1mwfifki44bBypCvwd9uxcekXBSVi1JMpMHkiH/YWfceV/xaAyHaMzUSPicQpaFB1Mn7AFQReFdbqLSoWgL7SUafnHy5NzrMkrJHzFHQ8Ep++Q69c8Y8pWx90znfbhRj8+c7QxkkpJWwuLPmmmg3aN1YTSPuQXYoolFdiTiX+bMdsxxIYpOg/7443Z/nLxX8bQBrat9WrSdoWGMrWzNUYs2FamjF/RtWpJaJkr9V0fu7GZ0GKKnKghZhQHJsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEu2ApUPmxSyc3RDvFgZSJubHQAwxWf7qZBUvhkI4Bo=;
 b=coe32wrLdnS5pspDIu9JVN5Vxfuvq4O+cbV2jMa+uBtHjqFkYNMF4W6o2Imnc2MHagtGHiIF8fPOFNyvBYNOK3RdwOlsQG1N5tG9qvNqEN9PMjirKXPqgGZDvPfEdOwvp5yMqIb98CSuRrPlf8G/7vpxFsnW/mulJMAeVC+v+a4/F8bzwjLUOzzPugC+yapG/DU7PeLur9uuy8FMEYiy5vAWUd5awf2m71NIeWq/nFjamCIah+ChUpf0pdlZ36SJiMLm1v+IFYlBCHp3lsURXIehIhzBmNPjeZYMRANAtMMIkNPKiLC9JzMoc73qg0f3diRQVjBKl/xwjYT+g+OSMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEu2ApUPmxSyc3RDvFgZSJubHQAwxWf7qZBUvhkI4Bo=;
 b=xYzbzJuYjkLnJ6zQpvrDMxeVj0SI+lIGOAyAoKbAF2NgcfLMxVNgrHTQ8b615LPoiALxUv1Tco29+lhQpreX3ZE27sxyaUMEjf6QEgtGSjizUVDMQL4y7XUciyoYPZwzZMz+EluSVo/QmiO2+YTJWzEIEm8SJ/pRVt2JWCe0PeM=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4302.namprd12.prod.outlook.com (2603:10b6:208:1de::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 15:15:51 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 15:15:51 +0000
Subject: Re: [PATCH 15/15] RFC: drm/amdgpu: Implement a proper implicit
 fencing uapi
To: Daniel Vetter <daniel@ffwll.ch>
References: <CAKMK7uGOrro7-2+OVJse3CcuZO66kreq-XjL45Ay5vhL=2TZvQ@mail.gmail.com>
 <3bf45006-4256-763d-601b-3a25a7057820@amd.com>
 <CAP+8YyH1xyYVfEkYVudCn+=jyiWxoZgDndrcSLM0Qq=E9_GDKg@mail.gmail.com>
 <421cb10d-92a7-0780-3d38-d4cabd008c0c@amd.com>
 <CAKMK7uEjc+tZCKB8Yu3_zAjOgYLPBhnYebHOXgxpFaSunuPCfA@mail.gmail.com>
 <682d2f3b-8ba3-cccb-1385-1f74f0b06ada@amd.com>
 <CAKMK7uGNNJZBMLvqXE9GkXESf-uZDWVxA5y+J2eKX9giNPXdZw@mail.gmail.com>
 <CAP+8YyEGZFFVOaRW+AB4iTX_4qjqg-Wo9K21N2y1ScWK2Stzmg@mail.gmail.com>
 <YNNNWATIKtvzFTsb@phenom.ffwll.local>
 <5a3c9ea8-adb9-4662-55e2-19672e14b163@amd.com>
 <YNNPTV/uxBJTsk5S@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <35ba9a50-203c-524b-ede0-2a98364636b8@amd.com>
Date: Wed, 23 Jun 2021 17:15:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YNNPTV/uxBJTsk5S@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:871f:87e2:f394:e667]
X-ClientProxiedBy: AM0PR02CA0200.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::7) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:871f:87e2:f394:e667]
 (2a02:908:1252:fb60:871f:87e2:f394:e667) by
 AM0PR02CA0200.eurprd02.prod.outlook.com (2603:10a6:20b:28f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 15:15:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 243b0903-5634-4e82-b2ab-08d93659c95b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4302:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4302772BFCCF76F676EAEBF183089@MN2PR12MB4302.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sy474dKJj8uR3029PsrJRliHgG7CijoRJbKBbAWqB6dfPaC9elA8t9gU1VKV73lEIKatwJMpXrsYpXhEIo7Pu8oLvLZKpY0OuKiDLDFMU+o4BS6ga6AVzmr13UpJc2IC968yUk+qy72bnlpxGCu+BNaX6HBU7GWYtLmj3Qo/g+ouMzLF2Xz2jlsKx3m4o+9NscDon1H1ZvSjWFwTGZScNH4daVQ5fvHn6ZmUR4Py3AK9ElYtTZ/cNF1MBxJ+IGhnv38jG/8bsUkK62BsLjbCVLFoolmkK5V9oBxzZ+FDRRKhnQvSHhWokDPpyFFF6MIMV22T9aiM0Cn1qKR8iF2OKLiE0WbHecuMsPbWBC7jDueFgpgxXivbAXgBqDdQoPJztV+HTa/fsTHZQ2gpzGpnYdjbTS07zq2luJ8PFT0n7ko8Zt62Xh4fknEtNxf7E5j1w3pkG/Ut2NJzMhHzdJ/6dqr0kreitcx68Y74vIfMioT9bPEpHUD0CKWJCzdC2OzZQAK+qSqPlxHG1vH1lABnRvKpfIcIVTqELE2XXD8x9eWe84LAOeoc6xO/NVAIvR7FM4sFrgqzA7R79PeThkdkoxM/p38z6Jhv1En0wKyJSK5DgH4QHr8Uvqu8jmifVD7wn3toAhp62Xw7JJFU3KcDY50p7yPb+hDP28seLi7ZjMV7/sjHB9EgrTbpm1LBLloMpBK4vb1GdjEqhPdGMFlH08bOjL0TTU2kR0uin7GbkYNhU5KIMsVNdE/AFE0W2Gnl01JauSGCUK3B8N2TgtKytK9sHPfp08ZEhHKiK6Xizoz2bDVi+qNYyxDsF1muySdBezAhDffWoQR6XGk8mir5tDUGyYZ5c1+s7+W6K8lDaUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(8936002)(16526019)(186003)(53546011)(316002)(38100700002)(6486002)(4326008)(8676002)(54906003)(2906002)(45080400002)(66556008)(83380400001)(2616005)(6916009)(36756003)(66946007)(7416002)(966005)(31686004)(478600001)(86362001)(66476007)(31696002)(5660300002)(6666004)(66574015)(30864003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHZuQ09hNm5rNGhrcXRlUVJydTBqWGdLTUlidXhnYThUNnI2RVNTaDg0T21i?=
 =?utf-8?B?UlE4LzU3OEZ4R0RzUUNyY0xBWk5ha3dRem84YlJmQlFHbkg2Q2lNSjVkTk9m?=
 =?utf-8?B?WkJvSm9tdVl5d0FnbW16cmtqRWdFZWpxS0F2bEN1NmhlV3Z4aEhEWk9La0kr?=
 =?utf-8?B?WmM0NWpQWDE3VEwrbm5BTVhHMG12NVU1eXIrZG1jYXNTMUd5K002NHk0cTJw?=
 =?utf-8?B?SmRlYXdveldtTFVleVBselpzeXl0WWg0Y1FpakN3UVFMb0VScE1zZlJpMlMr?=
 =?utf-8?B?Si9kQVI1YnRTaUZrS0toU094QzlIT3pjQm9kcUJxQzR6Rzl2ZzdpNzltMDZD?=
 =?utf-8?B?bHlqMjdmNzVhb1Q4MFI4Q01GekIwNENEbi9yV1ZtY25EV2ZIakxWUHM5WDNP?=
 =?utf-8?B?OW1BTkxxWWd5ZDc4cXBWVDhESmN4b09PdDlhRER4bCtjd3ZaTVV5LzZGRGwz?=
 =?utf-8?B?bU5qODA4L2dkazFkc1FZZUxzaHh5Sk1XTFZjclZFZzFKQUJxRVhpREhvbHhm?=
 =?utf-8?B?OE5Qb2M3MStNNmNQQ1FicWFjZGNJRTAwamY2djVrS1NVQWgvS0prYVdSZExM?=
 =?utf-8?B?Ky9EMTZtQTY4dVpXdDNHUkhCbnpIUEUybGJOT0loZDRQcWk3OE14aFVTeGVV?=
 =?utf-8?B?cklmT1pKRElkOVRXRGRUTzBqNWNWTU5QV3NSUXErQkZRN2NvNDBzdjhnQVRr?=
 =?utf-8?B?TDZvdnFCOE5Kc0haRFVDWjhkeXpKb3E5OHprS1BHZDRWSGV5MGNjeXJhcU1F?=
 =?utf-8?B?UU0xOWhNSjV2eGRCejZmRTVxdStpNy9WYlJoTEZsME1DcGNXUExadE9OYnAw?=
 =?utf-8?B?ZXEwRzU0dFVwMzA5a1U2bWtqQ05CbzdBdCt2bVpXbE80NGRadm8zSlErZVZ1?=
 =?utf-8?B?V21JcG9mWHhBcG5WSFZnUTdZeS8wT2Z6djBpQThYSStXYjZkeU5ZTW02dDFJ?=
 =?utf-8?B?aTI2dzJkcmZaUVJ5M1d5V0JCbTVaOFJ4UnpxQ29rQU9xRGZRa2JhcmU0VTMr?=
 =?utf-8?B?c3hhYnpKVUxpZzRHek9NQVk3WU4zTi84S3c3dXRRTlh1SXNPcm0wYmpacDh6?=
 =?utf-8?B?VGRZZlVvR3NNRllJR0VZU2NSUHZUUkdHQ01sTXNkakc2L2pQZVNOeWpvMVVv?=
 =?utf-8?B?YkRmYXRYTDI0b09LN1dGaEg3eEJzRVlPKzI5VERHZE9UeW9OeVJ2VWlRWEFk?=
 =?utf-8?B?alRrRlFPcmFtT1lMZFBtVEtwZ3U1TTRFQUs1c3RJY0VMUlNQWHdtRjQ2bUJY?=
 =?utf-8?B?MVphV2NkQUVJZlkybFR1OXprVW5wZXVFODB2dXpNRU9FQjgwTmlPYTB1aWlK?=
 =?utf-8?B?cWtLOFpzU010NGtTU0tSbVJxT05TZ3NTYTcxdzJKSGZCek5JdFQ4ZFVNYndH?=
 =?utf-8?B?M21yN1BzbnFpbkNTUlZrY3psc0Z1NDB4Y2FZN2pjZUFBbG14YURkQ2dsdU1k?=
 =?utf-8?B?TG4zeDFCM2pCalM1ckJGMlkwNWRHbURWVGtNSmRNbU5NYjdLRm1Eby9tL0JF?=
 =?utf-8?B?YkZ1dkxtb2Y3NkdGVWhGVzFBNEhNY21iNldkNG1YYnVUSGhkN2dUMDNuUERy?=
 =?utf-8?B?YTJ2MWE3aERlTkN1V25Fc0o3c0VTbmNYVE42c1UrRlRHelpPam5nSHVkYmpG?=
 =?utf-8?B?aXlzWFVBazB4Z3dNWlZ1RUxMcnpNWTVQQlNydlFLS2N3ekNESklBUG9IYzIx?=
 =?utf-8?B?bzRyRXdKSGZMVEY0TXY2WEJJZ3E2RXIzY25Vb2pRQytjTDExaWNvbDQ4MnM5?=
 =?utf-8?B?OEQvVEJNNCswcjUyZXlnQUNUc1VXV0lsUFlMK1ZUSkY2dldTaXZzTmEvUWd5?=
 =?utf-8?B?UHNna1dkUWlLTk56Z0RlZW03cGU2a1VhaFo5UzR1cC9wRmRoRkdlYlhhZCs5?=
 =?utf-8?Q?BNh5yzqpOfcwu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 243b0903-5634-4e82-b2ab-08d93659c95b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 15:15:51.1303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qv3eVohJEF6+Hb3/AwSx7tRb2AmWKQvitCCQ7sJQQ77L/RMzSsRR5Fx+uu1nUc6j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Alex Deucher <alexander.deucher@amd.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.06.21 um 17:12 schrieb Daniel Vetter:
> On Wed, Jun 23, 2021 at 05:07:17PM +0200, Christian König wrote:
>> Am 23.06.21 um 17:03 schrieb Daniel Vetter:
>>> On Wed, Jun 23, 2021 at 04:58:27PM +0200, Bas Nieuwenhuizen wrote:
>>>> On Wed, Jun 23, 2021 at 4:50 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>>>> On Wed, Jun 23, 2021 at 4:02 PM Christian König
>>>>> <christian.koenig@amd.com> wrote:
>>>>>> Am 23.06.21 um 15:49 schrieb Daniel Vetter:
>>>>>>> On Wed, Jun 23, 2021 at 3:44 PM Christian König
>>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>>> Am 23.06.21 um 15:38 schrieb Bas Nieuwenhuizen:
>>>>>>>>> On Wed, Jun 23, 2021 at 2:59 PM Christian König
>>>>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>>>>> Am 23.06.21 um 14:18 schrieb Daniel Vetter:
>>>>>>>>>>> On Wed, Jun 23, 2021 at 11:45 AM Bas Nieuwenhuizen
>>>>>>>>>>> <bas@basnieuwenhuizen.nl> wrote:
>>>>>>>>>>>> On Tue, Jun 22, 2021 at 6:55 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>>>>>>>>>>>> WARNING: Absolutely untested beyond "gcc isn't dying in agony".
>>>>>>>>>>>>>
>>>>>>>>>>>>> Implicit fencing done properly needs to treat the implicit fencing
>>>>>>>>>>>>> slots like a funny kind of IPC mailbox. In other words it needs to be
>>>>>>>>>>>>> explicitly. This is the only way it will mesh well with explicit
>>>>>>>>>>>>> fencing userspace like vk, and it's also the bare minimum required to
>>>>>>>>>>>>> be able to manage anything else that wants to use the same buffer on
>>>>>>>>>>>>> multiple engines in parallel, and still be able to share it through
>>>>>>>>>>>>> implicit sync.
>>>>>>>>>>>>>
>>>>>>>>>>>>> amdgpu completely lacks such an uapi. Fix this.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Luckily the concept of ignoring implicit fences exists already, and
>>>>>>>>>>>>> takes care of all the complexities of making sure that non-optional
>>>>>>>>>>>>> fences (like bo moves) are not ignored. This support was added in
>>>>>>>>>>>>>
>>>>>>>>>>>>> commit 177ae09b5d699a5ebd1cafcee78889db968abf54
>>>>>>>>>>>>> Author: Andres Rodriguez <andresx7@gmail.com>
>>>>>>>>>>>>> Date:   Fri Sep 15 20:44:06 2017 -0400
>>>>>>>>>>>>>
>>>>>>>>>>>>>          drm/amdgpu: introduce AMDGPU_GEM_CREATE_EXPLICIT_SYNC v2
>>>>>>>>>>>>>
>>>>>>>>>>>>> Unfortuantely it's the wrong semantics, because it's a bo flag and
>>>>>>>>>>>>> disables implicit sync on an allocated buffer completely.
>>>>>>>>>>>>>
>>>>>>>>>>>>> We _do_ want implicit sync, but control it explicitly. For this we
>>>>>>>>>>>>> need a flag on the drm_file, so that a given userspace (like vulkan)
>>>>>>>>>>>>> can manage the implicit sync slots explicitly. The other side of the
>>>>>>>>>>>>> pipeline (compositor, other process or just different stage in a media
>>>>>>>>>>>>> pipeline in the same process) can then either do the same, or fully
>>>>>>>>>>>>> participate in the implicit sync as implemented by the kernel by
>>>>>>>>>>>>> default.
>>>>>>>>>>>>>
>>>>>>>>>>>>> By building on the existing flag for buffers we avoid any issues with
>>>>>>>>>>>>> opening up additional security concerns - anything this new flag here
>>>>>>>>>>>>> allows is already.
>>>>>>>>>>>>>
>>>>>>>>>>>>> All drivers which supports this concept of a userspace-specific
>>>>>>>>>>>>> opt-out of implicit sync have a flag in their CS ioctl, but in reality
>>>>>>>>>>>>> that turned out to be a bit too inflexible. See the discussion below,
>>>>>>>>>>>>> let's try to do a bit better for amdgpu.
>>>>>>>>>>>>>
>>>>>>>>>>>>> This alone only allows us to completely avoid any stalls due to
>>>>>>>>>>>>> implicit sync, it does not yet allow us to use implicit sync as a
>>>>>>>>>>>>> strange form of IPC for sync_file.
>>>>>>>>>>>>>
>>>>>>>>>>>>> For that we need two more pieces:
>>>>>>>>>>>>>
>>>>>>>>>>>>> - a way to get the current implicit sync fences out of a buffer. Could
>>>>>>>>>>>>>        be done in a driver ioctl, but everyone needs this, and generally a
>>>>>>>>>>>>>        dma-buf is involved anyway to establish the sharing. So an ioctl on
>>>>>>>>>>>>>        the dma-buf makes a ton more sense:
>>>>>>>>>>>>>
>>>>>>>>>>>>>        https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210520190007.534046-4-jason%40jlekstrand.net%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cbbfb6a2fd1ab4ab448d608d936594aae%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637600579485508943%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=EKK8SOxfcGPIcH3EFEN656G76vQnn2jGlGyMkuY4f5k%3D&amp;reserved=0
>>>>>>>>>>>>>
>>>>>>>>>>>>>        Current drivers in upstream solves this by having the opt-out flag
>>>>>>>>>>>>>        on their CS ioctl. This has the downside that very often the CS
>>>>>>>>>>>>>        which must actually stall for the implicit fence is run a while
>>>>>>>>>>>>>        after the implicit fence point was logically sampled per the api
>>>>>>>>>>>>>        spec (vk passes an explicit syncobj around for that afaiui), and so
>>>>>>>>>>>>>        results in oversync. Converting the implicit sync fences into a
>>>>>>>>>>>>>        snap-shot sync_file is actually accurate.
>>>>>>>>>>>>>
>>>>>>>>>>>>> - Simillar we need to be able to set the exclusive implicit fence.
>>>>>>>>>>>>>        Current drivers again do this with a CS ioctl flag, with again the
>>>>>>>>>>>>>        same problems that the time the CS happens additional dependencies
>>>>>>>>>>>>>        have been added. An explicit ioctl to only insert a sync_file (while
>>>>>>>>>>>>>        respecting the rules for how exclusive and shared fence slots must
>>>>>>>>>>>>>        be update in struct dma_resv) is much better. This is proposed here:
>>>>>>>>>>>>>
>>>>>>>>>>>>>        https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210520190007.534046-5-jason%40jlekstrand.net%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cbbfb6a2fd1ab4ab448d608d936594aae%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637600579485508943%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=nrsIXQYXctDMFvYuUfM2LO%2BozUfzopfs34ZpTKjNCKo%3D&amp;reserved=0
>>>>>>>>>>>>>
>>>>>>>>>>>>> These three pieces together allow userspace to fully control implicit
>>>>>>>>>>>>> fencing and remove all unecessary stall points due to them.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Well, as much as the implicit fencing model fundamentally allows:
>>>>>>>>>>>>> There is only one set of fences, you can only choose to sync against
>>>>>>>>>>>>> only writers (exclusive slot), or everyone. Hence suballocating
>>>>>>>>>>>>> multiple buffers or anything else like this is fundamentally not
>>>>>>>>>>>>> possible, and can only be fixed by a proper explicit fencing model.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Aside from that caveat this model gets implicit fencing as closely to
>>>>>>>>>>>>> explicit fencing semantics as possible:
>>>>>>>>>>>>>
>>>>>>>>>>>>> On the actual implementation I opted for a simple setparam ioctl, no
>>>>>>>>>>>>> locking (just atomic reads/writes) for simplicity. There is a nice
>>>>>>>>>>>>> flag parameter in the VM ioctl which we could use, except:
>>>>>>>>>>>>> - it's not checked, so userspace likely passes garbage
>>>>>>>>>>>>> - there's already a comment that userspace _does_ pass garbage in the
>>>>>>>>>>>>>        priority field
>>>>>>>>>>>>> So yeah unfortunately this flag parameter for setting vm flags is
>>>>>>>>>>>>> useless, and we need to hack up a new one.
>>>>>>>>>>>>>
>>>>>>>>>>>>> v2: Explain why a new SETPARAM (Jason)
>>>>>>>>>>>>>
>>>>>>>>>>>>> v3: Bas noticed I forgot to hook up the dependency-side shortcut. We
>>>>>>>>>>>>> need both, or this doesn't do much.
>>>>>>>>>>>>>
>>>>>>>>>>>>> v4: Rebase over the amdgpu patch to always set the implicit sync
>>>>>>>>>>>>> fences.
>>>>>>>>>>>> So I think there is still a case missing in this implementation.
>>>>>>>>>>>> Consider these 3 cases
>>>>>>>>>>>>
>>>>>>>>>>>> (format: a->b: b waits on a. Yes, I know arrows are hard)
>>>>>>>>>>>>
>>>>>>>>>>>> explicit->explicit: This doesn't wait now, which is good
>>>>>>>>>>>> Implicit->explicit: This doesn't wait now, which is good
>>>>>>>>>>>> explicit->implicit : This still waits as the explicit submission still
>>>>>>>>>>>> adds shared fences and most things that set an exclusive fence for
>>>>>>>>>>>> implicit sync will hence wait on it.
>>>>>>>>>>>>
>>>>>>>>>>>> This is probably good enough for what radv needs now but also sounds
>>>>>>>>>>>> like a risk wrt baking in new uapi behavior that we don't want to be
>>>>>>>>>>>> the end result.
>>>>>>>>>>>>
>>>>>>>>>>>> Within AMDGPU this is probably solvable in two ways:
>>>>>>>>>>>>
>>>>>>>>>>>> 1) Downgrade AMDGPU_SYNC_NE_OWNER to AMDGPU_SYNC_EXPLICIT for shared fences.
>>>>>>>>>>> I'm not sure that works. I think the right fix is that radeonsi also
>>>>>>>>>>> switches to this model, with maybe a per-bo CS flag to set indicate
>>>>>>>>>>> write access, to cut down on the number of ioctls that are needed
>>>>>>>>>>> otherwise on shared buffers. This per-bo flag would essentially select
>>>>>>>>>>> between SYNC_NE_OWNER and SYNC_EXPLICIT on a per-buffer basis.
>>>>>>>>>> Yeah, but I'm still not entirely sure why that approach isn't sufficient?
>>>>>>>>>>
>>>>>>>>>> Problem with the per context or per vm flag is that you then don't get
>>>>>>>>>> any implicit synchronization any more when another process starts using
>>>>>>>>>> the buffer.
>>>>>>>>> That is exactly what I want for Vulkan :)
>>>>>>>> Yeah, but as far as I know this is not something we can do.
>>>>>>>>
>>>>>>>> See we have use cases like screen capture and debug which rely on that
>>>>>>>> behavior.
>>>>>>> They will keep working, if (and only if) the vulkan side sets the
>>>>>>> winsys fences correctly. Also, everything else in vulkan aside from
>>>>>>> winsys is explicitly not synced at all, you have to import drm syncobj
>>>>>>> timeline on the gl side.
>>>>>>>
>>>>>>>> The only thing we can do is to say on a per buffer flag that a buffer
>>>>>>>> should not participate in implicit sync at all.
>>>>>>> Nah, this doesn't work. Because it's not a global decision, is a local
>>>>>>> decision for the rendered. Vulkan wants to control implicit sync
>>>>>>> explicitly, and the kernel can't force more synchronization. If a
>>>>>>> buffer is shared as a winsys buffer between vulkan client and gl using
>>>>>>> compositor, then you _have_ to use implicit sync on it. But vk needs
>>>>>>> to set the fences directly (and if the app gets it wrong, you get
>>>>>>> misrendering, but that is the specified behavour of vulkan).
>>>>>> Yeah, but that's exactly what we tried to avoid.
>>>>>>
>>>>>> Mhm, when we attach the flag to the process/VM then this would break the
>>>>>> use case of VA-API and Vulkan in the same process.
>>>>>>
>>>>>> But I think if you attach the flag to the context that should indeed
>>>>>> work fine.
>>>>> Yeah that's a question I have, whether the drm_file is shared within
>>>>> one process among everything, or whether radeonsi/libva/vk each have
>>>>> their own. If each have their own drm_file, then we should be fine,
>>>>> otherwise we need to figure out another place to put this (worst case
>>>>> as a CS extension that vk just sets on every submit).
>>>> libdrm_amdgpu dedupes it all so we mostly end up with one drm_file per
>>>> process (modulo minigbm on chromeos and modulo a master fd).
>>>>
>>>> That said the current proposal is for the context right? And on the
>>>> context this should pretty much work? So I'm not sure why this is the
>>>> part we are discussing?
>>> It's on the fpriv->vm, so on the FD. I assumed vulkan at least would want
>>> to have it's private VM for this. And on the quick I didn't see any other
>>> way to create a VM than to have an FD of your own.
>> You can't have your own FD in libdrm_amdgpu userspace. We had a pretty hard
>> design discussion about that already.
>>
>> What you could do is to load your own copy of libdrm_amdgpu, but I won't
>> recommend that.
>>
>> Just putting the flag on the context instead of the VM is much cleaner as
>> far as I can see anyway.
> Helper for the blind? If you gues expect me to move that myself ...

Add the flag to struct amdgpu_ctx, you can use amdgpu_ctx_ioctl() to set 
it. Then during CS that is available as p->ctx.

If I'm not totally mistaken that is also what Bas had in mind with his 
comment.

Christian.

> -Daniel
>
>> Christian.
>>
>>> If there's something else that means "gpu context with it's own vm" then
>>> the flag would need to be moved there, pointers appreciated (but maybe
>>> someone with hw + userspace can do that quicker).
>>> -Daniel
>>>
>>>>> Also yes this risks that a vk app which was violationing the winsys
>>>>> spec will now break, which is why I think we should do this sooner
>>>>> than later. Otherwise the list of w/a we might need to apply in vk
>>>>> userspace will become very long :-( At least since this is purely
>>>>> opt-in from userspace, we only need to have the w/a list in userspace,
>>>>> where mesa has the infrastructure for that already.
>>>>> -Daniel
>>>>>
>>>>>> Christian.
>>>>>>
>>>>>>> -Daniel
>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>>>> The current amdgpu uapi just doesn't allow any other model without an
>>>>>>>>>>> explicit opt-in. So current implicit sync userspace just has to
>>>>>>>>>>> oversync, there's not much choice.
>>>>>>>>>>>
>>>>>>>>>>>> 2) Have an EXPLICIT fence owner that is used for explicit submissions
>>>>>>>>>>>> that is ignored by AMDGPU_SYNC_NE_OWNER.
>>>>>>>>>>>>
>>>>>>>>>>>> But this doesn't solve cross-driver interactions here.
>>>>>>>>>>> Yeah cross-driver is still entirely unsolved, because
>>>>>>>>>>> amdgpu_bo_explicit_sync() on the bo didn't solve that either.
>>>>>>>>>> Hui? You have lost me. Why is that still unsolved?
>>>>>>>>> The part we're trying to solve with this patch is Vulkan should not
>>>>>>>>> participate in any implicit sync at all wrt submissions (and then
>>>>>>>>> handle the implicit sync for WSI explicitly using the fence
>>>>>>>>> import/export stuff that Jason wrote). As long we add shared fences to
>>>>>>>>> the dma_resv we participate in implicit sync (at the level of an
>>>>>>>>> implicit sync read) still, at least from the perspective of later jobs
>>>>>>>>> waiting on these fences.
>>>>>>>>>
>>>>>>>>>> Regards,
>>>>>>>>>> Christian.
>>>>>>>>>>
>>>>>>>>>>> -Daniel
>>>>>>>>>>>
>>>>>>>>>>>>> Cc: mesa-dev@lists.freedesktop.org
>>>>>>>>>>>>> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>>>>>>>>>>>>> Cc: Dave Airlie <airlied@gmail.com>
>>>>>>>>>>>>> Cc: Rob Clark <robdclark@chromium.org>
>>>>>>>>>>>>> Cc: Kristian H. Kristensen <hoegsberg@google.com>
>>>>>>>>>>>>> Cc: Michel Dänzer <michel@daenzer.net>
>>>>>>>>>>>>> Cc: Daniel Stone <daniels@collabora.com>
>>>>>>>>>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>>>>>>>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>>>>>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>>>>>>>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>>>>>>>>>> Cc: Deepak R Varma <mh12gx2825@gmail.com>
>>>>>>>>>>>>> Cc: Chen Li <chenli@uniontech.com>
>>>>>>>>>>>>> Cc: Kevin Wang <kevin1.wang@amd.com>
>>>>>>>>>>>>> Cc: Dennis Li <Dennis.Li@amd.com>
>>>>>>>>>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>>>>>>>>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>>>>>>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>>>>>>>>>> ---
>>>>>>>>>>>>>       drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  7 +++++--
>>>>>>>>>>>>>       drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 21 +++++++++++++++++++++
>>>>>>>>>>>>>       drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  6 ++++++
>>>>>>>>>>>>>       include/uapi/drm/amdgpu_drm.h           | 10 ++++++++++
>>>>>>>>>>>>>       4 files changed, 42 insertions(+), 2 deletions(-)
>>>>>>>>>>>>>
>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>>>>>>>> index 65df34c17264..c5386d13eb4a 100644
>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>>>>>>>> @@ -498,6 +498,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>>>>>>>>>>>>              struct amdgpu_bo *gds;
>>>>>>>>>>>>>              struct amdgpu_bo *gws;
>>>>>>>>>>>>>              struct amdgpu_bo *oa;
>>>>>>>>>>>>> +       bool no_implicit_sync = READ_ONCE(fpriv->vm.no_implicit_sync);
>>>>>>>>>>>>>              int r;
>>>>>>>>>>>>>
>>>>>>>>>>>>>              INIT_LIST_HEAD(&p->validated);
>>>>>>>>>>>>> @@ -577,7 +578,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>>>>>>>>>>>>
>>>>>>>>>>>>>                      e->bo_va = amdgpu_vm_bo_find(vm, bo);
>>>>>>>>>>>>>
>>>>>>>>>>>>> -               if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_sync(bo)) {
>>>>>>>>>>>>> +               if (bo->tbo.base.dma_buf &&
>>>>>>>>>>>>> +                   !(no_implicit_sync || amdgpu_bo_explicit_sync(bo))) {
>>>>>>>>>>>>>                              e->chain = dma_fence_chain_alloc();
>>>>>>>>>>>>>                              if (!e->chain) {
>>>>>>>>>>>>>                                      r = -ENOMEM;
>>>>>>>>>>>>> @@ -649,6 +651,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>>>>>>>>>>>>>       {
>>>>>>>>>>>>>              struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
>>>>>>>>>>>>>              struct amdgpu_bo_list_entry *e;
>>>>>>>>>>>>> +       bool no_implicit_sync = READ_ONCE(fpriv->vm.no_implicit_sync);
>>>>>>>>>>>>>              int r;
>>>>>>>>>>>>>
>>>>>>>>>>>>>              list_for_each_entry(e, &p->validated, tv.head) {
>>>>>>>>>>>>> @@ -656,7 +659,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>>>>>>>>>>>>>                      struct dma_resv *resv = bo->tbo.base.resv;
>>>>>>>>>>>>>                      enum amdgpu_sync_mode sync_mode;
>>>>>>>>>>>>>
>>>>>>>>>>>>> -               sync_mode = amdgpu_bo_explicit_sync(bo) ?
>>>>>>>>>>>>> +               sync_mode = no_implicit_sync || amdgpu_bo_explicit_sync(bo) ?
>>>>>>>>>>>>>                              AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
>>>>>>>>>>>>>                      r = amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode,
>>>>>>>>>>>>>                                           &fpriv->vm);
>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>>>>>>> index c080ba15ae77..f982626b5328 100644
>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>>>>>>>> @@ -1724,6 +1724,26 @@ int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
>>>>>>>>>>>>>              return 0;
>>>>>>>>>>>>>       }
>>>>>>>>>>>>>
>>>>>>>>>>>>> +int amdgpu_setparam_ioctl(struct drm_device *dev, void *data,
>>>>>>>>>>>>> +                         struct drm_file *filp)
>>>>>>>>>>>>> +{
>>>>>>>>>>>>> +       struct drm_amdgpu_setparam *setparam = data;
>>>>>>>>>>>>> +       struct amdgpu_fpriv *fpriv = filp->driver_priv;
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +       switch (setparam->param) {
>>>>>>>>>>>>> +       case AMDGPU_SETPARAM_NO_IMPLICIT_SYNC:
>>>>>>>>>>>>> +               if (setparam->value)
>>>>>>>>>>>>> +                       WRITE_ONCE(fpriv->vm.no_implicit_sync, true);
>>>>>>>>>>>>> +               else
>>>>>>>>>>>>> +                       WRITE_ONCE(fpriv->vm.no_implicit_sync, false);
>>>>>>>>>>>>> +               break;
>>>>>>>>>>>>> +       default:
>>>>>>>>>>>>> +               return -EINVAL;
>>>>>>>>>>>>> +       }
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +       return 0;
>>>>>>>>>>>>> +}
>>>>>>>>>>>>> +
>>>>>>>>>>>>>       const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
>>>>>>>>>>>>>              DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>>>>>>>>>              DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>>>>>>>>> @@ -1742,6 +1762,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
>>>>>>>>>>>>>              DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA, amdgpu_gem_va_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>>>>>>>>>              DRM_IOCTL_DEF_DRV(AMDGPU_GEM_OP, amdgpu_gem_op_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>>>>>>>>>              DRM_IOCTL_DEF_DRV(AMDGPU_GEM_USERPTR, amdgpu_gem_userptr_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>>>>>>>>> +       DRM_IOCTL_DEF_DRV(AMDGPU_SETPARAM, amdgpu_setparam_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>>>>>>>>>       };
>>>>>>>>>>>>>
>>>>>>>>>>>>>       static const struct drm_driver amdgpu_kms_driver = {
>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>>>>> index ddb85a85cbba..0e8c440c6303 100644
>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>>>>> @@ -321,6 +321,12 @@ struct amdgpu_vm {
>>>>>>>>>>>>>              bool                    bulk_moveable;
>>>>>>>>>>>>>              /* Flag to indicate if VM is used for compute */
>>>>>>>>>>>>>              bool                    is_compute_context;
>>>>>>>>>>>>> +       /*
>>>>>>>>>>>>> +        * Flag to indicate whether implicit sync should always be skipped on
>>>>>>>>>>>>> +        * this context. We do not care about races at all, userspace is allowed
>>>>>>>>>>>>> +        * to shoot itself with implicit sync to its fullest liking.
>>>>>>>>>>>>> +        */
>>>>>>>>>>>>> +       bool no_implicit_sync;
>>>>>>>>>>>>>       };
>>>>>>>>>>>>>
>>>>>>>>>>>>>       struct amdgpu_vm_manager {
>>>>>>>>>>>>> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
>>>>>>>>>>>>> index 0cbd1540aeac..9eae245c14d6 100644
>>>>>>>>>>>>> --- a/include/uapi/drm/amdgpu_drm.h
>>>>>>>>>>>>> +++ b/include/uapi/drm/amdgpu_drm.h
>>>>>>>>>>>>> @@ -54,6 +54,7 @@ extern "C" {
>>>>>>>>>>>>>       #define DRM_AMDGPU_VM                  0x13
>>>>>>>>>>>>>       #define DRM_AMDGPU_FENCE_TO_HANDLE     0x14
>>>>>>>>>>>>>       #define DRM_AMDGPU_SCHED               0x15
>>>>>>>>>>>>> +#define DRM_AMDGPU_SETPARAM            0x16
>>>>>>>>>>>>>
>>>>>>>>>>>>>       #define DRM_IOCTL_AMDGPU_GEM_CREATE    DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
>>>>>>>>>>>>>       #define DRM_IOCTL_AMDGPU_GEM_MMAP      DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
>>>>>>>>>>>>> @@ -71,6 +72,7 @@ extern "C" {
>>>>>>>>>>>>>       #define DRM_IOCTL_AMDGPU_VM            DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_VM, union drm_amdgpu_vm)
>>>>>>>>>>>>>       #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
>>>>>>>>>>>>>       #define DRM_IOCTL_AMDGPU_SCHED         DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SCHED, union drm_amdgpu_sched)
>>>>>>>>>>>>> +#define DRM_IOCTL_AMDGPU_SETPARAM      DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SETPARAM, struct drm_amdgpu_setparam)
>>>>>>>>>>>>>
>>>>>>>>>>>>>       /**
>>>>>>>>>>>>>        * DOC: memory domains
>>>>>>>>>>>>> @@ -306,6 +308,14 @@ union drm_amdgpu_sched {
>>>>>>>>>>>>>              struct drm_amdgpu_sched_in in;
>>>>>>>>>>>>>       };
>>>>>>>>>>>>>
>>>>>>>>>>>>> +#define AMDGPU_SETPARAM_NO_IMPLICIT_SYNC       1
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +struct drm_amdgpu_setparam {
>>>>>>>>>>>>> +       /* AMDGPU_SETPARAM_* */
>>>>>>>>>>>>> +       __u32   param;
>>>>>>>>>>>>> +       __u32   value;
>>>>>>>>>>>>> +};
>>>>>>>>>>>>> +
>>>>>>>>>>>>>       /*
>>>>>>>>>>>>>        * This is not a reliable API and you should expect it to fail for any
>>>>>>>>>>>>>        * number of reasons and have fallback path that do not use userptr to
>>>>>>>>>>>>> --
>>>>>>>>>>>>> 2.32.0.rc2
>>>>>>>>>>>>>
>>>>> --
>>>>> Daniel Vetter
>>>>> Software Engineer, Intel Corporation
>>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cbbfb6a2fd1ab4ab448d608d936594aae%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637600579485508943%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=o%2BceWYx09dRBKYizcr2Hg8usS4Nl8%2Bz%2F4YM4hgWPYpE%3D&amp;reserved=0

