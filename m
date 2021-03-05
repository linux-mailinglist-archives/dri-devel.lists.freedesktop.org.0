Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C8232EC78
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 14:50:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377386EB84;
	Fri,  5 Mar 2021 13:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690040.outbound.protection.outlook.com [40.107.69.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D736EB84;
 Fri,  5 Mar 2021 13:50:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAFfR/Mqh7UnmuKoqUTRC6nZB1sbrqdZz0ckqNWp0I/EKzqbXh0Vf+aq3nW+QDBd7Ultd0L37IOkawFuqTiZiMxFg1RKJeIFlTkkFxc5NS4xDwudXH0+tmjN96u/JvI+1HWgkekltWDjcldMPSrRXIOEMNjkM1HQFEduJvnRz+mT5HoDTZt8WXHWcaC557I7X70O9QXo7xs1gkeLqN5+dNST3mAXx7XIcfjDQoO0Iny2VlS9LEsaW566DS8f2Yb5bDfYmM8VgbcjrolsCLiYXnrO1B4eTxHVhBHCLc7XTeCJypmA9EFB06mXcK5cgkPhCjs5Ih6VsLNe/ENXZmKoyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXtATst6vvwAiP91n+8VD63WhJXcMXBRvV85IZrXb08=;
 b=H9OZEcoe84cU4fXWdFkZHTWwrYvZUb4Nd5SnxjMAUIBN8VsdQ115HDHUm3RAXAf4dFr0+5hiyu/YoigabGdok1U6X+1Rm7MROwRTWvbYf1h0h8MuKkFQcspd/O5k9GkKjmz64FTNtRWdrTAGA0IZDBlBVs2mmlEBlTJBv+Vb8HDvyhd9H+xF+CZDROTDBrrWpjhO49ksLgnwOWC11xubVWbMPV+PjlkCR/OGzbvZe4L01z6S+pbXYGCYRz+KJKK3kAGSK3UrkbkLABSIbvOj0dGWbzBSxy3HyJfpSJYfRLnzi1M0eR57r6G2GoxJrRgcYppQymrc92cwPtb1ZTYv8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXtATst6vvwAiP91n+8VD63WhJXcMXBRvV85IZrXb08=;
 b=XmKmZZ+wVrD7bABPAPMz0ixz6fit94B1FTLhgm7ixSpRrb29hyp0lK+yYNUSgJrxmjRQGEL8mG9WuNUrAoPgFDzmBCpaKCIYJVA77r38YzRPn35P53ahjbQyHtiUc5IFhubtUhHPz24Xm/OGMgT9wSZkHtac3OXngKMdTZOHePU=
Received: from DM6PR12MB3433.namprd12.prod.outlook.com (2603:10b6:5:38::14) by
 DM5PR1201MB0186.namprd12.prod.outlook.com (2603:10b6:4:4d::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.23; Fri, 5 Mar 2021 13:50:02 +0000
Received: from DM6PR12MB3433.namprd12.prod.outlook.com
 ([fe80::807c:1f17:9a40:51a3]) by DM6PR12MB3433.namprd12.prod.outlook.com
 ([fe80::807c:1f17:9a40:51a3%7]) with mapi id 15.20.3912.022; Fri, 5 Mar 2021
 13:50:02 +0000
From: "Jiang, Sonny" <Sonny.Jiang@amd.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/sched: select new rq even if there is only one v3
Thread-Topic: [PATCH 1/2] drm/sched: select new rq even if there is only one v3
Thread-Index: AQHXEb5VcwvMOP6050mA2g6ixmd51Kp1aTT1
Date: Fri, 5 Mar 2021 13:50:02 +0000
Message-ID: <DM6PR12MB3433D2FF4035AC5F6AC39E2DFD969@DM6PR12MB3433.namprd12.prod.outlook.com>
References: <20210305125155.2312-1-christian.koenig@amd.com>
In-Reply-To: <20210305125155.2312-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-03-05T13:50:01.045Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [67.71.240.213]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 42221dc5-e346-4077-a2dd-08d8dfdd9382
x-ms-traffictypediagnostic: DM5PR1201MB0186:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB0186DA17F567FA39F44240E7FD969@DM5PR1201MB0186.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u1Qxw9unnoxQlxE0NsWT4cXgFGEKGlvgQtXSD1R3E39+9T4zi5+nYqLsg/yAa0RxGTUoJ4ivZFnBpvxCqNd36JjbNYbceZ6Dk5qH2ifBKLG2cdZ8dN4jHHHw7iHsYRpukIybAPPZ+ranqkyDSzeFCTqYYYdyuA/ts/xwV9+WR7X6CGoF5zYi69MumJI6UWDXsiHx/K2l0tekGsj2Jlv46uMaXA9HIZ5bVgT9X8niLYC13ZVxzki0Ol8QL1utR0Gn0xds+jgM/nK2VsMsGmI9b97ctn05SaZABpELvIvgcx1WvC1hEdG5TIAgrM4RCGJ0G5ZsIq+rE90JsWZ9TwX8i7kGo6DKsv3GqvoRnfGQV+bVJfR9HhADRC3W1OVa/sp0L0ZK4iC0xuEofMQxlczDN0RwddUkXZNVXLm43BmkCATL7onZKfCgbz4Sfuih3X7GvpdJ4Zn8fDCYNvoo/P+QyuXul+OZGTX/L5GThlpD7jCCMR6dSAkknATC0XsEEHg2qg+59rh66ubDSr/6kd2kAg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3433.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(2906002)(19627405001)(5660300002)(52536014)(478600001)(66476007)(4326008)(316002)(66574015)(8676002)(26005)(66556008)(6506007)(66946007)(66446008)(7696005)(53546011)(110136005)(76116006)(71200400001)(9686003)(91956017)(33656002)(86362001)(8936002)(64756008)(83380400001)(55016002)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?EWzKR+LV7CWjRfGgrs+f1SU1NZVth2G02vcsa++5aafOo4WCVqa5nhyGaw?=
 =?iso-8859-1?Q?OufVaIA5cT9IPYm4wEXUYaUV6FFgNr81VBIv1vus4TJS4bCrmsV95M5j6i?=
 =?iso-8859-1?Q?tAhK4jYSaRE041QeuwyEjj/LFzoAcx4qprexgWhLSdjSouXfMPQSQiEQp4?=
 =?iso-8859-1?Q?DUw9bcCquuVEshjfY5TtvhKM1Fdzm2cyzA/2UAh86+1PAIFjDs4cMHfaGN?=
 =?iso-8859-1?Q?iHx1msHwNws3+eDz91byM9WyLydOj9DcAOiDftpI9bhF4AoWxetu52iE3O?=
 =?iso-8859-1?Q?XMBtmXseNKbtQXc4QjSfTJ04AHp4YyjWN/tmwBtOexBVmQyRb692yxjUcC?=
 =?iso-8859-1?Q?egzu4v8clHGK1z9MEDIaxMKPVXpj7hx1V/nZnBvwqkKVsoFEvL1bA45vGK?=
 =?iso-8859-1?Q?5WgRapy7YtIgi7xb37Ir4BNSFYlAp+2O0EOHXvEXefk8amiBumgbK0+ZkU?=
 =?iso-8859-1?Q?ACr6z4e7BZG3abGzT5sQc8OP/IPvuYI/UP+GYPZxQ0blxkgaV73bvrzb9T?=
 =?iso-8859-1?Q?sxtB3D2NtlueJYKkQMggndc1P7lt2XctCmJrxRghqs0WQmX5odxeQVhrsC?=
 =?iso-8859-1?Q?mKneEpurYadQnK1G2uVWb8ZaB1akWHV85IcTC2A8gmDyI+zKuZKFTdiFKt?=
 =?iso-8859-1?Q?kyUJLqd45SfCn1ICbIEC+rCDnvdqIggJMY+TgbFWie7xWsv1ZTDD2eK87Z?=
 =?iso-8859-1?Q?yLcgCgFnXHtYfn139rvhrrpEwzsf3aj1SGVsb0nO0MOydkba2SgTSO07sT?=
 =?iso-8859-1?Q?AReIEoYs4wWxKGKnNYMA+ajiFXyQrKN0B38bZn5+KtJZ5uiKMeBGsk5/5F?=
 =?iso-8859-1?Q?Czw7Xs/pLy02s6ubViGiCQxqfxQ/163Vx1CkjLVpQ1gYYSY5loho8myixr?=
 =?iso-8859-1?Q?3nzOgeJxkKpJXwyrMYq8yNnvVNn4MP0nOR+lNaz11DmU3OH32lDCPq6399?=
 =?iso-8859-1?Q?P0f0Z5zPLAoTDLawcpSJfh/c2e5G/cX4X7wbGJ3sA8oAJJf00LJPvauI+1?=
 =?iso-8859-1?Q?tFGdKUcyfB8DDhvcFGv4EFLm7E3g8ZCBoyxh2pir8Etr1hRJy0jo7LbHX5?=
 =?iso-8859-1?Q?+FQWn8tWhL9iJBffVyQCB0QZOuQqm0tQWJSP0/2X1BOMGmon8hmEsMEceN?=
 =?iso-8859-1?Q?xapiRm/gHaIYpIiP659CwujDE96Wqns/TXRoYb+m3SGqQfdP1RWO8eK4Vx?=
 =?iso-8859-1?Q?uoBTYxrCgf9ODLdwG0AsfV1WITD9NcKL39OaRazSIVWdtXeB7onBM8hC8j?=
 =?iso-8859-1?Q?ugWe8VKshFgAK7cWVG3feNqrG3iGqZPAg0g+H6M7GdKAknpqLa4OVnWXOE?=
 =?iso-8859-1?Q?aNs1TN1/azrzomJrcc+1pHFCRxsinoM49rnJS6EDCOI7C3M=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3433.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42221dc5-e346-4077-a2dd-08d8dfdd9382
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2021 13:50:02.8094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oO58ll20oAILn49XrmMWhceFsnB6Hfpc6ml2shlOt+h03rzzwa4qky6ME0A9nWG3x0nYY0eEvYVddsW+koRGuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0186
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
Cc: "Liu, Leo" <Leo.Liu@amd.com>
Content-Type: multipart/mixed; boundary="===============1898858616=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1898858616==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB3433D2FF4035AC5F6AC39E2DFD969DM6PR12MB3433namp_"

--_000_DM6PR12MB3433D2FF4035AC5F6AC39E2DFD969DM6PR12MB3433namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Reviewed-by: Sonny Jiang <sonny.jiang@amd.com>
________________________________
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Friday, March 5, 2021 7:51 AM
To: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; amd-=
gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Liu, Leo <Leo.Liu@amd.com>; Jiang, Sonny <Sonny.Jiang@amd.com>
Subject: [PATCH 1/2] drm/sched: select new rq even if there is only one v3

This is necessary when changing priorities of an entity.

v2: test the sched_list instead of num_sched.
v3: set the sched_list to NULL when there is only one entry

Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/sch=
eduler/sched_entity.c
index 92d965b629c6..f0790e9471d1 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -453,7 +453,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity=
 *entity)
         struct drm_gpu_scheduler *sched;
         struct drm_sched_rq *rq;

-       if (spsc_queue_count(&entity->job_queue) || entity->num_sched_list =
<=3D 1)
+       if (spsc_queue_count(&entity->job_queue) || !entity->sched_list)
                 return;

         fence =3D READ_ONCE(entity->last_scheduled);
@@ -467,8 +467,10 @@ void drm_sched_entity_select_rq(struct drm_sched_entit=
y *entity)
                 drm_sched_rq_remove_entity(entity->rq, entity);
                 entity->rq =3D rq;
         }
