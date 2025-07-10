Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCFCAFFC6E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 10:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D046010E1B6;
	Thu, 10 Jul 2025 08:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BGlyfg7d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF8C10E1B6;
 Thu, 10 Jul 2025 08:33:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpySXG8mgjbYnXiXwh/d0FlSNmWJcds1tWkcNdlmQuKcMeG3XB2mjhcONM2OiY+mW0IEZRrb832gpgGboEWe+ClYOChRaybrHlQT1mP+zGU5yo6BvVFTgyQriPiW6UUuq5ktJt4bGgqposobQs5wTTIFFsJZgWJruVR2DDPqYrWBIRbDdpD30iGtHWRbSsH8fGviFr7Skdchoevb3bCca2SpaUboK5bALu1QIFGWs6cQd33PO+tY76bIy3n/EcYf+ndFeTVdkEnLkogDw2chujdlcbg30HzlxHp1d6B/4iWXk2sqJC3qWsk7UKp0jWKH8wYC1JMh65T+wvK25183fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T77fI+VIHjBmLb0tYdW5bbElGJIqbzz6Uu+P9ZgO4CE=;
 b=tNlxrmFt7deS9LwEJFmsdFzUHEesvQA8nizY4/un2lV0HDlxKhKSqIyBotLc3dX08V7ygKgGiljDtXnTqRcm+5VonAOW8TzUKw3L51NTQxVa9eIBgbAdxe2L3+LXe13qBqbvf5rfVrQoDhnfyLO/vGAMukw4Q76HjIWhnlaztAPPS36aXA8oNJsJvnzK3kr7UIGsitqrVKEyI9TKg23RMcxT1hfJx/bAXowG7OJ4OLNWwD7uH3gaE2lw4uQE944aj9ToVVXJdTdZIzYu6yIrc/b56IclWY2NQBn0YZhtJXOfGap4AVC5MlS7takJAhADmNbE9QKWuiG7IojLv/Ki4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T77fI+VIHjBmLb0tYdW5bbElGJIqbzz6Uu+P9ZgO4CE=;
 b=BGlyfg7dyloxixoyVej5qUBXmzPeeCyhsUItaBLcnG3E+r2kA3XbXEjzXvzWyw/8uuvR5MwxNLQZ3E7ZOUx/QNKENFtwx7U8pCLBL/o3GBUsVYRdSwVXVkoEDOq8P7HhFXp/Vd5yllaHvsQMq4R2alRD2UD7C4fgaWmS52KvvUI=
