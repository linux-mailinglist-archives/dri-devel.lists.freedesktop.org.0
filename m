Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D1111062F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 21:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DB46F3FB;
	Tue,  3 Dec 2019 20:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800082.outbound.protection.outlook.com [40.107.80.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C820B6EE68;
 Tue,  3 Dec 2019 20:58:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBw8r0kN/pmaldI2ynzMmzwyeaIqD3tTpl/MRGAqxA5L4/qzKlzuMvOtp3RVCzyeVX3+hlyBRdMIx5TB/itXVjjtzzBB+ytBmsDGCckXwHEVRlYVWoA+extNMquTPSA/LrLXTAl1fTEqutSSd67gcyE9xiOMJoIB3EjQQ5sFO+Ek/Ds5k0DHPPlu1lwkrnsxsuXgYFiPZwsePrR345j2oR0ZdTTD7NhUIWlp3He6Bg3S2Yw2wToCaC05qX3ydokBiO4ckclBL6njj7Xdr5V2mPckVC6os0cqcxltdUJNj1FtxWwyp8s/EHXNkwSzINUv73EletsBgdmqX+BWVfrCWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjT8Wu6dhJKjlOJF3wqX16u+vQyyeQa653auCqsKI2A=;
 b=IYg/I1nRuTeUO8Fj56aBuVmcRBnpefjsCDhKqGnjtiSYFlccR2sCfqmQ9LdwRQzfvMhT4mrl8rSdPdwnjOmku1MpMuBWXGoHHVqktTJtyyUtMirYdla9T5uaeF4BhZ8tJpQHQQZUDNoV/JDDgo1H6PI/yU8BqaMh4Z8E3bBxgypSon79W12S8dZWPM4e+eQv1bWNmrjs50zgA7tSzTSelvqV7XyUSRdMhVUGFBD+RT1G2TtgmJ2OuDczejdYOEXnlNCQO14OtM8BFctlKhZWM2bC7amnITRZ3mXXTvSxGcflpuXzUfXzObPxUAU0Myb7VKp9VDKQgGV4X4h+1wta9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Tue, 3 Dec 2019 20:58:11 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::851c:eebf:b936:20fd]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::851c:eebf:b936:20fd%4]) with mapi id 15.20.2516.003; Tue, 3 Dec 2019
 20:58:11 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Thread-Topic: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
Thread-Index: AQHVo9IhnWBRQA7TSUuQ4gUMKSHN+6edlxiAgACX24CACRV/kIABjnSAgAAJnQCAAAPFgIAAAHmAgAAJO4CAAAcCMA==
Date: Tue, 3 Dec 2019 20:58:11 +0000
Message-ID: <MN2PR12MB297587DE9C55B6AC399B98BF8F420@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
 <b8b716a7-e235-38b2-ea6d-0a21881fa64e@amd.com>
 <MN2PR12MB2975CA8858F21FDF325C33FE8F440@MN2PR12MB2975.namprd12.prod.outlook.com>
 <MN2PR12MB2975F38D8FB87D9812E0B0C88F430@MN2PR12MB2975.namprd12.prod.outlook.com>
 <40f1020c-fccf-99f9-33ff-f82ef1f5f360@amd.com>
 <MWHPR12MB13589D76D1F7D518FE7D6F08F7420@MWHPR12MB1358.namprd12.prod.outlook.com>
 <0137aad4-bd70-2abf-d321-e9c88101480a@amd.com>
 <MWHPR12MB135874597AF738D51965F925F7420@MWHPR12MB1358.namprd12.prod.outlook.com>
 <bea6ea21-4644-69c0-830c-cf240f10bf72@amd.com>
