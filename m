Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A556B58BE
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 06:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188DF10EA47;
	Sat, 11 Mar 2023 05:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02B110EA47;
 Sat, 11 Mar 2023 05:48:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXhvC26ChOZA7J8htuQYT38cxUPmfMWAb/6Y1C0J576kCFjKjmWvFXLDJgf0pMm7Kn3y6kWFkBiNFghi1Tk3XedMCaw3VPHIWVjIqEh3dnkRZfTM4tXr5etjBAXgrCZ+IES1M4o7KAd82XJNowg2AbURPpWwUc10lS+9O3qA6Fb05V3KqjK2ku5ozi8sNUlrO45KPTjKLskWUgUzFYQbNM/CHwjbqj0jAevA8arm28Lp6+fSvw564OqlTWP98qBECdDPmdnNi0U8SIWVrj+zbaWECs5+gC/FaEq6BAeUSaJ8PKv1eTcDhEMHoajB9KkWxFxHXPwsg4vDpZI8+amyeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymjPGzdIY8MYe0MSNhRym1bzgwJJaj5cshQm5K0B4s4=;
 b=b/GnTrwix9a+cJ+z0NsFEOZWIUu+Z+ut/89RWO4LKbRdxIPVcoiVABTTuuxfLqCHRRHP4k4rizezJacDB0Hc4U0sBG53AKAWuk92CjrUZFHJiQSoe/MjrBsEXDvNMeTxa7Pq6qSgGOcT1vaYKbTigS1haClnb4dyxLm3IbbGRe2azpo0p3wElYx+hkKlszRD3wdbk48+p9yYJ2S5P//ypW3nNOvgKr8DaG4WN4kyDOJSexY4BiJ5W89rqB++5ri54RbujdSFsEyqOeDg9FFz+NSg/KacrvR4VZe/KNwYXtbIp4kTupTqOYSWyREenz4oTDUkrzU3M4C4qWGrJylc0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymjPGzdIY8MYe0MSNhRym1bzgwJJaj5cshQm5K0B4s4=;
 b=x+X9ElOpeDgSlt2iJfN0wmH95QqzhS8VL6aKe7fPwOUratHWdiL0GXplSOebYiJOkoo/amRCJsIpyBq83ggr3I89YhxtCb1oEfDYLWAknDRMUMcVokNNhDPnJkkJtSRqzrGfwV2IfF7ocZ9y5WVKurigdmhoHoJZGxglihtgXys=
