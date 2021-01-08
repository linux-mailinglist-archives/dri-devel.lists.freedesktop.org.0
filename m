Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57D32EF601
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 17:50:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453248999E;
	Fri,  8 Jan 2021 16:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F57F89804;
 Fri,  8 Jan 2021 16:49:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRuBzLxr4vH1nqSjBiAlyo+pVnm4RDtdavasUXMWPOPH1dLVM6TknLG35Qo9GrPoyJkZrG3iHKxkAuP2iycVWdkqO6Em6sbwN5BDROnCFl8nZ5DQcazAmYxv5PMSzSAdF9m95IzXe8wgtVb74putPrl3u+vCQDK9EaD4Dj3axk/QoHzqSSXJIvYUg83vj4Kgd5AwpqbnVgRanHdVmzbRZvkWuangTRQ0hQlgZbyV1a0GzH5gkpaiehQPSZM27KDoF88wkBM+ZVCIXBms6GHLEAGjP18NXwVmdj+jpsx+bwDNZyrOO5eRPS8xBPwgqg7TtZ6fpwFzbEmLKt2pldLdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMqCXUkaekO8jOZbuiq5kr5zx8B8FwJOsdrCmyzG13w=;
 b=XNtPUW1JtDWlXvITCoUEbEsIUhEMDDGJlKyEVzyCS9OEAZ/b81/BTeHxQjSLXGP8oGlf8RiReHYPoO9HMFr007frmKoG/IwJecqjNb8ey7Z2j8rj4KBY2B/ZumPyOjFFySeyWxgbGkeh7Gd+fg+enqpOHuCZ1c8VyGkg3zXfW9sMcrOhzBeOYB8UZW9bmwnFdJ5EdfDwIaJvoXPNu+oCVAXaYC1o9vardBLRsIdpvN36BaIfBplGAZIBYaeDs91wXtrSunPBlbdIcT7HNcw6gkZpFttTcV3n+D2JELk1w7+rMcQEh8CdZ8k+2wHvH83UXHjVO38OeTUBtzuoVwdVVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMqCXUkaekO8jOZbuiq5kr5zx8B8FwJOsdrCmyzG13w=;
 b=hU5r2NnNNZdpHnoZqJSHQqLAwdN/+ngb8IZNeCe627zyZeWx/9Dy9wK0+6vOV/D+dZrdwXQrMHHDGACvDQV81kC/DaJH4kcZOEzW0EHfSuiCJ22q+u54Pvv9ZhsSQg5vXj8ON8nI2/teuzeGviSLbI1+NviTOjqbEsXJYVCDNgU=
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2702.namprd12.prod.outlook.com (2603:10b6:805:6c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:49:56 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::6d32:940b:f630:b37d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::6d32:940b:f630:b37d%4]) with mapi id 15.20.3721.024; Fri, 8 Jan 2021
 16:49:56 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
Thread-Topic: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
Thread-Index: AQHWv8Yt2gqu0LJfYUyqJqszn9UdAKocot6AgAABZQCAAAEeAIAAAfAAgAFtnACAAAIDAIAAA5yAgAABtoCAACAtMg==
Date: Fri, 8 Jan 2021 16:49:55 +0000
Message-ID: <SN6PR12MB46235A1D04FDF4BBD9E60F94EAAE0@SN6PR12MB4623.namprd12.prod.outlook.com>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-2-git-send-email-andrey.grodzovsky@amd.com>
 <a510b5c7-1898-f101-1cfd-a037e8fa445d@gmail.com>
 <e6bbd5fa-29b7-c74a-ea70-3979b573901b@amd.com>
 <5a61f76a-0b40-941f-8028-37202f296e74@gmail.com>
 <f374aaa4-4a30-e60c-cd4b-d463443c1137@amd.com>
 <X/c1IXX11chjHyl4@phenom.ffwll.local>
 <75c8a6f3-1e71-3242-6576-c0e661d6a62f@amd.com>
 <X/c3PKL70HXBt3Jk@phenom.ffwll.local>
 <589ece1f-2718-87ab-ec07-4044c3df1c58@amd.com>
 <a140ca34-9cfc-9c2f-39e2-1af156faabfe@amd.com>
 <b73319b2-1723-6650-8d03-d8f775119e53@amd.com>
 <29ef0c97-ac1b-a8e6-ee57-16727ff1803e@amd.com>,
 <62645d03-704f-571e-bfe6-7d992b010a08@amd.com>