In-Reply-To: <bea6ea21-4644-69c0-830c-cf240f10bf72@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-12-03T20:58:09Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=e982d8f8-4a05-4e83-9a01-00003480f4d0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2019-12-03T20:58:09Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 9f3e9797-c3e5-477f-8340-0000ba2a4b6f
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
x-originating-ip: [165.204.53.123]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8a2ad490-7334-41fb-1f27-08d7783381ca
x-ms-traffictypediagnostic: MN2PR12MB2910:|MN2PR12MB2910:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB291085157D177C775552438E8F420@MN2PR12MB2910.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(199004)(189003)(13464003)(66574012)(54906003)(316002)(11346002)(110136005)(3846002)(6116002)(6636002)(86362001)(9686003)(55016002)(446003)(186003)(5660300002)(76116006)(74316002)(66476007)(790700001)(64756008)(66556008)(478600001)(66946007)(6436002)(7696005)(8676002)(33656002)(66446008)(81166006)(26005)(236005)(229853002)(52536014)(14444005)(81156014)(71200400001)(71190400001)(6306002)(54896002)(4326008)(99286004)(2906002)(14454004)(7736002)(76176011)(53546011)(6506007)(102836004)(256004)(6246003)(25786009)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2910;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GsH9cZBiCQ/QTuBI/0CprMEabIY13QxKW1thPirN+N2exsoXzGRp6g/Akz8Nesqvyqq0c1aEgKdvHYefRFBcIZredjIUe4u9DH/w3nch5biqFxwknBxhOrw1H2MUghf4gblFzxwQ9HlZlc+6ril2Fx0IGNRgbH85nyK9m1C9TWmTGsdVt0qjk7RHA01G4j77hrTPqM9kXXzFg2nizy+vWAPThP5JXY1aUNOhS+xOO4v2S0qVu59KBFOmzFJ4O0CMrHPeWvLcbb+7WXiXJf318wKW2facBlGINb0l+vjmYfQYVOc6GH1NESCtX0dWqTuQdjA9yD6Cf4CIPj/TapJ5DPuJIQoo9Ox4DqkUozi7Lxe+wnBuCE0qACqQuEUOIUr/WHlQtsl4+10z8MrMeXrBxf7dwJ7E1uK6bT9eFD+SqzJsbdiqEXsMhb7xEqdUQ2Ls
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2ad490-7334-41fb-1f27-08d7783381ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 20:58:11.1197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CJs3BSXKZpLy/R7nP7qRQs4T50wkNc36rmI4GQkzsUebpaARQ+tiSSIN3iDl7iD3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2910
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjT8Wu6dhJKjlOJF3wqX16u+vQyyeQa653auCqsKI2A=;
 b=ry1EsRDpwQVqkMy+pJUeiKbP62cbz4mOy78vbgo+OmgE2XItJHnwTABCuo9YEMNMULpUE7jBsLXkMQJssQX9HqkqbWddJsq1sRwMFM6q116DgoZ6iS9BIlBVTjjuotqbOBfRcCodMPywI91V5B+f+2HCcJ+ODRqYUMud8lkoVGs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1753500159=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1753500159==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB297587DE9C55B6AC399B98BF8F420MN2PR12MB2975namp_"

--_000_MN2PR12MB297587DE9C55B6AC399B98BF8F420MN2PR12MB2975namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Hi Andrey,
    Thanks very much.

Best wishes
Emily Deng
From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
Sent: Tuesday, December 3, 2019 12:33 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Deng, Emily <Emily.Deng=
@amd.com>
Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koenig,=
 Christian <Christian.Koenig@amd.com>; steven.price@arm.com
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.


Turns out Steven's patch was already in so i just cherry-picked the change =
from drm-next-misc



Emily - it's in.



Andrey


On 12/3/19 2:59 PM, Deucher, Alexander wrote:

[AMD Official Use Only - Internal Distribution Only]

Cherry pick whatever dependencies you need or pick the older version of the=
 patch.  Either way works.

Alex
________________________________
From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com><mailto:Andrey.Grodzovs=
ky@amd.com>
Sent: Tuesday, December 3, 2019 2:57 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com><mailto:Alexander.Deucher=
@amd.com>; Deng, Emily <Emily.Deng@amd.com><mailto:Emily.Deng@amd.com>
Cc: dri-devel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.org>=
 <dri-devel@lists.freedesktop.org><mailto:dri-devel@lists.freedesktop.org>;=
 amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-g=
