Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424853FD049
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 02:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A6989F4F;
	Wed,  1 Sep 2021 00:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD0B89DA8;
 Wed,  1 Sep 2021 00:24:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nia3CAG98kU2TwIoha/f7Vz4ov75yAqUtcgLlWmztInQzr2wPy4pYnH7YSce9n+cuF/SKHUWy+PjpE32reICiwwzKTT9w0zkhZFW2OHhP4UMQHIvd0RylM7IH92YiE15d9HfWcEzQjCHIHnMbAYO5m43tIeuljHKZxnXtl1sNHE2hDbOqptw+4tIAo8ISYIFdQeSG5G9klysLNBV+scIyzqAbEqPvCebrHmIKBBV2dpKrxvemhX92Wpf8KtS82DKanPmSBn52zHE+hENUp9ls44r2IC6smNPFs5kwxqsJ9S1uF92jiEFawjw3wo8vhjKqmy82YyYszf1S2s0oP+89A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=L1Uaw/73VMkWwAa31kXYPkk8nzJI/Q4QS7dwWazt1JU=;
 b=VtxUo6cDaJYcEOybWMrVuY9AH5eQxukhyOo97618p5BjxVV8uqfimE24hTnBz0A1NbAKjLK/uVw11TO61ZrLQ1YLrcTpUpx4oTfY8WL+MJnG1T07ettiJHQKDTc40nR3s/5yZvjVZX/JaTsRmm3Q5UgnHnLrbBp1kTXrorMQL7bKlRDXG+CZjes8anxRObvf5j9NgMNbjmgsYZISFY2OGvO51Tij9spssHoV8rmbaOc1X+FUXbxHxlbjEbhm4PJxQgHyZwsKvJSMFX1+sWVnFIzxRCpnUL74AvfULERLlrQUXc/bJgs6clkNxDKuPEviTQ2oT+1Xfn5vH8uq41B8cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1Uaw/73VMkWwAa31kXYPkk8nzJI/Q4QS7dwWazt1JU=;
 b=bCtbN9PRW2HgzCImN/bwgAM0Zt/xwIK10rA99rJCw2PPu22F0utRNXXz6i4k3Nn7maBo+ZxVRYTMieMkqJ0YpuQOBQawGjzpwPLgD4N+LDymfAmA1J6O4duxyrcXXgyQMN5G4qD5O1LOblHjpJllJstzwWEnfT53h1kZUSqwIpY=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by BL1PR12MB5378.namprd12.prod.outlook.com (2603:10b6:208:31d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Wed, 1 Sep
 2021 00:24:51 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a%5]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 00:24:51 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Liu, Monk" <Monk.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/sched: fix the bug of time out calculation(v3)