In-Reply-To: <62645d03-704f-571e-bfe6-7d992b010a08@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [99.228.232.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 87847b38-4d5e-4e28-723b-08d8b3f56dae
x-ms-traffictypediagnostic: SN6PR12MB2702:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB2702064D762A7E1C3921FCCCEAAE0@SN6PR12MB2702.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:580;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y4jhfvem/WxOtKH8UjvkxZkVEZv34wL9pmVBpwPRct8pDyprkRWshoPx2pZU36vzRH/LvfDOq5gap9DxhFxoj3swG9dHPgsCdaAuDurCb84gpAVqbEn3FUwq/kPfwAqByIlNz3e47e0cPtheRLeYVnRHjrMNgwNu6frId/QCDbWaD1QBmzWSjUzjCotHhi1QGzLFlPZE11B1PV3b2JfJN6344+ljrIzjRr3nMaoPYx/zmSCKcErOg5V+rmA+uXURn+01BVEk7BrU3iT68QrNLHdAJUsYD+jjyr9kmfRS7BbAleP8WhmzbhGJTriit5ubK1JSwB6NHexQ5ZgGqVoYR1opENheq43PbvkjyYP1dg7WAFc+Q9TMWAe+TxrIRURmhJAzjhD0TmZzrugzV7+tYA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(64756008)(66556008)(66446008)(9686003)(91956017)(8676002)(54906003)(55016002)(71200400001)(52536014)(8936002)(7696005)(2906002)(4326008)(66476007)(110136005)(86362001)(66946007)(6506007)(33656002)(83380400001)(53546011)(478600001)(5660300002)(66574015)(26005)(316002)(76116006)(7416002)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?QpLctO/29EdewbS/Xi2AKkO6XoekbP7W7x/YDER3SQ2NA7SaOMvxqRuJxd?=
 =?iso-8859-1?Q?csh/i7rVileov8D2lIrlMHq0EmFCLOMRDe+2WhJwjzsYXbKc1A7Y0XOfjZ?=
 =?iso-8859-1?Q?YRRyzJ9/hHjaoeYM6gfo9nhuEbkrUrOfilkGdb8idJ6+9Bz90RedHghjgZ?=
 =?iso-8859-1?Q?02EsZHS8gJ2oTLTiWe/EGS4dc5aXqJA4CWE5dRP7EgIlP/Rcv3dn+sEvEV?=
 =?iso-8859-1?Q?lvW28KxajUOv0F1IKXriwWvRquvNzH41y7cLoVSvQEdkJR5SZMBdMBTZqj?=
 =?iso-8859-1?Q?2pyl0A8GfBNazp/l06octDbB7og7D9KdIURxzIk69DIykzpjoxWYu7QVTd?=
 =?iso-8859-1?Q?CeuhxrW7+wWC/1kCkT7f3tZnVTUsLNWLZEpuEtfQV6vyP6bApRHjuxXGzc?=
 =?iso-8859-1?Q?I0VnDeipW3YjoNL8bVOsH2IiqLnv1aF9lTTWKog5VfmHZBdO1gEe8Zrjj6?=
 =?iso-8859-1?Q?BFvneJDoNOFnGb3tmMov76/cdLFJs1C6XYAjsRm+79ZYPbUS1yaJZkuVLZ?=
 =?iso-8859-1?Q?IZVVs8NRrLQpRejPh0CK/8nmVZ+PH/AsEmrqfYCdRDs5nQyB8SfS2/OP9w?=
 =?iso-8859-1?Q?KvyjRiDwSzWcsx76qWaAanok6UkPCORW29f56cuUwDqyjAaoxmxknSyOPT?=
 =?iso-8859-1?Q?EVIeLDTbNLkByQHK3q+//uKyA6788t0gy89G4lfjfDM7hhq7hvlo9y6Mho?=
 =?iso-8859-1?Q?bluGIrQSMjcDQlnFgCFwJTdnZH2KhXAgYuvrRMpxD4p55E86eWx2sCVPCx?=
 =?iso-8859-1?Q?4DYoBpcqV0kQy+/QMjpbkIh3QGTWnqNUTYvR2fMvUVNJBA3U+ct1uj0pr8?=
 =?iso-8859-1?Q?NhqQh1+DiUzqaKAsJuAYrgi6RRC5czBGmYWWFlDDgvZgYFEqCsk3vcrQA7?=
 =?iso-8859-1?Q?jvqvHgwrmf0fq5FlfLCrXaBkLatJCGr015K3MNOEnsGT1vW8XFbskQQlFM?=
 =?iso-8859-1?Q?fcan90566TEcra5/rv6kc35FAm5TomWdsZkNmy1tI0PAY/wy8cx6D7N7N6?=
 =?iso-8859-1?Q?WUnx7nd6Y3dlpCUYI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87847b38-4d5e-4e28-723b-08d8b3f56dae
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2021 16:49:56.0044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gtHzkOW2lMS/UInFhNmvUqqQ4ntH40r1UC3qjr6zW7LRYAfZLwr70lBTBxWwMxZ8dvudnxHGxURFZrG99bvr7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2702
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "yuq825@gmail.com" <yuq825@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============0149771844=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0149771844==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_SN6PR12MB46235A1D04FDF4BBD9E60F94EAAE0SN6PR12MB4623namp_"

--_000_SN6PR12MB46235A1D04FDF4BBD9E60F94EAAE0SN6PR12MB4623namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ok then, I guess I will proceed with the dummy pages list implementation th=
en.

Andrey

________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: 08 January 2021 09:52
To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Daniel Vetter <daniel@f=
fwll.ch>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-deve=
l@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; daniel.vetter@ff=
wll.ch <daniel.vetter@ffwll.ch>; robh@kernel.org <robh@kernel.org>; l.stach=
@pengutronix.de <l.stach@pengutronix.de>; yuq825@gmail.com <yuq825@gmail.co=
m>; eric@anholt.net <eric@anholt.net>; Deucher, Alexander <Alexander.Deuche=
r@amd.com>; gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>; ppaala=
nen@gmail.com <ppaalanen@gmail.com>; Wentland, Harry <Harry.Wentland@amd.co=
m>
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object

Mhm, I'm not aware of any let over pointer between TTM and GEM and we
worked quite hard on reducing the size of the amdgpu_bo, so another
extra pointer just for that corner case would suck quite a bit.

Christian.

Am 08.01.21 um 15:46 schrieb Andrey Grodzovsky:
> Daniel had some objections to this (see bellow) and so I guess I need
> you both to agree on the approach before I proceed.
>
> Andrey
>
> On 1/8/21 9:33 AM, Christian K=F6nig wrote:
>> Am 08.01.21 um 15:26 schrieb Andrey Grodzovsky:
>>> Hey Christian, just a ping.
>>
>> Was there any question for me here?
>>
>> As far as I can see the best approach would still be to fill the VMA
>> with a single dummy page and avoid pointers in the GEM object.
>>
>> Christian.
>>
>>>
>>> Andrey
>>>
>>> On 1/7/21 11:37 AM, Andrey Grodzovsky wrote:
>>>>
>>>> On 1/7/21 11:30 AM, Daniel Vetter wrote:
>>>>> On Thu, Jan 07, 2021 at 11:26:52AM -0500, Andrey Grodzovsky wrote:
>>>>>> On 1/7/21 11:21 AM, Daniel Vetter wrote:
>>>>>>> On Tue, Jan 05, 2021 at 04:04:16PM -0500, Andrey Grodzovsky wrote:
>>>>>>>> On 11/23/20 3:01 AM, Christian K=F6nig wrote:
>>>>>>>>> Am 23.11.20 um 05:54 schrieb Andrey Grodzovsky:
>>>>>>>>>> On 11/21/20 9:15 AM, Christian K=F6nig wrote:
>>>>>>>>>>> Am 21.11.20 um 06:21 schrieb Andrey Grodzovsky:
>>>>>>>>>>>> Will be used to reroute CPU mapped BO's page faults once
>>>>>>>>>>>> device is removed.
>>>>>>>>>>> Uff, one page for each exported DMA-buf? That's not
>>>>>>>>>>> something we can do.
>>>>>>>>>>>
>>>>>>>>>>> We need to find a different approach here.
>>>>>>>>>>>
>>>>>>>>>>> Can't we call alloc_page() on each fault and link them together
>>>>>>>>>>> so they are freed when the device is finally reaped?
>>>>>>>>>> For sure better to optimize and allocate on demand when we reach
>>>>>>>>>> this corner case, but why the linking ?
>>>>>>>>>> Shouldn't drm_prime_gem_destroy be good enough place to free ?
>>>>>>>>> I want to avoid keeping the page in the GEM object.
>>>>>>>>>
>>>>>>>>> What we can do is to allocate a page on demand for each fault
>>>>>>>>> and link
>>>>>>>>> the together in the bdev instead.
>>>>>>>>>
>>>>>>>>> And when the bdev is then finally destroyed after the last
>>>>>>>>> application
>>>>>>>>> closed we can finally release all of them.
>>>>>>>>>
>>>>>>>>> Christian.
>>>>>>>> Hey, started to implement this and then realized that by
>>>>>>>> allocating a page
>>>>>>>> for each fault indiscriminately
>>>>>>>> we will be allocating a new page for each faulting virtual
>>>>>>>> address within a
>>>>>>>> VA range belonging the same BO
>>>>>>>> and this is obviously too much and not the intention. Should I
>>>>>>>> instead use
>>>>>>>> let's say a hashtable with the hash
>>>>>>>> key being faulting BO address to actually keep allocating and
>>>>>>>> reusing same
>>>>>>>> dummy zero page per GEM BO
>>>>>>>> (or for that matter DRM file object address for non imported
>>>>>>>> BOs) ?
>>>>>>> Why do we need a hashtable? All the sw structures to track this
>>>>>>> should
>>>>>>> still be around:
>>>>>>> - if gem_bo->dma_buf is set the buffer is currently exported as
>>>>>>> a dma-buf,
>>>>>>>     so defensively allocate a per-bo page
>>>>>>> - otherwise allocate a per-file page
>>>>>>
>>>>>> That exactly what we have in current implementation
>>>>>>
>>>>>>
>>>>>>> Or is the idea to save the struct page * pointer? That feels a
>>>>>>> bit like
>>>>>>> over-optimizing stuff. Better to have a simple implementation
>>>>>>> first and
>>>>>>> then tune it if (and only if) any part of it becomes a problem
>>>>>>> for normal
>>>>>>> usage.
>>>>>>
>>>>>> Exactly - the idea is to avoid adding extra pointer to
>>>>>> drm_gem_object,
>>>>>> Christian suggested to instead keep a linked list of dummy pages
>>>>>> to be
>>>>>> allocated on demand once we hit a vm_fault. I will then also
>>>>>> prefault the entire
>>>>>> VA range from vma->vm_end - vma->vm_start to vma->vm_end and map
>>>>>> them
>>>>>> to that single dummy page.
>>>>> This strongly feels like premature optimization. If you're worried
>>>>> about
>>>>> the overhead on amdgpu, pay down the debt by removing one of the
>>>>> redundant
>>>>> pointers between gem and ttm bo structs (I think we still have
>>>>> some) :-)
>>>>>
>>>>> Until we've nuked these easy&obvious ones we shouldn't play "avoid 1
>>>>> pointer just because" games with hashtables.
>>>>> -Daniel
>>>>
>>>>
>>>> Well, if you and Christian can agree on this approach and suggest
>>>> maybe what pointer is
>>>> redundant and can be removed from GEM struct so we can use the
>>>> 'credit' to add the dummy page
>>>> to GEM I will be happy to follow through.
>>>>
>>>> P.S Hash table is off the table anyway and we are talking only
>>>> about linked list here since by prefaulting
>>>> the entire VA range for a vmf->vma i will be avoiding redundant
>>>> page faults to same VMA VA range and so
>>>> don't need to search and reuse an existing dummy page but simply
>>>> create a new one for each next fault.
>>>>
>>>> Andrey
>>