Received: from BL0PR12MB2465.namprd12.prod.outlook.com (2603:10b6:207:45::18)
 by PH7PR12MB5901.namprd12.prod.outlook.com (2603:10b6:510:1d5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Sat, 11 Mar
 2023 05:48:50 +0000
Received: from BL0PR12MB2465.namprd12.prod.outlook.com
 ([fe80::1569:bac3:f214:42ab]) by BL0PR12MB2465.namprd12.prod.outlook.com
 ([fe80::1569:bac3:f214:42ab%7]) with mapi id 15.20.6178.022; Sat, 11 Mar 2023
 05:48:50 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "spasswolf@web.de" <spasswolf@web.de>, "mike@fireburn.co.uk"
 <mike@fireburn.co.uk>
Subject: RE: [PATCH v3 2/2] drm/probe_helper: warning on poll_enabled for
 issue catching
Thread-Topic: [PATCH v3 2/2] drm/probe_helper: warning on poll_enabled for
 issue catching
Thread-Index: AQHZUuvy0/TFkCXEh0Oksjg/tokGiq7z6x8AgAEoqNA=
Date: Sat, 11 Mar 2023 05:48:49 +0000
Message-ID: <BL0PR12MB24650943F13C03AE5637B4B5F1BB9@BL0PR12MB2465.namprd12.prod.outlook.com>
References: <20230310010136.2810776-1-guchun.chen@amd.com>
 <87jzzo95ij.fsf@intel.com>
In-Reply-To: <87jzzo95ij.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR12MB2465:EE_|PH7PR12MB5901:EE_
x-ms-office365-filtering-correlation-id: 0b06c1ff-ffc9-442a-1517-08db21f449ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0+RqpCHMVHuLRB6zQyAHGIuWO1ke45KKmcwcoEaCGKTPr4TJXqxCHOSrLJczKaGbNZyZHFcFyLHmrCBnN6MV6tadb0aCEAyfTPD1DTx4LNE8vuz+XosZIB6HzGvvvAJwNndxU2v+IesYplsbHeIhu4camqTBNOIDeyR8I1fHwyl+ybGZcnN+RQZYbmZFoZRD3HMA5GAjrMnvgheATRopO0bZ+XZEPw4RvnSBARj1lmoXKusNmo8DnkoOi2cWVO5CTnQNG3mJFIpzEaBeMAeOZBBEAMhDs881GYcqNZf34ZCj1ebOhs7YDJScq2jotzOTcp/hf52wZEGJAeBJvbWJtOT9Q6GvdVaHo07cevxApMrQkKeLqylOmiaTnMNQk+ifWTt/1vh1bhWKUEvMg8HkbFYc1RGkA4KWnxSz7Vw4uZjCQPstP3MnUg3RfMnYcx13/Ak4Uv9UX8m47KqYxUd7DQlxAVccB1izQlCQZMcVAcexjqx2c7XV0e7oBcQ61rZ/rA+RFBvGJ6rqaOuE37GWPMajWEDcaSB9rr/fSVz/h9MNTMH+OJTrTiAHO41IFknvimTLXWWfYPZQcylx2mFNXKIk20bbGqcsgwNT+5N6xld4En29taiH9AJc2qh4t94LKhil5D+UncV74+GHoVK3o5FdjSZzwcOJhl4PNJZbBcXKliPmM2qtmJeOhH0KRF+2XPJFGkjwIAJZItTnv6fNYA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2465.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(451199018)(83380400001)(110136005)(33656002)(9686003)(38100700002)(921005)(86362001)(122000001)(26005)(53546011)(186003)(55016003)(6506007)(66476007)(316002)(5660300002)(7696005)(478600001)(966005)(38070700005)(66446008)(41300700001)(71200400001)(52536014)(8936002)(2906002)(76116006)(66946007)(64756008)(66556008)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qpCdn7pupXEUH/DGHlENpb7BlJVWci/Fl4Z7PsC2m4v4GvP4DpMg1wrVDi+S?=
 =?us-ascii?Q?1AsyLflb9s850F8CDSOQJsor45pEcdTvNJhmn91xkd0R9lDII8bQ+kp1eVpm?=
 =?us-ascii?Q?EB+dSv4QfD87ZQ+RxM5OShIW7sGS22sAt47RFP4B7GWuKrwHJaSlNO2c19pl?=
 =?us-ascii?Q?kXNQIGeydWRuc3u/ei9H024U2pzZaqhM6FsmsFQ1hjxFLHsyuJIId6Uetk2+?=
 =?us-ascii?Q?dc86DmIxxtbdSHvvmDVtNc1fT/BCaQFJnZX1CszDGSv5bvXuanMEjKay3wyP?=
 =?us-ascii?Q?iZ/hRetm1RJBXTN2GWu8iBnaVtosV2Te43d2/O52Nd3zkD4NTTjueQpUvCAK?=
 =?us-ascii?Q?OO+731LWGa3R0fXnHIWSwpyiKWzypyRCnti0l3E3jyFiwWGSdvqPmri7gmyT?=
 =?us-ascii?Q?IvVF3PzSsuOY8f6mWdc/U8Z17ARgxHbfbkTGsz92GVHCLsjeR/TEIDWK0UgX?=
 =?us-ascii?Q?eXDXHqq/92ugJ49Ep1x7F5IUU9YJb6NdAR64T0tKimfCQf/uoNbrACcfoGFM?=
 =?us-ascii?Q?XQqI5rcrazGylWL0R/C48+RJau8PCsSfjbsnfRTSundaEIWM8e1rjvSAtgF5?=
 =?us-ascii?Q?NFOQuyENoFmRl5qNHBDXGx5Q+YwoTDQVloXX9WmWfEZiZkw2e3CX9hGsw4/p?=
 =?us-ascii?Q?Q374MzQFBdVF8rqYP5HqRUs8jNUmDohB0DU7dy6dvu1I7LjMcPJddX0Sip7e?=
 =?us-ascii?Q?OcJj3OaUfTxZ/k+DOX0NvfGWDK46SERYG3WNzr7ltUbusdc8on+zImpIwZYG?=
 =?us-ascii?Q?l+cfPIAdG7iwZDnW5Uo27XCfXd8Uey1zjrLvTumrABvrN72XhXJpudzMNv/T?=
 =?us-ascii?Q?BIvJChN9C6q8ZNQzTKcMUfkuXlyZ9+TxE16wittaHIWObbxbFDAzE1G1Hiwp?=
 =?us-ascii?Q?iYr8HZJwY76eMeJtdAGk61Z2zr9GB0XiQQfK23Idg7NYqMXzYLc6LHibtfGc?=
 =?us-ascii?Q?g4eLM4zOGZqIVejHTsLfzeUDz0+vlaqdLt2aIaYt7jLopIn1XiVYWb10Yh4g?=
 =?us-ascii?Q?7gTJUEYgR6m+T1PxhW3RfeNl8Be0FksZBPRzdByuS16elG7O3ZzRIx1Cmvkw?=
 =?us-ascii?Q?SKa/3UO3Rh+xyH4eQ8wuLeuPj3chg0LWGLokcrUgOFsTBb/cMYRlaTtI2z9z?=
 =?us-ascii?Q?DjBmRfmFHTl6Fha1yC55L88AKzIsXJWkQEX+2rqYPcrh6qd50mt9uylOsJxr?=
 =?us-ascii?Q?NrAirKh/lt71sUlUMqNU1gEMmwIbAQtp4i397gcDJ10F2QddG1CzLwthZkHY?=
 =?us-ascii?Q?I4boXtin/7j1pFzlaJsbTQ9D9KA/ljLlw7kxkjHOL/GkfnV70M8vtPmifiKX?=
 =?us-ascii?Q?mu/P0FM6G40DlSbCGNBIpgbi5NbBwzHCOP4FURzWihozK3zY7A0LT2GzJVSp?=
 =?us-ascii?Q?UqGugyiMBbJKEuL59e3FHjGLe09kTYOIEnqGoaExMDP9mV1vqPJtJIf/l+vd?=
 =?us-ascii?Q?+XRuWEh283kpGb8sjxoTK2/NuskBAAT+NoGCve2e4lqiPD+j+va/TyCRifKn?=
 =?us-ascii?Q?lKhQ1Vrl9GiOV/P/7men3rlcTLpQE0jp4lLUapNFJ5tMPJ109n2kIuhSzD94?=
 =?us-ascii?Q?iSaet3tLKdyydF8KZB4OC4yWx/bASq0Pz/4a8uN0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2465.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b06c1ff-ffc9-442a-1517-08db21f449ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2023 05:48:49.5100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0JTrv8okjBna2yA2wJYD+C5cXNPubtgvrY9gUsUboqd0hG2IpUOpAL1c0vmdCOiFNl/YGafWCmEaCqu7WDeNwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5901
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


> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Friday, March 10, 2023 8:05 PM
> To: Chen, Guchun <Guchun.Chen@amd.com>; amd-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Deucher,
> Alexander <Alexander.Deucher@amd.com>; Zhang, Hawking
> <Hawking.Zhang@amd.com>; dmitry.baryshkov@linaro.org;
> spasswolf@web.de; mike@fireburn.co.uk
> Cc: Chen, Guchun <Guchun.Chen@amd.com>
> Subject: Re: [PATCH v3 2/2] drm/probe_helper: warning on poll_enabled for
> issue catching
>=20
> On Fri, 10 Mar 2023, Guchun Chen <guchun.chen@amd.com> wrote:
> > In order to catch issues in other drivers to ensure proper call
> > sequence of polling function.
> >
> > v2: drop Fixes tag in commit message
> >
> > Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2411
> > Reported-by: Bert Karwatzki <spasswolf@web.de>
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Guchun Chen <guchun.chen@amd.com>
> > ---
> >  drivers/gpu/drm/drm_probe_helper.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_probe_helper.c
> > b/drivers/gpu/drm/drm_probe_helper.c
> > index 8127be134c39..85e0e80d4a52 100644
> > --- a/drivers/gpu/drm/drm_probe_helper.c
> > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > @@ -852,6 +852,8 @@
> EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
> >   */
> >  void drm_kms_helper_poll_disable(struct drm_device *dev)  {
> > +	WARN_ON(!dev->mode_config.poll_enabled);
>=20
> Please address all previous review comments [1].

Sorry for missing your previous review email. Will address it in next patch=
 set.

Regards,
Guchun

> BR,
> Jani.
>=20
>=20
> [1] https://lore.kernel.org/r/87o7p3bde6.fsf@intel.com
>=20
>=20
> > +
> >  	if (dev->mode_config.poll_running)
> >  		drm_kms_helper_disable_hpd(dev);
>=20
> --
> Jani Nikula, Intel Open Source Graphics Center
