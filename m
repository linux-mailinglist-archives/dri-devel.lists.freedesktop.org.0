Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 440273F10E2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 05:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26AF6E937;
	Thu, 19 Aug 2021 03:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F516E937;
 Thu, 19 Aug 2021 03:01:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMU6oyfRJqA8gnVvTKchoglMukyOSNSico0oKB+6X6tV1vTEe2O70EeMoVtQrdpgtk6jQH1bXYOzXH8MCyS5PsdKon57JMplOZOKjxPpJttBHyL3Lmn6McqoHLwt1aTMLY5z8Xq2l3Eu7OzFNr+3c7OlveTLdUkqg6WLuBDSf8FeeyVaNLuWaTHO7ByQDoNFNNtyeIJkhx3Qrrr0a+rI4IdCFb/JaD6VRq7g9tNoRdNSB2wBzZjnj8/h+qDdMRGu8vAwxD5ZGiLD3mj6LGNiDK376lY5FUerQQ9QA9m+6BQ3CerCxb6y7FmOtTrUstQF7XSAOfZQWH+Gn9g2iL+M5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MopjmcGPrfspO12MZj5Oa8Q9ADwQpHBGYoD2hM/+LHc=;
 b=SXz7UW7eOtsSj2/L8QS4cX3VVknH2HLd/SPVqfXlmIHUCJLs0Q3o5m9UWkx6covBlJmgFD0vuTiQSpfSx+qbTVPgc+zjkaJv3UIf4emWB/8NT6KKxbEvSnlRI8LGFOsOipm5kzi39LZW03TLI16vRvkSsaCVoKM+y6v9I5IPyuOad3CizRV8xWZXQ62Bc74Mh5UNalhFm0bCh4t+fHGPvr9gqeLppNTR+v7YTEGR7C8q7/DEG/ioOOrC+I5S7bdY9Hp+LNLAAaoRqCfu9sT920eYhGzAHHH7/XIGgEK2BzXcvv+fzHkQE9H0EUlkzt2nfDXHfmXjnwFmIQ8kigXhSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MopjmcGPrfspO12MZj5Oa8Q9ADwQpHBGYoD2hM/+LHc=;
 b=VLrcA9TqG/ovb7c1/JPEYOZ2Y/cdYdE6xP7DxOKT4REf69pUEHCQ/J3UVNLuCX6P8aCSq7EbvbuHW7jFPfAEDI1I+uBFf23btwqWTa0vCEVPYfJypsI+VKD8mhocro43ocQMjw+0//g3hNN+JS4a9Zm+Sv6ezgkyM+LxVZU1lPU=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by BL1PR12MB5063.namprd12.prod.outlook.com (2603:10b6:208:31a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Thu, 19 Aug
 2021 03:01:26 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 03:01:26 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>
CC: Alex Deucher <alexdeucher@gmail.com>, "Chen, JingWen"
 <JingWen.Chen2@amd.com>, Maling list - DRI developers
 <dri-devel@lists.freedesktop.org>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: RE: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
Thread-Topic: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
Thread-Index: AQHXlCM5tpADXUaHLkOoBAv6YPx0dat5SvoAgAAGzICAAAGgAIAAATMAgAAByYCAAMtvYA==
Date: Thu, 19 Aug 2021 03:01:26 +0000
Message-ID: <BL1PR12MB5269D5E7E2DEAA23C61A6C4E84C09@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <20210818112114.1417685-1-Jingwen.Chen2@amd.com>
 <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
 <69cbf5bd-42c2-be55-a604-43f4ebba159d@amd.com>
 <YR0Z7qtEti2hwZ7i@phenom.ffwll.local>
 <b92c62f2-7b1c-d4d8-cb84-1b5ccc3e4bb1@amd.com>
 <YR0cb43Wv8jGiIbb@phenom.ffwll.local>
