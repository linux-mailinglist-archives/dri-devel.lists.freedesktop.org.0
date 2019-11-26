Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1DD10A14E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 16:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB156E42F;
	Tue, 26 Nov 2019 15:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760085.outbound.protection.outlook.com [40.107.76.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCB86E428;
 Tue, 26 Nov 2019 15:37:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuBB3jRva3FiR20a0yY6bh/1wfLIw79eX41BT3F9G/zBflAFhNJuBEYP1AMJqW7dU8dXnq+IsluzYpELf6qwfM8lMiauYV76dXoieF8TZEoz3hLQIlZfsSkiXfpYDdbqtSNs2WLnHz8sK2Lql9+7R9dvfcHdRPw7W2a1YDw7zQe0gfUM4kk6779x84ganaDWVgLiT0TVCSI0aVLXn3UZHB1ITRjgAHERQwKZINJMjwVZf95sF7opxopVyfErJbLWgDmNvUPlHrTyAbxDcXxyxt1zmgOYM5pYcukGf8nAWbAsaINiUbqVCCKCgZo8uwWHeh00h0YAmNKJciJu2c8QBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECM84T6gt44t+ub0fonh5jGeWeOVXHbmOA/gLltTYPE=;
 b=PFabp0lycLCpcIdYR3aGsQh3nF8sqq3k4fK7EqeVFB171cOxqPzu1pABVAAifmxBpVg7pAoYAHpHLkd3nE/IxcwhYf7MIBR8MK3Md0xCilgCgnSyISawaOeA4FDag+1ykdl8aofiqHpcGq1qFY5rpnHrbzEl/kLK/sSqEZMynJpAihg+yKwj7godzrEToi1NN9R8NhA0AfiPVFcKcgLvKzEgxVG7/kZZfrL9VaPQWMZxaMaGFMHsZnaZZofEUJ95VfWVKaOAQr1Q+74opLSTUUqgi8wm7BQVscG1GPEmclz2fJJzsZ9/Etl/bz91AQeNDVYQ8yrW1dx8CSvTF2VY+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1426.namprd12.prod.outlook.com (10.168.230.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Tue, 26 Nov 2019 15:36:57 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a53c:342f:cd6e:a616]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a53c:342f:cd6e:a616%9]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 15:36:57 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Thread-Topic: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Thread-Index: AQHVo9InpineTkoEGkOH8nSWUSg3Daeca2sAgAAofACAAQLDdw==
Date: Tue, 26 Nov 2019 15:36:57 +0000
Message-ID: <BN6PR12MB18093E836DB1098A42A3853AF7450@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>,
 <MN2PR12MB2975C10E36FF996BD423CEBA8F4A0@MN2PR12MB2975.namprd12.prod.outlook.com>,
 <MWHPR12MB1453C6FC45A83482232CA3EDEA450@MWHPR12MB1453.namprd12.prod.outlook.com>
