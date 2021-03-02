Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD78532AC80
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 23:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F046E092;
	Tue,  2 Mar 2021 22:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1ADD6E092;
 Tue,  2 Mar 2021 22:45:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmsAbYq7wcyTydJtl3ajMIQENre4B/RWR9uUfri0IuVmh/pTBfRhJmNAwF3sUNKFvEv9uGwpDmaEYNM075H6x2SPNZO1TmMCq3nvlSJTcJj1yDw9GIncAlhcUog1ssxrgVRdTvS9ovhVM/LAE80YRaoa/mFsHgWRHChHXar4SfFzb7rWv0qiG0x+URcWwb4UXS3XPrLqzG0WFWUXL5Q9ioSF5Y8Pk+Pa5LKnFxTnPn712/tdbxmLnERh5hwJ8fz0i/Ntkf98cgQ3ZZNdHpS2q16AxqWImX4pHuocP60wLF05l1AfBmPa6f/0xnKlFxAPpIjvtGuLbps2D5NTarsojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxxxNNL/wYRg+fyBt8AsdpNfYBSEFN/S6lrSYQ29pCs=;
 b=CBLH3AzC7fzF+4UkifIpt2Gu9kZQxy4ySwaw0fkVYdOACTbZlipRnzIzkDbP+E6pgHx+O6M3m59H3X5WawwKyl/cKFaH2ttgK5BshlLv5DrV7QxiLZKshQU+bdHCo8Eo6HTb6il+79+jRT+f9OXPKHLRolLXcJ6O8D7PQU8FBMTKI3Fwvg0amDSO5b9d84oOHb3AGQNVrtXM6mIbKh1OuewwzLToR2bpzJaNI/YDsa17hsyaof6XzqGLeutrAvt11irfiIjMD3n9Cgnq01r5r8lLoBmZ8m2hnbBPWzdn3St7tudxcJ9c0KIVoKAF5GsGqPd3FG/dPSS3MrcB+bFizg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxxxNNL/wYRg+fyBt8AsdpNfYBSEFN/S6lrSYQ29pCs=;
 b=O/bp5QuXA6C6SoR/tYvAcvh9/M96lsLgXUQpm5o9Z/HJ37gfEYOLaPps8obDib/DtC55OwUCmGBc5xBLiBJTX69AQqPOSyocIjRivb7Y+dYiFGfmKYz6ZOt8tp9UjQUbyzVGVsTEt+p9UCBRO2736AZRPcszjeoavS2snS8eG+Q=