fx@lists.freedesktop.org><mailto:amd-gfx@lists.freedesktop.org>; Koenig, Ch=
ristian <Christian.Koenig@amd.com><mailto:Christian.Koenig@amd.com>; steven=
.price@arm.com<mailto:steven.price@arm.com> <steven.price@arm.com><mailto:s=
teven.price@arm.com>
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

--_000_MN2PR12MB297587DE9C55B6AC399B98BF8F420MN2PR12MB2975namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
p.msipheader4d0fcdd7, li.msipheader4d0fcdd7, div.msipheader4d0fcdd7
	{mso-style-name:msipheader4d0fcdd7;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body bgcolor=3D"white" lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"msipheader4d0fcdd7" style=3D"margin:0in;margin-bottom:.0001pt">=
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;co=
lor:#0078D7">[AMD Official Use Only - Internal Distribution Only]</span><o:=
p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Hi Andrey,<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">&nbsp;&nbsp;&nbsp; =
Thanks very much.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Best wishes<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Emily Deng<o:p></o:=
p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"color:windowtext">From:</span></b>=
<span style=3D"color:windowtext"> Grodzovsky, Andrey &lt;Andrey.Grodzovsky@=
amd.com&gt;
<br>
<b>Sent:</b> Tuesday, December 3, 2019 12:33 PM<br>
<b>To:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Deng, Emil=
y &lt;Emily.Deng@amd.com&gt;<br>
<b>Cc:</b> dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; =
Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; steven.price@arm.com<br=
>
<b>Subject:</b> Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job=
.<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p>Turns out Steven's patch was already in so i just cherry-picked the chan=
ge from drm-next-misc<o:p></o:p></p>
<p><o:p>&nbsp;</o:p></p>
<p>Emily - it's in.<o:p></o:p></p>
<p><o:p>&nbsp;</o:p></p>
<p>Andrey<o:p></o:p></p>
<p><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On 12/3/19 2:59 PM, Deucher, Alexander wrote:<o:p></=
o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p style=3D"margin:15.0pt"><span style=3D"font-size:10.0pt;font-family:&quo=
t;Arial&quot;,sans-serif;color:#0078D7">[AMD Official Use Only - Internal D=
istribution Only]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Cherry pick whateve=
r dependencies you need or pick the older version of the patch.&nbsp; Eithe=
r way works.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Alex<o:p></o:p></sp=
an></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b>From:</b> Grodzovsky, Andrey <a href=3D"mailto:An=
drey.Grodzovsky@amd.com">
&lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
<b>Sent:</b> Tuesday, December 3, 2019 2:57 PM<br>
<b>To:</b> Deucher, Alexander <a href=3D"mailto:Alexander.Deucher@amd.com">=
&lt;Alexander.Deucher@amd.com&gt;</a>; Deng, Emily
<a href=3D"mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a><br>
<b>Cc:</b> <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lis=
ts.freedesktop.org</a>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.free=
desktop.org&gt;</a>;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">
&lt;amd-gfx@lists.freedesktop.org&gt;</a>; Koenig, Christian <a href=3D"mai=
lto:Christian.Koenig@amd.com">
&lt;Christian.Koenig@amd.com&gt;</a>; <a href=3D"mailto:steven.price@arm.co=
m">steven.price@arm.com</a>
<a href=3D"mailto:steven.price@arm.com">&lt;steven.price@arm.com&gt;</a><br=
>
<b>Subject:</b> Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job=
. <o:p>
</o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<p style=3D"background:white"><span style=3D"color:black">I don't think i c=
an apply this patch 'as is' as this has dependency on patch by Steven which=
 also wasn't applied yet - 588b982 Steven Price&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 6 weeks ago&nbsp;&nbsp;&nbsp; drm: Don't free jobs in wait_e=
