Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C71A929EF9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 11:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F95D10E0F1;
	Mon,  8 Jul 2024 09:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="td5BAyBz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B247510E0F1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 09:21:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGsgWlFq87JksWXORXA/ckRAmKaTIBUAiVinW37vEWWadZ+XkrUdz2vxjEJZQD0J2bX6Wy0PBQRcSVZVtSaNM4ji3XdH6u35Z3521amemApqK5CWmKv02gRWE5lKOolmI1ch47UP9Wp0zkIVJsEaCejeOV04wb4+fhTl9+bC+aqhetJXNmuMXvPd++ynxC+H8awKLdQ93pkvygzt65MudEul8mZCknM2T47se2wNxuQPwQGewSgI9UvpdKQk7WE9XeP8h00G9/E19lLqgo8FBHo+gSxbxaV95Uw5KKLkc03EYXJ+5nYDbhK156/tBq0R47xJn+wRRJcdFfxF2iJgEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzu/73ms2ep2Jz06pBzQDlpiqI7feLq+sIWy9As+U1U=;
 b=Zwie/wvNikWFtodOWUloXQ9CiQp5UHKMosIq4uxiqxrD3QVuuTzEr08ZHSJxwsKpMxIuAYnkp0we+3vRc27T7pCnk7tM3zM2kVBxIt5O3f/j8TLdu0GXPJZc+SfWda3WwTLDP/rNIEK05Z7hh7BnsKqHxyOHpfgN9eQEqPAQFG/w910HkSK44fSTKU8nhiq2f+qC/q1hoXptBpSpxq4n01teq6r0+f74rbry2wopRgohYISyWHv6CvJAcdxTtK1qlLu7BG2JbpbBuk42fK+j5uQRHxRuWxqMFi+iF2T7h09IWqyLZfYBM/BITJHYaGzQDaDgC4hJfLT54LubuPOQVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzu/73ms2ep2Jz06pBzQDlpiqI7feLq+sIWy9As+U1U=;
 b=td5BAyBzaDsF5eBuM1JLK9lq1FAlpK+5awcWEuXDmERCHeuThllB5fZyiCw3DlqoXpiZICl/yD3pyVHm2knWHzCehJNooYYp14AbrxrqfYbGuJmT+Scqg73a9vu6zTAzAUI4kLfRGhMN5e+xfmuzQTN5Y4kkZugwbbBdqh9ubyo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8512.jpnprd01.prod.outlook.com (2603:1096:400:13f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 09:21:17 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 09:21:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH] drm: renesas: shmobile: shmo_drm_crtc: Fix PM imbalance
 if RPM_ACTIVE is true
Thread-Topic: [PATCH] drm: renesas: shmobile: shmo_drm_crtc: Fix PM imbalance
 if RPM_ACTIVE is true
Thread-Index: AQHa0RCneh5Q9SmpwEKRFAYXUPoVVrHshnoAgAABQ9CAAAZIUA==
Date: Mon, 8 Jul 2024 09:21:16 +0000
Message-ID: <TY3PR01MB113466690F3271966931648F286DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240708082712.30257-1-biju.das.jz@bp.renesas.com>
 <20240708-mighty-squid-of-glamour-6c1af7@houat>
 <TY3PR01MB113460400FF8AB36377DAFF4286DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113460400FF8AB36377DAFF4286DA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8512:EE_