Received: from DM6PR12MB4732.namprd12.prod.outlook.com (2603:10b6:5:32::25) by
 DM6PR12MB2745.namprd12.prod.outlook.com (2603:10b6:5:45::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.39; Tue, 2 Mar 2021 22:45:15 +0000
Received: from DM6PR12MB4732.namprd12.prod.outlook.com
 ([fe80::45a1:94ba:f88c:92e2]) by DM6PR12MB4732.namprd12.prod.outlook.com
 ([fe80::45a1:94ba:f88c:92e2%5]) with mapi id 15.20.3890.029; Tue, 2 Mar 2021
 22:45:15 +0000
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
Thread-Index: AQHXDuxdi0rVkWYmcUuFmBTFWfxbuKpwFpUAgAB6pQCAALW0IA==
Date: Tue, 2 Mar 2021 22:45:15 +0000
Message-ID: <DM6PR12MB4732C8CF2FE2642A44B32C9C80999@DM6PR12MB4732.namprd12.prod.outlook.com>
References: <1614638628-10508-1-git-send-email-Oak.Zeng@amd.com>
 <202103021104.NudsKKei-lkp@intel.com>
 <34b706ca-d15f-223f-e1a3-2ec071d578a2@gmail.com>
In-Reply-To: <34b706ca-d15f-223f-e1a3-2ec071d578a2@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=f10fb8ea-aa06-40c5-a47d-de7470595f50;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Use Only - Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-03-02T22:21:28Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [67.70.4.139]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 965f7284-fad7-4721-9f19-08d8ddccd903
x-ms-traffictypediagnostic: DM6PR12MB2745:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB274595DD35682B89D5C1AA8A80999@DM6PR12MB2745.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:275;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: olReOKHJHazmJDTv8PhtcknFKfOyQ3QEXQNyHtuMcm+bE1MRiCkpYLj+am31CX9e34Vy++Z7qy4XCyAY4qiNZL0jd8RWymkitO9//ZDIADRklGxIm/o3bo/0fS4JGm8WD/haxgB8onYR8bED6jwUat/kjx8Y5xJ7iC3v+3eYc7yuunJeqSJ7NfRssKcZ2GVTGjrUYHC20oEgFurCY8CYC6z90OMbWW5DfxGbkZDSp2kA1PC/PD3qZd9Ivi92QIFEvc8bNe4K9sS8Y84OQuSR3aY+16cT4krmcnAT3PR8z3UBPPMSyo4GI2EMcrmhDGYIC74wW2b/XiPjL0oACARRd2uCftIeoMcKnGyY1R11tyGDlTpOeqX9lDIUZoQakY5jkPQuYAKmNBH4VtSgJs3y8G2IaD+23PzJHtQODHzbi1Ndfa6AokhPyq1qnm0IO/8Eur+XklF+ElNjZANipFRopUI3sj7qSBPNWoWfdtyefALxDEKpLOwR8cxoWTqNWtTCe2uSzRTlt+ST6nDDXM4v103o+ZlQRMseUWHe3vPsGM1qyRswEiFtshcGVUOPJn0EmSev8kyGu/hSvK5vHSlcTkw90h+qyDzVutMMkgx5+dU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4732.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(76116006)(186003)(55016002)(8936002)(166002)(110136005)(33656002)(53546011)(83380400001)(71200400001)(8676002)(26005)(66574015)(54906003)(9686003)(66446008)(7696005)(316002)(5660300002)(478600001)(52536014)(66946007)(66476007)(966005)(66556008)(64756008)(2906002)(4326008)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?0olmrqXuWyzrNNAYcoCE0mO1kxwUN2Zh7Ad6vLYjPDe1BMQRC0A5EreIkv?=
 =?iso-8859-1?Q?Wo4DOdU1ib8uLTq65b6l+VmwEJkqpvUZahEZVnfB/h36bu7FqvW5FCWkwa?=
 =?iso-8859-1?Q?c6FqRWBw59CAjWp5/Kz2EzF5HHyDxuYrNxbuEgrGjgceB+5rce5kSpS1Bv?=
 =?iso-8859-1?Q?uTYW6DczxmLgYc9Gp9qYg7KMX7hNiH/a7HdBgGIG7NjC98YYY0VhsSUWlw?=
 =?iso-8859-1?Q?4OBkmauTm98uj+j9Rb9uFXpDQ/RnRbNxLhHvEqj6QFHzjLHRcRgSiKaers?=
 =?iso-8859-1?Q?n9UT49k5fhgupmIaUrhJCWFzN6FyVHCH4YXcpeor8KgVPBvxAX0Xf7yTlb?=
 =?iso-8859-1?Q?1qUFhJDUTgF9GIlfsOa+rVdTggXHpyF8kIbdKTaVQnnOdZIkeARX4xXchv?=
 =?iso-8859-1?Q?Pz9gXbDt/oPjDZ/Zc7IzqTCcVCo70uj81wKCMdmnJOrTVTt8cFICH6WaKm?=
 =?iso-8859-1?Q?N0e+Nlb9vwSB2uq1ekQlGRHAP0aubjlAr9huoByhQdbjMkFic2spBAeZhE?=
 =?iso-8859-1?Q?i2iqwrfIqaf0u6xFnfMSlEl2nMMRDaXyFCMDcu3HKqYgab05m1bi20X5Qi?=
 =?iso-8859-1?Q?BIj6mCsA3Ar/wG5WOMH6Uf9BvDGo3e2tWP7XMNPS/zfWa+UpMwHh8V42jp?=
 =?iso-8859-1?Q?qQfewd16OhGC26XYXQpIrlvCHRFwJuowixJehFwAXuuyL3W5oDg/27LLs2?=
 =?iso-8859-1?Q?IfUTdH+8yx+31/Xq8CL/aka3X3ymSKPehDWmP1g+zlXpNn72zOUhSsnZhv?=
 =?iso-8859-1?Q?UNedDO7/RKabx4Tffd5pJs4YkEmsg37mM4q3F4Yv/ZJGRjCKbqtUCCM1OG?=
 =?iso-8859-1?Q?o3PLKq+ioannj8XwOa/0Wg68ZmF+frKsaLM1eRAjvZfbF51SFcCvuAbl9F?=
 =?iso-8859-1?Q?5nYmCmyqZczFVcHELxj9ELjMLXzzFpc1RMeATzfpkg29LOj3uRFXPnfaTz?=
 =?iso-8859-1?Q?XmcAjOpnO7XchJzRq0JUkNOkplDbZemle0lSkPQHxPXvDTRr+B36YJ2kgA?=
 =?iso-8859-1?Q?oe//dUrtyP8F/k+syUFE1p/IHw3k80AL25yipRFDRxF2QQQ+KZctQDiB12?=
 =?iso-8859-1?Q?RMJv3o+RN4MXrjT3fVWl+tGqx5JbS2fprf4/EqxMDbxzhP1sM3qVoZ3UAG?=
 =?iso-8859-1?Q?kamDjIqcRWb2cF6wECoxPcQu7xMxmwILgQGuF4fGmgzLutktCqmNmrzGRg?=
 =?iso-8859-1?Q?MQN8Hc/Foiy7P9o4/OVqtv6iyx06gVAxm5CitfoDrIYjvSXmDppgsbhtlz?=
 =?iso-8859-1?Q?2+TJjXMGspXxzwlL5H+YYfROxxTEOnfKtxbb1LxVUanwtsH8KmNjdxMIVa?=
 =?iso-8859-1?Q?lsj6IkLczPoQ1qc9FUuMzthNd5oxcOxrHg51EJ4UPGSOORc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4732.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 965f7284-fad7-4721-9f19-08d8ddccd903
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2021 22:45:15.5566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /sS5kZpkHHzAXgjhS4TZA0y0jjhOe9dSQuVcS3szeauJPHslg78x3KEIO9ePgNp5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2745
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
Content-Type: multipart/mixed; boundary="===============0745402462=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0745402462==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB4732C8CF2FE2642A44B32C9C80999DM6PR12MB4732namp_"

--_000_DM6PR12MB4732C8CF2FE2642A44B32C9C80999DM6PR12MB4732namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Hi Daniel, Thomas, Dan,

Does below message mean the calling ioremap_cache failed intel's driver bui=
ld? I can see both ioremap_cache and ioremap_wc are defined in arch/x86/mm/=
ioremap.c - why ioremap_wc doesn't break intel driver's build?

Are we supposed to use memremap (offset, size, MEMREMAP_WB) to replace iore=
map_cache? When I read here https://lwn.net/Articles/653585/ I felt that io=
remap_cache returns an address annotated with _iomem while memremap returns=
 an address without __iomem annotation. In our use case, GPU memory is trea=
ted as UEFI SPM (specific purpose memory). I am not very sure whether memre=
map (thus no __iomem annotation) is the right thing to do. What I am sure i=
s, we have tested ioremap_cache and it works fine on AMD system.

I will send out a test patch replacing ioremap_cache with ioremap_wc, to tr=
igger Intel build robot to see whether it fails Intel build. I suppose it w=
ill not fail Intel build.

Regards,
Oak

From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Tuesday, March 2, 2021 6:31 AM
To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Daniel =
Vetter <daniel@ffwll.ch>; Dave Airlie <airlied@redhat.com>; Thomas Hellstr=
=F6m (Intel) <thomas_os@shipmail.org>
Cc: Zeng, Oak <Oak.Zeng@amd.com>; kbuild-all@lists.01.org; Kuehling, Felix =
<Felix.Kuehling@amd.com>; Kasiviswanathan, Harish <Harish.Kasiviswanathan@a=
md.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Huang, JinHuiEric =
<JinHuiEric.Huang@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
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
ta=3D04%7C01%7COak.Zeng%40amd.com%7C08f51e87e36c4de858bc08d8dd6eb16b%7C3dd8=
961fe4884e608e11a82d994e183d%7C0%7C0%7C637502814793168696%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C1000&sdata=3Dp4iynMPvZGknfSGSyZnXV3kLwScMLbPDB8zVsmxhtk0%3D&reserved=3D0>]