--_000_SN6PR12MB46235A1D04FDF4BBD9E60F94EAAE0SN6PR12MB4623namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div style=3D"font-family: &quot;segoe ui westeuropean&quot;, &quot;segoe u=
i&quot;, helvetica, arial, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
Ok then, I guess I will proceed with the dummy pages list implementation th=
en.</div>
<div style=3D"font-family: &quot;segoe ui westeuropean&quot;, &quot;segoe u=
i&quot;, helvetica, arial, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
<br>
</div>
<div style=3D"font-family: &quot;segoe ui westeuropean&quot;, &quot;segoe u=
i&quot;, helvetica, arial, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
Andrey</div>
<div><br>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> 08 January 2021 09:52<br>
<b>To:</b> Grodzovsky, Andrey &lt;Andrey.Grodzovsky@amd.com&gt;; Daniel Vet=
ter &lt;daniel@ffwll.ch&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt=
;; daniel.vetter@ffwll.ch &lt;daniel.vetter@ffwll.ch&gt;; robh@kernel.org &=
lt;robh@kernel.org&gt;; l.stach@pengutronix.de &lt;l.stach@pengutronix.de&g=
t;;
 yuq825@gmail.com &lt;yuq825@gmail.com&gt;; eric@anholt.net &lt;eric@anholt=
