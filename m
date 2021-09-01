Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A273FD050
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 02:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B526E0FB;
	Wed,  1 Sep 2021 00:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8C46E03F;
 Wed,  1 Sep 2021 00:32:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsE+ZoIBqAaa3uUs5YlMXrH709J7csJtlr6F1jmrj2O2ETqWkN2QMFy2zGwREXA+VUGFM+WsUw3FN2JqlQ/bouNoUQ3sDDC+XnQoQ/l5r6QcAnrWojJ7SjJEB+PtLG/6rNFbVHZA3pqIYT6OiP0GBGmZrf2R1UJ+5VFdxjHBpuqe8VvE2CHEK3kFfI16WYYriha5ItWFOhFuyMH4W4HbizaTKr1IjTjG30g2JxAoew57voAKaPT0hhkKF+EAGDEwTfFmnLm2zUxjC5GtC22snlxN0dxHog6uNLAkWG1ONbZLkoVQa5uP1J8L6uszIrq92OKcvtRFu1pDZGAUJtMOuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Wqwh7vdpyZ7J6h2sFVzx6I5jwbiP1wY6r2qeF6HBUI=;
 b=RMpvS1/C+6VXdF0+6xJYTa6by+4GfTowrFNZ+qA4mpG3MaLZ3NI7rKF1O3ZuEVqGACvq0AW1PH0BO2nn0LnJVnK8GImyk9mdkDFbCZ4AKYDuK1t6GGG05kXZ1sdBEneQxRasirVqCQnyI4/uffCC8i84QzAl76S6B7rHXn0PaIx1VSJVaOR0hSThog8sLuEiF5NcMPRj6LF18/jPf7XuQIcFGVmTMq98l2BYRu0jHlvxw5guk+9DZO0wHWZQ/lKsOnTWyaU/59honuxoJiAs6t1egMC032dVCuy7HeREjht+/rCyc1CaXjUMeVJsEniDh3DMHhAFYo6z2Y3eMPhLqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Wqwh7vdpyZ7J6h2sFVzx6I5jwbiP1wY6r2qeF6HBUI=;
 b=UHYtMfNahb3M/rjafiAkOc9YtD4FTqBLCyqkxznabmOWu2JhSmYeAjzScBUWH7SAD9FvgU9R8/dc8+Nyxy+AQuST0238Mr+KarWQ4Ze4N5BFwptiyWeC3JP86Jz0Y97hqwLJVSTPqV+0rBD5ss8E/eNpEYOUZw0G8Qj9n4S5yzI=
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Wed, 1 Sep
 2021 00:32:01 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d%6]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 00:32:01 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Liu, Monk" <Monk.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/sched: fix the bug of time out calculation(v3)