Received: from PH0PR12MB5497.namprd12.prod.outlook.com (2603:10b6:510:eb::22)
 by LV3PR12MB9166.namprd12.prod.outlook.com (2603:10b6:408:19c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 08:33:52 +0000
Received: from PH0PR12MB5497.namprd12.prod.outlook.com
 ([fe80::662f:f49f:2ba1:ca55]) by PH0PR12MB5497.namprd12.prod.outlook.com
 ([fe80::662f:f49f:2ba1:ca55%3]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 08:33:52 +0000
From: "cao, lin" <lin.cao@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "Yin, ZhenGuo (Chris)" <ZhenGuo.Yin@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH] drm/scheduler: Fix sched hang when killing app with
 dependent jobs
Thread-Topic: [PATCH] drm/scheduler: Fix sched hang when killing app with
 dependent jobs
Thread-Index: AQHb8WT/TEOjDtsrIE6wBUgpkofBMrQq/IEAgAAKnr8=
Date: Thu, 10 Jul 2025 08:33:52 +0000
Message-ID: <PH0PR12MB5497DBF0FD0A626EF5004800F548A@PH0PR12MB5497.namprd12.prod.outlook.com>
References: <20250710063633.498633-1-lincao12@amd.com>
 <4ebbdcf1-6123-4076-920d-bf6bcd292fac@amd.com>
In-Reply-To: <4ebbdcf1-6123-4076-920d-bf6bcd292fac@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-10T08:33:51.6790000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5497:EE_|LV3PR12MB9166:EE_
x-ms-office365-filtering-correlation-id: 1e5541cd-dc6c-4617-501f-08ddbf8c800c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?E8WYPX5YQ9XNoVCg6pjV2uLag3hZpU6cW9hyl7JmzvguP5J29nYplLwPkl?=
 =?iso-8859-1?Q?x/fQiuNkv7O60HMesZrGUSHYhkWkdlIRfLf9PVgynnxaT+FnC/FXR6t4t4?=
 =?iso-8859-1?Q?uEmNPoev+5JkUW/OjOi37L0sRIWyJXI79p72BonXgiX1eKAq+6J10H3qd6?=
 =?iso-8859-1?Q?HlYubTiYRYi7eIGcdkqB0+JEPRv+izg01BTqQFD5hSuYZLr/PcbmVW8ji9?=
 =?iso-8859-1?Q?0PWqCf7p1+D7Co8QtwmW8/cBiWNVhYO+eQpDbAe0HZZYpWhQReTSw1GeDT?=
 =?iso-8859-1?Q?eDAzo1qi98uTfYZ3b6weGaJR48vMwGvs7P9aEZNpKuXMW4oCFARE/GAQB/?=
 =?iso-8859-1?Q?RSYHRnmhafkRtdpeqSh1f0kcza11JQAWiZnO102NPa6Jeqy+mAlO2bkVLX?=
 =?iso-8859-1?Q?jUyJKhar7VHCMhj35BGC34uzCgMecCsyE75fgX23MJroTAk+2t1SzL6AgY?=
 =?iso-8859-1?Q?vWVAXtW82w4Ew7tShmoyq4QhmZ9POx2f8Qa9TmAZ80xFfGAXNIT2SeCdVI?=
 =?iso-8859-1?Q?iNmpVf+zim+KnYJKDHoBWiV1JSeHxDpfvab8KinE+ktjLOPYr+xGzIZgfT?=
 =?iso-8859-1?Q?IHebSGeQHZowtYgcBv8T0Z10NLUPuLI69T6CQzihLtmZtNqGZX539D03g4?=
 =?iso-8859-1?Q?8YjJBE4UVshTe46D9CwHLihQYuudw3EjktCRlNgx5PedANbli52cc0LHO1?=
 =?iso-8859-1?Q?JEnupLg5RzfWgN+8nmfHfbJiGVFK/WsJoeDHhnX/BY9hHARvokuuBdx3q+?=
 =?iso-8859-1?Q?4L1OYC1QKPu3v90JaCjzsfiduDyaXy0z5tMUX2Sy9Ry1MlKfful0cUKkp6?=
 =?iso-8859-1?Q?fYrd9VGZo06thfQXG+mt9J296YB2q/zNjK3z1o2NAuXxRp/nEAJU3nY6Pf?=
 =?iso-8859-1?Q?xxolLFPaVWslVaoIybvn/2r6OwN4v9nnNQeJ0tDuq04Len6DfWE/UE6kKO?=
 =?iso-8859-1?Q?UKQkHBewNWJVrKlbz0jmIfO058nZt+fgFhI5z9ZVmCr8l6EIc0ZeX0cCs7?=
 =?iso-8859-1?Q?R9dT9ZPYWBrgIV25N0B6ADwoaRLYteNVc3Q5e+PmMUowE5GUPP+E8IL37D?=
 =?iso-8859-1?Q?n3p3f8tGDFYspbeTuek7cMx5DfNFz2FaeCxnzEiCk1Qbu5qP+seBwsdcHT?=
 =?iso-8859-1?Q?SH9wZV7AM5ZsFZHp1uE0uGDFQb7HMQ0jJGl9amIc3S6DWt2Bhi+1Yz8OhR?=
 =?iso-8859-1?Q?swfasGJ+blpYoyRkv+RtNXvNHw1vIasmf2zUykEVwuR5/8O5kfR+OrIKmQ?=
 =?iso-8859-1?Q?HhuxiBFt6hn/gPEioaeLMip5MRa/WlzHlUULcjkU+Buap96BarTeNbJhdt?=
 =?iso-8859-1?Q?U3FCPgZVmbIZfVqlvNKW8DnJPyiH05vJfGjttqtpKExWtioVGfLq0pEWIS?=
 =?iso-8859-1?Q?CoRkxtKAZFTvpDsZkeN0H0UTOOOTB17OcGv3JcznxNefIB4dRYV1xZXW1C?=
 =?iso-8859-1?Q?3347XFUoXA1FgdCslyi7/A1aAZqS/1lT/gZNmHUOYecajaCSw1HgiNekcV?=
 =?iso-8859-1?Q?yNH3ak1QWWM5EmG4yTFQhXVebIlCVwGtHZ8139pi2NeQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5497.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(8096899003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ugj7XgVGqr6Sep7UUWsUBsrL+Sf92VV+sK9Y2k95XHeZS+iGZXMvVQIQOu?=
 =?iso-8859-1?Q?/pAj5bbD3KdssxLhvYkZ907SVB9tpnWHGy+L3nRB83wcF40Co6XUVDAqmY?=
 =?iso-8859-1?Q?EGEpgpenHXKfCC0nXrrxXvf24qHylLUbR2NTXUxsBve1Lx10T4Mx7vuvXr?=
 =?iso-8859-1?Q?DX4jgMXBNmM3b/Mlcvltysh7twcZ6qRZSAq4KdX8LxtMoHe+Ur9fKNspt2?=
 =?iso-8859-1?Q?gaQp6S0lfp27FOrBP6VE91xAoKV2dG7NovNOa4bN2p7qqlwCAwXYzR45tC?=
 =?iso-8859-1?Q?PAbejWtg2q+Cw3mL38Xa6dOvU7DF7y9PIdC/xYpNpTnyWBfUcCc+N0/BIi?=
 =?iso-8859-1?Q?vACyd1IAoqxFvyaxUQXXBttjgpRlMysHeaBL9TCG/0hNK8RP4Co1r6yXy7?=
 =?iso-8859-1?Q?09AIcIkU3NBAOf4ROEBFS7wbuj+4RltUsHYNZ2MrDXERTWZySENvwu4zWl?=
 =?iso-8859-1?Q?FnLw3ekS+Ehm9F7HPxtBIuZVEgBZPKVd3Hj65bpyrvyJvEzgLSo2y4pF1G?=
 =?iso-8859-1?Q?304rm/Uq3XMdk9a4MrA+DrW3xryTtl7f0nkyOcptjpNNcDyKU1ZPXezUAk?=
 =?iso-8859-1?Q?ucFZ4xjqCESkgkpEqAt1EerhChcilJ2Ph4lWVY9ifuhwOA3gwrfzZHKbiF?=
 =?iso-8859-1?Q?6JUaOiIoFviKR/u3gTyZntFZ8BiEROZ5oOAp7HqN/UPdKUgnpMB2yYQYO5?=
 =?iso-8859-1?Q?m3OJM13b0mf0R7iVuwdRQXWbyPRicXBSxFj0I/sZE0X/P7qzfmNCBSlcES?=
 =?iso-8859-1?Q?0N5AThk8TLNZNvXoy/Zlq4yxX7WvM7xgxnLwhrHCcEjjlYndU6ObUQn4xK?=
 =?iso-8859-1?Q?YVOCCL1KYJsULmZN1PP3BEnSo0li5iBslR8WFbahpuiYusx2hKx8nM+pv7?=
 =?iso-8859-1?Q?9RBjITkfKxq1C2EotbBvU2VmCS3xLFn5GKtj/4YaMOC+Fr0sMGsdqQ9voR?=
 =?iso-8859-1?Q?JDF/2Cu/p6iRJY9AuqWSQmwQv4apt/5NcRVuZNkWucMiqltLHjfP3FZ8tY?=
 =?iso-8859-1?Q?qC2A4O4aqTjbRTSvC99IayZMK8/UBcwdRB7Eqr0hVwfKPq5HVnqIZ1fWb5?=
 =?iso-8859-1?Q?gKlyhj3C/9hTsJqPtiZE9TAaByXm5S0yu8lTUssXWOxvb6ofOg1TAwuPMW?=
 =?iso-8859-1?Q?PGxauQ5/E34z/1s/+WAy0w/hw8y2tD5pFb6Ov1w7wMiWIhcpqHPExPWbQG?=
 =?iso-8859-1?Q?W8YqNsQPkoK04lCCgdwEuiWTJtd5J/jVDqX4p4dp7/PB3+RiUTQBAKCxcc?=
 =?iso-8859-1?Q?f45v7cRK7eT8iZZ1WE1Y6QGj4M8jHZJk6+dB0dRQk5ji8htmMSKK3EsctU?=
 =?iso-8859-1?Q?1+f3S6ioptClSdeSDfXf8NpjfXUQS78sS3wX2T7UQbJcsxEyGZX+lQ3Icr?=
 =?iso-8859-1?Q?KO/rjW4AIbZxP0wggyIxijeyCQPOr5JCj1mzqde1F6JsP5H38Y8A7Gvr2y?=
 =?iso-8859-1?Q?3yTZsJ674p8km/jUOm1/MrdB307iXTKkJS1FQRZsEGJ5YU4CWATBhWPnVc?=
 =?iso-8859-1?Q?nzK0Mpe2Ags9nlmuB644u/32oUKqgnrGrvJZrtpiXY87Csu2s0TbJ2BWvY?=
 =?iso-8859-1?Q?GGCHrTQH2MeyBcWn4G5bklTUzGUHHbM1m9EQ2VKHVc5qIgyZDNQA8+ZWeB?=
 =?iso-8859-1?Q?DYnf+u7VX4y8A=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PH0PR12MB5497DBF0FD0A626EF5004800F548APH0PR12MB5497namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5497.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5541cd-dc6c-4617-501f-08ddbf8c800c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 08:33:52.0733 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 70mYsp5xApz+Lhcy1xDsOjoZpPVxGZFpBC1qOFLRnW3Xin93HniY0YIBdSWCYxDWdNcmqG9Vg4Itsr563AaD7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9166
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

--_000_PH0PR12MB5497DBF0FD0A626EF5004800F548APH0PR12MB5497namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Christian,

Thanks for your suggestion, I modified the patch as:

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/sch=
eduler/sched_entity.c
index e671aa241720..66f2a43c58fd 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -177,6 +177,7 @@ static void drm_sched_entity_kill_jobs_work(struct work=
_struct *wrk)
    struct drm_sched_job *job =3D container_of(wrk, typeof(*job), work);

    drm_sched_fence_scheduled(job->s_fence, NULL);
+   drm_sched_wakeup(job->sched);
    drm_sched_fence_finished(job->s_fence, -ESRCH);
    WARN_ON(job->s_fence->parent);
    job->sched->ops->free_job(job);
--

Thanks,
Lin

________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Thursday, July 10, 2025 15:52
To: cao, lin <lin.cao@amd.com>; dri-devel@lists.freedesktop.org <dri-devel@=
lists.freedesktop.org>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freede=
sktop.org>
Cc: Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily <Emily.Deng@amd=
.com>; Matthew Brost <matthew.brost@intel.com>; Danilo Krummrich <dakr@kern=
el.org>; Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH] drm/scheduler: Fix sched hang when killing app with de=
pendent jobs

First of all you need to CC the scheduler maintainers, try to use the get_m=
aintainer.pl script. Adding them on CC.

On 10.07.25 08:36, Lin.Cao wrote:
> When Application A submits jobs (a1, a2, a3) and application B submits
> job b1 with a dependency on a2's scheduler fence, killing application A
> before run_job(a1) causes drm_sched_entity_kill_jobs_work() to force
> signal all jobs sequentially. However, due to missing work_run_job or
> work_free_job in entity_kill_job_work(), the scheduler enters sleep
> state, causing application B hang.

Ah! Because of optimizing the dependency when submitting to the same schedu=
ler in drm_sched_entity_add_dependency_cb().

Yeah that suddenly starts to make sense.

> Add drm_sched_wakeup() when entity_kill_job_work() to preventing
> scheduler sleep and subsequent application hangs.
>
> Signed-off-by: Lin.Cao <lincao12@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index e671aa241720..a22b0f65558a 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -180,6 +180,7 @@ static void drm_sched_entity_kill_jobs_work(struct wo=
rk_struct *wrk)
>        drm_sched_fence_finished(job->s_fence, -ESRCH);
>        WARN_ON(job->s_fence->parent);
>        job->sched->ops->free_job(job);
> +     drm_sched_wakeup(job->sched);

That should probably be after drm_sched_fence_scheduled().

Alternatively we could also drop the optimization in drm_sched_entity_add_d=
ependency_cb(), scheduling the work item again has only minimal overhead.

Apart from that looks good to me.

Regards,
Christian.

>  }
>
>  /* Signal the scheduler finished fence when the entity in question is ki=
lled. */


