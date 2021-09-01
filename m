Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D793FD0B7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 03:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82206E10C;
	Wed,  1 Sep 2021 01:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C519F6E107;
 Wed,  1 Sep 2021 01:29:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dt0IbOWihUSoGRuev+O8krrNM9FPxSCdkYD2KLMVUUAYsNhmhnc9sD3JyDGFr4RcrWbBdS/gKtKR1Mh4RBOpID3Q0bzoBI43vKCTiDoW0X2sqBHmSkinpxbj3JYEs5hEqCHuS3KGtKjMqyafpmI3ffRRIzEpI2qQVYxT2DTg3+kNJ5n/DMxcHknJKP9oMqwTBNDBfiUDpAh0yiGFSXclmhBtycPWe6dUuM83YBr3AczdTNZtj0sY0w5tbV8MKNbSvqb8H+/vKrLdVw1VH5WstRYajx0t9DQdbyjFT/1EzERUsg+HzC7K4p9G2qY7Kd3mfGLy56Z8nce5OwZzXDQaog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IoesVJS42qi0rGgwujGKUYndVI92Z6/GsD5AAqzaqI=;
 b=HEbmAHZcqVR441bnnmxTgdn03Lmd1OnS9hck4+TbpKldjt6Bn+UUQnBRQUPmD0Iaa2WsYQNXPoLa6Z6kBc85RpTjvYOUpc6ZFtcYvfFmGEswmxwkpcIK/Fp2nSBj9Yl5S9Xawfof4odqfNDh598rHS+y9N7UqVhbxjTurLOd+ZrW0FOQknJdX7HG+Fm5w0boZg29djyOnkEnnPD5cFeL2Ep+3CvpnBJz2hxHn+SJn+0OJrWBA+mOo2xbIoM6rKPhsErMtXxf3d0a1d1ae/Eg4WeP9CmWM92QW8NNumQuNK5acH9k/7QQS207WjADY+jaz2AjAKqCxXK1MJNQbXCOqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IoesVJS42qi0rGgwujGKUYndVI92Z6/GsD5AAqzaqI=;
 b=DJA/goHnD04zBl8vE57pS2Z7VpLU+rv6Z2tsOeVngDYCgnY0iZMLN/gUmWsQ7F5Vd/tr/CIQb+91nlV3lEKs9kh+m9w6EZ303fyspEFELY9eRx0+EcaB1WS6MeVOyElqB/v5IB9i6jQsLNCFLSin+2HigV5p0lSIiZHba55frPI=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by BL1PR12MB5141.namprd12.prod.outlook.com (2603:10b6:208:309::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 01:29:20 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a%5]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 01:29:19 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Chen,
 Jingwen" <Jingwen.Chen@amd.com>
Subject: RE: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
Thread-Topic: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
Thread-Index: AQHXnlP2mFtzZkoHtk2/en3mh4fQiauNk0kAgAAAugCAANDbAA==
Date: Wed, 1 Sep 2021 01:29:19 +0000
Message-ID: <BL1PR12MB5269292A3E9E6014043C280E84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
 <YS4nlkpjeitiwFy1@phenom.ffwll.local> <YS4oMrFTj0+wmMbY@phenom.ffwll.local>
