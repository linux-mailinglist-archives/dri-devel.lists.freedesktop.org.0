Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B52B77F2875
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 10:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A015710E249;
	Tue, 21 Nov 2023 09:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 772 seconds by postgrey-1.36 at gabe;
 Tue, 21 Nov 2023 09:13:10 UTC
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9E810E249
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 09:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1700557987; x=1701162787; i=spasswolf@web.de;
 bh=OgMDYbjTbduLnMxNKYiU+Dvtst0DxaQ/+GLKy5V83bU=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date;
 b=r2kuJTvQhSlW/f7DnyIdcxP6hV3A/dvOU8JCBaL14z20AnL76iIvCg5L04TfmtiX
 42Hlk2V0L5oBgPQM54LwNztEotd5tkWg0zag/morUQ0+qGcLZJElqh7dAIxJQUEMj
 j+wqupd8Z1nXtzOeDA4nXHNNWCH7G7wliYJ0F6IwqVWrSQ+/uarIwsBuiBwnD4WfS
 5DbDp4ii5oPg82mEb4b48Zs7j52CPgsQw4m1E8o+fG6Xr/iwGLtgJekgEqiX2k1Bs
 bWoSx3HaSXEPypj40/nX8kA06SYyXmckcbOYt/RnKxOIyze6ZNjpkGJ9PP/slFrJL
 bPwTPShacLw4j8UFug==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MDMvE-1rDaMJ0lh0-00AuQf; Tue, 21
 Nov 2023 10:00:09 +0100
Message-ID: <36bece178ff5dc705065e53d1e5e41f6db6d87e4.camel@web.de>
Subject: drm scheduler redesign causes deadlocks [extended repost]
From: Bert Karwatzki <spasswolf@web.de>
To: dri-devel@lists.freedesktop.org
Date: Tue, 21 Nov 2023 10:00:07 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.50.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Loffa9Gm0acJdh4iiUijSup4geO5PZbibaFntJpeRblci5A7aVD
 +DLuANDoRxZfEqN+O6b6ANjUjOX+uWU/ACXPngPEkFP2yIMzVvDfo9uo2JqK8CssV5mdten
 vL7pDIUeQJk9MU7wJG3dOZ/MNfvO9e4hAkLSF68KcmZopdvjl9eLTHQ7uS8W98UfLXhvzZf
 Kf54x9RWNSSBsHuaRFmSg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:r8inz9jkh44=;pk5S95rfGvFIBhgcioLcOXq1qYB
 Qily0XqhYEZfIYQB422czopcIMQN78c2kXLnpoUXHJRjWqdR+kWXV5K98ARnuRu4xNL9TqNqs
 d+9R57E06wwCzE4nnWuqhcpC3n6XqZADz54Pqw6dj2C85G793Tmqcl2JGc9LNfUCP9b6kS74R
 2ebMrnvxkhqck9SKbzgTE53ruUcqDGvi0PMkEuviCZ/QqNsA0St3hLFyLhGNc/aMXuvUJYQtJ
 HXw70EstggCGabzmusRMd8+ECFbiNRJxV0jqB9lJr5GfWM0HNP8GatfSXkdeKUFBAlPK3rkVf
 bkF47HrcM+tVhopm++SRXcTJzdK7ZRo29FDeE19nUj3XOxUHLiG9fRekG0zxgzO32pfSqp19D
 U7Mv3gBmF8V4KCnqnhusZYyzLBOMe0ByR7jIbaIHctmM3b2ellJS/erOeO9WyfBMxd4dGDq3s
 L8F/0Que57QNZR5kaTzbtdvrRc8bMnuovNFzM3WFviqznp90Z/qxBzjkt5tgKoAUp9JlJwsqp
 ln3eQFOTz2X2Ef7tbekU+9R8uQpMPS5QJxwavCDUmKKtd5wuML+ySt0+uCwOnf8fTwx+dPxHR
 4Dot5Pao4+1qaxjx8FhexZS0xiY18aT8DS6A2eA82dB4C8QFLddSNKk+ow5AHGb9zE5m31f9j
 91LUqFMKxAgOK28vlXYTiah2ZGYZyZENy7ixW3dJ2VtUf08yGzh/MAbf60VkcgxE6F8LN8p9D
 ICNvWbYsU211b5yuvM9xB6s2e2GdVUFm8wS0pFFobJK/W56FIltUX3GhHt5VWYqJDelTY1yYz
 WIZ8dd5RZ3WTVU9tBIhbGqQrSg312w6UPiWCJnwyEoiXiSsRvkWwf2HNT/LJbO2jYXWok5W0m
 BimOYWFM2PwlkBF+lnLUZWKjMzVrNBOXk8606pt7/1/GV4uTvYNAiAd1taL8jcClT4ghMaqbp
 rIVh7mJUDoWmXl/ICR+LjaXsp8s=
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Luben Tuikov <ltuikov89@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Bert Karwatzki <spasswolf@web.de>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since linux-next-20231115 my linux system (debian sid on msi alpha 15 lapt=
op)
suffers from random deadlocks which can occur after=C2=A0 30 - 180min of u=
sage. These
deadlocks can be actively provoked by creating high system load (usually b=
y
compiling a kernel with make -j NRCPUS) and the opening instances of libre=
office
=2D-writer until the system GUI locks (the mouse cursor can still be moved=
 but the
screen is frozen). In this state ssh'ing into the machine is still possibl=
e and
at least sometimes log messages about hung tasks appear in /var/log/kern.l=
og.

