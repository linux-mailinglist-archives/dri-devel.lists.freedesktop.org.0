Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A9C5091F3
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 23:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6968A10F2B1;
	Wed, 20 Apr 2022 21:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FEB410F2B1;
 Wed, 20 Apr 2022 21:16:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=He1RT4GW5I3fN1FVIYP8IrrejtZPbdSv7wnrZJZZD0pv3xYWhDcza5PokyaxBKCVrgO8vatbAdO+tMyLBrMAiXl2sErn20CxlUY0MpsmR5Ukyy78MziyQeFzSECAmg/wvcmi8+Hq3teZ22J9TeresdutXo+MmUAdMPdA2+0pdTzkYjdrI4n7RXM06weDGfXs45KH+XZ/PXH78E4NxkM1cMJOPLTwZ6TSMl85NFJdpURKZwE5q3mFqgmv1DdWkvXmTIXoh7kbw4OtlXWg0gF4pUtd2p/lOTkONqDvDRhybldORh/FHGvDYZV/gQOWp31ymAekBTgGHVOdBAOcVr9VJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbH4JZGwB+H4Grg3DLC4EUNjR/bcofRMBvj0py9FCHM=;
 b=nPAbpFgjyPFQM91aYgsx58vD/Lwg/KGjUi3dYP62ObCyDJsZSq7HTQmNwvewiN2PPe493GYuEKRbifZiN+E1Q5gDW7inOQtUk3woJqfy9fLtQWcgogkL+VuBajJsCOU5dZNcUU9KjPhKeTATSRaAC6M4zFGWpgQr1Ch8kGMZsHWWcLnDiTcdGPQaTHWGEjOnJyYgfBqC8jlhcd8l1oAOqmtGLW9pcdk8powKnX3PQZ7+r+WPwX1xKNgAzWZLOUbY8rdc+3YLaMehe6ZwqmGIAAR7rmE7Jkou8CE3TtVtPzzWNM29jQ4GV468/8Ho7m32CPcK1SdRnOwXPERbGs+0vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbH4JZGwB+H4Grg3DLC4EUNjR/bcofRMBvj0py9FCHM=;
 b=X7l9DHgiQENFj/+PEf0vNk4sXXDQ5BpKPeKaC3ZmiFU8y934+LztChiU59bg0O6JYV/ZehpO2my18eowGbHR0pXpnNXSKFUlJHGOgexnHfBNxcKJdbj0IlGm3kivr7dmgH9k2YFK/DqMTI/3Q7tdc/qZQdckz5lGC7fTfFtk5Fk=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by MW2PR12MB2379.namprd12.prod.outlook.com (2603:10b6:907:9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Wed, 20 Apr
 2022 21:16:23 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::3157:3164:59df:b603]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::3157:3164:59df:b603%8]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 21:16:23 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, Paul Menzel <pmenzel@molgen.mpg.de>
Subject: RE: [PATCHv4] drm/amdgpu: disable ASPM on Intel Alder Lake based
 systems
Thread-Topic: [PATCHv4] drm/amdgpu: disable ASPM on Intel Alder Lake based
 systems
Thread-Index: AQHYTreTlqxj65YQFkOrqD4z/riAc6ztdvoAgABYlgCAATwsgIAIxMKAgAF8swCAAAMIgIAAAlSAgAACWgCAAAGLgIAAAzUAgAAAV9A=
Date: Wed, 20 Apr 2022 21:16:23 +0000
Message-ID: <BL1PR12MB51575EC39EBDCA0247205681E2F59@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220412215000.897344-1-richard.gong@amd.com>
 <d4ba3998-34aa-86d2-bde9-bc6ae9d8d08d@molgen.mpg.de>
 <CADnq5_MgvcGPWf2gYn_3qCr+Gq1P39tvv-W-o8NhivvMpMwUBA@mail.gmail.com>
 <91e916e3-d793-b814-6cbf-abee0667f5f8@molgen.mpg.de>
 <94fd858d-1792-9c05-b5c6-1b028427687d@amd.com>
 <efc1dfd1-2b54-aee5-1497-4b800a468141@molgen.mpg.de>
 <CADnq5_NGTbTjn87tAsTJAMOKZ9niS7Mb=JDmjUH4KJXfDH_p_g@mail.gmail.com>
 <295e7882-21a2-f50f-6bfa-b0bae1d0fa12@molgen.mpg.de>
 <67e98c3e-cfa3-ee51-4932-bbad8de5ffd8@amd.com>
 <462dce7d-73fc-ea8c-0a8a-5e8722ee1967@molgen.mpg.de>
 <CADnq5_PKYNwO2bN-SU2Z7_hBCWksja9+42n01K5UDm=m63eAkw@mail.gmail.com>