--_000_PH0PR12MB5497DBF0FD0A626EF5004800F548APH0PR12MB5497namp_
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
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi Christian,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks for your suggestion, I modified the patch as:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/sch=
eduler/sched_entity.c</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
index e671aa241720..66f2a43c58fd 100644</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
--- a/drivers/gpu/drm/scheduler/sched_entity.c</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
+++ b/drivers/gpu/drm/scheduler/sched_entity.c</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
@@ -177,6 +177,7 @@ static void drm_sched_entity_kill_jobs_work(struct work=
_struct *wrk)</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; struct drm_sched_job *job =3D container_of(wrk, typeof(*job),=
 work);</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; drm_sched_fence_scheduled(job-&gt;s_fence, NULL);</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
+ &nbsp; drm_sched_wakeup(job-&gt;sched);</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; drm_sched_fence_finished(job-&gt;s_fence, -ESRCH);</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; WARN_ON(job-&gt;s_fence-&gt;parent);</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; job-&gt;sched-&gt;ops-&gt;free_job(job);</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
--</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Lin</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Koenig, Christian &lt;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b>&nbsp;Thursday, July 10, 2025 15:52<br>
<b>To:</b>&nbsp;cao, lin &lt;lin.cao@amd.com&gt;; dri-devel@lists.freedeskt=
op.org &lt;dri-devel@lists.freedesktop.org&gt;; amd-gfx@lists.freedesktop.o=
rg &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b>&nbsp;Yin, ZhenGuo (Chris) &lt;ZhenGuo.Yin@amd.com&gt;; Deng, Emi=
ly &lt;Emily.Deng@amd.com&gt;; Matthew Brost &lt;matthew.brost@intel.com&gt=
;; Danilo Krummrich &lt;dakr@kernel.org&gt;; Philipp Stanner &lt;phasta@ker=
nel.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH] drm/scheduler: Fix sched hang when killing=
 app with dependent jobs
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">First of all you need to CC the scheduler m=
aintainers, try to use the get_maintainer.pl script. Adding them on CC.<br>
<br>
On 10.07.25 08:36, Lin.Cao wrote:<br>
&gt; When Application A submits jobs (a1, a2, a3) and application B submits=
<br>
&gt; job b1 with a dependency on a2's scheduler fence, killing application =
A<br>
&gt; before run_job(a1) causes drm_sched_entity_kill_jobs_work() to force<b=
r>
&gt; signal all jobs sequentially. However, due to missing work_run_job or<=
br>
&gt; work_free_job in entity_kill_job_work(), the scheduler enters sleep<br=
>
&gt; state, causing application B hang.<br>
<br>
Ah! Because of optimizing the dependency when submitting to the same schedu=
ler in drm_sched_entity_add_dependency_cb().<br>
<br>
Yeah that suddenly starts to make sense.<br>
<br>
&gt; Add drm_sched_wakeup() when entity_kill_job_work() to preventing<br>
&gt; scheduler sleep and subsequent application hangs.<br>
&gt;<br>
&gt; Signed-off-by: Lin.Cao &lt;lincao12@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/scheduler/sched_entity.c | 1 +<br>
&gt;&nbsp; 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/dr=
m/scheduler/sched_entity.c<br>
&gt; index e671aa241720..a22b0f65558a 100644<br>
&gt; --- a/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt; +++ b/drivers/gpu/drm/scheduler/sched_entity.c<br>
&gt; @@ -180,6 +180,7 @@ static void drm_sched_entity_kill_jobs_work(struct=
 work_struct *wrk)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_sched_fence_finished(job=
-&gt;s_fence, -ESRCH);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WARN_ON(job-&gt;s_fence-&gt;=
parent);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; job-&gt;sched-&gt;ops-&gt;fr=
ee_job(job);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_sched_wakeup(job-&gt;sched);<br>
<br>
That should probably be after drm_sched_fence_scheduled().<br>
<br>
Alternatively we could also drop the optimization in drm_sched_entity_add_d=
ependency_cb(), scheduling the work item again has only minimal overhead.<b=
r>
<br>
Apart from that looks good to me.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt;&nbsp; /* Signal the scheduler finished fence when the entity in questi=
on is killed. */<br>
<br>
</div>
</div>
</body>
</html>

--_000_PH0PR12MB5497DBF0FD0A626EF5004800F548APH0PR12MB5497namp_--
