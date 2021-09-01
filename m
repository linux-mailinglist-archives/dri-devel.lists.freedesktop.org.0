Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2573FD075
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 02:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257CB6E0FD;
	Wed,  1 Sep 2021 00:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34736E0FD;
 Wed,  1 Sep 2021 00:52:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfCPJ4pv/FM8mhShHBAjcgvcgDqxfs1cYTODregu37jkfrgzGVANT7su6VSH2FIGeu5TT66EecH3kgfcW5HjzMokUnq4GinLwgroifG5W4FSFWKjPJvMgp7n25yTLq13BZwbBgs8zUTydthhiWk41s1wN+XY0RImXgf8Y2rF/1sKpz8idxG5bwpC7fgse9a9u1GphFb+vB054XGnqMc9WJ+oHC+AckvJDjoKcjJXx/XSnmL5d+LCZ4JYKss8wJynE2FYG6paYxcrSu9IDhhedv+Exhe6P33gKSmZfu8iJN3BO6uGsMlu2w6qKER1VFy6HTxoD4bCeF0UZhlscNoFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pjrhe7NfIqCtcMRhNR4ffa2lii1vyY9ujvJU0uO5H3w=;
 b=mTdJZl01X165uxzaqbEMemKPaSdQdIFe2HLoPnPZJioZVFSzWyLttjIH23c3DQGBa2KEEeRoD/EsVB+CeH1PFJZs+66hXXZn8oJrrAW5CgPGVC9Q2pvS9vox2/ZHAM18L5vXKb+9QDpMbDvvN82aFlumGdeTU4E6TEn3BRPqCKRYqFtZELItTl8vTXnggj140Ll28ykTrGW54hvI6o7NvCABG9ZBF8HDIFD+xnQaDWiegqWhz092h/7+Yn9NqtArvnBFgocl7MMLzPBXSGxF4VEJVNycQq4W5OvoMLNp81mQtKpolbBLiBYaou6ChLW9NTAtLLN1Bsw2qID/rTLxRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pjrhe7NfIqCtcMRhNR4ffa2lii1vyY9ujvJU0uO5H3w=;
 b=jA2eDvrhra4g+oCLxPVK4Pz9snH4CSLSxskYThcWva1cB26frGC8cyymYUt1++xASXPn4t47VMvzTfkB5wFsUTzoDmrexRyAwMoaZoJ0iAw9/NtcmD/Nef01MYpRU0cfLrJzZzwFHr6nV0Z4C2r8rhom1i+f7/ReWxHP84kq9+I=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by BL1PR12MB5333.namprd12.prod.outlook.com (2603:10b6:208:31f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Wed, 1 Sep
 2021 00:52:51 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a%5]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 00:52:51 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Chen,
 Jingwen" <Jingwen.Chen@amd.com>
Subject: RE: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
Thread-Topic: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
Thread-Index: AQHXnlP2mFtzZkoHtk2/en3mh4fQiauNk0kAgADAWyA=
Date: Wed, 1 Sep 2021 00:52:51 +0000
Message-ID: <BL1PR12MB52690A616CA55D3CD772CB6184CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
 <YS4nlkpjeitiwFy1@phenom.ffwll.local>
