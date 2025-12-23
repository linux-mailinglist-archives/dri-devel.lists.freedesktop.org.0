Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BF1CD84A7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 07:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E4710E193;
	Tue, 23 Dec 2025 06:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bv3RLplh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013065.outbound.protection.outlook.com
 [40.93.196.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B367C10E0AB;
 Tue, 23 Dec 2025 06:48:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqTABOuODNdGIaj0B7udVJdU2MtyypqnWfwWD4RSIR1bi4O/x17HpsX3K6ex5X2+M0qmEfq+I1TO0XngCMO1NCLII9XGPEgTUMUCixrZxbww8U1ri7bzKl2AbiVEVAfyx9z3sUwjYTfGH9E5uAQepZ6PMSwjuqTuRy1IaggDYMc7+HYyxRByyfVlCFdUyX9aNuZS3CK7yaICXBA1ZNfGgRqWZpE74d6Y0/PViqkSkXExFRWN95Jk4wj4oAFgCGp1kvClkXhcI+WvmiuN9O71+SRKs3V82o2CvzfAdrPwPP9gCxqhQ0tcnD6v5kv1ZFn18ajzM778MquKWZw7mdyiYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJ43nppj2VbK//0D/+c1a1ENqkcV5eiFdxkxGjUE6F0=;
 b=j8BMzRM15N1yEy8VxyTlqoFjSxwRN7pVTDznhIWJRhZXCtKfudVA2/WLinn3E60E4cgCsQ6BDMBn8TyJtvCBSR4FHl0G0vOGpL2ljoqBmU0R+UMMRuT6GqFkZqThCU5dV2BI4P8lpYCK4bYQhhD8pVGziRISMIZ8QZqslB9CPzTlHbaKj2cvEtWUPmnM6kkSgEDd6ygdOV7S7yko//MmEZnpR6v10BI4B/MbuBVmAKcANMUiRvq5jMY8mGSumSRaw0/Wj6crqic3rxuieO9/EDy4e1cheXjfYtHwH1MnDENOwVMgB4OBlTBvTNOFdaWxRD0CCl6+9YGT4qYyC4ZOoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJ43nppj2VbK//0D/+c1a1ENqkcV5eiFdxkxGjUE6F0=;
 b=bv3RLplhxmfLxE/7RcY/PpUavdB8HxLlsxTAk7ze00Kjynh+gGygqd5bcm+x6IOiO2BmjsIiluCD3Lpb2k6jPaeuNNt3M/pTGw+m2VX63czxlt0Lfa0kcZQFSVyQKmQHr9YkToS1artzbKC0eR9ZtpYpGfp5NESSyeyDkVH8s5k=
Received: from CO6PR12MB5411.namprd12.prod.outlook.com (2603:10b6:5:356::5) by
 MW6PR12MB8734.namprd12.prod.outlook.com (2603:10b6:303:249::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 06:48:19 +0000
Received: from CO6PR12MB5411.namprd12.prod.outlook.com
 ([fe80::286:570b:1fe:3c85]) by CO6PR12MB5411.namprd12.prod.outlook.com
 ([fe80::286:570b:1fe:3c85%4]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 06:48:18 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Guo, Bingxi" <Bingxi.Guo@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: RE: [PATCH] drm/amdgpu: Support fork process
Thread-Topic: [PATCH] drm/amdgpu: Support fork process
Thread-Index: AQHcczKDtEXX0OCmVU+0Me71cNgnVrUuycbA
Date: Tue, 23 Dec 2025 06:48:18 +0000
Message-ID: <CO6PR12MB5411CD3525B6FDA6C287764E8FB5A@CO6PR12MB5411.namprd12.prod.outlook.com>
References: <20251222110146.464367-1-Bingxi.Guo@amd.com>
In-Reply-To: <20251222110146.464367-1-Bingxi.Guo@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-12-23T06:48:03.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5411:EE_|MW6PR12MB8734:EE_
x-ms-office365-filtering-correlation-id: 1d7f00a6-9aab-4c42-54f3-08de41ef41a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?JnReVp9xBBa8cZkFxXn1wuWchbFbOQVJJX9U9sSHavsyyXKbg4CXAT28oCHP?=
 =?us-ascii?Q?bhv6fqFFZzv9dp2+YyD+2uDl9sJ5IXHEa9SuFYIZ/v/Pk75s/IhD9mnp7DyC?=
 =?us-ascii?Q?wjx691vod9yNlqxF30XhnjqGKa9S1fvJ2ZYsCnUViOk7UumfgbYTplt5tMDx?=
 =?us-ascii?Q?B1Ah1fVnIupv1Y492LfmuqGa9AIr5DHsSxglBM7PfcVkJbPBDhA2a650D364?=
 =?us-ascii?Q?06LxM2oS2l4SAAVbmXss3wjepL8P8tLh7di9fwJbIkTqjwBzE/UQluhis78f?=
 =?us-ascii?Q?tseo7D1ev7zgVQ4pIeLhtffsHHhn+j9UD5rKq7Tvh8VKrFtbR+flSwaQAE4K?=
 =?us-ascii?Q?7WPwjYtxK9F0UCCLF6mxhvoM8AxCkZlBANhsKXXdR+KPDTAGV0O5N5ByiWnz?=
 =?us-ascii?Q?VP9zPFWVttGxMzYSy2w26QoVoi+gwbUMTVyInhgwxRJojtaRgN4+oQvVC8pe?=
 =?us-ascii?Q?/JXNVMy1KRGmgZF9m4lJ6DC+YrWeHIcVUJw1c3PGFe4CvgvtGcofSsuvdnwJ?=
 =?us-ascii?Q?GDi9qT6z37w9wzs52+gngWg8O2WTUjOMNE41/GyfOtWxzqBQruObjxVmxCh3?=
 =?us-ascii?Q?37vEalQSLw/CyoEMrQp1uEQgk9wERrCS/SiXLpZ1XzoRnv++3U8tyhHVPh9F?=
 =?us-ascii?Q?MjE+XeHoTzDFjOQ1xjYUTnb0opZ7IZfP7yOWJEl03cMJ7aAqG+5RbNWHUu6J?=
 =?us-ascii?Q?trkaJsHyEdtajs2+HfMccgWUE8AeM8e3zsBiZ63AaqrNegjlbXusktlxA24O?=
 =?us-ascii?Q?w8ZiiSLs9G572cXSyMKQ82vwGGIT+KSk/YJmvh9LCV5iEJpMYRGRbGx5sUfd?=
 =?us-ascii?Q?Ihg6icoQMiLaBrIpUaM0Cli5bGgXeyqYDIWPYzxN830GMa8US7ZGY/RCWvtw?=
 =?us-ascii?Q?bgBzYSUshpbi7UOpilitljmJnF8UQUmrcJ3IPE1cooXp6t/5Q2FgomLH9j/B?=
 =?us-ascii?Q?N+wQAjqUmrtZg8j+PuXzT/efPl7bXZPoqq3jANvt2+7IsopJXqG6yCerLW9p?=
 =?us-ascii?Q?TRjq8UNyo7sewK6FUD760mk1aHsc/hejI/oZYIPgOgzcRlSXVZ2RaxRx5Bhx?=
 =?us-ascii?Q?kI+smfInKaiY+fiYEPGkpU4SCDqpwNeUHyXWMnH6IketxK61bv9CBZ+Mq2kU?=
 =?us-ascii?Q?otkrwWkxlaTrRHY27eUSlMhVh7B+3df9Dbpq86KwXB15NLGlndE6kF2t4f3f?=
 =?us-ascii?Q?vgw+Zy9KH4uiKfFrL5RQoufEUsSvWuwOHWOGKWV3xKo6pdDRqwBo6ZIlmG0j?=
 =?us-ascii?Q?1jLf3Yxp8ikaCbdwTSbbEWccskRv4cLhoqHK33BiLk8de6tNjrM5gtw623xh?=
 =?us-ascii?Q?Fx0R+LkzGRkyEa8HsZPCt0U/D3cxIU/eQWMmISQnPw0nQe3FKOfpzYB6HX2g?=
 =?us-ascii?Q?X2HmGW6TvEiF4jIS0roebUn/L4E9zuJwEQvUdhgMbWj79t0jBsaFfc241b7F?=
 =?us-ascii?Q?P26Hrfnpy5r2Mg1174m7aGTr5z8zf1g2/FLXsrbCVe8/N85Uh5mv9930Tr7S?=
 =?us-ascii?Q?497BkOfu4zc0VgP+Xzs82OFfG24WoIRBuSlg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5411.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?waOX1dvCdZ7Y7sRBxPp7+mdfTdXYrIF3+pRKoKnJ5/nmz5LhKdv34VqlLZDo?=
 =?us-ascii?Q?rmtjxvCNRjlutF589tneFjAMdtOUgvKcrwQCg8YkOn/9dQ5dhuyGb4H/C6nI?=
 =?us-ascii?Q?M4OtzTIkbxB5++irFRv2hZHx2zzAcvvwau93szqM0Obl5PwT8C/A/PRZHPSa?=
 =?us-ascii?Q?c/IZUZmrxnTaT8aCjJmYTl8mH4H/R0UEaPzdXSK3tzf8q3TgX4r5LSNW2mRa?=
 =?us-ascii?Q?EJnJPX5+JhtBHrWCD0FEZW5uQqMWWcVtLQvDw4NOpu+wXYvrtyxq+bYnhO3S?=
 =?us-ascii?Q?U9s080qEW0yxClcl3mFIEgxB923njhKXNxB0e3g6UhuzhsgDeQvN5IUYPQQs?=
 =?us-ascii?Q?Og/Fyhp8fDM1S1pO3toEFxZHwEzL5beJJx53P/Q1IVg/HPL2v12hR4+G+Pbt?=
 =?us-ascii?Q?TiYBISIzk7dztk56L2EJI+y+lY7uHwX8+WxyvGf2NcBYSkEmRT1yXVwFsqI5?=
 =?us-ascii?Q?GGHMVI/fcCkWHfbY/y1Ce2MwcLsg7z+BYOy8qpnIF4WnMjQ3qu5v3RaIDalf?=
 =?us-ascii?Q?J4cW4Blu087ismzjy48qbcnL5DBqQ6vn1Kb4BVlEgcoySDEerJ+S6NEDWWXa?=
 =?us-ascii?Q?/nMbqqkSD5juy0bBc66PzTqhXcha7SSpRcc5XKRsogsuvjGmVIiXic5/4yBi?=
 =?us-ascii?Q?Sq+XZab24z69POTKI2pCS5yR19pgp8xitsNW8dI+4ln0XHXq1F5OtiDQZBWY?=
 =?us-ascii?Q?ZCF8AdFkWvq3xyZ8vW8t4wYFhVIMM1JVuHR6p5eTD3Am4iiWctRuVcXdmLA/?=
 =?us-ascii?Q?sfIORPPtoWx3gVyjKpZgWyJ9Zweac1Da4xvIOqlHaRN1v6jK682XohdIBL7s?=
 =?us-ascii?Q?E071C7672Sg2mMjEbS+OUldvQkaePvio1KHtYfY6OidEE3LORBTOXBMfvc31?=
 =?us-ascii?Q?PN7SvfHlPy02bbgJ1D9GcWwaIYYvxFJgHC4BAoyEgQwp3AUto7VwWxZwkknG?=
 =?us-ascii?Q?1MEOUhx9cacfmxLqgHP/uRI5KRjDy46jBrFaJDVfyTuQWrg0qj3exfUjA7CG?=
 =?us-ascii?Q?B8CVrFkRfMxhd2k3D6Qw9eaEDkhKFnNUuiP2T9hD9uIqDRcAbfi/9fYSZjD1?=
 =?us-ascii?Q?W5tg/Nxrx2dWk80hBQWf8rSdQNpl3QQOLZXaKKh8kyJe0qDjnx7xf1AYTVPp?=
 =?us-ascii?Q?VHh7SbvPqFu9H1ZQqdN+/rZZfn4T6MoYiNXbKBGWFEQJp7CSLNrNHdJdT9bo?=
 =?us-ascii?Q?Bi9SZ42fD9Z8ppFPRES6lsC0xFG/K5bNNN4fTkS3C/NGEjDrw+JDKdd6lgMp?=
 =?us-ascii?Q?dFaZvLJ7beL5JCXr1pbSv0cSJmqyeUXgJcZdSlPT+naFYrXk981kSyhBt2Ag?=
 =?us-ascii?Q?lX3uklEDlBgw4D1FA8nT1w/3cN47Ag92rKQRnZHC+KtxDAiM7EJ/NWuY35NY?=
 =?us-ascii?Q?5S2E/sJzU8EH8FAla1hRRxekHZNXIm2BssaJSaB8Nj1XhKDE8aa7udSjGJZd?=
 =?us-ascii?Q?iJjUeDgSz09Hu6qZ+g4RLr2Es4/qxp5525nFxS51vBtmmnenPIBzB9prDCLH?=
 =?us-ascii?Q?f52Snv3eohJQrlCLeQjlXDlL4/D3pN1F6fZTklrGnPvOS8bTeIQZRh8yCXqN?=
 =?us-ascii?Q?37ixYlvp5b1T3/fUMrfjqX+oEx/47w+YyhuYUY2aMIgz5Neojqq7Z0BITr4d?=
 =?us-ascii?Q?9mo0v85xvRmWgZ5AJ6/9jXd9Pjz5djs0nxDlMsPJ08b3llkzaJtIDaaAXwUN?=
 =?us-ascii?Q?5rIwBgD2FN5bhyQoRrxgx9DaiI//clLMHtTa75o/spOvvVRd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5411.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7f00a6-9aab-4c42-54f3-08de41ef41a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2025 06:48:18.6844 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x74vByk1l/TG+OQhL1FVsMTtiZgd+3wu6UPfxtmV60ydQ71o0heqAUk4Wv9/XTDB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8734
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

Add dri-devel@lists.freedesktop.org.

Emily Deng
Best Wishes



>-----Original Message-----
>From: Guo, Bingxi <Bingxi.Guo@amd.com>
>Sent: Monday, December 22, 2025 7:02 PM
>To: amd-gfx@lists.freedesktop.org
>Cc: Koenig, Christian <Christian.Koenig@amd.com>; Deng, Emily
><Emily.Deng@amd.com>; Guo, Bingxi <Bingxi.Guo@amd.com>
>Subject: [PATCH] drm/amdgpu: Support fork process
>
>When a process forks, the child inherits the open DRM file descriptor.
>If the parent is killed (e.g., by SIGKILL), only the parent's jobs are can=
celed. The child
>process can continue submitting jobs to the same entity through its own us=
er entry in
>the entity's user list.
>
>Signed-off-by: Emily Deng <Emily.Deng@amd.com>
>Signed-off-by: Bingxi Guo <Bingxi.Guo@amd.com>
>---
> drivers/gpu/drm/scheduler/sched_entity.c | 133 +++++++++++++++++++----
> include/drm/gpu_scheduler.h              |  22 ++++
> 2 files changed, 135 insertions(+), 20 deletions(-)
>
>diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>b/drivers/gpu/drm/scheduler/sched_entity.c
>index 8867b95ab089..508a0629b839 100644
>--- a/drivers/gpu/drm/scheduler/sched_entity.c
>+++ b/drivers/gpu/drm/scheduler/sched_entity.c
>@@ -110,6 +110,9 @@ int drm_sched_entity_init(struct drm_sched_entity *ent=
ity,
>       atomic_set(&entity->fence_seq, 0);
>       entity->fence_context =3D dma_fence_context_alloc(2);
>
>+      INIT_LIST_HEAD(&entity->users);
>+      spin_lock_init(&entity->users_lock);
>+
>       return 0;
> }
> EXPORT_SYMBOL(drm_sched_entity_init);
>@@ -228,10 +231,24 @@ static void drm_sched_entity_kill(struct drm_sched_e=
ntity
>*entity)  {
>       struct drm_sched_job *job;
>       struct dma_fence *prev;
>+      struct drm_sched_entity_user *user;
>+      struct spsc_queue temp_queue;
>+      pid_t my_tgid =3D task_tgid_nr(current);
>
>       if (!entity->rq)
>               return;
>
>+      /* Mark current process as exited */
>+      spin_lock(&entity->users_lock);
>+      list_for_each_entry(user, &entity->users, list) {
>+              if (user->tgid =3D=3D my_tgid) {
>+                      atomic_set(&user->exited, 1);
>+                      break;
>+              }
>+      }
>+      spin_unlock(&entity->users_lock);
>+
>+      /* Temporarily stop entity to prevent new jobs */
>       spin_lock(&entity->lock);
>       entity->stopped =3D true;
>       drm_sched_rq_remove_entity(entity->rq, entity); @@ -240,27 +257,59 =
@@
>static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>       /* Make sure this entity is not used by the scheduler at the moment=
 */
>       wait_for_completion(&entity->entity_idle);
>
>-      /* The entity is guaranteed to not be used by the scheduler */
>+      /*
>+       * The entity is stopped and idle. No new jobs can be pushed.
>+       * Scan the queue and separate jobs:
>+       * - Jobs from this process: kill immediately
>+       * - Jobs from other processes: keep in temp_queue
>+       */
>+      spsc_queue_init(&temp_queue);
>       prev =3D rcu_dereference_check(entity->last_scheduled, true);
>       dma_fence_get(prev);
>+
>       while ((job =3D drm_sched_entity_queue_pop(entity))) {
>-              struct drm_sched_fence *s_fence =3D job->s_fence;
>-
>-              dma_fence_get(&s_fence->finished);
>-              if (!prev ||
>-                  dma_fence_add_callback(prev, &job->finish_cb,
>-                                         drm_sched_entity_kill_jobs_cb)) =
{
>-                      /*
>-                       * Adding callback above failed.
>-                       * dma_fence_put() checks for NULL.
>-                       */
>-                      dma_fence_put(prev);
>-                      drm_sched_entity_kill_jobs_cb(NULL, &job->finish_cb=
);
>+              if (job->owner_tgid =3D=3D my_tgid) {
>+                      /* Kill this job */
>+                      struct drm_sched_fence *s_fence =3D job->s_fence;
>+
>+                      dma_fence_get(&s_fence->finished);
>+                      if (!prev ||
>+                          dma_fence_add_callback(prev, &job->finish_cb,
>+                                                 drm_sched_entity_kill_jo=
bs_cb)) {
>+                              dma_fence_put(prev);
>+                              drm_sched_entity_kill_jobs_cb(NULL, &job->f=
inish_cb);
>+                      }
>+                      prev =3D &s_fence->finished;
>+              } else {
>+                      /* Keep jobs from other processes */
>+                      spsc_queue_push(&temp_queue, &job->queue_node);
>               }
>+      }
>
>-              prev =3D &s_fence->finished;
>+      /* Put back jobs from other processes */
>+      while (true) {
>+              struct spsc_node *node =3D spsc_queue_pop(&temp_queue);
>+              if (!node)
>+                      break;
>+              spsc_queue_push(&entity->job_queue, node);
>       }
>+
>       dma_fence_put(prev);
>+
>+      /* Check if there are other active users and restore entity if need=
ed */
>+      spin_lock(&entity->users_lock);
>+      list_for_each_entry(user, &entity->users, list) {
>+              if (!atomic_read(&user->exited)) {
>+                      /* Found active user, restore entity */
>+                      spin_unlock(&entity->users_lock);
>+                      spin_lock(&entity->lock);
>+                      entity->stopped =3D false;
>+                      drm_sched_rq_add_entity(entity->rq, entity);
>+                      spin_unlock(&entity->lock);
>+                      return;
>+              }
>+      }
>+      spin_unlock(&entity->users_lock);
> }
>
> /**
>@@ -323,6 +372,8 @@ EXPORT_SYMBOL(drm_sched_entity_flush);
>  */
> void drm_sched_entity_fini(struct drm_sched_entity *entity)  {
>+      struct drm_sched_entity_user *user, *tmp;
>+
>       /*
>        * If consumption of existing IBs wasn't completed. Forcefully remo=
ve
>        * them here. Also makes sure that the scheduler won't touch this e=
ntity @@ -
>338,6 +389,14 @@ void drm_sched_entity_fini(struct drm_sched_entity *entit=
y)
>
>       dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
>       RCU_INIT_POINTER(entity->last_scheduled, NULL);
>+
>+      /* Clean up user list */
>+      spin_lock(&entity->users_lock);
>+      list_for_each_entry_safe(user, tmp, &entity->users, list) {
>+              list_del_rcu(&user->list);
>+              kfree_rcu(user, rcu);
>+      }
>+      spin_unlock(&entity->users_lock);
> }
> EXPORT_SYMBOL(drm_sched_entity_fini);
>
>@@ -567,9 +626,40 @@ void drm_sched_entity_select_rq(struct drm_sched_enti=
ty
>*entity)  void drm_sched_entity_push_job(struct drm_sched_job *sched_job) =
 {
>       struct drm_sched_entity *entity =3D sched_job->entity;
>+      struct drm_sched_entity_user *user, *found =3D NULL;
>+      pid_t my_tgid =3D task_tgid_nr(current);
>       bool first;
>       ktime_t submit_ts;
>
>+      /* Check if entity is stopped and reject directly */
>+      if (entity->stopped)
>+              goto error;
>+
>+      /* Entity is running, check user list */
>+      spin_lock(&entity->users_lock);
>+      list_for_each_entry(user, &entity->users, list) {
>+              if (user->tgid =3D=3D my_tgid) {
>+                      found =3D user;
>+                      /* Reject if this user has exited */
>+                      if (atomic_read(&user->exited)) {
>+                              spin_unlock(&entity->users_lock);
>+                              goto error;
>+                      }
>+                      break;
>+              }
>+      }
>+
>+      /* If not found, create new user (fork case) */
>+      if (!found) {
>+              found =3D kzalloc(sizeof(*found), GFP_ATOMIC);
>+              if (found) {
>+                      found->tgid =3D my_tgid;
>+                      atomic_set(&found->exited, 0);
>+                      list_add_tail(&found->list, &entity->users);
>+              }
>+      }
>+      spin_unlock(&entity->users_lock);
>+
>       trace_drm_sched_job_queue(sched_job, entity);
>
>       if (trace_drm_sched_job_add_dep_enabled()) { @@ -582,6 +672,9 @@ vo=
id
>drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>       atomic_inc(entity->rq->sched->score);
>       WRITE_ONCE(entity->last_user, current->group_leader);
>
>+      /* Record owner TGID */
>+      sched_job->owner_tgid =3D my_tgid;
>+
>       /*
>        * After the sched_job is pushed into the entity queue, it may be
>        * completed and freed up at any time. We can no longer access it.
>@@ -597,12 +690,6 @@ void drm_sched_entity_push_job(struct drm_sched_job
>*sched_job)
>
>               /* Add the entity to the run queue */
>               spin_lock(&entity->lock);
>-              if (entity->stopped) {
>-                      spin_unlock(&entity->lock);
>-
>-                      DRM_ERROR("Trying to push to a killed entity\n");
>-                      return;
>-              }
>
>               rq =3D entity->rq;
>               sched =3D rq->sched;
>@@ -618,5 +705,11 @@ void drm_sched_entity_push_job(struct drm_sched_job
>*sched_job)
>
>               drm_sched_wakeup(sched);
>       }
>+      return;
>+
>+error:
>+      dma_fence_set_error(&sched_job->s_fence->finished, -EPERM);
>+      drm_sched_fence_scheduled(sched_job->s_fence, NULL);
>+      drm_sched_fence_finished(sched_job->s_fence, -EPERM);
> }
> EXPORT_SYMBOL(drm_sched_entity_push_job);
>diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h ind=
ex
>e62a7214e052..45e066596405 100644
>--- a/include/drm/gpu_scheduler.h
>+++ b/include/drm/gpu_scheduler.h
>@@ -59,6 +59,16 @@ struct drm_sched_rq;
>
> struct drm_file;
>
>+/**
>+ * struct drm_sched_entity_user - Per-process entity user tracking  */
>+struct drm_sched_entity_user {
>+      struct list_head                list;
>+      struct rcu_head                 rcu;
>+      pid_t                           tgid;
>+      atomic_t                        exited;
>+};
>+
> /* These are often used as an (initial) index
>  * to an array, and as such should start at 0.
>  */
>@@ -233,6 +243,13 @@ struct drm_sched_entity {
>        */
>       struct rb_node                  rb_tree_node;
>
>+      /**
>+       * @users:
>+       *
>+       * List of processes using this entity (for fork support)
>+       */
>+      struct list_head                users;
>+      spinlock_t                      users_lock;
> };
>
> /**
>@@ -385,6 +402,11 @@ struct drm_sched_job {
>        * drm_sched_job_add_implicit_dependencies().
>        */
>       struct xarray                   dependencies;
>+
>+      /**
>+       * @owner_tgid: TGID of the process that submitted this job
>+       */
>+      pid_t                           owner_tgid;
> };
>
> /**
>--
>2.43.0