.net&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; gregkh@linu=
xfoundation.org &lt;gregkh@linuxfoundation.org&gt;; ppaalanen@gmail.com &lt=
;ppaalanen@gmail.com&gt;; Wentland, Harry &lt;Harry.Wentland@amd.com&gt;<br=
>
<b>Subject:</b> Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM =
object</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Mhm, I'm not aware of any let over pointer between=
 TTM and GEM and we
<br>
worked quite hard on reducing the size of the amdgpu_bo, so another <br>
extra pointer just for that corner case would suck quite a bit.<br>
<br>
Christian.<br>
<br>
Am 08.01.21 um 15:46 schrieb Andrey Grodzovsky:<br>
&gt; Daniel had some objections to this (see bellow) and so I guess I need =
<br>
&gt; you both to agree on the approach before I proceed.<br>
&gt;<br>
&gt; Andrey<br>
&gt;<br>
&gt; On 1/8/21 9:33 AM, Christian K=F6nig wrote:<br>
&gt;&gt; Am 08.01.21 um 15:26 schrieb Andrey Grodzovsky:<br>
&gt;&gt;&gt; Hey Christian, just a ping.<br>
&gt;&gt;<br>
&gt;&gt; Was there any question for me here?<br>
&gt;&gt;<br>
&gt;&gt; As far as I can see the best approach would still be to fill the V=
MA <br>
&gt;&gt; with a single dummy page and avoid pointers in the GEM object.<br>
&gt;&gt;<br>
&gt;&gt; Christian.<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Andrey<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 1/7/21 11:37 AM, Andrey Grodzovsky wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 1/7/21 11:30 AM, Daniel Vetter wrote:<br>
&gt;&gt;&gt;&gt;&gt; On Thu, Jan 07, 2021 at 11:26:52AM -0500, Andrey Grodz=
ovsky wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; On 1/7/21 11:21 AM, Daniel Vetter wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Tue, Jan 05, 2021 at 04:04:16PM -0500, Andr=
ey Grodzovsky wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On 11/23/20 3:01 AM, Christian K=F6nig wro=
te:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Am 23.11.20 um 05:54 schrieb Andrey Gr=
odzovsky:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On 11/21/20 9:15 AM, Christian K=
=F6nig wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Am 21.11.20 um 06:21 schrieb A=
ndrey Grodzovsky:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Will be used to reroute CP=
U mapped BO's page faults once<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; device is removed.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Uff, one page for each exporte=
d DMA-buf? That's not <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; something we can do.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; We need to find a different ap=
proach here.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Can't we call alloc_page() on =
each fault and link them together<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; so they are freed when the dev=
ice is finally reaped?<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; For sure better to optimize and al=
locate on demand when we reach<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; this corner case, but why the link=
ing ?<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Shouldn't drm_prime_gem_destroy be=
 good enough place to free ?<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I want to avoid keeping the page in th=
