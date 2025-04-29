Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B76AA0381
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 08:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E82410E2D7;
	Tue, 29 Apr 2025 06:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5B28b8P+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48EF10E2D7
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:36:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcHHT+8reqnWzBCeC8vYzdQWlwDeSvvz9OJSQOohgZVNXJWmeeCR5g0WKtalb4uwJdedCvDazasU2hCtkItuOttTZHeq7Is726Chtb7H7V/SPIW12ijm//MsqJ6zC063SYDPfWLSVIoTtaFESleXEZbEtoJZLDexTxjoXmyivCbBlShaw/uHnhYElbqnQ6ZElX3/kEJmHHaIVC/x9qSYpl7MPJo9E4fGiIXQ18ICttXCa2yjbafTFgapSIijey2O5iGoFq8XhCill1uA07DmpBqrEd/4nEIfloaYh+4fTHvD4be2ZWpVr7MEmTbES8S6vpLx9ACulsUCRsOfYzB8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+rrMQktpbPXZx6ZsQl6xEtGV6KthsUz8O8idwIPgNk=;
 b=n9wanKQGbKRuROBA+O0jsKSrKTMQbjVdfMAgaoGbtG7hbk/UmhxvAm4YtCCKIKuZsgMfsvYBv4gxR6AzKNKRlJWiKf6sxfYmFo+t3DZ0emE5FqzDsFrYibcx1kj/Dswsd6NuIQ2l6usLukd5u+lfEMXrpnctWCCbWByh4f4HWhF/B6t7gABFFoUxzkDXb6lTEYOVL/I/4hicH3aJ/vtu9J6KmDL9pGBTKfrGFHC9Dli1uLv4XWcBD8vNRbQ2virEN49Aut/F9TxFq2nA97Xd3RWBxl2XAqgXONsup7FmAPKUQMYiR9iU6ZKbUOiBSU+xpqOpswhQNsFXQRr84B2V/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+rrMQktpbPXZx6ZsQl6xEtGV6KthsUz8O8idwIPgNk=;
 b=5B28b8P+TyPndcimu6s/ob5uD+d6D7L5i9fOYgcdFBszQjPzIHEG7iX4A3ozh1lmhdT9m4/Ee+FHSDwcDkf8ZhQmZ47CYVxlORaHudeN2EjXDKzdVLdWxeMhQfhfrlL+rz2ZzNmXy1a3itQDyR53gLGrwQcXploGPIpN6+nJMV0=
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by BN7PPF862C85B20.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Tue, 29 Apr
 2025 06:36:57 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 06:36:56 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: "Khatri, Sunil" <Sunil.Khatri@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>