-
         spin_unlock(&entity->rq_lock);
+
+       if (entity->num_sched_list =3D=3D 1)
+               entity->sched_list =3D NULL;
 }

 /**
--
2.25.1


--_000_DM6PR12MB3433D2FF4035AC5F6AC39E2DFD969DM6PR12MB3433namp_
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
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by:&nbsp;Sonny Jiang &lt;sonny.jiang@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Christian K=F6nig &lt=
;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Friday, March 5, 2021 7:51 AM<br>
<b>To:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt=
;<br>
<b>Cc:</b> Liu, Leo &lt;Leo.Liu@amd.com&gt;; Jiang, Sonny &lt;Sonny.Jiang@a=
md.com&gt;<br>
<b>Subject:</b> [PATCH 1/2] drm/sched: select new rq even if there is only =
one v3</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This is necessary when changing priorities of an e=
ntity.<br>
<br>
v2: test the sched_list instead of num_sched.<br>
v3: set the sched_list to NULL when there is only one entry<br>
<br>
Signed-off-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/scheduler/sched_entity.c | 6 ++++--<br>
&nbsp;1 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/sch=
eduler/sched_entity.c<br>
index 92d965b629c6..f0790e9471d1 100644<br>
--- a/drivers/gpu/drm/scheduler/sched_entity.c<br>
+++ b/drivers/gpu/drm/scheduler/sched_entity.c<br>
@@ -453,7 +453,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity=
 *entity)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_gpu_scheduler *=
sched;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_sched_rq *rq;<b=
r>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (spsc_queue_count(&amp;entity-&gt;=
job_queue) || entity-&gt;num_sched_list &lt;=3D 1)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (spsc_queue_count(&amp;entity-&gt;=
job_queue) || !entity-&gt;sched_list)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fence =3D READ_ONCE(entity=
-&gt;last_scheduled);<br>
@@ -467,8 +467,10 @@ void drm_sched_entity_select_rq(struct drm_sched_entit=
y *entity)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; drm_sched_rq_remove_entity(entity-&gt;rq, entity);<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; entity-&gt;rq =3D rq;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;entity-&g=
t;rq_lock);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (entity-&gt;num_sched_list =3D=3D =
1)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; entity-&gt;sched_list =3D NULL;<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;/**<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM6PR12MB3433D2FF4035AC5F6AC39E2DFD969DM6PR12MB3433namp_--

--===============1898858616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1898858616==--
