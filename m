Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AB83FD084
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 02:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AACB6E0FF;
	Wed,  1 Sep 2021 00:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2049.outbound.protection.outlook.com [40.107.101.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D646E0FF;
 Wed,  1 Sep 2021 00:56:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCXuxm4NBYWr4WKWfJJvvhKlAFS+yv+lXAgNvUrDwRZkgxK04g8/2ZSOqFJuDigXOZJlZ1NAQvoSS49OZXB1ig22eU2/xImMCPVTKoKqkOmrkJK96pwHZWbKN6GBgeUwiAfZW+ZnxFv14IgpXaUtjHcI6PpHKocGo6Gk0roFggVGOPaL9mV7mLJrx3vbcp+/moxbGKu+bMH2cAhcu+3cYZLSID/RWbJYNZQ+D+aj5TACfYA1YnhNneWVvl7Bn58kh6ZY5zy13hF5iBNawohlHclPXuNm2SAxo9UlqU7e6Y0ziluzN82TGgdIh6H1UEbYymMpyR+ACyq5XiATlops0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4D3EwUGyzfl3MM/KQ0eqPtlB0HYu1cPLVFvugJuvgQ=;
 b=JEJpCnTOxdDLlu0evBH0XP5dwqC4BmpdGyZyMOz/S/xJREhEXI0C/wQiw1uQHsjV6XgE8cv59FkkNeEvDq9kc+YdDCEdIhWKkrGrLYRwyT+W+/hSfjhnlOzSzdhyFkGfu+D+hUIif69fsTVYALoAUzRsR4RXj7EBXOYWV0PgZ5bsqZlK89AmySNIxWqHCNKliVfzZhtnicL3SHCmLGenb7/cJyiuFILg09vJlM+qDHEcHzpYZDT0tIWbNxw+DYHk+Qk7NVfIWcdUgJQkBbU4atRtKFDnhQSYpvYn3PLki+kStZ0in/vrCk0+a+x7fDC46h2WuJmrfcxlRtYGOnrHtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4D3EwUGyzfl3MM/KQ0eqPtlB0HYu1cPLVFvugJuvgQ=;
 b=sBTaaOD7mxEz1JPiWf6BUqvqqVGgjqYHMIt8hg0VQj25/u4o3vETEUBF66rfLtgeLRYgHjfA1EJOMB6OBuom/VSJ5wRANI7PClhbkepmk8gzouQwg/VgSmRRK2EBWrRSRGxXvLBUQ7rymWnhQYA7CkWO9RSA9sdyQEnpsGPf4qc=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by BL1PR12MB5093.namprd12.prod.outlook.com (2603:10b6:208:309::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 00:56:12 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a%5]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 00:56:12 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Chen,
 Jingwen" <Jingwen.Chen@amd.com>
Subject: RE: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
Thread-Topic: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
Thread-Index: AQHXnlP2mFtzZkoHtk2/en3mh4fQiauNk0kAgAAAugCAAMbjQA==
Date: Wed, 1 Sep 2021 00:56:12 +0000
Message-ID: <BL1PR12MB5269AB88B2FA44243C94897484CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
 <YS4nlkpjeitiwFy1@phenom.ffwll.local> <YS4oMrFTj0+wmMbY@phenom.ffwll.local>
In-Reply-To: <YS4oMrFTj0+wmMbY@phenom.ffwll.local>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-01T00:56:10Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=d16e3923-ff23-411c-ab94-833fe0c037dd;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52aacec9-2eac-4bbf-7eaf-08d96ce34b35
x-ms-traffictypediagnostic: BL1PR12MB5093:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB50934FA9D8034CE55500703F84CD9@BL1PR12MB5093.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1vlKZ7HqgrLWOdDv6DMn9HJ4+UfaXV4wjfxGzRPHY9nNt/5sw0AyKAxCgbkyq4MWyKuip9pcVE+Dy2FtDEKPELnNEuQcwXfd38Fkm2dq1MvAEHRqcD8gO+I9HayRIwivRtemYTYTpLSp84fSpvM9gOJwWcb2Ih4Xwxlqp/EdAwHLsZVOMJCj9uL2EWtbpnyfKOk9VvmVtkVLDXqh1cpo9UQRRSPOy9irO8OE7OawENZimiTsxaJ0aKF8h6FYtNHFhRi1+Z2qm+T6g2vhu0C8NkZhHlhOW6nwLW2qZHpWUkSSAIpwz7Y7F+uvXXWrDRf42vgs5zKjeVF/Y3beatEgNEDBC+yA7m84MtNI9jUrqdE1Lryt2riQCdz7chBQkd8JYZ4rBctgmelSDsAJbvMzBPWgL8AAeXOK/nHjndeV/WAb1XG7HWtjMI0PMCkHfnsfPd9srCcxRTitPNkyTKh7xrGOSSXabEq8kD04HiIhOo7gR/R+pCiRs8LNWo1CaPbzVwPCAkMiJc7aBvrjicaQtG/Sm5WWDrfcUtw8ZB3nVKPrnu2LSuDg7mIwvzUOu0OIg3psoFEJ0iKWiiSjYdlPbbtSwZXsaxCEoyAyY0q0T6XN8Zi1HiUttkGj4sKRbXA1iDhnjg17Wc32ewInnP5qBTRSJl43uQP/gyON/TTKNH+m0I599fbLV4RHIDFKEjD/KsqY1/6SCDYQNmL89dFK9RZL0NrXvsvnxSyNEJOnRAndLCckNhDPPv+XvERxL9EwtCjnyyN/63uT89pxXU4k8wUrIlQKhjiJA/bR191vLSGaYCrUKNJY+VcHr6cYU5e5xu8vFK0lJJyyF1OqHD+dRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(86362001)(186003)(66476007)(4326008)(83380400001)(38100700002)(26005)(64756008)(8936002)(66446008)(5660300002)(33656002)(54906003)(66556008)(71200400001)(2906002)(76116006)(478600001)(38070700005)(9686003)(53546011)(52536014)(6916009)(966005)(45080400002)(316002)(6506007)(66946007)(122000001)(8676002)(7696005)(55016002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cvAnPGaY5PTgzxqa1f2IRhh2+Hr6Dtn9h1/CMTlZ79zDeWHM9r7h9YUxZ1Ci?=
 =?us-ascii?Q?3W7tihY20jHZaMU+cThjgxX1hoMp7o3X9xJ5Q0jMVZCgnpO4m4pfGeAh5P/M?=
 =?us-ascii?Q?v0PbzyrMcNXL3KZW1NExe6OEIjx+2sZu81FKFsvaMDUp4MdoT1fCYJsV4Plk?=
 =?us-ascii?Q?kRVs6ibz7sw+DGE2c6D1sAVqbjJQOWnxEQRbXnQGwkJBCIWJlUoOkDk47W3O?=
 =?us-ascii?Q?pCfdQ0COCNe0Qtuw9h+2vYW5/DMw6WA+uMxdZBEIUx+OHOBG8G4HJ0PyLpJV?=
 =?us-ascii?Q?jgglMB7dULmq6/0aH97eHNHvVwvRmwuj2ftVBPs7UH28wHgWo5fyky2cRd3Y?=
 =?us-ascii?Q?0ZY73KVJQGlfB3Ctsysp2IK0Ag3XG0MV9GSqvjgX+drm43LcQODiXA3eFn6X?=
 =?us-ascii?Q?VD/6rwB1dbHhyzuZOYdp68kUXc86A0MeFmdP4Q5gzdYBwjwAqKNEzT5uvVeZ?=
 =?us-ascii?Q?nIrqxjAvDKrqG03u2oBuoBzj8ZRLQW1DS/556G3TCOsQ2WOgpBLHVtEgJWLm?=
 =?us-ascii?Q?WChrp8NyezorREzkseJI7R/CGo3M5cgzmd+CnPWnngjrMItR4BaXz5aZY5/i?=
 =?us-ascii?Q?Q5bEl0bFXEa4fHZWNY8zF1dDiAQGaolmX24w5wBduZSMrDMDjBntTs9mVXfb?=
 =?us-ascii?Q?Z1e9fqBA5OM0glAEI58innoTKkXLq9kBRxt5YQIJTLTInaFkCrFzdGalVFaB?=
 =?us-ascii?Q?FwT5YfGEsVTuubnd22PbaTmy7838ro8h1aRnBelgqR2aEl/WzPDUpSP0re8n?=
 =?us-ascii?Q?752vx3N3OqpZ/yhkPeS3rbdWvBW6HlGRj/VGvGaVRwPwi5EpPF27goPsKOGb?=
 =?us-ascii?Q?zsOVctgN3OvUlSbZLGuaRXOoKjO4bFUMU3+Vo8fYlZhTkg3KSLC2Dn2Vt1DL?=
 =?us-ascii?Q?fYhqbJg0moMAJ/wQq1SmiTvBpVq5cEWop5sG62y97ZmvA9eYNWPano/qADY3?=
 =?us-ascii?Q?kCuaRTpV1kvNr0sMMUdBIgEp0gPC9ZeACZYyD2qJyjvJrqHwKs8bbMyPsULE?=
 =?us-ascii?Q?+YCTuzDnjmqYC1PER2U/pcu4fJ6aXKoUXyz6KA81Ml6qwbrjl+GJzrlme8Pj?=
 =?us-ascii?Q?HjJ30tLfee+nSn/Q+aAm+Qz2QYeeWlom9IFW+K5kag3PQJ50wOincGE0ha/9?=
 =?us-ascii?Q?UUKFiqJOvgHOYpK/mooyFkba2yZy+4ylDv2a123F+rpbrp2VDDiWqlBOsC3S?=
 =?us-ascii?Q?qtQiBqLn1RzsfpaAymOo+4n9n+B3RXUIB/IusdbomEQkTI2Wr7AqCqTKtb7q?=
 =?us-ascii?Q?gEaGjul5QZBquM2sxbV5r5LaZj6sZ6udF1DHdkkK4iYu25isuwVWTiDIic7X?=
 =?us-ascii?Q?IhbtZLQT7mgQSyYO9Gl3K+xp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52aacec9-2eac-4bbf-7eaf-08d96ce34b35
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 00:56:12.3663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NhwVrSftWzz1Nf77PG0sjItY4EWBdO5xrSIhlVd6CQshEP9g4+WP20DPT/RhwnlX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5093
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

>> Also why don't we reuse the function drivers already have to stop a sche=
duler thread? We seem to have two kthread_park now, that's probably one too=
 much.
Are you referring to drm_sched_stop ?

That's  different, we don't need the logic from it, see that it go through =
pending list and remove all callbacks , etc... meanwhile vendor's timeout c=
allback will call drm_sched_stop in a proper way,
All we want in my patch is to simply park scheduler,
Besides, even you call drm_sched_stop in job_timeout you still run into the=
 warning issue I hit.=09

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
