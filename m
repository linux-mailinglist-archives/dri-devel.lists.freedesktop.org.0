Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0A111059F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 20:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5AE6ECCE;
	Tue,  3 Dec 2019 19:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750081.outbound.protection.outlook.com [40.107.75.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9E36ECC8;
 Tue,  3 Dec 2019 19:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQ7qa6f++JF5nkW3A0TUsAP3ZwkBZHkUv3d4ZXqYpqyP47Q+821aOdBoMKiaxioymUOZPc+F8lV+ruVtAK/Ye+E6QZBrHAej0p8bfEVyiK5seQ0WETlgGWaBXWOdSQAshuaZP9fLNJW4Uu8ZU44/wDhZDGohJ9n66GN0at99mB8nfxBYsC7lmoVLOwASfBAQzwF/BAXUWX7LZ4hbsN+V04zFipQrAMwZPurUMrDuX2ONwezM9z+UfCH1Qv9CL6EfAb3zzZegtSbk2duneeg7nmP2rpIlMUV1WZwvKIoqnmOZC68wTAHgDikpyBdpAgavc84jJep8cRfpuaRwILHe/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QeXl5OZsQd2iDmsn7mbTnqHW+gRjzizFubpPisAvM8=;
 b=INoBCv1Qclu/+i59jOnkl+DowRQ8TBNpIxobWLzeSSiC2p7YRBWhKoCru5Inh2nQW6VJFC2CLwx4ZBHDhM5/NNAzEUNcyXhzutBattkpbA7fjepHYPv0XY0MMm1KGtCA2+f3+PxQOG4Pl8ufH/4pE4jxW+C6Mrn90h+UlW0KWMiNtc8BFNadmjWqJutoEo75aTWKUIeiPXBCiCNPHWNMj0rJOqiHHM5E9BaDqH95swZQ2wmaGkyHYBJ927hniBf/lfeLCjk8iE42KNZ+jUpeCVPfpPfTK+XAwg6f+K8y1MDX/PdFA5yk1EFsjdkJpHLm15rPtBWxAaJQt8nzCE/CEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1358.namprd12.prod.outlook.com (10.169.203.148) by
 MWHPR12MB1183.namprd12.prod.outlook.com (10.169.203.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Tue, 3 Dec 2019 19:59:41 +0000
Received: from MWHPR12MB1358.namprd12.prod.outlook.com
 ([fe80::b94d:fcd8:729d:a94f]) by MWHPR12MB1358.namprd12.prod.outlook.com
 ([fe80::b94d:fcd8:729d:a94f%3]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 19:59:41 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Thread-Topic: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Thread-Index: AQHVo9InpineTkoEGkOH8nSWUSg3DaedlxiAgACYAgCACRV4gIABjlSAgAAJh3GAAAPbgIAAAFNk
Date: Tue, 3 Dec 2019 19:59:41 +0000
Message-ID: <MWHPR12MB135874597AF738D51965F925F7420@MWHPR12MB1358.namprd12.prod.outlook.com>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
 <b8b716a7-e235-38b2-ea6d-0a21881fa64e@amd.com>
 <MN2PR12MB2975CA8858F21FDF325C33FE8F440@MN2PR12MB2975.namprd12.prod.outlook.com>
 <MN2PR12MB2975F38D8FB87D9812E0B0C88F430@MN2PR12MB2975.namprd12.prod.outlook.com>
 <40f1020c-fccf-99f9-33ff-f82ef1f5f360@amd.com>
 <MWHPR12MB13589D76D1F7D518FE7D6F08F7420@MWHPR12MB1358.namprd12.prod.outlook.com>,
 <0137aad4-bd70-2abf-d321-e9c88101480a@amd.com>
In-Reply-To: <0137aad4-bd70-2abf-d321-e9c88101480a@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-12-03T19:59:40.905Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
x-originating-ip: [71.219.59.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8ce2429e-16c7-4bee-2391-08d7782b55f1
x-ms-traffictypediagnostic: MWHPR12MB1183:|MWHPR12MB1183:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1183DC2AB7AD00EC543B5F7BF7420@MWHPR12MB1183.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(13464003)(189003)(199004)(14444005)(446003)(11346002)(256004)(105004)(26005)(14454004)(6506007)(102836004)(7696005)(8936002)(229853002)(7736002)(86362001)(74316002)(53546011)(186003)(19627405001)(54896002)(76176011)(3846002)(99286004)(54906003)(81156014)(55016002)(9686003)(2906002)(8676002)(6116002)(25786009)(6436002)(236005)(76116006)(81166006)(316002)(66446008)(64756008)(66476007)(110136005)(66574012)(5660300002)(52536014)(66946007)(6636002)(66556008)(4326008)(478600001)(71200400001)(33656002)(6246003)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1183;
 H:MWHPR12MB1358.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3rmkZFQJxuakUjTDZwG/g6MU1v3iH/q/f3ID7eSbq4XHzmOkuO8/rgkZkvyix7qm6ns7oXPuaZ1+iQ+kJyhxE4L5RIp0wLY6sNxdzkmfu8JMhS9/kJnZbeVPtKVdh1R8vOVsJtKY/Es7Ck1eTgTqWbVYP/QX5D4J4xVj2I4FxpNmr62wp9J8pd2JmcEu4w11GyianI1g7QZ4MnOMY4Z/PAb6CdvZ9w6gja6a5B9I4x4ssXc7Dlolpf69of0Mb84mkg6F/TJhk0EZnYmRj3GDQkOKb6sGoD1pw9fdeQP8qbow9CSRiakXINpRIdW4nUxMT1sArI+4624VEKK05swGjYSGkkCcBmGdDpUoZJCainR1GMvnQ7d1qCmO7trKo33QTBcgg8+0ez47Or6kvW+1qxSSTx+b1qBIMrTHhhC2vlxd2jJ/NaXviRUHgm7S0vcQ
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce2429e-16c7-4bee-2391-08d7782b55f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 19:59:41.4928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g7KdrmtNzrgfcxxboZ1I8+n+YaDhJfmtXfi9VBNCTDFu/p5npYDh2oj2Ap5Xo88VIqFMcV53KyM9ea/JpzPE4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1183
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QeXl5OZsQd2iDmsn7mbTnqHW+gRjzizFubpPisAvM8=;
 b=R8be9zZln4eDeihkCFcxDktsaTzc+o1mUdm0R/yLpHZiqOyns9r/spQTedx1AdQuiLSTT+N0FeM5sZw0ElfPDFKeXeUef9JaMsHXnvUAaAcIzW5MIH9iQFW/0L5ERAy9YtGP5E7HdwB6CeH6DfD7CDKxDTt0FadIApu6wQBjVmw=
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
Content-Type: multipart/mixed; boundary="===============0446114896=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0446114896==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MWHPR12MB135874597AF738D51965F925F7420MWHPR12MB1358namp_"

--_000_MWHPR12MB135874597AF738D51965F925F7420MWHPR12MB1358namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Cherry pick whatever dependencies you need or pick the older version of the=
 patch.  Either way works.

Alex
________________________________
From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
Sent: Tuesday, December 3, 2019 2:57 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Deng, Emily <Emily.Deng=
@amd.com>
Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; amd-=
gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Koenig, Christia=
n <Christian.Koenig@amd.com>; steven.price@arm.com <steven.price@arm.com>
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.


I don't think i can apply this patch 'as is' as this has dependency on patc=
h by Steven which also wasn't applied yet - 588b982 Steven Price        6 w=
eeks ago    drm: Don't free jobs in wait_event_interruptible()


Andrey


On 12/3/19 2:44 PM, Deucher, Alexander wrote:

[AMD Official Use Only - Internal Distribution Only]

Please go ahead an apply whatever version is necessary for amd-staging-drm-=
next.

Alex

________________________________
From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com><mailto:Andrey.Grodzovs=
ky@amd.com>
Sent: Tuesday, December 3, 2019 2:10 PM
To: Deng, Emily <Emily.Deng@amd.com><mailto:Emily.Deng@amd.com>; Deucher, A=
lexander <Alexander.Deucher@amd.com><mailto:Alexander.Deucher@amd.com>
Cc: dri-devel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.org>=
 <dri-devel@lists.freedesktop.org><mailto:dri-devel@lists.freedesktop.org>;=
 amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-g=
fx@lists.freedesktop.org><mailto:amd-gfx@lists.freedesktop.org>; Koenig, Ch=
ristian <Christian.Koenig@amd.com><mailto:Christian.Koenig@amd.com>; steven=
.price@arm.com<mailto:steven.price@arm.com> <steven.price@arm.com><mailto:s=
teven.price@arm.com>
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
>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com><mailto:Andrey.Grodzov=
sky@amd.com>
>> Cc: dri-devel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.o=
rg>; amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>; K=
oenig,
>> Christian <Christian.Koenig@amd.com><mailto:Christian.Koenig@amd.com>; s=
teven.price@arm.com<mailto:steven.price@arm.com>
>> Subject: RE: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
>>
>> [AMD Official Use Only - Internal Distribution Only]
>>
>> Reviewed-by: Emily Deng <Emily.Deng@amd.com><mailto:Emily.Deng@amd.com>
>>
>>> -----Original Message-----
>>> From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com><mailto:Andrey.Grod=
zovsky@amd.com>
>>> Sent: Tuesday, November 26, 2019 7:37 AM
>>> Cc: dri-devel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.=
org>; amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>;
>>> Koenig, Christian <Christian.Koenig@amd.com><mailto:Christian.Koenig@am=
d.com>; Deng, Emily
>>> <Emily.Deng@amd.com><mailto:Emily.Deng@amd.com>; steven.price@arm.com<m=
ailto:steven.price@arm.com>
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
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com><mailto:an=
drey.grodzovsky@amd.com>
>>>> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com><mailto:chris=
tian.koenig@amd.com>
>>>> Tested-by: Emily Deng <Emily.Deng@amd.com><mailto:Emily.Deng@amd.com>
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

--_000_MWHPR12MB135874597AF738D51965F925F7420MWHPR12MB1358namp_
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
Cherry pick whatever dependencies you need or pick the older version of the=
 patch.&nbsp; Either way works.</div>
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
<b>Sent:</b> Tuesday, December 3, 2019 2:57 PM<br>
<b>To:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Deng, Emil=
y &lt;Emily.Deng@amd.com&gt;<br>
<b>Cc:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt=
;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; steven.price@arm.com=
 &lt;steven.price@arm.com&gt;<br>
<b>Subject:</b> Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job=
.</font>
<div>&nbsp;</div>
</div>
<div style=3D"background-color:#FFFFFF">
<p>I don't think i can apply this patch 'as is' as this has dependency on p=
atch by Steven which also wasn't applied yet - 588b982 Steven Price&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 weeks ago&nbsp;&nbsp;&nbsp; drm: Don't=
 free jobs in wait_event_interruptible()</p>
<p><br>
</p>
<p>Andrey<br>
</p>
<p><br>
</p>
<div class=3D"x_moz-cite-prefix">On 12/3/19 2:44 PM, Deucher, Alexander wro=
te:<br>
</div>
<blockquote type=3D"cite"><style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<p align=3D"Left" style=3D"font-family:Arial; font-size:10pt; color:#0078D7=
; margin:15pt">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Please go ahead an apply whatever version is necessary for amd-staging-drm-=
next.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Alex</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Grodzovsky, Andrey
<a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:Andrey.Grodzovsky@amd.c=
om">&lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
<b>Sent:</b> Tuesday, December 3, 2019 2:10 PM<br>
<b>To:</b> Deng, Emily <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:=
Emily.Deng@amd.com">
&lt;Emily.Deng@amd.com&gt;</a>; Deucher, Alexander <a class=3D"x_moz-txt-li=
nk-rfc2396E" href=3D"mailto:Alexander.Deucher@amd.com">
&lt;Alexander.Deucher@amd.com&gt;</a><br>
<b>Cc:</b> <a class=3D"x_moz-txt-link-abbreviated" href=3D"mailto:dri-devel=
@lists.freedesktop.org">
dri-devel@lists.freedesktop.org</a> <a class=3D"x_moz-txt-link-rfc2396E" hr=
ef=3D"mailto:dri-devel@lists.freedesktop.org">
&lt;dri-devel@lists.freedesktop.org&gt;</a>; <a class=3D"x_moz-txt-link-abb=
reviated" href=3D"mailto:amd-gfx@lists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a> <a class=3D"x_moz-txt-link-rfc2396E" href=
=3D"mailto:amd-gfx@lists.freedesktop.org">
&lt;amd-gfx@lists.freedesktop.org&gt;</a>; Koenig, Christian <a class=3D"x_=
moz-txt-link-rfc2396E" href=3D"mailto:Christian.Koenig@amd.com">
&lt;Christian.Koenig@amd.com&gt;</a>; <a class=3D"x_moz-txt-link-abbreviate=
d" href=3D"mailto:steven.price@arm.com">
steven.price@arm.com</a> <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailt=
o:steven.price@arm.com">
&lt;steven.price@arm.com&gt;</a><br>
<b>Subject:</b> Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job=
.</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Yes - Christian just pushed it to drm-next-misc =
- I guess Alex/Christian
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
&gt;&gt; To: Grodzovsky, Andrey <a class=3D"x_moz-txt-link-rfc2396E" href=
=3D"mailto:Andrey.Grodzovsky@amd.com">
&lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
&gt;&gt; Cc: <a class=3D"x_moz-txt-link-abbreviated" href=3D"mailto:dri-dev=
el@lists.freedesktop.org">
dri-devel@lists.freedesktop.org</a>; <a class=3D"x_moz-txt-link-abbreviated=
" href=3D"mailto:amd-gfx@lists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a>; Koenig,<br>
&gt;&gt; Christian <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:Chri=
stian.Koenig@amd.com">
&lt;Christian.Koenig@amd.com&gt;</a>; <a class=3D"x_moz-txt-link-abbreviate=
d" href=3D"mailto:steven.price@arm.com">
steven.price@arm.com</a><br>
&gt;&gt; Subject: RE: [PATCH v4] drm/scheduler: Avoid accessing freed bad j=
ob.<br>
&gt;&gt;<br>
&gt;&gt; [AMD Official Use Only - Internal Distribution Only]<br>
&gt;&gt;<br>
&gt;&gt; Reviewed-by: Emily Deng <a class=3D"x_moz-txt-link-rfc2396E" href=
=3D"mailto:Emily.Deng@amd.com">
&lt;Emily.Deng@amd.com&gt;</a><br>
&gt;&gt;<br>
&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt;&gt; From: Grodzovsky, Andrey <a class=3D"x_moz-txt-link-rfc2396E" =
href=3D"mailto:Andrey.Grodzovsky@amd.com">
&lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
&gt;&gt;&gt; Sent: Tuesday, November 26, 2019 7:37 AM<br>
&gt;&gt;&gt; Cc: <a class=3D"x_moz-txt-link-abbreviated" href=3D"mailto:dri=
-devel@lists.freedesktop.org">
dri-devel@lists.freedesktop.org</a>; <a class=3D"x_moz-txt-link-abbreviated=
" href=3D"mailto:amd-gfx@lists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a>;<br>
&gt;&gt;&gt; Koenig, Christian <a class=3D"x_moz-txt-link-rfc2396E" href=3D=
"mailto:Christian.Koenig@amd.com">
&lt;Christian.Koenig@amd.com&gt;</a>; Deng, Emily<br>
&gt;&gt;&gt; <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:Emily.Deng=
@amd.com">&lt;Emily.Deng@amd.com&gt;</a>;
<a class=3D"x_moz-txt-link-abbreviated" href=3D"mailto:steven.price@arm.com=
">steven.price@arm.com</a><br>
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
&gt;&gt;&gt;&gt; Signed-off-by: Andrey Grodzovsky <a class=3D"x_moz-txt-lin=
k-rfc2396E" href=3D"mailto:andrey.grodzovsky@amd.com">
&lt;andrey.grodzovsky@amd.com&gt;</a><br>
&gt;&gt;&gt;&gt; Reviewed-by: Christian K=F6nig <a class=3D"x_moz-txt-link-=
rfc2396E" href=3D"mailto:christian.koenig@amd.com">
&lt;christian.koenig@amd.com&gt;</a><br>
&gt;&gt;&gt;&gt; Tested-by: Emily Deng <a class=3D"x_moz-txt-link-rfc2396E"=
 href=3D"mailto:Emily.Deng@amd.com">
&lt;Emily.Deng@amd.com&gt;</a><br>
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
</blockquote>
</div>
</div>
</body>
</html>

--_000_MWHPR12MB135874597AF738D51965F925F7420MWHPR12MB1358namp_--

--===============0446114896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0446114896==--
