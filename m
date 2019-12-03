Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CC31105F0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 21:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4C06EE7A;
	Tue,  3 Dec 2019 20:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690089.outbound.protection.outlook.com [40.107.69.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3506EE7A;
 Tue,  3 Dec 2019 20:32:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7DvN5QmFVu5FT1ePQDWn4C3FsyRWFKaRaqyAVR9FrwjgsstqA9W8Cs74Bprai5Z1k5DaKj3zBJq1SBIMjbteRfx41Fst5ZotL38jKnEZBsJJxGM5HFN6svOSihFviJC53BAunZwjRnKy14UtHRmx+iQf+2FlfwWqmOVlEM2Z7CeNg5A9q/WvNUC+dpbNaaMbdhL36TscGKiFdJ4dNVhQLENRA6FSw8/9fqRKlt0d4QxotgxeEEDhUBqQnHVZV6ViBJmn4NVxsNhTEJhHk12wSww/L4HxqMQyQtZJlgEmInVrpjJuni1AcU8nXbi3toojuL9udHvw4CLXHKAn/vxzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhgDf56PvvRsE05r3pqdS2MJ2bKQNP6lshe0bXTeU+8=;
 b=eUIZkoCwMfUOgzstEwRCvy9S6GaR2LHOmTCstVo3d1PVuvfA7ztdYbmCrQdv9VvglNc1/TjSBBs9rG8yPkmRM6Ac1vTPlZPAk7Uw7HmGOp4Mmp+46vzFnN5FSxOFyVjivVkipaQfoyHDetlm8g6ch868v71a9C2wfkeX0Bz8McVToDnYBlve8q1lrPB1nrWovhP5rPtVK6TxBKbiiXhlHOEUFZVZ/aW11twleHspH7Lav5lpEzt9VWjTogbPK1nGp5UbSKoJMT/xI6kRPsziFrFDncBtWxxfMWIbeETERLwtPlY0NbTf5ZFY3GtLrK+avfTFNAOVrdWpsOxBnpzAbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1184.namprd12.prod.outlook.com (10.169.204.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Tue, 3 Dec 2019 20:32:46 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::514b:dbf8:d19f:a80]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::514b:dbf8:d19f:a80%12]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 20:32:45 +0000
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
 <b8b716a7-e235-38b2-ea6d-0a21881fa64e@amd.com>
 <MN2PR12MB2975CA8858F21FDF325C33FE8F440@MN2PR12MB2975.namprd12.prod.outlook.com>
 <MN2PR12MB2975F38D8FB87D9812E0B0C88F430@MN2PR12MB2975.namprd12.prod.outlook.com>
 <40f1020c-fccf-99f9-33ff-f82ef1f5f360@amd.com>
 <MWHPR12MB13589D76D1F7D518FE7D6F08F7420@MWHPR12MB1358.namprd12.prod.outlook.com>
 <0137aad4-bd70-2abf-d321-e9c88101480a@amd.com>
 <MWHPR12MB135874597AF738D51965F925F7420@MWHPR12MB1358.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <bea6ea21-4644-69c0-830c-cf240f10bf72@amd.com>
Date: Tue, 3 Dec 2019 15:32:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <MWHPR12MB135874597AF738D51965F925F7420@MWHPR12MB1358.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::42)
 To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