vent_interruptible()</span><o:p></o:p></p>
<p style=3D"background:white"><o:p>&nbsp;</o:p></p>
<p style=3D"background:white"><span style=3D"color:black">Andrey</span><o:p=
></o:p></p>
<p style=3D"background:white"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"background:white">On 12/3/19 2:44 PM, Deuch=
er, Alexander wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p style=3D"margin:15.0pt;background:white"><span style=3D"font-size:10.0pt=
;font-family:&quot;Arial&quot;,sans-serif;color:#0078D7">[AMD Official Use =
Only - Internal Distribution Only]<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:white"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
12.0pt">Please go ahead an apply whatever version is necessary for amd-stag=
ing-drm-next.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
12.0pt"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
12.0pt">Alex<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
12.0pt"><o:p>&nbsp;</o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center;backgr=
ound:white">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"MsoNormal" style=3D"background:white"><b>From:</b> Grodzovsky, =
Andrey <a href=3D"mailto:Andrey.Grodzovsky@amd.com">
&lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
<b>Sent:</b> Tuesday, December 3, 2019 2:10 PM<br>
<b>To:</b> Deng, Emily <a href=3D"mailto:Emily.Deng@amd.com">&lt;Emily.Deng=
@amd.com&gt;</a>; Deucher, Alexander
<a href=3D"mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&=
gt;</a><br>
<b>Cc:</b> <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lis=
ts.freedesktop.org</a>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.free=
desktop.org&gt;</a>;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">
&lt;amd-gfx@lists.freedesktop.org&gt;</a>; Koenig, Christian <a href=3D"mai=
lto:Christian.Koenig@amd.com">
&lt;Christian.Koenig@amd.com&gt;</a>; <a href=3D"mailto:steven.price@arm.co=
m">steven.price@arm.com</a>
<a href=3D"mailto:steven.price@arm.com">&lt;steven.price@arm.com&gt;</a><br=
>
<b>Subject:</b> Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job=
. <o:p>
</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"background:white">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"background:white">Yes - Christian just push=
ed it to drm-next-misc - I guess Alex/Christian
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
&gt;&gt; To: Grodzovsky, Andrey <a href=3D"mailto:Andrey.Grodzovsky@amd.com=
">&lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
&gt;&gt; Cc: <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@l=
ists.freedesktop.org</a>;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a>; Koenig,<br>
&gt;&gt; Christian <a href=3D"mailto:Christian.Koenig@amd.com">&lt;Christia=
n.Koenig@amd.com&gt;</a>;
<a href=3D"mailto:steven.price@arm.com">steven.price@arm.com</a><br>
&gt;&gt; Subject: RE: [PATCH v4] drm/scheduler: Avoid accessing freed bad j=
ob.<br>
&gt;&gt;<br>
&gt;&gt; [AMD Official Use Only - Internal Distribution Only]<br>
&gt;&gt;<br>
&gt;&gt; Reviewed-by: Emily Deng <a href=3D"mailto:Emily.Deng@amd.com">&lt;=
Emily.Deng@amd.com&gt;</a><br>
&gt;&gt;<br>
&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt;&gt; From: Grodzovsky, Andrey <a href=3D"mailto:Andrey.Grodzovsky@a=
md.com">&lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
&gt;&gt;&gt; Sent: Tuesday, November 26, 2019 7:37 AM<br>
&gt;&gt;&gt; Cc: <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-dev=
el@lists.freedesktop.org</a>;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a>;<br>
&gt;&gt;&gt; Koenig, Christian <a href=3D"mailto:Christian.Koenig@amd.com">=
&lt;Christian.Koenig@amd.com&gt;</a>; Deng, Emily<br>
&gt;&gt;&gt; <a href=3D"mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&g=
t;</a>; <a href=3D"mailto:steven.price@arm.com">
steven.price@arm.com</a><br>
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
&gt;&gt;&gt;&gt; Signed-off-by: Andrey Grodzovsky <a href=3D"mailto:andrey.=
grodzovsky@amd.com">
&lt;andrey.grodzovsky@amd.com&gt;</a><br>
&gt;&gt;&gt;&gt; Reviewed-by: Christian K=F6nig <a href=3D"mailto:christian=
.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a><br>
&gt;&gt;&gt;&gt; Tested-by: Emily Deng <a href=3D"mailto:Emily.Deng@amd.com=
">&lt;Emily.Deng@amd.com&gt;</a><br>
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
&gt;&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * signaled.<o:p></o:p></p>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</blockquote>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB297587DE9C55B6AC399B98BF8F420MN2PR12MB2975namp_--

--===============1753500159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1753500159==--