Thread-Topic: [PATCH 1/2] drm/sched: fix the bug of time out calculation(v3)
Thread-Index: AQHXnlP4Lzh4BdxhkEq+CunhlEGQT6uOUuUAgAAByuw=
Date: Wed, 1 Sep 2021 00:32:01 +0000
Message-ID: <SN6PR12MB46234BC2D9AB097B3550C9BAEACD9@SN6PR12MB4623.namprd12.prod.outlook.com>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <BL1PR12MB526965057AF19DCC9A8860EA84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB526965057AF19DCC9A8860EA84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38012bdb-aba5-4982-f10b-08d96cdfea60
x-ms-traffictypediagnostic: SA0PR12MB4447:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR12MB4447A7EEE2BB4DE110CC1F5FEACD9@SA0PR12MB4447.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D7Y3zh9WnTzi9e2LuQ1Dd0sDXgsiYRMJQQKixETnnExdSphWbt1ToUKWe2k0WdXk6HDXG1YeyomXSdNdOXxpMdrSaPrDWkAidIieniZi6wToZMG8kPGKDj3r4r0bTmdYn2+u3GbdgzNZg5IdmCXUZKjY8E/gMMMhU9Pzsz+oSnFi4kV57+bZDk4tZUI/iflI770mgq+o1oL8WyT3TusJKfiINpjDRRfDx/L9Z/ne/Ab6DYqCc1mJ+4WaHPlhSTtm9ppQiXDiVFcKwMz9cQtHi2SbW6YAQaPOwJOe8EXPTy6jIBVDpLuPc126EsRXNBB4zIOnWczIjemTSBPu3+c77tam1vnQCzgVl08td/2Gc5kIeYurTjVyyBeRX+JV7YzVUg2OMzVJX+i/xknORBc5kecI8X/alzY3bikskDSf2ZD46+2P3OYN2Rsu1gze25oP4AN2QBN9/wyorle54LCoskUqqHGkYxZZHg77ukfSm4Ex1S9UGqJnmCTLjY8+fP+zt42+BXY6frsb1FDCcVzStd7zqlf7rhDZldMzh23hTldt88AyvTcu0NBavdcaA0L7CZuCEXjjzfuc10j4ut5wjkllGhYaRlt2bWN31c5aX5AaocwwmzKQaNPSk8JWdQJyAdCTQlfpTvMJjSMppV5CrRHyxwDLPLwh60dUuJ6GnuRR0cuBHWcm+xhyuW1jhNPaZcFZ+5ata/8LVV+MCKQt6g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(7696005)(66476007)(66556008)(64756008)(186003)(33656002)(66446008)(316002)(76116006)(55016002)(110136005)(66946007)(9686003)(91956017)(38100700002)(5660300002)(8936002)(83380400001)(122000001)(8676002)(478600001)(53546011)(6506007)(52536014)(2906002)(450100002)(71200400001)(38070700005)(86362001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wZXkOsj9C3HOofwRDUODiNFBso8zgai0z9BScc367I91wALypMmfsmqjtGlN?=
 =?us-ascii?Q?mAF2SpzvNt3/bnCsTK6MyHHQydXl28DAd+5nR1tLFwOy4jg1JOLiZdZSFsZ3?=
 =?us-ascii?Q?2ZLsV62tWipedipUKNR3/EipJ5TJ+eOxgRtT8hX+7xGIwSMozGqcDOXzH0z0?=
 =?us-ascii?Q?5sUldPrkvj3H3YXNHkuWdAMuPUFCcMt96UUWbS/b1twva7H3+FoD9ONgr0b9?=
 =?us-ascii?Q?Ds+/wKCspOmDR6Vbr6eb+XP2Cikj38MRSaxwn5yFBcMQ4znovALtNDxG/1iV?=
 =?us-ascii?Q?YlOuDa9QTECsze9LlxCL5IJR69UoRhwdBnoDEsCqPmTlSjoCxBQmp+rusWvz?=
 =?us-ascii?Q?IOOY8BTqUpHeJ9wFF9clingM4+oB4ySEBiszoIOHt2seCmgzP5RadHVCGqLh?=
 =?us-ascii?Q?0j69eOu3pQDZP69Ga8lfD/apsEB9Pl0wGlnR1aZ4Tu3aHe4QCI3Rpe6PbnlH?=
 =?us-ascii?Q?oDuHirhqo6mdCL2chSTkj6SgLnNpYedZso6QzRUtpzPD9a5Unf5MvYEPHy7a?=
 =?us-ascii?Q?TkZExTn7rGS33EAaAdI5EYeeRwqdjXsxlpkvNM3offi7SdY/ETa/LnVY1ARb?=
 =?us-ascii?Q?zDABaaPniP4aC8LMothtW9d2kAq4ZYa9bwMSsco2QQu4pk9XljE398OZB6MG?=
 =?us-ascii?Q?NMGajiIwLf3W4QoufLmrtYedtURYhXbnslHKjRV/okv+RixQMDAmGcV12B5s?=
 =?us-ascii?Q?qNvCdVarSrk1TOsscgkdcmI0Bgdre5fP27AUxT2LglbSNL4AXFy5g5esoPCB?=
 =?us-ascii?Q?cD1FFQxZdEQmkUK36J+rWHJETw1NheR8pgTuJ60+RsykHiQ6rFEuWoUcYMvh?=
 =?us-ascii?Q?rUy7tWycyz71NbxAl4yoxhqaUO5HI2H3l3A4ZftVlCrxWpJr/7PegqbxDpel?=
 =?us-ascii?Q?FdeFanAVGODk+4Fex4uMtktn1GNylTn0a5v28eGbBdwEGPwhc3p9M+rnOIt7?=
 =?us-ascii?Q?QckSPU/oFqLkaO10znL/XTs3pXrFcIzWmNuhAuMLjEdGORNeb653zYV68DJ1?=
 =?us-ascii?Q?H59ht8RxFfhmRDUucdit2GSRO2Hkhjifi9KK0c0hsLFtYdC8APZ+oS7/GB7B?=
 =?us-ascii?Q?VvrFoT4wR1JgziE5HLo0gguRmy7HlrjH9pwUypHM1zQjqh7aPFXlkhTz2mSg?=
 =?us-ascii?Q?yghS8Lht5v6/7yr7K9Pjdu5/XEE3aOjg0D3hRyxQoDeZ+nRoOVvysRxvCy/t?=
 =?us-ascii?Q?Wh3tAmKjMEuZHBOMfPjqBlDH2fOJVv1eIRxw6RyODBYWawMo38JUmQy/o4JP?=
 =?us-ascii?Q?mmny84kTq0jzzw/NsrRw1r5r4mwL+1Ia50P8d2yW2T1PwE3+G6XOoomE/T6n?=
 =?us-ascii?Q?G/nWaIP4UL8xDKQ2CddVF0bZp5R2nFd0Do/S2Jqfqi/rBTbnrJYLSuUYQp1a?=
 =?us-ascii?Q?gQPb15k=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR12MB46234BC2D9AB097B3550C9BAEACD9SN6PR12MB4623namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38012bdb-aba5-4982-f10b-08d96cdfea60
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 00:32:01.4424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X9EcQvSFYGPB53lkYocuMOwJ9s3JjXrW7BSgvMHEsUA44xnpTsOQrBjJGDvlHzBzgp3yPvRz1NOEUZnM9A7DZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447
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

--_000_SN6PR12MB46234BC2D9AB097B3550C9BAEACD9SN6PR12MB4623namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

What about removing

(kthread_should_park()) ? We decided it's useless as far as I remember.

Andrey
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Liu, Mon=
k <Monk.Liu@amd.com>
Sent: 31 August 2021 20:24
To: Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@li=
sts.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/sched: fix the bug of time out calculation(v3)

[AMD Official Use Only]

Ping Christian, Andrey

Can we merge this patch first ? this is a standalone patch for the timer

Thanks

------------------------------------------
Monk Liu | Cloud-GPU Core team
------------------------------------------

-----Original Message-----
From: Monk Liu <Monk.Liu@amd.com>
Sent: Tuesday, August 31, 2021 6:36 PM
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org; Liu, Monk <Monk.Liu@amd.com>
Subject: [PATCH 1/2] drm/sched: fix the bug of time out calculation(v3)

issue:
in cleanup_job the cancle_delayed_work will cancel a TO timer even the its =
corresponding job is still running.

fix:
do not cancel the timer in cleanup_job, instead do the cancelling only when=
 the heading job is signaled, and if there is a "next" job we start_timeout=
 again.

v2:
further cleanup the logic, and do the TDR timer cancelling if the signaled =
job is the last one in its scheduler.

v3:
change the issue description
remove the cancel_delayed_work in the begining of the cleanup_job recover t=
he implement of drm_sched_job_begin.

TODO:
1)introduce pause/resume scheduler in job_timeout to serial the handling of=
 scheduler and job_timeout.