url:    https://github.com/0day-ci/linux/commits/Oak-Zeng/drm-ttm-ioremap-b=
uffer-according-to-TTM-mem-caching-setting/20210302-064500<https://nam11.sa=
felinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2F0day-ci%2F=
linux%2Fcommits%2FOak-Zeng%2Fdrm-ttm-ioremap-buffer-according-to-TTM-mem-ca=
ching-setting%2F20210302-064500&data=3D04%7C01%7COak.Zeng%40amd.com%7C08f51=
e87e36c4de858bc08d8dd6eb16b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63=
7502814793178689%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3D2sc4jZR3bVRF0xDDqNOtUcNR9qi=
JMF2ATmCDAX%2BSWrQ%3D&reserved=3D0>

base:   git://anongit.freedesktop.org/drm-intel for-linux-next

config: parisc-randconfig-r012-20210302 (attached as .config)

compiler: hppa-linux-gcc (GCC) 9.3.0

reproduce (this is a W=3D1 build):

        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross<https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cr=
oss&data=3D04%7C01%7COak.Zeng%40amd.com%7C08f51e87e36c4de858bc08d8dd6eb16b%=
7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637502814793178689%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C1000&sdata=3DuILcLE%2F24bhSU%2Bo5GmWGAK6s6xDFivP6lrm6JgtM50Y%3D&rese=
rved=3D0> -O ~/bin/make.cross

        chmod +x ~/bin/make.cross

        # https://github.com/0day-ci/linux/commit/225bb3711439ec559dd72ae5a=