In-Reply-To: <YS4nlkpjeitiwFy1@phenom.ffwll.local>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-01T00:52:48Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=c358fafe-6d23-405f-8972-3f97e2c94a7d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bcbcac27-d6cc-48b6-31ad-08d96ce2d3a3
x-ms-traffictypediagnostic: BL1PR12MB5333:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB5333D10A80D0854AC73464D184CD9@BL1PR12MB5333.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j2XWei0WF1jbGghccuOmqpDp2vs2XDSGxxWK47MjOhtL5NRd0FumkoCZATResYxNfpcLjuYoj1M7T0InTBz+2mUqY/iR3TiZr1Wy8rmitUpCCtokJHl4t/NyKSkuttcpNLhJHP2KZ+8lHoDLbjxTaCBroZoeEjYWZfVolxoTsEtbB8Tp+eMFME3LF4fvXqSa1Rzdt/UMKR4LVYrH5SHAU+scVNJ5b7KQtppIXG25Xvf3Sug+QSpmjbY3gWN5U7HRbn1yCVmYVovwawAHSB2qPGq/AvzrkWbPpL7WH6UXc2cIdwUzZffRNKXQhagOBk20GnRrzsmvEtGHVuXjExg3onR+8OPri1TyCawhtOUPyj0l97MBM4Z9rhFQCNS/Xu9CazupFoWNmwrPH5ZWD8QLcixfRVVb06rLhPf5HfHl0VlgGL229ctmsvIM9+rvDNIZ7CH/oLys/siUxPspKu1KDi6PITWB8+bPnf3Ech+pG02EfcnjVaOaxQ29RnOTrqZ/riuwpz6ehCV4zNv5QZ9UFYltmOwLDJ5Wlbxrf+Qggvb1BAYiiE9K0nh0gKejsF02kvz+cWwhGhscZDgBz+aPsKOQpHrFw2LyyCw/JVMdII8jqWfb2s3w4O7/3HF6uIu6SdAzH411S4AHHVcGwCQlUvMYtqWwj0Gn/YiXUHERv2UhxewSvx9+VtWt9CEG72JOPNE9CPtWl/4fVSGNb80bDNW1FhSpubeQc7Pa5KMN6CaBXjgFLrCuGD1GHRuvofV8nDlMi7LvGOLdkN7Oz2MkgRhERp8TWMWAuzqlKMFEWmQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(5660300002)(9686003)(38100700002)(55016002)(6916009)(66556008)(66476007)(478600001)(53546011)(66446008)(2906002)(54906003)(8936002)(33656002)(86362001)(66946007)(316002)(8676002)(4326008)(38070700005)(83380400001)(6506007)(122000001)(64756008)(71200400001)(966005)(52536014)(186003)(45080400002)(26005)(7696005)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XeAq6dhQGBJomZ+nGxjjfVS5WTCWxrV2G10YYlTzQEozWvWZRVHAVtCaxKDd?=
 =?us-ascii?Q?ZlhR54t/43dgvkZZfMy9WYrgE3QmrASJiFChBsLyI+1g19IhSqwAPhrKM1Dw?=
 =?us-ascii?Q?ILfXHjklocTahTjgNczmNZgumb58xrXz1fQG3nsCoKy8AORAccuht0fio3rC?=
 =?us-ascii?Q?QyEWCNFfRI1u5YOh1mD9YhbfwOSxmToqpVaVoV4Cy2URG69puHYHu7Fw2G0h?=
 =?us-ascii?Q?ag34jB8Sbvvbh8ZfOHXL8fbNBQ0un7s24FmTtjWhDmT6+m6JTRofHVsKXGFK?=
 =?us-ascii?Q?r/y6J/Yy1NcnUk+DntFqD7B02CXB9Bj9Bt5RjRQsc8zKgHyDj2vpdNmRh2ES?=
 =?us-ascii?Q?s+PoEXkavaLHQFc7vcezutYfgfUHAW6n+X1KHAReWS++a8UQm3j8KoHD0qwi?=
 =?us-ascii?Q?G5ccPhHy36KFnX6te+s+TcXwZq7YlwJ+z7cNpNfVMXVaapCw5XFHLo/OET5z?=
 =?us-ascii?Q?dWXrD2MbG8Yoyt6/hjAPzlpX+QbkujqMZV0GxD2zKDa6Ruvh/mFiNXG6Ufxa?=
 =?us-ascii?Q?cV/GdvlvvSr7vJnSBQRHGOLFB3dRESbK9FiypSxHEu8vAK+irzd0Qxml/Eol?=
 =?us-ascii?Q?9UiYFjjT+TZLlVFu7c32qKeS55UVUt3mkH8bDUEoqR6sbbb+nPi8oLokGMTP?=
 =?us-ascii?Q?JnF+93qBsxWLWe5iqGCmu+Om2eg+SiyZjdRC8uKfANtwzhdm/qCj+7DrNVf7?=
 =?us-ascii?Q?OtluCw5xy/kafogV5vV5Y4F9IX8yf0T3gMct/wnz+J0zr/9kphU5+8w5172W?=
 =?us-ascii?Q?W5g4taLvkdZDxHh1X7ZqiSXrlZ/06VSNXzeBcOmQgna8H3s5LDJebj8zlDHC?=
 =?us-ascii?Q?Wfo9rkgc3kZSxxRUwtQRGx0YfTalV74v80nnWrHT8oB/mZjJP6s/4SsGjxXk?=
 =?us-ascii?Q?lFRF89xX+063Drilrq2MHgZwxUCbAn7LVB6IC6SlFI8jDLUwFAh+VNUu10EG?=
 =?us-ascii?Q?I9O8H0BxUBvkPOgCiUNltAAiIyKa/u4Ud4zzLn1Q70EPWczAFHo8rUykS8NJ?=
 =?us-ascii?Q?p1LY4SCXtCWMOvV6ou0pzzmqaIZYGNBHzWX9s1/12A7gvhFk6zpaN4R8dinh?=
 =?us-ascii?Q?0aNXLWweyvNUmCavgi8ByZu27w7+aFdLhvrDwgJU56b7BeKEMCQBG/hx92IG?=
 =?us-ascii?Q?LVC+kYuvc7hbZTNGhp5TLYJvpzZPT/LExO7kChycNQ8j6bdd4O9eZuklJwiP?=
 =?us-ascii?Q?BNrAFHl/kzXAd3YHiUNtrQ1fMYOBVdEq03GE3ih1ByVn6WdEOA8kPNOTRPEZ?=
 =?us-ascii?Q?k9U9yzA3YrhrpZXG8oNqenwQl01W3vWR9uaHqu35sS9u44tpOvQ661n8JCve?=
 =?us-ascii?Q?amN04ox6i1Zuv80FpX7O8D5z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbcac27-d6cc-48b6-31ad-08d96ce2d3a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 00:52:51.6969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w33LfLI0KjqqCSoM9YrQgea5JfHMzG/XHVzIR410bSVQW5/Ge4Qrh5og0xk+qW/4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5333
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

