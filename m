Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCCD38316C
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC216E99A;
	Mon, 17 May 2021 14:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616406E99A;
 Mon, 17 May 2021 14:39:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqmOSC6syvav9cfY7LsLS4cK3AwmX8c1e/nqyiA5oj/s57zuxciIt8/P5cR1oAzq/30ryCW1f3wY4WHVUK+pdrnyTeWSXdjmuWBeRKy+mqskemuKZRftncax4tscdNVUH+ZVp5P6mTreKlWNnvasv6vMIQpwZf5MIKTTmd5YtZWhPilZWTx3f6kSCowvtZwmaz0JC15m1rFuOPXrumFgYaRZeNJSmWFJJnJj6jfkTU5vQaVqFIXAf/m82dC6xUkqKxHJCG8DTxPIoEMsUgWbzhy44FxHHU7LHmxe8USoYpIWO7pz1ri6Xdi8qn670R5N57oVgdpmCayGOR2zBc+2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yi0okijuYx8iyI6E/wInJJ7kkzsJOHhj6PKgvn+6o7w=;
 b=Veh9F+pmNJvjo5+z43RT5A/ZpCzi3jHCrDsa6lMzoD8qaLBzRz3LhxpZPvQ4TNVY7BLF6tmOJf0/BsYXKcUAgXiWtO/LsBdp4k5Z3XocjKj2OXKybDVXOyuwj982EoqLdwd0Jfek/oPNiEacwv7vJUT3KoIYej07LKLENm7AzmIHlGYIJAabh/WzX/6AFT/lNJXPOFHCJlYejZc43leED936/+hGrImx+8v+OUWZC21nGzPB38PGjInvhZ8GZ3FJZVymx3w2iNvJT85UWX7VXOBt4das1inyACSjpBH89SjoWGGAkOARxKmzJR+0AfHvU3WhuuM3PoFRfbwGyT47aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yi0okijuYx8iyI6E/wInJJ7kkzsJOHhj6PKgvn+6o7w=;
 b=O8KM1ctVtSnTgVIgFYwjM5effuxXqNTrdsCEooQd8oSYrQGq/7dvHBmuypyvAXNFd9u0ToTnDo+dm6xBL2lGGRlDPvVpqGz4ijRUiKS21jCzB2NxTaM5b9yLbNlr7UwB/1ufFpdRUeetoVRbdg36LpObADtRbPeTNsSoekV79OY=
