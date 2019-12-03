Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 586A0110598
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 20:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B205A6ECB3;
	Tue,  3 Dec 2019 19:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700048.outbound.protection.outlook.com [40.107.70.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE4F6ECB3;
 Tue,  3 Dec 2019 19:58:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOavwxV5Ozw7w0o0rz/TslWqZbKO0ayYgFg4zatFjIgSDcKmiEbfHWZ0leETuQZwwt2/qt9oY3+8UXYXLRAPXFthguxVgA8yLInkCSDa7mj/Zffeb+3guQhDKp/nWxJ4EI2/Si6HxhAgVGAcU6hSyzuhzy0t0QHrt1i5squhrqo6KFU6s2V33u83QZC/M29CHnpDVaPqXBP0USU8woyXCpc2g4b/7Go/IEwJkz3xHZfU42ctMhcyAtPrBQOyGEUOXUSTKHaVmzMy0uXPkLviYvGjuObuZUi777BQsLEI+/QlrcujFiUqG29KI4jiL5qZzMOVW1PKyNBv0LLFv6B/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfKRCG5oK2dVk6fdisXjR/1YAH9m08e9ZJsGWq/jJn0=;
 b=jQqCgH2PL0zN4t/7FTjUoyl47iBPKIWhQK73mrqRz/MTaf0otJTIKxiUQ6LPlfffxhehAz3DDDLv/dCK5QvHND6em9vTM0uliDP4WC+EPhHI8lqJMvtxSdaj6PmLoudZ7b8BqFPLF8tqgpSZvruhjSPDPHOknVnCRgMKyG6Wj2RRuaC4LTcVKxvd3pKSWFNu+BPQcUxNSAQZWApcTecVGHVFb9HjHwXNRTq7w7I5PeKz6vhSDdOAIsbCEgsjAJ4ASInI/hIzCvhVeAbzVx1BMZ5gx1p7zIHpgyIORiJjqtZXyLA1IZM109izlPiD3nwQPe5NrB0Wzugrg5sJGxR2Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1789.namprd12.prod.outlook.com (10.175.55.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Tue, 3 Dec 2019 19:58:02 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::514b:dbf8:d19f:a80]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::514b:dbf8:d19f:a80%12]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 19:58:02 +0000
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
 <b8b716a7-e235-38b2-ea6d-0a21881fa64e@amd.com>
 <MN2PR12MB2975CA8858F21FDF325C33FE8F440@MN2PR12MB2975.namprd12.prod.outlook.com>
 <MN2PR12MB2975F38D8FB87D9812E0B0C88F430@MN2PR12MB2975.namprd12.prod.outlook.com>
 <40f1020c-fccf-99f9-33ff-f82ef1f5f360@amd.com>
 <MWHPR12MB13589D76D1F7D518FE7D6F08F7420@MWHPR12MB1358.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <0137aad4-bd70-2abf-d321-e9c88101480a@amd.com>
Date: Tue, 3 Dec 2019 14:57:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <MWHPR12MB13589D76D1F7D518FE7D6F08F7420@MWHPR12MB1358.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::36)
 To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c4ee82e6-9659-4bed-e42c-08d7782b1a8e
