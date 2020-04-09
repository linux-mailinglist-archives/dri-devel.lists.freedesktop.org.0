Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133851A35CE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 16:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BAF6EBC2;
	Thu,  9 Apr 2020 14:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700043.outbound.protection.outlook.com [40.107.70.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F646E215;
 Thu,  9 Apr 2020 14:24:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbsO4c9wPVgCMSdj2aDUwACVyoVA42ww3K9FRpQ4IIFiXBtYbtggwWQqHmOCIZc2CF36rvSCGQEdq+4OqxqBGgtLBAUZmbJmdge2RkZVvrwEAncVKKqDTc4j5W/kvzgsGbD+jahs2oFCQi2ELNHwnwAdT6v1lh/3m6jeQWghYwAt4MWT+N1VmVytF8fMECXh1kEapQhvJgS1pz8wkK8HF+pDYRkNWUCZNaMuLZ3Q2IQh4cTmh6TlsH0EcKrHvEP+ZDfzdKEfTtVoY/gelPbnqRGXMK/KHZuZus695Fgkw9AmeabCJ4fOROjjQBgreKweiIa1CuVmZhT0w6NFsx3pzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dl+NlhmaVjdoxlH9Pc5CfnR8dgHbsyEoYyhTmAS9ho=;
 b=OAIqJ7RPLgxubD+F9I1eA1EtRieXGTOPlkaq/d0tvyCusgdQy5gIeTvuEg3GSJkrlv/lSyUESpImw7SrwV8O0nhPXz+n8QfvlaosapHliqxKE1+peoUQWpHw1bwkMigFI2yaEWiBJLQEk8cibitkfPKNuTFe0qoF9vwJZIOrQZjJvvGtxmhiXUx1G18f00t0XU8RZqtfP/upnFl/9/FcKWehrI2/8pxkqgcpwhpstGUPrxH/kYZrZEUy8qeza8Ybwkonv1Xbw3meiJtheWm9TX2zHUsbd8H4hreaIygek91RI/CZfpKVyM6Ew9wXs9LPnv/Q6fZVuWitf1hxX/QhDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dl+NlhmaVjdoxlH9Pc5CfnR8dgHbsyEoYyhTmAS9ho=;
 b=GF0RyQZJ6gGUJ2FwSFS0AsqNHAj5H/1606Ko/KEUzEcCFpzlBYzMGXDguT7P0l1GYGQuhkQxky6mBZlZVqBGHa+T0hO2mHyq662YOIo2qtsKJ7anEbnmvKOI+XOuYr11dOFDEv1Tihj3TguW2RcWrmqW5Yn8BGem465itUZMSgs=
Received: from BL0PR12MB2547.namprd12.prod.outlook.com (2603:10b6:207:3e::10)
 by BL0PR12MB2561.namprd12.prod.outlook.com (2603:10b6:207:3e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17; Thu, 9 Apr
 2020 14:24:12 +0000
Received: from BL0PR12MB2547.namprd12.prod.outlook.com
 ([fe80::f4bc:85f1:49eb:4925]) by BL0PR12MB2547.namprd12.prod.outlook.com
 ([fe80::f4bc:85f1:49eb:4925%7]) with mapi id 15.20.2878.016; Thu, 9 Apr 2020
 14:24:12 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: Lucas Stach <l.stach@pengutronix.de>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/ttm: Schedule out if possibe in bo delayed delete
 worker
Thread-Topic: [PATCH] drm/ttm: Schedule out if possibe in bo delayed delete
 worker
Thread-Index: AQHWDg7Emk3p0W+6c0quMUa8b5xmnKhwuoAAgAAOIoCAAAOIAIAABspegAABUgmAAAQvsg==
Date: Thu, 9 Apr 2020 14:24:12 +0000
Message-ID: <BL0PR12MB2547BF609F21C48B17A402A087C10@BL0PR12MB2547.namprd12.prod.outlook.com>
References: <20200409013148.4219-1-xinhui.pan@amd.com>
 <7ebd6025-a563-30d1-8c84-cb031bfef0c1@amd.com>
 <d80c89fe353a114df786e75563d434c496b8140d.camel@pengutronix.de>,
 <8b634370-1771-4aa4-8725-74b5d807db4b@amd.com>,
 <BL0PR12MB254767C8A1AFAE0D52685A1F87C10@BL0PR12MB2547.namprd12.prod.outlook.com>,
 <BL0PR12MB254789981840471CD72EBFD487C10@BL0PR12MB2547.namprd12.prod.outlook.com>
In-Reply-To: <BL0PR12MB254789981840471CD72EBFD487C10@BL0PR12MB2547.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-04-09T14:02:41.0143287Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Privileged
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
x-originating-ip: [101.88.212.202]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f04a9267-c433-4be3-cc46-08d7dc91acf0
x-ms-traffictypediagnostic: BL0PR12MB2561:|BL0PR12MB2561:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB2561F0603FB8999AECAB3C2B87C10@BL0PR12MB2561.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0368E78B5B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2547.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(2940100002)(66574012)(71200400001)(478600001)(4326008)(66446008)(64756008)(91956017)(55016002)(966005)(76116006)(45080400002)(66556008)(66476007)(9686003)(2906002)(66946007)(110136005)(316002)(53546011)(6506007)(7696005)(33656002)(81156014)(5660300002)(52536014)(86362001)(8676002)(8936002)(81166007)(26005)(6636002)(186003);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hZxs7z3Ygd1Kfn4fdG2h+9BUsFmAct4soD5sbKrwLXHcLB+x2LT/kcmLOPKP/kfOtEzhBosnPGzQN2aFBcAawaxKJJNmWB26r/b3fZBUz9WDcRtfEm/XaekkQopHiEK14/bcUtN5weMhMVCqe3hvFJSOTpig+zTjKP3pTWAHk+8NwRK+/pphQs6dI4aNWZ8yy8gp7A4pv321PUx6pTbEPCOV0knvop/o4TyJswBiikgpx3WAILwEDV9fbvyrrIOCJ1YpGH8j0R/im9PcMU22h+zpmNxAVpc1xWJxAir8pnASIzzNW9ioSCo0tOlVPGNy2UKKcMR1dvpa97mcCfsg7krSzLgbsxny3pVRqn3uZthHhJP/P2vv3P8o5ukxGRLVzWyn634Pt3wiuGqFch0UbMzB4ZVzqabFgC/hhnAB+CBpxuvnmE60fN9QGaPzljMy49AODOF6gqbet7prmOG8zW4XHyWxneyyCuzIM4kqrAgrZ3oF0S82FByH8egUk6nw2bu4gcks0lawNvxQBUTWmA==
x-ms-exchange-antispam-messagedata: nn9I/aZzDXnHCu8q427eiUxQlU4s7SvyvXj4foQykj35a7X0352K24C8EpheemIiy4Wr3Ff1iEicHaXy/kPvKx5Qha0C4MU6LtdhQJdUZMPKv+mZaQ5GGf1ovGXBm3NSSvo0qrftY4GkQAiXABNhnA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f04a9267-c433-4be3-cc46-08d7dc91acf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2020 14:24:12.5155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UZSC8qORKAj0ZJ0Im/pUiUBOjzOaUtvsS6uBKCSX3eP4t3hsLIMv1mG6hqtXticF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2561
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0857703175=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0857703175==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_BL0PR12MB2547BF609F21C48B17A402A087C10BL0PR12MB2547namp_"

--_000_BL0PR12MB2547BF609F21C48B17A402A087C10BL0PR12MB2547namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

https://elixir.bootlin.com/linux/latest/source/mm/slab.c#L4026

This is another example of the usage of  cond_sched.
________________________________
From: Pan, Xinhui <Xinhui.Pan@amd.com>
Sent: Thursday, April 9, 2020 10:11:08 PM
To: Lucas Stach <l.stach@pengutronix.de>; amd-gfx@lists.freedesktop.org <am=
d-gfx@lists.freedesktop.org>; Koenig, Christian <Christian.Koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: Schedule out if possibe in bo delayed delete =
worker

I think it doesn't matter if workitem schedule out. Even we did not schedul=
e out, the workqueue itself will schedule out later.
So it did not break anything with this patch I think.
________________________________
From: Pan, Xinhui <Xinhui.Pan@amd.com>
Sent: Thursday, April 9, 2020 10:07:09 PM
To: Lucas Stach <l.stach@pengutronix.de>; amd-gfx@lists.freedesktop.org <am=
d-gfx@lists.freedesktop.org>; Koenig, Christian <Christian.Koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: Schedule out if possibe in bo delayed delete =
worker

Why we break out the loops when there are pending bos to be released?

And I just checked the process_one_work. Right after the work item callback=
 is called,  the workqueue itself will call cond_resched. So I think
________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Thursday, April 9, 2020 9:38:24 PM
To: Lucas Stach <l.stach@pengutronix.de>; Pan, Xinhui <Xinhui.Pan@amd.com>;=
 amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: Schedule out if possibe in bo delayed delete =
worker

Am 09.04.20 um 15:25 schrieb Lucas Stach:
> Am Donnerstag, den 09.04.2020, 14:35 +0200 schrieb Christian K=F6nig:
>> Am 09.04.20 um 03:31 schrieb xinhui pan:
>>> The delayed delete list is per device which might be very huge. And in
>>> a heavy workload test, the list might always not be empty. That will
>>> trigger any RCU stall warnings or softlockups in non-preemptible kernel=
s
>>> Lets do schedule out if possible in that case.
>> Mhm, I'm not sure if that is actually allowed. This is called from a
>> work item and those are not really supposed to be scheduled away.
> Huh? Workitems can schedule out just fine, otherwise they would be
> horribly broken when it comes to sleeping locks.

Let me refine the sentence: Work items are not really supposed to be
scheduled purposely. E.g. you shouldn't call schedule() or
cond_resched() like in the case here.

Getting scheduled away because we wait for a lock is of course perfectly
fine.

>   The workqueue code
> even has measures to keep the workqueues at the expected concurrency
> level by starting other workitems when one of them goes to sleep.

Yeah, and exactly that's what I would say we should avoid here :)

In other words work items can be scheduled away, but they should not if
not really necessary (e.g. waiting for a lock).

Otherwise as you said new threads for work item processing are started
up and I don't think we want that.

Just returning from the work item and waiting for the next cycle is most
likely the better option.

Regards,
Christian.

>
> Regards,
> Lucas
>
>> Maybe rather change the while into while (!list_empty(&bdev->ddestroy)
>> && !should_reschedule(0)).
>>
>> Christian.
>>
>>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_bo.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.=
c
>>> index 9e07c3f75156..b8d853cab33b 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -541,6 +541,7 @@ static bool ttm_bo_delayed_delete(struct ttm_bo_dev=
ice *bdev, bool remove_all)
>>>              }
>>>
>>>              ttm_bo_put(bo);
>>> +           cond_resched();
>>>              spin_lock(&glob->lru_lock);
>>>      }
>>>      list_splice_tail(&removed, &bdev->ddestroy);
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist=
s.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C01%7Cchr=
istian.koenig%40amd.com%7C0a47486676a74702f05408d7dc89839c%7C3dd8961fe4884e=
608e11a82d994e183d%7C0%7C0%7C637220355504145868&amp;sdata=3DwbRkYBPI6mYuZjK=
BtQN3AGLDOwqJlWY3XUtwwSiUQHg%3D&amp;reserved=3D0


