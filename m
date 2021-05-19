Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DFE3899B7
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 01:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B596E30C;
	Wed, 19 May 2021 23:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B967B6E30C;
 Wed, 19 May 2021 23:17:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjtlX7FotgqaWtO7ghN6sLZloRnpWqAgbA+w24bWLcfDcOinqQwj36ayUyJLSHuVnhUKljHa2dFAMK34nxLT/BMuv8t0Wcb5B56yxbNErIKRgAUz90/xXCAancERYQmUUWNl5aKwQvB4PpYmC7kZ2bDXIvWuOCwuHcXc5oSO2HdPfYPANal5OHeOPGadU2Z+NSXLS2RlPQIk+xDedLdYWenTdww8tg7juNxm/+tZmtu7rXj6gP5NmxOJecnW7Tuti1IbeJ/lHYw/xX5fmu4W/mODbUO1vWkS5nxgqOsR0xMlDNvWl3CH3I7GxXrFg7V8BJ6lk0IBUxaEFFa1suR1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAqU7iLXi6+hgESB1IoUetXyOFziNYICpRySjmuiwYE=;
 b=lSB8v/u4CUKgdx/j+vVtlpnSBLrBZ+nXlfAwXoM+du80PDwrPM9Wv9z9ZdM614uJu1IidJBOAodrid74Z0sgZpsu/OeSxDyY9T6eaxLOpnUIg4sFuxLZDIJLQe94BHrg6PvlQz1ofg0RgMzUGob1eG4WYGD+bSrVWjCqlcxbaqH1dLYBxGLla5iUhuYMPKxquzqT9orfiV2qdKihv4ZlcOidd/CKL6hC3g4eHLEh3nAFchdCyNBQ7Vm7JjlMsK/Uax23Lgm8X6vjflf5PEWluSHqHAzPd398OcY5Rsr3F0ns+Yy5IdI6bM0T2+TppPTKzQ0cYwq+CI/rwQdaMIuMTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAqU7iLXi6+hgESB1IoUetXyOFziNYICpRySjmuiwYE=;
 b=ln4f4wrzIpc05IkVRh2+Rns7LhyEJKyOzs3obwges568v0nIlwJkiiJsYrNk3rZzXXaXLDQ7RJ/gF98/yvtL0UJBXOKyQqTe/pXw4mDeJqiXAHzEdaJ7U6rQbYp9M/kwOE6gj2C2/Hl/Hs/hyls8CD2XGTC2dlVR55ubkLs3zs8=
Received: from BYAPR12MB2840.namprd12.prod.outlook.com (2603:10b6:a03:62::32)
 by BYAPR12MB3383.namprd12.prod.outlook.com (2603:10b6:a03:dc::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 23:17:24 +0000
Received: from BYAPR12MB2840.namprd12.prod.outlook.com
 ([fe80::7c65:7181:6d1d:8616]) by BYAPR12MB2840.namprd12.prod.outlook.com
 ([fe80::7c65:7181:6d1d:8616%7]) with mapi id 15.20.4129.031; Wed, 19 May 2021
 23:17:24 +0000
From: "Nieto, David M" <David.Nieto@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 0/7] Per client engine busyness
Thread-Topic: [Intel-gfx] [PATCH 0/7] Per client engine busyness
Thread-Index: AQHXSIY0lKCbwi4zp0q1CiNO36lst6rikGdbgAAOK4CAAF5BAIAAA0mAgAAPFoCAAAKJgIAAAbMAgAACEoCABKvngIAAAHIqgAAYpACAACA2l4AAAtmZgAAQGICAAOwvgIAAAjQAgAAGkQCAAgDigIAAI36AgABQQv8=
Date: Wed, 19 May 2021 23:17:24 +0000
Message-ID: <BYAPR12MB28404674622BAB65A9257D1FF42B9@BYAPR12MB2840.namprd12.prod.outlook.com>
References: <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
 <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
 <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
 <YKJ+F4KqEiQQYkRz@phenom.ffwll.local>
 <BYAPR12MB2840C633CF05C1F29263F5BCF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <c85fc53f-d25b-464c-d411-eed4a509a009@linux.intel.com>
 <BYAPR12MB28409E25DEFD3DD620E596ABF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <BYAPR12MB284090FAC1C6E149F0A1A0ECF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <mysJHURIfWxBRBabIlnunj7LZNkkRQ-Knu_o6v7GZI4xCwGMZXn0rvjscl-aTT_d-ttlAQgJOG3gP95DBd_dxCPQNfguTSdrltxPrKt2FGs=@emersion.fr>
 <7f8fc38a-cd25-aa1f-fa2d-5d3334edb3d2@linux.intel.com>
 <CAPj87rOL7SEVXoH1rWH9ypj7idRmVPLXzmEsdVqFdVjsMh5PbA@mail.gmail.com>
 <71428a10-4b2f-dbbf-7678-7487f9eda6a5@linux.intel.com>
 <c22608a4-b84c-a3a4-0df1-448312b1292e@linux.intel.com>,
 <CAKMK7uF0fHBoYfiTS+-80RtUeuKFUcYDBpGHtNY6Ma+aJmmkxA@mail.gmail.com>