In-Reply-To: <YR0cb43Wv8jGiIbb@phenom.ffwll.local>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-08-19T03:01:24Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=396c17dc-adb0-45c9-9edb-ae63fd499129;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b8e00da-dcb9-4fba-10e1-08d962bda2ae
x-ms-traffictypediagnostic: BL1PR12MB5063:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB50630B5AFF0076EFC102173984C09@BL1PR12MB5063.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K0NqoWe2o1CYx2p9TwmVMpNRCXxBM6An7MW+2DdNhdKflVLS55SyAgXiAlRKjDSeB9vAhKS9ys8SWBM66QGI8ttCgvgER6NXWKY1OqNxRN2gyDpobBMhhPFoWwCvyo0sVvFruFkXqaYwYkiVWjlzV+VFWPsbSxc0nBwk6ZWrVq0LFujO0/A3bVgcp1otPIFbveTX1svNjvDsbnWmW7abpBV6/JytkmRj3AMljlvpqk0CBA1uEoCDGZn3qmBczwx2ipP42qQkz8VeBJWaDA4OtoWXLwxotRhcxV3b7ye4eLsHLCAQ3ouAsD1HOz5ZQvMc/s1ta/u6Wr0rKMH8dx9+udbK3jeJrqqMdkILfH11BxxTcfyUGKvytV8xdudQLJe58sUvcSbiGInbPaWfDzGaEa0Qf1KQHJ8GgLAYQu9oEJzBRWsRIYWmPfGaMvs/a9jl4vVjDSL5sG4Vx3SLnxTeQwm34g704+YoINyydCNzlzNFsplPcfce9W8tg2tHrN1NbLe/7fATPQ0moxaEgiggS/5ofVNZJ9uiYBe9tyKKzbGBaJRvHQ6MdSAd04jgDpw89+lm2VFCe2F6BeUByIWas1rrZFBhTuDrLjjG0lKVGNaQuVwlF+W+KiOmxXaL6PGcLQgECVJy/iaGyNwRuNQlLqJIOV4b1gfbbxQEy54WYVnt8Nj69IWmtW1R6NL1FXa055zuLZGuaKM+7et152Dy36cRGKgucLeAXGzOUASuouNCpQ6Shx/VGjnVF/oe2DiMYWKwVGHICHF0mV7S0rRW6MrAP6ArH8TtAXRWnbcharU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(186003)(122000001)(54906003)(71200400001)(966005)(26005)(9686003)(38100700002)(8936002)(110136005)(33656002)(53546011)(8676002)(6506007)(478600001)(55016002)(316002)(45080400002)(52536014)(64756008)(4326008)(66446008)(38070700005)(7696005)(66946007)(83380400001)(5660300002)(2906002)(86362001)(6636002)(66556008)(76116006)(66476007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/wfj3fxOnZHpkX/m+3MCYvh9FBsSL0HXo5hb5jqKdWq0LzUEOqDahGpEkkTj?=
 =?us-ascii?Q?ZXfP3TLuDiTQid5e6qevK/WD7d56qW/dOStBZ1U4NBZG16B8JA2fZybo0P/Z?=
 =?us-ascii?Q?maOQvq1Y0flOX1AykHeTsEMtscKF3XP/uyyT1k2eh7VeUms//g+iPmgrGI5b?=
 =?us-ascii?Q?PmUhPwbwxL41GcerUtd5VCHUFVdfpGBoA8fs9QOz62GkNykXMrjHzVj1IpJR?=
 =?us-ascii?Q?kFNILa6uSnvQfeCkTBiv7hG4dsxYlCecqqkCkxJpRPOuNJQq/va1fvUlYcg7?=
 =?us-ascii?Q?MSEYHJvGkn4ktuUeTOvvMSC/lYm3EhbSpY6Dzvst7pwXDLKd5xKoHuD33d6A?=
 =?us-ascii?Q?JczQ8DcR6EvSm9tcE6qXVtdfKeb+CLg7Xnmizna94lpTBEpyUaBkyx/5mfOr?=
 =?us-ascii?Q?Ml5NEgWdrgPBYlDPdBIetLHBJ8GWgLC056ArkDp5KH1DNcwZang6GS5ViW16?=
 =?us-ascii?Q?O0ENDXUEcm0CAYqMTZ+z5NfIBsL2Y5j1hdOwFFRVyBqko+udufC79DEoqGTV?=
 =?us-ascii?Q?rNvN5RFyE/ivAcYmypzzGKWkn2UAXfdi7kNChI2qcn6xqjArDIkj1eaUvzxI?=
 =?us-ascii?Q?wsnY6DAwtp4T5bpxRtY1Y9bRJQuBfnqadEI7V2plUiE7PJg8zqXOrozj5VcN?=
 =?us-ascii?Q?Qy0MxCqrm+r6ORQnHK3r9UzP/wl1/q1a0s/lfp8h/ZZXwkF4L8I2LO7f3H6R?=
 =?us-ascii?Q?9AJtyhAd/f+WUiZCUSx3SOkhadahVjAXwQrcK2gqYTlfhciAxmOQRgiMtkhL?=
 =?us-ascii?Q?DP+rzLI0QtvuY4DQTkmDSnXtbnHnGqsVsjJvM+IeO+sS2/cy+jAm7Uh8/aNn?=
 =?us-ascii?Q?iWpKIVSwkQPJoIWaiNMK6ClKo5sV0LII9pwitmv2JN4cXWnZj9evCUP7KIXa?=
 =?us-ascii?Q?VHGvZ37t1FMFSnjivb4nrkem2poz+SR7PvAV6ooHf3BHuAJwnhWLnUV2oBzA?=
 =?us-ascii?Q?CwR4hOzALk4sQEkMY4eu6TDAngrwNdCBJ4bYDWtSclAe+gQBxCGQ1Kl9nf/x?=
 =?us-ascii?Q?AmDJUgEBC5e9oeHUBQOJsb2R1MRaZXL5EkQbjbOKqY6oIYUabPALiT1pUtCl?=
 =?us-ascii?Q?F0+T+P1Pt4bmY+hoewHOIuCHhjyhh/xHHVf7JTlm6Gu2X4RzBaJGGmbUkCBq?=
 =?us-ascii?Q?cQqtZMfMDdpLHXQZhsHlbiSIkmjtBW5dawKjan6LE5a0KYNzv9eOWjT1uP6z?=
 =?us-ascii?Q?rCvQbO3gQluWCqjKMxNYfRNh1Bii8yQlEQ7Ms2iwGKklH9RJJoJpLkKmggco?=
 =?us-ascii?Q?eDutzZvZTfK9YhOnh0A7BqseD/IRZAGqSgA/PbH/LQmqhK1v6C8+3qFKUshO?=
 =?us-ascii?Q?nMcStml0xexQKHjaiImnTwL+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8e00da-dcb9-4fba-10e1-08d962bda2ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2021 03:01:26.6307 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kQhc4k8ZMV9iJYY4UoyK4SJQAP0spgd2zc5bJZtrjQ54rCf68YuRV0hjh6e7pTJZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5063
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

Hi Andrey and Daniel

We worked for a really long time on this new feature to AMD that finally ca=
n pick up the bad job from all timedout ones, and the change in scheduler (=
get/put fence in drm_sched_job_timedout, and remove the bad job delete and =
put back) is the last piece for us.

While we understand and realized that after the "bad job list node delete l=
ogic" being removed from job_timedout,  there will be race issues introduce=
d if vendor's job_timeout calback is accessing the bad job  in parallel of =
scheduler doing "sched->ops->free_job(leanup_job)".

And to not introduce impact at all on those vendors I'd like to proposal a =
very simple change (which introduced a new bool member for scheduler to ind=
icate if the del/put-back logic is needed or not) , check  patch here below=
:

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_fence.c
index 47ea468..5e0bdc4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -495,6 +495,8 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *r=
ing,
 		return r;
 	}
