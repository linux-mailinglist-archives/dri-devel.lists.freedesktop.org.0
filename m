Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B18B7832469
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 06:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74D310E0A1;
	Fri, 19 Jan 2024 05:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C6310E0A1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 05:53:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpPypsytkXCo+NzT+Q7P+D5xg8nlT1Dk6rkFUiuQKrAs33B2/npwoD7QhL/2lZxJwS6e3lytif6KyyVJJaIs+VUiLPtBCr48yVl+pKAGVEd9wXUX/Uq5Dy6mVXiX3AWUb3gmqmPp277Q+MY3BGt3VPi51BCmar4EwmxGYibQzlxV4nr8Blo1bcFLbUw9SgW6N/JXDlQSo5hmo5enJUxdjZM5wqQRTWxRLGymZsb++1FyueTK9X0c2KXp65BjBNjlrAkZ587iAfOG/y/SFxZBJXFn1HPafqMDvaWh8xOJQnoOg8zFvmfgWEFuQD+TXqGSTid07EMFkes+Em+XLIvXmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+eqoXdyL2kS76ExX/cLxZ5lhIi+7BJYw2XkjhZMSNI=;
 b=SoaptvV6eVpHqyCJ/zMffwmK+jA/b6JCfCLPdTyJHhT3gTCg5rvqAM2yNa2JxPm76J6pAHvSRwru8ZUjQ9b6NFeyee/Y+GM0Y8ePBR8/utb2SjCRYgMmRbywIvi7LaI1jCzvPheC7y2Keenz/tfJrk+AJNzaSZ7wfyEC5a7u2PbACuG/JrtecYYjpRuiM7PJyAV4HAb9RIKQmFgXFyDHhsi1jK3o/N4t35STO38mI/bUg1oj4Q/MzSYDXiywqOmWjlic4P0QNwfBi3ognLsclLDa8gZlOpuronWCe1pQ2MsenHLDhwQF6fl8Lpx/SGnXZdZNBBfVwL8wwifCM2l+5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+eqoXdyL2kS76ExX/cLxZ5lhIi+7BJYw2XkjhZMSNI=;
 b=zwT6goAr9zIQMTXqGN2qUsyI93q9D2prTqFq1gFbXRB33gnMhNp57f2q76uhNg4Hhv+6/6+MkeVpAlouefSrPM//n8Md5AFSDxry5Uz/Kje6wF1KbUM2D5o56mhwje/ftZsBWQzeFNhZBQ2DfDPMS1Zx1eaRikAbjJp+U7vgllk=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by PH8PR12MB7255.namprd12.prod.outlook.com (2603:10b6:510:224::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 05:53:30 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::374b:e99d:5ba7:1ec0]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::374b:e99d:5ba7:1ec0%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 05:53:30 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "aarten.lankhorst@linux.intel.com" <aarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Simek, Michal" <michal.simek@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] drm: xlnx: zynqmp_dpsub: Don't generate vblank in
 live mode
Thread-Topic: [PATCH 3/4] drm: xlnx: zynqmp_dpsub: Don't generate vblank in
 live mode
