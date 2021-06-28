Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6083B638E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 16:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D7E6E48C;
	Mon, 28 Jun 2021 14:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 023E66E48C;
 Mon, 28 Jun 2021 14:55:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYgwMfj/I1Mrf3yW2vuWsSu23VBFkh0rh/bRs6+Dk6MiV03R9x/JGkS4PhYPaU4m7gzZeemz/sKKR1wCyWj7LbzPJ6ElJcTdLvqTyFc9TNao0QzmsP5yuOVKgze5GVEZww77cDAiUXZEPSdsD6+ikvhTnebOj1oL2Dx9IyhTzRCA1oVtcn89Uy8P/nNnYO/ceMkwNw/dsju9fA1QzqCEhxMvkjOWlhs6qcOPmO4ud8zfrDA8AIO7WlZAcxTVFqgN8FPVMuq/9RNNe7kmLeyOJ+eXydxWh8iyRJ4G4jZLios/Sx4Wtmh66fJ9ILrdScie0XcJewO0uPDZ21u42G5rqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bCGweh9F7aYdRepXMbzkeGDt1qyZDFz2Olq3Rsuiug=;
 b=lcGBFhycOPV57xLIg2xMkLmBuVOAoNg7DwpzVSDupHKcF4UdO1cxcI5ErpvAAugpsDDhuoIwlU+K73RfI+TsjXvFXgRfrxOaZwS7JuDQcpzzcGU/Ie/K0zUe3/zsvekcz3IWAImGntcxUT4FyS8QoyAuAqhEm7O0IC+2JwGSa0uaJK5G03MGu8WxoIiodSI4DT2063ESZIsQHz9xEGphRlZsOujjIsTqxu2nBXqJGbpAA+kqE7S4LNj65UwH1f23QaOo/I67grjrUxC+DjUBgBVwbKOl9cArtKYrmVY9pFJqx1EPKDOpo+3Dc/JxFdkB7cSzIXHcfRrZzdD898fI4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bCGweh9F7aYdRepXMbzkeGDt1qyZDFz2Olq3Rsuiug=;
 b=kXGcyYhi3qWJC+U6vY2hFM1liEoLvxRH9WzDX+rymytkELv1VYJzkDpqCrlZt/D37YZw3NWrXVTKKpDq0b7nyLT7eT6hbGDIPwMyLsGJiSijkVovYz4SMClJE1/5yZjunPjhedk30cZ+PfTV/q+lPQkMoHdI0WB31fV2IbUcqQk=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5380.namprd12.prod.outlook.com (2603:10b6:208:314::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 14:55:25 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::3c38:805a:5664:9047]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::3c38:805a:5664:9047%3]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 14:55:25 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Tiezhu Yang
 <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v3] drm/radeon: Call radeon_suspend_kms() in
 radeon_pci_shutdown() for Loongson64
Thread-Topic: [PATCH v3] drm/radeon: Call radeon_suspend_kms() in
 radeon_pci_shutdown() for Loongson64
Thread-Index: AQHXXONDZ1enUDp5VkmN8yhAIVqvAashVckAgAADGYCACEhRlA==
Date: Mon, 28 Jun 2021 14:55:25 +0000
Message-ID: <BL1PR12MB5144AB96C15088CE8D2ADF15F7039@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <1623210910-20057-1-git-send-email-yangtiezhu@loongson.cn>
 <3aa01e61-5c49-ccf9-6ad8-434eaf8a73cc@loongson.cn>,
 <df263d35-8af1-d34f-06f4-adbc83a804fb@amd.com>