In-Reply-To: <CAKMK7uF0fHBoYfiTS+-80RtUeuKFUcYDBpGHtNY6Ma+aJmmkxA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-05-19T23:17:23.906Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD-Official
 Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.53.104]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65e69d34-b0db-46e0-b3cd-08d91b1c42e0
x-ms-traffictypediagnostic: BYAPR12MB3383:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3383449A19607E8BAD3ED5B4F42B9@BYAPR12MB3383.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S7iL2HQ8E9aT4LwS0l6Q4G7xv4mSGC+emD4LtRejc6GxFe5UyWBnNo6sTGhAhSkvMvTFFR5I9P5VSxJZq9VB87fu2ZPQSw7U10hzcN8J8YwFvGoDntslou60UDZNxoSmkz37w/Zp2g3dQtYjCJXAOyODQo/hhxVuvQl5UA7t9MYl9Y+bGPdeG0+GD4BE831LG3SCZMnjBd2pdX2ViT5ZvToYBWHJ8NgRcidB8nXFGto8Ab6kuPR0xm2aI3Ygr/QW1xGht5/sdfAycm1zEeWSFVlpYy2GT6B8rxRYJ2VCqhY3hcJFkh4FnvrP18fYcPspR+pa4VENH0pPtEcAXOowPKlIXnkjf0p7h+kP5Kzz1CHXCn7SASDInn/FQZXw9WWOL7yP2gWDuykc8ONZY1apptosbIcpppqgnEAy6l9Qokge88YKIFiT+lEbyK7tohtU3pCFRWhz5xqHjscF8SmONMkbOksSYof0MAnrSHF3lG4qEIs4dsCHezpn2sLNCFB1WDxxd97GPY3kugc159+y9vmMWvoZJsYEWWV/aZWf7cy08UuEqZpHM1al1vyL5/JG6CNYugUDLotr9oG89pEYSG/vGN48YNPscrvW8IiJOXK9w8Ca4s/secn6TzF7EZsjPFoKDu9VZbYtAH3RCmuVpt9Jp6RSftXc8Zp4fzUff+K9WPaI5h7pI8dD3oMwPYGC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2840.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39850400004)(136003)(396003)(366004)(52536014)(966005)(186003)(122000001)(26005)(19627405001)(7696005)(6506007)(53546011)(86362001)(5660300002)(8676002)(478600001)(45080400002)(76116006)(38100700002)(4326008)(66946007)(66446008)(66556008)(66476007)(64756008)(71200400001)(9686003)(33656002)(110136005)(83380400001)(166002)(54906003)(8936002)(55016002)(2906002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?XXJEteek8mCij4rTzOQF90snlt07YxBh+l7xRxXV11i6iwQ8e6CLQwHUKDBe?=
 =?us-ascii?Q?45xHUcDbed5QgEL3hVDR4Dt6UOVYCaebfFK8EIkgenLbf6W3vPDrIy0IMuua?=
 =?us-ascii?Q?lXzmTQqW10jOjeKaM6RQ6QGdU4KrzB5tLreIp/9BwyadgxgZQYDjMsFpeDyd?=
 =?us-ascii?Q?bXTjmaAgPuILbB+Z6x9cA/fUQrMSATq3WnTedJe/2dAuxPju1rAb35qlCc4h?=
 =?us-ascii?Q?/rem94IfGojAGbMVQPcCbm7Glgy+PlpujzYfFOcd4GrLoE6a9XyygYdPZOlO?=
 =?us-ascii?Q?LqXKfPr3VwdPHYcU8BDXQ4JOcAHc7qok2FV4YpBbYGhM1/LSOEP58sij3uL9?=
 =?us-ascii?Q?q/J7YrfdDOrvUMOKSCr1fyayiFZHsImlnSby69CBzpThOk5besX4GTDVsjBj?=
 =?us-ascii?Q?otE7pvi4crS4ovesu8UDEWHBLkaQoNAX88bML/Qql7t20hD1AEo+oFw5Ljw3?=
 =?us-ascii?Q?22AfXGzO7aT3wLo7/YaJLUpM9YVDq+R8W2KKlIXrRtV3OHS9pzXJ5WQir97F?=
 =?us-ascii?Q?7HOCkSIYWOGBhzHZuQQrMj+JGWSudII3o/puDArnzAdf4VsKIqAIMTP/44vt?=
 =?us-ascii?Q?wPn467W120V3F0OODYO+TWKmXeb/RqBx7g3PGs49mdYx9BnzGSsgqLeltYRm?=
 =?us-ascii?Q?nUEEVMzgMIgdz4EnFUoXL1CEqCOPjCFg70JwFDJM7VZLgQoaP3VBP2pkxEJh?=
 =?us-ascii?Q?UOyMGu94ZQnVGxakdB2QjSaSIE/ywtAGbKdEsf/VJLCaQ4MMy4/Q/RApgmk1?=
 =?us-ascii?Q?85O/UCkwhOZgCboxi/nueLsNbN+63YXG3OtaGdjrxZbOs+Xs8JCMneEey+4p?=
 =?us-ascii?Q?VYZuaX4Ik2IZuTeZngIOCuKPKfBN9dqkmFnu8L5kcl9bxqZb9JaVL44VCIn4?=
 =?us-ascii?Q?geNU80RkaeFqeQU4UpItOtnqEe5HKFCwrlO5VotYav3WH8Shr9WC0eCGjZQQ?=
 =?us-ascii?Q?9ZTIZyTBeXMlJ4Y5GHB2wfuNxzxVyhAqSa4gdjcKYPHIP+tbynZvhQ/RXVab?=
 =?us-ascii?Q?VZBAmYUV6yXN1MZXRI/kDa3naaU7VEfNq2r4nQTh42ITvEa2qugQ5vLwAUnS?=
 =?us-ascii?Q?R2gh42eYOiHQQB9eUzdA1PN+m7Z4HZdYTxKmwyTa+ZsxFu04MsZllWZqJ4hP?=
 =?us-ascii?Q?ZF0E8W3F2sTsgX0tchBBXfjvsgZ6uX5bKpvA1AGeSLYKFCdra8Yah9aFrViZ?=
 =?us-ascii?Q?S+4LB7YSXn/dnGLpN+4kSindoh+NiqNTvDVkxICiywjvEW1VYM5XXYN+4E8I?=
 =?us-ascii?Q?FPrEnjj/419jj4BpeFARQ+QnGZo05cxoUYDNUUEHwn64AUmjVDcaq1JLIGDY?=
 =?us-ascii?Q?IquSKoam/sHu1ljoOfuU7uie?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB28404674622BAB65A9257D1FF42B9BYAPR12MB2840namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2840.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e69d34-b0db-46e0-b3cd-08d91b1c42e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 23:17:24.3493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wCsXhFNZpW47qZJK+k/XzR64wvNmJrE9CGNAHqckMkrujZM4NpCHg8cDYjzNn95w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3383
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
Cc: "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>,
 "aritger@nvidia.com" <aritger@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR12MB28404674622BAB65A9257D1FF42B9BYAPR12MB2840namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Parsing over 550 processes for fdinfo is taking between 40-100ms single thr=
eaded in a 2GHz skylake IBRS within a VM using simple string comparisons an=
d DIRent parsing. And that is pretty much the worst case scenario with some=
 more optimized implementations.

David
________________________________
From: Daniel Vetter <daniel@ffwll.ch>
Sent: Wednesday, May 19, 2021 11:23 AM
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniel Stone <daniel@fooishbar.org>; jhubbard@nvidia.com <jhubbard@nvid=
ia.com>; nouveau@lists.freedesktop.org <nouveau@lists.freedesktop.org>; Int=
el Graphics Development <Intel-gfx@lists.freedesktop.org>; Maling list - DR=
I developers <dri-devel@lists.freedesktop.org>; Simon Ser <contact@emersion=
.fr>; Koenig, Christian <Christian.Koenig@amd.com>; aritger@nvidia.com <ari=
tger@nvidia.com>; Nieto, David M <David.Nieto@amd.com>
Subject: Re: [Intel-gfx] [PATCH 0/7] Per client engine busyness

On Wed, May 19, 2021 at 6:16 PM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 18/05/2021 10:40, Tvrtko Ursulin wrote:
> >
> > On 18/05/2021 10:16, Daniel Stone wrote:
> >> Hi,
> >>
> >> On Tue, 18 May 2021 at 10:09, Tvrtko Ursulin
> >> <tvrtko.ursulin@linux.intel.com> wrote:
> >>> I was just wondering if stat(2) and a chrdev major check would be a
> >>> solid criteria to more efficiently (compared to parsing the text
> >>> content) detect drm files while walking procfs.
> >>
> >> Maybe I'm missing something, but is the per-PID walk actually a
> >> measurable performance issue rather than just a bit unpleasant?
> >
> > Per pid and per each open fd.
> >
> > As said in the other thread what bothers me a bit in this scheme is tha=
t
> > the cost of obtaining GPU usage scales based on non-GPU criteria.
> >
> > For use case of a top-like tool which shows all processes this is a
> > smaller additional cost, but then for a gpu-top like tool it is somewha=
t
> > higher.
>
> To further expand, not only cost would scale per pid multiplies per open
> fd, but to detect which of the fds are DRM I see these three options:
>
> 1) Open and parse fdinfo.
> 2) Name based matching ie /dev/dri/.. something.
> 3) Stat the symlink target and check for DRM major.

