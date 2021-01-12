Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C557D2F2F21
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 13:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF85189FAC;
	Tue, 12 Jan 2021 12:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E00C89FAC;
 Tue, 12 Jan 2021 12:32:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuNFqLUnJjL/z596s2qrTaAEcCkmjKbPZaIoLrFCoBucTjwgybaumJF/ecwapeYRAB0Mq7U+v1Au5zsg4zlDTr2EPqdvR/cTW1RuWQpNRlOug859Bb4JA6vG04H2elOBYq4HCuRo7+gV3VKMt8fwG6pz+Y/mu7ts26HZ9W8ZUk4SPpfJE33DjznfuMKpfweOzlSWisjhGs+eyJV3G3rUDbN9X3gFJ85oeg0Rn8TebpHm9gc8B6p6rRPkW3brv63cfFh0mPE5gNGEptmvjfqX9WlXcytsW/C8hhpTN3dpcDDfR5d5jqbtaWsq2Okfm9d742e1r+vf6IKya45sZ5Eceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rihv2JY+UInS82FNEsv+x/nM3kwwrA/AQto0dUX5gP8=;
 b=IJIMwu/0+D9gDQgQpmxCit3HR3pINvuQSKxXtepCExEu72bMYA/Ww1hI1BMwKJ46TxOf+2vfaOnXvn3HBQnNNGCRNrRgmuvTSsKUjjvrlwdksmAg2fblc7Ogzq/3oVV+NEbT4OaHoNsGaR78GUW5CVeW4g/ZQmQXpWAp7WjnHGFvO1EpoK9hiudNsqEArvfPUmRc3aDkvRf/sTmjIfdKLWD2UHIsnJMwEHynEebhcm29U3pZRI1OBBBMNfn57EokENFZZBhD/CeRooryH/OkimqXkyiOGotHY4G72lJbNEVu/bbDhlXXcxQ++WPWTwVzs8coVURU0i8FKjc1LrryaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rihv2JY+UInS82FNEsv+x/nM3kwwrA/AQto0dUX5gP8=;
 b=ij9xwx/NbKMA05ndOQJwG21Hz77ivdyZ6WV6Qyq8iER0mf9ZcD45chk3XV/HJKG1RXdcSpfSQBtfX//Uqr33gXyUPH7x0XXxp84FByd1p5f0oTWR3jzp/ypAqz2xoiR0/dZlW8BKqUoy7zIBXWdV0HQsmGt+DeI7RoUY2Ux+jtk=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4360.namprd12.prod.outlook.com (2603:10b6:208:266::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 12 Jan
 2021 12:32:11 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 12:32:11 +0000
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
To: Daniel Vetter <daniel@ffwll.ch>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
References: <X/c3PKL70HXBt3Jk@phenom.ffwll.local>
 <589ece1f-2718-87ab-ec07-4044c3df1c58@amd.com>
 <a140ca34-9cfc-9c2f-39e2-1af156faabfe@amd.com>
 <b73319b2-1723-6650-8d03-d8f775119e53@amd.com>
 <29ef0c97-ac1b-a8e6-ee57-16727ff1803e@amd.com>
 <62645d03-704f-571e-bfe6-7d992b010a08@amd.com>
 <SN6PR12MB46235A1D04FDF4BBD9E60F94EAAE0@SN6PR12MB4623.namprd12.prod.outlook.com>
 <X/x5RD0xQxWUYvQ3@phenom.ffwll.local> <X/x5nXM7bZDl+MWR@phenom.ffwll.local>
 <db1e456d-8493-c94e-942e-ed19a2e1b931@amd.com>
 <X/1niT8MNvcEwDFS@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a0435d29-dabb-89ad-cdd0-1b5f1e32b7c9@amd.com>