x-ms-office365-filtering-correlation-id: 7f07fbde-9e65-4bdd-f257-08dc9f2f51f2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Ew3a6gQAowie7pKvAyTGCx2K0ZUsdb4F5p58xQRn7PhGE+ForrUgUky8j2Ms?=
 =?us-ascii?Q?7UksZbxfWuECtm/JYZSZPBIGmVi3iTJi2ali8Xuu9ydFBwJuAqROT4jQEEHZ?=
 =?us-ascii?Q?E7neVGAEK1yFI8O1/hPm1mt/7+uUZaqeoJooGRIXb40GoCmrHWmc3DIBVQdB?=
 =?us-ascii?Q?eEZI0o1YnNnUjYhhrlwN/3+my1kNXPxrKX1Pg3f10Uw4LTOV0VQcxdK7fWDP?=
 =?us-ascii?Q?9iN1YI12mbMLuNtOC0bFqFLTXpdyes/AG/HrIuAtB4ux55Lm1QgrcN5nEaPK?=
 =?us-ascii?Q?VhBNQNBURdjxzUrWCJuPc3mndJDFnubUGallS2kMAQMAY6fwuIqVXMTXmfAB?=
 =?us-ascii?Q?ayWvbJMQP2QY3ywoKy85DD/JDKAF4rFSspS8uzEVWiJI0WHy2Ayb8gvOmnL1?=
 =?us-ascii?Q?FTC1w86cX7H9Qfvz6oImXlzi8OyBiwA1J0QyohEVKJtKMClqK10w6N/ZAecc?=
 =?us-ascii?Q?BvquVb100DUXZKg0rkws7LSX49hgpopZcNv20vABOrp0IXv5PXhbpAGisMOf?=
 =?us-ascii?Q?KfE1ZgciSbKDAZQ6t1ellA+kb8mXFc4rNuax55LjA2OHI6vIyinqMVp7ptGp?=
 =?us-ascii?Q?ag23k/IVEQ6K5bU7i5pWgu0ywRstxBRf++nAC3gHvV2vj82sCYxTecZAjt6S?=
 =?us-ascii?Q?OcgIkrmXeAWCDs/4aTtmIKm3Bm5b6JoWxJd9GGUQfVtQ4/4GnHoFpQ8MdeEW?=
 =?us-ascii?Q?b3eOSh9h782xTZAVhxB2f3nFoagcFgPXg3Ka1SafmoFLL0+JNobET5/syMD4?=
 =?us-ascii?Q?N8G2IMY7OfoUbEvXUXjD80ajB5dc31SOfzqY8ieZ+VPX6/ecq8OzIbR21F97?=
 =?us-ascii?Q?aWpOZqazigK+NBng0wrMQmHoaFbbS5MJjY/rCKd8Cv9+UxEWzo/yfR37R3uh?=
 =?us-ascii?Q?ynzjAnLL9Eb/l32Y1L83qTea5GBDmJUlZwqd3f2+JHkIPWr0R3+E8GCOAAz2?=
 =?us-ascii?Q?dp9T/1cLaTI84VP/O2YMSppwuJ1cFdTEsQNM+HpgFJjiqYJqNtQRIINv+QxE?=
 =?us-ascii?Q?FZKkvPfhzDix3Pi0nC/FIZKUpuxs2psPi2G8q3VIXI9t+R+NyYP0aXKebk4a?=
 =?us-ascii?Q?KcQQbKy96ks0ayiD4RK9QCpmbhw17mDUWtcp9m3cMxvBuJbjBTKJh6ckbrjZ?=
 =?us-ascii?Q?R3ZnPRiYCJiGa9Z3QpRTPJDyobaU5NMxJ4bjUfM3Yt/eQH7ao+ooPffKpHAM?=
 =?us-ascii?Q?4O7OWrjNN1cGq5qYgA7mWZgw0/MRA5ntLezSmC5TZKDp0Z/SigHm7TelghUQ?=
 =?us-ascii?Q?irQl/dI+Bh5apattC0onfLvvAfJ0MlVqAwg6GWkKlzC5w9p7EoIk7gxlqN6C?=
 =?us-ascii?Q?sYBUjFOlFuMxq6fhdgb+aIh+QKpW58XnRP6td+Ttjd+kFJfFZo6dUSDDpzZH?=
 =?us-ascii?Q?oLPAWDM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dQHxH3n4eatDdpJq9NrW56ZD0Kmkjzncm31YNLDCoG7yblFM7FZYgqAQzxQ7?=
 =?us-ascii?Q?uyu+jR9Wv/tgzHp+NSdu4cWVzqfcbJVNY/ph5ugfPaW7r6hNVrz8lQ6NV2Wk?=
 =?us-ascii?Q?U9u21wxG9IcI9Qx2POWLTQKOuctZcF5SIQuuB870xlLpx803hLsZlTDrBVRt?=
 =?us-ascii?Q?KkDQsUdTyDRUVDdHZoTr9uvQfC9JsycGRzp8NugPl2pBdO+q5joCB+1x9Igc?=
 =?us-ascii?Q?GHf4ihh/Re5SAfoIRVzHTE820vWta5T2ZbYMib7thKeIcCxs6Gg9j21b1vMU?=
 =?us-ascii?Q?a3t2Cc7rL9gQ6ip3LrFxPXEd+Z3Ru2tfhhdfPbBLbwUYssjF+ZJEhkK4TsFG?=
 =?us-ascii?Q?YekkwXtYuFyhMlUh/pBn8d0cL46oQ00ErbzOP08S88BEc8ARZS3acLbxvbk7?=
 =?us-ascii?Q?D8Eh4uIGA7n8gtQg7LMQAhHhik1Dn+3G6NKXSe+zCcC/rKd8rLJGTGYPSi+b?=
 =?us-ascii?Q?Qn1sdbJXYrhxif29h7b3CN9Rr6qbqkVgzBeNt1SjSMK+Ehl0JHsDBiNz8hYD?=
 =?us-ascii?Q?xNjG+jGWnBPmanya+U7gtwmw8hBA5l/p9bKwghkI6854+PJD7n1bR9MPyEz+?=
 =?us-ascii?Q?2F2uIsXS8XkqRnwTPbc4pXEuQywQeiA+FM8pgIql8Bnx1M+JaIbLKlukN9V9?=
 =?us-ascii?Q?cAKJIFNxZ6q4ALo7ZHTLjFwYKVvpApU7smoDJAdAFYhsCEp2jXRbW/Sgv6RQ?=
 =?us-ascii?Q?+q9fNPj0wTO8NhASMTiixE0ogy5joqXB8d7teVibW6fyi4d5+fnRniHi4fGV?=
 =?us-ascii?Q?9IH5HGCIUBJlSpfVCWIWB/gntxoadIpEgtivvjeUlNwwxbrtnHk1XRn+W24b?=
 =?us-ascii?Q?e7CXzt0K74QI7+BHZV+8DR5F+Jq/q6JgpojU5KXi9R+YawUcC9b5gNd2Tite?=
 =?us-ascii?Q?tpCXL5dK8Ihu7nouPUVFdnNRhoOCMwyATyaFCGvtWZU897+op4lHgwlpvaAa?=
 =?us-ascii?Q?zo76CRgBpN5Wp2aSMDYJrey6I1oRmRW641WDYKIBettn8ek7pnzF8XPdYpuQ?=
 =?us-ascii?Q?TbsqG10i8GEv8tlG1n3gPlX5BXOfGTKTC+/MtXFEiXwFWXDULOF2mO4YIltF?=
 =?us-ascii?Q?03aXCSvOCt73emmCrIh9jHmBeRSgoWGx/mL+TX/0KfIdIJzd4KFKs3MLwNUk?=
 =?us-ascii?Q?v36KsJkEkCUbhi9tdfRhL38Q7Qn0/BHlcY+/gIG3rsWs5AOXQq1nAtOJjElE?=
 =?us-ascii?Q?1ze9wigaBi+D7VCFy9aMs5FmmKmSFOHDlO2/smEB3UJtqI2xsGYNRd2Te5dY?=
 =?us-ascii?Q?lN1eE+JKPYxdSBgoTnD3SNISJJsLtOgkR7BZHVLypLWQN1IJaC3oIP+Ewhjy?=
 =?us-ascii?Q?UxKGe5oPBy3hl+jFOU1boRBul1Qzb/2+PMLv3HwUwZwJDhhxMNkwBq8Q+5PY?=
 =?us-ascii?Q?5xyMD2GuoLoSAQ2bT4oos47pH5U4wgyXPIlH/iCoAVDRHMVjnk7QVrdRFoUf?=
 =?us-ascii?Q?KhD24eIkC8+ruOmj8r++x6Q6p52H+HsWi07trf7Z9wEYiCElz2RGvpASw8lh?=
 =?us-ascii?Q?iIz+RZA2P/X4NXj1BbuefhtshrEDwAEnQSavsf+DUL02+zFTKDZRdXXUQeOU?=
 =?us-ascii?Q?jBADkkN+HndqOy2VRrJuKOjveR0eyoKKp7mTzfRwN3noxz4R2OsX57kQ26xo?=
 =?us-ascii?Q?DA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f07fbde-9e65-4bdd-f257-08dc9f2f51f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2024 09:21:16.6342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A8l/16vGhDdksAa18n5cGgMvvTGrZSP47NxciEH65fGYCOiLTYO/yMs59KZazUz+yzOl32+nZnQZUDw5kNXWEkRL61yGmot7f1KWc1d4JpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8512
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