f8e62d34ea60a64<https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommit%2F225bb3711439ec559dd72ae5af=
8e62d34ea60a64&data=3D04%7C01%7COak.Zeng%40amd.com%7C08f51e87e36c4de858bc08=
d8dd6eb16b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637502814793188685%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C1000&sdata=3D2TOSPuKEMRcZjMfxO9lxgwFxgXwHqERCOgRednI7OE8%=
3D&reserved=3D0>

        git remote add linux-review https://github.com/0day-ci/linux<https:=
//nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2F=
0day-ci%2Flinux&data=3D04%7C01%7COak.Zeng%40amd.com%7C08f51e87e36c4de858bc0=
8d8dd6eb16b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637502814793188685=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&sdata=3DTlXvs5mxH0RV9qQFaUF2B1LZisTWbnt4hfFd2OC7gGw=
%3D&reserved=3D0>

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
%7C08f51e87e36c4de858bc08d8dd6eb16b%7C3dd8961fe4884e608e11a82d994e183d%7C0%=
7C0%7C637502814793198680%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3D8vaxBMiRPv5mgZyKjDn=
sNtzAz%2BDltnzlkUMDMg45%2BrI%3D&reserved=3D0>



_______________________________________________

amd-gfx mailing list

amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>

https://lists.freedesktop.org/mailman/listinfo/amd-gfx<https://nam11.safeli=
nks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.freedesktop.org%2Fmai=
lman%2Flistinfo%2Famd-gfx&data=3D04%7C01%7COak.Zeng%40amd.com%7C08f51e87e36=
c4de858bc08d8dd6eb16b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63750281=
4793198680%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB=
TiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DeRpwM7V33brBQtOxnkAfPTlp383tcA1x5=
5zPPw1W0gA%3D&reserved=3D0>