e GEM object.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; What we can do is to allocate a page o=
n demand for each fault <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; and link<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; the together in the bdev instead.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; And when the bdev is then finally dest=
royed after the last <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; application<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; closed we can finally release all of t=
hem.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Christian.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Hey, started to implement this and then re=
alized that by <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; allocating a page<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; for each fault indiscriminately<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; we will be allocating a new page for each =
faulting virtual <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; address within a<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; VA range belonging the same BO<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; and this is obviously too much and not the=
 intention. Should I <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; instead use<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; let's say a hashtable with the hash<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; key being faulting BO address to actually =
keep allocating and <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; reusing same<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; dummy zero page per GEM BO<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; (or for that matter DRM file object addres=
s for non imported <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; BOs) ?<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Why do we need a hashtable? All the sw structu=
res to track this <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; should<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; still be around:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; - if gem_bo-&gt;dma_buf is set the buffer is c=
urrently exported as <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; a dma-buf,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &nbsp;&nbsp;&nbsp; so defensively allocate a p=
er-bo page<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; - otherwise allocate a per-file page<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; That exactly what we have in current implementatio=
n<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Or is the idea to save the struct page * point=
er? That feels a <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; bit like<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; over-optimizing stuff. Better to have a simple=
 implementation <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; first and<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; then tune it if (and only if) any part of it b=