In-Reply-To: <CADnq5_PKYNwO2bN-SU2Z7_hBCWksja9+42n01K5UDm=m63eAkw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-04-20T21:15:13Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=0230f8f8-8e2b-4fb1-a44f-7b0a5825f0f8;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-04-20T21:16:19Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: c8fe0180-e29a-4bb9-8567-f6372311d8a2
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd14bb4f-2dc5-4e82-5f7e-08da231305ad
x-ms-traffictypediagnostic: MW2PR12MB2379:EE_
x-microsoft-antispam-prvs: <MW2PR12MB237994992504969BA60BE995E2F59@MW2PR12MB2379.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gqSGMBw2nVaYVElbMZVNrovvT3kQv+/1Gycnf+argwPvxm6sRkXUrZ3NesQaR5enm1zhVIxLvzqT0UJzKQRh+/rAHHmCoVHI7FuiRZyOFSDpM5wmuPk7o1myZuIzwSQx8GXrk5cvDIlBwYjTiFIG02h0qfjMNYjEo8ocDSDwZBHN1w4nTTda7YDbzlCuiCdTc/VtoTMEr+jea3ehSyUYvQVQj3lY62N/BnTLHs5+FLWSc6+/BDYBW1oYWgn5V6hTKhQH3okh5o1QRCLwsLVB5sZ6HiSGqLBnOWZS4aqh1/BOgmJ8KaE6NWro7HT9H/6MvRVUqnej0/YuDnlkxUTUu33cHX5XALu6yLRqGtXGkPq1dJkOduGpMa2oZkm9+23bbNClHnC2fldIPLNm5g+ifLep314uiitPq0M4vfEP1dyv5srScx2a0CWuymVrWPKjqptl32ofA4/LIYVaAExU9SjbzJ11NBZjb+HK4ZmbETwB8Vvt9aXCXnHnnNiMYP86RBT8mHiWZp+DWNROK56n7ezNV7H3BXkD86wAVzFAKTRYBpQDQ2+mxls+Nqbv0VMX5JfhCu32sdWMBPY7tWptycJej5cJO63E+p+izGTOJdxXwJce0rVGKCf6mXI6njUwlx6893VwkM5Rk1c8VWv3pymPfIzdgunTdhK3QJ+FSOX6KEHU1emJ+PQol/cbPFuv1f4PQZ7TF5tzsIh93alXbbZl5K69k5DleFBOG+XsyQHInR8H6gUUjO023Fd3Q8Avr8GtF5h6HybAu7ZkDgeO5xVjiLo1V3oFXrQtROlxF6s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5157.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(38070700005)(4326008)(64756008)(66446008)(66946007)(66556008)(66476007)(52536014)(7696005)(30864003)(5660300002)(76116006)(6506007)(966005)(83380400001)(53546011)(316002)(55016003)(54906003)(508600001)(2906002)(71200400001)(8936002)(186003)(26005)(8676002)(9686003)(38100700002)(122000001)(33656002)(45080400002)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IlK6qabUZDrNHVg2ZK1hFqJ3cece8JrT8EihQdZkCOSp+IUPl0BsBmuUuT/Y?=
 =?us-ascii?Q?qKy2ds+XG5a/3gFH2znHdh2XS91SPclo1zazdadw8duUGz/+cq6J3TG35261?=
 =?us-ascii?Q?N5IzO+e0VamKDKR4nAx7VlsRCf2Rz3aVGdUrcF68Kx8aMlMUa8zLMatgURn0?=
 =?us-ascii?Q?2BaFX35O7gAZdk9xsCfUrTPp3CeLWjQ2ICBYp4SmIswny/i9sbGg4i+ukos7?=
 =?us-ascii?Q?2pIN8jVnFmqs2Yg1qCyoJT9Ck1o3B6YCHVvf0VGWN2t21l77HZ9UJ0IVU5p/?=
 =?us-ascii?Q?Aqtph6/rsD1uSQXWM2DvJArtkeNG5uKe8V0D7r/FHsPfJcR6+bOJLba+22Qy?=
 =?us-ascii?Q?aS2QJTziJXlvl6dHVzb0hD+7uhinH3Qk5jVsZz+l3VsopHDEUKjVUf0+74Ym?=
 =?us-ascii?Q?xXIFunR0MNleTuRg1yr912PUVJTrKVfLhXpk6BYRYHU/MGs1z/xwMqI1T+md?=
 =?us-ascii?Q?4WuNeD7eMzQY2cKpbPXQ0GnBNM8fGL3JhUGbla7DOl1VgbPox3AHz+LX+j3c?=
 =?us-ascii?Q?lEA67pU86qAVx15y30I5XckIIdrRi3kdQrC19cyIRgeU1t4SrQg9E0GcL7zf?=
 =?us-ascii?Q?dir0BogPa4wRMSH5WyoicFkqZ9ebWWEo6XjIb460eYnNyNVPUz03ib8V+uhV?=
 =?us-ascii?Q?bOTe/mwnYvv5V5Bko31DZAteo6mCbDIp2I3ajoDR8MBtpB/GiTrlEHgZjSUn?=
 =?us-ascii?Q?rYW88gyWoKvCWz4TCUW/ACiOjCPSuEdchiH18adtQnhgMDQw0uIu6HYSl2jH?=
 =?us-ascii?Q?I7ZHhh+yva3l8T8I+VlRHHqgXXVh9L0yYyJ4C3gkdPHemWAbB+nMxXOz4JzY?=
 =?us-ascii?Q?kv/A/tpOoB2T+FCeXpUKtnKHlk7PBwsebvk9MqTNRem+MJsYni/JJ6fPLFrC?=
 =?us-ascii?Q?5PNKfYMUOK5qbe8pVPzledbYcMpF9bEdpGoJr5J+3b7FHX2Px3ZIVOr46/42?=
 =?us-ascii?Q?a3F6Dz2mS/WWzz7Xl/c7WMRSC2wEJsauMwSHrijapx/J20j2aagEqglZzmdb?=
 =?us-ascii?Q?k/A6uvdnPDFQXXw2CyAhAx2vRh1Ta2CcX2b8VHRD5cZdLyEt2FMKdHxncwRb?=
 =?us-ascii?Q?IAph3bXMFagT76Hyy42GQJw7b5uLAlt4ys7Wu+jIKD2TnCVQydMg5Kmos5Sy?=
 =?us-ascii?Q?H2TdC3P095OiQay2nYFvhorhkQagx+TfveM5fJZhEwD4DI2j0fwpzoWjFYmm?=
 =?us-ascii?Q?IPwbeQu6+HYvMTuFoL9uBDvotkwTp011sDgMrXFl1e1s4IORLOtej8pBnmqt?=
 =?us-ascii?Q?MynaayU1ObNkJhS2fnZn9bgeuoYAbXYVOUBqZa0ElERs1TJfTtrxvm/6/+40?=
 =?us-ascii?Q?KumkRkk8vjGbGJAb3B2rOeeLJnItj8IX2fAPEze+Y1ZwIrvVP5XHkXe46Mde?=
 =?us-ascii?Q?SunbLeEbI7u6VOD1/h9BWQ7FLJavFGyBs3bSDjAsPKRFoBd5CflToEWVt0uF?=
 =?us-ascii?Q?b834V1ViTJO9SXAxjGK+Y/3XkkTj81KyAn5HIAfBUI9KAPit4sJj2a4Tdgjc?=
 =?us-ascii?Q?kRU5Ez5V+GpbHscs3HAy9YeVyYZEI83t90eZuEzbp7KTVjSFfJiw4ID25Y74?=
 =?us-ascii?Q?Rpq0nc0jkGhMWGjTjz2T+oV58HWMg40neMABvi3FgGy8+/KJq1wB3Ih5gSUn?=
 =?us-ascii?Q?uxt4CaNkgpF87HqSgKfXkg0//+OjiZCM8Ae4C/E2gz0cF32CpHmXxJyEZQnq?=
 =?us-ascii?Q?8jMrZD9uYBPAH4xPWL8Pjjkl+cy+OjByA/nj4yI81CIU0zQ9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd14bb4f-2dc5-4e82-5f7e-08da231305ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 21:16:23.2320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9V3kgr18Jb19O618QaFkeOKK7iLU2JVF1yPo9uKav8FlBXT20Uo0HbmywF+8xMDe55+UnChBvQQ6jpiphfVsQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2379
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
Cc: Dave Airlie <airlied@linux.ie>, "Gong, Richard" <Richard.Gong@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]



