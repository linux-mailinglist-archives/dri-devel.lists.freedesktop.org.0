Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493F3938AE1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 10:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B2110E3F0;
	Mon, 22 Jul 2024 08:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xnCvRUYs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB2910E3F3;
 Mon, 22 Jul 2024 08:12:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpHMjcP7bM2PEhI1nEshASysYYe+9+DcBh0Dl7CDifG1K4NL6jlwuIVMjaht364qUGkZcqrMgYo0nP/zb6sZRyDKrPxPvtDvPiCqMfpucIhOcsOybPe4Xvf2Cahc15+e7Nd3zE/ggEZaIqKcLNltpgmvSczdiKlzCH4xIZHQgcsdwV3W/E+fjGC0FATCioLaldjW4yyhdJ9YTjn5bdYc7iZFC+7A3HAG0PAFELIpSdgcnMwvFjO+Tsq3ohSwKdnPwGieJ59VEJ5pJ3OXzRRnsT2zzssa7dAXMAbUerRJ/OK3r08digSDRmdm4Q8urMjbcf1KIbKBjQKXBftzng+nwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZDiwI2cCtebWkOb3qAL1fdeVAmvs/do+8SXqGh2rpU=;
 b=iNvogXVOrm1bbussGUzE2LhiyXPn7vfDx8y1j2m4CPwyIxyIdBHcc3ZVxTDBt9vVPWxfjcEx5R8HlcEIS+ETocZzo6NyCxTGCaD7g9yWB2SbMhU4ViyOxRr402OPQS0ZevlshwGPSK1YACNI+VJSuFjZFIuwYUHIUIlzBBR3iWVlhZcW1Bdm8wfectwj1LL+n64X8J1ZUMAmkZAbO/V6t7YWq7VBBKwhlzs7aJj6lCgOTpHug+dBQuIJ/o/QabFMn+J3vHfuKtmiy/F3bEom8tOYF65kf6q0DNHnPTxZJTTD5ZlVXszef3RT6NPhF/SbVQj8+sSa5731fiOg0VDz8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZDiwI2cCtebWkOb3qAL1fdeVAmvs/do+8SXqGh2rpU=;
 b=xnCvRUYsu4bxetDcxybwJzo2IbM7m70/bp6NNrfq7IE3GTsXQ6MDyHh5nlJOtpMloZ7t2sldU200cIVY0f5/+Px8Er11CzgGsEiVmCQhBp5O0c4IpTQ8PI21wt7wello5DWJpSO1FvI667ToIm5yyntL+HTd40JAlEEdVFYH7dE=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7182.namprd12.prod.outlook.com (2603:10b6:510:229::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Mon, 22 Jul
 2024 08:12:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7784.017; Mon, 22 Jul 2024
 08:12:43 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Matthew Brost <matthew.brost@intel.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: Tvrtko Ursulin <tursulin@igalia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "kernel-dev@igalia.com"
 <kernel-dev@igalia.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: AW: [PATCH] drm/scheduler: Fix drm_sched_entity_set_priority()
Thread-Topic: [PATCH] drm/scheduler: Fix drm_sched_entity_set_priority()
Thread-Index: AQHa2cCz1nDvYx0k/E2Vz0RSMo6LLbH+BDUAgAAl/oCAACeCgIAEFtBj
Date: Mon, 22 Jul 2024 08:12:43 +0000
Message-ID: <PH7PR12MB56853FE53F7587E8B5E747A483A82@PH7PR12MB5685.namprd12.prod.outlook.com>
References: <20240719094730.55301-1-tursulin@igalia.com>
 <61bd1b84-a7f3-46fd-8511-27e306806c8d@gmail.com>
 <bd1f203f-d8c4-4c93-8074-79c3df4fe159@gmail.com>
 <Zpqk0c9Z0uMj9YOa@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zpqk0c9Z0uMj9YOa@DUT025-TGLU.fm.intel.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-07-22T08:12:43.176Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5685:EE_|PH8PR12MB7182:EE_
x-ms-office365-filtering-correlation-id: 79f6d5a2-db03-4f02-0631-08dcaa261029
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Ni27DoPJzVlqgzEVBW+sR7CHK/1l8dMuH8eovCUmz7nYkWnmgGTISZ8QAX?=
 =?iso-8859-1?Q?Pv6ZjzaD9GIWbpVk3vOi2FON+BPrQmG34872zQDTgLURiULlRf6TtDgVqV?=
 =?iso-8859-1?Q?iosKFPIP7BGHUj6qyjDZ+kT6I0KPjK+7btpDYyC8dPBl0MujWEh3eeaFcM?=
 =?iso-8859-1?Q?o848x+RSEHHH/jUs/GnfjTuqXU1sTTcJXoizGsPjs7wSDKOEzyuSjacuzk?=
 =?iso-8859-1?Q?tosXd16e4HAJDpWJRJIuEg9tvMlMULKCT43xspiorrBKw/UGDzCluRmaKt?=
 =?iso-8859-1?Q?wdVmM6xjjNxIHNUNKqz0vaMHPx5jU7tcMWrjg2HW84k4ipMG4Pq9sh+Pb3?=
 =?iso-8859-1?Q?sinyf/YpIyLyUns1KRmkP4/FRjL8lxFzURLwbEGEUDuAGUwDnkPZ6Y1BHx?=
 =?iso-8859-1?Q?JjACkoC5+gNjjpYITs6otHWDq3m/TI21Npky1FVSEbcZGxw8E57VC668hS?=
 =?iso-8859-1?Q?zviVoEHoKvFd1gZ0iVrrYs+/O4C7b9UeBsNqAolEByAUyvVmHmVizpt7Ml?=
 =?iso-8859-1?Q?xsalGc0ulaK9yQ1o7UdoEKLNQ9OOLS9iIfxxzQGqAYKINDYlYNoy4VQPIM?=
 =?iso-8859-1?Q?wOTJHO7p92KE/mmJ/He4ncVmdmbYIeguL5zrlVa2xt9ORXPPXz+uq14uAq?=
 =?iso-8859-1?Q?NNTfr1PR1eshxSsKpYBkz5bzo0TjrvMjlFkEX39ZE+1i5tePqNPxwis3Lu?=
 =?iso-8859-1?Q?k6s2NYfdK1VaLsGH/g4/stIKHry+eZFvKJHYaIYDze2qCn3EaXhzQBw3l7?=
 =?iso-8859-1?Q?PJWhEKnis0yg8P6isoLxr3IzjNdFzEl1X90iGJfgOqfF2xkJu+P3w+0nO8?=
 =?iso-8859-1?Q?oL8Mr4rOkZ4RFSGH641CZzifZd3BGoctd8qEKOTSvOLw32edVDfwl7ACK3?=
 =?iso-8859-1?Q?L9UlHoH42ivoGxHihfS7zAi5nGoPn1TQdb+YFfmg2zsQy05P1lP3cgRcfz?=
 =?iso-8859-1?Q?UerNdjhFY6k2qiHk5HZHRugYoXQB96A5q8MF53oheRSWeS1a0Zk4OAtQVT?=
 =?iso-8859-1?Q?bByiNbSkma0LVyibbvUrX5EHwfX1jyV6lYlo1WdHN3S38h5TeOG3qmoRJJ?=
 =?iso-8859-1?Q?m/u4tFWUtW/THeE5pMvyomSj6R7m+5qYx3vfzWWVb/nmCzEHGJ/CdnrMVj?=
 =?iso-8859-1?Q?0Wq4Tnn+ZhDBYE2clvZPEY1BpXQt5/tRbzgzIc8gnh6O5or5ekB/wluER6?=
 =?iso-8859-1?Q?0JKJMjCNdu9n4gn1tneOGgo91fomTL7ljYyA2y2TyG4jrg24nRnmwxMdhW?=
 =?iso-8859-1?Q?eAs3+yw4kLS4U2R1f1LDimR39hxCNUrItvUm+AJDIjKtA3lAjegq370WJy?=
 =?iso-8859-1?Q?f/Ru9PgTUUiJqdTYwO3H60nJSFI3LF2KtNTAgRVa2Tim13paxrw1kpMzEZ?=
 =?iso-8859-1?Q?zZ1FdPkV2R+Rhvk7+kZUJ16o7f70aD1ogJX8XeiW1rcpc7ZxVEYzuXFGRw?=
 =?iso-8859-1?Q?Jm2tX94IL5wibVwPOVzi/xUxdD4D3bePZtO6kw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?wiL0FpQyPufWNi/EG3qu0u1KDAuCc3nx8rthfJIoTX2BmdNUVdcU/rN4f7?=
 =?iso-8859-1?Q?Cou2mIE/wAWmAmft08Z0fe5d77lJX7TqK7/ieEWfxo25k34kjI/Fz7U9Pl?=
 =?iso-8859-1?Q?0HgUxjNsHxEXWRMohRI0ew400wL06HK14RtHhMRVG1XTO38OrH9fXAeBbw?=
 =?iso-8859-1?Q?MWYTTAkkwaZt5Zw6njP66/3nYumky2sRuuB4HzgAQlwrn/v4Q42T1ustfJ?=
 =?iso-8859-1?Q?+gDePMQ8fnMMBPojxRckeJvJEwVTLqehGTJdfwoaIQ0zJfWCip9hOVPcBy?=
 =?iso-8859-1?Q?dq6xMbgj5ElIT3q47L/AUCodyhhSUcvpBz9gl3ulkyVrVzdVeGEm2zWFNQ?=
 =?iso-8859-1?Q?vH6jaH1KMK1/OU+nxXhsO3svPyAWgc0V81f3ErePITEI2e4kktFuSQY/ya?=
 =?iso-8859-1?Q?dDZryBFO+F70EmA4ZQ3O7S3rtqhh5E8zZJMsf5zULDBFykg5pCWYb345v8?=
 =?iso-8859-1?Q?Wp6GCgNLRuQzRIzboMtm5dQYdIwXnEHlFmuwDIhe25bfnF8LgDJ7R03uN1?=
 =?iso-8859-1?Q?smcvYIOZkAqb57SI0HYB5/RoiN2R43vXm+Ug8//WG42tO7zsj849N8hkfI?=
 =?iso-8859-1?Q?xUw5RaZwlOtCsnvfHKcw56rwzddQZPF9kGyimkSi/3X7sTKK954IOlPqkB?=
 =?iso-8859-1?Q?PkX/ZQqlTBB5XBZ8SiIGXYrfsA5hsTscGKVI/OsYzBS2SGQvO8PawbIfnO?=
 =?iso-8859-1?Q?uMKpTpqfXbvxLk2YzrCQpsMRl/dqajbk+MbsKV+jpJcQBR81AF0HrAd8Nd?=
 =?iso-8859-1?Q?s/0XfkhJR59pqBkIMBpgQikR/Vn3HZ6PLmTgZStOFNNKFTGg4sHMrAOlFa?=
 =?iso-8859-1?Q?b8NgrsDzzZVkdqADjzyAwJ6k/INWoVy0F4vbK+huBC7sh/ipU/ZKvPszU8?=
 =?iso-8859-1?Q?jFd4VO2mHJoG9AmI0+ypmqgaYg+7IyVfMrxBYEsY5ni+OKNt6CwCupP0qb?=
 =?iso-8859-1?Q?EnpU7nrVumjhpF9f+utIkpoasWwzJaBRGjJgcEQmdeMEgK5uTSwnP7hTSh?=
 =?iso-8859-1?Q?2FIgEnkPbRwuoCXslq4je/j6R35Z16A/jk3PXJGzHOzICeEIQ8+z6OE3KU?=
 =?iso-8859-1?Q?leAdDhWyu28jPPaIvKMZf+PwGyVphk1ldv7NCUd/MoZezgW7EH3TNNxQAP?=
 =?iso-8859-1?Q?4M3hbk70RPcxug7+aREki7MGh+7hsbdbK+G/IXks14IxazHH/9HR6+tuCd?=
 =?iso-8859-1?Q?QgdnE2gHIMGELe3Mg/KcNTktbZyuYN3ksJBpD9hOdhF2VIcbRK3ZO6/WYN?=
 =?iso-8859-1?Q?kJfvodVmj9gj2KgGcQ+8PI5YUTf/YgN2Y5hDc7rnxSd/quo6ysemUDqvFh?=
 =?iso-8859-1?Q?4RQGUu4WlyPh0/gvMJ10Z9DH5EV15fH/YVEXd4qgNbW3Unh4vEjP2BhNbg?=
 =?iso-8859-1?Q?e/r5dIpvYXZZqwfKRB9J637Lef/zO7mnYiYA9Cz54jy22nPb7CS9jc3L6w?=
 =?iso-8859-1?Q?7BSaDXgVoPI0TKkJvTfbQvocHXclbeLVENYcDo3vdt1lIa2px3Pl2ALHgn?=
 =?iso-8859-1?Q?F2vu7wIbbMbEIOQZ5zPS8mep+ngxX8gtcNydcj1n/vqFxv4+Int2iyJ24t?=
 =?iso-8859-1?Q?Gcl6EO+BW7GKF5rvlvWajIgkEpqzkSgHpo4EbWKDFwaHBN7ub+k4427KsL?=
 =?iso-8859-1?Q?0Viomz2ZPaQf0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f6d5a2-db03-4f02-0631-08dcaa261029
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2024 08:12:43.6137 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IA64Z0nSgGFJIi6URe11ygi8hzCTJvt+IC4WFufPfXU0LvJescQVWOvz1ZrhxaPi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7182
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

[AMD Official Use Only - AMD Internal Distribution Only]

Sorry if I mangled the reply. AMDs mail servers seem to have a hickup this =
morning and I have to use OWA.

________________________________________
Von: Matthew Brost <matthew.brost@intel.com>
Gesendet: Freitag, 19. Juli 2024 19:39
An: Christian K=F6nig
Cc: Tvrtko Ursulin; dri-devel@lists.freedesktop.org; kernel-dev@igalia.com;=
 Tvrtko Ursulin; Koenig, Christian; Deucher, Alexander; Luben Tuikov; Danie=
l Vetter; amd-gfx@lists.freedesktop.org; stable@vger.kernel.org
Betreff: Re: [PATCH] drm/scheduler: Fix drm_sched_entity_set_priority()

On Fri, Jul 19, 2024 at 05:18:05PM +0200, Christian K=F6nig wrote:
> Am 19.07.24 um 15:02 schrieb Christian K=F6nig:
> > Am 19.07.24 um 11:47 schrieb Tvrtko Ursulin:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > >
> > > Long time ago in commit b3ac17667f11 ("drm/scheduler: rework entity
> > > creation") a change was made which prevented priority changes for
> > > entities
> > > with only one assigned scheduler.
> > >
> > > The commit reduced drm_sched_entity_set_priority() to simply update t=
he
> > > entities priority, but the run queue selection logic in
> > > drm_sched_entity_select_rq() was never able to actually change the
> > > originally assigned run queue.
> > >
> > > In practice that only affected amdgpu, being the only driver which
> > > can do
> > > dynamic priority changes. And that appears was attempted to be rectif=
ied
> > > there in 2316a86bde49 ("drm/amdgpu: change hw sched list on ctx prior=
ity
> > > override").
> > >
> > > A few unresolved problems however were that this only fixed
> > > drm_sched_entity_set_priority() *if* drm_sched_entity_modify_sched() =
was
> > > called first. That was not documented anywhere.
> > >
> > > Secondly, this only works if drm_sched_entity_modify_sched() is actua=
lly
> > > called, which in amdgpu's case today is true only for gfx and compute=
.
> > > Priority changes for other engines with only one scheduler assigned,
> > > such
> > > as jpeg and video decode will still not work.
> > >
> > > Note that this was also noticed in 981b04d96856 ("drm/sched: improve
> > > docs
> > > around drm_sched_entity").
> > >
> > > Completely different set of non-obvious confusion was that whereas
> > > drm_sched_entity_init() was not keeping the passed in list of schedul=
ers
> > > (courtesy of 8c23056bdc7a ("drm/scheduler: do not keep a copy of sche=
d
> > > list")), drm_sched_entity_modify_sched() was disagreeing with that an=
d
> > > would simply assign the single item list.
> > >
> > > That incosistency appears to be semi-silently fixed in ac4eb83ab255
> > > ("drm/sched: select new rq even if there is only one v3").
> > >
> > > What was also not documented is why it was important to not keep the
> > > list of schedulers when there is only one. I suspect it could have
> > > something to do with the fact the passed in array is on stack for man=
y
> > > callers with just one scheduler. With more than one scheduler amdgpu =
is
> > > the only caller, and there the container is not on the stack. Keeping=
 a
> > > stack backed list in the entity would obviously be undefined behaviou=
r
> > > *if* the list was kept.
> > >
> > > Amdgpu however did only stop passing in stack backed container for
> > > the more
> > > than one scheduler case in 977f7e1068be ("drm/amdgpu: allocate
> > > entities on
> > > demand"). Until then I suspect dereferencing freed stack from
> > > drm_sched_entity_select_rq() was still present.
> > >
> > > In order to untangle all that and fix priority changes this patch is
> > > bringing back the entity owned container for storing the passed in
> > > scheduler list.
> >
> > Please don't. That makes the mess just more horrible.
> >
> > The background of not keeping the array is to intentionally prevent the
> > priority override from working.
> >
> > The bug is rather that adding drm_sched_entity_modify_sched() messed
> > this up.
>
> To give more background: Amdgpu has two different ways of handling priori=
ty:
> 1. The priority in the DRM scheduler.
> 2. Different HW rings with different priorities.
>
> Your analysis is correct that drm_sched_entity_init() initially dropped t=
he
> scheduler list to avoid using a stack allocated list, and that functional=
ity
> is still used in amdgpu_ctx_init_entity() for example.
>
> Setting the scheduler priority was basically just a workaround because we
> didn't had the hw priorities at that time. Since that is no longer the ca=
se
> I suggest to just completely drop the drm_sched_entity_set_priority()
> function instead.
>

+1 on this idea of dropping drm_sched_entity_set_priority if it doesn't
really work and unused.

[CK]
The problem is it kind of works, but only because of coincident and not bec=
ause of good engineering.

It certainly unused in Xe and Xe has HW rings with different priorities
via the GuC interface. I belive this is also true for all new drivers
based on my interactions.

[CK]
Thx, good to know.

We should not be adding complexity the scheduler without a use case.

[CK]
Completely agree. But just for the record: Tvrtko, it's really appreciated =
that you looked into that.

This patch here and an internal comment from Vitaly made me realize that th=
e scheduler had another problem in the timeout handling which allows driver=
s to happily create infinity fences.

*sigh* going to send a patch to fix that,
Christian.

Matt

> In general scheduler priorities were meant to be used for things like ker=
nel
> queues which would always have higher priority than user space submission=
s
> and using them for userspace turned out to be not such a good idea.
>
> Regards,
> Christian.
>
> >
> > Regards,
> > Christian.
> >
> >
> > > Container is now owned by the entity and the pointers are
> > > owned by the drivers. List of schedulers is always kept including
> > > for the
> > > one scheduler case.
> > >
> > > The patch can therefore also removes the single scheduler special cas=
e,
> > > which means that priority changes should now work (be able to change =
the
> > > selected run-queue) for all drivers and engines. In other words
> > > drm_sched_entity_set_priority() should now just work for all cases.
> > >
> > > To enable maintaining its own container some API calls needed to grow=
 a
> > > capability for returning success/failure, which is a change which
> > > percolates mostly through amdgpu source.
> > >
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Fixes: b3ac17667f11 ("drm/scheduler: rework entity creation")
> > > References: 8c23056bdc7a ("drm/scheduler: do not keep a copy of
> > > sched list")
> > > References: 977f7e1068be ("drm/amdgpu: allocate entities on demand")
> > > References: 2316a86bde49 ("drm/amdgpu: change hw sched list on ctx
> > > priority override")
> > > References: ac4eb83ab255 ("drm/sched: select new rq even if there is
> > > only one v3")
> > > References: 981b04d96856 ("drm/sched: improve docs around
> > > drm_sched_entity")
> > > Cc: Christian K=F6nig <christian.koenig@amd.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: amd-gfx@lists.freedesktop.org
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: <stable@vger.kernel.org> # v5.6+
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c   | 31 +++++---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h   |  2 +-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c | 13 +--
> > >   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c   |  3 +-
> > >   drivers/gpu/drm/scheduler/sched_entity.c  | 96 ++++++++++++++++----=
---
> > >   include/drm/gpu_scheduler.h               | 16 ++--
> > >   6 files changed, 100 insertions(+), 61 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> > > index 5cb33ac99f70..387247f8307e 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> > > @@ -802,15 +802,15 @@ struct dma_fence *amdgpu_ctx_get_fence(struct
> > > amdgpu_ctx *ctx,
> > >       return fence;
> > >   }
> > >   -static void amdgpu_ctx_set_entity_priority(struct amdgpu_ctx *ctx,
> > > -                       struct amdgpu_ctx_entity *aentity,
> > > -                       int hw_ip,
> > > -                       int32_t priority)
> > > +static int amdgpu_ctx_set_entity_priority(struct amdgpu_ctx *ctx,
> > > +                      struct amdgpu_ctx_entity *aentity,
> > > +                      int hw_ip,
> > > +                      int32_t priority)
> > >   {
> > >       struct amdgpu_device *adev =3D ctx->mgr->adev;
> > > -    unsigned int hw_prio;
> > >       struct drm_gpu_scheduler **scheds =3D NULL;
> > > -    unsigned num_scheds;
> > > +    unsigned int hw_prio, num_scheds;
> > > +    int ret =3D 0;
> > >         /* set sw priority */
> > >       drm_sched_entity_set_priority(&aentity->entity,
> > > @@ -822,16 +822,18 @@ static void
> > > amdgpu_ctx_set_entity_priority(struct amdgpu_ctx *ctx,
> > >           hw_prio =3D array_index_nospec(hw_prio, AMDGPU_RING_PRIO_MA=
X);
> > >           scheds =3D adev->gpu_sched[hw_ip][hw_prio].sched;
> > >           num_scheds =3D adev->gpu_sched[hw_ip][hw_prio].num_scheds;
> > > -        drm_sched_entity_modify_sched(&aentity->entity, scheds,
> > > -                          num_scheds);
> > > +        ret =3D drm_sched_entity_modify_sched(&aentity->entity, sche=
ds,
> > > +                            num_scheds);
> > >       }
> > > +
> > > +    return ret;
> > >   }
> > >   -void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx,
> > > -                  int32_t priority)
> > > +int amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx, int32_t
> > > priority)
> > >   {
> > >       int32_t ctx_prio;
> > >       unsigned i, j;
> > > +    int ret;
> > >         ctx->override_priority =3D priority;
> > >   @@ -842,10 +844,15 @@ void amdgpu_ctx_priority_override(struct
> > > amdgpu_ctx *ctx,
> > >               if (!ctx->entities[i][j])
> > >                   continue;
> > >   -            amdgpu_ctx_set_entity_priority(ctx, ctx->entities[i][j=
],
> > > -                               i, ctx_prio);
> > > +            ret =3D amdgpu_ctx_set_entity_priority(ctx,
> > > +                                 ctx->entities[i][j],
> > > +                                 i, ctx_prio);
> > > +            if (ret)
> > > +                return ret;
> > >           }
> > >       }
> > > +
> > > +    return 0;
> > >   }
> > >     int amdgpu_ctx_wait_prev_fence(struct amdgpu_ctx *ctx,
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> > > index 85376baaa92f..835661515e33 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> > > @@ -82,7 +82,7 @@ struct dma_fence *amdgpu_ctx_get_fence(struct
> > > amdgpu_ctx *ctx,
> > >                          struct drm_sched_entity *entity,
> > >                          uint64_t seq);
> > >   bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio);
> > > -void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx, int32_t
> > > ctx_prio);
> > > +int amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx, int32_t
> > > ctx_prio);
> > >     int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
> > >                struct drm_file *filp);
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
> > > index 863b2a34b2d6..944edb7f00a2 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c
> > > @@ -54,12 +54,15 @@ static int
> > > amdgpu_sched_process_priority_override(struct amdgpu_device *adev,
> > >         mgr =3D &fpriv->ctx_mgr;
> > >       mutex_lock(&mgr->lock);
> > > -    idr_for_each_entry(&mgr->ctx_handles, ctx, id)
> > > -        amdgpu_ctx_priority_override(ctx, priority);
> > > +    idr_for_each_entry(&mgr->ctx_handles, ctx, id) {
> > > +        r =3D amdgpu_ctx_priority_override(ctx, priority);
> > > +        if (r)
> > > +            break;
> > > +    }
> > >       mutex_unlock(&mgr->lock);
> > >         fdput(f);
> > > -    return 0;
> > > +    return r;
> > >   }
> > >     static int amdgpu_sched_context_priority_override(struct
> > > amdgpu_device *adev,
> > > @@ -88,11 +91,11 @@ static int
> > > amdgpu_sched_context_priority_override(struct amdgpu_device *adev,
> > >           return -EINVAL;
> > >       }
> > >   -    amdgpu_ctx_priority_override(ctx, priority);
> > > +    r =3D amdgpu_ctx_priority_override(ctx, priority);
> > >       amdgpu_ctx_put(ctx);
> > >       fdput(f);
> > >   -    return 0;
> > > +    return r;
> > >   }
> > >     int amdgpu_sched_ioctl(struct drm_device *dev, void *data,
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
> > > b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
> > > index 81fb99729f37..2453decc73c7 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
> > > @@ -1362,8 +1362,7 @@ static int vcn_v4_0_5_limit_sched(struct
> > > amdgpu_cs_parser *p,
> > >         scheds =3D p->adev->gpu_sched[AMDGPU_HW_IP_VCN_ENC]
> > >           [AMDGPU_RING_PRIO_0].sched;
> > > -    drm_sched_entity_modify_sched(job->base.entity, scheds, 1);
> > > -    return 0;
> > > +    return drm_sched_entity_modify_sched(job->base.entity, scheds, 1=
);
> > >   }
> > >     static int vcn_v4_0_5_dec_msg(struct amdgpu_cs_parser *p, struct
> > > amdgpu_job *job,
> > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > index 58c8161289fe..cb5cc65f461d 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > @@ -45,7 +45,12 @@
> > >    * @guilty: atomic_t set to 1 when a job on this queue
> > >    *          is found to be guilty causing a timeout
> > >    *
> > > - * Note that the &sched_list must have at least one element to
> > > schedule the entity.
> > > + * Note that the &sched_list must have at least one element to
> > > schedule the
> > > + * entity.
> > > + *
> > > + * The individual drm_gpu_scheduler pointers have borrow semantics, =
ie.
> > > + * they must remain valid during entities lifetime, while the
> > > containing
> > > + * array can be freed after this call returns.
> > >    *
> > >    * For changing @priority later on at runtime see
> > >    * drm_sched_entity_set_priority(). For changing the set of schedul=
ers
> > > @@ -69,27 +74,24 @@ int drm_sched_entity_init(struct
> > > drm_sched_entity *entity,
> > >       INIT_LIST_HEAD(&entity->list);
> > >       entity->rq =3D NULL;
> > >       entity->guilty =3D guilty;
> > > -    entity->num_sched_list =3D num_sched_list;
> > >       entity->priority =3D priority;
> > > -    /*
> > > -     * It's perfectly valid to initialize an entity without having
> > > a valid
> > > -     * scheduler attached. It's just not valid to use the scheduler
> > > before it
> > > -     * is initialized itself.
> > > -     */
> > > -    entity->sched_list =3D num_sched_list > 1 ? sched_list : NULL;
> > >       RCU_INIT_POINTER(entity->last_scheduled, NULL);
> > >       RB_CLEAR_NODE(&entity->rb_tree_node);
> > >   -    if (num_sched_list && !sched_list[0]->sched_rq) {
> > > -        /* Since every entry covered by num_sched_list
> > > -         * should be non-NULL and therefore we warn drivers
> > > -         * not to do this and to fix their DRM calling order.
> > > -         */
> > > -        pr_warn("%s: called with uninitialized scheduler\n", __func_=
_);
> > > -    } else if (num_sched_list) {
> > > -        /* The "priority" of an entity cannot exceed the number of
> > > run-queues of a
> > > -         * scheduler. Protect against num_rqs being 0, by
> > > converting to signed. Choose
> > > -         * the lowest priority available.
> > > +    if (num_sched_list) {
> > > +        int ret;
> > > +
> > > +        ret =3D drm_sched_entity_modify_sched(entity,
> > > +                            sched_list,
> > > +                            num_sched_list);
> > > +        if (ret)
> > > +            return ret;
> > > +
> > > +        /*
> > > +         * The "priority" of an entity cannot exceed the number of
> > > +         * run-queues of a scheduler. Protect against num_rqs being =
0,
> > > +         * by converting to signed. Choose the lowest priority
> > > +         * available.
> > >            */
> > >           if (entity->priority >=3D sched_list[0]->num_rqs) {
> > >               drm_err(sched_list[0], "entity with out-of-bounds
> > > priority:%u num_rqs:%u\n",
> > > @@ -122,19 +124,58 @@ EXPORT_SYMBOL(drm_sched_entity_init);
> > >    *         existing entity->sched_list
> > >    * @num_sched_list: number of drm sched in sched_list
> > >    *
> > > + * The individual drm_gpu_scheduler pointers have borrow semantics, =
ie.
> > > + * they must remain valid during entities lifetime, while the
> > > containing
> > > + * array can be freed after this call returns.
> > > + *
> > >    * Note that this must be called under the same common lock for
> > > @entity as
> > >    * drm_sched_job_arm() and drm_sched_entity_push_job(), or the
> > > driver needs to
> > >    * guarantee through some other means that this is never called
> > > while new jobs
> > >    * can be pushed to @entity.
> > > + *
> > > + * Returns zero on success and a negative error code on failure.
> > >    */
> > > -void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> > > -                    struct drm_gpu_scheduler **sched_list,
> > > -                    unsigned int num_sched_list)
> > > +int drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> > > +                  struct drm_gpu_scheduler **sched_list,
> > > +                  unsigned int num_sched_list)
> > >   {
> > > -    WARN_ON(!num_sched_list || !sched_list);
> > > +    struct drm_gpu_scheduler **new, **old;
> > > +    unsigned int i;
> > >   -    entity->sched_list =3D sched_list;
> > > +    if (!(entity && sched_list && (num_sched_list =3D=3D 0 ||
> > > sched_list[0])))
> > > +        return -EINVAL;
> > > +
> > > +    /*
> > > +     * It's perfectly valid to initialize an entity without having
> > > a valid
> > > +     * scheduler attached. It's just not valid to use the scheduler
> > > before
> > > +     * it is initialized itself.
> > > +     *
> > > +     * Since every entry covered by num_sched_list should be
> > > non-NULL and
> > > +     * therefore we warn drivers not to do this and to fix their
> > > DRM calling
> > > +     * order.
> > > +     */
> > > +    for (i =3D 0; i < num_sched_list; i++) {
> > > +        if (!sched_list[i]) {
> > > +            pr_warn("%s: called with uninitialized scheduler %u!\n",
> > > +                __func__, i);
> > > +            return -EINVAL;
> > > +        }
> > > +    }
> > > +
> > > +    new =3D kmemdup_array(sched_list,
> > > +                num_sched_list,
> > > +                sizeof(*sched_list),
> > > +                GFP_KERNEL);
> > > +    if (!new)
> > > +        return -ENOMEM;
> > > +
> > > +    old =3D entity->sched_list;
> > > +    entity->sched_list =3D new;
> > >       entity->num_sched_list =3D num_sched_list;
> > > +
> > > +    kfree(old);
> > > +
> > > +    return 0;
> > >   }
> > >   EXPORT_SYMBOL(drm_sched_entity_modify_sched);
> > >   @@ -341,6 +382,8 @@ void drm_sched_entity_fini(struct
> > > drm_sched_entity *entity)
> > > dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
> > >       RCU_INIT_POINTER(entity->last_scheduled, NULL);
> > > +
> > > +    kfree(entity->sched_list);
> > >   }
> > >   EXPORT_SYMBOL(drm_sched_entity_fini);
> > >   @@ -531,10 +574,6 @@ void drm_sched_entity_select_rq(struct
> > > drm_sched_entity *entity)
> > >       struct drm_gpu_scheduler *sched;
> > >       struct drm_sched_rq *rq;
> > >   -    /* single possible engine and already selected */
> > > -    if (!entity->sched_list)
> > > -        return;
> > > -
> > >       /* queue non-empty, stay on the same engine */
> > >       if (spsc_queue_count(&entity->job_queue))
> > >           return;
> > > @@ -561,9 +600,6 @@ void drm_sched_entity_select_rq(struct
> > > drm_sched_entity *entity)
> > >           entity->rq =3D rq;
> > >       }
> > >       spin_unlock(&entity->rq_lock);
> > > -
> > > -    if (entity->num_sched_list =3D=3D 1)
> > > -        entity->sched_list =3D NULL;
> > >   }
> > >     /**
> > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.=
h
> > > index 5acc64954a88..09e1d063a5c0 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -110,18 +110,12 @@ struct drm_sched_entity {
> > >       /**
> > >        * @sched_list:
> > >        *
> > > -     * A list of schedulers (struct drm_gpu_scheduler).  Jobs from
> > > this entity can
> > > -     * be scheduled on any scheduler on this list.
> > > +     * A list of schedulers (struct drm_gpu_scheduler).  Jobs from t=
his
> > > +     * entity can be scheduled on any scheduler on this list.
> > >        *
> > >        * This can be modified by calling
> > > drm_sched_entity_modify_sched().
> > >        * Locking is entirely up to the driver, see the above
> > > function for more
> > >        * details.
> > > -     *
> > > -     * This will be set to NULL if &num_sched_list equals 1 and @rq
> > > has been
> > > -     * set already.
> > > -     *
> > > -     * FIXME: This means priority changes through
> > > -     * drm_sched_entity_set_priority() will be lost henceforth in
> > > this case.
> > >        */
> > >       struct drm_gpu_scheduler        **sched_list;
> > >   @@ -568,9 +562,9 @@ int
> > > drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
> > >                           bool write);
> > >     -void drm_sched_entity_modify_sched(struct drm_sched_entity *enti=
ty,
> > > -                    struct drm_gpu_scheduler **sched_list,
> > > -                                   unsigned int num_sched_list);
> > > +int drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> > > +                  struct drm_gpu_scheduler **sched_list,
> > > +                  unsigned int num_sched_list);
> > >     void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
> > >   void drm_sched_job_cleanup(struct drm_sched_job *job);
> >
>