X-MS-TrafficTypeDiagnostic: MWHPR12MB1789:|MWHPR12MB1789:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB17891A96679532F566D5718AEA420@MWHPR12MB1789.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 02408926C4
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(199004)(189003)(13464003)(386003)(26005)(6512007)(65956001)(53546011)(6506007)(6486002)(54896002)(99286004)(81156014)(2906002)(236005)(4326008)(31696002)(6666004)(25786009)(31686004)(14454004)(6436002)(8936002)(54906003)(186003)(110136005)(316002)(66946007)(81166006)(66476007)(66556008)(16586007)(58126008)(229853002)(37036004)(446003)(6636002)(52116002)(6246003)(36756003)(6116002)(86362001)(3846002)(11346002)(2616005)(14444005)(30864003)(105004)(7736002)(478600001)(71190400001)(33964004)(66574012)(5660300002)(19627405001)(76176011)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1789;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E7PVInK7/6oqA7D+oKj0d3+6+VOjpL0N8Quavke5X0W//6K84H4jEkTuGx9G75Cl0uOGf6DpRt6yJC0Ntd7NnPvlyCi6CgawjIP7m9FEwxTfr0mmAiUesBJKTJYiUOkmPc8c/+bXuQBEoZnIDhHtxz75MkVgpMtTPW8adHhZtO3P2mNdfpJW7vzMy+e1DJmhnA+5XwgwyWh/J1GR5v4QSVxD2f84odRZvkUlO4n1ivXnDY6hl1hI/u5QFbsHqy3z0RqbTOCj8p2kGLxpG6pBVXoMLuGCU6iV3SU7pHGzi7QKYfYIIEOzSyfJrr9SInCrDexwbgoyz4fFWEuhqo9sWICZ9mfpz0szkQv2zVHAIyrV32Nwlmv+U5Jp3uF38FN4yv7SJwvVm7aOdfYYDm9NJzSvnXlRzoFkJBMNY/vB61gZIIBBZ2hp8A3MBh++XP+6VaehsOBSxRdMHB+v//9M8cuYKUQusVg4xUcTgzAGJ8wUQ+TSyQ2avvQau0yPJaGy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ee82e6-9659-4bed-e42c-08d7782b1a8e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 19:58:02.3332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtkkEDxjjBSmxBYWexaVJD41OKZhxPWoIz5gCk65eeTSMPyqxQWE74mfOnH5r2JeO5LUtTVlRklMNibXONGw5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1789
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfKRCG5oK2dVk6fdisXjR/1YAH9m08e9ZJsGWq/jJn0=;
 b=VYhOY/NaeaDnsPkAU9ZL8Ut7AJ/ygKU2IHoaaSPmOXay0SZw879PdwmshpKkO4UjXB2i515nAgLA3EV0fVZxQ4yZmDegpDoAtgw/CuPONWJl+vtacpg55u8MEEo/u0FQwnCMUxDucLcs3LxAhv9QOxO0OJ+tVQvTE4oBs2zrYHk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1353498171=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1353498171==
Content-Type: multipart/alternative;
 boundary="------------02434B88F6D87A76D3F824EE"
Content-Language: en-US

--------------02434B88F6D87A76D3F824EE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

I don't think i can apply this patch 'as is' as this has dependency on 
patch by Steven which also wasn't applied yet - 588b982 Steven 
Price        6 weeks ago    drm: Don't free jobs in 
wait_event_interruptible()


Andrey