Thread-Index: AQHaSpvU9W+NcWnB8E2zkfKtis0GmQ==
Date: Fri, 19 Jan 2024 05:53:30 +0000
Message-ID: <MW4PR12MB7165B7BEA23F4C4185A48EE9E6702@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <mailman.1660.1705501214.2415.dri-devel@lists.freedesktop.org>
In-Reply-To: <mailman.1660.1705501214.2415.dri-devel@lists.freedesktop.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|PH8PR12MB7255:EE_
x-ms-office365-filtering-correlation-id: b8a8e41b-6aea-4547-c245-08dc18b2f6fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xvssr+E24Y7rvrGOrMpYvxNJUO5aVygQO4bIiEa76jmGFCqkxQnQbEUTf0TYQ/uNHK694YurBw6e14xtWNxGRhwmoXySGEP6h3/Jj3JvhOWaOhYZf4S8lRj/UKUGyu8Q9uskcSaDsXwTk4ej967TUDunRonHE/gvp9iqFu2Yu/7tor22nX7K7IE87D1nDl7Jtzubh9uZfuEkEWVtWSoMgWbTrQtG0gnVFoxDetcW2haAeHLAn8+azGyoHWramRYDC48OUWkpDnzy30hdKypZnLTk3Qs/QqYu+jhYEKmkPS4/ax2pjEUiCnTSuI6C6bt/CtpYKQu69NMF6AI7uZvE7iuUMz4qWC7b9Lyl4g+8mOU4q7dbape8Mz8cN1ozamQvpHPcegTKy43acvcCt+KJUCqdJMmsTYNqcSzXrQa1Erk2SLperyACWE4bNzoZBbgp1Do9ZR+pWZVKtGcwEQk3+HiEIpYspLb865VCyov37D/1JqlE7O+HiJzHQ+o3sKjy/LsQbAnixaaHfSKVmskLkOJQ3J0y7y6Zoz7qTwBFMuUVA3ZkVhUk9eTxi7aI4wUOR16pt5BD8vurS1bodL4dsRuvR44oNjqXsjY2OSy3LJEbNtAtvb8AjaTWpzRY+AzoGIQnk86SR6ADdskk8zwuYg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(366004)(136003)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(110136005)(9686003)(66446008)(122000001)(38100700002)(83380400001)(86362001)(33656002)(41300700001)(7696005)(6506007)(8936002)(8676002)(5660300002)(52536014)(316002)(66946007)(71200400001)(64756008)(66476007)(2906002)(7416002)(76116006)(66556008)(26005)(53546011)(478600001)(921011)(38070700009)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CN7cv6Kw1trMY0y41uiVATWdp1z1X0G2a59D95oWVGQYBmL0oPLnZruZykZq?=
 =?us-ascii?Q?jUoW1YLtL4zLzsEGzD6yfa7VZ2eVCHOmLATNF0gHBhO9js/FkdkTdVsJp/cX?=
 =?us-ascii?Q?t1PCmPA+tXnH023Wh5Jzh7nMwnt6gd1q4UMs/0dwYg7GYAYAPONOkiRUu7uM?=
 =?us-ascii?Q?H8FZNlcoiPAqfcfVBYUtvjYhUNgh+DvXLOweYiaDg7Gs+F5/uculGqNaekmg?=
 =?us-ascii?Q?vd7V7ovG/gX/L29QeBaN0LE2T7+T7sqrSq50GV0fPPT7Pq2UoXzo8f/t7mkH?=
 =?us-ascii?Q?aJy5Vku/VQY4cwN+GNRMaBFw1tmz7cTvMEyMeoqffWQ5mIdX5hXYOV586D2S?=
 =?us-ascii?Q?aY1jVYdlPtYfYkf54hKlWtWKBFDJUbGghU5J9XO2GdfIS8SN0sK2w/wxXJOv?=
 =?us-ascii?Q?DmfEEEYdqEJgO4lgdRw9g2F3c6MrwsPEOLxrBYlfe94tgf4jyT+b5QE27NqY?=
 =?us-ascii?Q?O0I7ob/p063Q0/myztCCUSh/b3ge6wh8E5Jfqq7/JylJfrF3ENDClxwqGG9s?=
 =?us-ascii?Q?0vXTu0Ik9RDl1tL7n3kDhCThOBx/Nn8+rXfWQke3issC1V1u0sTRzbS2AdFg?=
 =?us-ascii?Q?djHokEJpGwQhnvHKgcOveV7AoZlBDRRhvv3L0E45FrTG0D/GKrxjmJwoYYTp?=
 =?us-ascii?Q?0yFNvZ5Ym13W4N4U6a/XT7c+aOm1+yA3qL3oarQgUaFvtcmqUa3IOTjK5nau?=
 =?us-ascii?Q?SE85sMkX9i68HHFbMW2YFyDRuWoxftGOrsclA12ayCHPjiEN+tilzIXJzAba?=
 =?us-ascii?Q?hNcNd0t1gjBkDpF50v6ke+KYTtePhitu+RwBa/6d9CyNYp9j7EdDfTPiU8HD?=
 =?us-ascii?Q?jmN73v16zx4gjdhp0IA99nwm+ho86HD5axrl5xsHt1B2zJPQk365bRLLHHl4?=
 =?us-ascii?Q?YO9TvrBx2weqthE18zbUOeiuSyriHxONmbAGAk0/vUkkKW4HzD6qMWfidJFG?=
 =?us-ascii?Q?oP2Ij1BhOWNsNYw1n628im0VUzISzLwRvyFUoi5d5KClwza9EKpJdGWPlu+4?=
 =?us-ascii?Q?rNLc3KU9a8CBI0XVUQxg2MADh8FVy9WcAhffDTMwkv3wslyAMqlNzvDE3lDl?=
 =?us-ascii?Q?Nr1GDcEYPFF23ouev0yzUS5iYs0A4veDfOKoVcJJa+Ck4CmZEhOsg+CMl/im?=
 =?us-ascii?Q?rr8lVbLbB8uU8w0F0gdZoa4139PuWVjqJka7MsV1dXZmxHh2U/pQ1cSgyV0F?=
 =?us-ascii?Q?MX3unWnrnUYk/J8N6EHfQitzN6mSig7PEQcGtA9ssS8bV0haC/Z4kZ1gkpSj?=
 =?us-ascii?Q?+7J4iz3yCAh9E10Akb7dpuCvhpGH25fZUmZDFsKVon87KJvcumuJ+aXeh2Uv?=
 =?us-ascii?Q?Ymm4coeN6meIeW7jnkBktKE75pYguMkyT0FPB/TRUBLeudibiBHTqVPIsoEf?=
 =?us-ascii?Q?kFrjVUNE4S5alQC+QxO6+E/BMdKLSuZq6AzmYECPhhfWB2VlwVpbCaHOH/yc?=
 =?us-ascii?Q?iCSqn6qn35E+4CHcQGFTYSyJa1TUgVKRt1QUpYeWrDNZs/vInOZXNwLeRoaa?=
 =?us-ascii?Q?nVXCkJZr4EtxYZfrV//WZfiv0hDWyTbNIKbjgOtOdNrg5kBjxonumBzdejmI?=
 =?us-ascii?Q?LFtIBn1rOe6x9wSlcCs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a8e41b-6aea-4547-c245-08dc18b2f6fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 05:53:30.6570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wOu33tud1k0XQJPM9LUd9jkG9rwqdqQqLNN072uXLLieFruXBQJdWDkxIRd3XxyybqgRWN1WemnhfgXp2ikxRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7255
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the review.