=20
+	ring->sched.keep_bad_job =3D true;
+
 	return 0;
 }
=20
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sched=
uler/sched_main.c
index 92d8de2..e7ac384 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *=
work)
 {
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_job *job;
+	struct dma_fence *f =3D NULL;
=20
 	sched =3D container_of(work, struct drm_gpu_scheduler, work_tdr.work);
=20
@@ -328,7 +329,11 @@ static void drm_sched_job_timedout(struct work_struct =
*work)
 		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->threa=
d
 		 * is parked at which point it's safe.
 		 */
-		list_del_init(&job->list);
+		if (sched->keep_bad_job =3D=3D false)
+			list_del_init(&job->list);
+		else
+			f =3D dma_fence_get(job->s_fence->parent);//get parent fence here to pr=
event hw_fence dropping to zero due to sched-main's cleanup_jobs, for amdgp=
u once parent fence drop to zero the sched_job will be kfree-ed=20
+
 		spin_unlock(&sched->job_list_lock);
=20
 		job->sched->ops->timedout_job(job);
@@ -341,6 +346,8 @@ static void drm_sched_job_timedout(struct work_struct *=
work)
 			job->sched->ops->free_job(job);
 			sched->free_guilty =3D false;
 		}
+
+		dma_fence_put(f);
 	} else {
 		spin_unlock(&sched->job_list_lock);
 	}