On 12/3/19 2:44 PM, Deucher, Alexander wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
>
> Please go ahead an apply whatever version is necessary for 
> amd-staging-drm-next.
>
> Alex
>
> ------------------------------------------------------------------------
> *From:* Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> *Sent:* Tuesday, December 3, 2019 2:10 PM
> *To:* Deng, Emily <Emily.Deng@amd.com>; Deucher, Alexander 
> <Alexander.Deucher@amd.com>
> *Cc:* dri-devel@lists.freedesktop.org 
> <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org 
> <amd-gfx@lists.freedesktop.org>; Koenig, Christian 
> <Christian.Koenig@amd.com>; steven.price@arm.com <steven.price@arm.com>
> *Subject:* Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
> Yes - Christian just pushed it to drm-next-misc - I guess Alex/Christian
> didn't pull to amd-staging-drm-next yet.
>
> Andrey
>
> On 12/2/19 2:24 PM, Deng, Emily wrote:
> > [AMD Official Use Only - Internal Distribution Only]
> >
> > Hi Andrey,
> >      Seems this patch is still not in amd-staging-drm-next?
> >
> > Best wishes
> > Emily Deng
> >
> >
> >
> >> -----Original Message-----
> >> From: Deng, Emily
> >> Sent: Tuesday, November 26, 2019 4:41 PM
> >> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> >> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; 
> Koenig,
> >> Christian <Christian.Koenig@amd.com>; steven.price@arm.com
> >> Subject: RE: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
> >>
> >> [AMD Official Use Only - Internal Distribution Only]
> >>
> >> Reviewed-by: Emily Deng <Emily.Deng@amd.com>
> >>
> >>> -----Original Message-----
> >>> From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> >>> Sent: Tuesday, November 26, 2019 7:37 AM
> >>> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org;
> >>> Koenig, Christian <Christian.Koenig@amd.com>; Deng, Emily
> >>> <Emily.Deng@amd.com>; steven.price@arm.com
> >>> Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
> >>>
> >>> Ping
> >>>
> >>> Andrey
> >>>
> >>> On 11/25/19 3:51 PM, Andrey Grodzovsky wrote:
> >>>> Problem:
> >>>> Due to a race between drm_sched_cleanup_jobs in sched thread and
> >>>> drm_sched_job_timedout in timeout work there is a possiblity that bad
> >>>> job was already freed while still being accessed from the timeout
> >>>> thread.
> >>>>
> >>>> Fix:
> >>>> Instead of just peeking at the bad job in the mirror list remove it
> >>>> from the list under lock and then put it back later when we are
> >>>> garanteed no race with main sched thread is possible which is after
> >>>> the thread is parked.
> >>>>
> >>>> v2: Lock around processing ring_mirror_list in 
> drm_sched_cleanup_jobs.
> >>>>
> >>>> v3: Rebase on top of drm-misc-next. v2 is not needed anymore as
> >>>> drm_sched_get_cleanup_job already has a lock there.
> >>>>
> >>>> v4: Fix comments to relfect latest code in drm-misc.
> >>>>
> >>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >>>> Reviewed-by: Christian König <christian.koenig@amd.com>
> >>>> Tested-by: Emily Deng <Emily.Deng@amd.com>
> >>>> ---
> >>>> drivers/gpu/drm/scheduler/sched_main.c | 27
> >>> +++++++++++++++++++++++++++
> >>>>    1 file changed, 27 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> >>>> b/drivers/gpu/drm/scheduler/sched_main.c
> >>>> index 6774955..1bf9c40 100644
> >>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >>>> @@ -284,10 +284,21 @@ static void drm_sched_job_timedout(struct
> >>> work_struct *work)
> >>>>     unsigned long flags;
> >>>>
> >>>>     sched = container_of(work, struct drm_gpu_scheduler,
> >>>> work_tdr.work);
> >>>> +
> >>>> +  /* Protects against concurrent deletion in
> >>> drm_sched_get_cleanup_job */
> >>>> + spin_lock_irqsave(&sched->job_list_lock, flags);
> >>>>     job = list_first_entry_or_null(&sched->ring_mirror_list,
> >>>> struct drm_sched_job, node);
> >>>>
> >>>>     if (job) {
> >>>> +          /*
> >>>> +           * Remove the bad job so it cannot be freed by concurrent
> >>>> +           * drm_sched_cleanup_jobs. It will be reinserted back 
> after
> >>> sched->thread
> >>>> +           * is parked at which point it's safe.
> >>>> +           */
> >>>> + list_del_init(&job->node);
> >>>> + spin_unlock_irqrestore(&sched->job_list_lock, flags);
> >>>> +
> >>>> job->sched->ops->timedout_job(job);
> >>>>
> >>>>             /*
> >>>> @@ -298,6 +309,8 @@ static void drm_sched_job_timedout(struct
> >>> work_struct *work)
> >>>> job->sched->ops->free_job(job);
> >>>> sched->free_guilty = false;
> >>>>             }
> >>>> +  } else {
> >>>> + spin_unlock_irqrestore(&sched->job_list_lock, flags);
> >>>>     }
> >>>>
> >>>> spin_lock_irqsave(&sched->job_list_lock, flags); @@ -370,6 +383,20
> >>>> @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct
> >>> drm_sched_job *bad)
> >>>>     kthread_park(sched->thread);
> >>>>
> >>>>     /*
> >>>> +   * Reinsert back the bad job here - now it's safe as
> >>>> +   * drm_sched_get_cleanup_job cannot race against us and 
> release the
> >>>> +   * bad job at this point - we parked (waited for) any in progress
> >>>> +   * (earlier) cleanups and drm_sched_get_cleanup_job will not be
> >>> called
> >>>> +   * now until the scheduler thread is unparked.
> >>>> +   */
> >>>> +  if (bad && bad->sched == sched)
> >>>> +          /*
> >>>> +           * Add at the head of the queue to reflect it was the 
> earliest
> >>>> +           * job extracted.
> >>>> +           */
> >>>> +          list_add(&bad->node, &sched->ring_mirror_list);
> >>>> +
> >>>> +  /*
> >>>>      * Iterate the job list from later to  earlier one and either 
> deactive
> >>>>      * their HW callbacks or remove them from mirror list if they 
> already
> >>>>      * signaled.

--------------02434B88F6D87A76D3F824EE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>I don't think i can apply this patch 'as is' as this has
      dependency on patch by Steven which also wasn't applied yet -
      588b982 Steven Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 weeks ago&nbsp;&nbsp;&nbsp; drm: Don't free jobs in
      wait_event_interruptible()</p>
    <p><br>
    </p>
    <p>Andrey<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/3/19 2:44 PM, Deucher, Alexander
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:MWHPR12MB13589D76D1F7D518FE7D6F08F7420@MWHPR12MB1358.namprd12.prod.outlook.com">
      
      <style type="text/css" style="display:none;"> P {margin-top:0;margin-bottom:0;} </style>
      <p style="font-family:Arial;font-size:10pt;color:#0078D7;margin:15pt;" align="Left">
        [AMD Official Use Only - Internal Distribution Only]<br>
      </p>
      <br>
      <div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          Please go ahead an apply whatever version is necessary for
          amd-staging-drm-next.</div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          Alex</div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <hr style="display:inline-block;width:98%" tabindex="-1">
        <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b>
            Grodzovsky, Andrey <a class="moz-txt-link-rfc2396E" href="mailto:Andrey.Grodzovsky@amd.com">&lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
            <b>Sent:</b> Tuesday, December 3, 2019 2:10 PM<br>
            <b>To:</b> Deng, Emily <a class="moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a>; Deucher,
            Alexander <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a><br>
            <b>Cc:</b> <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>;
            <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a>; Koenig, Christian
            <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:steven.price@arm.com">steven.price@arm.com</a>
            <a class="moz-txt-link-rfc2396E" href="mailto:steven.price@arm.com">&lt;steven.price@arm.com&gt;</a><br>
            <b>Subject:</b> Re: [PATCH v4] drm/scheduler: Avoid
            accessing freed bad job.</font>
          <div>&nbsp;</div>
        </div>
        <div class="BodyFragment"><font size="2"><span style="font-size:11pt;">
              <div class="PlainText">Yes - Christian just pushed it to
                drm-next-misc - I guess Alex/Christian
                <br>
                didn't pull to amd-staging-drm-next yet.<br>
                <br>
                Andrey<br>
                <br>
                On 12/2/19 2:24 PM, Deng, Emily wrote:<br>
                &gt; [AMD Official Use Only - Internal Distribution
                Only]<br>
                &gt;<br>
                &gt; Hi Andrey,<br>
                &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Seems this patch is still not in
                amd-staging-drm-next?<br>
                &gt;<br>
                &gt; Best wishes<br>
                &gt; Emily Deng<br>
                &gt;<br>
                &gt;<br>
                &gt;<br>
                &gt;&gt; -----Original Message-----<br>
                &gt;&gt; From: Deng, Emily<br>
                &gt;&gt; Sent: Tuesday, November 26, 2019 4:41 PM<br>
                &gt;&gt; To: Grodzovsky, Andrey
                <a class="moz-txt-link-rfc2396E" href="mailto:Andrey.Grodzovsky@amd.com">&lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
                &gt;&gt; Cc: <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>;
                <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>; Koenig,<br>
                &gt;&gt; Christian <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>;
                <a class="moz-txt-link-abbreviated" href="mailto:steven.price@arm.com">steven.price@arm.com</a><br>
                &gt;&gt; Subject: RE: [PATCH v4] drm/scheduler: Avoid
                accessing freed bad job.<br>
                &gt;&gt;<br>
                &gt;&gt; [AMD Official Use Only - Internal Distribution
                Only]<br>
                &gt;&gt;<br>
                &gt;&gt; Reviewed-by: Emily Deng
                <a class="moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a><br>
                &gt;&gt;<br>
                &gt;&gt;&gt; -----Original Message-----<br>
                &gt;&gt;&gt; From: Grodzovsky, Andrey
                <a class="moz-txt-link-rfc2396E" href="mailto:Andrey.Grodzovsky@amd.com">&lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
                &gt;&gt;&gt; Sent: Tuesday, November 26, 2019 7:37 AM<br>
                &gt;&gt;&gt; Cc: <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>;
                <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>;<br>
                &gt;&gt;&gt; Koenig, Christian
                <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>; Deng, Emily<br>
                &gt;&gt;&gt; <a class="moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a>;
                <a class="moz-txt-link-abbreviated" href="mailto:steven.price@arm.com">steven.price@arm.com</a><br>
                &gt;&gt;&gt; Subject: Re: [PATCH v4] drm/scheduler:
                Avoid accessing freed bad job.<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; Ping<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; Andrey<br>
                &gt;&gt;&gt;<br>
                &gt;&gt;&gt; On 11/25/19 3:51 PM, Andrey Grodzovsky
                wrote:<br>
                &gt;&gt;&gt;&gt; Problem:<br>
                &gt;&gt;&gt;&gt; Due to a race between
                drm_sched_cleanup_jobs in sched thread and<br>
                &gt;&gt;&gt;&gt; drm_sched_job_timedout in timeout work
                there is a possiblity that bad<br>
                &gt;&gt;&gt;&gt; job was already freed while still being
                accessed from the timeout<br>
                &gt;&gt;&gt;&gt; thread.<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; Fix:<br>
                &gt;&gt;&gt;&gt; Instead of just peeking at the bad job
                in the mirror list remove it<br>
                &gt;&gt;&gt;&gt; from the list under lock and then put
                it back later when we are<br>
                &gt;&gt;&gt;&gt; garanteed no race with main sched
                thread is possible which is after<br>
                &gt;&gt;&gt;&gt; the thread is parked.<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; v2: Lock around processing
                ring_mirror_list in drm_sched_cleanup_jobs.<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; v3: Rebase on top of drm-misc-next. v2
                is not needed anymore as<br>
                &gt;&gt;&gt;&gt; drm_sched_get_cleanup_job already has a
                lock there.<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; v4: Fix comments to relfect latest code
                in drm-misc.<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; Signed-off-by: Andrey Grodzovsky
                <a class="moz-txt-link-rfc2396E" href="mailto:andrey.grodzovsky@amd.com">&lt;andrey.grodzovsky@amd.com&gt;</a><br>
                &gt;&gt;&gt;&gt; Reviewed-by: Christian König
                <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a><br>
                &gt;&gt;&gt;&gt; Tested-by: Emily Deng
                <a class="moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a><br>
                &gt;&gt;&gt;&gt; ---<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;
                drivers/gpu/drm/scheduler/sched_main.c | 27<br>
                &gt;&gt;&gt; &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; 1 file changed, 27 insertions(&#43;)<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt; diff --git
                a/drivers/gpu/drm/scheduler/sched_main.c<br>
                &gt;&gt;&gt;&gt;
                b/drivers/gpu/drm/scheduler/sched_main.c<br>
                &gt;&gt;&gt;&gt; index 6774955..1bf9c40 100644<br>
                &gt;&gt;&gt;&gt; ---
                a/drivers/gpu/drm/scheduler/sched_main.c<br>
                &gt;&gt;&gt;&gt; &#43;&#43;&#43;
                b/drivers/gpu/drm/scheduler/sched_main.c<br>
                &gt;&gt;&gt;&gt; @@ -284,10 &#43;284,21 @@ static void
                drm_sched_job_timedout(struct<br>
                &gt;&gt;&gt; work_struct *work)<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long flags;<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; sched = container_of(work, struct
                drm_gpu_scheduler,<br>
                &gt;&gt;&gt;&gt; work_tdr.work);<br>
                &gt;&gt;&gt;&gt; &#43;<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp; /* Protects against concurrent
                deletion in<br>
                &gt;&gt;&gt; drm_sched_get_cleanup_job */<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;
                spin_lock_irqsave(&amp;sched-&gt;job_list_lock, flags);<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; job =
                list_first_entry_or_null(&amp;sched-&gt;ring_mirror_list,<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                struct drm_sched_job, node);<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; if (job) {<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Remove the bad job so it
                cannot be freed by concurrent<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * drm_sched_cleanup_jobs.
                It will be reinserted back after<br>
                &gt;&gt;&gt; sched-&gt;thread<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * is parked at which point
                it's safe.<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                list_del_init(&amp;job-&gt;node);<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                spin_unlock_irqrestore(&amp;sched-&gt;job_list_lock,
                flags);<br>
                &gt;&gt;&gt;&gt; &#43;<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                job-&gt;sched-&gt;ops-&gt;timedout_job(job);<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
                &gt;&gt;&gt;&gt; @@ -298,6 &#43;309,8 @@ static void
                drm_sched_job_timedout(struct<br>
                &gt;&gt;&gt; work_struct *work)<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                job-&gt;sched-&gt;ops-&gt;free_job(job);<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                sched-&gt;free_guilty = false;<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp; } else {<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                spin_unlock_irqrestore(&amp;sched-&gt;job_list_lock,
                flags);<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
                spin_lock_irqsave(&amp;sched-&gt;job_list_lock, flags);
                @@ -370,6 &#43;383,20<br>
                &gt;&gt;&gt;&gt; @@ void drm_sched_stop(struct
                drm_gpu_scheduler *sched, struct<br>
                &gt;&gt;&gt; drm_sched_job *bad)<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; kthread_park(sched-&gt;thread);<br>
                &gt;&gt;&gt;&gt;<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp; * Reinsert back the bad job here -
                now it's safe as<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp; * drm_sched_get_cleanup_job cannot
                race against us and release the<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp; * bad job at this point - we parked
                (waited for) any in progress<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp; * (earlier) cleanups and
                drm_sched_get_cleanup_job will not be<br>
                &gt;&gt;&gt; called<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp; * now until the scheduler thread is
                unparked.<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp; */<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp; if (bad &amp;&amp; bad-&gt;sched ==
                sched)<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Add at the head of the
                queue to reflect it was the earliest<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * job extracted.<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_add(&amp;bad-&gt;node,
                &amp;sched-&gt;ring_mirror_list);<br>
                &gt;&gt;&gt;&gt; &#43;<br>
                &gt;&gt;&gt;&gt; &#43;&nbsp; /*<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Iterate the job list from later
                to&nbsp; earlier one and either deactive<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * their HW callbacks or remove
                them from mirror list if they already<br>
                &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * signaled.<br>
              </div>
            </span></font></div>
      </div>
    </blockquote>
  </body>
</html>

--------------02434B88F6D87A76D3F824EE--

--===============1353498171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1353498171==--