> -----Original Message-----
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: Wednesday, April 20, 2022 16:14
> To: Paul Menzel <pmenzel@molgen.mpg.de>
> Cc: Gong, Richard <Richard.Gong@amd.com>; Dave Airlie <airlied@linux.ie>;
> Pan, Xinhui <Xinhui.Pan@amd.com>; LKML <linux-kernel@vger.kernel.org>;
> Maling list - DRI developers <dri-devel@lists.freedesktop.org>; amd-gfx l=
ist
> <amd-gfx@lists.freedesktop.org>; Daniel Vetter <daniel@ffwll.ch>; Deucher=
,
> Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>
> Subject: Re: [PATCHv4] drm/amdgpu: disable ASPM on Intel Alder Lake based
> systems
>=20
> On Wed, Apr 20, 2022 at 5:02 PM Paul Menzel <pmenzel@molgen.mpg.de>
> wrote:
> >
> > Dear Richard,
> >
> >
> > Am 20.04.22 um 22:56 schrieb Gong, Richard:
> >
> > > On 4/20/2022 3:48 PM, Paul Menzel wrote:
> >
> > >> Am 20.04.22 um 22:40 schrieb Alex Deucher:
> > >>> On Wed, Apr 20, 2022 at 4:29 PM Paul Menzel
> <pmenzel@molgen.mpg.de>
> > >>> wrote:
> > >>
> > >>>> Am 19.04.22 um 23:46 schrieb Gong, Richard:
> > >>>>
> > >>>>> On 4/14/2022 2:52 AM, Paul Menzel wrote:
> > >>>>>> [Cc: -kernel test robot <lkp@intel.com>]
> > >>>>
> > >>>> [...]
> > >>>>
> > >>>>>> Am 13.04.22 um 15:00 schrieb Alex Deucher:
> > >>>>>>> On Wed, Apr 13, 2022 at 3:43 AM Paul Menzel wrote:
> > >>>>>>
> > >>>>>>>> Thank you for sending out v4.
> > >>>>>>>>
> > >>>>>>>> Am 12.04.22 um 23:50 schrieb Richard Gong:
> > >>>>>>>>> Active State Power Management (ASPM) feature is enabled since
> > >>>>>>>>> kernel 5.14.
> > >>>>>>>>> There are some AMD GFX cards (such as WX3200 and RX640) that
> won't
> > >>>>>>>>> work
> > >>>>>>>>> with ASPM-enabled Intel Alder Lake based systems. Using these
> GFX
> > >>>>>>>>> cards as
> > >>>>>>>>> video/display output, Intel Alder Lake based systems will han=
g
> > >>>>>>>>> during
> > >>>>>>>>> suspend/resume.
> > >>>>
> > >>>> [Your email program wraps lines in cited text for some reason, mak=
ing
> > >>>> the citation harder to read.]
> > >>>>
> > >>>>>>>>
> > >>>>>>>> I am still not clear, what "hang during suspend/resume" means.=
 I
