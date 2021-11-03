Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB571443FF9
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 11:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414DE6FCF6;
	Wed,  3 Nov 2021 10:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0182C6FCF6
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 10:28:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxICymY0xbMCiSaU9wlU575GuXDZ/4b1jDxv3c/2JqCK5Wr4aM6sDEyp6IfmOtVxhW0ErtD5PXo1NybOjIOH9Uj9+3FYWMv7lpeo1F3lV2KS5G/SjBM5ipvTO6fFEKkN6AZxpdUV6h3BnolYGg978ee/tN8Bd5rnrGgt8J0nSAotEmxXn2t27sMs/V3QK7tWFNwNvdjZWPdO7lPP8h6+8ZoANFPYbSW1bCR8n0BqOOfznMOV+D2ahm+NAjed5qxAgwbUmfneSom5IydWHB4/CPMFcshE4o0mwdPDfowPnEgrJIKuVY9NT6gphCk1ZB3LQIYXw8YQYSWhe2B3RiMkfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsnlwmatFDoeNO81+KIHQMInjuDK7gKfbd1pcWZ6HqE=;
 b=BG5ZDKEEvWAJHxguT9BC4DGamQe1G71OIwzvOtb6mfs/jLwSgvZIO7sTJ7n+OLr4gwj1LaRPTpPXg6OhHKwyXVwObSgy2bYez0z/cw3CmyLShOI8sVlxJbtBNGL9GOo4fVYP0fvQaxJZ0R4t/P/nkMuFjJLxRWSKaxUS4MColmPo4Rb3RpJzbKIsSmYzYEonZ2CsDVtn34r0OizvSL54OAaVsDP56S8r+vEfK1+Q/YOy4xC8GM9WUjf+Q5huWNiMxR5DG0jT+131AqdUFyerq+nYVNsngKi6C2X2WcVwiJE9XWyqO3qdk+K/BJE0ws+v5OtxgX6SinSOoGubqoL95w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsnlwmatFDoeNO81+KIHQMInjuDK7gKfbd1pcWZ6HqE=;
 b=ZcQE31oDdYtRjXneLwAG7W0MLRRlqCAnYYb/w5UQpHV+IGs8qv0l3Remp5cP8xZIWllS8xIRLZlJtJ7rMDYI940adO47FAg/ZqrEN+s2wnYLc1BdRkfKzgTu5v4z/ysnjWV/ZbYTlinWop5Px2XwcXS7GwxMjRdSmgf9wdhJ5Vs=