--_000_DM6PR12MB4732C8CF2FE2642A44B32C9C80999DM6PR12MB4732namp_
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
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}
span.EmailStyle20
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
<p class=3D"MsoNormal">Hi Daniel, Thomas, Dan,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Does below message mean the calling ioremap_cache fa=
iled intel&#8217;s driver build? I can see both ioremap_cache and ioremap_w=
c are defined in arch/x86/mm/ioremap.c &#8211; why ioremap_wc doesn&#8217;t=
 break intel driver&#8217;s build?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Are we supposed to use memremap (offset, size, MEMRE=
MAP_WB) to replace ioremap_cache? When I read here
<a href=3D"https://lwn.net/Articles/653585/">https://lwn.net/Articles/65358=
5/</a> I felt that ioremap_cache returns an address annotated with _iomem w=
hile memremap returns an address without __iomem annotation. In our use cas=
e, GPU memory is treated as UEFI SPM
 (specific purpose memory). I am not very sure whether memremap (thus no __=
iomem annotation) is the right thing to do. What I am sure is, we have test=
ed ioremap_cache and it works fine on AMD system.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I will send out a test patch replacing ioremap_cache=
 with ioremap_wc, to trigger Intel build robot to see whether it fails Inte=
l build. I suppose it will not fail Intel build.<o:p></o:p></p>
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
<b>Sent:</b> Tuesday, March 2, 2021 6:31 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; =
Daniel Vetter &lt;daniel@ffwll.ch&gt;; Dave Airlie &lt;airlied@redhat.com&g=
t;; Thomas Hellstr=F6m (Intel) &lt;thomas_os@shipmail.org&gt;<br>
<b>Cc:</b> Zeng, Oak &lt;Oak.Zeng@amd.com&gt;; kbuild-all@lists.01.org; Kue=
hling, Felix &lt;Felix.Kuehling@amd.com&gt;; Kasiviswanathan, Harish &lt;Ha=
rish.Kasiviswanathan@amd.com&gt;; Deucher, Alexander &lt;Alexander.Deucher@=
amd.com&gt;; Huang, JinHuiEric &lt;JinHuiEric.Huang@amd.com&gt;;
 Koenig, Christian &lt;Christian.Koenig@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/ttm: ioremap buffer according to TTM mem ca=
ching setting<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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
<pre><o:p>&nbsp;</o:p></pre>
<pre>Thank you for the patch! Yet something to improve:<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
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
g%40amd.com%7C08f51e87e36c4de858bc08d8dd6eb16b%7C3dd8961fe4884e608e11a82d99=
4e183d%7C0%7C0%7C637502814793168696%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dp4iy=
nMPvZGknfSGSyZnXV3kLwScMLbPDB8zVsmxhtk0%3D&amp;reserved=3D0">https://git-sc=
m.com/docs/git-format-patch</a>]<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>url:&nbsp;&nbsp;&nbsp; <a href=3D"https://nam11.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommits%2FOa=
k-Zeng%2Fdrm-ttm-ioremap-buffer-according-to-TTM-mem-caching-setting%2F2021=
0302-064500&amp;data=3D04%7C01%7COak.Zeng%40amd.com%7C08f51e87e36c4de858bc0=
8d8dd6eb16b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637502814793178689=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D2sc4jZR3bVRF0xDDqNOtUcNR9qiJMF2ATmCDAX%=
2BSWrQ%3D&amp;reserved=3D0">https://github.com/0day-ci/linux/commits/Oak-Ze=
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
%7COak.Zeng%40amd.com%7C08f51e87e36c4de858bc08d8dd6eb16b%7C3dd8961fe4884e60=
8e11a82d994e183d%7C0%7C0%7C637502814793178689%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd=
ata=3DuILcLE%2F24bhSU%2Bo5GmWGAK6s6xDFivP6lrm6JgtM50Y%3D&amp;reserved=3D0">=
https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross</a=
> -O ~/bin/make.cross<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chmod +x ~/bin/make.cross<o=
:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # <a href=3D"https://nam11.=
safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2F0day-ci%=
2Flinux%2Fcommit%2F225bb3711439ec559dd72ae5af8e62d34ea60a64&amp;data=3D04%7=
C01%7COak.Zeng%40amd.com%7C08f51e87e36c4de858bc08d8dd6eb16b%7C3dd8961fe4884=
e608e11a82d994e183d%7C0%7C0%7C637502814793188685%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3D2TOSPuKEMRcZjMfxO9lxgwFxgXwHqERCOgRednI7OE8%3D&amp;reserved=3D0">h=
ttps://github.com/0day-ci/linux/commit/225bb3711439ec559dd72ae5af8e62d34ea6=
0a64</a><o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git remote add linux-review=
 <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fgithub.com%2F0day-ci%2Flinux&amp;data=3D04%7C01%7COak.Zeng%40amd.com%7=
