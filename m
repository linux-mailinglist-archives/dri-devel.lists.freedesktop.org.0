Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3DC3AECA6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 17:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42818977A;
	Mon, 21 Jun 2021 15:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF6288F9A;
 Mon, 21 Jun 2021 15:40:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZUHg7C5hZjpaIq3QbgFHk/4j0DEnUwLVHIvUaQCWlPVujU6BHQkLCx1AT+iwboZ0ko7js7XlsxVrfRnJks54UZ0rR5DmWAnGZU7N3W1h6EyrVeff1iIDVyEE1XFkfjwAcb5PzFAOIUaJ6DjfAL+ZdRpyrrOGYr1mDN1/9xUfMTDUkWkUmlDjPOTrIMd7gjibYEZvYdKLDIk1FOJN6AfUIUP8CtlyMjRzleByQR6CTBcFpU+eJTJGySprFtzd1zwMv0gzFbd486Wpy4GVtyRAFk7OgjuT7T6rQXWBZyGAoTe7+2k4eqnV+S4w5OWAOMRgB92Rc8JVFDfqhIdVEmFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhn4ILOhiode9VWou84qyyDhBdODgLAxekyOh51JVkw=;
 b=ZF4qcbTsVhohNvTk9mLHFIWB6YmRodPHOU7qcQeEQ17VTFoGFaSV7dvtSK2Ep1ughMGDgoVtIVhRo0Tn7vIFA+P+8nej5YY++qNNDTZ/OkrsBp8kc1GeB/cm7oOXO/sx9FxqIxMtfqG/D+rK7yK34oWAL76o/FY7aLgl9/KtpxnxCgHUMUgTgiXaXxn0CV7Y7d/FsqXpkZg3fb1b5QCB93dw9x8UEQnq4KIzZfgeEcgQunkEHOtQQjWxQM7/0jfDKnAaKIRa+nFdusU0syzn3SiN//JMlCro5yE1y/9IDy1o3AIb+jXhBQInw2e5K8BlZGSCASa7pdZ0seMLGxtjqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhn4ILOhiode9VWou84qyyDhBdODgLAxekyOh51JVkw=;
 b=Y9RVDjFt3K942qfU+VQNQv1rbdxBiGa2yumC8EnNLnAohKKkZOd20B4Q7K0p6PxQGfQcaZ10/kpv6kuCjLxAKVbCd4/mZwCemBszReSMY1QywcyLwAmemcasQP3Ha19BlBKH2TZWjORPOZkNE8wwAK3jhCaw5lFFN+M7A13r9sg=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5287.namprd12.prod.outlook.com (2603:10b6:208:317::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 15:40:22 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::3c38:805a:5664:9047]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::3c38:805a:5664:9047%3]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 15:40:22 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix amdgpu_preempt_mgr_new()
Thread-Topic: [PATCH] drm/amdgpu: fix amdgpu_preempt_mgr_new()
Thread-Index: AQHXZB02hIEzBJZO0ECphXR8pKlEaasZcqkAgAB1wYCAAF5ZAIAEASiAgABXQ6o=
Date: Mon, 21 Jun 2021 15:40:22 +0000
Message-ID: <BL1PR12MB51442659075F52F4B1312401F70A9@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <YMxbQXg/Wqm0ACxt@mwanda>
 <fadcee22-d830-c1be-09f0-9788b98c45ec@amd.com>
 <adee15a2-f531-688c-1121-7504163ae441@amd.com>
 <CADnq5_MtwTXEv=HitiyBfdSyBb-izSRiR3W=zxKNKRNvxdKO1A@mail.gmail.com>,
 <79eb1bb6-b77c-73e0-31f0-028743c98a36@gmail.com>
