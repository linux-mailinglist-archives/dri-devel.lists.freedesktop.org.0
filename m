Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DF392D1C3
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 14:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1862610E781;
	Wed, 10 Jul 2024 12:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WKpldAj2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF98C10E784;
 Wed, 10 Jul 2024 12:40:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSZBeV7rJ2FcN+oeAlfUhXI3klCxDBngdiIFxmwwFyDvCIzkMNOSBWkS9Ll3hUhO4UOnS8JJ74LFbKKDg8KqPAahZrP6UDp20Mf1QON6wAz63DTaBkEcrdOVRtAphQp6yaki4pZSqqD/9zJY3O9ecS/BbGmqK+/cWGgOCdXZoVcZYtQ/8kf9n+9EnOASKgcskAAEJ/zakWqOTxAJkxND3RMmhURi5a+HqqX5YBvoJL5Y8Dzov8wsC3+hvE+rPo4YZVdtRkbDq/iz1c287rGGlo+Jnxy6pbcDLOf57QPDd0y0eu9VQTbY1lSoUXkrRYXcAeuL0JVDzIVbru2kNaC+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+tKHYOpa87rpMnKL8Ekyv5YF4kSCkXUs9ZxXK/CQx0=;
 b=MFzSfyYO2NZIF5Ww1aQpWV4bVQV4pgRh5nhXaUgihSzrftTHw8EsyoJTkiAX9/NPw5HMSsL6s4x03O7boQricloOnNpzzrcTNZUi4NCSILng4Dk/g4SDCKAcve/lt6guQddQkxL66drgyqJBfqsQqbPIS1RzuSF78QqYEljdoeFW6KxWcnXBWY/IS1UeW4KZvDEZDnucSbBnizKBsnyIiKfZN+5BPpp9AC9YcmrQvUlTkF1thKFCa+6y62mPVzXOTXL0tvEIKe6EnPStVmsGlrFw1NYtGQeg4Q/wYa4gEphpNXeBPqUytpLczlleKrCB9j4bRQuZOevNOPof///1PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+tKHYOpa87rpMnKL8Ekyv5YF4kSCkXUs9ZxXK/CQx0=;
 b=WKpldAj25Ik736R9suBChss+JlNx3e94vcWiZUjh8+ZEHlby+Ag1YV/NLegOJpK4jdKh8xrfobkyRQ1XQVR2jqWlVGxxrl36li4ywmNXiZ/GVUED2/5rITFqHAMN8Q/A+sJhqBc2MkcfxMwPB59EJgVQSQ10vzlotx68twLlopk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by BL1PR12MB5994.namprd12.prod.outlook.com (2603:10b6:208:39a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Wed, 10 Jul
 2024 12:40:11 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%3]) with mapi id 15.20.7741.027; Wed, 10 Jul 2024
 12:40:11 +0000