Thread-Topic: [PATCH 1/2] drm/sched: fix the bug of time out calculation(v3)
Thread-Index: AQHXnlP03r7KbMowyEq+U+g7v0FK2quOUrDQ
Date: Wed, 1 Sep 2021 00:24:50 +0000
Message-ID: <BL1PR12MB526965057AF19DCC9A8860EA84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
In-Reply-To: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-01T00:24:46Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=433e92c1-6c99-4542-a5a0-26f7594dc5a6;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44dc0472-7362-4a57-9117-08d96cdee9cd
x-ms-traffictypediagnostic: BL1PR12MB5378:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB5378259265541C29927DC00284CD9@BL1PR12MB5378.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ui8ZuIUvyQNVdENJzdK8E2Ad3N4Mhw19ovHgCTRFtGAOEZ6gEsmaOiSDLWtvgahXfah7bO2L9DLDpthy04ouvRllHs5gJFj9Miy6vNbJ3LkiwYMdxPL+y+qyl4yCJVRiVnkc4Va4PRBdcCUroxhPnpgLf8AGWO7X+MfhvoDn6WbigR/EPJ1JM9MaO2ibZFf+8G7qfayOU6g9itlyZpnd1LKkip/whYb+s6gCmJwBOyDL2VB3wQ+gjVqn/12OzgtGkCQ7qHlIWCzO09AVzlCbqz7uZ91o/PzDefgqTmTUpMBzE5ZyZLNLZT5cDeFRDrB+9D3A2qBSLlZN8zEDSZHVJEIzZBnEI00bktng7z9D5+Dsiahzxyfy58hbOLAMxuZydg9q3dnEK3c/uTElH3K5lNAduYI/9T1xBVKEyLxsYjmmcnGRhIBKuen7d2Vl8NL9VotNxI9NI1/I79IYEU1cr110wdVKaHek10fNgYkHcQ5461I+p3sQVssPIAXDy1edheHOu1p3onoqUYpEQFUIQQVRXKNbZNa8KQHLsp5ciIGRzyzAmXcG0o1NXa+OrYoLrUUGf8B29fNINvUQ2Rdfzcok88RlrH7DHUB0x3vws7T4bUs3fo2uCTCVgeuYU78jULkA5/Hg+83fVPnqfnZpkAzFf9rDUOgZ3v6cXL5TNqR6Dp7z27z037LpB+5K5GhHIc5DUFYjroQznZyCJn+A8w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(376002)(39860400002)(136003)(8936002)(66556008)(66446008)(4326008)(38070700005)(66476007)(83380400001)(33656002)(2906002)(76116006)(64756008)(7696005)(450100002)(478600001)(186003)(71200400001)(6506007)(38100700002)(9686003)(66946007)(86362001)(55016002)(52536014)(316002)(110136005)(122000001)(5660300002)(26005)(53546011)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AlgusgEiWGoL+LJh2CJypN9NDdRxGZ87yXN3pxtv6aJStG5YWKPEG2LGRB2s?=
 =?us-ascii?Q?47pArKj28+RRfHH6B3enjmxKdGYrdW0NZHCrgN9b+6FfihOxsft+swRjcGmS?=
 =?us-ascii?Q?X4MooPWsKjHUl2yc0Y1mwZC89XWx3c1qjSK2dKbffqXPfaZieFOJlfGHP27r?=
 =?us-ascii?Q?cBYGnIeaK+zJVV/VGgLgM0l+rpP77cwod0fiy3QfCVfsH/ZlMewOko9vNJHY?=
 =?us-ascii?Q?qAPRAfCDs7UYbwbSArPr+LJOIuHnzFnpdCoGXXej1krnOlUOO3KCQkHt27z9?=
 =?us-ascii?Q?SCUOIUwv2p9RvZdnpzmXWfJiCfjD5muEJARBjK8KnLomvR+kxpk/VXAT9YEE?=
 =?us-ascii?Q?yw4bzAqCNFRYtz6LyGFiIu9ZuTTw5RB8+P9SoWxwVO+3delQ+69Q8BLzskuK?=
 =?us-ascii?Q?gkIaUpuBR8QhgJfJtdTMwJB3fGn9N7KAe6Xy9YFUc5nS0Rv7zNFgJzSt2tqX?=
 =?us-ascii?Q?bTmemkXwCwervC7eO8EK/qooNqoPlnH/kFilFc+oImmEOMuaKlhDFjN0TKOT?=
 =?us-ascii?Q?1msU2hSMkRAHinowXG9Fu9jY8Guk6zxHjKawXo4X36yb/6HzBvqNPrO2Rhu7?=
 =?us-ascii?Q?c1Rx8ymVHcK8jsf4ZQ0LTTr625RArHrGtwOAx9mIqperMTrtNDxAJlYihqWc?=
 =?us-ascii?Q?I0hS/g1Dyw2xxIbl0jfqT1lupCyaB0lmsj1bfc9DfM7FL0e8vrTVCdW+D2A3?=
 =?us-ascii?Q?jW+nmFabvMOF/nNoNLVxA5KaQbk8NidMyMa3ylIa07QK3tUhy3+RP1ws3Rz9?=
 =?us-ascii?Q?WqdmJ8dK0oLBAEbz3xA0uQ32RZOUf/Lfe4JF12YjbazqtxZitC51z69eZ7t4?=
 =?us-ascii?Q?kIyAMNk6s1/CzzYHr3LA+yqTFjoEGRXuPtdCMkKEfn+jSQLHHRP/jWx3upAz?=
 =?us-ascii?Q?71NVmSqFh/5YqbMVEdw7yQh2ul+fr/OVrNkOqpkjNkvlMShJsLIo1FlLudno?=
 =?us-ascii?Q?ZMFE8IIfhG5sI+xqhZLI1AgyMk6XSAcdrE4LKpJFPxjHrHtGSLoQn1jsn9LM?=
 =?us-ascii?Q?F6+wZPxZyMLcU0psNDpyxtjpyxQBCG03kwBBgnkLmDL/AcFLYhmGGKIC5Do7?=
 =?us-ascii?Q?OqUmc9PqyjRJVf7qNRnBWCkgFrfR6slQCdbrOORJAc28TSu3BAODb1zD/91O?=
 =?us-ascii?Q?o3b2JIMfBRM16dcfPIahF5iybaqTroWqWCChR73qwtvvqfE1Oph4F8b/l5Ct?=
 =?us-ascii?Q?9oR4eUGbJQMV/AuTz+QZ41FhEQUmnZBcXnbHFcR3ap+hYXcChrMniyQ7vP6z?=
 =?us-ascii?Q?XlOp6t4DftHOvSSLvK4edFItf8u+5BMVeKxxZapLJEmC3Zuwpguk0hloOGI8?=
 =?us-ascii?Q?RsjHft+4mlooCDa1zjilnnbx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44dc0472-7362-4a57-9117-08d96cdee9cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 00:24:50.9245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fn8jtcag+3D0BOoOi4M3wdhRTXadj0V07zIhRgDX02szK6TuEKB9XtLht0kDuspd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5378
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

