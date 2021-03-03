Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C714C32BAAF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 21:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6396E9D0;
	Wed,  3 Mar 2021 20:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741FF6E9CF;
 Wed,  3 Mar 2021 20:59:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOT+T5Y7SMsV31cgZ5AJoslnoY2uTU9J8V7GxYSp23LPFK0IA7w9uSv1YmfKBZm0NH8lqkjmyqvtyDk4Vi+aHhOaAu/aIL5ju01HLAb7tovtgUGeoUM3uZfB16m/qVvJWh1hfOVTPA0hgf1PR2sHiujbkarDoytJHN1qD07ibbiHKWxoXafvTm3qRFCgEH9XctnQYTwxh+AvLuvYykBn5X8sCDl/q7S5UzQacDK4muDF3yX8S8r+PxW0IhNx48/WD5iygzs78oTkemQq3uJLUtMva3EifidFp69Mz3teG8aGb+KZdCQXreOdBt8Zbvvzs3HcQ3ny2h7YBWKUF8T/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ohshax+IcyjD+ivWIm3yvDcPm6bSDC2v93D9shjnhq0=;
 b=eTv6sYnEUnuaFmLR3LM5guGx3G6YwnqMkIO0I8saWsYm2STBRMNNPgmkiTCf5sIVqutemAaeetezQvmY8q2NTbmPVLmpyveDqvMOPotOfhWkCgkvtRk8U7sOPSkXXhjP033bTggqS8AMBmspvdVp6uyGzHVcLfRvGU/K+gNP6Z2s1gdta597PdQDfGIGtETgT4ejbbpWL1HjIgOgp1kwOXtAbXYY2Ypmfhn3C845kfaNtlo65mT/YKvedqQPwX5UZmIWdXXWSzOlhM/5dI+FjrPZQNu6Cu1tcWm0ZWufVKibrqF21yXeIJJfv7h3wtsfz1K2PVA0CC91yw1bWVXJLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ohshax+IcyjD+ivWIm3yvDcPm6bSDC2v93D9shjnhq0=;
 b=hQRwib/3y/MZa0MIW72folpTkHZZHmZ4jED5avP29UI43h5cRfNxy/+5LiKJG4U9H9PRrOzSfVR/Uw2fUxFJoN2qVm/2DZypFB/LGAVOV61u1n+FvJ4avabvOB2oIXD9HzSPb4XL4TbqFEGYTeEhvQTePDnO5s2vrHAs1twooT4=