In-Reply-To: <79eb1bb6-b77c-73e0-31f0-028743c98a36@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-06-21T15:40:21.336Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [192.161.79.207]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bdf529ad-ab7c-4bd9-e348-08d934cae189
x-ms-traffictypediagnostic: BL1PR12MB5287:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB52875D655E64CE6EE725145EF70A9@BL1PR12MB5287.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cs67e9nTXF8Xsruye1V2L1zUZWoKnn/wwHAmsS95sbfQp3N9bbq3CLmRpBOrpRa2IFe8WcgmbxLJ+5abISpaIBOtBdovrxY9ONellZVRFMZhSCs1erWKJNN9hpW7AUICH+2LzsRCxc5lZV8mmvhmOT5zXDMk6J0HNrEPVGUBEajEvU/ypGJje7O8OLagvwrXlQqUAFfFQ+sZ6OGHqCetkztou5p/Qu9T3cs5gjZA4zb4gLZOE0crD+iS9fdwvJbcCVonioDbLLk/b7ec7RTrA32eWnyqEmbDKw2+UyNbQat1//hwH9cEkvSzJqVaBmKSrQnu83xNuYpdi5PZx1wkafsfPvOfep1XJYyDFWpPTtFWJ9+aYCClc8Pj2ltqceYIOWlQvmm+Wm/n7tFCinjqwm1g5UleSUcFqTWho07AL8UNHAmIWPjPz0JJoP6nPQItTX0Wp+758N/lJV4BL6iThO5QfIWmJe/ZR3Rh16pBbwpWDZh6YwEpZRXiIAGWrgk8QtlkfCSkBwZCdvdlt9/larTU9UQWp+gx+trUoqD5JEIQ27baEAKzEWm+I34WIZL/QGqbQDCcZ/qIceLol5NYcg9mJyJJxfw03+9pqdxPOI7Jr73Odqoo6cRCeWi9gyrBTD4UNzYc1uGHzYaUKwx+RQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(55016002)(7696005)(26005)(9686003)(19627405001)(166002)(33656002)(2906002)(71200400001)(8676002)(6506007)(6636002)(53546011)(8936002)(66446008)(76116006)(83380400001)(38100700002)(45080400002)(66476007)(66946007)(110136005)(966005)(478600001)(122000001)(54906003)(316002)(52536014)(64756008)(5660300002)(186003)(66556008)(66574015)(86362001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xTchhpNG/G2GPWnR+PmfpZ/nYfmyjKQPUucKhwm/4afWCQUzuC2L+aUhVU?=
 =?iso-8859-1?Q?GsDdwPpBeUffCk715tv/Jm75tw9k+sWRdrehAwqO5/R4vY1kQU4vZ5Psb2?=
 =?iso-8859-1?Q?+PVWC4cXPWzDpYE/8YwLsLS/lQAYoJ86QpRer03gu1nqTf4q79NqaOQACs?=
 =?iso-8859-1?Q?VrIjxpfaYPUGcDCJHKOrp0WiKvkevmKAc6iR7CtmwxzDnP5G29M7kq3UAh?=
 =?iso-8859-1?Q?uf897l0B+5RcQ4+oBctEQOBbdzAz8135Tt0qU9ZHKEoG4zAC5ZKYDqEGo/?=
 =?iso-8859-1?Q?FBEIMbBUaO14wQicTl6ybBedYL9eFbhneyn0berEiAojbmDhqxf5XfpQgO?=
 =?iso-8859-1?Q?k4nL43eSq2l0pUHCbrxSpCo9zuqZ5errQ7HZ3VXxTEKsB1wCzHBxdXlpJ9?=
 =?iso-8859-1?Q?aI38U57imHvLe54wIiN6fj2FRGKS9RB9t49SYgWrYFeCpw9mb4evXnSoJ+?=
 =?iso-8859-1?Q?2TieZpjWitX1zI0ViPmP+jybwyuCQHiwXTVEWI8UeW4RVwUJ8dmdTMl0vD?=
 =?iso-8859-1?Q?o/Ul10uyOvs6zhM10E5wOZhLEwiKo6icWcPBQeUjJVFrEqxZ0019nQPt7C?=
 =?iso-8859-1?Q?kNIUSO18OFmXMNRXPzaZT9bo7pZe7V/j1NO13GOcl705my4HT3frKlwgOO?=
 =?iso-8859-1?Q?yTjPkZPJ5E8ufmorkVhv9ACnmf8qsNJSmxadUiqy/8hw0lZLhBvNIKUaAv?=
 =?iso-8859-1?Q?IABS2OR9ifeMufBQ3n4YKxzi9j4dC4uRtfS1fBw74Dm/jM3BLzEmLo4Y7K?=
 =?iso-8859-1?Q?HUd4z3T+L0W9S/adM0wj4BIcaT5ru9VW3c6K02g9k5XAV27eU9ddHz28E7?=
 =?iso-8859-1?Q?41U6P3hGKp31222Ng13nZ4tQnLAwckUeyxtZFBQKr1rzF0UKlM5KpGMpvv?=
 =?iso-8859-1?Q?Vm8yp3tkKcMQBP9oSRq6ZV7qxsA4l25sVPxWyOAt0FuZxanUpI6XCiUYjq?=
 =?iso-8859-1?Q?QzPDMHDYkvb8KyXQKGqrjC3/GH0/pbe3EFbR5CaF8gIMI7KbXW58NVOE83?=
 =?iso-8859-1?Q?JhKhQVH4dwXSP2EYs3w5G/DRGPPyuIVqVQUag2y9fmmcn/QQdqM/HKUYH9?=
 =?iso-8859-1?Q?AuhQggQbyeXRIM5lMwuNYP1wo624HY1i60Q3oOIYluFiLfcmH2L1439VBH?=
 =?iso-8859-1?Q?NGiuGKPdZNWH2BWa+YHIJtZ3fcvKZywkAbJWOVOFhMbWS3zkN05n77sk3M?=
 =?iso-8859-1?Q?mXCOYfmwGQAcdUMhsbyAQdz+7ZvFTvjN0eJ37FT1X3IeO+nalBRSu0k+ND?=
 =?iso-8859-1?Q?3u2jng4h1Xo4y+Yd6IRE8gJGaW5Bm9KfnPaqSKZ5v7zsK1IEuQBaWbJ/G8?=
 =?iso-8859-1?Q?/Sl3PQL+Ll0YqY1e6k0hneQhY9IkDqQF8HMsDkkRz8k/6AtS91z5eYbS4j?=
 =?iso-8859-1?Q?CoK4ZNCYeR?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR12MB51442659075F52F4B1312401F70A9BL1PR12MB5144namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf529ad-ab7c-4bd9-e348-08d934cae189
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 15:40:22.0240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QVc3ezcQN/G1X5zEl/72TLATthnsg+pVIxkq+9XL7kZjsAnbaBlqKiC4KS2bRE2KWNnIr6sdSkzTEg0Q7Razwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5287
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BL1PR12MB51442659075F52F4B1312401F70A9BL1PR12MB5144namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[Public]