Message-ID: <cf3ff1b9-2934-47bd-93c7-5ea55d10c82f@amd.com>
Date: Wed, 10 Jul 2024 14:40:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: Add might_fault to drm_modeset_lock priming
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20240710093120.732208-1-daniel.vetter@ffwll.ch>
 <03f7e2ad-fd5c-4da7-a14c-34c2c158c513@amd.com>
 <CAKMK7uFvCr2qcHun06LC-ON3GBqj8=mCpPGHuAOh9BEyr60fiQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKMK7uFvCr2qcHun06LC-ON3GBqj8=mCpPGHuAOh9BEyr60fiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0220.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::15) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|BL1PR12MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: b41dac6c-d480-44f9-b034-08dca0dd7007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVBJbWlCUys1dzhqOEFIdnhjU0VudDJYaXNTWUlBeElhaXFnTzNQNXJiaUly?=
 =?utf-8?B?dXhUSUYvR3RSaThjLzBkUEZTSFpjWEgxODZTTzh3Q3lyREE3Q2JCU1JLNUEr?=
 =?utf-8?B?Sm1oYzlROU1wMUtBTXB2WEZHSVlOdklVRU55ZVVYYkZBc1krYkttTkFoNk1h?=
 =?utf-8?B?WnEzQmVQb01MdUJhZU95R29EbUNCenBLR2dySGlYcU9ONENjVndibXlYQlNi?=
 =?utf-8?B?bUFaLzhYcVZsS1lka3RSNFlwNmZHbnBHZFZrQ1g3VU0xckh2S1c2eHBOWWxB?=
 =?utf-8?B?aVdJZ0xGTUhFQ2QraWpXNDVZKy9zSzRCYzFzUTVFUGxDdlIxeTQ5azRkVHc0?=
 =?utf-8?B?WW9pREhqcHp6WUJPeUZTaFM3YzZlUThoWnk0a0huS3MwRmtMUlBTektkQlJR?=
 =?utf-8?B?T3B2bmRUS2tOMHIyNW8xTFlSbFd6RGdCWnExMlNqa2VhNkw5ZFEzZWdBNzVF?=
 =?utf-8?B?VWxQVmwxZDZDK01FSTZubkVuRWVyY2s2aVZjMlFHaThlVjkzYURZZldUSWJV?=
 =?utf-8?B?L2NKcHBvaFAvZlpZcVl3VUFjSUxNV3lyU3BxUi9JWVYrTG8vYzVPTmRFeVVQ?=
 =?utf-8?B?QjdQT241cUtFNFdwTkszRUVCdEgrN1FZSStUaFRZaDdOa0ZYSy9uV3hjTk5j?=
 =?utf-8?B?Qy84UXBncnEvSEczQlowSnhhWUR5bi93aU9jSkEwK3JhM29tVUJTdkN3eVU3?=
 =?utf-8?B?NXU4cGdzRzR0aTdqMGJBMEFHQjFhZHdoNUpRY0tvYUd1R1I2bXp6K3BLOGsv?=
 =?utf-8?B?cmtYR0tRbWVZMTRWMks0cjVjWWpCS1pEMTlBalMvenp6LzB2bHFWU3NwS2xp?=
 =?utf-8?B?eFdLVVhFTW9JK1V2Z1NPdjJ2b2ZlR2xGSUNWblR2V2V4b0lRR2xRM2lCS3Zy?=
 =?utf-8?B?WXZUMTd0WWozYkpmU0tTWFhzRWFDVGx6cldsdUxsVUY1cFhGU1kwVVEzZ21u?=
 =?utf-8?B?cU11TnJ0WmxJN2p3WUJLejVRY2YzY1hma0FDajlKa0NxN2lUVVZERFpzenUz?=
 =?utf-8?B?WlNLOVRoZ2FxckpYVllWa3Q1aEdxS0JLaElSVWJuOWZmMk4vaDNkZkowUnUz?=
 =?utf-8?B?ZDJuNy9ZNHpvSENuSjBLRG52YSt0SUE3aUxyOHpoS0w1UE9qNERUWEpIWWJ3?=
 =?utf-8?B?VXd6a2NyZkJjOFhBcko4QUVrT1hUZ0JHQzhhU205Y1U2SWdsUWxoeVNPbm9C?=
 =?utf-8?B?a21YeSt6R1VWa1hweXk3N25QTTQwWDFxRElQcGZOWUVWMThqejQwcDI3UzJh?=
 =?utf-8?B?ZG81SUowVUg2aXcxc3FIaWordnh5cU5nSGhQZ3hpQiswOHVIYk9zRFhTK1BP?=
 =?utf-8?B?cDc4bWFrOEtBME9zVENqQ0JQM011aExnbVkwaG9zbHJFbDVVVlc1aWQyNFhi?=
 =?utf-8?B?UWk3VWxzTDNSYXlReldzTWc2V1Jnb1d6NUZoZG9VOHJhWlpnekR3eG9la2N2?=
 =?utf-8?B?UjdQUFV4eFQ2eS9xRWt3USt4WkNzaFg0dUFNem9iS21ZZXZyTlJpWXlheUdp?=
 =?utf-8?B?dTR4Q2ZpZDM5Ti9aSjN2UXY1eUtxc09kbm5RYWY0WUJpZ0ZLSmk2UkR6TExY?=
 =?utf-8?B?MDlPRHpNN3RxaDlFNytNRkRxbi9xSytrRXdOajlTU1JmUFU1SjVUcDJvZ2Fi?=
 =?utf-8?B?cGpxZno4T2RXVEhQWlRNTzF6OGpBc0oxTlZnejFjcm1LdWRBZlpNVWlZVXdV?=
 =?utf-8?B?ZStUS2g1elBYeFNZVmVteHkyWGlERkhFQ1NLYWMybVAyOUNoQ3FjY3h3Tld1?=
 =?utf-8?Q?09aqy5BGNTpj6FubZ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGxHbnNwdlRVamtpYnVKR1VGa3RVcUQxZWtOaWxWYWNraUY5aU5KbEZOWTR5?=
 =?utf-8?B?TlI4bHVEYk1VOHRQTm5NTlVTVFFOMnM3R1I5a1dSNEQwOHlyemtFb2RiaU9k?=
 =?utf-8?B?RXpIMEkrMDU4NlVwWHFJcXBpVS9Ca2hKc2JrWUtHODltQ01HTW9hVm0xRVJv?=
 =?utf-8?B?TFZxNkZrRVVDK2s5aXNPcjVOa2Z5UStkRXZrRkhiaUlwNHNPaGNvYzJpcVRT?=
 =?utf-8?B?cXVnM2swZDE2V3lpNHNjYWVSZ3FoTXVaVkhPUi9rNjlZb3cwSlZZZ3NJNTlB?=
 =?utf-8?B?YUxZS2lzL1JkbnpnVSt6d3VHb01UQi8zWXVkak12TTZxNzRHZzNhUFpvVy9M?=
 =?utf-8?B?UUEwbmNzd1BzM1lYenNOb05kaUpxajBWaGFTd2Ziajl4bHhFNXgwQUMrSVVq?=
 =?utf-8?B?bnBZZFQ1MmNPcFQ1Y0RWS29KQStQOWU2Zm5jbXk2YWxaWVRSRmovNHBrM2lj?=
 =?utf-8?B?WHZzcFVxNUYrNGtFS01uc2xFdGZHNUVpcUtVTE5BMm52N3NISUovWnkvdHp3?=
 =?utf-8?B?em1KQkZGQ3RUVDh4Vzh5QlVkYmZrdFpOR3lkOFpXOGlDMHE0eDhMbVkrOFh2?=
 =?utf-8?B?QndYei9JekNVQXBVYnVuT0pkNE1lRm1MMlFHbkMvcVAwaTNZa2NqbWFhTUZO?=
 =?utf-8?B?QWN1S1FrcFZ6TWlmbENYVFBGWTREVWFpTTdrQXdpK21PcmZyaFJnYVlIQmI2?=
 =?utf-8?B?S1c3dVc0OE4zcE8zalpEcktwOURrT2VGRFhpZHBGRlhSSXB6L2pPQ1V5blFT?=
 =?utf-8?B?OWhmV210NUduL0FxRGZibkJBV2p3czhKc0dHNUxoSHo1MkxYcW8yeW5JWS9X?=
 =?utf-8?B?dGErS0ViZ3pnclQwZ2ZxUkV2eVRhUWlUT3dvYUFlVEl6WkZoRElTOTFSWXdF?=
 =?utf-8?B?RUgvWlYyMkM1dWVKd1h5ZldISGRiM1hUK0x1eGZqdk9WbVFFWmIyR2k0Qzk3?=
 =?utf-8?B?QmRvSzNVL2J2Wk5HNWhpck93N3dnZmRpT2hGaHBjVG43Qk1SNGdMTlFZMWtr?=
 =?utf-8?B?V0IvSTh6YmdRd0FqMDk0eER3YkpoRDRFQnV3MXdMOEcrMGgwZ0ZMakc5blJO?=
 =?utf-8?B?bXJteFVVeUQ1b0Zmblg5TUluWWQwTmEwTzBMdkVXQUVrUUY5RVQrTFhQUnp6?=
 =?utf-8?B?N1lWMHl3OVdZZFQxY0pEaDI3dWZRUUo0anNDdHdBTmFvV2lZRHNtbFJaQVhC?=
 =?utf-8?B?S0RNRk1kcDErd2Y5RGRWMUZkbmViVDNCR1lhTC8yN0hWRmg1elowMnJPY3Vz?=
 =?utf-8?B?R05uVzhnaU9RQlpKUFZ2NmlYdlhzVDBQa2x6RUx0cjc3OVBHdDJob00zSUxU?=
 =?utf-8?B?dms1cWpHQ3c1bFZZUEdxU1RONURtRGduTUdGd0pqUmxoemdCQnFHZEhTT05S?=
 =?utf-8?B?bnZPTGFzb21wR0hReHRqMHV5cTZSclBGZ2Y0cUVJNkd1YzlNSUl4Z2RJQjFJ?=
 =?utf-8?B?RHl3aXlWTWJGZW9jN1p0NmNHSlVaZG9DenRuSzBjZnhoR1g4dVFZdnFHRDFH?=
 =?utf-8?B?TG8veGJBTE92VUcrRWJzU2JJQ0tvV1g0NlVhMGlmNHBOZ2NnV2hTYXdNbjVi?=
 =?utf-8?B?b3Q2TmVOaXovbUg4aDlQSUsreDZEN3FOL3dFN1NSNkVNQWZ2N01xRmtYbXBD?=
 =?utf-8?B?QjBlbFdKbkwrYXptbDUrQ2lLb0Vmd3pzd2d4S0szR3hmQiszUVV1UW12enlJ?=
 =?utf-8?B?V0RYNE96MmdmMVpFWmNYOHk3ZmJtdVdhcG5Wa3lCSzhhVWZJTjZFQzZPaEh4?=
 =?utf-8?B?SDdLVmRtdkRiUzVGRnRwOThTQ0wyWXBZMGlmdnhiOVhIWmY3Wk9SOWhuelAz?=
 =?utf-8?B?aVUzWitjUVRCZjhKUGsyTm0xaHdsUWdOSDROVEVoSHJmbHVkY3JZejhLWSsw?=
 =?utf-8?B?clB2OUw4UEVhZlFpVXkrRFhhZ3I1SmllS0I2S0VWbThYQTFaQmxIMmZoUzJx?=
 =?utf-8?B?aVBER3ZvRFVNSWU4UVdxMk1JZmc1eDh4azVLTGtHbFVGRFBiTTZCSVRiZVFv?=
 =?utf-8?B?NklBQXVUc2Q5b0VDV25tTHpwZ3pTNmcxSjlEMXFuUkd0REhiOWQxbThWdlVD?=
 =?utf-8?B?WWMyZFBwQUNpbXJvd1pUNWlKNm5HZGhJREpOTEZZK2V5anFIcGN0NUQyUlZR?=
 =?utf-8?Q?ZCLQAFtLLX6Hx/5v2f+ZWMvvK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b41dac6c-d480-44f9-b034-08dca0dd7007
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 12:40:11.1548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQmWEJnFEdt4e2urs/82xb8z6ntgXI4M608HTCGhYnfIuTXiL0VUZblKRaYUvOOV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5994
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