Received: from DM6PR12MB4732.namprd12.prod.outlook.com (2603:10b6:5:32::25) by
 DM6PR12MB4202.namprd12.prod.outlook.com (2603:10b6:5:219::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19; Wed, 3 Mar 2021 20:59:03 +0000
Received: from DM6PR12MB4732.namprd12.prod.outlook.com
 ([fe80::45a1:94ba:f88c:92e2]) by DM6PR12MB4732.namprd12.prod.outlook.com
 ([fe80::45a1:94ba:f88c:92e2%5]) with mapi id 15.20.3890.029; Wed, 3 Mar 2021
 20:59:03 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Daniel
 Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>
Subject: RE: [PATCH] drm/ttm: ioremap buffer according to TTM mem caching
 setting
Thread-Topic: [PATCH] drm/ttm: ioremap buffer according to TTM mem caching
 setting
Thread-Index: AQHXDuxdi0rVkWYmcUuFmBTFWfxbuKpwFpUAgAB6pQCAALW0IIAA0AKAgACqwtA=
Date: Wed, 3 Mar 2021 20:59:03 +0000
Message-ID: <DM6PR12MB4732BD6E9C9C1AE00CD1713380989@DM6PR12MB4732.namprd12.prod.outlook.com>
References: <1614638628-10508-1-git-send-email-Oak.Zeng@amd.com>
 <202103021104.NudsKKei-lkp@intel.com>
 <34b706ca-d15f-223f-e1a3-2ec071d578a2@gmail.com>
 <DM6PR12MB4732C8CF2FE2642A44B32C9C80999@DM6PR12MB4732.namprd12.prod.outlook.com>
 <c64ab60b-6541-6a78-d30e-9d2904debcd0@gmail.com>
In-Reply-To: <c64ab60b-6541-6a78-d30e-9d2904debcd0@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=3ea26878-ab91-4b68-9af9-8246af131fd0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-03-03T20:57:07Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [65.93.223.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2b6c2629-eb35-4e7a-183b-08d8de872d5e
x-ms-traffictypediagnostic: DM6PR12MB4202:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB42020C10771768A5F64C207080989@DM6PR12MB4202.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:336;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aLBgHNVI32j49QY0qt5xJpE3eFllOgGXSTTkIKMAOKmDVQQOrFl1RFKta8DSM2HqObZ5ACpg0oaYFBo2eVijjGaUmBs/NvPCfAU8W9JXa1lBBNNf1Ipl0kWEgkytzeiyzKOSVn4aSMcELMayryLNqpZ9vC3Mzgt9RVcdUo66FnkQIKxozWJ0r2K/IgWj8kQga1BXFfGI+w4ldQuR4oF/eSqzgW2oBUuCEf9IJ6lUHpWYz9YBRNA181l2CdT5V0SKMvj/e57wHZBGM65/DJycl1+B7vM4JIftj8QgvySkPdcaD8wFezUhngvX+nuJgQmMxrJM70Zx5sb3tgLP5BDc90ZOkofEHSoFFI93KIT5onH1+FNTGVgcCDhRvkLw4c5HZrbHkOmaImlHBRgI8u2Zs7X9WU0nZw2bUsuuTf5j+NDgoMYNeQ/x7bI/qiVLQ18v2DIlZ9VBILzEaLHouCkQ2v8WzPe1gslAZXUv8uGjyW78fr08GL0SEVjHrfAfH6mc4RjdFvVDaiMKbJdDo7W61BcRoXcoJhHd1jJwjNzOyGk0GcadwfsjREI3pp9GT1G+VGGo3Cu53T3nu/A0MxtBD3C7n1EvAR34NWLeEiNV0bE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4732.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(66946007)(7696005)(86362001)(6506007)(5660300002)(55016002)(9686003)(83380400001)(33656002)(76116006)(166002)(64756008)(26005)(316002)(66476007)(4326008)(71200400001)(110136005)(966005)(8936002)(66446008)(54906003)(478600001)(66574015)(186003)(2906002)(52536014)(53546011)(66556008)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?ICr3FLKpUP60D/WU+ipx+Hnn31F2iVI2k5IQok9uoAZ/ThayS/8uv5XZvj?=
 =?iso-8859-1?Q?+YUj+gA0bG3TmPkabP/OwX7bfl34JtFSB0ftk8mRifGl7ZibHFAzKJ7iyx?=
 =?iso-8859-1?Q?WN+sbUPnfcX7yETslL1jgHwmYne9UNaRh1nCw91ygV44sPNZ0DTY13Kl+L?=
 =?iso-8859-1?Q?f/+xN8KiYgOvREn41QoukI8gagcMf9tuwiG+g5GhSa1ttXO3VyMyZfCn9f?=
 =?iso-8859-1?Q?zbG/ufYA0sZNjJL24tMNgTdo8T10kLNeXojzXXBMbOaoUBAztHOi4x3Ylq?=
 =?iso-8859-1?Q?TNVrFztEqWb4IRDXqAO+nvdUauqt+ZV3RgJdZQTyHIJ0rMro9iRMaazquR?=
 =?iso-8859-1?Q?sFnlmjPhZTaqxoEO8T1h5tK24EN72wbjmoRoYcDi0LFmmDF0Z+kazoWP3M?=
 =?iso-8859-1?Q?/ZBhctn25OwVD2bmTrKVingGbtVO8QXCEZPABCl0m8kla6qun+0AcAnkwJ?=
 =?iso-8859-1?Q?5pA0WfFrhHQMGMYWMYX4n5NbR6dEgUjMgLtw8BIQqsSBjlsYszAUqhuVrZ?=
 =?iso-8859-1?Q?4VqqYuGQizAmd1OAsNU3QzR/O85vSBJy54a/RIKJGoeJZLFz0pExWlZnH5?=
 =?iso-8859-1?Q?0oePcaV48UM+Na+5Uo6JwWIpajn1FtHLaaoskpSIQr2e+RQXuF6aIjy2Hn?=
 =?iso-8859-1?Q?D92SaeiiefoNU9Q1Uu4vv0aS9UKopEBeWxY8Izvp0/yAOfKkHy9gTyJRCR?=
 =?iso-8859-1?Q?tdxsfb2Yb/g9hlly69Adngi9Jxho3NxjWce7LA7rPz0FSyNSIgsiA5yWS9?=
 =?iso-8859-1?Q?WV5LAoudI3OLFT9HUSmayHrKo2BkwS+pZj1tiu4lIaEgamHb5K/PNfNTUO?=
 =?iso-8859-1?Q?ADmPrL2mqCuFXTHHBEwQEnhGoz3thXGMMoJRu6o0qcnP+oO2CR68xkch+p?=
 =?iso-8859-1?Q?aZOA/OdXfk5R5JFLe65Nun2Uv2dQOuxaupdhEDexzsnzqwivjyThG4LRXS?=
 =?iso-8859-1?Q?17lLY2nK6GhGxeXDeQ3UFY2XM4aHok+PMKMdI4JyvzPQEeICKAs07R4NFG?=
 =?iso-8859-1?Q?FHPD2cTYWwQujwSSHi7rGXgcBt186nngNA4vDjrfD4oOjhhPpwZ0H/uuuH?=
 =?iso-8859-1?Q?8LntMaH2jcyueS2IVwY6sGw3UtzLj0g6CiyY9YeeD5LcIOTGMSiUpE5YJY?=
 =?iso-8859-1?Q?DGrUPM1gGANEDCHjGoR9wAM7fTff3kaMtYxfIVGRWUZ27pKis9VADitS/s?=
 =?iso-8859-1?Q?TUIouSHSz0I5nz04AaRmi36IofzEXmPYJqAzTf4VecYOhDjJm6fhy/6xyz?=
 =?iso-8859-1?Q?MxEnseSfsiGuwg4DNqF7mlMmrPvSBtq83fWVGlMzsGBy2fagPMNSHgzEC6?=
 =?iso-8859-1?Q?yjTEzsjGMeZ2A0YdjenV3lVcfkr+BmS83BR85MG+sISHcDjAXx/c1r10Iz?=
 =?iso-8859-1?Q?NG9UU+J4T5?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4732.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6c2629-eb35-4e7a-183b-08d8de872d5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 20:59:03.4418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yDvjTDj6ef3dUZYIh03C+ZLfSr2rF7xMPuzJMH/1MgfeicJn26NpMB7l0hbk8Jin
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4202
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
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Kasiviswanathan,
 Harish" <Harish.Kasiviswanathan@amd.com>, "Huang,
 JinHuiEric" <JinHuiEric.Huang@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0207109184=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0207109184==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB4732BD6E9C9C1AE00CD1713380989DM6PR12MB4732namp_"

--_000_DM6PR12MB4732BD6E9C9C1AE00CD1713380989DM6PR12MB4732namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Hi Christian,

Can you explain why __iomem annotation is mandatory for amdgpu driver? If t=
his is the case, we can't switch to memremap. The only fix seems to me is a=
dd a #ifdef __x86_64__ to the ioremap_cache codes.

Regards,
Oak

From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Wednesday, March 3, 2021 5:46 AM
To: Zeng, Oak <Oak.Zeng@amd.com>; amd-gfx@lists.freedesktop.org; dri-devel@=
lists.freedesktop.org; Daniel Vetter <daniel@ffwll.ch>; Dave Airlie <airlie=
d@redhat.com>; Thomas Hellstr=F6m (Intel) <thomas_os@shipmail.org>; dan.j.w=
illiams@intel.com
Cc: kbuild-all@lists.01.org; Kuehling, Felix <Felix.Kuehling@amd.com>; Kasi=
viswanathan, Harish <Harish.Kasiviswanathan@amd.com>; Deucher, Alexander <A=
lexander.Deucher@amd.com>; Huang, JinHuiEric <JinHuiEric.Huang@amd.com>; Ko=
enig, Christian <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/ttm: ioremap buffer according to TTM mem caching s=
etting

Hi Oak,



config: parisc-randconfig-r012-20210302 (attached as .config)

It's not the Intel driver build which fails here, but the build bot is just=
 hosted by Intel.

The problem is that the parisc architecture doesn't defines the ioremap_cac=
he() function.

I've looked at using memremap() instead of ioremap_cache(). The problem is =
that we do support architectures with the TTM as well as amndgpu code where=
 the __iomem annotation is mandatory and correct.

Regards,
Christian.
Am 02.03.21 um 23:45 schrieb Zeng, Oak:

[AMD Official Use Only - Internal Distribution Only]

Hi Daniel, Thomas, Dan,

Does below message mean the calling ioremap_cache failed intel's driver bui=
ld? I can see both ioremap_cache and ioremap_wc are defined in arch/x86/mm/=
ioremap.c - why ioremap_wc doesn't break intel driver's build?

Are we supposed to use memremap (offset, size, MEMREMAP_WB) to replace iore=
map_cache? When I read here https://lwn.net/Articles/653585/<https://nam11.=
safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flwn.net%2FArticles%2F=
653585%2F&data=3D04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3=
188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624296472%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&sdata=3DljCFrIfrYbb%2FXmKKS2TJ7dSQ7oCRNWoUhWS4gEBv%2FW4%3=
D&reserved=3D0> I felt that ioremap_cache returns an address annotated with=
 _iomem while memremap returns an address without __iomem annotation. In ou=
r use case, GPU memory is treated as UEFI SPM (specific purpose memory). I =
am not very sure whether memremap (thus no __iomem annotation) is the right=
 thing to do. What I am sure is, we have tested ioremap_cache and it works =
fine on AMD system.

I will send out a test patch replacing ioremap_cache with ioremap_wc, to tr=
igger Intel build robot to see whether it fails Intel build. I suppose it w=
ill not fail Intel build.

Regards,
Oak

From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com><mailto:ckoenig.l=
eichtzumerken@gmail.com>
Sent: Tuesday, March 2, 2021 6:31 AM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; dr=
i-devel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.org>; Dani=
el Vetter <daniel@ffwll.ch><mailto:daniel@ffwll.ch>; Dave Airlie <airlied@r=
edhat.com><mailto:airlied@redhat.com>; Thomas Hellstr=F6m (Intel) <thomas_o=
s@shipmail.org><mailto:thomas_os@shipmail.org>
Cc: Zeng, Oak <Oak.Zeng@amd.com><mailto:Oak.Zeng@amd.com>; kbuild-all@lists=
.01.org<mailto:kbuild-all@lists.01.org>; Kuehling, Felix <Felix.Kuehling@am=
d.com><mailto:Felix.Kuehling@amd.com>; Kasiviswanathan, Harish <Harish.Kasi=
viswanathan@amd.com><mailto:Harish.Kasiviswanathan@amd.com>; Deucher, Alexa=
nder <Alexander.Deucher@amd.com><mailto:Alexander.Deucher@amd.com>; Huang, =
JinHuiEric <JinHuiEric.Huang@amd.com><mailto:JinHuiEric.Huang@amd.com>; Koe=
nig, Christian <Christian.Koenig@amd.com><mailto:Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/ttm: ioremap buffer according to TTM mem caching s=
etting

Hi guys,

adding the usual suspects direct. Does anybody of hand know how to check if=
 an architecture supports ioremap_cache()?

For now we only need this on X86, but I would feel better if we don't use a=
n #ifdef here.

Regards,
Christian.
Am 02.03.21 um 05:12 schrieb kernel test robot:

Hi Oak,



Thank you for the patch! Yet something to improve:



[auto build test ERROR on drm-intel/for-linux-next]

[also build test ERROR on drm-tip/drm-tip linus/master v5.12-rc1 next-20210=
302]

[cannot apply to tegra-drm/drm/tegra/for-next drm-exynos/exynos-drm-next dr=
m/drm-next]

[If your patch is applied to the wrong git tree, kindly drop us a note.

And when submitting patch, we suggest to use '--base' as documented in

https://git-scm.com/docs/git-format-patch<https://nam11.safelinks.protectio=
n.outlook.com/?url=3Dhttps%3A%2F%2Fgit-scm.com%2Fdocs%2Fgit-format-patch&da=
ta=3D04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8=
961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624306464%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C1000&sdata=3D3f5ib%2FlZ6DXXF%2Bk1rXPKGu1IkOhXHdkUmX3obtuIRtA%3D&reserved=
=3D0>]



url:    https://github.com/0day-ci/linux/commits/Oak-Zeng/drm-ttm-ioremap-b=
uffer-according-to-TTM-mem-caching-setting/20210302-064500<https://nam11.sa=
felinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2F0day-ci%2F=
linux%2Fcommits%2FOak-Zeng%2Fdrm-ttm-ioremap-buffer-according-to-TTM-mem-ca=
ching-setting%2F20210302-064500&data=3D04%7C01%7COak.Zeng%40amd.com%7Cc047e=
cb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63=
7503651624306464%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DY9h9ZHM7d2Sqo3XQWr%2Frpb2DA=
k9SkHFIm5nD4ABFNbE%3D&reserved=3D0>

base:   git://anongit.freedesktop.org/drm-intel for-linux-next

config: parisc-randconfig-r012-20210302 (attached as .config)

compiler: hppa-linux-gcc (GCC) 9.3.0

reproduce (this is a W=3D1 build):

        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross<https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cr=
oss&data=3D04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%=
7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624316464%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C1000&sdata=3DwGo3Nwk4mWZjb2W3E7qKf3FtKzLOxCVmQu1zd2rmzRU%3D&reserved=
=3D0> -O ~/bin/make.cross

        chmod +x ~/bin/make.cross

        # https://github.com/0day-ci/linux/commit/225bb3711439ec559dd72ae5a=
f8e62d34ea60a64<https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommit%2F225bb3711439ec559dd72ae5af=
8e62d34ea60a64&data=3D04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08=
d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624316464%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C1000&sdata=3DkOz18UAawmA4SZ6IrCGRt4HISfsmmjfGN2TUgAtm0Ak%=
3D&reserved=3D0>

        git remote add linux-review https://github.com/0day-ci/linux<https:=
//nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2F=
0day-ci%2Flinux&data=3D04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed0=
8d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624326458=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&sdata=3DQnKs47gjzAz%2Fjv%2FAO6H%2BwYNQF6mdk1D8dCNve=
W0YHuM%3D&reserved=3D0>

        git fetch --no-tags linux-review Oak-Zeng/drm-ttm-ioremap-buffer-ac=
cording-to-TTM-mem-caching-setting/20210302-064500

        git checkout 225bb3711439ec559dd72ae5af8e62d34ea60a64

        # save the attached .config to linux build tree

        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dparisc



If you fix the issue, kindly add following tag as appropriate

Reported-by: kernel test robot <lkp@intel.com><mailto:lkp@intel.com>



All errors (new ones prefixed by >>):



   drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_resource_ioremap':

drivers/gpu/drm/ttm/ttm_bo_util.c:95:11: error: implicit declaration of fun=
ction 'ioremap_cache'; did you mean 'ioremap_uc'? [-Werror=3Dimplicit-funct=
ion-declaration]

      95 |    addr =3D ioremap_cache(mem->bus.offset, bus_size);

         |           ^~~~~~~~~~~~~

         |           ioremap_uc

   drivers/gpu/drm/ttm/ttm_bo_util.c:95:9: warning: assignment to 'void *' =
from 'int' makes pointer from integer without a cast [-Wint-conversion]

      95 |    addr =3D ioremap_cache(mem->bus.offset, bus_size);

         |         ^

   drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_bo_ioremap':

   drivers/gpu/drm/ttm/ttm_bo_util.c:379:17: warning: assignment to 'void *=
' from 'int' makes pointer from integer without a cast [-Wint-conversion]

     379 |    map->virtual =3D ioremap_cache(bo->mem.bus.offset + offset,

         |                 ^

   drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_bo_vmap':

   drivers/gpu/drm/ttm/ttm_bo_util.c:500:16: warning: assignment to 'void *=
' from 'int' makes pointer from integer without a cast [-Wint-conversion]

     500 |    vaddr_iomem =3D ioremap_cache(mem->bus.offset,

         |                ^

   cc1: some warnings being treated as errors





vim +95 drivers/gpu/drm/ttm/ttm_bo_util.c



    74

    75  static int ttm_resource_ioremap(struct ttm_bo_device *bdev,

    76                                struct ttm_resource *mem,

    77                                void **virtual)

    78  {

    79          int ret;

    80          void *addr;

    81

    82          *virtual =3D NULL;

    83          ret =3D ttm_mem_io_reserve(bdev, mem);

    84          if (ret || !mem->bus.is_iomem)

    85                  return ret;

    86

    87          if (mem->bus.addr) {

    88                  addr =3D mem->bus.addr;

    89          } else {

    90                  size_t bus_size =3D (size_t)mem->num_pages << PAGE_=
SHIFT;

    91

    92                  if (mem->bus.caching =3D=3D ttm_write_combined)

    93                         addr =3D ioremap_wc(mem->bus.offset, bus_siz=
e);

    94                  else if (mem->bus.caching =3D=3D ttm_cached)

  > 95                         addr =3D ioremap_cache(mem->bus.offset, bus_=
size);

    96                  else

    97                         addr =3D ioremap(mem->bus.offset, bus_size);

    98                  if (!addr) {

    99                         ttm_mem_io_free(bdev, mem);

   100                         return -ENOMEM;

   101                  }

   102          }

   103          *virtual =3D addr;

   104          return 0;

   105  }

   106



---

0-DAY CI Kernel Test Service, Intel Corporation

https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org<https://nam11.=
safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.01.org%2Fhyperk=
itty%2Flist%2Fkbuild-all%40lists.01.org&data=3D04%7C01%7COak.Zeng%40amd.com=
%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%=
7C0%7C637503651624326458%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DMY6tEGVY0X4VyS750dY=
msfVoR71Zp78YdxuqqRljnsI%3D&reserved=3D0>




_______________________________________________

amd-gfx mailing list

amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>

https://lists.freedesktop.org/mailman/listinfo/amd-gfx<https://nam11.safeli=
nks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.freedesktop.org%2Fmai=
lman%2Flistinfo%2Famd-gfx&data=3D04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316d=
f47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63750365=
1624336455%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB=
TiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DOr3tWmS5M6mXOaFP4FHsEbg0rqoizNGpT=
l6JEkD6fac%3D&reserved=3D0>



--_000_DM6PR12MB4732BD6E9C9C1AE00CD1713380989DM6PR12MB4732namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}
span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Christian,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can you explain why __iomem annotation is mandatory =
for amdgpu driver? If this is the case, we can&#8217;t switch to memremap. =
The only fix seems to me is add a #ifdef __x86_64__ to the ioremap_cache co=
des.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Oak<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Christian K=F6nig &lt;ckoenig.leichtzum=
erken@gmail.com&gt;
<br>
<b>Sent:</b> Wednesday, March 3, 2021 5:46 AM<br>
<b>To:</b> Zeng, Oak &lt;Oak.Zeng@amd.com&gt;; amd-gfx@lists.freedesktop.or=
g; dri-devel@lists.freedesktop.org; Daniel Vetter &lt;daniel@ffwll.ch&gt;; =
Dave Airlie &lt;airlied@redhat.com&gt;; Thomas Hellstr=F6m (Intel) &lt;thom=
as_os@shipmail.org&gt;; dan.j.williams@intel.com<br>
<b>Cc:</b> kbuild-all@lists.01.org; Kuehling, Felix &lt;Felix.Kuehling@amd.=
com&gt;; Kasiviswanathan, Harish &lt;Harish.Kasiviswanathan@amd.com&gt;; De=
ucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Huang, JinHuiEric &lt;J=
inHuiEric.Huang@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com=
&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/ttm: ioremap buffer according to TTM mem ca=
ching setting<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi Oak,<br>
<br>
<br>
<o:p></o:p></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre>config: parisc-randconfig-r012-20210302 (attached as .config)<o:p></o:=
p></pre>
</blockquote>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><br>
It's not the Intel driver build which fails here, but the build bot is just=
 hosted by Intel.<br>
<br>
The problem is that the parisc architecture doesn't defines the ioremap_cac=
he() function.<br>
<br>
I've looked at using memremap() instead of ioremap_cache(). The problem is =
that we do support architectures with the TTM as well as amndgpu code where=
 the __iomem annotation is mandatory and correct.<br>
<br>
Regards,<br>
Christian.<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">Am 02.03.21 um 23:45 schrieb Zeng, Oak:<o:p></o:p></=
p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p style=3D"margin:5.0pt"><span style=3D"font-family:&quot;Arial&quot;,sans=
-serif;color:#0078D7">[AMD Official Use Only - Internal Distribution Only]<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Hi Daniel, Thomas, Dan,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Does below message mean the calling ioremap_cache fa=
iled intel&#8217;s driver build? I can see both ioremap_cache and ioremap_w=
c are defined in arch/x86/mm/ioremap.c &#8211; why ioremap_wc doesn&#8217;t=
 break intel driver&#8217;s build?<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Are we supposed to use memremap (offset, size, MEMRE=
MAP_WB) to replace ioremap_cache? When I read here
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flwn.net%2FArticles%2F653585%2F&amp;data=3D04%7C01%7COak.Zeng%40amd.com%=
7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7=
C0%7C637503651624296472%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DljCFrIfrYbb%2FXm=
KKS2TJ7dSQ7oCRNWoUhWS4gEBv%2FW4%3D&amp;reserved=3D0">
https://lwn.net/Articles/653585/</a> I felt that ioremap_cache returns an a=
ddress annotated with _iomem while memremap returns an address without __io=
mem annotation. In our use case, GPU memory is treated as UEFI SPM (specifi=
c purpose memory). I am not very
 sure whether memremap (thus no __iomem annotation) is the right thing to d=
o. What I am sure is, we have tested ioremap_cache and it works fine on AMD=
 system.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">I will send out a test patch replacing ioremap_cache=
 with ioremap_wc, to trigger Intel build robot to see whether it fails Inte=
l build. I suppose it will not fail Intel build.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Oak<o:p></o:p></p>
</div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Christian K=F6nig <a href=3D"mailto:cko=
enig.leichtzumerken@gmail.com">
&lt;ckoenig.leichtzumerken@gmail.com&gt;</a> <br>
<b>Sent:</b> Tuesday, March 2, 2021 6:31 AM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a>;
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a>; Daniel Vetter
<a href=3D"mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a>; Dave Airlie=
 <a href=3D"mailto:airlied@redhat.com">
&lt;airlied@redhat.com&gt;</a>; Thomas Hellstr=F6m (Intel) <a href=3D"mailt=
o:thomas_os@shipmail.org">
&lt;thomas_os@shipmail.org&gt;</a><br>
<b>Cc:</b> Zeng, Oak <a href=3D"mailto:Oak.Zeng@amd.com">&lt;Oak.Zeng@amd.c=
om&gt;</a>; <a href=3D"mailto:kbuild-all@lists.01.org">
kbuild-all@lists.01.org</a>; Kuehling, Felix <a href=3D"mailto:Felix.Kuehli=
ng@amd.com">
&lt;Felix.Kuehling@amd.com&gt;</a>; Kasiviswanathan, Harish <a href=3D"mail=
to:Harish.Kasiviswanathan@amd.com">
&lt;Harish.Kasiviswanathan@amd.com&gt;</a>; Deucher, Alexander <a href=3D"m=
ailto:Alexander.Deucher@amd.com">
&lt;Alexander.Deucher@amd.com&gt;</a>; Huang, JinHuiEric <a href=3D"mailto:=
JinHuiEric.Huang@amd.com">
&lt;JinHuiEric.Huang@amd.com&gt;</a>; Koenig, Christian <a href=3D"mailto:C=
hristian.Koenig@amd.com">
&lt;Christian.Koenig@amd.com&gt;</a><br>
<b>Subject:</b> Re: [PATCH] drm/ttm: ioremap buffer according to TTM mem ca=
ching setting<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Hi guys,<br>
<br>
adding the usual suspects direct. Does anybody of hand know how to check if=
 an architecture supports ioremap_cache()?<br>
<br>
For now we only need this on X86, but I would feel better if we don't use a=
n #ifdef here.<br>
<br>
Regards,<br>
Christian.<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">Am 02.03.21 um 05:12 schrieb kernel test robot:<o:p>=
</o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre>Hi Oak,<o:p></o:p></pre>
<pre>&nbsp;<o:p></o:p></pre>
<pre>Thank you for the patch! Yet something to improve:<o:p></o:p></pre>
<pre>&nbsp;<o:p></o:p></pre>
<pre>[auto build test ERROR on drm-intel/for-linux-next]<o:p></o:p></pre>
<pre>[also build test ERROR on drm-tip/drm-tip linus/master v5.12-rc1 next-=
20210302]<o:p></o:p></pre>
<pre>[cannot apply to tegra-drm/drm/tegra/for-next drm-exynos/exynos-drm-ne=
xt drm/drm-next]<o:p></o:p></pre>
<pre>[If your patch is applied to the wrong git tree, kindly drop us a note=
.<o:p></o:p></pre>
<pre>And when submitting patch, we suggest to use '--base' as documented in=
<o:p></o:p></pre>
<pre><a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgit-scm.com%2Fdocs%2Fgit-format-patch&amp;data=3D04%7C01%7COak.Zen=
g%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d99=
4e183d%7C0%7C0%7C637503651624306464%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D3f5i=
b%2FlZ6DXXF%2Bk1rXPKGu1IkOhXHdkUmX3obtuIRtA%3D&amp;reserved=3D0">https://gi=
t-scm.com/docs/git-format-patch</a>]<o:p></o:p></pre>
<pre>&nbsp;<o:p></o:p></pre>
<pre>url:&nbsp;&nbsp;&nbsp; <a href=3D"https://nam11.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommits%2FOa=
k-Zeng%2Fdrm-ttm-ioremap-buffer-according-to-TTM-mem-caching-setting%2F2021=
0302-064500&amp;data=3D04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed0=
8d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624306464=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DY9h9ZHM7d2Sqo3XQWr%2Frpb2DAk9SkHFIm5nD4=
ABFNbE%3D&amp;reserved=3D0">https://github.com/0day-ci/linux/commits/Oak-Ze=
ng/drm-ttm-ioremap-buffer-according-to-TTM-mem-caching-setting/20210302-064=
500</a><o:p></o:p></pre>
<pre>base:&nbsp;&nbsp; git://anongit.freedesktop.org/drm-intel for-linux-ne=
xt<o:p></o:p></pre>
<pre>config: parisc-randconfig-r012-20210302 (attached as .config)<o:p></o:=
p></pre>
<pre>compiler: hppa-linux-gcc (GCC) 9.3.0<o:p></o:p></pre>
<pre>reproduce (this is a W=3D1 build):<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wget <a href=3D"https://nam=
11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fraw.githubusercont=
ent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cross&amp;data=3D04%7C01=
%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e60=
8e11a82d994e183d%7C0%7C0%7C637503651624316464%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd=
ata=3DwGo3Nwk4mWZjb2W3E7qKf3FtKzLOxCVmQu1zd2rmzRU%3D&amp;reserved=3D0">http=
s://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross</a> -O=
 ~/bin/make.cross<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chmod +x ~/bin/make.cross<o=
:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # <a href=3D"https://nam11.=
safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2F0day-ci%=
2Flinux%2Fcommit%2F225bb3711439ec559dd72ae5af8e62d34ea60a64&amp;data=3D04%7=
C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884=
e608e11a82d994e183d%7C0%7C0%7C637503651624316464%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DkOz18UAawmA4SZ6IrCGRt4HISfsmmjfGN2TUgAtm0Ak%3D&amp;reserved=3D0">h=
ttps://github.com/0day-ci/linux/commit/225bb3711439ec559dd72ae5af8e62d34ea6=
0a64</a><o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git remote add linux-review=
 <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fgithub.com%2F0day-ci%2Flinux&amp;data=3D04%7C01%7COak.Zeng%40amd.com%7=
Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C=
0%7C637503651624326458%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DQnKs47gjzAz%2Fjv%=
2FAO6H%2BwYNQF6mdk1D8dCNveW0YHuM%3D&amp;reserved=3D0">https://github.com/0d=
ay-ci/linux</a><o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git fetch --no-tags linux-r=
eview Oak-Zeng/drm-ttm-ioremap-buffer-according-to-TTM-mem-caching-setting/=
20210302-064500<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git checkout 225bb3711439ec=
559dd72ae5af8e62d34ea60a64<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # save the attached .config=
 to linux build tree<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COMPILER_INSTALL_PATH=3D$HO=
ME/0day COMPILER=3Dgcc-9.3.0 make.cross ARCH=3Dparisc <o:p></o:p></pre>
<pre>&nbsp;<o:p></o:p></pre>
<pre>If you fix the issue, kindly add following tag as appropriate<o:p></o:=
p></pre>
<pre>Reported-by: kernel test robot <a href=3D"mailto:lkp@intel.com">&lt;lk=
p@intel.com&gt;</a><o:p></o:p></pre>
<pre>&nbsp;<o:p></o:p></pre>
<pre>All errors (new ones prefixed by &gt;&gt;):<o:p></o:p></pre>
<pre>&nbsp;<o:p></o:p></pre>
<pre>&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_resou=
rce_ioremap':<o:p></o:p></pre>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre>drivers/gpu/drm/ttm/ttm_bo_util.c:95:11: error: implicit declaration o=
f function 'ioremap_cache'; did you mean 'ioremap_uc'? [-Werror=3Dimplicit-=
function-declaration]<o:p></o:p></pre>
</blockquote>
</blockquote>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 95 |&nbsp;&nbsp;&nbsp; addr =3D ioremap=
_cache(mem-&gt;bus.offset, bus_size);<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ioremap_uc<o:p></o:p></pre>
<pre>&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_bo_util.c:95:9: warning: assignme=
nt to 'void *' from 'int' makes pointer from integer without a cast [-Wint-=
conversion]<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 95 |&nbsp;&nbsp;&nbsp; addr =3D ioremap=
_cache(mem-&gt;bus.offset, bus_size);<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; ^<o:p></o:p></pre>
<pre>&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_bo_io=
remap':<o:p></o:p></pre>
<pre>&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_bo_util.c:379:17: warning: assign=
ment to 'void *' from 'int' makes pointer from integer without a cast [-Win=
t-conversion]<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp; 379 |&nbsp;&nbsp;&nbsp; map-&gt;virtual =3D i=
oremap_cache(bo-&gt;mem.bus.offset + offset,<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; ^<o:p></o:p></pre>
<pre>&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_bo_vm=
ap':<o:p></o:p></pre>
<pre>&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_bo_util.c:500:16: warning: assign=
ment to 'void *' from 'int' makes pointer from integer without a cast [-Win=
t-conversion]<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp; 500 |&nbsp;&nbsp;&nbsp; vaddr_iomem =3D iorem=
ap_cache(mem-&gt;bus.offset,<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^<o:=
p></o:p></pre>
<pre>&nbsp;&nbsp; cc1: some warnings being treated as errors<o:p></o:p></pr=
e>
<pre>&nbsp;<o:p></o:p></pre>
<pre>&nbsp;<o:p></o:p></pre>
<pre>vim +95 drivers/gpu/drm/ttm/ttm_bo_util.c<o:p></o:p></pre>
<pre>&nbsp;<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 74&nbsp; <o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 75&nbsp; static int ttm_resource_ioremap(struct ttm=
_bo_device *bdev,<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 76&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_resour=
ce *mem,<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 77&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void **virtual)<o=
:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 78&nbsp; {<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 79&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; int ret;<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 80&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; void *addr;<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 81&nbsp; <o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 82&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; *virtual =3D NULL;<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 83&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ret =3D ttm_mem_io_reserve(bdev, mem);<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 84&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (ret || !mem-&gt;bus.is_iomem)<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 85&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<o:p></o:p=
></pre>
<pre>&nbsp;&nbsp;&nbsp; 86&nbsp; <o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 87&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (mem-&gt;bus.addr) {<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 88&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addr =3D mem-&gt;bus.=
addr;<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 89&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; } else {<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 90&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t bus_size =3D (=
size_t)mem-&gt;num_pages &lt;&lt; PAGE_SHIFT;<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 91&nbsp; <o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 92&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (mem-&gt;bus.cachi=
ng =3D=3D ttm_write_combined)<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 93&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; addr =3D ioremap_wc(mem-&gt;bus.offset, bus_size);<o:p=
></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 94&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (mem-&gt;bus.=
caching =3D=3D ttm_cached)<o:p></o:p></pre>
<pre>&nbsp; &gt; 95&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; addr =3D ioremap_cache(mem-&gt;bus.offset, bus_size);<o:p></o=
:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 96&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 97&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; addr =3D ioremap(mem-&gt;bus.offset, bus_size);<o:p></=
o:p></pre>
<pre>&nbsp;&nbsp;&nbsp; 98&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!addr) {<o:p></o:=
p></pre>
<pre>&nbsp;&nbsp;&nbsp; 99&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; ttm_mem_io_free(bdev, mem);<o:p></o:p></pre>
<pre>&nbsp;&nbsp; 100&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return -ENOMEM;<o:p></o:p></pre>
<pre>&nbsp;&nbsp; 101&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></pre>
<pre>&nbsp;&nbsp; 102&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 }<o:p></o:p></pre>
<pre>&nbsp;&nbsp; 103&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 *virtual =3D addr;<o:p></o:p></pre>
<pre>&nbsp;&nbsp; 104&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 return 0;<o:p></o:p></pre>
<pre>&nbsp;&nbsp; 105&nbsp; }<o:p></o:p></pre>
<pre>&nbsp;&nbsp; 106&nbsp; <o:p></o:p></pre>
<pre>&nbsp;<o:p></o:p></pre>
<pre>---<o:p></o:p></pre>
<pre>0-DAY CI Kernel Test Service, Intel Corporation<o:p></o:p></pre>
<pre><a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;d=
ata=3D04%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd=
8961fe4884e608e11a82d994e183d%7C0%7C0%7C637503651624326458%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C1000&amp;sdata=3DMY6tEGVY0X4VyS750dYmsfVoR71Zp78YdxuqqRljnsI%3D&amp;reser=
ved=3D0">https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org</a><o=
:p></o:p></pre>
<p class=3D"MsoNormal"><br>
<br>
<br>
<o:p></o:p></p>
<pre>_______________________________________________<o:p></o:p></pre>
<pre>amd-gfx mailing list<o:p></o:p></pre>
<pre><a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedes=
ktop.org</a><o:p></o:p></pre>
<pre><a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04=
%7C01%7COak.Zeng%40amd.com%7Cc047ecb316df47cde7ed08d8de3188d4%7C3dd8961fe48=
84e608e11a82d994e183d%7C0%7C0%7C637503651624336455%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;sdata=3DOr3tWmS5M6mXOaFP4FHsEbg0rqoizNGpTl6JEkD6fac%3D&amp;reserved=3D0"=
>https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><o:p></o:p></pre=
>
</blockquote>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
</blockquote>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_DM6PR12MB4732BD6E9C9C1AE00CD1713380989DM6PR12MB4732namp_--

--===============0207109184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0207109184==--