stat with symlink following should be plenty fast.

> All sound quite sub-optimal to me.
>
> Name based matching is probably the least evil on system resource usage
> (Keeping the dentry cache too hot? Too many syscalls?), even though
> fundamentally I don't it is the right approach.
>
> What happens with dup(2) is another question.

We need benchmark numbers showing that on anything remotely realistic
it's an actual problem. Until we've demonstrated it's a real problem
we don't need to solve it.

E.g. top with any sorting enabled also parses way more than it
displays on every update. It seems to be doing Just Fine (tm).

> Does anyone have any feedback on the /proc/<pid>/gpu idea at all?

When we know we have a problem to solve we can take a look at solutions.
-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffw=
ll.ch%2F&amp;data=3D04%7C01%7CDavid.Nieto%40amd.com%7Cf6aea97532cf41f916de0=
8d91af32cc1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637570453997158377=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D4CFrY9qWbJREcIcSzeO9KIn2P%2Fw6k%2BYdNlh=
6rdS%2BEh4%3D&amp;reserved=3D0

--_000_BYAPR12MB28404674622BAB65A9257D1FF42B9BYAPR12MB2840namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:15pt;" al=
ign=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Parsing over 550 processes for fdinfo is taking between 40-100ms single thr=
eaded in a 2GHz skylake IBRS within a VM using simple string comparisons an=
d DIRent parsing. And that is pretty much the worst case&nbsp;scenario with=
 some more optimized implementations.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