2)drop the bad job's del and insert in scheduler due to above serialization=
 (no race issue anymore with the serialization)

tested-by: jingwen <jingwen.chen@@amd.com>
Signed-off-by: Monk Liu <Monk.Liu@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sched=
uler/sched_main.c
index a2a9536..ecf8140 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -676,13 +676,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sc=
hed)  {
         struct drm_sched_job *job, *next;

-       /*
-        * Don't destroy jobs while the timeout worker is running  OR threa=
d
-        * is being parked and hence assumed to not touch pending_list
-        */
-       if ((sched->timeout !=3D MAX_SCHEDULE_TIMEOUT &&
-           !cancel_delayed_work(&sched->work_tdr)) ||
-           kthread_should_park())
+       if (kthread_should_park())
                 return NULL;

         spin_lock(&sched->job_list_lock);
@@ -693,17 +687,21 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *s=
ched)
         if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
                 /* remove job from pending_list */
                 list_del_init(&job->list);
+
+               /* cancel this job's TO timer */
+               cancel_delayed_work(&sched->work_tdr);
                 /* make the scheduled timestamp more accurate */
                 next =3D list_first_entry_or_null(&sched->pending_list,
                                                 typeof(*next), list);
-               if (next)
+
+               if (next) {
                         next->s_fence->scheduled.timestamp =3D
                                 job->s_fence->finished.timestamp;
-
+                       /* start TO timer for next job */
+                       drm_sched_start_timeout(sched);
+               }
         } else {
                 job =3D NULL;
-               /* queue timeout for next job */
-               drm_sched_start_timeout(sched);
         }

         spin_unlock(&sched->job_list_lock);
@@ -791,11 +789,8 @@ static int drm_sched_main(void *param)
                                           (entity =3D drm_sched_select_ent=
ity(sched))) ||
                                          kthread_should_stop());

-               if (cleanup_job) {
+               if (cleanup_job)
                         sched->ops->free_job(cleanup_job);
-                       /* queue timeout for next job */
-                       drm_sched_start_timeout(sched);
-               }

                 if (!entity)
                         continue;
--
2.7.4