--_000_BL0PR12MB2547BF609F21C48B17A402A087C10BL0PR12MB2547namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
https://elixir.bootlin.com/linux/latest/source/mm/slab.c#L4026<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
This is another example of the usage of&nbsp; cond_sched.</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Pan, Xinhui &lt;Xinhu=
i.Pan@amd.com&gt;<br>
<b>Sent:</b> Thursday, April 9, 2020 10:11:08 PM<br>
<b>To:</b> Lucas Stach &lt;l.stach@pengutronix.de&gt;; amd-gfx@lists.freede=
sktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; Koenig, Christian &lt;Chri=
stian.Koenig@amd.com&gt;<br>
<b>Cc:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/ttm: Schedule out if possibe in bo delayed =
delete worker</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
I think it doesn't matter if workitem schedule out. Even we did not schedul=
e out, the workqueue itself will schedule out later.<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
So it did not break anything with this patch I think.</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Pan, Xinhui &lt;Xin=
hui.Pan@amd.com&gt;<br>
<b>Sent:</b> Thursday, April 9, 2020 10:07:09 PM<br>
<b>To:</b> Lucas Stach &lt;l.stach@pengutronix.de&gt;; amd-gfx@lists.freede=
sktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; Koenig, Christian &lt;Chri=
stian.Koenig@amd.com&gt;<br>
<b>Cc:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/ttm: Schedule out if possibe in bo delayed =
delete worker</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Why we break out the loops when there are pending bos to be released?<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
And I just checked the process_one_work. Right after the work item callback=
 is called,&nbsp; the workqueue itself will call cond_resched. So I think
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif=
" color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Koenig, Christian=
 &lt;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Thursday, April 9, 2020 9:38:24 PM<br>