Am 10.07.24 um 13:58 schrieb Daniel Vetter:
> On Wed, 10 Jul 2024 at 13:39, Christian König <christian.koenig@amd.com> wrote:
>> Am 10.07.24 um 11:31 schrieb Daniel Vetter:
>>> We already teach lockdep that dma_resv nests within drm_modeset_lock,
>>> but there's a lot more: All drm kms ioctl rely on being able to
>>> put/get_user while holding modeset locks, so we really need a
>>> might_fault in there too to complete the picture. Add it.
>> Mhm, lockdep should be able to deduce that when there might be faults
>> under the dma_resv lock there might also be faults under the
>> drm_modeset_lock.
> You're not allowed to take a fault under dma_resv, because drivers
> might need to take that lock to handle faults. So unfortunately in our
> combined lockdep priming, there really seems to be no chain yet that
> teaches about faults possibly happening while holding
> drm_modeset_lock.

Ah, of course! You are right, it was just the other way around.

Thanks,
Christian.

> -Sima
>
>>> Motivated by a syzbot report that blew up on bcachefs doing an
>>> unconditional console_lock way deep in the locking hierarchy, and
>>> lockdep only noticing the depency loop in a drm ioctl instead of much
>>> earlier. This annotation will make sure such issues have a much harder
>>> time escaping.
>>>
>>> References: https://lore.kernel.org/dri-devel/00000000000073db8b061cd43496@google.com/
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: linux-media@vger.kernel.org
>>> Cc: linaro-mm-sig@lists.linaro.org
>> On the other hand pointing it out explicitly doesn't hurts us at all, so
>> Reviewed-by: Christian König <christian.koenig@amd.com>.
>>
>> Regards,
>> Christian.
>>
>>> ---
>>>    drivers/gpu/drm/drm_mode_config.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
>>> index 568972258222..37d2e0a4ef4b 100644
>>> --- a/drivers/gpu/drm/drm_mode_config.c
>>> +++ b/drivers/gpu/drm/drm_mode_config.c
>>> @@ -456,6 +456,8 @@ int drmm_mode_config_init(struct drm_device *dev)
>>>                if (ret == -EDEADLK)
>>>                        ret = drm_modeset_backoff(&modeset_ctx);
>>>
>>> +             might_fault();
>>> +
>>>                ww_acquire_init(&resv_ctx, &reservation_ww_class);
>>>                ret = dma_resv_lock(&resv, &resv_ctx);
>>>                if (ret == -EDEADLK)
>