Subject: RE: [PATCH v2] drm/sched: fix the warning in drm_sched_job_done
Thread-Topic: [PATCH v2] drm/sched: fix the warning in drm_sched_job_done
Thread-Index: AQHbr4Ls3jXu3P7ra0KQS5BSPMc+sbO6QxxQ
Date: Tue, 29 Apr 2025 06:36:56 +0000
Message-ID: <BL1PR12MB57534AEE3F7D3352F68B2A4493802@BL1PR12MB5753.namprd12.prod.outlook.com>
References: <20250417102430.2828552-1-sunil.khatri@amd.com>
In-Reply-To: <20250417102430.2828552-1-sunil.khatri@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=95d0605d-287a-41a5-a626-f5f3e2a3ef4e;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-29T06:36:41Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5753:EE_|BN7PPF862C85B20:EE_
x-ms-office365-filtering-correlation-id: 0aebfa60-1e0f-4167-d03f-08dd86e83cae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?l3o2o+1MeVaaMknKNLWmFpHSA+EfVy3ZJJ8DVO73lYcY1j8P1hu/5bd+yP6R?=
 =?us-ascii?Q?uJFvBiMGJBT4j5iWMJy8XWeIx9VpNWMSCVP77LcmLMeal2gkbpsDisoiKYo3?=
 =?us-ascii?Q?MmKz0QLKN7wQqR7XA/BKoQa75HrOLbI3H569nZ8I5EgVx4irjBANEjrSnaO7?=
 =?us-ascii?Q?khEizAeoEZrSKpiW6CcBJ4D06/vV6TIurA8X9UNrBrUfr6I7bQcbCwLkRrAX?=
 =?us-ascii?Q?sOPcJIGJOyhzTvX/8qEeRUjjRhgFtCBniq/qyen+uOnXJjAnp+or+ZoIwMzg?=
 =?us-ascii?Q?wGhPfTGKdZTypnBOQQGZfLZ/HvQ8RVVACJKcnDCP6aeXPtXXUOsJZ1Idny9u?=
 =?us-ascii?Q?8oSMkKJHBnIqqu7eucHypvAMVLUtwzl08iZ+FmsVBRZz9cSew9XucsSaek9k?=
 =?us-ascii?Q?vkkLBaKfY6tQAsUMYzQLR19g6yjupERcXkRqKqhyM1fYf52lIdTd2V16bcx9?=
 =?us-ascii?Q?Ob3QqieIfk3aycL4txj9P/gyDsoGHshOVydChm9oC4mDU7Laapbk3sR4BI6Z?=
 =?us-ascii?Q?QjLlzUY5TXu0c2kyEA1Oua0aYGy/P7wcDTLPmpDJAGge0KwdLxAeVlGORMuh?=
 =?us-ascii?Q?NVLf+vpmz3zk8bMfc7ZEKxBdePqGAS2RfeyLfKRoE9O99Z9kzZLXTiEG/9RU?=
 =?us-ascii?Q?AZtJVO1ajr+O9kX+jnvNqSiLFB5Rl4spjGqpQYyn+fHIkFbUvfQM45mi68zI?=
 =?us-ascii?Q?PPhuAWYTGkavq7aBmN4Owg4qj5i6NxxEAIeDkQoEwoorpTRL221VlrP+ZGl4?=
 =?us-ascii?Q?1Y6+vBuhDuDKwzwlCJ5YBDuDkFqtoHdZff80A3/o9ODiHEG+i6zdr8diC04O?=
 =?us-ascii?Q?G6NPiOSfb0vFX8tPebL9SSHrCM9huJrpIb65DEYAgKbyEvzZAPCpYIT0CVih?=
 =?us-ascii?Q?7b3gg5IqClCLKC6LPa5F4vNBXGF+YL0wqt6DzefGni+eaG6/Qf0w6RP+16+e?=
 =?us-ascii?Q?6NYeuKGi8w9yLqkn/WrWH88jBexXp6e6emIHyjjirfsAkzBiiS2cldI60/fh?=
 =?us-ascii?Q?w2FngMtiDHF/+/w52fWtXthDCRzViVggVIygVBZCKqRjJOoZ2zvy3x3HfCzG?=
 =?us-ascii?Q?i3zY49VO5Byzybe5szR8eFgmTNAZwPzf6WpeEpXRup9GoVYnW7RTb1OH+6cU?=
 =?us-ascii?Q?cpIKXG/ACMTpr8REMmVBuUrdVPB7l3B1qAYrikoDvyUhfx+akpwpk04egYRg?=
 =?us-ascii?Q?SDiXt+4lfJYEMZBKhHHFbcOI99Jcvg753RrVPrflFzmNBKimPBqu1wfRNEj/?=
 =?us-ascii?Q?/M0bpIAbAbC5tUB7J7ByqezZexFuX/fL3lccGmDQnEfSt0UUX7AJqFI/vCVO?=
 =?us-ascii?Q?hxSTQfwHPEcz7AKT0uFOeanR2TbJxZNf5eDFOlZzFyE2JerNlmxfIp+mKKva?=
 =?us-ascii?Q?Eg0T8T0cjHMVPLTiYe+izr9eE1y+zXYn4aZr92NtTacUDDfQ1UP+6NkEX8Xu?=
 =?us-ascii?Q?xjk39luP4N81Mrv0TiuRbrGKr/E2v+6TbRx6msz5ca6UoDY6OyxgMg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CtepMS7F8vW17gFuAhwPCP4VDJJLtG1BKnEPl5/Q1WqgVBz1EXDKZn8lZK5/?=
 =?us-ascii?Q?jkApEp/97x/dZsyXO8O9SFP8PrRlKX+XHiShnGpA34vy4Kv1pikteZSuwA85?=
 =?us-ascii?Q?TyzuQGy/AxoJoueU35LyDbDyXyDJlkmKI8I+2mPMOWyuqYgRmso+zRAqh4EI?=
 =?us-ascii?Q?K+9/oRoi/v0arudvUYDWDWNmzSNpmJqktnAdquKxjsTKWT0hjlVDEQJgYhP6?=
 =?us-ascii?Q?PBPDS0EIc/nc4gZYr1tWtNI/yvsZn286DRAqA1bytILbyj11o/FKit2N+WWa?=
 =?us-ascii?Q?itLVpIrc0EnbBW+CtBzEqkAkoDJHKbQLz//bJN5S6QWp7rPC5OTKlF0d3Wg9?=
 =?us-ascii?Q?2dylFiv17UlzF1f8qLaDQyYjKPkDVbCp+24SClu7FRqSkdBrCuXP+gLhoeIt?=
 =?us-ascii?Q?iowPka6La1hRMWVxRrlCUe1j63fslvkhAf0BzOyunb3q91sbsriKKqE8oEIv?=
 =?us-ascii?Q?KAoWmc/BogS4yrDhvdnf3BHVUIbE7yjC1hwR+rGVmJShBXXDWAiuUfVllFeK?=
 =?us-ascii?Q?mciJQSyygXpaxAL0QfPs8QQGcyIAl7v5hZLGbeT9qCHQnAnnYRe+Nr1+oHuh?=
 =?us-ascii?Q?9T0WxF1EFsp2bOrPhWebFLgVLr8CPOb7psLJW9DOHSxsLlgJjdFW1wVKnf2E?=
 =?us-ascii?Q?D0P7HN0EqocxGE9nCTsimzrmPaaHKb0HtkLlx7e0yT7NDXjM9LjV/bPf3WOd?=
 =?us-ascii?Q?TJnJtkiGHytIRJhuIYK+fOY165GaafZldmjxFnDNT+StYbXMQNpRIS6NodaU?=
 =?us-ascii?Q?MghRsHxuwpFDY16nEv009DxTBINyn5RGQJeECpa6sV7S8P5waPAqHZ0G82Ik?=
 =?us-ascii?Q?GL1mmJbDcpkCFKXyOasCkLF/wWZKsprE4jh7LAfFjjyi4GyjPXMokxL3PF6w?=
 =?us-ascii?Q?35E3DbLzTRugGI8cw9Jajo3p2XHZZXHHYWkjQ2bFDQDrVuiw9wOpWNq269ql?=
 =?us-ascii?Q?xlvY/RoYzlUg64v3+PWqygFFuZ8IwmritgGRrMTvPoHmyYnFy9aN/ejhFDre?=
 =?us-ascii?Q?ADDryeg4BOUx1Df/w8RfnAchXngwjrxyY8QLkf0Or6GRXN77UUyupM6AbZ3M?=
 =?us-ascii?Q?HdSHm3durvxP+mJWRwPUunknOjWUFaRnU/gesKC7Sh0+Nysi78uFeX8LiwbC?=
 =?us-ascii?Q?qVtDOvLlYeX4HGex8sFLGdS6+P8EjZb2V9pti9/EEI3nlFBQYUknhhD2Lpb0?=
 =?us-ascii?Q?Syn2tl8rR6KZLdRTOXV4U4SHvLM8rwdey41fB3RLU+pSBKUEijzikKXmWabj?=
 =?us-ascii?Q?vfk+bte+NCpv1gd3bxMTegEfkl/ZcKYoF/3viHrYtZuHKPVEUUtZbsbBNxbZ?=
 =?us-ascii?Q?hOC4aj8RPqxSMI+sHGo3J16zpEaj2r2oTocJr6dCtjEDpbO+MWq+kRZxVpQN?=
 =?us-ascii?Q?R3DL2ZuoRcrG4tr9pGfJQNXRlv6FGNOYiTGm0GojyKC7dB6IyzWWM0n4KRXu?=
 =?us-ascii?Q?ekjWY/xAPoM+CXPR2c/CWMKRjgFKrWpx58n2Hd9qDlHq5oKiRQiysEWXCt2z?=
 =?us-ascii?Q?SLmxLgjIhZnsmYzCJ5kfOZXyUfiestn5AcVeb6u363mB2IhHLIsWjxrEOXgV?=
 =?us-ascii?Q?XD594MJEecAZI1mWxc8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aebfa60-1e0f-4167-d03f-08dd86e83cae
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 06:36:56.4883 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kldFPFhjbF38xE2rE0S0Fa3OUU6o/jW1MeuEeQv5AHfUkFTgFWmO2TZhjdl0yoeMZKGQAIa39+yrAgYld+xILA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF862C85B20
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

[AMD Official Use Only - AMD Internal Distribution Only]

Ping ?

-----Original Message-----
From: Sunil Khatri <sunil.khatri@amd.com>
Sent: Thursday, April 17, 2025 3:55 PM
To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Chri=
stian.Koenig@amd.com>; Tvrtko Ursulin <tvrtko.ursulin@igalia.com>; Pelloux-=
Prayer, Pierre-Eric <Pierre-eric.Pelloux-prayer@amd.com>; Khatri, Sunil <Su=
nil.Khatri@amd.com>
Subject: [PATCH v2] drm/sched: fix the warning in drm_sched_job_done

Fix the below warning.
scheduler/sched_main.c:397: warning: Function parameter or struct member 'r=
esult' not described in 'drm_sched_job_done'

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sched=
uler/sched_main.c
index bfea608a7106..5cd29e92b133 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -390,6 +390,7 @@ static void drm_sched_run_free_queue(struct drm_gpu_sch=
eduler *sched)
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
+ * @result: error code for dma fence for scheduler
  *
  * Finish the job's fence and wake up the worker thread.
  */
--
2.34.1