> > >>>>>>>> guess
> > >>>>>>>> suspending works fine? During resume (S3 or S0ix?), where does
> > >>>>>>>> it hang?
> > >>>>>>>> The system is functional, but there are only display problems?
> > >>>>> System freeze after suspend/resume.
> > >>>>
> > >>>> But you see certain messages still? At what point does it freeze
> > >>>> exactly? In the bug report you posted Linux messages.
> > >>>>
> > >>>>>>>>> The issue was initially reported on one system (Dell Precisio=
n
> > >>>>>>>>> 3660
> > >>>>>>>>> with
> > >>>>>>>>> BIOS version 0.14.81), but was later confirmed to affect at
> > >>>>>>>>> least 4
> > >>>>>>>>> Alder
> > >>>>>>>>> Lake based systems.
> > >>>>>>>>>
> > >>>>>>>>> Add extra check to disable ASPM on Intel Alder Lake based
> systems.
> > >>>>>>>>>
> > >>>>>>>>> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> > >>>>>>>>> Link:
> > >>>>>>>>>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla=
b.fr
> eedesktop.org%2Fdrm%2Famd%2F-
> %2Fissues%2F1885&amp;data=3D05%7C01%7Cmario.limonciello%40amd.com%7
> Ce74863210c324bc6fda608da2312b506%7C3dd8961fe4884e608e11a82d994e1
> 83d%7C0%7C0%7C637860860514174025%7CUnknown%7CTWFpbGZsb3d8eyJ
> WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C
> 3000%7C%7C%7C&amp;sdata=3DNUGXlybuH3volccVuN%2BGQ0kXwsOfCqM%2F
> wqHL6%2F%2FGYUc%3D&amp;reserved=3D0
> > >>>>>>>>>
> > >>>>
> > >>>> Thank you Microsoft Outlook for keeping us safe. :(
> > >>>>
> > >>>>>>>>>
> > >>>>>>>>> Reported-by: kernel test robot <lkp@intel.com>
> > >>>>>>>>
> > >>>>>>>> This tag is a little confusing. Maybe clarify that it was for =
an
> > >>>>>>>> issue
> > >>>>>>>> in a previous patch iteration?
> > >>>>>
> > >>>>> I did describe in change-list version 3 below, which corrected th=
e
> > >>>>> build
> > >>>>> error with W=3D1 option.
> > >>>>>
> > >>>>> It is not good idea to add the description for that to the commit
> > >>>>> message, this is why I add descriptions on change-list version 3.
> > >>>>
> > >>>> Do as you wish, but the current style is confusing, and readers of=
 the
> > >>>> commit are going to think, the kernel test robot reported the prob=
lem
> > >>>> with AMD VI ASICs and Intel Alder Lake systems.
> > >>>>
> > >>>>>>>>
> > >>>>>>>>> Signed-off-by: Richard Gong <richard.gong@amd.com>
> > >>>>>>>>> ---
> > >>>>>>>>> v4: s/CONFIG_X86_64/CONFIG_X86
> > >>>>>>>>>        enhanced check logic
> > >>>>>>>>> v3: s/intel_core_asom_chk/aspm_support_quirk_check
> > >>>>>>>>>        correct build error with W=3D1 option
> > >>>>>>>>> v2: correct commit description
> > >>>>>>>>>        move the check from chip family to problematic platfor=
m
> > >>>>>>>>> ---
> > >>>>>>>>>     drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
> > >>>>>>>>>     1 file changed, 16 insertions(+), 1 deletion(-)
> > >>>>>>>>>
> > >>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c
> > >>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/vi.c
> > >>>>>>>>> index 039b90cdc3bc..b33e0a9bee65 100644
> > >>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> > >>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> > >>>>>>>>> @@ -81,6 +81,10 @@
> > >>>>>>>>>     #include "mxgpu_vi.h"
> > >>>>>>>>>     #include "amdgpu_dm.h"
> > >>>>>>>>>
> > >>>>>>>>> +#if IS_ENABLED(CONFIG_X86)
> > >>>>>>>>> +#include <asm/intel-family.h>
> > >>>>>>>>> +#endif
> > >>>>>>>>> +
> > >>>>>>>>>     #define ixPCIE_LC_L1_PM_SUBSTATE    0x100100C6
> > >>>>>>>>>     #define
> > >>>>>>>>>
> PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK
> > >>>>>>>>> 0x00000001L
> > >>>>>>>>>     #define
> PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK
> > >>>>>>>>> 0x00000002L
> > >>>>>>>>> @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct
> > >>>>>>>>> amdgpu_device *adev)
> > >>>>>>>>>                 WREG32_PCIE(ixPCIE_LC_CNTL, data);
> > >>>>>>>>>     }
> > >>>>>>>>>
> > >>>>>>>>> +static bool aspm_support_quirk_check(void)
> > >>>>>>>>> +{
> > >>>>>>>>> +     if (IS_ENABLED(CONFIG_X86)) {
> > >>>>>>>>> +             struct cpuinfo_x86 *c =3D &cpu_data(0);
> > >>>>>>>>> +
> > >>>>>>>>> +             return !(c->x86 =3D=3D 6 && c->x86_model =3D=3D
> > >>>>>>>>> INTEL_FAM6_ALDERLAKE);
> > >>>>>>>>> +     }
> > >>>>>>>>> +
> > >>>>>>>>> +     return true;
> > >>>>>>>>> +}
> > >>>>>>>>> +
> > >>>>>>>>>     static void vi_program_aspm(struct amdgpu_device *adev)
> > >>>>>>>>>     {
> > >>>>>>>>>         u32 data, data1, orig;
> > >>>>>>>>>         bool bL1SS =3D false;
> > >>>>>>>>>         bool bClkReqSupport =3D true;
> > >>>>>>>>>
> > >>>>>>>>> -     if (!amdgpu_device_should_use_aspm(adev))
> > >>>>>>>>> +     if (!amdgpu_device_should_use_aspm(adev) ||
> > >>>>>>>>> !aspm_support_quirk_check())
> > >>>>>>>>>                 return;
> > >>>>>>>>
> > >>>>>>>> Can users still forcefully enable ASPM with the parameter
> > >>>>>>>> `amdgpu.aspm`?
> > >>>>>>>>
> > >>>>> As Mario mentioned in a separate reply, we can't forcefully enabl=
e
> > >>>>> ASPM
> > >>>>> with the parameter 'amdgpu.aspm'.
> > >>>>
> > >>>> That would be a regression on systems where ASPM used to work. Hmm=
.
> I
> > >>>> guess, you could say, there are no such systems.
> > >>>>
> > >>>>>>>>>
> > >>>>>>>>>         if (adev->flags & AMD_IS_APU ||
> > >>>>>>>>
> > >>>>>>>> If I remember correctly, there were also newer cards, where AS=
PM
> > >>>>>>>> worked
> > >>>>>>>> with Intel Alder Lake, right? Can only the problematic
> > >>>>>>>> generations for
> > >>>>>>>> WX3200 and RX640 be excluded from ASPM?
> > >>>>>>>
> > >>>>>>> This patch only disables it for the generatioaon that was
> > >>>>>>> problematic.
> > >>>>>>
> > >>>>>> Could that please be made clear in the commit message summary, a=
nd
> > >>>>>> message?
> > >>>>>
> > >>>>> Are you ok with the commit messages below?
> > >>>>
> > >>>> Please change the commit message summary. Maybe:
> > >>>>
> > >>>> drm/amdgpu: VI: Disable ASPM on Intel Alder Lake based systems
> > >>>>
> > >>>>> Active State Power Management (ASPM) feature is enabled since
> > >>>>> kernel 5.14.
> > >>>>>
> > >>>>> There are some AMD GFX cards (such as WX3200 and RX640) that won'=
t
> > >>>>> work
> > >>>>> with ASPM-enabled Intel Alder Lake based systems. Using these GFX
> > >>>>> cards as
> > >>>>> video/display output, Intel Alder Lake based systems will freeze =
after
> > >>>>> suspend/resume.
> > >>>>
> > >>>> Something like:
> > >>>>
> > >>>> On Intel Alder Lake based systems using ASPM with AMD GFX Volcanic
> > >>>> Islands (VI) cards, like WX3200 and RX640, graphics don't initiali=
ze
> > >>>> when resuming from S0ix(?).
> > >>>>
> > >>>>
> > >>>>> The issue was initially reported on one system (Dell Precision 36=
60
> > >>>>> with
> > >>>>> BIOS version 0.14.81), but was later confirmed to affect at least=
 4
> > >>>>> Alder
> > >>>>> Lake based systems.
> > >>>>
> > >>>> Which ones?
> > >>>>
> > >>>>> Add extra check to disable ASPM on Intel Alder Lake based systems=
 with
> > >>>>> problematic generation GFX cards.
> > >>>>
> > >>>> ... with the problematic Volcanic Islands GFX cards.
> > >>>>
> > >>>>>>
> > >>>>>> Loosely related, is there a public (or internal issue) to analyz=
e how
> > >>>>>> to get ASPM working for VI generation devices with Intel Alder L=
ake?
> > >>>>>
> > >>>>> As Alex mentioned, we need support from Intel. We don't have any
> > >>>>> update
> > >>>>> on that.
> > >>>>
> > >>>> It'd be great to get that fixed properly.
> > >>>>
> > >>>> Last thing, please don't hate me, does Linux log, that ASPM is
> > >>>> disabled?
> > >>>
> > >>> I'm not sure what gets logged at the platform level with respect to
> > >>> ASPM, but whether or not the driver enables ASPM is tied to whether
> > >>> ASPM is allowed at the platform level or not so if the platform
> > >>> indicates that ASPM is not supported, the driver won't enable it.  =
The
> > >>> driver does not log whether ASPM is enabled or not if that is what =
you
> > >>> are asking.  As to whether or not it should, it comes down to how m=
uch
> > >>> stuff is worth indiciating in the log.  The driver is already prett=
y
> > >>> chatty by driver standards.
> > >>
> > >> I specifically mean, Linux should log the quirks it applies. (As a
> > >> normal user, I'd also expect ASPM to work nowadays, so a message, th=
at
> > >> it's disabled would help a lot.)
> > >
> > > In general rule we shouldn't generate additional log unless something
> > > went wrong with the system.
> >
> > Please run `dmesg` and see that your statement is false. That's what lo=
g
> > levels are for, and in your case, it would be at least error level.
> > Also, I claim, something indeed went wrong, because a quirk had to be
> > applied. So please add a notice log level, that ASPM gets disabled:
> >
> > Disable ASPM on Alder Lake with Volcanic Islands card due to resume
> > problems. System energy consumption might be higher than expected.
>=20
> ASPM does not save that much power.  I doubt you could really measure
> it effectively without dedicated equipment.  Adding too many of these
> types of messages just leads to lots of useless bug reports.  Users
> see the message and file bugs.

IMO warn and error level definitely lead to bug reports.  I've seen plenty =
of
these filed even from Paul that the levels are wrong.

*If* there was a message added it should be info or notice.