In-Reply-To: <df263d35-8af1-d34f-06f4-adbc83a804fb@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-06-28T14:55:24.415Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [192.161.79.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ddc30460-1f79-4c41-c1dd-08d93a44c2da
x-ms-traffictypediagnostic: BL1PR12MB5380:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB53808E7240409539ED9B9D80F7039@BL1PR12MB5380.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PNXo2oH8xVkIXpsovaHDecPSVZbJWhiok9ZOVMF3u5bD3h4lqXpduP5MmpzXNk0/kYhcJtSiwEHZAwIIs3NB4TrsIX5jjwmjB32gRjIcEVTpNaYRaAjIsOXaXXeQY+u5lwrmthvTqOSCvCuL1qelPzpBunzwTn/VK592qs4QjuSTnros2fhFSsdCAMtoTp9VJo0ABipyY1TDMSddY5EW5JyaK/aUXpqal4yoFeSrjEVut4VSLE/rGoBjxNMNxInMge2aS5QJbcxmciwk8cKrxC10SoJca+3ORGzSDatvTLMYt1GZbfMipqE47R2NFY7wqel55tu1bdF8bWE7alLMXVthVLiGfmWUT4EOSKwr9vBW2r/0gzVCeeyB/p9kuzNsl1fKlXVYg95Cuwgtd2CYos+p6uV5GOHKGXckb39+dQ70dCB4URAN9p9URCEY9LGU+xVcTU9TwqoWGHxl9pPoipy61ADCZq2Pq0SVlNkYXx38zLUJd50+o0W+FjIEoExW7qpzcjleUf9kQTOtfRYhkvuZATCQsQc0E16FbgBGJe9Vesz/ErUeBaIhorjMcWkb4ZOo/0xZhGHeeeEU8Tmbcywl0kxiV6Kpcmb8pI3C1KG+wUzQtcZGn88h+QEfzyzt3GouLFEqeB27lOieIDyLi7z9LfcArXv92lXC06/4/w4zumM/fFF+KQ+UF8sFuBZh4d1nu2LNvuELGb8QaJ0v6b4Qc0tCbQhEbkCrNgMgfTtTjr/+jkWs0/GfKotfShb/ssEJM+ruTQc/ANi4T5AVuQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(76116006)(316002)(54906003)(52536014)(110136005)(55016002)(122000001)(966005)(38100700002)(33656002)(186003)(9686003)(166002)(26005)(71200400001)(4326008)(83380400001)(478600001)(53546011)(5660300002)(7696005)(2906002)(45080400002)(6506007)(8676002)(64756008)(66946007)(19627405001)(86362001)(8936002)(66446008)(66556008)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wYA4abo6EDZn2A3USG1KsCWfe8je34lLfAV7Zo7U7piu5dJVhLjSdbcFdiJ0?=
 =?us-ascii?Q?yWrLruQrJB14xPVQgWLk/lTXZyajgNEaj1HZ1XFEyX0TF7JSUDPCIbgTcB99?=
 =?us-ascii?Q?NT1pciGnG51DNq/nCNA5RTuq4nD2eA2Ob6VdKeJanGEGpiwbcGkj7qSJH+5Z?=
 =?us-ascii?Q?A7+ba+fxUDomyPjnPuvsahJp2LigmY/nVCHwPJNwFrBBpma8U0gUfVG48AUf?=
 =?us-ascii?Q?UhzUFjssaKHRahYHwWFDIhe7++pF4CIf8UyH16lTooJugdLF44AaMy+mujdW?=
 =?us-ascii?Q?/p9iQPvxtVhGTMAIc8SVhKrkWoeCsVkAjY48GeEVEXQvbytOceIwkUDppfeu?=
 =?us-ascii?Q?wH4Meps0Cq0NutUd2DFanRl+1A2zDR+dLpAp0tRobmoha0XWYULvyBT3Zym3?=
 =?us-ascii?Q?IL/7jjLCbaiVjg9eFYJoWZnhgs7T5skmzNvA8tQZA77YSQ1eNhE71vhlfGuO?=
 =?us-ascii?Q?e4i6hC9CWqB400IsmT75ugF/cEyXzEK3nHGwF9Z/VSW2715rEBVfRBE/3cMJ?=
 =?us-ascii?Q?4C0C63zWw99JWJ8bvM7ap3/P1ttLzQJv4U/e0/gtp4kMFUzSpvHIATIvCoPv?=
 =?us-ascii?Q?HGehhhfrZmJB+jr4uDQIe8WCfoMCr7jZTi9TmvGiHhcv1ucDf2N+lQs8tWgw?=
 =?us-ascii?Q?+NxtQ+AW+L3HGIcFtnx1fAvQO37WixuWtn6gUVla97USlmKi8cp5YbAUAZNh?=
 =?us-ascii?Q?LPAVlkY+We2K5Ul++oo5nHvSLAg2f2rvHcLvBbiDpMPp/LohvIwYkd+AFqX/?=
 =?us-ascii?Q?4Ei+hyhEjz14xOhnhBEBQsf8TErIyfRj+i1h0QlA3coILx59RV3hfnHjeTjQ?=
 =?us-ascii?Q?UlaL442o8rOFDsI90d+h2giaylHr6i15yXiIKO5ML/BEM7p1T0TTDrzqMQVR?=
 =?us-ascii?Q?Q6bUaVsbMCTUp4cLWRYjPD8aKtoPOkBY91UDsU16qX2Mu1sPj99L+FOQyq6T?=
 =?us-ascii?Q?f6migrLkndfA4xAlVGOJBYpaNLzFG3ldnMyjHatYcqceNkv0npXpjndPe9XQ?=
 =?us-ascii?Q?A7WoaAr8EMzNPl+XspVvdpaoGrDV+qvzRmIKTVzrmUeooZhFClaLqalqAk0M?=
 =?us-ascii?Q?EZexM9J+uGuMKcBzhB8GTsAkUtwn7dQQt5Mq3JZgW7UqXiHEraQ6D6kdhliv?=
 =?us-ascii?Q?2KKX637t5+VC6yK7uXhf1R9BIY+C3aM+1U0aX32bCSmFEOZFGGprP7iPf59D?=
 =?us-ascii?Q?eTWQBiPfTcY3tMhzs7QeYwKiry0HLoaboTA974NKXlpjEHc/rVonq5zlojkY?=
 =?us-ascii?Q?bWa0MIXklwIpNjRSKnTLVsMtvvYMsvcc0bXzXkGEGu3Kmzny6t0MhQf8KiH/?=
 =?us-ascii?Q?z9t1KRCAagMXFiG9vD/F3OMs?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR12MB5144AB96C15088CE8D2ADF15F7039BL1PR12MB5144namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc30460-1f79-4c41-c1dd-08d93a44c2da
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2021 14:55:25.0202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4qYV0pmq4FH8J+wIpRVMvDVLkGuM/L+3IV5menfyR+S3TloAKlMyTaaagkhPZxrrgEItG51JWTHDypq+rmobHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5380
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "lvjianmin@loongson.cn" <lvjianmin@loongson.cn>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "lixuefeng@loongson.cn" <lixuefeng@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BL1PR12MB5144AB96C15088CE8D2ADF15F7039BL1PR12MB5144namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

Applied.  Thanks.  For whatever reason, I never got this patch and couldn't=
 find it in patchwork.

Alex

________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Wednesday, June 23, 2021 4:25 AM
To: Tiezhu Yang <yangtiezhu@loongson.cn>; Deucher, Alexander <Alexander.Deu=
cher@amd.com>
Cc: airlied@linux.ie <airlied@linux.ie>; amd-gfx@lists.freedesktop.org <amd=
-gfx@lists.freedesktop.org>; daniel@ffwll.ch <daniel@ffwll.ch>; dri-devel@l=
ists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-kernel@vger.k=
ernel.org <linux-kernel@vger.kernel.org>; lixuefeng@loongson.cn <lixuefeng@=
loongson.cn>; lvjianmin@loongson.cn <lvjianmin@loongson.cn>
Subject: Re: [PATCH v3] drm/radeon: Call radeon_suspend_kms() in radeon_pci=
_shutdown() for Loongson64

Looks good to me.

Somebody could try to investigate further why that is necessary on the
platform, but radeon is only in maintenance mode without new feature
developed.

Regards,
Christian.

Am 23.06.21 um 10:14 schrieb Tiezhu Yang:
> Hi Alex and Christian,
>
> Any comments?
> Can this patch be accepted or anything else I need to improve?
>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
kernel.org%2Fpatchwork%2Fpatch%2F1443649%2F&amp;data=3D04%7C01%7Cchristian.=
koenig%40amd.com%7C2162309822114d2e41b108d9361ef26c%7C3dd8961fe4884e608e11a=
82d994e183d%7C0%7C0%7C637600328822651335%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3D2uxyAGk6sHO3lqw0FX6HITY%2Fbj%2BzEMfSIcqbzmiguMs%3D&amp;reserved=3D0
>
>
> Thanks,
> Tiezhu
>


--_000_BL1PR12MB5144AB96C15088CE8D2ADF15F7039BL1PR12MB5144namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#008000;margin:15pt;" al=
ign=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Applied.&nbsp; Thanks.&nbsp; For whatever reason, I never got this patch an=
d couldn't find it in patchwork.&nbsp;&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Wednesday, June 23, 2021 4:25 AM<br>
<b>To:</b> Tiezhu Yang &lt;yangtiezhu@loongson.cn&gt;; Deucher, Alexander &=
lt;Alexander.Deucher@amd.com&gt;<br>
<b>Cc:</b> airlied@linux.ie &lt;airlied@linux.ie&gt;; amd-gfx@lists.freedes=
ktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; daniel@ffwll.ch &lt;daniel@=
ffwll.ch&gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedeskt=
op.org&gt;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&g=
t;;
 lixuefeng@loongson.cn &lt;lixuefeng@loongson.cn&gt;; lvjianmin@loongson.cn=
 &lt;lvjianmin@loongson.cn&gt;<br>
<b>Subject:</b> Re: [PATCH v3] drm/radeon: Call radeon_suspend_kms() in rad=
eon_pci_shutdown() for Loongson64</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Looks good to me.<br>
<br>
Somebody could try to investigate further why that is necessary on the <br>
platform, but radeon is only in maintenance mode without new feature <br>
developed.<br>
<br>
Regards,<br>
Christian.<br>
<br>
Am 23.06.21 um 10:14 schrieb Tiezhu Yang:<br>
&gt; Hi Alex and Christian,<br>
&gt;<br>
&gt; Any comments?<br>
&gt; Can this patch be accepted or anything else I need to improve?<br>
&gt;<br>
&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flore.kernel.org%2Fpatchwork%2Fpatch%2F1443649%2F&amp;amp;data=3D04=
%7C01%7Cchristian.koenig%40amd.com%7C2162309822114d2e41b108d9361ef26c%7C3dd=
8961fe4884e608e11a82d994e183d%7C0%7C0%7C637600328822651335%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C1000&amp;amp;sdata=3D2uxyAGk6sHO3lqw0FX6HITY%2Fbj%2BzEMfSIcqbzmiguMs%3D&a=
mp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.ke=
rnel.org%2Fpatchwork%2Fpatch%2F1443649%2F&amp;amp;data=3D04%7C01%7Cchristia=
n.koenig%40amd.com%7C2162309822114d2e41b108d9361ef26c%7C3dd8961fe4884e608e1=
1a82d994e183d%7C0%7C0%7C637600328822651335%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;s=
data=3D2uxyAGk6sHO3lqw0FX6HITY%2Fbj%2BzEMfSIcqbzmiguMs%3D&amp;amp;reserved=
=3D0</a>
<br>
&gt;<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Tiezhu<br>
&gt;<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BL1PR12MB5144AB96C15088CE8D2ADF15F7039BL1PR12MB5144namp_--
