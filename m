Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3E6383C14
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 20:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAC06EA2E;
	Mon, 17 May 2021 18:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EDD6E13A;
 Mon, 17 May 2021 18:17:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NC8oHznZ8HU7Cbuy/+d9LZvBgNDwGJDqSoZm5W0kDZpq4adyOsFtJtXwCqcTLWFDdmpJNPQkdahzMVJRa8sZ/NV7Htp5b102G2mCw63NhyXANyadwv+fBHqWgjxJ8vRSbBqsjOMsl/BJh71Wm7FhgwwuTsnN0/5OaGXu5Xnsg01EJYNlfN7pUGdRHMeuN9KWg2lZAgcfg46ChJ/7vQdety2U7KOSal+uWyhSiu0SneWE2m+lqRpXsNKqMn3V9ZqZTGJF4KgsTFIZWtYGv9/CzMsRFbNJeq381wadt8ubR5Yfbbs2h1oLlSBohDPaD03lIBP1/SJ6FR881Cl0xSLjTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yJMnX2efGqdj0uGRN5WkZNfTpz66IpOg3AhLm06Tf8=;
 b=ZRNaQkD47svtaI2p//r5Z8FHf5AoTYpMNLhE4iTA6JH35RCexNXkcvCylhjs7afd/CfQPNNQ5S3Y18n/g158z5zOentvHHZeE4GunbXJLLiVi8an4jmGNH+82d75SZPXVrZw8nWEa/ygucU2pdNCujkrpBH1F3CJaM70KfVxlTeJ/tb8vCUAO7ejhB9lZhh2hfkj3xl5ouZFh9N5CWeOkMn/049o/L7v397a9O4r8ssYreTtIEd9ZX+BAGX2P09fBMKv5KvGfjJTWaceVJHd+axkDElZrHMiOcnCy9feUJqY0++PrgRXSSV/+eMFNsGFlfbbWXFe4LTVKtYGFPWJVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yJMnX2efGqdj0uGRN5WkZNfTpz66IpOg3AhLm06Tf8=;
 b=PgTj4W59eGWsqY4pIhxgLBTTp7T19oegv8AkXTFhjAhCI+haZSTJeDXdeDXAJV/Bvkp9kzFZfqHpv8E4XORPj25Hw/FMcf59fXx8tML96mh8jd1rJ0k3Jiwl+7Kv97iFz9O3n5Y+sdDK/QX6AUCpx/Ij8SCobtFJRh1hMHRvhHU=