In-Reply-To: <YS4oMrFTj0+wmMbY@phenom.ffwll.local>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-01T01:29:18Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=bedbb393-8a99-432c-a673-d2d1dc91a9b7;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29f136d5-a108-4ba9-3088-08d96ce7ebd9
x-ms-traffictypediagnostic: BL1PR12MB5141:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB5141C9712331547946D1E2BF84CD9@BL1PR12MB5141.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BtoNB5nEMOFv/uA26BmRr3NThbFn0+lnANtHp51c+3MuorMKhyKQXeCBWQIlur3RriUBjCkj4m4wWgyOpgGTEQVquwRZ8nj5zJAOkkMDeTQPXe3g4NSyPWkbdgDgDACHjHVvQgybkubG+3NM97fzUt8mWmP5dPSb1g92uyGYwQ+xeIwC0oVoF92fHUWyz3jCUrdxbZn0WjrwsbM90pT3Y04zUpmFcnRsqjQZU1eOmThfQLveI5kiiUogoEpN11Ode4CsR+Wpdsx2IW/EKPGNLw9l0di69Xrw//u4MIPqPV78Zha+8x8BF+kqimeUdF/N3U7/iHQ64W3lFigIKVWJyCyGtxZdj5HNTrhNFYVZ94aq5QcVwOKvDe+yfXFB1CcSMGwidA4v4rn3xzgZe0hvokV/tZO4dfeSUX9iA93R+z6rCLwMFpBPZE4edcJ+y6PSU6gsF32+KkNPlmdQ12oQWT8DxIfY5seLtPizVzMk+wf8zrS+IyhqJk8cx5ytrUgVhoGdPlcYdVgVAgr2I94eZ/kr4bvywWw2Xt9mdM5mkZlvvMmk732hDHOR+wIiJ4p3Siiwp4DtUMGesu1/SGB4vukLm/+YamTZpv/RhlQXDPuPoQIa7eoClDCqokR94m2EZufwh7POFkTKaEMAMtLLzstMFPBzBlzGgle2zTz1qaDFrJZG/xCb0rlxPMkZqWsK67hgL6AiZmh3Fpfw1GJIzRqLbemADkDUcSIxo2xEYBNqWEOiyqntFQpCCy2dc9R0A9DAO8S7QrG1O9IxEfqu/eYMw8zcanPP0Do05tuDQE+sx4EypedEcBgEH5i8L3P2k1k2cLvfqvzzowKhACViSg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(66556008)(6916009)(5660300002)(122000001)(54906003)(966005)(71200400001)(508600001)(316002)(6506007)(66446008)(186003)(76116006)(53546011)(64756008)(83380400001)(86362001)(8936002)(38100700002)(66476007)(4326008)(2906002)(33656002)(38070700005)(7696005)(9686003)(45080400002)(66946007)(55016002)(52536014)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qa/Pp720j1SUvDCQkhZZDjdeIApt3HG9sIhtbs86GdFxKc8Acxoz5DMtCBqp?=
 =?us-ascii?Q?Zlz2n9ZiqujOpgq+5bSX0ubmDwOSGsr3CuvHywdFsLGTLWsMUzHnLvZmoUc9?=
 =?us-ascii?Q?YGjaRjhHUP/SC22iUiUZ7E5fL9IQg8qHl73ypjM9rFHl+ngeEJD+cV2mPxL3?=
 =?us-ascii?Q?KI1G9ADGfUX97/1NkRP4KOmWd0KDiWSIE6cd2/jNrPsvjd7xMPWKpsJQavFX?=
 =?us-ascii?Q?XHBBLX/HkVjO9zlYuCU/ASC8sanKNPqKjU7/FxBWX49vQGCbzDSaCnZlAcyc?=
 =?us-ascii?Q?D34ClInomtYmQu4Ey/cReIEdsNwhM1EIlhWK230XNgyBrvgTCDujHxy0Bb+s?=
 =?us-ascii?Q?YKsjEldRyIfJpY+COB/tJ9uo4fXMeIhbhKtBtVgrou8WgNAyTA1T7sxJiMGB?=
 =?us-ascii?Q?DXPD245HrQebi1ALeeDV4oLcZU1MdkdCVx1QNxNt/FjwPNiZUtAR5Mzmuot9?=
 =?us-ascii?Q?TBeP/+v+AJQHKlDH9MjtefX4fi0Djl2uX7tdYdZ1uk9q6AUMfsEwob99gH4H?=
 =?us-ascii?Q?Ey9eiPM5B5PIj9wEwY0IXvPCzpPJxzowZYO39nN/GpVeFOck4q3io0+amzEa?=
 =?us-ascii?Q?IJZLgo0KGCKz8QYgFE6PFOWpPcMnmkZoA9xlcCbKARkJukdrme09XMts69Vv?=
 =?us-ascii?Q?C6rCupdFPmkf+4zQGPjUm2vPaR8G+4SzwC7FKy6uvD4zxvXI5qF5Ck8hy3lP?=
 =?us-ascii?Q?6bs4RYpPiJQjdfyzN19Y0M8YswDeaLbRiGmiZnjKaRnG6ou/u7/GZwkAuMyo?=
 =?us-ascii?Q?fbGELFWmSe1oa+9MW1W4HgKGRLNRcQIf1rk2IgicoXZqBnJVcxiC38d0T9YF?=
 =?us-ascii?Q?kdAZu2ZtSffWMgATMHKenNYBiv3bDONF2qy4j3M3xUEIFAy9J5qC5Fi/Keuc?=
 =?us-ascii?Q?2P3O53n92rBQJp309E+9IqEdiNYJQyKxWi+11uNsv2sZHt8oxRTn2h2sRya0?=
 =?us-ascii?Q?w9h70pQp7qNfT4MVYG/O+8WRurd6Kmmcvr87bgHMb6+ljOd8ni/vGH3/xxIE?=
 =?us-ascii?Q?zv0UjyFXrQZZdOkA9l5sgCVWZCH0BakSjVZE1VZetjlswCAB9RLPFWyIE9+I?=
 =?us-ascii?Q?36NecF7D11jsf7c9CkNtUgxCD6+Sh3DKmp8sTxIYbS4NYNRNsUoQI/bWN2AN?=
 =?us-ascii?Q?fPce+MqNAS4oAsTCmw/O6eKr/FmVYtMgUZGm5AjGtAQ9/V2W6tUlwWk/zTXz?=
 =?us-ascii?Q?JzT1fEi0Yn60B54WELL2GZRw5E0nEkFkx+MCnlmfobcVikqkYGgMo4Q2sHuo?=
 =?us-ascii?Q?u2mRP2WOmE5N/c/9NEL8+bZafrMn4qAPUEJgQ8FnPLVL2b7nRqL6ajSecZ0c?=
 =?us-ascii?Q?Q8B0erOIZkJ4JQrsVqXqZmSW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f136d5-a108-4ba9-3088-08d96ce7ebd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 01:29:19.9222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: StuEv3txz4kwxpf2LIMvflMjoHr05ZqBzFYYHrasGR79Z8k8E6gG8juw1vPGZFC/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5141
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