>> This is a __ function, i.e. considered internal, and it's lockless atomi=
c, i.e. unordered. And you're not explaining why this works.

It's not a traditional habit from what I can see that put explain in code, =
but we can do that in mails ,
We want to park the scheduler in job_timeout to serialize the job accessing=
 from both sched and TO handler , but inside vendor's callback timeout_job =
at least both panfrost and amd=20
They both call drm_sched_stop() on all schedulers. =20

If we unconditionally call "kthread_park" in job_timedout  then the bailing=
 job's timedout will try to call "kthread_park" again on its scheduler and =
introduce "warning"

The scenario is :
1,Job1 on sched1 triggers timedout, and sched1 is parked,
2,vendor callback runs, it will usually stop all schedulers.
3,Job2 on sched2 triggers timedout, so the job_timedout also try to park sc=
hed2, but sched2 was stopped already by above step.  (job2's timeout is int=
roduced by job1, or by other VF)
          ---So there will be "warning" in kernel log from above step... af=
ter this "__kthread_should_park()" here we can avoid the warning, that's th=
e only reason I need this __function.
4,Before vendor callback exit, it will unpark all schedulers.

From another hand if we don't do the kthread_park() and still delete the jo=
b here (drop deleting/reinserting the job from pending_list  is what we wan=
t), we still have a small windows to hit the race issue:=20
That cleanup_job from sched thread is freeing the job while job is under pr=
ocessing by job_timedout or vendor's call back.