Received: from MWHPR12MB1631.namprd12.prod.outlook.com (2603:10b6:301:f::19)
 by MWHPR12MB1230.namprd12.prod.outlook.com (2603:10b6:300:f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 3 Nov
 2021 10:28:02 +0000
Received: from MWHPR12MB1631.namprd12.prod.outlook.com
 ([fe80::48ee:f48:5a1:dcd8]) by MWHPR12MB1631.namprd12.prod.outlook.com
 ([fe80::48ee:f48:5a1:dcd8%8]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 10:28:02 +0000
From: "Yuan, Perry" <Perry.Yuan@amd.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer dereference on
 drm_dp_dpcd_access
Thread-Topic: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer dereference on
 drm_dp_dpcd_access
Thread-Index: AQHXzudL2995hzb9gUSl5xB6lKH0RavupMsAgADbG0CAAGzFgIABkBRA
Date: Wed, 3 Nov 2021 10:28:01 +0000
Message-ID: <MWHPR12MB163124867D43AD8E19EED1D39C8C9@MWHPR12MB1631.namprd12.prod.outlook.com>
References: <20211101061053.38173-1-Perry.Yuan@amd.com>
 <87a6iodnz7.fsf@intel.com>
 <MWHPR12MB1631610D235FCC3B47064F6B9C8B9@MWHPR12MB1631.namprd12.prod.outlook.com>
 <87y267c5nc.fsf@intel.com>
In-Reply-To: <87y267c5nc.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-11-03T10:27:59Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=dac8f9cd-cb26-4c8e-875f-5a4c96e311f5;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6533a35-8861-418e-3d3e-08d99eb49d6a
x-ms-traffictypediagnostic: MWHPR12MB1230:
x-microsoft-antispam-prvs: <MWHPR12MB123023790D73BE81CD15F5E79C8C9@MWHPR12MB1230.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: miouBwG2Ft4VUVM/DaglmJipGx6cN7f8JRfb1Mm7QcmNanJS2MPqNthRop/63yaNJ7qaVYXaaVcfb2jMCyTeCgkaOU3aQGyvvLvaJPXsKWbq9Ztnypd87iHiSs4ViUKKI8tnQ+hbU8ZBKLN+9q4pyr7LdiNoF9ZSlQr4trIGT+Cv5EeHDqBjiymSAfXicu7e3h5PF5ycZmIwk2ewa5Skc/oL1HFoU+H5ZOLq/4+F52u2AR6/1YK/Env0v5QSueFT6VQ5pKB0K41UldCR7wzeGbjpXFHdoXDw31SD+XS0DH5nX8CPw2brfwC9Tp4+UQt//l8YGmtlteuNFheSuEL+xcjr3RDB+WEBookVs1VoYRKUD+GF3DUIrW2wyY4/jLUe28UTkZ387q4TEuJ3ntZUNNFGpTMKsCeINxoGkhwO/S2HKU4R17IDfLU07ExeW25EXAYK2V5EwH74WrDhtB9BxKejPfyfU4mpdZyzasAJtwxURJ2AXBvQojnW9ge4yF08EuvqGW0zIy9vqy0GPoDSwNJWk1w1jSIdlEh71mtjIuPHdcvrQ2yQccSgcQ5gC3j9GdmgUjzqXOnDFPrsSKh9/L7HVCE0+SEgyShFGi0cUd8Dj3D94zZeo5ad5BgHU6MKwuXd3AhK6Am3uUZQb6BOiOa5jvUsYvwRTZiPsxduFfPpP4niXkPy9QpVHNcPXT8SKOGTu031VDbcS3GTzpcYbWFYoEOYOE6PsgBa009o/YY9rZr/JMj8oLBNhRjq4RucI/BQ8Oji5/eIO3ePd4zbf1VPsOaULzwFZS4T7mW+cyk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1631.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(186003)(38070700005)(83380400001)(5660300002)(4326008)(53546011)(6506007)(33656002)(45080400002)(2906002)(7696005)(316002)(66946007)(66556008)(8676002)(508600001)(8936002)(76116006)(64756008)(66446008)(52536014)(966005)(26005)(66476007)(71200400001)(110136005)(122000001)(38100700002)(9686003)(55016002)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UrVmk+otSqtYGPdgMRL1+m8PV4NK5/kEe87KCJflFugMeN/q5sh4e++12kP2?=
 =?us-ascii?Q?E/1FoxXyVkeXxv3bWZyQr7vtF4UrrEva56k7V+O87BxAS7dGclaq8PMG7bPC?=
 =?us-ascii?Q?teJpsuTdBktODbD5+0ScZGfBGHkWOPP/AD9s+7AQXopaoYdYN4yBRLjaZPnI?=
 =?us-ascii?Q?k4jhEFGZQgiVm+NUfwEsaA3cRFUTrIf1apJDQqobbQErAOtYGI1Fs0kEhEoa?=
 =?us-ascii?Q?Q1S/8mg5I0VLERpTOIDSdjeqWS/XVmJ1lsJOA17eyWcyXuGDAZL6JtHqQfPr?=
 =?us-ascii?Q?g+nEcCfcUIPQGYU+pqY0vbf5g8QWJ88EhiK0Y6b5QhpmTA9YM8gLGSUQCpOK?=
 =?us-ascii?Q?NgQwAJ+VnjJuxBhwFGoHPFaPsZ3LV9XhYnTufM0tjD9PWxIEVj9joo8dXHbj?=
 =?us-ascii?Q?nlMz6T1Ww1sTn5vL6QeXkdBc5I6AjAWHK7U3IEEZjOsQ9tBjpSw2W72h1R+A?=
 =?us-ascii?Q?CHmlzZklCuV8xDzj2Yx3z8DpgV/yJDyEIOheSx1Mq3KHK+RrgwqjSJF64xAo?=
 =?us-ascii?Q?Cr+szr6MbKDlLyS+BrAwtaqTVCaR+1KZgTV5sWMP20AcyCH2CghtsjmN4Vic?=
 =?us-ascii?Q?5rYajZfA/M+ymhtWsMWxKkdGJOJRl6lXSrHGRsZAHOs7zaSm8kVyf0qKX9Jk?=
 =?us-ascii?Q?CCB7uGqiE14Z3B8/drHCZuQHvp4BXAoBP92pv5hi44Z2D+nMUKhwFwakyz8G?=
 =?us-ascii?Q?oolv3xMJTMgIOEqdnA396gEEjNyHglFYaTlp2WrAz66JK4v16eEjazretPjK?=
 =?us-ascii?Q?/V/Csrvj4X/UCyyrO1clI5BAYfmiS9pPqs9gyzSl8PY7AQZ1va7EqPFl/0/e?=
 =?us-ascii?Q?a0dyMpgKRIrGtXSddXNaXOdV3ZPw/8P0AG4v64zIFap4/Qc+U14fICLu9Y3Z?=
 =?us-ascii?Q?KEneBxZX2LI1iOLcAiFvBkN/zZIUNxrNjN72dXJRVzGKzR7139+Km/LNok1S?=
 =?us-ascii?Q?FeV8zuUiwkMAMYGnufykDymba2+ZXv5+21PIJ3wITq4uNaRSdII9vDmftH6r?=
 =?us-ascii?Q?rl678r82ZS3t7ZxezgUUUm6LjoSQBZqXAqUzl0fW/ECXwcnS3lfu+q9aEo1j?=
 =?us-ascii?Q?nBbTCbwyl+WsM0cSBrIWDCSeeUSLZkMtyD6m+FHalK/uzKcAEWfVz5cQarpm?=
 =?us-ascii?Q?XO5xgNluEeKt9Ko/vHMJiuPX0VhZUJ32gvwYPKt0x+a2drKG43VnPlhLr8yd?=
 =?us-ascii?Q?Q+frf6pVUwu5NVK4fXUq25lhW2XYo21CFYb1Skvov4W0iJA0AiwuLj9CrDdy?=
 =?us-ascii?Q?pKg96+AbE6aUBJPBF5H1Kk7yqE9EnekS0/VQm2ukVGAwShvVWF79xcQTG82I?=
 =?us-ascii?Q?CnFxB5a37JK1OiMJPhYxuxBDVYf7Y8IGOeINpesGlUvLm2A2/it0Iaz52/Yh?=
 =?us-ascii?Q?BlV6gzg9dGfL8b4X/yLssjgeGzjJYalUKwf5iOQ9r1+jMS6Q4v7tDkro12Od?=
 =?us-ascii?Q?ZQ4pPEoz7hkAEFoflf0S7LJbtmCHIQfw8UcnDynnCfG+2Fvr56saJ7UcH7pC?=
 =?us-ascii?Q?eEfxG1n01tqwsyADwcDKC3zmBB/GDxM8eRrB0BYvA7o8l8YDXJ9hgBREtNfo?=
 =?us-ascii?Q?CXFpGy0f55133yiLfbvGAC6U0M++vKgPJw9eJyEvpjYI5FC97fWBJX0gCt2L?=
 =?us-ascii?Q?6C9H+TMMHWd4Rclo5z2G8OA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1631.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6533a35-8861-418e-3d3e-08d99eb49d6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 10:28:02.0173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RP5lCWrPwsrh4GjbvxJM7yz+8iuRp6u16EXIjuGS7v5tmjtrl2nHdeykkZKG5wTo/Y+8Ep/mIsxRDhjtpvIR7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1230
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
Cc: "Huang, Shimmer" <Xinmei.Huang@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

Hi Jani:

> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Tuesday, November 2, 2021 4:40 PM
> To: Yuan, Perry <Perry.Yuan@amd.com>; Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@linux.ie>;
> Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Huang,
> Shimmer <Xinmei.Huang@amd.com>; Huang, Ray <Ray.Huang@amd.com>
> Subject: RE: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer dereferenc=
e on
> drm_dp_dpcd_access
>=20
> [CAUTION: External Email]
>=20
> On Tue, 02 Nov 2021, "Yuan, Perry" <Perry.Yuan@amd.com> wrote:
> > [AMD Official Use Only]
> >
> > Hi Jani:
> > Thanks for your comments.
> >
> >> -----Original Message-----
> >> From: Jani Nikula <jani.nikula@linux.intel.com>
> >> Sent: Monday, November 1, 2021 9:07 PM
> >> To: Yuan, Perry <Perry.Yuan@amd.com>; Maarten Lankhorst
> >> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> >> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
> David
> >> Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>
> >> Cc: Yuan, Perry <Perry.Yuan@amd.com>;
> >> dri-devel@lists.freedesktop.org; linux- kernel@vger.kernel.org;
> >> Huang, Shimmer <Xinmei.Huang@amd.com>; Huang, Ray
> <Ray.Huang@amd.com>
> >> Subject: Re: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer
> >> dereference on drm_dp_dpcd_access
> >>
> >> [CAUTION: External Email]
> >>
> >> On Mon, 01 Nov 2021, Perry Yuan <Perry.Yuan@amd.com> wrote:
> >> > Fix below crash by adding a check in the drm_dp_dpcd_access which
> >> > ensures that aux->transfer was actually initialized earlier.
> >>
> >> Gut feeling says this is papering over a real usage issue somewhere
> >> else. Why is the aux being used for transfers before ->transfer has
> >> been set? Why should the dp helper be defensive against all kinds of
> misprogramming?
> >>
> >>
> >> BR,
> >> Jani.
> >>
> >
> > The issue was found by Intel IGT test suite, graphic by pass test case.
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
l
> > ab.freedesktop.org%2Fdrm%2Figt-gpu-
> tools&amp;data=3D04%7C01%7CPerry.Yuan
> > %40amd.com%7C83d011acfe65437c0fa808d99ddc65b0%7C3dd8961fe4884e6
> 08e11a8
> >
> 2d994e183d%7C0%7C0%7C637714392203200313%7CUnknown%7CTWFpbGZsb
> 3d8eyJWIj
> >
> oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100
> 0&am
> >
> p;sdata=3DsnPpRYLGeJtTpNGle1YHZAvevcABbgLkgOsffiNzQPw%3D&amp;reserved
> =3D0
> > normally use case will not see the issue.
> > To avoid this issue happy again when we run the test case , it will be =
nice to
> add a check before the transfer is called.
> > And we can see that it really needs to have a check here to make ITG &k=
ernel
> happy.
>=20
> You're missing my point. What is the root cause? Why do you have the aux
> device or connector registered before ->transfer function is initialized.=
 I don't
> think you should do that.
>=20
> BR,
> Jani.
>=20

One potential IGT fix patch to resolve the test case failure is:

tests/amdgpu/amd_bypass.c
	data->pipe_crc =3D igt_pipe_crc_new(data->drm_fd, data->pipe_id,
					 - AMDGPU_PIPE_CRC_SOURCE_DPRX);
					 + INTEL_PIPE_CRC_SOURCE_AUTO);
The kernel panic error gone after change  "dprx" to "auto" in the IGT test.

In my view ,the IGT amdgpu bypass test will do some common setup work inclu=
ding crc piple, source.=20
When the IGT sets up a new CRC pipe capture source for amdgpu bypass test, =
 the SOURCE was set as "dprx" instead of "auto"=20
It makes "amdgpu_dm_crtc_set_crc_source()"  failed to set correct  AUX and =
it's  transfer function invalid .
The system I tested use HDMI port connected to monitor .

amdgpu_dm_crtc_set_crc_source->    (aux =3D (aconn->port) ? &aconn->port->a=
ux : &aconn->dm_dp_aux.aux;)
	 drm_dp_start_crc ->  =20
		drm_dp_dpcd_readb->   aux->transfer is NULL, issue here.=20
The fix will  use the "auto" keyword, which will let the driver select a de=
fault source of frame CRCs for this CRTC.

Correct me if have some wrong points.=20

Thank you!
Perry.

>=20
> >
> > Perry.
> >
> >>
> >> >
> >> > BUG: kernel NULL pointer dereference, address: 0000000000000000 PGD
> >> > 0 P4D 0
> >> > Oops: 0010 [#1] SMP NOPTI
> >> > RIP: 0010:0x0
> >> > Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
> >> > RSP: 0018:ffffa8d64225bab8 EFLAGS: 00010246
> >> > RAX: 0000000000000000 RBX: 0000000000000020 RCX: ffffa8d64225bb5e
> >> > RDX: ffff93151d921880 RSI: ffffa8d64225bac8 RDI: ffff931511a1a9d8
> >> > RBP: ffffa8d64225bb10 R08: 0000000000000001 R09: ffffa8d64225ba60
> >> > R10: 0000000000000002 R11: 000000000000000d R12: 0000000000000001
> >> > R13: 0000000000000000 R14: ffffa8d64225bb5e R15: ffff931511a1a9d8
> >> > FS: 00007ff8ea7fa9c0(0000) GS:ffff9317fe6c0000(0000)
> >> > knlGS:0000000000000000
> >> > CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> > CR2: ffffffffffffffd6 CR3: 000000010d5a4000 CR4: 0000000000750ee0
> >> > PKRU: 55555554
> >> > Call Trace:
> >> > drm_dp_dpcd_access+0x72/0x110 [drm_kms_helper]
> >> > drm_dp_dpcd_read+0xb7/0xf0 [drm_kms_helper]
> >> > drm_dp_start_crc+0x38/0xb0 [drm_kms_helper]
> >> > amdgpu_dm_crtc_set_crc_source+0x1ae/0x3e0 [amdgpu]
> >> > crtc_crc_open+0x174/0x220 [drm]
> >> > full_proxy_open+0x168/0x1f0
> >> > ? open_proxy_open+0x100/0x100
> >> > do_dentry_open+0x156/0x370
> >> > vfs_open+0x2d/0x30
> >> >
> >> > v2: fix some typo
> >> >
> >> > Signed-off-by: Perry Yuan <Perry.Yuan@amd.com>
> >> > ---
> >> >  drivers/gpu/drm/drm_dp_helper.c | 4 ++++
> >> >  1 file changed, 4 insertions(+)
> >> >
> >> > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> >> > b/drivers/gpu/drm/drm_dp_helper.c index 6d0f2c447f3b..76b28396001a
> >> > 100644
> >> > --- a/drivers/gpu/drm/drm_dp_helper.c
> >> > +++ b/drivers/gpu/drm/drm_dp_helper.c
> >> > @@ -260,6 +260,10 @@ static int drm_dp_dpcd_access(struct
> >> > drm_dp_aux
> >> *aux, u8 request,
> >> >       msg.buffer =3D buffer;
> >> >       msg.size =3D size;
> >> >
> >> > +     /* No transfer function is set, so not an available DP connect=
or */
> >> > +     if (!aux->transfer)
> >> > +             return -EINVAL;
> >> > +
> >> >       mutex_lock(&aux->hw_mutex);
> >> >
> >> >       /*
> >>
> >> --
> >> Jani Nikula, Intel Open Source Graphics Center
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center