Received: from BYAPR12MB2840.namprd12.prod.outlook.com (2603:10b6:a03:62::32)
 by BY5PR12MB4887.namprd12.prod.outlook.com (2603:10b6:a03:1c6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Mon, 17 May
 2021 18:16:58 +0000
Received: from BYAPR12MB2840.namprd12.prod.outlook.com
 ([fe80::7c65:7181:6d1d:8616]) by BYAPR12MB2840.namprd12.prod.outlook.com
 ([fe80::7c65:7181:6d1d:8616%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 18:16:58 +0000
From: "Nieto, David M" <David.Nieto@amd.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Daniel Vetter
 <daniel@ffwll.ch>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "aritger@nvidia.com"
 <aritger@nvidia.com>
Subject: Re: [PATCH 0/7] Per client engine busyness
Thread-Topic: [PATCH 0/7] Per client engine busyness
Thread-Index: AQHXSIY0lKCbwi4zp0q1CiNO36lst6rikGdbgAAOK4CAAF5BAIAAA0mAgAAPFoCAAAKJgIAAAbMAgAACEoCABKvngIAAAHIqgAAYpACAACA2l4AAAtmZ
Date: Mon, 17 May 2021 18:16:58 +0000
Message-ID: <BYAPR12MB284090FAC1C6E149F0A1A0ECF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
References: <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <CADnq5_N03pz6GmptzhRnCRQH=qkd4eWuAbuUysHp-A9NZHQMHg@mail.gmail.com>
 <BYAPR12MB2840AA68BCAEBD9279C6184FF4509@BYAPR12MB2840.namprd12.prod.outlook.com>
 <39ccc2ef-05d1-d9f0-0639-ea86bef58b80@amd.com>
 <7d6d09fe-ec85-6aaf-9834-37a49ec7d6c5@linux.intel.com>
 <9144f63b-953d-2019-742d-6553e09f5b40@amd.com>
 <22e7d6ea-f2dd-26da-f264-b17aad25af95@linux.intel.com>
 <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
 <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
 <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
 <YKJ+F4KqEiQQYkRz@phenom.ffwll.local>
 <BYAPR12MB2840C633CF05C1F29263F5BCF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>,
 <c85fc53f-d25b-464c-d411-eed4a509a009@linux.intel.com>,
 <BYAPR12MB28409E25DEFD3DD620E596ABF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB28409E25DEFD3DD620E596ABF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-05-17T18:16:58.383Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [71.143.192.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4c1c21c-9c9c-4329-8747-08d9195ff5f8
x-ms-traffictypediagnostic: BY5PR12MB4887:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB488753798B921FEDAB74D118F42D9@BY5PR12MB4887.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eKd0o3zNWaAmJ/omqJd8i+M6kd1/cxq8+QQcFkTs83FkDN78HiqQXVzps3dcV3lrY22oJI6eLn0oQYk0X7kPNFNExtvIZRfdeZcZswzOKof7qAv6rTMpVox+HQf7jvsRbn37z5RXMtI16+VBbJ8DKhzwxhlLLLykAbbxMxDMChGayZSJsgWQBJ6e+SFKtFq60c+RiCZeNke4pmlxYePsPeJ8xhKdw+Dmo12Cl53JophxhADxpYayqXtqeb0oO3yG2bR4JwJ9/MfRtfrr+1cFG8gFyrxSAyA06ah+I/Z3SvzuekFjRueNC4Unpr1/YOCBSGcArZUW3VOFEO+d/o4u5AVEbkwwZuCG11OG4xmBjbrZ/U9agjmKws56UWEROga+15A3XErWwoQ96S6d6FY89D4YiMGWwMRGbgiMhEtBARgof2syWu8Q89SW4iMuSXmO/L0zJQyrSw36i3K3wBGIJ5fe7QeC88rWw4k0dRn4lyp00gNQ+lBKEG6T78YKEpARRJLymqc6brCjpxVQ6mshJR1xOzvAP/wPczbngp4lyx9S2qSj6CGxe5iPiZ9WDfVynuJnUGPgxtxf5aIOgi1kuXgWK3DiL3q8qRX9fR2GervefWTaZckII/MGutlHdE23gIQUtwST8poLuz21Tu8WyNwrLPHXmClWc8laJJpZc1Gg4xc9gCRxldwicXUB7kWc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2840.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(8936002)(8676002)(26005)(55016002)(9686003)(64756008)(66556008)(66476007)(2940100002)(83380400001)(166002)(76116006)(66946007)(478600001)(2906002)(38100700002)(122000001)(19627405001)(86362001)(4326008)(53546011)(6506007)(110136005)(54906003)(5660300002)(966005)(186003)(316002)(52536014)(33656002)(66446008)(21615005)(71200400001)(7696005)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?uyE+ZU88OHGfVGjkajtz4H84G3kOUSXqXsAvjqa6Qylvxuhe8c3gCORE?=
 =?Windows-1252?Q?6RE9ozjO1/p5pdTNVZ59S6KA8FE4pHwSWCkO8BbiKkB5zNN2Rma+5Q1I?=
 =?Windows-1252?Q?y3b6oyxAFpyPy96dgRRmcr2ht8ax7y4XClIXeC/4SXkhEgNS3VQsfyIT?=
 =?Windows-1252?Q?IB8wW2p825sLj+cpq2JiD61iQ0w7ZsRfiX6pn6HOTd5R/LLA/H93ZErP?=
 =?Windows-1252?Q?2kMb/xvjlqRhlxouh7wkxPOQPvbsQZI2lk0IfLJoiYiqWyWZzg54miA1?=
 =?Windows-1252?Q?zutf3/dwkpa/ebSli2GPH1Vt/hY+Q0ujTb8ZC/RoLN8airZmjosK2Jwz?=
 =?Windows-1252?Q?xmCHevjnkS5rt89kO+XFQWDdLP8e/HNh0aAJdftuc1Gqgr7QCVXUkVQT?=
 =?Windows-1252?Q?+swiPAfQsZOxmuYR5WqFYIPiXS+re4Xjz0mu4DgTsqr5324Zre73nqbT?=
 =?Windows-1252?Q?lqInLYSnwTl0UXADIzLpSwkiXRxM5OEW/MXi5KY6K90+9yDNdaJ9rkvx?=
 =?Windows-1252?Q?YM6GxLVNBXX8C3hqMkHPZuOPTLTqr6rgRp4ooKMaKmB0QHmxReFMh03R?=
 =?Windows-1252?Q?AYl9kj6qjfx0OI8/Wi+nvO8HPjxToaV6jW8dxYLp3t8WcBmEnOEcPAN+?=
 =?Windows-1252?Q?OmUvaRDLdFgLHDtxhKIPlPJy3+Cfcr9n/Y/p/GcI7oZ6BzwDU0xA6tfB?=
 =?Windows-1252?Q?wcV7cRViL8D4E/MwhQkSWviXoz9Bb71pDfjg3dDFHAOuNRVITdiB5Sw3?=
 =?Windows-1252?Q?2gDMTlts+/51Nhf3HpgR5e5fd0RG9NhDx4ihH0xhWq7/VKOodqeDwk9H?=
 =?Windows-1252?Q?JQpjlUxginiT+o1ooXacHMPFvbEx3GlMXQoGsLEWcM1KH4vXCa07M4rZ?=
 =?Windows-1252?Q?8zyDR+sC0u7unN0Lmj5mFvmXh8d1SCzqy6wBzOdYN5QGxV0bkzP70dR3?=
 =?Windows-1252?Q?6i4iLEc/vDwqzEXkW5zECyiQpTb0Cjlq1CRljgBGKA41QH//xn8R+eij?=
 =?Windows-1252?Q?4ByHgCl0hH7HMFavw4SwK1R2qL8mTaeau8LDbu2tHoPKjJ7SqjKA9fXa?=
 =?Windows-1252?Q?wKPWA7AHyTWbEvrrvWPhfNZo2YLSxANT1gnPgu048oqTbz9TnrXYBKur?=
 =?Windows-1252?Q?jmyqPKz7WoKpkCAX0iS8AZG404Kx8kXSQPtiMfY83FyAQiIRpq1Z3gJp?=
 =?Windows-1252?Q?PdfqcULbIaPcDbT/tpNJn77fod3fv2M2HIP37IxMSwiII+ShKUW/qOz+?=
 =?Windows-1252?Q?OarEL9FwLYTnsJBfRvcp5egTk8mWaFPxrj2xzXHR9mCxsPwjahR0rEeb?=
 =?Windows-1252?Q?qDC3PmIIkHQ58XxPFOsEIMpEL0TVWywxuccB6mY+H8Em6pjkKtFC9vLH?=
 =?Windows-1252?Q?qF7dITs0uFlRY7ooliX4sszGhs94VqP3pw0=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB284090FAC1C6E149F0A1A0ECF42D9BYAPR12MB2840namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2840.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c1c21c-9c9c-4329-8747-08d9195ff5f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2021 18:16:58.7579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kkmk7qABcfkmaDZaq7cac14qVuDO5oLq/Q+NCCeWEgvRXQObv53PegYJUZM0pPP8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4887
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR12MB284090FAC1C6E149F0A1A0ECF42D9BYAPR12MB2840namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

[Public]

Cycling some of the Nvidia/nouveau guys here too.

I think there is a benefit on trying to estandarize how fdinfo can be used =
to expose per engine and device memory utilization.

Another of the advantages of going the /proc/ way instead of the sysfs debu=
gfs approach is that you inherit the access lists directly from the distrib=
ution and you don't need to start messing with ownership and group access. =
By default an user can monitor its own processes as long as /proc is mounte=
d.

I am not saying that fdinfo or the way we implemented is 100% the way to go=
, but I'd rather have a solution within the confines of proc first.

David



________________________________
From: Nieto, David M <David.Nieto@amd.com>
Sent: Monday, May 17, 2021 11:02 AM
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; Daniel Vetter <daniel@=
ffwll.ch>; Koenig, Christian <Christian.Koenig@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>; Intel Graphics Development <Intel=
-gfx@lists.freedesktop.org>; Maling list - DRI developers <dri-devel@lists.=
freedesktop.org>
Subject: Re: [PATCH 0/7] Per client engine busyness

The format is simple:

<ringname><index>: <XXX.XX> %

we also have entries for the memory mapped:
mem <ttm pool> : <size> KiB

On my submission https://lists.freedesktop.org/archives/amd-gfx/2021-May/06=
3149.html I added a python script to print out the info. It has a CPU usage=
 lower that top, for example.

To be absolutely honest, I agree that there is an overhead, but It might no=
t be as much as you fear.
________________________________
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Sent: Monday, May 17, 2021 9:00 AM
To: Nieto, David M <David.Nieto@amd.com>; Daniel Vetter <daniel@ffwll.ch>; =
Koenig, Christian <Christian.Koenig@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>; Intel Graphics Development <Intel=
-gfx@lists.freedesktop.org>; Maling list - DRI developers <dri-devel@lists.=
freedesktop.org>
Subject: Re: [PATCH 0/7] Per client engine busyness


On 17/05/2021 15:39, Nieto, David M wrote:
> [AMD Official Use Only]
>
>
> Maybe we could try to standardize how the different submission ring
>   usage gets exposed in the fdinfo? We went the simple way of just
> adding name and index, but if someone has a suggestion on how else we
> could format them so there is commonality across vendors we could just
> amend those.

Could you paste an example of your format?

Standardized fdinfo sounds good to me in principle. But I would also
like people to look at the procfs proposal from Chris,
  - link to which I have pasted elsewhere in the thread.

Only potential issue with fdinfo I see at the moment is a bit of an
extra cost in DRM client discovery (compared to my sysfs series and also
procfs RFC from Chris). It would require reading all processes (well
threads, then maybe aggregating threads into parent processes), all fd
symlinks, and doing a stat on them to figure out which ones are DRM devices=
.

Btw is DRM_MAJOR 226 consider uapi? I don't see it in uapi headers.

> I=92d really like to have the process managers tools display GPU usage
> regardless of what vendor is installed.

Definitely.

Regards,

Tvrtko

--_000_BYAPR12MB284090FAC1C6E149F0A1A0ECF42D9BYAPR12MB2840namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
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
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Cycling some of the Nvidia/nouveau guys here too.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
I think there is a benefit on trying to estandarize how fdinfo can be used =
to expose per engine and device memory utilization.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Another of the advantages of going the /proc/ way instead of the sysfs debu=
gfs approach is that you inherit the access lists directly from the distrib=
ution and you don't need to start messing with ownership and group access. =
By default an user can monitor its
 own processes as long as /proc is mounted.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
I am not saying that fdinfo or the way we implemented is 100% the way to go=
, but I'd rather have a solution within the confines of proc first.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
David</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size: 11pt;"><b>From:</b> Nieto, David M &lt;=
David.Nieto@amd.com&gt;<br>
<b>Sent:</b> Monday, May 17, 2021 11:02 AM<br>
<b>To:</b> Tvrtko Ursulin &lt;tvrtko.ursulin@linux.intel.com&gt;; Daniel Ve=
tter &lt;daniel@ffwll.ch&gt;; Koenig, Christian &lt;Christian.Koenig@amd.co=
m&gt;<br>
<b>Cc:</b> Alex Deucher &lt;alexdeucher@gmail.com&gt;; Intel Graphics Devel=
opment &lt;Intel-gfx@lists.freedesktop.org&gt;; Maling list - DRI developer=
s &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH 0/7] Per client engine busyness</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
The format is simple:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt">&lt;ringname&gt;&lt;index&gt;: &lt;XXX.XX&gt; %</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
we also have entries for the memory mapped:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
mem &lt;ttm pool&gt; : &lt;size&gt; KiB</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
On my submission&nbsp;<a href=3D"https://lists.freedesktop.org/archives/amd=
-gfx/2021-May/063149.html" id=3D"LPlnk856153">https://lists.freedesktop.org=
/archives/amd-gfx/2021-May/063149.html</a>&nbsp;I added a python script to =
print out the info. It has a CPU usage lower that
 top, for example.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
To be absolutely honest, I agree that there is an overhead, but It might no=
t be as much as you fear.</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size: 11pt;"><b>From:</b> Tvrtko Ursulin &l=
t;tvrtko.ursulin@linux.intel.com&gt;<br>
<b>Sent:</b> Monday, May 17, 2021 9:00 AM<br>
<b>To:</b> Nieto, David M &lt;David.Nieto@amd.com&gt;; Daniel Vetter &lt;da=
niel@ffwll.ch&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;<br>
<b>Cc:</b> Alex Deucher &lt;alexdeucher@gmail.com&gt;; Intel Graphics Devel=
opment &lt;Intel-gfx@lists.freedesktop.org&gt;; Maling list - DRI developer=
s &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH 0/7] Per client engine busyness</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText"><br>
On 17/05/2021 15:39, Nieto, David M wrote:<br>
&gt; [AMD Official Use Only]<br>
&gt; <br>
&gt; <br>
&gt; Maybe we could try to standardize how the different submission ring <b=
r>
&gt;&nbsp; &nbsp;usage gets exposed in the fdinfo? We went the simple way o=
f just <br>
&gt; adding name and index, but if someone has a suggestion on how else we =
<br>
&gt; could format them so there is commonality across vendors we could just=
 <br>
&gt; amend those.<br>
<br>
Could you paste an example of your format?<br>
<br>
Standardized fdinfo sounds good to me in principle. But I would also <br>
like people to look at the procfs proposal from Chris,<br>
&nbsp; - link to which I have pasted elsewhere in the thread.<br>
<br>
Only potential issue with fdinfo I see at the moment is a bit of an <br>
extra cost in DRM client discovery (compared to my sysfs series and also <b=
r>
procfs RFC from Chris). It would require reading all processes (well <br>
threads, then maybe aggregating threads into parent processes), all fd <br>
symlinks, and doing a stat on them to figure out which ones are DRM devices=
.<br>
<br>
Btw is DRM_MAJOR 226 consider uapi? I don't see it in uapi headers.<br>
<br>
&gt; I=92d really like to have the process managers tools display GPU usage=
 <br>
&gt; regardless of what vendor is installed.<br>
<br>
Definitely.<br>
<br>
Regards,<br>
<br>
Tvrtko<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_BYAPR12MB284090FAC1C6E149F0A1A0ECF42D9BYAPR12MB2840namp_--