[AMD Official Use Only]

Ping Christian, Andrey

Can we merge this patch first ? this is a standalone patch for the timer=20

Thanks=20

------------------------------------------
Monk Liu | Cloud-GPU Core team
------------------------------------------

-----Original Message-----
From: Monk Liu <Monk.Liu@amd.com>=20
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
=20
-	/*
-	 * Don't destroy jobs while the timeout worker is running  OR thread
-	 * is being parked and hence assumed to not touch pending_list
-	 */
-	if ((sched->timeout !=3D MAX_SCHEDULE_TIMEOUT &&
-	    !cancel_delayed_work(&sched->work_tdr)) ||
-	    kthread_should_park())
+	if (kthread_should_park())
 		return NULL;
=20
 	spin_lock(&sched->job_list_lock);
@@ -693,17 +687,21 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *s=
ched)
 	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
 		/* remove job from pending_list */
 		list_del_init(&job->list);
+
+		/* cancel this job's TO timer */
+		cancel_delayed_work(&sched->work_tdr);
 		/* make the scheduled timestamp more accurate */
 		next =3D list_first_entry_or_null(&sched->pending_list,
 						typeof(*next), list);
-		if (next)
+
+		if (next) {
 			next->s_fence->scheduled.timestamp =3D
 				job->s_fence->finished.timestamp;
-
+			/* start TO timer for next job */
+			drm_sched_start_timeout(sched);
+		}
 	} else {
 		job =3D NULL;
-		/* queue timeout for next job */
-		drm_sched_start_timeout(sched);
 	}
=20
 	spin_unlock(&sched->job_list_lock);
@@ -791,11 +789,8 @@ static int drm_sched_main(void *param)
 					  (entity =3D drm_sched_select_entity(sched))) ||
 					 kthread_should_stop());
=20
-		if (cleanup_job) {
+		if (cleanup_job)
 			sched->ops->free_job(cleanup_job);
-			/* queue timeout for next job */
-			drm_sched_start_timeout(sched);
-		}
=20
 		if (!entity)
 			continue;
--
2.7.4