David</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Daniel Vetter &lt;dan=
iel@ffwll.ch&gt;<br>
<b>Sent:</b> Wednesday, May 19, 2021 11:23 AM<br>
<b>To:</b> Tvrtko Ursulin &lt;tvrtko.ursulin@linux.intel.com&gt;<br>
<b>Cc:</b> Daniel Stone &lt;daniel@fooishbar.org&gt;; jhubbard@nvidia.com &=
lt;jhubbard@nvidia.com&gt;; nouveau@lists.freedesktop.org &lt;nouveau@lists=
.freedesktop.org&gt;; Intel Graphics Development &lt;Intel-gfx@lists.freede=
sktop.org&gt;; Maling list - DRI developers &lt;dri-devel@lists.freedesktop=
.org&gt;;
 Simon Ser &lt;contact@emersion.fr&gt;; Koenig, Christian &lt;Christian.Koe=
nig@amd.com&gt;; aritger@nvidia.com &lt;aritger@nvidia.com&gt;; Nieto, Davi=
d M &lt;David.Nieto@amd.com&gt;<br>
<b>Subject:</b> Re: [Intel-gfx] [PATCH 0/7] Per client engine busyness</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, May 19, 2021 at 6:16 PM Tvrtko Ursulin<br>
&lt;tvrtko.ursulin@linux.intel.com&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 18/05/2021 10:40, Tvrtko Ursulin wrote:<br>
&gt; &gt;<br>
&gt; &gt; On 18/05/2021 10:16, Daniel Stone wrote:<br>
&gt; &gt;&gt; Hi,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Tue, 18 May 2021 at 10:09, Tvrtko Ursulin<br>
&gt; &gt;&gt; &lt;tvrtko.ursulin@linux.intel.com&gt; wrote:<br>
&gt; &gt;&gt;&gt; I was just wondering if stat(2) and a chrdev major check =
would be a<br>
&gt; &gt;&gt;&gt; solid criteria to more efficiently (compared to parsing t=
he text<br>
&gt; &gt;&gt;&gt; content) detect drm files while walking procfs.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Maybe I'm missing something, but is the per-PID walk actually=
 a<br>