@@ -396,7 +403,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, st=
ruct drm_sched_job *bad)
 	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
 	 * now until the scheduler thread is unparked.
 	 */
-	if (bad && bad->sched =3D=3D sched)
+	if (bad && bad->sched =3D=3D sched && sched->keep_bad_job =3D=3D false)
 		/*
 		 * Add at the head of the queue to reflect it was the earliest
 		 * job extracted.
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 4ea8606..5f9a640 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -301,6 +301,7 @@ struct drm_gpu_scheduler {
 	atomic_t                        _score;
 	bool				ready;
 	bool				free_guilty;
+	bool keep_bad_job;
 };
=20
 int drm_sched_init(struct drm_gpu_scheduler *sched,


Thanks=20

------------------------------------------
Monk Liu | Cloud-GPU Core team
------------------------------------------

-----Original Message-----
From: Daniel Vetter <daniel@ffwll.ch>=20
Sent: Wednesday, August 18, 2021 10:43 PM
To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>; Alex Deucher <alexdeucher@gmail.com>; =
Chen, JingWen <JingWen.Chen2@amd.com>; Maling list - DRI developers <dri-de=
vel@lists.freedesktop.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>; L=
iu, Monk <Monk.Liu@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad jo=
b."

On Wed, Aug 18, 2021 at 10:36:32AM -0400, Andrey Grodzovsky wrote:
>=20
> On 2021-08-18 10:32 a.m., Daniel Vetter wrote:
> > On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote:
> > > On 2021-08-18 10:02 a.m., Alex Deucher wrote:
> > >=20
> > > > + dri-devel
> > > >=20
> > > > Since scheduler is a shared component, please add dri-devel on=20
> > > > all scheduler patches.
> > > >=20
> > > > On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com=
> wrote:
> > > > > [Why]
> > > > > for bailing job, this commit will delete it from pending list=20
> > > > > thus the bailing job will never have a chance to be=20
> > > > > resubmitted even in advance tdr mode.
> > > > >=20
> > > > > [How]
> > > > > after embeded hw_fence into amdgpu_job is done, the race=20
> > > > > condition that this commit tries to work around is completely=20
> > > > > solved.So revert this commit.
> > > > > This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
> > > > > v2:
> > > > > add dma_fence_get/put() around timedout_job to avoid=20
> > > > > concurrent delete during processing timedout_job
> > > > >=20
> > > > > Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
> > > > > ---
> > > > >    drivers/gpu/drm/scheduler/sched_main.c | 23 +++++-------------=
-----
> > > > >    1 file changed, 5 insertions(+), 18 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c=20
> > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > index a2a953693b45..f9b9b3aefc4a 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct wor=
k_struct *work)
> > > > >    {
> > > > >           struct drm_gpu_scheduler *sched;
> > > > >           struct drm_sched_job *job;
> > > > > +       struct dma_fence *fence;
> > > > >           enum drm_gpu_sched_stat status =3D=20
> > > > > DRM_GPU_SCHED_STAT_NOMINAL;
> > > > >=20
> > > > >           sched =3D container_of(work, struct drm_gpu_scheduler,=
=20
> > > > > work_tdr.work); @@ -325,11 +326,10 @@ static void=20
> > > > > drm_sched_job_timedout(struct work_struct *work)
> > > > >=20
> > > > >           if (job) {
> > > > >                   /*
> > > > > -                * Remove the bad job so it cannot be freed by co=
ncurrent
> > > > > -                * drm_sched_cleanup_jobs. It will be reinserted =
back after sched->thread
> > > > > -                * is parked at which point it's safe.
> > > > > +                * Get job->s_fence->parent here to avoid concurr=
ent delete during
> > > > > +                * processing timedout_job
> > > > >                    */
> > > > > -               list_del_init(&job->list);
> > > > > +               fence =3D dma_fence_get(job->s_fence->parent);
> > >=20
> > > While this is true for amdgpu, it has no meaning for other drivers=20
> > > for whom we haven't done the refactoring of embedding HW fence=20
> > > (parent) into the job structure.
> > > In fact thinking
> > > about it, unless you do the HW fence embedding for all the drivers=20
> > > using the scheduler you cannot revert this patch or you will just=20
> > > break them.
> > btw, why did you do that embedding? I do still have my patches with=20
> > dma_fence annotations floating around, but my idea at least was to=20
> > fix that issue with a mempool, not with embeddeding. What was the=20
> > motivation for embedding the wh fence?
> > -Daniel
>=20
>=20
> The motivation was 2 fold, avoid memory allocation during jobs=20
> submissions (HW fence allocation) because as Christian explained this=20
> leads to deadlock with mm code during evictions due to memory pressure=20
> (Christian can clarify if I messed

Yeah that's the exact same thing I've chased with my dma_fence annotations,=
 but thus far zero to none interested in getting it sorted. I think it'd be=
 good to have some cross-driver agreement on how this should be solved befo=
re someone just charges ahead ...

> this explanation). Second is to exactly revert this patch because=20
> while it solved the issue described in the patch it created another=20
> with drivers who baildc out early during TDR handling for various=20
> reason and the job would just leak because it was already removed form=20
> pending list.