Date: Tue, 12 Jan 2021 13:32:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <X/1niT8MNvcEwDFS@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4P190CA0021.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4P190CA0021.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Tue, 12 Jan 2021 12:32:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f84741d0-7e9b-4d76-ced5-08d8b6f615cb
X-MS-TrafficTypeDiagnostic: MN2PR12MB4360:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43607F7CA35BD22E32F69CF783AA0@MN2PR12MB4360.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HrMUlbHH9PmLLyCrdGO/CRwiWwjXns8Ji/QStCt2X/jJn8/ewjKJNeOzWWojNShoAb4V53uyjskLCDWz5D87Yq5PWUyuHF03JyAoVBCIkMZR7p7IUt3u1NW7omPYLpJxgNEDrbgKTJpASt7L+fouA5JRbiQMqYemUahriAMo+sc7qnapXQxwX8NtcjI7CqOh1SSxZs79zBX+U4qRi9D57JqdST99uylyYdOESbrXi6hqyxi7m02w/WbiFCr+jTv+79S1F1VSpRU2sLICWCn9Aa+J71rARqKScI9VOJ6ZSIdtqDsqEXlIGWOtvjK49A+tS0XuLpeGIiLXly/JDSxRvufngMhA1r23eG1ZN3bJ/FhW2YZxigACdKL0f4JqkXEOqhgP9OVJ91CPNbCYQG1ZCfjPi48L3r7vyPA6MxU1m1BYCzVe8Hw3zN0GeCELyWWqER/+a0dfFgX8Ta23lXzqff9aHQ2qFfMlbt9D7ls8k7Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(6486002)(8936002)(31696002)(6666004)(2906002)(4326008)(66556008)(66946007)(86362001)(5660300002)(66476007)(478600001)(2616005)(31686004)(8676002)(6636002)(16526019)(186003)(110136005)(36756003)(7416002)(53546011)(52116002)(54906003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R2VtbCtnNjR4RmtSZjVHTDNCNlBoVnhLMldmQ29wOUZTVEQzMlB1WlVtSmxH?=
 =?utf-8?B?NnVlclR6MlVXTEt5VkNiNG5FZlcydXBoQ0FxMk5obHI2a1NydGJIdmh0NTZt?=
 =?utf-8?B?OExUWFBUZGNpeXBKc1dFcXFpTVBMS3BSLzhEYmlSSDVkQStzcVNndGg5Zzg1?=
 =?utf-8?B?a0RsVVM4U2VRSXBmQXBBMXdjZjUwSE1NaTFGVVdVK0FLekdBWEgvZlJzMkhV?=
 =?utf-8?B?U3I0cVYxekRYNXA3ZnJiYU95MzYrR3d6THBRbE1UN2VvV1BtVVpXRTI4R0di?=
 =?utf-8?B?dWl2dGVSREpBN3RkNWNnb3g3eHpQaDhGaWRUUDJaSmVPd3BreWxzdnpSQ0xp?=
 =?utf-8?B?UHhuS29JQkRFMmJQWjFweFNYZXpBYnBpV2c4blhJSGtQaUF1WG0wenB2dXpu?=
 =?utf-8?B?SVBlZjdqckRMb3o1QmlnSHVLNW9HUWZmc3d6QXhwLzdQQ25oazExeXQ4WU5k?=
 =?utf-8?B?RU0ySkcrbEM0NVlxUnVwNld4VytMUXlGamEwNEErcU5VNmlNYWcvdit2VTZX?=
 =?utf-8?B?SU1xVjVFaW9BZEU1R0RtRzZoSW5VcUkxOEt5a2FYRjBiZTFFZjJYMEdOYW5L?=
 =?utf-8?B?ZkY3NUExbXlIWDB4SjI3TWdkU0VtbS9maUFFcTl5U0xJeUhRcFB5ZDE3aGV4?=
 =?utf-8?B?VzFGSTk5WDQ4VjRNRStiSjJmMHI0UytvOU01bVNpNmxLWWQvbU1FdGVWd2dr?=
 =?utf-8?B?UjhvaFZYTzd6UGZML1g1MUxieFY4TlpYSGkwenhvbWRNYmJWRGxTVDlyOUpo?=
 =?utf-8?B?RmZUQ3NBQ3ZpVVFJWUluTVl0SWpHdXkwYSsyNWI5amIvWllJci9YSkl3UlU3?=
 =?utf-8?B?emFYaVc2K28yVzhReVFWU292VllVSmp0bm1JbVZFNU9ZdmhpWHVYdEFTWXd2?=
 =?utf-8?B?bC9TdkpCeWdVMmhtT1VUNHIxWFVoY1RmTU84WTk3U2psOWUyNnlwRnVNSVZu?=
 =?utf-8?B?bE80eEdPNW1GU2JISzhGQ0tuNDJHbXl6Q0tQVzI3cnpMaHN4azdVSmNzQWdX?=
 =?utf-8?B?U3cvNkwzTWZ5VE0xZU41YW41NENzaTNUUUdHV1lkN3JwVndLSVNKb2dDVG82?=
 =?utf-8?B?MkJPdkZpZlAzTDdKZ21nT2pGZ1RuSHZ3aUJOTnFXUTBlaVFWQUF1TWx0b3BB?=
 =?utf-8?B?ZjJic1FSc2R6dWVkZGJ5WXROeXFGcWc2UkIxRkZMR2txdlRhdFdoYk8wQnpq?=
 =?utf-8?B?M3IzeGNGSExaY282VTJoTEFEeGt4UHF2Rzh6bWlVK3djaUpYRzVJcFJqa1V0?=
 =?utf-8?B?WlBZMjA0eTlzZ1NtdmcxbEo0alRIMm4zTDQwbElIUEtidHVnWGxBRWREYTdQ?=
 =?utf-8?B?NzVwUUhMM25uS0JNcWRuUURuT1JWKzVQbUdoTDV6aHc3ekJYRThNMEtzWVho?=
 =?utf-8?B?WnNvd2k4SjNpNWdEby90RlozRHR2aHQ0NEpMVUtoMWdqYlJ6cXlhN2s4MTdG?=
 =?utf-8?Q?8QqoEr5b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 12:32:11.5914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: f84741d0-7e9b-4d76-ced5-08d8b6f615cb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YjAGzSzYwOD2ScdaGIqocFkrIWbfU5FaeSzaKVypoqrREggPjYlKw56pFGcwCfr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4360
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "yuq825@gmail.com" <yuq825@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.01.21 um 10:10 schrieb Daniel Vetter:
> On Mon, Jan 11, 2021 at 03:45:10PM -0500, Andrey Grodzovsky wrote:
>> On 1/11/21 11:15 AM, Daniel Vetter wrote:
>>> On Mon, Jan 11, 2021 at 05:13:56PM +0100, Daniel Vetter wrote:
>>>> On Fri, Jan 08, 2021 at 04:49:55PM +0000, Grodzovsky, Andrey wrote:
>>>>> Ok then, I guess I will proceed with the dummy pages list implementation then.
>>>>>
>>>>> Andrey
>>>>>
>>>>> ________________________________
>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>> Sent: 08 January 2021 09:52
>>>>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Daniel Vetter <daniel@ffwll.ch>
>>>>> Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; daniel.vetter@ffwll.ch <daniel.vetter@ffwll.ch>; robh@kernel.org <robh@kernel.org>; l.stach@pengutronix.de <l.stach@pengutronix.de>; yuq825@gmail.com <yuq825@gmail.com>; eric@anholt.net <eric@anholt.net>; Deucher, Alexander <Alexander.Deucher@amd.com>; gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>; ppaalanen@gmail.com <ppaalanen@gmail.com>; Wentland, Harry <Harry.Wentland@amd.com>
>>>>> Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
>>>>>
>>>>> Mhm, I'm not aware of any let over pointer between TTM and GEM and we
>>>>> worked quite hard on reducing the size of the amdgpu_bo, so another
>>>>> extra pointer just for that corner case would suck quite a bit.
>>>> We have a ton of other pointers in struct amdgpu_bo (or any of it's lower
>>>> things) which are fairly single-use, so I'm really not much seeing the
>>>> point in making this a special case. It also means the lifetime management
>>>> becomes a bit iffy, since we can't throw away the dummy page then the last
>>>> reference to the bo is released (since we don't track it there), but only
>>>> when the last pointer to the device is released. Potentially this means a
>>>> pile of dangling pages hanging around for too long.
>>> Also if you really, really, really want to have this list, please don't
>>> reinvent it since we have it already. drmm_ is exactly meant for resources
>>> that should be freed when the final drm_device reference disappears.
>>> -Daniel
>>
>> I maybe was eager to early, see i need to explicitly allocate the dummy page
>> using page_alloc so
>> i cannot use drmm_kmalloc for this, so once again like with the list i need
>> to wrap it with a container struct
>> which i can then allocate using drmm_kmalloc and inside there will be page
>> pointer. But then
>> on release it needs to free the page and so i supposedly need to use drmm_add_action
>> to free the page before the container struct is released but drmm_kmalloc
>> doesn't allow to set
>> release action on struct allocation. So I created a new
>> drmm_kmalloc_with_action API function
>> but then you also need to supply the optional data pointer for the release
>> action (the struct page in this case)
>> and so this all becomes a bit overcomplicated (but doable). Is this extra
>> API worth adding ? Maybe it can
>> be useful in general.
> drm_add_action_or_reset (for better control flow) has both a void * data
> and a cleanup function (and it internally allocates the tracking structure
> for that for you). So should work as-is? Allocating a tracking structure
> for our tracking structure for a page would definitely be a bit too much.
>
> Essentiall drmm_add_action is your kcalloc_with_action function you want,
> as long as all you need is a single void * pointer (we could do the
> kzalloc_with_action though, there's enough space, just no need yet for any
> of the current users).

Yeah, but my thinking was that we should use the page LRU for this and 
not another container structure.

Christian.

> -Daniel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