Received: from BYAPR12MB2840.namprd12.prod.outlook.com (2603:10b6:a03:62::32)
 by BY5PR12MB4049.namprd12.prod.outlook.com (2603:10b6:a03:201::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 14:39:04 +0000
Received: from BYAPR12MB2840.namprd12.prod.outlook.com
 ([fe80::7c65:7181:6d1d:8616]) by BYAPR12MB2840.namprd12.prod.outlook.com
 ([fe80::7c65:7181:6d1d:8616%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 14:39:04 +0000
From: "Nieto, David M" <David.Nieto@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH 0/7] Per client engine busyness
Thread-Topic: [PATCH 0/7] Per client engine busyness
Thread-Index: AQHXSIY0lKCbwi4zp0q1CiNO36lst6rikGdbgAAOK4CAAF5BAIAAA0mAgAAPFoCAAAKJgIAAAbMAgAACEoCABKvngIAAAHIq
Date: Mon, 17 May 2021 14:39:04 +0000
Message-ID: <BYAPR12MB2840C633CF05C1F29263F5BCF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
References: <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <CADnq5_N03pz6GmptzhRnCRQH=qkd4eWuAbuUysHp-A9NZHQMHg@mail.gmail.com>
 <BYAPR12MB2840AA68BCAEBD9279C6184FF4509@BYAPR12MB2840.namprd12.prod.outlook.com>
 <39ccc2ef-05d1-d9f0-0639-ea86bef58b80@amd.com>
 <7d6d09fe-ec85-6aaf-9834-37a49ec7d6c5@linux.intel.com>
 <9144f63b-953d-2019-742d-6553e09f5b40@amd.com>
 <22e7d6ea-f2dd-26da-f264-b17aad25af95@linux.intel.com>
 <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
 <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
 <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>,
 <YKJ+F4KqEiQQYkRz@phenom.ffwll.local>
In-Reply-To: <YKJ+F4KqEiQQYkRz@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-05-17T14:32:22.3843139Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-originating-ip: [71.143.192.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d426906a-59af-40a6-413c-08d91941851e
x-ms-traffictypediagnostic: BY5PR12MB4049:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB40495671677FD5FBFB1213F0F42D9@BY5PR12MB4049.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6fN0x/nbq32Bs0GgcY/mCRPdwPw7VGopNSZ/jEzqR+hZy2B3p4PlObI/xzmb19aFD42aEleScrB1/zHYY8yOJG6eh3urOV43aHJunelf+Q2HsCjkquxavqUG7U4dGGcQciCLV3/P8Xzooa9oSdBtrR70KArqGxHz5KlQp6DQXNKvq7f1IosILyQRGKVE819qQYhDrMlIRtDewJErx/k96q9s07cLR+7vVk5vLAgWdu2bo2gXqa8hGT9N3O/ehcFl2TiFKjytNpJc1RZn1jAUAqSIU6sYG1dQ0a9xez0/nGCR3gLNkYelcszhCgszPRy7IjF1n/BCo8ubxECyeCY+BT8LJLnRde9Ns/zQEWtookVs8Dim8JCtKdack3eP1OGVWCL8SIUWXlzRpWUcYsQ5F0mDIUHfGtp1MYp9s2mN1uamr4i034OvD10ITEIoB8h8gqcxWmiiP6mqDqR+v6vQoFrqr5ZBrGPp38IeHR4OYP5AoVje+n/pUcZ9QRJLPpnq/Vr0mXYlf8QE3qK0I+ja2AygXXkR+4VidZJNEMiV0UWK/VKDNi8js1WkXrSfd0iftG+eAxHc6lmsWKai0PpaTdnk2MLd+nP7EzQ1Y5iyyHVQvGH/KT9LBbrNtjDoSTl5ISLZjqiGn5Eq8n+VV1Rg7PRUq6rhjrM4kDr7HzZW04bpN4390CWpHa9bdlCXxo04Y25GX+pzsgqsuO+5Nrtv0RvS+oQ0axJzLUoVJCyz62g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2840.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(346002)(136003)(39850400004)(83380400001)(8936002)(66574015)(52536014)(8676002)(166002)(316002)(66556008)(66476007)(966005)(6506007)(86362001)(6636002)(71200400001)(5660300002)(7696005)(186003)(478600001)(9686003)(64756008)(54906003)(26005)(110136005)(4326008)(2906002)(45080400002)(53546011)(66446008)(76116006)(122000001)(66946007)(33656002)(38100700002)(55016002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?wAUHIWm10Vsy4kPdtqUKZDPxkkj1NH+b+EsBkTVJZnrPNplS4UoKTkkL?=
 =?Windows-1252?Q?61fj1+NdwJi+6JQtQe8MOMdRyE1csmPAaP8UFsR4EAC+AGkzmwBfdDY7?=
 =?Windows-1252?Q?l9SJ3Vlf7y9+JvGhr31cYJHfmfEJHmQZolsdjEMiJsfm2nbBhlznTk8i?=
 =?Windows-1252?Q?Zp9Rs+vmIY4TDO1MvTDLYA263ycJ0NCwDSEh1y6rCGWf0Rck3QCSrSW9?=
 =?Windows-1252?Q?uYGNft8zF0vI8XN5v9CGu0PE1TEMtAcmtVysTwa2Dql6AQ+YG5tXi3YS?=
 =?Windows-1252?Q?tOHuZstznpZZaicJCGQ5+J2HPfRs6BWoTs/yDkEd6p6yjWsCkl0FvhRi?=
 =?Windows-1252?Q?/Gc4TbZ5uqbJA/yrJ/Sy7b7RBUidW1A5j1LIwgXcg0qj5NO1F+TF3Tsw?=
 =?Windows-1252?Q?OK6ymeHSpaMOYajFSao4ITk7SHzyfEeiJ3b02HrOBZqxSnggsP/LTHLA?=
 =?Windows-1252?Q?MjBWaQ3nSR17kAjJzcd7k/0CZlFhEbV5dz2OaXSR5k9O65DwTUZZP5T2?=
 =?Windows-1252?Q?MkSp6fulw3jkryTIbZP7Ugz83y0vDDDxEc1I5No37rwPPVOHusqa0vVc?=
 =?Windows-1252?Q?y/8wDc8nyOS9ZeNbGhWIJsODHDPwBc1RkhbbD1hZlcJFFSlFUyxN84Jr?=
 =?Windows-1252?Q?0dF9D8Hmy6mYiimZLVlygdAXtEqLfv7Gc17bcydZz2Cgqgi9zsboS9mN?=
 =?Windows-1252?Q?6HGFge+rK/ldA77rIXyU9Gtj5M3iYMZ3WvDwlyVK8mdCUi6eYQ7RWHJv?=
 =?Windows-1252?Q?SRsFiUGEXP2V/VsS0X+t0eDKnCRu/wpBrEgZH9RY7CUczJMH1dPAVAwR?=
 =?Windows-1252?Q?M+s3fgKovQEkkoQolR/qd2q03Jw+PYgaIrYrSWQq2My/bOLmWVFpxN5G?=
 =?Windows-1252?Q?mIux+ysmehqt8jK4Zd85VLRaa/JryWXBH5xU3I8x6gEIPerOfeARUKyW?=
 =?Windows-1252?Q?F2pm1x6PgoXPunMd1AhxRDMRu/nkOKYPS6dzS4wwv92A6bh/T4asLfZB?=
 =?Windows-1252?Q?vy2tlFZmTyWnPAK342OOKYWuLCPDBfSi0ElYABDoJhL/4tvvvp460DYi?=
 =?Windows-1252?Q?ViKKgBsUmLZ4Ekhc3+sBbxecmdh5356QZC88mmq2SNNiIjMCzkPKh3Q0?=
 =?Windows-1252?Q?fp/5iXitHkJ01V1QZ9366nLttbGrYWZ4XrWD5J9T08wd9u/gXXSuGiI7?=
 =?Windows-1252?Q?sxmwmc/85FakbrupdKq73RAZmKNg7r7+9qfcSdjtxnkd7oa/WmkIkETn?=
 =?Windows-1252?Q?VkEZbzcRpYtX6oCztGJQhotvGQZ+UWD6ClX1QJYH39drozpPy0J/Ql53?=
 =?Windows-1252?Q?H6ySOqUHMjFTXPH+OLm+P3MQxYSxeFTW+TiZhRnpPrLCyfqOPNT1GdoF?=
 =?Windows-1252?Q?NtwAoNasFlUxVojYhbmEou0DXY7b2DUZMc51px3pBn6gTrtwmgzK00Sb?=
 =?Windows-1252?Q?TF86l20e6H6GLkjMsOpsAw=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB2840C633CF05C1F29263F5BCF42D9BYAPR12MB2840namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2840.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d426906a-59af-40a6-413c-08d91941851e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2021 14:39:04.4897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kJR1lENIXfIXEwFS4gQoZAJWOjaTfVF6If6K/xYUu4tal8U5U1niHxeZsXdLyqNO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4049
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR12MB2840C633CF05C1F29263F5BCF42D9BYAPR12MB2840namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Maybe we could try to standardize how the different submission ring  usage =
gets exposed in the fdinfo? We went the simple way of just adding name and =
index, but if someone has a suggestion on how else we could format them so =
there is commonality across vendors we could just amend those.

I=92d really like to have the process managers tools display GPU usage rega=
rdless of what vendor is installed.

________________________________
From: Daniel Vetter <daniel@ffwll.ch>
Sent: Monday, May 17, 2021 7:30:47 AM
To: Koenig, Christian <Christian.Koenig@amd.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; Nieto, David M <David.=
Nieto@amd.com>; Alex Deucher <alexdeucher@gmail.com>; Intel Graphics Develo=
pment <Intel-gfx@lists.freedesktop.org>; Maling list - DRI developers <dri-=
devel@lists.freedesktop.org>; Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/7] Per client engine busyness

On Fri, May 14, 2021 at 05:10:29PM +0200, Christian K=F6nig wrote:
> Am 14.05.21 um 17:03 schrieb Tvrtko Ursulin:
> >
> > On 14/05/2021 15:56, Christian K=F6nig wrote:
> > > Am 14.05.21 um 16:47 schrieb Tvrtko Ursulin:
> > > >
> > > > On 14/05/2021 14:53, Christian K=F6nig wrote:
> > > > > >
> > > > > > David also said that you considered sysfs but were wary
> > > > > > of exposing process info in there. To clarify, my patch
> > > > > > is not exposing sysfs entry per process, but one per
> > > > > > open drm fd.
> > > > > >
> > > > >
> > > > > Yes, we discussed this as well, but then rejected the approach.
> > > > >
> > > > > To have useful information related to the open drm fd you
> > > > > need to related that to process(es) which have that file
> > > > > descriptor open. Just tracking who opened it first like DRM
> > > > > does is pretty useless on modern systems.
> > > >
> > > > We do update the pid/name for fds passed over unix sockets.
> > >
> > > Well I just double checked and that is not correct.
> > >
> > > Could be that i915 has some special code for that, but on my laptop
> > > I only see the X server under the "clients" debugfs file.
> >
> > Yes we have special code in i915 for this. Part of this series we are
> > discussing here.
>
> Ah, yeah you should mention that. Could we please separate that into comm=
on
> code instead? Cause I really see that as a bug in the current handling
> independent of the discussion here.
>
> As far as I know all IOCTLs go though some common place in DRM anyway.

Yeah, might be good to fix that confusion in debugfs. But since that's
non-uapi, I guess no one ever cared (enough).

> > > > > But an "lsof /dev/dri/renderD128" for example does exactly
> > > > > what top does as well, it iterates over /proc and sees which
> > > > > process has that file open.
> > > >
> > > > Lsof is quite inefficient for this use case. It has to open
> > > > _all_ open files for _all_ processes on the system to find a
> > > > handful of ones which may have the DRM device open.
> > >
> > > Completely agree.
> > >
> > > The key point is you either need to have all references to an open
> > > fd, or at least track whoever last used that fd.
> > >
> > > At least the last time I looked even the fs layer didn't know which
> > > fd is open by which process. So there wasn't really any alternative
> > > to the lsof approach.
> >
> > I asked you about the use case you have in mind which you did not
> > answer. Otherwise I don't understand when do you need to walk all files=
.
> > What information you want to get?
>
> Per fd debugging information, e.g. instead of the top use case you know
> which process you want to look at.
>
> >
> > For the use case of knowing which DRM file is using how much GPU time o=
n
> > engine X we do not need to walk all open files either with my sysfs
> > approach or the proc approach from Chris. (In the former case we
> > optionally aggregate by PID at presentation time, and in the latter cas=
e
> > aggregation is implicit.)
>
> I'm unsure if we should go with the sysfs, proc or some completely differ=
ent
> approach.
>
> In general it would be nice to have a way to find all the fd references f=
or
> an open inode.

Yeah, but that maybe needs to be an ioctl or syscall or something on the
inode, that givey you a list of (procfd, fd_nr) pairs pointing back at all
open files? If this really is a real world problem, but given that
top/lsof and everyone else hasn't asked for it yet maybe it's not.

Also I replied in some other thread, I really like the fdinfo stuff, and I
think trying to somewhat standardized this across drivers would be neat.
Especially since i915 is going to adopt drm/scheduler for front-end
scheduling too, so at least some of this should be fairly easy to share.

Cheers, Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffw=
ll.ch%2F&amp;data=3D04%7C01%7CDavid.Nieto%40amd.com%7C3711fdd207484d6bb5fd0=
8d919405eb0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637568586536251118=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dso13elRn0Ffl7w51QEk%2F%2FXmxOav9n5p6fNX=
rnDBVY%2B0%3D&amp;reserved=3D0

--_000_BYAPR12MB2840C633CF05C1F29263F5BCF42D9BYAPR12MB2840namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:15pt;" al=
ign=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div dir=3D"ltr">
<div></div>
<div>
<div>Maybe we could try to standardize how the different submission ring &n=
bsp;usage gets exposed in the fdinfo? We went the simple way of just adding=
 name and index, but if someone has a suggestion on how else we could forma=
t them so there is commonality across
 vendors we could just amend those.</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">I=92d really like to have the process managers tools displ=
ay GPU usage regardless of what vendor is installed.</div>
<div><br>
</div>
<div class=3D"ms-outlook-ios-signature"></div>
</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Daniel Vetter &lt;dan=
iel@ffwll.ch&gt;<br>
<b>Sent:</b> Monday, May 17, 2021 7:30:47 AM<br>
<b>To:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;<br>
<b>Cc:</b> Tvrtko Ursulin &lt;tvrtko.ursulin@linux.intel.com&gt;; Nieto, Da=
vid M &lt;David.Nieto@amd.com&gt;; Alex Deucher &lt;alexdeucher@gmail.com&g=
t;; Intel Graphics Development &lt;Intel-gfx@lists.freedesktop.org&gt;; Mal=
ing list - DRI developers &lt;dri-devel@lists.freedesktop.org&gt;;
 Daniel Vetter &lt;daniel@ffwll.ch&gt;<br>
<b>Subject:</b> Re: [PATCH 0/7] Per client engine busyness</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri, May 14, 2021 at 05:10:29PM +0200, Christia=
n K=F6nig wrote:<br>
&gt; Am 14.05.21 um 17:03 schrieb Tvrtko Ursulin:<br>
&gt; &gt; <br>
&gt; &gt; On 14/05/2021 15:56, Christian K=F6nig wrote:<br>
&gt; &gt; &gt; Am 14.05.21 um 16:47 schrieb Tvrtko Ursulin:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; On 14/05/2021 14:53, Christian K=F6nig wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; David also said that you considered sysfs but=
 were wary<br>
&gt; &gt; &gt; &gt; &gt; &gt; of exposing process info in there. To clarify=
, my patch<br>
&gt; &gt; &gt; &gt; &gt; &gt; is not exposing sysfs entry per process, but =
one per<br>
&gt; &gt; &gt; &gt; &gt; &gt; open drm fd.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Yes, we discussed this as well, but then rejected =
the approach.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; To have useful information related to the open drm=
 fd you<br>
&gt; &gt; &gt; &gt; &gt; need to related that to process(es) which have tha=
t file<br>
&gt; &gt; &gt; &gt; &gt; descriptor open. Just tracking who opened it first=
 like DRM<br>
&gt; &gt; &gt; &gt; &gt; does is pretty useless on modern systems.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; We do update the pid/name for fds passed over unix sock=
ets.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Well I just double checked and that is not correct.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Could be that i915 has some special code for that, but on my=
 laptop<br>
&gt; &gt; &gt; I only see the X server under the &quot;clients&quot; debugf=
s file.<br>
&gt; &gt; <br>
&gt; &gt; Yes we have special code in i915 for this. Part of this series we=
 are<br>
&gt; &gt; discussing here.<br>
&gt; <br>
&gt; Ah, yeah you should mention that. Could we please separate that into c=
ommon<br>
&gt; code instead? Cause I really see that as a bug in the current handling=
<br>
&gt; independent of the discussion here.<br>
&gt; <br>
&gt; As far as I know all IOCTLs go though some common place in DRM anyway.=
<br>
<br>
Yeah, might be good to fix that confusion in debugfs. But since that's<br>
non-uapi, I guess no one ever cared (enough).<br>
<br>
&gt; &gt; &gt; &gt; &gt; But an &quot;lsof /dev/dri/renderD128&quot; for ex=
ample does exactly<br>
&gt; &gt; &gt; &gt; &gt; what top does as well, it iterates over /proc and =
sees which<br>
&gt; &gt; &gt; &gt; &gt; process has that file open.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Lsof is quite inefficient for this use case. It has to =
open<br>
&gt; &gt; &gt; &gt; _all_ open files for _all_ processes on the system to f=
ind a<br>
&gt; &gt; &gt; &gt; handful of ones which may have the DRM device open.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Completely agree.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The key point is you either need to have all references to a=
n open<br>
&gt; &gt; &gt; fd, or at least track whoever last used that fd.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; At least the last time I looked even the fs layer didn't kno=
w which<br>
&gt; &gt; &gt; fd is open by which process. So there wasn't really any alte=
rnative<br>
&gt; &gt; &gt; to the lsof approach.<br>
&gt; &gt; <br>
&gt; &gt; I asked you about the use case you have in mind which you did not=
<br>
&gt; &gt; answer. Otherwise I don't understand when do you need to walk all=
 files.<br>
&gt; &gt; What information you want to get?<br>
&gt; <br>
&gt; Per fd debugging information, e.g. instead of the top use case you kno=
w<br>
&gt; which process you want to look at.<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; For the use case of knowing which DRM file is using how much GPU =
time on<br>
&gt; &gt; engine X we do not need to walk all open files either with my sys=
fs<br>
&gt; &gt; approach or the proc approach from Chris. (In the former case we<=
br>
&gt; &gt; optionally aggregate by PID at presentation time, and in the latt=
er case<br>
&gt; &gt; aggregation is implicit.)<br>
&gt; <br>
&gt; I'm unsure if we should go with the sysfs, proc or some completely dif=
ferent<br>
&gt; approach.<br>
&gt; <br>
&gt; In general it would be nice to have a way to find all the fd reference=
s for<br>
&gt; an open inode.<br>
<br>
Yeah, but that maybe needs to be an ioctl or syscall or something on the<br=
>
inode, that givey you a list of (procfd, fd_nr) pairs pointing back at all<=
br>
open files? If this really is a real world problem, but given that<br>
top/lsof and everyone else hasn't asked for it yet maybe it's not.<br>
<br>
Also I replied in some other thread, I really like the fdinfo stuff, and I<=
br>
think trying to somewhat standardized this across drivers would be neat.<br=
>
Especially since i915 is going to adopt drm/scheduler for front-end<br>
scheduling too, so at least some of this should be fairly easy to share.<br=
>
<br>
Cheers, Daniel<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F=
%2Fblog.ffwll.ch%2F&amp;amp;data=3D04%7C01%7CDavid.Nieto%40amd.com%7C3711fd=
d207484d6bb5fd08d919405eb0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637=
568586536251118%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3Dso13elRn0Ffl7w51QEk%=
2F%2FXmxOav9n5p6fNXrnDBVY%2B0%3D&amp;amp;reserved=3D0">https://nam11.safeli=
nks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffwll.ch%2F&amp;amp;dat=
a=3D04%7C01%7CDavid.Nieto%40amd.com%7C3711fdd207484d6bb5fd08d919405eb0%7C3d=
d8961fe4884e608e11a82d994e183d%7C0%7C0%7C637568586536251118%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C1000&amp;amp;sdata=3Dso13elRn0Ffl7w51QEk%2F%2FXmxOav9n5p6fNXrnDBVY%2B0%3=
D&amp;amp;reserved=3D0</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BYAPR12MB2840C633CF05C1F29263F5BCF42D9BYAPR12MB2840namp_--