More info can be found here:
https://gitlab.freedesktop.org/drm/amd/-/issues/2994

Using the method described to trigger the bug I bisected the problem in th=
e
linux-next and drm-misc trees to give commit f3123c2590005 as the problem.
As this simple patch fixes the problem

diff --git a/drivers/gpu/drm/scheduler/sched_main.c
b/drivers/gpu/drm/scheduler/sched_main.c
index 044a8c4875ba..25b97db1b623 100644
=2D-- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1029,9 +1029,8 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
=C2=A0void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_en=
tity *entity)
=C2=A0{
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (drm_sched_entity_is_ready(entity=
))
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (drm_sched_can_queue(sched, entity))
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_run=
_job_queue(sched);
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (drm_sched_can_queue(sched, entit=
y))
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 drm_sched_run_job_queue(sched);
=C2=A0}
=C2=A0
=C2=A0/**

there might be in the entity->dependency branch of drm_sched_entity_is_rea=
dy
(some kind of circular dependencies ...).

To see if the change to drm_sched_wakeup is the actual cause of the proble=
m or
if this problem has been cause by the redesign of the drm scheduler in lin=
ux
next-20231115+, I created the following patch for linux-6.6.0:

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
b/drivers/gpu/drm/scheduler/sched_entity.c
index a42763e1429d..dc2abd299aeb 100644
=2D-- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -358,7 +358,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *=
f,
 container_of(cb, struct drm_sched_entity, cb);

 drm_sched_entity_clear_dep(f, cb);
- drm_sched_wakeup_if_can_queue(entity->rq->sched);
+ drm_sched_wakeup_if_can_queue(entity->rq->sched, entity);
 }

 /**
@@ -590,7 +590,7 @@ void drm_sched_entity_push_job(struct drm_sched_job
*sched_job)
 if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
 drm_sched_rq_update_fifo(entity, submit_ts);

- drm_sched_wakeup_if_can_queue(entity->rq->sched);
+ drm_sched_wakeup_if_can_queue(entity->rq->sched, entity);
 }
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c
b/drivers/gpu/drm/scheduler/sched_main.c
index 5a3a622fc672..bbe06403b33d 100644
=2D-- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -865,10 +865,11 @@ static bool drm_sched_can_queue(struct drm_gpu_sched=
uler
*sched)
  *
  * Wake up the scheduler if we can queue jobs.
  */
-void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
+void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched, struc=
t
drm_sched_entity *entity)
 {
- if (drm_sched_can_queue(sched))
- wake_up_interruptible(&sched->wake_up_worker);
+ if(drm_sched_entity_is_ready(entity))
+ if (drm_sched_can_queue(sched))
+ wake_up_interruptible(&sched->wake_up_worker);
 }

 /**
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index ac65f0626cfc..6cfe3d193e69 100644
=2D-- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -548,7 +548,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_en=
tity
*entity,
                                    unsigned int num_sched_list);

 void drm_sched_job_cleanup(struct drm_sched_job *job);
-void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
+void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched, struc=
t
drm_sched_entity *entity);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job
*bad);
 void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)=
;
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);

This brings the extra check to the old scheduler and has so far not caused=
 any
trouble (using the same stress test described above), so chances are that =
the
error is somewhere else in redesigned scheduler.


Bert Karwatzki