Hi Maxime,

> -----Original Message-----
> From: Biju Das
> Sent: Monday, July 8, 2024 10:01 AM
> Subject: RE: [PATCH] drm: renesas: shmobile: shmo_drm_crtc: Fix PM imbala=
nce if RPM_ACTIVE is true
>=20
> Hi Maxime,
>=20
> > -----Original Message-----
> > From: Maxime Ripard <mripard@kernel.org>
> > Sent: Monday, July 8, 2024 9:54 AM
> > Subject: Re: [PATCH] drm: renesas: shmobile: shmo_drm_crtc: Fix PM
> > imbalance if RPM_ACTIVE is true
> >
> > Hi,
> >
> > On Mon, Jul 08, 2024 at 09:27:09AM GMT, Biju Das wrote:
> > > The pm_runtime_resume_and_get() returns 1 if RPM is active, in this
> > > case it won't call a put. This will result in PM imbalance as it
> > > treat this as an error and propagate this to caller and the caller
> > > never calls corresponding put(). Fix this issue by checking error
> > > condition only.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > index 2e2f37b9d0a4..42a5d6876bec 100644
> > > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> > > @@ -208,7 +208,7 @@ static void shmob_drm_crtc_atomic_enable(struct d=
rm_crtc *crtc,
> > >  	int ret;
> > >
> > >  	ret =3D pm_runtime_resume_and_get(dev);
> > > -	if (ret)
> > > +	if (ret < 0)
> > >  		return;
> >
> > The documentation of pm_runtime_resume_and_get says that:
> >
> >   Resume @dev synchronously and if that is successful, increment its
> >   runtime PM usage counter. Return 0 if the runtime PM usage counter of
> >   @dev has been incremented or a negative error code otherwise.
> >
> > So it looks like it can't return 1, ever. Are you sure you're not
> > confusing pm_runtime_resume_and_get with pm_runtime_get?
>=20
> It should be ret < 0 as ret =3D 1 corresponds to RPM_ACTIVE and the API d=
oes not call put() when ret =3D
> 1; see [1] and [2]
>=20
> [1] https://elixir.bootlin.com/linux/v6.10-rc6/source/drivers/base/power/=
runtime.c#L778
>=20
> [2] https://elixir.bootlin.com/linux/v6.10-rc6/source/include/linux/pm_ru=
ntime.h#L431
>=20
> Am I miss anything? Please let me know.

the code for pm_runtime_resume_and_get() seems correct. Sorry for the noisy=
 patch.
https://elixir.bootlin.com/linux/latest/source/include/linux/pm_runtime.h#L=
436

Cheers,
Biju