C08f51e87e36c4de858bc08d8dd6eb16b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C=
0%7C637502814793188685%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DTlXvs5mxH0RV9qQFa=
UF2B1LZisTWbnt4hfFd2OC7gGw%3D&amp;reserved=3D0">https://github.com/0day-ci/=
linux</a><o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git fetch --no-tags linux-r=
eview Oak-Zeng/drm-ttm-ioremap-buffer-according-to-TTM-mem-caching-setting/=
20210302-064500<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git checkout 225bb3711439ec=
559dd72ae5af8e62d34ea60a64<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # save the attached .config=
 to linux build tree<o:p></o:p></pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; COMPILER_INSTALL_PATH=3D$HO=
ME/0day COMPILER=3Dgcc-9.3.0 make.cross ARCH=3Dparisc <o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>If you fix the issue, kindly add following tag as appropriate<o:p></o:=
p></pre>
<pre>Reported-by: kernel test robot <a href=3D"mailto:lkp@intel.com">&lt;lk=
p@intel.com&gt;</a><o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>All errors (new ones prefixed by &gt;&gt;):<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
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
<pre><o:p>&nbsp;</o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>vim +95 drivers/gpu/drm/ttm/ttm_bo_util.c<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
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
<pre><o:p>&nbsp;</o:p></pre>
<pre>---<o:p></o:p></pre>
<pre>0-DAY CI Kernel Test Service, Intel Corporation<o:p></o:p></pre>
<pre><a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;d=
ata=3D04%7C01%7COak.Zeng%40amd.com%7C08f51e87e36c4de858bc08d8dd6eb16b%7C3dd=
8961fe4884e608e11a82d994e183d%7C0%7C0%7C637502814793198680%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C1000&amp;sdata=3D8vaxBMiRPv5mgZyKjDnsNtzAz%2BDltnzlkUMDMg45%2BrI%3D&amp;r=
eserved=3D0">https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org</=
a><o:p></o:p></pre>
<p class=3D"MsoNormal"><br>
<br>
<o:p></o:p></p>
<pre>_______________________________________________<o:p></o:p></pre>
<pre>amd-gfx mailing list<o:p></o:p></pre>
<pre><a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedes=
ktop.org</a><o:p></o:p></pre>
<pre><a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04=
%7C01%7COak.Zeng%40amd.com%7C08f51e87e36c4de858bc08d8dd6eb16b%7C3dd8961fe48=
84e608e11a82d994e183d%7C0%7C0%7C637502814793198680%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;sdata=3DeRpwM7V33brBQtOxnkAfPTlp383tcA1x55zPPw1W0gA%3D&amp;reserved=3D0"=
>https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><o:p></o:p></pre=
>
</blockquote>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_DM6PR12MB4732C8CF2FE2642A44B32C9C80999DM6PR12MB4732namp_--

--===============0745402462==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0745402462==--
