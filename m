Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ABB110567
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 20:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB9C6EBC2;
	Tue,  3 Dec 2019 19:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720077.outbound.protection.outlook.com [40.107.72.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27716EBC5;
 Tue,  3 Dec 2019 19:44:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBfkl6sGe/ny/RsdeGco9CXnxA12w/tq/PvHPO+Oz/hrz5Y7kihsfCqnhvdIViIkUlo7bGxOzQILUIgKMG+Xm0UNJamXTaLlzzZZZA24IxnRUZF3nU7raZCtVOxLZZ/lRge5xcuGIU1bL4DCXYmWjY2MsTELYZYZWaNphzFLuwIkz8MTRafNgKuDT+A1muyE37D6C1xevg40A5CAvWc6yIG5ilq/MXyI3Uj1oWcYKnk1pzlBVtrS8+xreqRWfmLijmaryiaVxOIrN0NuKtlq1UCoJvJZo3gOCQkUlbyurD7hK5S/TKlkGIef1WNoSWIAKfloQl80AQ/wh2LjNrM4+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MKFWrVKuD9Ll5IjDrNapmWQGuljBE2mqhPJaTjWzuw=;
 b=mwd4kE8nBrsTLeiyAqH8erPUkllUDg022mei2v1Kjoo8SVGb9QK4PkhQDThCRzWOvCfkb2qMnb4nU9ctZ/uPk8umZZ8UE/FjFxIsGn27v4SFNeBKwUJQR8lh6l6wQxhtBKhLpMidstC/OKsk6Gs0k/Blv4oVJffs+IwQM7026ZikYBkbnbhJgxbKTqCW/U0VH4bogr3XPpe3Dg0zzNq3izJdR1+O0EzgUGeX4xQG///G5QiCtpR0QBgKHGRWsxwMKFtRGk2Rl5VgRb/j9B+RjzYqiCruOcGBuaT51wByxV5ue/yExYwRZEN3+jRvkJvcOGzn6MkSa8fI9GwXML/tog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1358.namprd12.prod.outlook.com (10.169.203.148) by
 MWHPR12MB1405.namprd12.prod.outlook.com (10.169.206.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Tue, 3 Dec 2019 19:44:31 +0000
Received: from MWHPR12MB1358.namprd12.prod.outlook.com
 ([fe80::b94d:fcd8:729d:a94f]) by MWHPR12MB1358.namprd12.prod.outlook.com
 ([fe80::b94d:fcd8:729d:a94f%3]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 19:44:30 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Thread-Topic: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Thread-Index: AQHVo9InpineTkoEGkOH8nSWUSg3DaedlxiAgACYAgCACRV4gIABjlSAgAAJh3E=
Date: Tue, 3 Dec 2019 19:44:30 +0000
Message-ID: <MWHPR12MB13589D76D1F7D518FE7D6F08F7420@MWHPR12MB1358.namprd12.prod.outlook.com>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
 <b8b716a7-e235-38b2-ea6d-0a21881fa64e@amd.com>
 <MN2PR12MB2975CA8858F21FDF325C33FE8F440@MN2PR12MB2975.namprd12.prod.outlook.com>
 <MN2PR12MB2975F38D8FB87D9812E0B0C88F430@MN2PR12MB2975.namprd12.prod.outlook.com>,
 <40f1020c-fccf-99f9-33ff-f82ef1f5f360@amd.com>
In-Reply-To: <40f1020c-fccf-99f9-33ff-f82ef1f5f360@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-12-03T19:44:30.077Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
x-originating-ip: [71.219.59.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f607d234-e3d5-455c-7bee-08d778293710
x-ms-traffictypediagnostic: MWHPR12MB1405:|MWHPR12MB1405:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB14055FC7D33C98BC052EB7AAF7420@MWHPR12MB1405.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(13464003)(189003)(199004)(99286004)(66446008)(7736002)(71200400001)(14444005)(256004)(316002)(66556008)(64756008)(71190400001)(86362001)(186003)(52536014)(6506007)(7696005)(66946007)(81166006)(81156014)(66574012)(11346002)(105004)(446003)(8676002)(76176011)(53546011)(26005)(76116006)(102836004)(478600001)(74316002)(55016002)(4326008)(9686003)(54896002)(66476007)(25786009)(110136005)(54906003)(6116002)(5660300002)(3846002)(19627405001)(2906002)(33656002)(6636002)(229853002)(6436002)(6246003)(8936002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1405;
 H:MWHPR12MB1358.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rr1fqVUKiBXoQr1GTzx4gYrFf6Q8VZY625NIWaVBexs9XKdwGvA+mGh/QHLJDZK8I7m8D+dXjw1QSpS69xNKB9+FJ7zCIeI6n8IopXkoNeM4axY7lcc/i8H8Fkx82DobI8X6UFE37vSszhT+KxEA36YMxRUJg5Q/GC6ZppB13r4JIGZrjxXGgWBPaXBiN3eoR4UAlgc4/ha4mbG140rk9/FpGE/coGCijKCJrOEOT7iDrtWmI6639g9om5sTDnTMDyLjE4tLvM60XauDebAE156E3PCN/+aqUQtRAJzPuoeUskYeZIaAQdgAkjrpZbDYEjSkWB2xxIFpxkmUfA3xXns9xlzAdvQ7z7xDq6zJi8geF0qwowF3Tlsy1984iOWfMOLuRYURcHg5tFr64uU7a/BMIdichF1penxYBG8M9qDETRZUdE0K4ED7KCHzycL0
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f607d234-e3d5-455c-7bee-08d778293710
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 19:44:30.7114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: awFBpddDyc9LyLux2weC9bO7LJHB6Yki/PHgbAM68YMCD5PXF7jr+OgETFh8vdgoXt/1Wj7AKufZVjB/FZTQJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1405
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MKFWrVKuD9Ll5IjDrNapmWQGuljBE2mqhPJaTjWzuw=;
 b=tsQffLgbVohn1MyClUURsFbPgsic2IJTwNMdxfRXTfKUxe2TlEmd5p3aX6oFX7/af7KGH5Bbzg/y1NfcceTu/pY39NLrzeALwGa7CisGxq7ZQurGnQONep6zuTDMfvL5fA29CiQISr4exMSiElpvoQy8N48H2Em5cNiG24bFZ7Y=
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
Content-Type: multipart/mixed; boundary="===============2013194692=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2013194692==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MWHPR12MB13589D76D1F7D518FE7D6F08F7420MWHPR12MB1358namp_"

--_000_MWHPR12MB13589D76D1F7D518FE7D6F08F7420MWHPR12MB1358namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Please go ahead an apply whatever version is necessary for amd-staging-drm-=
next.

Alex

________________________________
From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
Sent: Tuesday, December 3, 2019 2:10 PM
To: Deng, Emily <Emily.Deng@amd.com>; Deucher, Alexander <Alexander.Deucher=
@amd.com>
Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; amd-=
gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Koenig, Christia=
n <Christian.Koenig@amd.com>; steven.price@arm.com <steven.price@arm.com>
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.

Yes - Christian just pushed it to drm-next-misc - I guess Alex/Christian
didn't pull to amd-staging-drm-next yet.

Andrey

On 12/2/19 2:24 PM, Deng, Emily wrote:
> [AMD Official Use Only - Internal Distribution Only]
>
> Hi Andrey,
>      Seems this patch is still not in amd-staging-drm-next?
>
> Best wishes
> Emily Deng
>
>
>
>> -----Original Message-----
>> From: Deng, Emily
>> Sent: Tuesday, November 26, 2019 4:41 PM
>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
>> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koen=
ig,
>> Christian <Christian.Koenig@amd.com>; steven.price@arm.com
>> Subject: RE: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
>>
>> [AMD Official Use Only - Internal Distribution Only]
>>
>> Reviewed-by: Emily Deng <Emily.Deng@amd.com>
>>
>>> -----Original Message-----
>>> From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
>>> Sent: Tuesday, November 26, 2019 7:37 AM
>>> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
>>> Koenig, Christian <Christian.Koenig@amd.com>; Deng, Emily
>>> <Emily.Deng@amd.com>; steven.price@arm.com
>>> Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
>>>
>>> Ping
>>>
>>> Andrey
>>>
>>> On 11/25/19 3:51 PM, Andrey Grodzovsky wrote:
>>>> Problem:
>>>> Due to a race between drm_sched_cleanup_jobs in sched thread and
>>>> drm_sched_job_timedout in timeout work there is a possiblity that bad
>>>> job was already freed while still being accessed from the timeout
>>>> thread.
>>>>
>>>> Fix:
>>>> Instead of just peeking at the bad job in the mirror list remove it
>>>> from the list under lock and then put it back later when we are
>>>> garanteed no race with main sched thread is possible which is after
>>>> the thread is parked.
>>>>
>>>> v2: Lock around processing ring_mirror_list in drm_sched_cleanup_jobs.
>>>>
>>>> v3: Rebase on top of drm-misc-next. v2 is not needed anymore as
>>>> drm_sched_get_cleanup_job already has a lock there.
>>>>
>>>> v4: Fix comments to relfect latest code in drm-misc.
>>>>
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
>>>> Tested-by: Emily Deng <Emily.Deng@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_main.c | 27
>>> +++++++++++++++++++++++++++
>>>>    1 file changed, 27 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 6774955..1bf9c40 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -284,10 +284,21 @@ static void drm_sched_job_timedout(struct
>>> work_struct *work)
>>>>     unsigned long flags;
>>>>
>>>>     sched =3D container_of(work, struct drm_gpu_scheduler,
>>>> work_tdr.work);
>>>> +
>>>> +  /* Protects against concurrent deletion in
>>> drm_sched_get_cleanup_job */
>>>> +  spin_lock_irqsave(&sched->job_list_lock, flags);
>>>>     job =3D list_first_entry_or_null(&sched->ring_mirror_list,
>>>>                                    struct drm_sched_job, node);
>>>>
>>>>     if (job) {
>>>> +          /*
>>>> +           * Remove the bad job so it cannot be freed by concurrent
>>>> +           * drm_sched_cleanup_jobs. It will be reinserted back after
>>> sched->thread
>>>> +           * is parked at which point it's safe.
>>>> +           */
>>>> +          list_del_init(&job->node);
>>>> +          spin_unlock_irqrestore(&sched->job_list_lock, flags);
>>>> +
>>>>             job->sched->ops->timedout_job(job);
>>>>
>>>>             /*
>>>> @@ -298,6 +309,8 @@ static void drm_sched_job_timedout(struct
>>> work_struct *work)
>>>>                     job->sched->ops->free_job(job);
>>>>                     sched->free_guilty =3D false;
>>>>             }
>>>> +  } else {
>>>> +          spin_unlock_irqrestore(&sched->job_list_lock, flags);
>>>>     }
>>>>
>>>>     spin_lock_irqsave(&sched->job_list_lock, flags); @@ -370,6 +383,20
>>>> @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct
>>> drm_sched_job *bad)
>>>>     kthread_park(sched->thread);
>>>>
>>>>     /*
>>>> +   * Reinsert back the bad job here - now it's safe as
>>>> +   * drm_sched_get_cleanup_job cannot race against us and release the
>>>> +   * bad job at this point - we parked (waited for) any in progress
>>>> +   * (earlier) cleanups and drm_sched_get_cleanup_job will not be
>>> called
>>>> +   * now until the scheduler thread is unparked.
>>>> +   */
>>>> +  if (bad && bad->sched =3D=3D sched)
>>>> +          /*
>>>> +           * Add at the head of the queue to reflect it was the earli=
est
>>>> +           * job extracted.
>>>> +           */
>>>> +          list_add(&bad->node, &sched->ring_mirror_list);
>>>> +
>>>> +  /*
>>>>      * Iterate the job list from later to  earlier one and either deac=
tive
>>>>      * their HW callbacks or remove them from mirror list if they alre=
ady
>>>>      * signaled.

--_000_MWHPR12MB13589D76D1F7D518FE7D6F08F7420MWHPR12MB1358namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#0078D7;margin:15pt;" al=
ign=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Please go ahead an apply whatever version is necessary for amd-staging-drm-=
next.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Grodzovsky, Andrey &l=
t;Andrey.Grodzovsky@amd.com&gt;<br>
<b>Sent:</b> Tuesday, December 3, 2019 2:10 PM<br>
<b>To:</b> Deng, Emily &lt;Emily.Deng@amd.com&gt;; Deucher, Alexander &lt;A=
lexander.Deucher@amd.com&gt;<br>
<b>Cc:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt=
;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; steven.price@arm.com=
 &lt;steven.price@arm.com&gt;<br>
<b>Subject:</b> Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job=
.</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Yes - Christian just pushed it to drm-next-misc - =
I guess Alex/Christian
<br>
didn't pull to amd-staging-drm-next yet.<br>
<br>
Andrey<br>
<br>
On 12/2/19 2:24 PM, Deng, Emily wrote:<br>
&gt; [AMD Official Use Only - Internal Distribution Only]<br>
&gt;<br>
&gt; Hi Andrey,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Seems this patch is still not in amd-sta=
ging-drm-next?<br>
&gt;<br>
&gt; Best wishes<br>
&gt; Emily Deng<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: Deng, Emily<br>
&gt;&gt; Sent: Tuesday, November 26, 2019 4:41 PM<br>
&gt;&gt; To: Grodzovsky, Andrey &lt;Andrey.Grodzovsky@amd.com&gt;<br>
&gt;&gt; Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org=
; Koenig,<br>
&gt;&gt; Christian &lt;Christian.Koenig@amd.com&gt;; steven.price@arm.com<b=
r>
&gt;&gt; Subject: RE: [PATCH v4] drm/scheduler: Avoid accessing freed bad j=
ob.<br>
&gt;&gt;<br>
&gt;&gt; [AMD Official Use Only - Internal Distribution Only]<br>
&gt;&gt;<br>
&gt;&gt; Reviewed-by: Emily Deng &lt;Emily.Deng@amd.com&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt;&gt; From: Grodzovsky, Andrey &lt;Andrey.Grodzovsky@amd.com&gt;<br>
&gt;&gt;&gt; Sent: Tuesday, November 26, 2019 7:37 AM<br>
&gt;&gt;&gt; Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop=
.org;<br>
&gt;&gt;&gt; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; Deng, Emil=
y<br>
&gt;&gt;&gt; &lt;Emily.Deng@amd.com&gt;; steven.price@arm.com<br>
&gt;&gt;&gt; Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed b=
ad job.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Ping<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Andrey<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 11/25/19 3:51 PM, Andrey Grodzovsky wrote:<br>
&gt;&gt;&gt;&gt; Problem:<br>
&gt;&gt;&gt;&gt; Due to a race between drm_sched_cleanup_jobs in sched thre=
ad and<br>
&gt;&gt;&gt;&gt; drm_sched_job_timedout in timeout work there is a possibli=
ty that bad<br>
&gt;&gt;&gt;&gt; job was already freed while still being accessed from the =
timeout<br>
&gt;&gt;&gt;&gt; thread.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Fix:<br>
&gt;&gt;&gt;&gt; Instead of just peeking at the bad job in the mirror list =
remove it<br>
&gt;&gt;&gt;&gt; from the list under lock and then put it back later when w=
e are<br>
&gt;&gt;&gt;&gt; garanteed no race with main sched thread is possible which=
 is after<br>
&gt;&gt;&gt;&gt; the thread is parked.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; v2: Lock around processing ring_mirror_list in drm_sched_c=
leanup_jobs.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; v3: Rebase on top of drm-misc-next. v2 is not needed anymo=
re as<br>
&gt;&gt;&gt;&gt; drm_sched_get_cleanup_job already has a lock there.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; v4: Fix comments to relfect latest code in drm-misc.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Andrey Grodzovsky &lt;andrey.grodzovsky@amd=
.com&gt;<br>
&gt;&gt;&gt;&gt; Reviewed-by: Christian K=F6nig &lt;christian.koenig@amd.co=
m&gt;<br>
&gt;&gt;&gt;&gt; Tested-by: Emily Deng &lt;Emily.Deng@amd.com&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/scheduler/sched_main.c |=
 27<br>
&gt;&gt;&gt; &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<b=
r>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; 1 file changed, 27 insertions(&#43;)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm/scheduler/sched_main.c<br>
&gt;&gt;&gt;&gt; b/drivers/gpu/drm/scheduler/sched_main.c<br>
&gt;&gt;&gt;&gt; index 6774955..1bf9c40 100644<br>
&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/scheduler/sched_main.c<br>
&gt;&gt;&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/scheduler/sched_main.c<b=
r>
&gt;&gt;&gt;&gt; @@ -284,10 &#43;284,21 @@ static void drm_sched_job_timedo=
ut(struct<br>
&gt;&gt;&gt; work_struct *work)<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long flags;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; sched =3D container_of(work, struc=
t drm_gpu_scheduler,<br>
&gt;&gt;&gt;&gt; work_tdr.work);<br>
&gt;&gt;&gt;&gt; &#43;<br>
&gt;&gt;&gt;&gt; &#43;&nbsp; /* Protects against concurrent deletion in<br>
&gt;&gt;&gt; drm_sched_get_cleanup_job */<br>
&gt;&gt;&gt;&gt; &#43;&nbsp; spin_lock_irqsave(&amp;sched-&gt;job_list_lock=
, flags);<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; job =3D list_first_entry_or_null(&=
amp;sched-&gt;ring_mirror_list,<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; struct drm_sched_job, node);<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; if (job) {<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; /*<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; * Remove the bad job so it cannot be freed by concurrent<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; * drm_sched_cleanup_jobs. It will be reinserted back after<br>
&gt;&gt;&gt; sched-&gt;thread<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; * is parked at which point it's safe.<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; */<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; list_del_init(&amp;job-&gt;node);<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; spin_unlock_irqrestore(&amp;sched-&gt;job_list_lock, flags);<br>
&gt;&gt;&gt;&gt; &#43;<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; job-&gt;sched-&gt;ops-&gt;timedout_job(job);<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; /*<br>
&gt;&gt;&gt;&gt; @@ -298,6 &#43;309,8 @@ static void drm_sched_job_timedout=
(struct<br>
&gt;&gt;&gt; work_struct *work)<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; job-&gt;sched=
-&gt;ops-&gt;free_job(job);<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sched-&gt;fre=
e_guilty =3D false;<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&gt; &#43;&nbsp; } else {<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; spin_unlock_irqrestore(&amp;sched-&gt;job_list_lock, flags);<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock_irqsave(&amp;sched-&gt;j=
ob_list_lock, flags); @@ -370,6 &#43;383,20<br>
&gt;&gt;&gt;&gt; @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, st=
ruct<br>
&gt;&gt;&gt; drm_sched_job *bad)<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; kthread_park(sched-&gt;thread);<br=
>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp; * Reinsert back the bad job here - now i=
t's safe as<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp; * drm_sched_get_cleanup_job cannot race =
against us and release the<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp; * bad job at this point - we parked (wai=
ted for) any in progress<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp; * (earlier) cleanups and drm_sched_get_c=
leanup_job will not be<br>
&gt;&gt;&gt; called<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp; * now until the scheduler thread is unpa=
rked.<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp; */<br>
&gt;&gt;&gt;&gt; &#43;&nbsp; if (bad &amp;&amp; bad-&gt;sched =3D=3D sched)=
<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; /*<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; * Add at the head of the queue to reflect it was the earliest<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; * job extracted.<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; */<br>
&gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; list_add(&amp;bad-&gt;node, &amp;sched-&gt;ring_mirror_list);<br>
&gt;&gt;&gt;&gt; &#43;<br>
&gt;&gt;&gt;&gt; &#43;&nbsp; /*<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Iterate the job list from =
later to&nbsp; earlier one and either deactive<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * their HW callbacks or remo=
ve them from mirror list if they already<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * signaled.<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MWHPR12MB13589D76D1F7D518FE7D6F08F7420MWHPR12MB1358namp_--

--===============2013194692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2013194692==--
