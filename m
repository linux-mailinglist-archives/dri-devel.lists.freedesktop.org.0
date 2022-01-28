Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD2649FE80
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 17:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8E710EEA3;
	Fri, 28 Jan 2022 16:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4AF10ED6E;
 Fri, 28 Jan 2022 16:57:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFReygX9L6/Gn6P/fHksh3cpZf3ZH4tBX1iC0RqXNd190t3mapkIJ3IUV8EDva4ythhfPcvgva05MSssJ+/quaOVTwFhkjMw8IDhegmJJnHBeB+oJV7HiTSGR3mWum1ITxDmsGInu5WTDPFXusAVL8RimDwOcKl0QipP7QNBa4UH/lkmQgM44cPv9Ve9GjyzXRgndiAOuG/hW2iRmjl+JnWUo1yJdKISDjkFm4VCueRxwwO54xjHKrMa0x+N4PYbo021HrkcN4f4IllP2WiEMRlU13Gqp4XLGdK9NaljlgiWCf2hp8b/ISyIVgiTEOQhB9ZAtgMIOdQur+CxezYw7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuDK00FoF4emyfjsr/+kVLxXsjtN4i7T0gkevF3dMrE=;
 b=LQVr7hSNiYocZVMOB0elmcaGoJh8tURg0MEe7E0QTEDK78RyrxnW/g8IE3FSM1INb6g4FW18hYp4rz0qPXvE/kZYaW9B08fDJZw2u8Ecm3/8/6DpfS14RtqSrQnX7k6/6989C1k/HS+ciBsTDP+MKikH7+JazuSbRTyaPEW4C81kND8yuK9ELIeoADMPsp12xRpszqU+FXLcLg8x4fY0VYzJp8RLSIUeAhzrg/oATRAr2aryB2Z6SULD/jtbXpf3gBVn9rxBY3A7xcrT2YnoUgqhaY8yKfXhBw2tlwwLjd+YffEw9dCUnNhabLxhSxYVV28jzzcS+kYZ7XqeQAWNWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuDK00FoF4emyfjsr/+kVLxXsjtN4i7T0gkevF3dMrE=;
 b=sySQxg/jp6kl9qKYuvo9njfoOP3jdIGvQadiMuF5DJc70tEvfou631+yoiG/A29o9Zyx3OEdfVfY0+GezobxjMtg3C3n0IzLiTu3ac+iF6Uw5xzdIoZV3nzLK0F6Bnume948tJhNS8ecgeE3Ttrue0ixudDQqWltUIU/pCFI/bI=
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by CH0PR12MB5299.namprd12.prod.outlook.com (2603:10b6:610:d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 28 Jan
 2022 16:57:52 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3%11]) with mapi id 15.20.4909.019; Fri, 28 Jan 2022
 16:57:52 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Lazar, Lijo"
 <Lijo.Lazar@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Chen, JingWen" <JingWen.Chen2@amd.com>
Subject: Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
Thread-Topic: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
Thread-Index: AQHX94AbPVgo6Mqr0UqM3sQHdT5sp6xURYIAgAArzQCAAF8UAIAS7YQAgAAA1YCAAAEFAIAN6o0AgAM2+8w=
Date: Fri, 28 Jan 2022 16:57:52 +0000
Message-ID: <DM5PR12MB19474AEFB824C4C97DCD7AABEA229@DM5PR12MB1947.namprd12.prod.outlook.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222220506.789133-5-andrey.grodzovsky@amd.com>
 <639bd7c3-e946-65eb-afae-dd619f6429d6@amd.com>
 <9dc55576-19b1-d5e3-f4da-eede4db8b289@amd.com>
 <c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com>
 <62f9f1c2-312b-760e-75f7-e86421333be3@amd.com>
 <096c0884-7e32-40ed-7570-b65f19104f5f@gmail.com>
 <769b97dd-c6f9-88fe-a26b-34bfd617e257@amd.com>
 <17b6f133-1b7b-7fcb-5fb2-17edcac50a72@amd.com>