&gt; &gt;&gt; measurable performance issue rather than just a bit unpleasan=
t?<br>
&gt; &gt;<br>
&gt; &gt; Per pid and per each open fd.<br>
&gt; &gt;<br>
&gt; &gt; As said in the other thread what bothers me a bit in this scheme =
is that<br>
&gt; &gt; the cost of obtaining GPU usage scales based on non-GPU criteria.=
<br>
&gt; &gt;<br>
&gt; &gt; For use case of a top-like tool which shows all processes this is=
 a<br>
&gt; &gt; smaller additional cost, but then for a gpu-top like tool it is s=
omewhat<br>
&gt; &gt; higher.<br>
&gt;<br>
&gt; To further expand, not only cost would scale per pid multiplies per op=
en<br>
&gt; fd, but to detect which of the fds are DRM I see these three options:<=
br>
&gt;<br>
&gt; 1) Open and parse fdinfo.<br>
&gt; 2) Name based matching ie /dev/dri/.. something.<br>
&gt; 3) Stat the symlink target and check for DRM major.<br>
<br>
stat with symlink following should be plenty fast.<br>
<br>
&gt; All sound quite sub-optimal to me.<br>
&gt;<br>
&gt; Name based matching is probably the least evil on system resource usag=
e<br>
&gt; (Keeping the dentry cache too hot? Too many syscalls?), even though<br=
>
&gt; fundamentally I don't it is the right approach.<br>
&gt;<br>
&gt; What happens with dup(2) is another question.<br>
<br>
We need benchmark numbers showing that on anything remotely realistic<br>
it's an actual problem. Until we've demonstrated it's a real problem<br>
we don't need to solve it.<br>
<br>
E.g. top with any sorting enabled also parses way more than it<br>
displays on every update. It seems to be doing Just Fine (tm).<br>
<br>
&gt; Does anyone have any feedback on the /proc/&lt;pid&gt;/gpu idea at all=
?<br>
<br>
When we know we have a problem to solve we can take a look at solutions.<br=
>
-Daniel<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F=
%2Fblog.ffwll.ch%2F&amp;amp;data=3D04%7C01%7CDavid.Nieto%40amd.com%7Cf6aea9=
7532cf41f916de08d91af32cc1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637=
570453997158377%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D4CFrY9qWbJREcIcSzeO9=
KIn2P%2Fw6k%2BYdNlh6rdS%2BEh4%3D&amp;amp;reserved=3D0">https://nam11.safeli=
nks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffwll.ch%2F&amp;amp;dat=
a=3D04%7C01%7CDavid.Nieto%40amd.com%7Cf6aea97532cf41f916de08d91af32cc1%7C3d=
d8961fe4884e608e11a82d994e183d%7C0%7C0%7C637570453997158377%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C1000&amp;amp;sdata=3D4CFrY9qWbJREcIcSzeO9KIn2P%2Fw6k%2BYdNlh6rdS%2BEh4%3=
D&amp;amp;reserved=3D0</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BYAPR12MB28404674622BAB65A9257D1FF42B9BYAPR12MB2840namp_--