Can't we reinsert it before we restart the scheduler thread? It might need =
a separate list for that due to the lockless queue tricks. Or am I thinking=
 about the wrong kind of "we lost the job"?
-Danile

>=20
> Andrey
>=20
>=20
> >=20
> >=20
> > > Andrey
> > >=20
> > >=20
> > > > >                   spin_unlock(&sched->job_list_lock);
> > > > >=20
> > > > >                   status =3D job->sched->ops->timedout_job(job);
> > > > > @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct wor=
k_struct *work)
> > > > >                           job->sched->ops->free_job(job);
> > > > >                           sched->free_guilty =3D false;
> > > > >                   }
> > > > > +               dma_fence_put(fence);
> > > > >           } else {
> > > > >                   spin_unlock(&sched->job_list_lock);
> > > > >           }
> > > > > @@ -392,20 +393,6 @@ void drm_sched_stop(struct=20
> > > > > drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> > > > >=20
> > > > >           kthread_park(sched->thread);
> > > > >=20
> > > > > -       /*
> > > > > -        * Reinsert back the bad job here - now it's safe as
> > > > > -        * drm_sched_get_cleanup_job cannot race against us and r=
elease the
> > > > > -        * bad job at this point - we parked (waited for) any in =
progress
> > > > > -        * (earlier) cleanups and drm_sched_get_cleanup_job will =
not be called
> > > > > -        * now until the scheduler thread is unparked.
> > > > > -        */
> > > > > -       if (bad && bad->sched =3D=3D sched)
> > > > > -               /*
> > > > > -                * Add at the head of the queue to reflect it was=
 the earliest
> > > > > -                * job extracted.
> > > > > -                */
> > > > > -               list_add(&bad->list, &sched->pending_list);
> > > > > -
> > > > >           /*
> > > > >            * Iterate the job list from later to  earlier one and =
either deactive
> > > > >            * their HW callbacks or remove them from pending=20
> > > > > list if they already
> > > > > --
> > > > > 2.25.1
> > > > >=20

--
Daniel Vetter
Software Engineer, Intel Corporation
https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffw=
ll.ch%2F&amp;data=3D04%7C01%7Cmonk.liu%40amd.com%7C8ddd8838028242eb82c708d9=
625678cf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637648945806335873%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C1000&amp;sdata=3DuFdAwQH6yWm%2FC%2FdDeG8wXKNsOqI7dSQRGO9NbK=
kjYyU%3D&amp;reserved=3D0