And the reason we want to avoid deleting/reinserting the timedout job is be=
cause we (amd vendor) have our own way to do a diagnostic on all jobs in pe=
nding list from all scheduler, we want to cherry-pick the real bad job=20
From all scheduler's pending list that causes this JOB TIMEOUT.

Besides, it is also much reasonable to park scheduler when job_timedout is =
running there, they should exclusively access those common members like sch=
ed_job. (due to spin_lock is off before running into vendor's calback)

Hope I explained ourselves well enough.

Thanks=20

------------------------------------------
Monk Liu | Cloud-GPU Core team
------------------------------------------

-----Original Message-----
From: Daniel Vetter <daniel@ffwll.ch>=20
Sent: Tuesday, August 31, 2021 8:59 PM
To: Liu, Monk <Monk.Liu@amd.com>
Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Chen, J=
ingwen <Jingwen.Chen@amd.com>
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler

Can we please have some actual commit message here, with detailed explanati=
on of the race/bug/whatever, how you fix it and why this is the best option=
?

On Tue, Aug 31, 2021 at 06:35:39PM +0800, Monk Liu wrote:
> tested-by: jingwen chen <jingwen.chen@amd.com>
> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> Signed-off-by: jingwen chen <jingwen.chen@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 24 ++++--------------------
>  1 file changed, 4 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c=20
> b/drivers/gpu/drm/scheduler/sched_main.c
> index ecf8140..894fdb24 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct work_stru=
ct *work)
>  	sched =3D container_of(work, struct drm_gpu_scheduler, work_tdr.work);
> =20
>  	/* Protects against concurrent deletion in drm_sched_get_cleanup_job=20
> */
> +	if (!__kthread_should_park(sched->thread))

This is a __ function, i.e. considered internal, and it's lockless atomic, =
i.e. unordered. And you're not explaining why this works.

Iow it's probably buggy, and an just unconditionally parking the kthread is=
 probably the right thing to do. If it's not the right thing to do, there's=
 a bug here for sure.
-Daniel

> +		kthread_park(sched->thread);
> +
>  	spin_lock(&sched->job_list_lock);
>  	job =3D list_first_entry_or_null(&sched->pending_list,
>  				       struct drm_sched_job, list);
> =20
>  	if (job) {
> -		/*
> -		 * Remove the bad job so it cannot be freed by concurrent
> -		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thr=
ead
> -		 * is parked at which point it's safe.
> -		 */
> -		list_del_init(&job->list);
>  		spin_unlock(&sched->job_list_lock);
> =20
> +		/* vendor's timeout_job should call drm_sched_start() */
>  		status =3D job->sched->ops->timedout_job(job);
> =20
>  		/*
> @@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched,=
 struct drm_sched_job *bad)
>  	kthread_park(sched->thread);
> =20
>  	/*
> -	 * Reinsert back the bad job here - now it's safe as
> -	 * drm_sched_get_cleanup_job cannot race against us and release the
> -	 * bad job at this point - we parked (waited for) any in progress
> -	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> -	 * now until the scheduler thread is unparked.
> -	 */
> -	if (bad && bad->sched =3D=3D sched)
> -		/*
> -		 * Add at the head of the queue to reflect it was the earliest
> -		 * job extracted.
> -		 */
> -		list_add(&bad->list, &sched->pending_list);
> -
> -	/*
>  	 * Iterate the job list from later to  earlier one and either deactive
>  	 * their HW callbacks or remove them from pending list if they already
>  	 * signaled.
> --
> 2.7.4
>=20

--=20
Daniel Vetter
Software Engineer, Intel Corporation
https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffw=
ll.ch%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7C4af6e233f48348677d5f08d9=
6c7f1db2%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660115493853883%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C1000&amp;sdata=3DRJsFMBCIveO5pJvhkEdV6CBbP4VRiJKqb62Py8U44t=
w%3D&amp;reserved=3D0