MIME-Version: 1.0
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5a83c55f-84d4-47ac-dd2b-08d7782ff45d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1184:|MWHPR12MB1184:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB11848CBAD053BD4250258A83EA420@MWHPR12MB1184.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 02408926C4
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(199004)(189003)(13464003)(6246003)(6512007)(8676002)(14444005)(31686004)(229853002)(446003)(11346002)(30864003)(66574012)(105004)(53546011)(4326008)(5660300002)(54896002)(31696002)(76176011)(86362001)(2616005)(52116002)(65956001)(236005)(386003)(33964004)(7736002)(6506007)(6486002)(2906002)(71190400001)(6436002)(8936002)(81156014)(66556008)(25786009)(66476007)(14454004)(316002)(26005)(66946007)(99286004)(37036004)(6636002)(81166006)(3846002)(54906003)(19627405001)(16586007)(58126008)(478600001)(110136005)(186003)(36756003)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1184;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c6UqqHS5Ys80czxEd4fOaWHGQEDxOT+f+GhvSGtyyKsT4Ivf3wNZJSx7gTDfA702I60HTfLlkUNrOnuS0k7JUKEwQUR9Dh4FdHeLdqcUFwAh8DlbXwWomOh3X1M1aXe419J65t11rgBsY7Atf6i7V8bpEPVPVAc+juRQMOaTCfU8PrwKZBVjaRist8teq6zl0WggwjTAHBr92KHyLjIGOgLSAaTzejzrMpeyigofCsFvoebVv7JhQGMaWJOsSPoRHjvjR7z2H3zL6u2z+2yXS2MTKIK2I9UguHbCNwM5K674+OmjwxIu3WS4ZybBHu2TvsvCtaIt6mvOofNyQ/r7XgAEmPR0aBVMEymIL7LPCtRkXP8bdsvI/mKgg4U9PvyZBZM7LjtzRs5pWkKOYLAhv9kqlVkV9+WquN0XOh5KmoLBFGm5g+TvWtBZb/XLCcQN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a83c55f-84d4-47ac-dd2b-08d7782ff45d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 20:32:45.7811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQlRwlP2rJ0k4hBaJF90XzOoLPrPIpBmxUlriIL0Rn1lX61FUgOwmCI5VQGqOvFSHja1F582NlcOp4GY6u8Puw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1184
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhgDf56PvvRsE05r3pqdS2MJ2bKQNP6lshe0bXTeU+8=;
 b=zW1BMDSFNlILVv9BUB+wMPk2i51WrCKDr/p/tqKzYFH/vh4WKrRxpCBIWjCjqF8zOTwmLebOph2jA7tHP3tgs07aBDvlTLB72/XA4MiSqNvhmVgIpAsSpaqqqReEwZufL17WK4kV4w8KGVp0BQxXrtKWti/icE8TOP0kZR3/0OE=
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
Content-Type: multipart/mixed; boundary="===============1832109846=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1832109846==
Content-Type: multipart/alternative;
 boundary="------------0ED80267A61B4E81608FAF65"
Content-Language: en-US

--------------0ED80267A61B4E81608FAF65
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Turns out Steven's patch was already in so i just cherry-picked the 
change from drm-next-misc


Emily - it's in.


Andrey