In-Reply-To: <17b6f133-1b7b-7fcb-5fb2-17edcac50a72@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b759ed7d-c388-4a27-ef4e-08d9e27f527a
x-ms-traffictypediagnostic: CH0PR12MB5299:EE_
x-microsoft-antispam-prvs: <CH0PR12MB52997DA769005888DD21D79FEA229@CH0PR12MB5299.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SzGJ5dUIhwtBNd9LXApKR6iUnZBg3XCr4sCcKzYgka1/SeI4vDQFsIqtzz1ZDmJoi90tgZYxoIsIap4txArX7NyBSxhuH1XderRryabZqOaZbh9+etRzo6aQp3jM8h5pUVj5MDoJV3u4OTaF9zY2hla4T/XOcQGRkoHt3zy51PbBEPOu1uANeU+rYO2pThniotCUrF13wNkg/Q9dwVLdXR+yfrtWbNsViI/8j8MXYYncmUekfznAoJYLkFCD0/sDpo1CS+C25VWKYB4/lLr6Qyx7NF2QM5adXpQm1qHQ/xA9d3P7xFcw1ZHzQMt+5phWeng1ZQZ2atkU/b3XgbHLwZOb4UuBBrIBEdZIjMpdh6/hVa9DOGy7/y5fsqiaxboBwXzFHCpth/9gf9Ne3c2jReuCjW4maZ/rrTcc/hUSN7N07pFN/NkEpOxPuTqimxS6F9UMwDprD0GnjZRXR1zy74VRLMoRX1wYKADYTZIx1zl6BJVEnMK28KN61qPanCNb434/zBDM6NJtvODXT+5AOL1PSkFG+sTens3WVuduTqnq2PxGNLbAhPfOoKpbAhIL7O3VeGYvGmJt8DS1PHezzog8BO4DnlhOTo11/36AP4MDm/Hp1WUiayUQ3AHCsbJegLjlXAKlteJotZGZ3ZPCZU4O7MEj2tTV1OVYftBQIoM7cSnwFYxr9Omqn5vvbZXI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(66574015)(2906002)(83380400001)(8936002)(110136005)(66556008)(6506007)(76116006)(186003)(52536014)(64756008)(38100700002)(508600001)(86362001)(38070700005)(71200400001)(54906003)(33656002)(66446008)(122000001)(66476007)(53546011)(66946007)(4326008)(55016003)(7696005)(6636002)(9686003)(91956017)(8676002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?iWvxDZXD78C0Cz3BNtUpqMGhtR3WYL76Kf/ygeXf838hH7kvvY5DuqTxCA?=
 =?iso-8859-1?Q?JKxTXFCH1hTRYJ47MORCVu8bjrB4R8PA306LQ4t6iwDEbshfHa91YCfe5/?=
 =?iso-8859-1?Q?wEpG5VvS2y4j/t5Ur2ATGMOQMINzN7RPxWffg4Olvmx0in5hxHTL0zZSV5?=
 =?iso-8859-1?Q?8lk4zyJHH4haBO0B5hHVGc26d+vk+cLMj4FOj1GZ4EuJuHn1AhCO3B1ZMO?=
 =?iso-8859-1?Q?7LlrT/dgQYNoYoDigcAzVVGr3AGaIpA36KivHZFNNBL2AFm2P8BtTF4gdy?=
 =?iso-8859-1?Q?fSbNBaVQVns7OQrdKD3zJYQAe7Gy/Bg6YlAfcXTx3gSBA+DQtcQVhkquGM?=
 =?iso-8859-1?Q?YyqjQAGcGkwPhoqZDa7rPrEYq8y1DKZFEHStmsbDPvN5EOxYUavCE/5bTp?=
 =?iso-8859-1?Q?eib+o9rHbhYsysss5ioMDC/eDBYs20+hV70AV6PlQqvqzIbNk3M/XpoadP?=
 =?iso-8859-1?Q?ULZ8A7rDwLdsY0f+opFudaCVWwUO35UM5/XVv0kjWDsSXpeVkXbpDMPpLP?=
 =?iso-8859-1?Q?wZCHo6KCADfgoetvK/Ua5Exj0hOa/5YhZN5+Kzf7juUg6TJmIkeUIUUB3O?=
 =?iso-8859-1?Q?tb0yAtNbTrBJWX/uKN88qNMFENRAHKv163vaLSv5vdxjDBZZtDWxR8z8pI?=
 =?iso-8859-1?Q?+SDCi8MgM5pQ6drtPYSLEMQbA8lFSHnrH4wy3IIHX3vl86BmSEVLBWT/8e?=
 =?iso-8859-1?Q?3BhZrfKPZvRtdnCE3pt1ZMuWc0rBTnJ4EjmrqRbzI/B1uj1jIjPWdfCg10?=
 =?iso-8859-1?Q?mBD2jXuiTg0Pf+RWSo4l0TvHmy0/MWW51P1ZTNv+/7UrLnkp5d5SKpkdGK?=
 =?iso-8859-1?Q?pQUWtTg0WZawrNb+KAs7S4aVTsoIDbRjLeS10MOCRxERsLfSkWrbnB4Kf1?=
 =?iso-8859-1?Q?fTrBKRpL1GXWXYcuZdLWy3dR7Anq6GfRjyxD4zXxDmbvA6bL9SNb4oCKEC?=
 =?iso-8859-1?Q?vOg8ECCYeqEZFjbXtGdrtcGPVOhF5yYmLsw18zfC/2fHdTVh3WBAgdknBh?=
 =?iso-8859-1?Q?yH/bXGhR8G3wGD5GDJeg1dWIh2E9wwLb5/+eW7sLpm7LX94Me5D44YPA35?=
 =?iso-8859-1?Q?LPSYSZHD42sNzGQgtXWlGMKDLo1sMKgp+Qf61PeFpck7ufc3hMBjgMKEmj?=
 =?iso-8859-1?Q?YALv85hDZaFiKxmECsyhfYvdsBbS9IPgvxcQY7LvM/6d4iIaiBD5jA3uik?=
 =?iso-8859-1?Q?p4si5gPxAZXwOPJ+nzMu1lB261Fs/XHO91XH10KwuWJWZu8mTUCV6DEmaL?=
 =?iso-8859-1?Q?2u6fpgPYD714DV6BV55B+2bPAi8HXeiIGuf5+mSPpSecluGHRamu6sWbez?=
 =?iso-8859-1?Q?zqu7bJlNbXOvBKmUJJMBb70a4PCs7xbaJVCAWkuD9VbowidqtnGeWKVj+s?=
 =?iso-8859-1?Q?WlIZHxdy1VN2OI3L8dLt3CWOR6et/wONPgK+sJIzUt/QLCF1mNvy7sWmdr?=
 =?iso-8859-1?Q?IgkYPyuS9/OodqWU9RCm/kzSswC0AWxLNdjrvJcc6ZaeQFmaPA2lyZaKZQ?=
 =?iso-8859-1?Q?DozZjQVaXyirEyPE/nkgSrEuhm2O3DEVUvjxaapZyj7HiuXrLeuAwOTkvY?=
 =?iso-8859-1?Q?aIKIqofvVDymWOygPTr52IyfYG9gD2lqYbMP9/rflvP5XJfgf/hbdJFcAm?=
 =?iso-8859-1?Q?Ejv5D9kj/8azV4fmmemo8lOdtp1UmlRASRasn1ImxyAKrZCBdgl/jk+KfO?=
 =?iso-8859-1?Q?E+14nb4ToG2xrCPGJ5PkKn7ftam0cyiNLWOpt2kV5FPCVIpvq7fSdDspE9?=
 =?iso-8859-1?Q?hCOw=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM5PR12MB19474AEFB824C4C97DCD7AABEA229DM5PR12MB1947namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b759ed7d-c388-4a27-ef4e-08d9e27f527a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 16:57:52.1366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p313AYPstDzxSz4LYwdqMcs6F6yCqPbqPhE6k9zHR41wEqASaqoXB4KqdPb0Z9coRJIBafyXeIzCIrXWBOjsQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5299
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
Cc: "Chen, Horace" <Horace.Chen@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_DM5PR12MB19474AEFB824C4C97DCD7AABEA229DM5PR12MB1947namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Just a gentle ping.

Andrey
________________________________
From: Grodzovsky, Andrey
Sent: 26 January 2022 10:52
To: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>; Koenig, Christian=
 <Christian.Koenig@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.com>; dri-devel@li=
sts.freedesktop.org <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freede=
sktop.org <amd-gfx@lists.freedesktop.org>; Chen, JingWen <JingWen.Chen2@amd=
.com>
Cc: Chen, Horace <Horace.Chen@amd.com>; Liu, Monk <Monk.Liu@amd.com>
Subject: Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with T=
DRs


JingWen - could you maybe give those patches a try on SRIOV XGMI system ? I=
f you see issues maybe you could let me connect and debug. My SRIOV XGMI sy=
stem which Shayun kindly arranged for me is not loading the driver with my =
drm-misc-next branch even without my patches.

Andrey

On 2022-01-17 14:21, Andrey Grodzovsky wrote:


On 2022-01-17 2:17 p.m., Christian K=F6nig wrote:
Am 17.01.22 um 20:14 schrieb Andrey Grodzovsky:

Ping on the question

Oh, my! That was already more than a week ago and is completely swapped out=
 of my head again.


Andrey

On 2022-01-05 1:11 p.m., Andrey Grodzovsky wrote:
Also, what about having the reset_active or in_reset flag in the reset_doma=
in itself?

Of hand that sounds like a good idea.


What then about the adev->reset_sem semaphore ? Should we also move this to=
 reset_domain ?  Both of the moves have functional
implications only for XGMI case because there will be contention over acces=
sing those single instance variables from multiple devices
while now each device has it's own copy.

Since this is a rw semaphore that should be unproblematic I think. It could=
 just be that the cache line of the lock then plays ping/pong between the C=
PU cores.


What benefit the centralization into reset_domain gives - is it for example=
 to prevent one device in a hive trying to access through MMIO another one'=
s
VRAM (shared FB memory) while the other one goes through reset ?

I think that this is the killer argument for a centralized lock, yes.


np, i will add a patch with centralizing both flag into reset domain and re=
send.

Andrey


Christian.


Andrey


--_000_DM5PR12MB19474AEFB824C4C97DCD7AABEA229DM5PR12MB1947namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div>Just a gentle ping.</div>
<div><br>
</div>
<div>Andrey</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Grodzovsky, Andrey<br=
>
<b>Sent:</b> 26 January 2022 10:52<br>
<b>To:</b> Christian K=F6nig &lt;ckoenig.leichtzumerken@gmail.com&gt;; Koen=
ig, Christian &lt;Christian.Koenig@amd.com&gt;; Lazar, Lijo &lt;Lijo.Lazar@=
amd.com&gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedeskto=
p.org&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;;
 Chen, JingWen &lt;JingWen.Chen2@amd.com&gt;<br>
<b>Cc:</b> Chen, Horace &lt;Horace.Chen@amd.com&gt;; Liu, Monk &lt;Monk.Liu=
@amd.com&gt;<br>
<b>Subject:</b> Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery=
 with TDRs</font>
<div>&nbsp;</div>
</div>
<div>
<p>JingWen - could you maybe give those patches a try on SRIOV XGMI system =
? If you see issues maybe you could let me connect and debug. My SRIOV XGMI=
 system which Shayun kindly arranged for me is not loading the driver with =
my drm-misc-next branch even without
 my patches.<br>
</p>
<p>Andrey<br>
</p>
<div class=3D"x_moz-cite-prefix">On 2022-01-17 14:21, Andrey Grodzovsky wro=
te:<br>
</div>
<blockquote type=3D"cite">
<p><br>
</p>
<div class=3D"x_moz-cite-prefix">On 2022-01-17 2:17 p.m., Christian K=F6nig=
 wrote:<br>
</div>
<blockquote type=3D"cite">Am 17.01.22 um 20:14 schrieb Andrey Grodzovsky:<b=
r>
<blockquote type=3D"cite">
<p>Ping on the question</p>
</blockquote>
<br>
Oh, my! That was already more than a week ago and is completely swapped out=
 of my head again.<br>
<br>
<blockquote type=3D"cite">
<p>Andrey<br>
</p>
<div class=3D"x_moz-cite-prefix">On 2022-01-05 1:11 p.m., Andrey Grodzovsky=
 wrote:<br>
</div>
<blockquote type=3D"cite">
<blockquote type=3D"cite" style=3D"color:#007cff">
<blockquote type=3D"cite" style=3D"color:#007cff">Also, what about having t=
he reset_active or in_reset flag in the reset_domain itself?
<br>
</blockquote>
<br>
Of hand that sounds like a good idea. <br>
</blockquote>
<br>
<br>
What then about the adev-&gt;reset_sem semaphore ? Should we also move this=
 to reset_domain ?&nbsp; Both of the moves have functional
<br>
implications only for XGMI case because there will be contention over acces=
sing those single instance variables from multiple devices
<br>
while now each device has it's own copy. <br>
</blockquote>
</blockquote>
<br>
Since this is a rw semaphore that should be unproblematic I think. It could=
 just be that the cache line of the lock then plays ping/pong between the C=
PU cores.<br>
<br>
<blockquote type=3D"cite">
<blockquote type=3D"cite"><br>
What benefit the centralization into reset_domain gives - is it for example=
 to prevent one device in a hive trying to access through MMIO another one'=
s
<br>
VRAM (shared FB memory) while the other one goes through reset ? <br>
</blockquote>
</blockquote>
<br>
I think that this is the killer argument for a centralized lock, yes.<br>
</blockquote>
<p><br>
</p>
<p>np, i will add a patch with centralizing both flag into reset domain and=
 resend.</p>
<p>Andrey</p>
<p><br>
</p>
<blockquote type=3D"cite"><br>
Christian.<br>
<br>
<blockquote type=3D"cite">
<blockquote type=3D"cite"><br>
Andrey </blockquote>
</blockquote>
<br>
</blockquote>
</blockquote>
</div>
</body>
</html>

--_000_DM5PR12MB19474AEFB824C4C97DCD7AABEA229DM5PR12MB1947namp_--