<b>To:</b> Lucas Stach &lt;l.stach@pengutronix.de&gt;; Pan, Xinhui &lt;Xinh=
ui.Pan@amd.com&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedes=
ktop.org&gt;<br>
<b>Cc:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/ttm: Schedule out if possibe in bo delayed =
delete worker</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_x_BodyFragment"><font size=3D"2"><span style=3D"font-size:1=
1pt">
<div class=3D"x_x_PlainText">Am 09.04.20 um 15:25 schrieb Lucas Stach:<br>
&gt; Am Donnerstag, den 09.04.2020, 14:35 &#43;0200 schrieb Christian K=F6n=
ig:<br>
&gt;&gt; Am 09.04.20 um 03:31 schrieb xinhui pan:<br>
&gt;&gt;&gt; The delayed delete list is per device which might be very huge=
. And in<br>
&gt;&gt;&gt; a heavy workload test, the list might always not be empty. Tha=
t will<br>
&gt;&gt;&gt; trigger any RCU stall warnings or softlockups in non-preemptib=
le kernels<br>
&gt;&gt;&gt; Lets do schedule out if possible in that case.<br>
&gt;&gt; Mhm, I'm not sure if that is actually allowed. This is called from=
 a<br>
&gt;&gt; work item and those are not really supposed to be scheduled away.<=
br>
&gt; Huh? Workitems can schedule out just fine, otherwise they would be<br>
&gt; horribly broken when it comes to sleeping locks.<br>
<br>
Let me refine the sentence: Work items are not really supposed to be <br>
scheduled purposely. E.g. you shouldn't call schedule() or <br>
cond_resched() like in the case here.<br>
<br>
Getting scheduled away because we wait for a lock is of course perfectly <b=
r>
fine.<br>
<br>
&gt;&nbsp;&nbsp; The workqueue code<br>
&gt; even has measures to keep the workqueues at the expected concurrency<b=
r>
&gt; level by starting other workitems when one of them goes to sleep.<br>
<br>
Yeah, and exactly that's what I would say we should avoid here :)<br>
<br>
In other words work items can be scheduled away, but they should not if <br=
>
not really necessary (e.g. waiting for a lock).<br>
<br>
Otherwise as you said new threads for work item processing are started <br>
up and I don't think we want that.<br>
<br>
Just returning from the work item and waiting for the next cycle is most <b=
r>
likely the better option.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Lucas<br>
&gt;<br>
&gt;&gt; Maybe rather change the while into while (!list_empty(&amp;bdev-&g=
t;ddestroy)<br>
&gt;&gt; &amp;&amp; !should_reschedule(0)).<br>
&gt;&gt;<br>
&gt;&gt; Christian.<br>
&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: xinhui pan &lt;xinhui.pan@amd.com&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_bo.c | 1 &#43;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; 1 file changed, 1 insertion(&#43;)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/tt=
m/ttm_bo.c<br>
&gt;&gt;&gt; index 9e07c3f75156..b8d853cab33b 100644<br>
&gt;&gt;&gt; --- a/drivers/gpu/drm/ttm/ttm_bo.c<br>
&gt;&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/ttm/ttm_bo.c<br>
&gt;&gt;&gt; @@ -541,6 &#43;541,7 @@ static bool ttm_bo_delayed_delete(stru=
ct ttm_bo_device *bdev, bool remove_all)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ttm_bo_put(bo);<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; cond_resched();<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; spin_lock(&amp;glob-&gt;lru_lock);<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_splice_tail(&amp;removed, &=
amp;bdev-&gt;ddestroy);<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; dri-devel mailing list<br>
&gt;&gt; dri-devel@lists.freedesktop.org<br>
&gt;&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp=
;data=3D02%7C01%7Cchristian.koenig%40amd.com%7C0a47486676a74702f05408d7dc89=
839c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637220355504145868&amp;am=
p;sdata=3DwbRkYBPI6mYuZjKBtQN3AGLDOwqJlWY3XUtwwSiUQHg%3D&amp;amp;reserved=
=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp;data=3D02%7C01%7Cch=
ristian.koenig%40amd.com%7C0a47486676a74702f05408d7dc89839c%7C3dd8961fe4884=
e608e11a82d994e183d%7C0%7C0%7C637220355504145868&amp;amp;sdata=3DwbRkYBPI6m=
YuZjKBtQN3AGLDOwqJlWY3XUtwwSiUQHg%3D&amp;amp;reserved=3D0</a><br>
<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_BL0PR12MB2547BF609F21C48B17A402A087C10BL0PR12MB2547namp_--

--===============0857703175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0857703175==--