On 12/3/19 2:59 PM, Deucher, Alexander wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
>
> Cherry pick whatever dependencies you need or pick the older version 
> of the patch.  Either way works.
>
> Alex
> ------------------------------------------------------------------------
> *From:* Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> *Sent:* Tuesday, December 3, 2019 2:57 PM
> *To:* Deucher, Alexander <Alexander.Deucher@amd.com>; Deng, Emily 
> <Emily.Deng@amd.com>
> *Cc:* dri-devel@lists.freedesktop.org 
> <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org 
> <amd-gfx@lists.freedesktop.org>; Koenig, Christian 
> <Christian.Koenig@amd.com>; steven.price@arm.com <steven.price@arm.com>
> *Subject:* Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
>
> I don't think i can apply this patch 'as is' as this has dependency on 
> patch by Steven which also wasn't applied yet - 588b982 Steven 
> Price        6 weeks ago    drm: Don't free jobs in 
> wait_event_interruptible()
>
>
> Andrey
>
>
> On 12/3/19 2:44 PM, Deucher, Alexander wrote:
>>
>> [AMD Official Use Only - Internal Distribution Only]
>>
>>
>> Please go ahead an apply whatever version is necessary for 
>> amd-staging-drm-next.
>>
>> Alex
>>
>> ------------------------------------------------------------------------
>> *From:* Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com> 
>> <mailto:Andrey.Grodzovsky@amd.com>
>> *Sent:* Tuesday, December 3, 2019 2:10 PM
>> *To:* Deng, Emily <Emily.Deng@amd.com> <mailto:Emily.Deng@amd.com>; 
>> Deucher, Alexander <Alexander.Deucher@amd.com> 
>> <mailto:Alexander.Deucher@amd.com>
>> *Cc:* dri-devel@lists.freedesktop.org 
>> <mailto:dri-devel@lists.freedesktop.org> 
>> <dri-devel@lists.freedesktop.org> 
>> <mailto:dri-devel@lists.freedesktop.org>; 
>> amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org> 
>> <amd-gfx@lists.freedesktop.org> 
>> <mailto:amd-gfx@lists.freedesktop.org>; Koenig, Christian 
>> <Christian.Koenig@amd.com> <mailto:Christian.Koenig@amd.com>; 
>> steven.price@arm.com <mailto:steven.price@arm.com> 
>> <steven.price@arm.com> <mailto:steven.price@arm.com>
>> *Subject:* Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
>> Yes - Christian just pushed it to drm-next-misc - I guess Alex/Christian
>> didn't pull to amd-staging-drm-next yet.
>>
>> Andrey
>>
>> On 12/2/19 2:24 PM, Deng, Emily wrote:
>> > [AMD Official Use Only - Internal Distribution Only]
>> >
>> > Hi Andrey,
>> >      Seems this patch is still not in amd-staging-drm-next?
>> >
>> > Best wishes
>> > Emily Deng
>> >
>> >
>> >
>> >> -----Original Message-----
>> >> From: Deng, Emily
>> >> Sent: Tuesday, November 26, 2019 4:41 PM
>> >> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com> 
>> <mailto:Andrey.Grodzovsky@amd.com>
>> >> Cc: dri-devel@lists.freedesktop.org 
>> <mailto:dri-devel@lists.freedesktop.org>; 
>> amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org>; 
>> Koenig,
>> >> Christian <Christian.Koenig@amd.com> 
>> <mailto:Christian.Koenig@amd.com>; steven.price@arm.com 
>> <mailto:steven.price@arm.com>
>> >> Subject: RE: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
>> >>
>> >> [AMD Official Use Only - Internal Distribution Only]
>> >>
>> >> Reviewed-by: Emily Deng <Emily.Deng@amd.com> 
>> <mailto:Emily.Deng@amd.com>
>> >>
>> >>> -----Original Message-----
>> >>> From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com> 
>> <mailto:Andrey.Grodzovsky@amd.com>
>> >>> Sent: Tuesday, November 26, 2019 7:37 AM
>> >>> Cc: dri-devel@lists.freedesktop.org 
>> <mailto:dri-devel@lists.freedesktop.org>; 
>> amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org>;
>> >>> Koenig, Christian <Christian.Koenig@amd.com> 
>> <mailto:Christian.Koenig@amd.com>; Deng, Emily
>> >>> <Emily.Deng@amd.com> <mailto:Emily.Deng@amd.com>; 
>> steven.price@arm.com <mailto:steven.price@arm.com>
>> >>> Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
>> >>>
>> >>> Ping
>> >>>
>> >>> Andrey
>> >>>
>> >>> On 11/25/19 3:51 PM, Andrey Grodzovsky wrote:
>> >>>> Problem:
>> >>>> Due to a race between drm_sched_cleanup_jobs in sched thread and
>> >>>> drm_sched_job_timedout in timeout work there is a possiblity 
>> that bad
>> >>>> job was already freed while still being accessed from the timeout
>> >>>> thread.
>> >>>>
>> >>>> Fix:
>> >>>> Instead of just peeking at the bad job in the mirror list remove it
>> >>>> from the list under lock and then put it back later when we are
>> >>>> garanteed no race with main sched thread is possible which is after
>> >>>> the thread is parked.
>> >>>>
>> >>>> v2: Lock around processing ring_mirror_list in 
>> drm_sched_cleanup_jobs.
>> >>>>
>> >>>> v3: Rebase on top of drm-misc-next. v2 is not needed anymore as
>> >>>> drm_sched_get_cleanup_job already has a lock there.
>> >>>>
>> >>>> v4: Fix comments to relfect latest code in drm-misc.
>> >>>>
>> >>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com> 
>> <mailto:andrey.grodzovsky@amd.com>
>> >>>> Reviewed-by: Christian König <christian.koenig@amd.com> 
>> <mailto:christian.koenig@amd.com>
>> >>>> Tested-by: Emily Deng <Emily.Deng@amd.com> 
>> <mailto:Emily.Deng@amd.com>
>> >>>> ---
>> >>>> drivers/gpu/drm/scheduler/sched_main.c | 27
>> >>> +++++++++++++++++++++++++++
>> >>>>    1 file changed, 27 insertions(+)
>> >>>>
>> >>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> >>>> b/drivers/gpu/drm/scheduler/sched_main.c
>> >>>> index 6774955..1bf9c40 100644
>> >>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> >>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> >>>> @@ -284,10 +284,21 @@ static void drm_sched_job_timedout(struct
>> >>> work_struct *work)
>> >>>>     unsigned long flags;
>> >>>>
>> >>>>     sched = container_of(work, struct drm_gpu_scheduler,
>> >>>> work_tdr.work);
>> >>>> +
>> >>>> +  /* Protects against concurrent deletion in
>> >>> drm_sched_get_cleanup_job */
>> >>>> + spin_lock_irqsave(&sched->job_list_lock, flags);
>> >>>>     job = list_first_entry_or_null(&sched->ring_mirror_list,
>> >>>>                                    struct drm_sched_job, node);
>> >>>>
>> >>>>     if (job) {
>> >>>> +          /*
>> >>>> +           * Remove the bad job so it cannot be freed by concurrent
>> >>>> +           * drm_sched_cleanup_jobs. It will be reinserted back 
>> after
>> >>> sched->thread
>> >>>> +           * is parked at which point it's safe.
>> >>>> +           */
>> >>>> + list_del_init(&job->node);
>> >>>> + spin_unlock_irqrestore(&sched->job_list_lock, flags);
>> >>>> +
>> >>>> job->sched->ops->timedout_job(job);
>> >>>>
>> >>>>             /*
>> >>>> @@ -298,6 +309,8 @@ static void drm_sched_job_timedout(struct
>> >>> work_struct *work)
>> >>>> job->sched->ops->free_job(job);
>> >>>> sched->free_guilty = false;
>> >>>>             }
>> >>>> +  } else {
>> >>>> + spin_unlock_irqrestore(&sched->job_list_lock, flags);
>> >>>>     }
>> >>>>
>> >>>> spin_lock_irqsave(&sched->job_list_lock, flags); @@ -370,6 +383,20
>> >>>> @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct
>> >>> drm_sched_job *bad)
>> >>>> kthread_park(sched->thread);
>> >>>>
>> >>>>     /*
>> >>>> +   * Reinsert back the bad job here - now it's safe as
>> >>>> +   * drm_sched_get_cleanup_job cannot race against us and 
>> release the
>> >>>> +   * bad job at this point - we parked (waited for) any in progress
>> >>>> +   * (earlier) cleanups and drm_sched_get_cleanup_job will not be
>> >>> called
>> >>>> +   * now until the scheduler thread is unparked.
>> >>>> +   */
>> >>>> +  if (bad && bad->sched == sched)
>> >>>> +          /*
>> >>>> +           * Add at the head of the queue to reflect it was the 
>> earliest
>> >>>> +           * job extracted.
>> >>>> +           */
>> >>>> + list_add(&bad->node, &sched->ring_mirror_list);
>> >>>> +
>> >>>> +  /*
>> >>>>      * Iterate the job list from later to  earlier one and 
>> either deactive
>> >>>>      * their HW callbacks or remove them from mirror list if 
>> they already
>> >>>>      * signaled.

--------------0ED80267A61B4E81608FAF65
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Turns out Steven's patch was already in so i just cherry-picked
      the change from drm-next-misc</p>
    <p><br>
    </p>
    <p>Emily - it's in.</p>
    <p><br>
    </p>
    <p>Andrey</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/3/19 2:59 PM, Deucher, Alexander
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:MWHPR12MB135874597AF738D51965F925F7420@MWHPR12MB1358.namprd12.prod.outlook.com">
      
      <style type="text/css" style="display:none;"> P {margin-top:0;margin-bottom:0;} </style>
      <p style="font-family:Arial;font-size:10pt;color:#0078D7;margin:15pt;" align="Left">
        [AMD Official Use Only - Internal Distribution Only]<br>
      </p>
      <br>
      <div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          Cherry pick whatever dependencies you need or pick the older
          version of the patch.&nbsp; Either way works.</div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          Alex<br>
        </div>
        <hr style="display:inline-block;width:98%" tabindex="-1">
        <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b>
            Grodzovsky, Andrey <a class="moz-txt-link-rfc2396E" href="mailto:Andrey.Grodzovsky@amd.com">&lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
            <b>Sent:</b> Tuesday, December 3, 2019 2:57 PM<br>
            <b>To:</b> Deucher, Alexander
            <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a>; Deng, Emily
            <a class="moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a><br>
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
        <div style="background-color:#FFFFFF">
          <p>I don't think i can apply this patch 'as is' as this has
            dependency on patch by Steven which also wasn't applied yet
            - 588b982 Steven Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 weeks ago&nbsp;&nbsp;&nbsp; drm: Don't free
            jobs in wait_event_interruptible()</p>
          <p><br>
          </p>
          <p>Andrey<br>
          </p>
          <p><br>
          </p>
          <div class="x_moz-cite-prefix">On 12/3/19 2:44 PM, Deucher,
            Alexander wrote:<br>
          </div>
          <blockquote type="cite">
            <style type="text/css" style="display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
            <p style="font-family:Arial; font-size:10pt; color:#0078D7;
              margin:15pt" align="Left">
              [AMD Official Use Only - Internal Distribution Only]<br>
            </p>
            <br>
            <div>
              <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                Please go ahead an apply whatever version is necessary
                for amd-staging-drm-next.</div>
              <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <br>
              </div>
              <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                Alex</div>
              <div style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:12pt; color:rgb(0,0,0)">
                <br>
              </div>
              <hr tabindex="-1" style="display:inline-block; width:98%">
              <div id="x_divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b> Grodzovsky, Andrey
                  <a class="x_moz-txt-link-rfc2396E" href="mailto:Andrey.Grodzovsky@amd.com" moz-do-not-send="true">&lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
                  <b>Sent:</b> Tuesday, December 3, 2019 2:10 PM<br>
                  <b>To:</b> Deng, Emily <a class="x_moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com" moz-do-not-send="true">
                    &lt;Emily.Deng@amd.com&gt;</a>; Deucher, Alexander <a class="x_moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com" moz-do-not-send="true">
                    &lt;Alexander.Deucher@amd.com&gt;</a><br>
                  <b>Cc:</b> <a class="x_moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org" moz-do-not-send="true">
                    dri-devel@lists.freedesktop.org</a> <a class="x_moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org" moz-do-not-send="true">
                    &lt;dri-devel@lists.freedesktop.org&gt;</a>; <a class="x_moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">
                    amd-gfx@lists.freedesktop.org</a> <a class="x_moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">
                    &lt;amd-gfx@lists.freedesktop.org&gt;</a>; Koenig,
                  Christian <a class="x_moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com" moz-do-not-send="true">
                    &lt;Christian.Koenig@amd.com&gt;</a>; <a class="x_moz-txt-link-abbreviated" href="mailto:steven.price@arm.com" moz-do-not-send="true">
                    steven.price@arm.com</a> <a class="x_moz-txt-link-rfc2396E" href="mailto:steven.price@arm.com" moz-do-not-send="true">
                    &lt;steven.price@arm.com&gt;</a><br>
                  <b>Subject:</b> Re: [PATCH v4] drm/scheduler: Avoid
                  accessing freed bad job.</font>
                <div>&nbsp;</div>
              </div>
              <div class="x_BodyFragment"><font size="2"><span style="font-size:11pt">
                    <div class="x_PlainText">Yes - Christian just pushed
                      it to drm-next-misc - I guess Alex/Christian
                      <br>
                      didn't pull to amd-staging-drm-next yet.<br>
                      <br>
                      Andrey<br>
                      <br>
                      On 12/2/19 2:24 PM, Deng, Emily wrote:<br>
                      &gt; [AMD Official Use Only - Internal
                      Distribution Only]<br>
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
                      &gt;&gt; To: Grodzovsky, Andrey <a class="x_moz-txt-link-rfc2396E" href="mailto:Andrey.Grodzovsky@amd.com" moz-do-not-send="true">
                        &lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
                      &gt;&gt; Cc: <a class="x_moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org" moz-do-not-send="true">
                        dri-devel@lists.freedesktop.org</a>; <a class="x_moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">
                        amd-gfx@lists.freedesktop.org</a>; Koenig,<br>
                      &gt;&gt; Christian <a class="x_moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com" moz-do-not-send="true">
                        &lt;Christian.Koenig@amd.com&gt;</a>; <a class="x_moz-txt-link-abbreviated" href="mailto:steven.price@arm.com" moz-do-not-send="true">
                        steven.price@arm.com</a><br>
                      &gt;&gt; Subject: RE: [PATCH v4] drm/scheduler:
                      Avoid accessing freed bad job.<br>
                      &gt;&gt;<br>
                      &gt;&gt; [AMD Official Use Only - Internal
                      Distribution Only]<br>
                      &gt;&gt;<br>
                      &gt;&gt; Reviewed-by: Emily Deng <a class="x_moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com" moz-do-not-send="true">
                        &lt;Emily.Deng@amd.com&gt;</a><br>
                      &gt;&gt;<br>
                      &gt;&gt;&gt; -----Original Message-----<br>
                      &gt;&gt;&gt; From: Grodzovsky, Andrey <a class="x_moz-txt-link-rfc2396E" href="mailto:Andrey.Grodzovsky@amd.com" moz-do-not-send="true">
                        &lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
                      &gt;&gt;&gt; Sent: Tuesday, November 26, 2019 7:37
                      AM<br>
                      &gt;&gt;&gt; Cc: <a class="x_moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org" moz-do-not-send="true">
                        dri-devel@lists.freedesktop.org</a>; <a class="x_moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">
                        amd-gfx@lists.freedesktop.org</a>;<br>
                      &gt;&gt;&gt; Koenig, Christian <a class="x_moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com" moz-do-not-send="true">
                        &lt;Christian.Koenig@amd.com&gt;</a>; Deng,
                      Emily<br>
                      &gt;&gt;&gt; <a class="x_moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com" moz-do-not-send="true">&lt;Emily.Deng@amd.com&gt;</a>;
                      <a class="x_moz-txt-link-abbreviated" href="mailto:steven.price@arm.com" moz-do-not-send="true">steven.price@arm.com</a><br>
                      &gt;&gt;&gt; Subject: Re: [PATCH v4]
                      drm/scheduler: Avoid accessing freed bad job.<br>
                      &gt;&gt;&gt;<br>
                      &gt;&gt;&gt; Ping<br>
                      &gt;&gt;&gt;<br>
                      &gt;&gt;&gt; Andrey<br>
                      &gt;&gt;&gt;<br>
                      &gt;&gt;&gt; On 11/25/19 3:51 PM, Andrey
                      Grodzovsky wrote:<br>
                      &gt;&gt;&gt;&gt; Problem:<br>
                      &gt;&gt;&gt;&gt; Due to a race between
                      drm_sched_cleanup_jobs in sched thread and<br>
                      &gt;&gt;&gt;&gt; drm_sched_job_timedout in timeout
                      work there is a possiblity that bad<br>
                      &gt;&gt;&gt;&gt; job was already freed while still
                      being accessed from the timeout<br>
                      &gt;&gt;&gt;&gt; thread.<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt; Fix:<br>
                      &gt;&gt;&gt;&gt; Instead of just peeking at the
                      bad job in the mirror list remove it<br>
                      &gt;&gt;&gt;&gt; from the list under lock and then
                      put it back later when we are<br>
                      &gt;&gt;&gt;&gt; garanteed no race with main sched
                      thread is possible which is after<br>
                      &gt;&gt;&gt;&gt; the thread is parked.<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt; v2: Lock around processing
                      ring_mirror_list in drm_sched_cleanup_jobs.<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt; v3: Rebase on top of
                      drm-misc-next. v2 is not needed anymore as<br>
                      &gt;&gt;&gt;&gt; drm_sched_get_cleanup_job already
                      has a lock there.<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt; v4: Fix comments to relfect
                      latest code in drm-misc.<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt; Signed-off-by: Andrey Grodzovsky
                      <a class="x_moz-txt-link-rfc2396E" href="mailto:andrey.grodzovsky@amd.com" moz-do-not-send="true">
                        &lt;andrey.grodzovsky@amd.com&gt;</a><br>
                      &gt;&gt;&gt;&gt; Reviewed-by: Christian König <a class="x_moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com" moz-do-not-send="true">
                        &lt;christian.koenig@amd.com&gt;</a><br>
                      &gt;&gt;&gt;&gt; Tested-by: Emily Deng <a class="x_moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com" moz-do-not-send="true">
                        &lt;Emily.Deng@amd.com&gt;</a><br>
                      &gt;&gt;&gt;&gt; ---<br>
                      &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;
                      drivers/gpu/drm/scheduler/sched_main.c | 27<br>
                      &gt;&gt;&gt; &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
                      &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; 1 file changed, 27
                      insertions(&#43;)<br>
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
                      &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; sched = container_of(work,
                      struct drm_gpu_scheduler,<br>
                      &gt;&gt;&gt;&gt; work_tdr.work);<br>
                      &gt;&gt;&gt;&gt; &#43;<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp; /* Protects against concurrent
                      deletion in<br>
                      &gt;&gt;&gt; drm_sched_get_cleanup_job */<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp;
                      spin_lock_irqsave(&amp;sched-&gt;job_list_lock,
                      flags);<br>
                      &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; job =
                      list_first_entry_or_null(&amp;sched-&gt;ring_mirror_list,<br>
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct
                      drm_sched_job, node);<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; if (job) {<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Remove the bad job
                      so it cannot be freed by concurrent<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *
                      drm_sched_cleanup_jobs. It will be reinserted back
                      after<br>
                      &gt;&gt;&gt; sched-&gt;thread<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * is parked at which
                      point it's safe.<br>
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
                      spin_lock_irqsave(&amp;sched-&gt;job_list_lock,
                      flags); @@ -370,6 &#43;383,20<br>
                      &gt;&gt;&gt;&gt; @@ void drm_sched_stop(struct
                      drm_gpu_scheduler *sched, struct<br>
                      &gt;&gt;&gt; drm_sched_job *bad)<br>
                      &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
                      kthread_park(sched-&gt;thread);<br>
                      &gt;&gt;&gt;&gt;<br>
                      &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp; * Reinsert back the bad job
                      here - now it's safe as<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp; * drm_sched_get_cleanup_job
                      cannot race against us and release the<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp; * bad job at this point - we
                      parked (waited for) any in progress<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp; * (earlier) cleanups and
                      drm_sched_get_cleanup_job will not be<br>
                      &gt;&gt;&gt; called<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp; * now until the scheduler
                      thread is unparked.<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp; */<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp; if (bad &amp;&amp;
                      bad-&gt;sched == sched)<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Add at the head of
                      the queue to reflect it was the earliest<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * job extracted.<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      list_add(&amp;bad-&gt;node,
                      &amp;sched-&gt;ring_mirror_list);<br>
                      &gt;&gt;&gt;&gt; &#43;<br>
                      &gt;&gt;&gt;&gt; &#43;&nbsp; /*<br>
                      &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Iterate the job list from
                      later to&nbsp; earlier one and either deactive<br>
                      &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * their HW callbacks or
                      remove them from mirror list if they already<br>
                      &gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * signaled.<br>
                    </div>
                  </span></font></div>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------0ED80267A61B4E81608FAF65--

--===============1832109846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1832109846==--