> Date: Wed, 17 Jan 2024 16:20:10 +0200
> From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
>         laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.=
com,
>         mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
>         daniel@ffwll.ch, michal.simek@amd.com,
>         dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead=
.org,
>         linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 3/4] drm: xlnx: zynqmp_dpsub: Don't generate
>         vblank in live mode
> Message-ID: <beb551c7-bb7e-4cd0-b166-e9aad90c4620@ideasonboard.com>
> Content-Type: text/plain; charset=3DUTF-8; format=3Dflowed
>=20
> On 13/01/2024 01:42, Anatoliy Klymenko wrote:
> > Filter out status register against interrupts' mask.
> > Some events are being reported via DP status register, even if
> > corresponding interrupts have been disabled. Avoid processing of such
> > events in interrupt handler context.
>=20
> The subject talks about vblank and live mode, the the description doesn't=
. Can
> you elaborate in the desc a bit about when this is an issue and why it wa=
sn't
> before?

Yes, I should make patch comment more consistent and elaborate. I will fix =
it in the next version. Thank you.

>=20
> > Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> > ---
> >   drivers/gpu/drm/xlnx/zynqmp_dp.c | 11 +++++++++--
> >   1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > index d60b7431603f..571c5dbc97e5 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > @@ -1624,8 +1624,16 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq=
,
> void *data)
> >       u32 status, mask;
> >
> >       status =3D zynqmp_dp_read(dp, ZYNQMP_DP_INT_STATUS);
> > +     zynqmp_dp_write(dp, ZYNQMP_DP_INT_STATUS, status);
> >       mask =3D zynqmp_dp_read(dp, ZYNQMP_DP_INT_MASK);
> > -     if (!(status & ~mask))
> > +
> > +     /*
> > +      * Status register may report some events, which corresponding in=
terrupts
> > +      * have been disabled. Filter out those events against interrupts=
' mask.
> > +      */
> > +     status &=3D ~mask;
> > +
> > +     if (!status)
> >               return IRQ_NONE;
> >
> >       /* dbg for diagnostic, but not much that the driver can do */ @@
> > -1634,7 +1642,6 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, vo=
id
> *data)
> >       if (status & ZYNQMP_DP_INT_CHBUF_OVERFLW_MASK)
> >               dev_dbg_ratelimited(dp->dev, "overflow interrupt\n");
> >
> > -     zynqmp_dp_write(dp, ZYNQMP_DP_INT_STATUS, status);
> >
> >       if (status & ZYNQMP_DP_INT_VBLANK_START)
> >               zynqmp_dpsub_drm_handle_vblank(dp->dpsub);
>=20
> Moving the zynqmp_dp_write() is not related to this fix, is it? I think i=
t should be in
> a separate patch.
>=20

The sole purpose of zynqmp_dp_write() is to clear status register. The soon=
er we do it the better (after reading status in the local variable of cours=
e). We can also reuse status variable for in-place filtering against the in=
terrupt mask, which makes this change dependent on zynqmp_dp_write() reorde=
ring. I will add a comment explaining this. Is it ok?

>   Tomi
>=20

Thank you,
Anatoliy