In-Reply-To: <MWHPR12MB1453C6FC45A83482232CA3EDEA450@MWHPR12MB1453.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.59.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5107fd80-3f6b-4268-b8c0-08d7728678bc
x-ms-traffictypediagnostic: BN6PR12MB1426:|BN6PR12MB1426:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1426C84533AB04EE18A8972CF7450@BN6PR12MB1426.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(199004)(189003)(13464003)(6246003)(256004)(8676002)(6436002)(81166006)(8936002)(81156014)(478600001)(14444005)(55016002)(52536014)(2906002)(9686003)(71200400001)(71190400001)(25786009)(14454004)(86362001)(54896002)(66066001)(6636002)(33656002)(446003)(11346002)(74316002)(105004)(76116006)(91956017)(66946007)(66574012)(66446008)(64756008)(66556008)(66476007)(6506007)(5660300002)(99286004)(229853002)(7696005)(19627405001)(76176011)(4326008)(3846002)(6116002)(316002)(54906003)(110136005)(186003)(53546011)(102836004)(7736002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1426;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oiAVOJxDidKlDbbUJNBePfbgo66EeMywZCkFCrvgCMhZrXxvLF9bHEAjuWW0hC63xTxeDconDE1NC1mQxi5k+Sx4u70s/v29oRh7jpfUB7n3zblAFbMdgqERzAkh51cxwxAzEjRrQrckpwAbQqoQBMG115Oul3TkMCNUNtwG+Y4VvA95PKwntJwEBsYH220wN+3hvH885J5fZL7YHo+QMYrYiKzV2jrjPWfxpN+Q3fvosSytgNUD0T0ajkrd/IkA6GRCK+wdE+JBMBf2/zTmlt2kZJFKqKrI1bX56QL3DGniOHgK3EkraaW1eKwAhSbgVQWqHOWY9TXPJUMwnFgznWNLNd5SM9xH99GLX50/ifASgm3Db4pbm+p96zFTR3bHuSeiIXc1ScATP3bPxaMrgOqpzmWwBLXtQ0LU3kMLxv/zUeohnCcRTq4IqRyHn89X
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5107fd80-3f6b-4268-b8c0-08d7728678bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 15:36:57.1773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SPnWatC5cPd7+7kM6Ca1HCnGwzZpOJl/d6+tw6UHj2xHHSZUvjyeZOA4cb850uC0AG5ZBDZ4KK3Iw4EIFBTBSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1426
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECM84T6gt44t+ub0fonh5jGeWeOVXHbmOA/gLltTYPE=;
 b=DUQhgbTzk3fZTAtpbAAXus/HC3COcEqt3bMJmr7CRruC6upiVub8GHmrCydDkg+hmCsOUXU02rbcyDY0E1DX/p0/THHCJqX7Vj48CO8aHDm3gYCSWdUdI7fnKAHeQr/ZyICc03T7YqvOebe60dCYzQPb/meI1VR3UQW/8gOTW4s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "steven.price@arm.com" <steven.price@arm.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0609986488=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0609986488==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18093E836DB1098A42A3853AF7450BN6PR12MB1809namp_"

--_000_BN6PR12MB18093E836DB1098A42A3853AF7450BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I recently updated amd-staging-drm-next.  Apply whatever makes sense for no=
w and it'll naturally fall out in the next rebase.

Alex
________________________________
From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
Sent: Monday, November 25, 2019 7:09 PM
To: Deng, Emily <Emily.Deng@amd.com>
Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; amd-=
gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Koenig, Christia=
n <Christian.Koenig@amd.com>; steven.price@arm.com <steven.price@arm.com>; =
Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.

Christian asked to submit it to drm-misc instead of our drm-next to avoid l=
ater conflicts with Steven's patch which he mentioned in this thread which =
is not in drm-next yet.
Christian, Alex, once this merged to drm-misc I guess we need to pull all l=
atest changes from there to drm-next so the issue Emily reported can be avo=
ided.

Andrey

________________________________________
From: Deng, Emily <Emily.Deng@amd.com>
Sent: 25 November 2019 16:44:36
To: Grodzovsky, Andrey
Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koenig,=
 Christian; steven.price@arm.com; Grodzovsky, Andrey
Subject: RE: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.

[AMD Official Use Only - Internal Distribution Only]

Hi Andrey,
    Seems you didn't submit this patch?

Best wishes
Emily Deng



>-----Original Message-----
>From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>Sent: Monday, November 25, 2019 12:51 PM
>Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koenig=
,
>Christian <Christian.Koenig@amd.com>; Deng, Emily
><Emily.Deng@amd.com>; steven.price@arm.com; Grodzovsky, Andrey
><Andrey.Grodzovsky@amd.com>
>Subject: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
>
>Problem:
>Due to a race between drm_sched_cleanup_jobs in sched thread and
>drm_sched_job_timedout in timeout work there is a possiblity that bad job
>was already freed while still being accessed from the timeout thread.
>
>Fix:
>Instead of just peeking at the bad job in the mirror list remove it from t=
he list
>under lock and then put it back later when we are garanteed no race with
>main sched thread is possible which is after the thread is parked.
>
>v2: Lock around processing ring_mirror_list in drm_sched_cleanup_jobs.
>
>v3: Rebase on top of drm-misc-next. v2 is not needed anymore as
>drm_sched_get_cleanup_job already has a lock there.
>
>v4: Fix comments to relfect latest code in drm-misc.
>
>Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
>Tested-by: Emily Deng <Emily.Deng@amd.com>
>---
> drivers/gpu/drm/scheduler/sched_main.c | 27
>+++++++++++++++++++++++++++
> 1 file changed, 27 insertions(+)
>
>diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>b/drivers/gpu/drm/scheduler/sched_main.c
>index 6774955..1bf9c40 100644
>--- a/drivers/gpu/drm/scheduler/sched_main.c
>+++ b/drivers/gpu/drm/scheduler/sched_main.c
>@@ -284,10 +284,21 @@ static void drm_sched_job_timedout(struct
>work_struct *work)
>       unsigned long flags;
>
>       sched =3D container_of(work, struct drm_gpu_scheduler,
>work_tdr.work);
>+
>+      /* Protects against concurrent deletion in
>drm_sched_get_cleanup_job */
>+      spin_lock_irqsave(&sched->job_list_lock, flags);
>       job =3D list_first_entry_or_null(&sched->ring_mirror_list,
>                                      struct drm_sched_job, node);
>
>       if (job) {
>+              /*
>+               * Remove the bad job so it cannot be freed by concurrent
>+               * drm_sched_cleanup_jobs. It will be reinserted back after
>sched->thread
>+               * is parked at which point it's safe.
>+               */
>+              list_del_init(&job->node);
>+              spin_unlock_irqrestore(&sched->job_list_lock, flags);
>+
>               job->sched->ops->timedout_job(job);
>
>               /*
>@@ -298,6 +309,8 @@ static void drm_sched_job_timedout(struct
>work_struct *work)
>                       job->sched->ops->free_job(job);
>                       sched->free_guilty =3D false;
>               }
>+      } else {
>+              spin_unlock_irqrestore(&sched->job_list_lock, flags);
>       }
>
>       spin_lock_irqsave(&sched->job_list_lock, flags); @@ -370,6 +383,20
>@@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct
>drm_sched_job *bad)
>       kthread_park(sched->thread);
>
>       /*
>+       * Reinsert back the bad job here - now it's safe as
>+       * drm_sched_get_cleanup_job cannot race against us and release the
>+       * bad job at this point - we parked (waited for) any in progress
>+       * (earlier) cleanups and drm_sched_get_cleanup_job will not be
>called
>+       * now until the scheduler thread is unparked.
>+       */
>+      if (bad && bad->sched =3D=3D sched)
>+              /*
>+               * Add at the head of the queue to reflect it was the earli=
est
>+               * job extracted.
>+               */
>+              list_add(&bad->node, &sched->ring_mirror_list);
>+
>+      /*
>        * Iterate the job list from later to  earlier one and either deact=
ive
>        * their HW callbacks or remove them from mirror list if they alrea=
dy
>        * signaled.
>--
>2.7.4

--_000_BN6PR12MB18093E836DB1098A42A3853AF7450BN6PR12MB1809namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I recently updated amd-staging-drm-next.&nbsp; Apply whatever makes sense f=
or now and it'll naturally fall out in the next rebase.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Grodzovsky, Andrey &l=
t;Andrey.Grodzovsky@amd.com&gt;<br>
<b>Sent:</b> Monday, November 25, 2019 7:09 PM<br>
<b>To:</b> Deng, Emily &lt;Emily.Deng@amd.com&gt;<br>
<b>Cc:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt=
;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; steven.price@arm.com=
 &lt;steven.price@arm.com&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd=
.com&gt;<br>
<b>Subject:</b> Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job=
.</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Christian asked to submit it to drm-misc instead o=
f our drm-next to avoid later conflicts with Steven's patch which he mentio=
ned in this thread which is not in drm-next yet.<br>
Christian, Alex, once this merged to drm-misc I guess we need to pull all l=
atest changes from there to drm-next so the issue Emily reported can be avo=
ided.<br>
<br>
Andrey<br>
<br>
________________________________________<br>
From: Deng, Emily &lt;Emily.Deng@amd.com&gt;<br>
Sent: 25 November 2019 16:44:36<br>
To: Grodzovsky, Andrey<br>
Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koenig,=
 Christian; steven.price@arm.com; Grodzovsky, Andrey<br>
Subject: RE: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.<br>
<br>
[AMD Official Use Only - Internal Distribution Only]<br>
<br>
Hi Andrey,<br>
&nbsp;&nbsp;&nbsp; Seems you didn't submit this patch?<br>
<br>
Best wishes<br>
Emily Deng<br>
<br>
<br>
<br>
&gt;-----Original Message-----<br>
&gt;From: Andrey Grodzovsky &lt;andrey.grodzovsky@amd.com&gt;<br>
&gt;Sent: Monday, November 25, 2019 12:51 PM<br>
&gt;Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koe=
nig,<br>
&gt;Christian &lt;Christian.Koenig@amd.com&gt;; Deng, Emily<br>
&gt;&lt;Emily.Deng@amd.com&gt;; steven.price@arm.com; Grodzovsky, Andrey<br=
>
&gt;&lt;Andrey.Grodzovsky@amd.com&gt;<br>
&gt;Subject: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.<br>
&gt;<br>
&gt;Problem:<br>
&gt;Due to a race between drm_sched_cleanup_jobs in sched thread and<br>
&gt;drm_sched_job_timedout in timeout work there is a possiblity that bad j=
ob<br>
&gt;was already freed while still being accessed from the timeout thread.<b=
r>
&gt;<br>
&gt;Fix:<br>
&gt;Instead of just peeking at the bad job in the mirror list remove it fro=
m the list<br>
&gt;under lock and then put it back later when we are garanteed no race wit=
h<br>
&gt;main sched thread is possible which is after the thread is parked.<br>
&gt;<br>
&gt;v2: Lock around processing ring_mirror_list in drm_sched_cleanup_jobs.<=
br>
&gt;<br>
&gt;v3: Rebase on top of drm-misc-next. v2 is not needed anymore as<br>
&gt;drm_sched_get_cleanup_job already has a lock there.<br>
&gt;<br>
&gt;v4: Fix comments to relfect latest code in drm-misc.<br>
&gt;<br>
&gt;Signed-off-by: Andrey Grodzovsky &lt;andrey.grodzovsky@amd.com&gt;<br>
&gt;Reviewed-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<br>
&gt;Tested-by: Emily Deng &lt;Emily.Deng@amd.com&gt;<br>
&gt;---<br>
&gt; drivers/gpu/drm/scheduler/sched_main.c | 27<br>
&gt;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt; 1 file changed, 27 insertions(&#43;)<br>
&gt;<br>
&gt;diff --git a/drivers/gpu/drm/scheduler/sched_main.c<br>
&gt;b/drivers/gpu/drm/scheduler/sched_main.c<br>
&gt;index 6774955..1bf9c40 100644<br>
&gt;--- a/drivers/gpu/drm/scheduler/sched_main.c<br>
&gt;&#43;&#43;&#43; b/drivers/gpu/drm/scheduler/sched_main.c<br>
&gt;@@ -284,10 &#43;284,21 @@ static void drm_sched_job_timedout(struct<br>
&gt;work_struct *work)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long flags;<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sched =3D container_of(work, struc=
t drm_gpu_scheduler,<br>
&gt;work_tdr.work);<br>
&gt;&#43;<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Protects against concurrent dele=
tion in<br>
&gt;drm_sched_get_cleanup_job */<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock_irqsave(&amp;sched-&gt;jo=
b_list_lock, flags);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; job =3D list_first_entry_or_null(&=
amp;sched-&gt;ring_mirror_list,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; struct drm_sched_job, node);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (job) {<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; /*<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; * Remove the bad job so it cannot be freed by concurrent=
<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; * drm_sched_cleanup_jobs. It will be reinserted back aft=
er<br>
&gt;sched-&gt;thread<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; * is parked at which point it's safe.<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; */<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; list_del_init(&amp;job-&gt;node);<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; spin_unlock_irqrestore(&amp;sched-&gt;job_list_lock, flags);<b=
r>
&gt;&#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; job-&gt;sched-&gt;ops-&gt;timedout_job(job);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; /*<br>
&gt;@@ -298,6 &#43;309,8 @@ static void drm_sched_job_timedout(struct<br>
&gt;work_struct *work)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; job-&gt;sched=
-&gt;ops-&gt;free_job(job);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sched-&gt;fre=
e_guilty =3D false;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; }<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; spin_unlock_irqrestore(&amp;sched-&gt;job_list_lock, flags);<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock_irqsave(&amp;sched-&gt;j=
ob_list_lock, flags); @@ -370,6 &#43;383,20<br>
&gt;@@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct<br>
&gt;drm_sched_job *bad)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kthread_park(sched-&gt;thread);<br=
>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Reinsert back the bad job h=
ere - now it's safe as<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * drm_sched_get_cleanup_job c=
annot race against us and release the<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * bad job at this point - we =
parked (waited for) any in progress<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (earlier) cleanups and drm_=
sched_get_cleanup_job will not be<br>
&gt;called<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * now until the scheduler thr=
ead is unparked.<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (bad &amp;&amp; bad-&gt;sched =
=3D=3D sched)<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; /*<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; * Add at the head of the queue to reflect it was the ear=
liest<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; * job extracted.<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; */<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; list_add(&amp;bad-&gt;node, &amp;sched-&gt;ring_mirror_list);<=
br>
&gt;&#43;<br>
&gt;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Iterate the job list from =
later to&nbsp; earlier one and either deactive<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * their HW callbacks or remo=
ve them from mirror list if they already<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * signaled.<br>
&gt;--<br>
&gt;2.7.4<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB18093E836DB1098A42A3853AF7450BN6PR12MB1809namp_--

--===============0609986488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0609986488==--