[AMD Official Use Only]

Okay, I will reprepare this patch

Thanks=20

------------------------------------------
Monk Liu | Cloud-GPU Core team
------------------------------------------

-----Original Message-----
From: Daniel Vetter <daniel@ffwll.ch>=20
Sent: Tuesday, August 31, 2021 9:02 PM
To: Liu, Monk <Monk.Liu@amd.com>
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Chen, J=
ingwen <Jingwen.Chen@amd.com>
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler

On Tue, Aug 31, 2021 at 02:59:02PM +0200, Daniel Vetter wrote:
> Can we please have some actual commit message here, with detailed=20
> explanation of the race/bug/whatever, how you fix it and why this is=20
> the best option?
>=20
> On Tue, Aug 31, 2021 at 06:35:39PM +0800, Monk Liu wrote:
> > tested-by: jingwen chen <jingwen.chen@amd.com>
> > Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> > Signed-off-by: jingwen chen <jingwen.chen@amd.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 24=20
> > ++++--------------------
> >  1 file changed, 4 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c=20
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index ecf8140..894fdb24 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct work_st=
ruct *work)
> >  	sched =3D container_of(work, struct drm_gpu_scheduler,=20
> > work_tdr.work);
> > =20
> >  	/* Protects against concurrent deletion in=20
> > drm_sched_get_cleanup_job */
> > +	if (!__kthread_should_park(sched->thread))
>=20
> This is a __ function, i.e. considered internal, and it's lockless=20
> atomic, i.e. unordered. And you're not explaining why this works.
>=20
> Iow it's probably buggy, and an just unconditionally parking the=20
> kthread is probably the right thing to do. If it's not the right thing=20
> to do, there's a bug here for sure.

Also why don't we reuse the function drivers already have to stop a schedul=
er thread? We seem to have two kthread_park now, that's probably one too mu=
ch.
-Daniel

> > +		kthread_park(sched->thread);
> > +
> >  	spin_lock(&sched->job_list_lock);
> >  	job =3D list_first_entry_or_null(&sched->pending_list,
> >  				       struct drm_sched_job, list);
> > =20
> >  	if (job) {
> > -		/*
> > -		 * Remove the bad job so it cannot be freed by concurrent
> > -		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->t=
hread
> > -		 * is parked at which point it's safe.
> > -		 */
> > -		list_del_init(&job->list);
> >  		spin_unlock(&sched->job_list_lock);
> > =20
> > +		/* vendor's timeout_job should call drm_sched_start() */
> >  		status =3D job->sched->ops->timedout_job(job);
> > =20
> >  		/*
> > @@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sche=
d, struct drm_sched_job *bad)
> >  	kthread_park(sched->thread);
> > =20
> >  	/*
> > -	 * Reinsert back the bad job here - now it's safe as
> > -	 * drm_sched_get_cleanup_job cannot race against us and release the
> > -	 * bad job at this point - we parked (waited for) any in progress
> > -	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be calle=
d
> > -	 * now until the scheduler thread is unparked.
> > -	 */
> > -	if (bad && bad->sched =3D=3D sched)
> > -		/*
> > -		 * Add at the head of the queue to reflect it was the earliest
> > -		 * job extracted.
> > -		 */
> > -		list_add(&bad->list, &sched->pending_list);
> > -
> > -	/*
> >  	 * Iterate the job list from later to  earlier one and either deactiv=
e
> >  	 * their HW callbacks or remove them from pending list if they alread=
y
> >  	 * signaled.
> > --
> > 2.7.4
> >=20
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.
> ffwll.ch%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7C298815bea18f4fbf76
> b308d96c7f7a8b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6376601170
> 51194614%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
> CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DQzgCU7%2BPdA0aWL5%2BJLg
> KeKbGaMMGqeGI9KE0P0LXlN4%3D&amp;reserved=3D0

--
Daniel Vetter
Software Engineer, Intel Corporation
https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffw=
ll.ch%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7C298815bea18f4fbf76b308d9=
6c7f7a8b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660117051194614%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C1000&amp;sdata=3DQzgCU7%2BPdA0aWL5%2BJLgKeKbGaMMGqeGI9KE0P0=
LXlN4%3D&amp;reserved=3D0