--_000_SN6PR12MB46234BC2D9AB097B3550C9BAEACD9SN6PR12MB4623namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div>What about removing&nbsp;</div>
<div><br>
</div>
<div>(kthread_should_park()) ? We decided it's useless as far as I remember=
.</div>
<div><br>
</div>
<div>Andrey</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Liu, Monk &lt;Monk.Liu@amd.co=
m&gt;<br>
<b>Sent:</b> 31 August 2021 20:24<br>
<b>To:</b> Liu, Monk &lt;Monk.Liu@amd.com&gt;; amd-gfx@lists.freedesktop.or=
g &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;<br>
<b>Subject:</b> RE: [PATCH 1/2] drm/sched: fix the bug of time out calculat=
ion(v3)</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[AMD Official Use Only]<br>
<br>
Ping Christian, Andrey<br>
<br>
Can we merge this patch first ? this is a standalone patch for the timer <b=
r>
<br>
Thanks <br>
<br>
------------------------------------------<br>
Monk Liu | Cloud-GPU Core team<br>
------------------------------------------<br>
<br>
-----Original Message-----<br>
From: Monk Liu &lt;Monk.Liu@amd.com&gt; <br>
Sent: Tuesday, August 31, 2021 6:36 PM<br>
To: amd-gfx@lists.freedesktop.org<br>
Cc: dri-devel@lists.freedesktop.org; Liu, Monk &lt;Monk.Liu@amd.com&gt;<br>
Subject: [PATCH 1/2] drm/sched: fix the bug of time out calculation(v3)<br>
<br>
issue:<br>
in cleanup_job the cancle_delayed_work will cancel a TO timer even the its =
corresponding job is still running.<br>
<br>
fix:<br>
do not cancel the timer in cleanup_job, instead do the cancelling only when=
 the heading job is signaled, and if there is a &quot;next&quot; job we sta=
rt_timeout again.<br>
<br>
v2:<br>
further cleanup the logic, and do the TDR timer cancelling if the signaled =
job is the last one in its scheduler.<br>
<br>
v3:<br>
change the issue description<br>
remove the cancel_delayed_work in the begining of the cleanup_job recover t=
he implement of drm_sched_job_begin.<br>
<br>
TODO:<br>
1)introduce pause/resume scheduler in job_timeout to serial the handling of=
 scheduler and job_timeout.<br>
2)drop the bad job's del and insert in scheduler due to above serialization=
 (no race issue anymore with the serialization)<br>
<br>
tested-by: jingwen &lt;jingwen.chen@@amd.com&gt;<br>
Signed-off-by: Monk Liu &lt;Monk.Liu@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/scheduler/sched_main.c | 25 ++++++++++---------------=
<br>
&nbsp;1 file changed, 10 insertions(+), 15 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sched=
uler/sched_main.c<br>
index a2a9536..ecf8140 100644<br>
--- a/drivers/gpu/drm/scheduler/sched_main.c<br>
+++ b/drivers/gpu/drm/scheduler/sched_main.c<br>
@@ -676,13 +676,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sc=
hed)&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_sched_job *job,=
 *next;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Don't destroy jobs while the =
timeout worker is running&nbsp; OR thread<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * is being parked and hence ass=
umed to not touch pending_list<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((sched-&gt;timeout !=3D MAX_SCHED=
ULE_TIMEOUT &amp;&amp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !cancel_delay=
ed_work(&amp;sched-&gt;work_tdr)) ||<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kthread_shoul=
d_park())<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (kthread_should_park())<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return NULL;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;sched-&gt;j=
ob_list_lock);<br>
@@ -693,17 +687,21 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *s=
ched)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (job &amp;&amp; dma_fen=
ce_is_signaled(&amp;job-&gt;s_fence-&gt;finished)) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* remove job from pending_list */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; list_del_init(&amp;job-&gt;list);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* cancel this job's TO timer */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; cancel_delayed_work(&amp;sched-&gt;work_tdr);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* make the scheduled timestamp more accurate */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; next =3D list_first_entry_or_null(&amp;sched-&gt;pend=
ing_list,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; typeof(*nex=
t), list);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (next)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (next) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; next-=
&gt;s_fence-&gt;scheduled.timestamp =3D<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; job-&gt;s_fence-&gt;finished.tim=
estamp;<br>
-<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* start TO time=
r for next job */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_sched_start_=
timeout(sched);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; job =3D NULL;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* queue timeout for next job */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drm_sched_start_timeout(sched);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;sched-&gt=
;job_list_lock);<br>
@@ -791,11 +789,8 @@ static int drm_sched_main(void *param)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; (entity =3D drm_sched_select_entity(sched))) ||=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; kthread_should_stop());<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (cleanup_job) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (cleanup_job)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sched=
-&gt;ops-&gt;free_job(cleanup_job);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* queue timeout=
 for next job */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_sched_start_=
timeout(sched);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (!entity)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conti=
nue;<br>
--<br>
2.7.4<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN6PR12MB46234BC2D9AB097B3550C9BAEACD9SN6PR12MB4623namp_--