I've dropped it from my tree in that case.
________________________________
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Monday, June 21, 2021 6:27 AM
To: Alex Deucher <alexdeucher@gmail.com>; Kuehling, Felix <Felix.Kuehling@a=
md.com>
Cc: David Airlie <airlied@linux.ie>; Pan, Xinhui <Xinhui.Pan@amd.com>; kern=
el-janitors@vger.kernel.org <kernel-janitors@vger.kernel.org>; Maling list =
- DRI developers <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-gfx@l=
ists.freedesktop.org>; Daniel Vetter <daniel@ffwll.ch>; Deucher, Alexander =
<Alexander.Deucher@amd.com>; Dave Airlie <airlied@redhat.com>; Koenig, Chri=
stian <Christian.Koenig@amd.com>; Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/amdgpu: fix amdgpu_preempt_mgr_new()

Am 18.06.21 um 23:18 schrieb Alex Deucher:
> On Fri, Jun 18, 2021 at 11:40 AM Felix Kuehling <felix.kuehling@amd.com> =
wrote:
>> Am 2021-06-18 um 4:39 a.m. schrieb Christian K=F6nig:
>>> Am 18.06.21 um 10:37 schrieb Dan Carpenter:
>>>> There is a reversed if statement in amdgpu_preempt_mgr_new() so it
>>>> always returns -ENOMEM.
>>>>
>>>> Fixes: 09b020bb05a5 ("Merge tag 'drm-misc-next-2021-06-09' of
>>>> git://anongit.freedesktop.org/drm/drm-misc into drm-next")
>>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> Most be some fallout from merging it with the TTM changes.
>>>
>>> Anyway, patch is Reviewed-by: Christian K=F6nig <christian.koenig@amd.c=
om>
>> This is obviously not for amd-staging-drm-next. Christian, are you going
>> to apply it to the relevant branches?
> I've applied it to my drm-next branch.

I already pushed it to drm-misc-next last week.

Christian.

>
> Alex
>
>
>> Thanks,
>>    Felix
>>
>>
>>> Thanks,
>>> Christian.
>>>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>>>> index f6aff7ce5160..d02c8637f909 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
>>>> @@ -71,7 +71,7 @@ static int amdgpu_preempt_mgr_new(struct
>>>> ttm_resource_manager *man,
>>>>        struct amdgpu_preempt_mgr *mgr =3D to_preempt_mgr(man);
>>>>          *res =3D kzalloc(sizeof(**res), GFP_KERNEL);
>>>> -    if (*res)
>>>> +    if (!*res)
>>>>            return -ENOMEM;
>>>>          ttm_resource_init(tbo, place, *res);
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist=
s.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Calexa=
nder.deucher%40amd.com%7C096813db12f24172870508d9349f375a%7C3dd8961fe4884e6=
08e11a82d994e183d%7C0%7C0%7C637598680703030828%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3D%2Ffg7TXDA9%2F%2Fjin8T5f3V11fAv3PVvtDFluNHnhwyOGM%3D&amp;reserved=3D=
0
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Calexan=
der.deucher%40amd.com%7C096813db12f24172870508d9349f375a%7C3dd8961fe4884e60=
8e11a82d994e183d%7C0%7C0%7C637598680703030828%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd=
ata=3D%2Ffg7TXDA9%2F%2Fjin8T5f3V11fAv3PVvtDFluNHnhwyOGM%3D&amp;reserved=3D0


--_000_BL1PR12MB51442659075F52F4B1312401F70A9BL1PR12MB5144namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#008000;margin:15pt;" al=
ign=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I've dropped it from my tree in that case.<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Christian K=F6nig &lt=
;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Monday, June 21, 2021 6:27 AM<br>
<b>To:</b> Alex Deucher &lt;alexdeucher@gmail.com&gt;; Kuehling, Felix &lt;=
Felix.Kuehling@amd.com&gt;<br>
<b>Cc:</b> David Airlie &lt;airlied@linux.ie&gt;; Pan, Xinhui &lt;Xinhui.Pa=
n@amd.com&gt;; kernel-janitors@vger.kernel.org &lt;kernel-janitors@vger.ker=
nel.org&gt;; Maling list - DRI developers &lt;dri-devel@lists.freedesktop.o=
rg&gt;; amd-gfx list &lt;amd-gfx@lists.freedesktop.org&gt;; Daniel
 Vetter &lt;daniel@ffwll.ch&gt;; Deucher, Alexander &lt;Alexander.Deucher@a=
md.com&gt;; Dave Airlie &lt;airlied@redhat.com&gt;; Koenig, Christian &lt;C=
hristian.Koenig@amd.com&gt;; Dan Carpenter &lt;dan.carpenter@oracle.com&gt;=
<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu: fix amdgpu_preempt_mgr_new()</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Am 18.06.21 um 23:18 schrieb Alex Deucher:<br>
&gt; On Fri, Jun 18, 2021 at 11:40 AM Felix Kuehling &lt;felix.kuehling@amd=
.com&gt; wrote:<br>
&gt;&gt; Am 2021-06-18 um 4:39 a.m. schrieb Christian K=F6nig:<br>
&gt;&gt;&gt; Am 18.06.21 um 10:37 schrieb Dan Carpenter:<br>
&gt;&gt;&gt;&gt; There is a reversed if statement in amdgpu_preempt_mgr_new=
() so it<br>
&gt;&gt;&gt;&gt; always returns -ENOMEM.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Fixes: 09b020bb05a5 (&quot;Merge tag 'drm-misc-next-2021-0=
6-09' of<br>
&gt;&gt;&gt;&gt; git://anongit.freedesktop.org/drm/drm-misc into drm-next&q=
uot;)<br>
&gt;&gt;&gt;&gt; Signed-off-by: Dan Carpenter &lt;dan.carpenter@oracle.com&=
gt;<br>
&gt;&gt;&gt; Most be some fallout from merging it with the TTM changes.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Anyway, patch is Reviewed-by: Christian K=F6nig &lt;christian.=
koenig@amd.com&gt;<br>
&gt;&gt; This is obviously not for amd-staging-drm-next. Christian, are you=
 going<br>
&gt;&gt; to apply it to the relevant branches?<br>
&gt; I've applied it to my drm-next branch.<br>
<br>
I already pushed it to drm-misc-next last week.<br>
<br>
Christian.<br>
<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; Felix<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt; Christian.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_preemp=
t_mgr.c | 2 +-<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; 1 file changed, 1 insertion(+), 1 deleti=
on(-)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr=
.c<br>
&gt;&gt;&gt;&gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c<br>
&gt;&gt;&gt;&gt; index f6aff7ce5160..d02c8637f909 100644<br>
&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c<br>
&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c<br>
&gt;&gt;&gt;&gt; @@ -71,7 +71,7 @@ static int amdgpu_preempt_mgr_new(struct=
<br>
&gt;&gt;&gt;&gt; ttm_resource_manager *man,<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_pr=
eempt_mgr *mgr =3D to_preempt_mgr(man);<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *res=
 =3D kzalloc(sizeof(**res), GFP_KERNEL);<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; if (*res)<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; if (!*res)<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return -ENOMEM;<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_=
resource_init(tbo, place, *res);<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; amd-gfx mailing list<br>
&gt;&gt; amd-gfx@lists.freedesktop.org<br>
&gt;&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;d=
ata=3D04%7C01%7Calexander.deucher%40amd.com%7C096813db12f24172870508d9349f3=
75a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637598680703030828%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3D%2Ffg7TXDA9%2F%2Fjin8T5f3V11fAv3PVvtDFluNHn=
hwyOGM%3D&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=3D04%7C01%7Calex=
ander.deucher%40amd.com%7C096813db12f24172870508d9349f375a%7C3dd8961fe4884e=
608e11a82d994e183d%7C0%7C0%7C637598680703030828%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
amp;sdata=3D%2Ffg7TXDA9%2F%2Fjin8T5f3V11fAv3PVvtDFluNHnhwyOGM%3D&amp;amp;re=
served=3D0</a><br>
&gt; _______________________________________________<br>
&gt; amd-gfx mailing list<br>
&gt; amd-gfx@lists.freedesktop.org<br>
&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=
=3D04%7C01%7Calexander.deucher%40amd.com%7C096813db12f24172870508d9349f375a=
%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637598680703030828%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C1000&amp;amp;sdata=3D%2Ffg7TXDA9%2F%2Fjin8T5f3V11fAv3PVvtDFluNHnhwy=
OGM%3D&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=3D04%7C01%7Calex=
ander.deucher%40amd.com%7C096813db12f24172870508d9349f375a%7C3dd8961fe4884e=
608e11a82d994e183d%7C0%7C0%7C637598680703030828%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
amp;sdata=3D%2Ffg7TXDA9%2F%2Fjin8T5f3V11fAv3PVvtDFluNHnhwyOGM%3D&amp;amp;re=
served=3D0</a><br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BL1PR12MB51442659075F52F4B1312401F70A9BL1PR12MB5144namp_--