ecomes a problem <br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; for normal<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; usage.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Exactly - the idea is to avoid adding extra pointe=
r to <br>
&gt;&gt;&gt;&gt;&gt;&gt; drm_gem_object,<br>
&gt;&gt;&gt;&gt;&gt;&gt; Christian suggested to instead keep a linked list =
of dummy pages <br>
&gt;&gt;&gt;&gt;&gt;&gt; to be<br>
&gt;&gt;&gt;&gt;&gt;&gt; allocated on demand once we hit a vm_fault. I will=
 then also <br>
&gt;&gt;&gt;&gt;&gt;&gt; prefault the entire<br>
&gt;&gt;&gt;&gt;&gt;&gt; VA range from vma-&gt;vm_end - vma-&gt;vm_start to=
 vma-&gt;vm_end and map <br>
&gt;&gt;&gt;&gt;&gt;&gt; them<br>
&gt;&gt;&gt;&gt;&gt;&gt; to that single dummy page.<br>
&gt;&gt;&gt;&gt;&gt; This strongly feels like premature optimization. If yo=
u're worried <br>
&gt;&gt;&gt;&gt;&gt; about<br>
&gt;&gt;&gt;&gt;&gt; the overhead on amdgpu, pay down the debt by removing =
one of the <br>
&gt;&gt;&gt;&gt;&gt; redundant<br>
&gt;&gt;&gt;&gt;&gt; pointers between gem and ttm bo structs (I think we st=
ill have <br>
&gt;&gt;&gt;&gt;&gt; some) :-)<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Until we've nuked these easy&amp;obvious ones we shoul=
dn't play &quot;avoid 1<br>
&gt;&gt;&gt;&gt;&gt; pointer just because&quot; games with hashtables.<br>
&gt;&gt;&gt;&gt;&gt; -Daniel<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Well, if you and Christian can agree on this approach and =
suggest <br>
&gt;&gt;&gt;&gt; maybe what pointer is<br>
&gt;&gt;&gt;&gt; redundant and can be removed from GEM struct so we can use=
 the <br>
&gt;&gt;&gt;&gt; 'credit' to add the dummy page<br>
&gt;&gt;&gt;&gt; to GEM I will be happy to follow through.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; P.S Hash table is off the table anyway and we are talking =
only <br>
&gt;&gt;&gt;&gt; about linked list here since by prefaulting<br>
&gt;&gt;&gt;&gt; the entire VA range for a vmf-&gt;vma i will be avoiding r=
edundant <br>
&gt;&gt;&gt;&gt; page faults to same VMA VA range and so<br>
&gt;&gt;&gt;&gt; don't need to search and reuse an existing dummy page but =
simply <br>
&gt;&gt;&gt;&gt; create a new one for each next fault.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Andrey<br>
&gt;&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN6PR12MB46235A1D04FDF4BBD9E60F94EAAE0SN6PR12MB4623namp_--

--===============0149771844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0149771844==--
