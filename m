Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F616CC5E6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 17:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E67F10E937;
	Tue, 28 Mar 2023 15:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060.outbound.protection.outlook.com [40.107.100.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071CF10E489;
 Tue, 28 Mar 2023 15:19:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZVXZxou6Guq8yIkCeAMHNMk8w0RkQRO21utMxc9b+w/b0DxGGx09bwr4fufAyNZEbbQXxGXodBMtbZD3wD2hXvLyG5oWaEtcNJV3BvjBfkcLk6T5EkIuQPm1+wSNYkm8LQI0pMid+4HYr0S93Wst1Jgn42zA4Pb8JMp8XnUdb7NHQJW0kV91Qc7bAs/TDVtVA+FfWIaVtTinEovHcKGW7HvUPBDYCQ+5W8v4bL0OzpfYyCo4o7lCHKs7qiVacZUkNiqx7Axl4t0vIizLj6jrPxw3BOLTVFIz+hQFHrTSXvtPLXlEEufTLCirAxYx0+LyefKkNxL/7/ySpCPvxG+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31Is/xkzSWt9bsidanizsoAwyxvfjqzZUQTS2vZXzg4=;
 b=drYhxM9muNG5dpnhSDVNgh9Zv67fKmKBHADtlkFexXz9u03pHsNWiMN5bQLXrdYnuy1sNdCVPF77vt6pjQi7tvZ628AXV9JmbAbfiHRQS26XpkmaEC67VGMywro7xum7OnopY+7eob67jdwq8xLJAsfQBjrsl2hrv1PByQ9hRnnmdQWAi66PIi7HTRbWJ5XPXH9I5mm+2URAtAy/IcbgBjeEuRpdWRcNpsGFzXUPtC4mvnGOSEvmvf/5E1FWcCEVT/LDnxGR7zkA3T3w1QBJIHClfMTyCMTAjD9TSbVARlRNMZRRosbUZoEwVY7VKbj04glp7oQSDYCqo9RAB/ovPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31Is/xkzSWt9bsidanizsoAwyxvfjqzZUQTS2vZXzg4=;
 b=WWotVE7MtuZxzBAFPNqAXY17Kzjn3L5Oqg/QsYhVVpHyMI8HSz//6/ryO/9hp6Nt9BAqGJPqgvDtNzWTwAEx1jfp25m6z0oQwvhtHCpXi+2VYGUeXu0Jrn1o6PITIv7iGAokqg0by5jGp1jijDlxPWoQtlWjwJMa+wQdV1hBoY8=
Received: from DM5PR12MB1308.namprd12.prod.outlook.com (2603:10b6:3:76::7) by
 PH0PR12MB7487.namprd12.prod.outlook.com (2603:10b6:510:1e9::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.33; Tue, 28 Mar 2023 15:19:20 +0000
Received: from DM5PR12MB1308.namprd12.prod.outlook.com
 ([fe80::b607:1647:7734:a98d]) by DM5PR12MB1308.namprd12.prod.outlook.com
 ([fe80::b607:1647:7734:a98d%6]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 15:19:20 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 12/34] drm/amdgpu: add configurable grace period for unmap
 queues
Thread-Topic: [PATCH 12/34] drm/amdgpu: add configurable grace period for
 unmap queues
Thread-Index: AQHZYNwsmHaE2g2+5Uy3Uhzu+OdpTK8QTwQQ
Date: Tue, 28 Mar 2023 15:19:20 +0000
Message-ID: <DM5PR12MB13086F42DA34557B6497CA9285889@DM5PR12MB1308.namprd12.prod.outlook.com>
References: <20230327184339.125016-1-jonathan.kim@amd.com>
 <20230327184339.125016-12-jonathan.kim@amd.com>
In-Reply-To: <20230327184339.125016-12-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-03-28T15:19:19Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=a13bf9ff-e1a6-45e1-8885-cd98221f8f6d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR12MB1308:EE_|PH0PR12MB7487:EE_
x-ms-office365-filtering-correlation-id: e887750a-fd11-4036-3cef-08db2f9fce03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ppiyu6DF7Xfcl2DwbDXnEkHVJnbmpZK8gMT9T89zSy3tl9bpsxc3uj0Ys2ruUOarhIY6PxJ05YjrLyBxUMjhhHuBoOA6B2dqOq+aY1ZpxAnlvk8Z2JMpSpqGspJLiTC13gGOHARA8ts5J/YX5dTeiMv/kQpqA4WZiVJn1sZaJgpWuiUxt0AOMirICIK/c/eyPEgKLz4eBsCUSCiVj7egD3lClhQLJzTcR/8BMyqS+KkptMRoolYwUBVk7hPtNdg2VcPL5fcQIY5BiTd3Itj7p+XQqXGtAPqBmhzBxJJNpdFobu310QmBaAUGUOK4h8Sf43mACBMv4yUziyRGzB/I65nJdWNnK2BjgrHHLcbiDRoxu5lr06CY2fQ+nDemTEKZrVWxdg1k50DpBJ3HMkUtQ57X8b5S9cOQHEmbjSwDeAnLkTHWsWcBAIMPBs17wgIoAEFZc+c7siBBpgN01HVWotwv5HNq4PPIXhSJJznuHBv4yIxYWI8qBT9ZNEK7dc/TrjkO8bgsih/ynPiaj2Tt0bZl2QtLDRZcpYp45Qf4BydGqQa25MQxRHMWtL7A13SmAddmcRKy+wIxgFdvBIVXChpvXXyEPLQIMdmA44/WHJ/N7l3Pr/D9IzfSdvj5d9V4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1308.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199021)(41300700001)(450100002)(64756008)(66446008)(66476007)(8676002)(66556008)(66946007)(4326008)(76116006)(186003)(2906002)(5660300002)(83380400001)(30864003)(38100700002)(38070700005)(86362001)(33656002)(122000001)(55016003)(52536014)(8936002)(478600001)(54906003)(7696005)(71200400001)(316002)(9686003)(66899021)(53546011)(26005)(6506007)(110136005)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EbnBwWobC4k/FhJgjU6ZewOY9nS0ZcFUzVqn2Onzo4KeSPLlEbc5sWr7k9/U?=
 =?us-ascii?Q?13/hmSsXZdqW4DXvTXfcNoHFfwf6dpOjTxjWRSmyfTp4N8oAeZ7rrMme1isV?=
 =?us-ascii?Q?L2Hhq1RUKUbVuzQ1q0xcEw7WajtSXd1bsaU1pTaMKoanbq3k7nBdddEI1RMD?=
 =?us-ascii?Q?AS0ZdW+6IN+3Zq0EKDRSzQsC0Ebha46R72D9S5LAQpsxqaBXpw9OvoT2jX0V?=
 =?us-ascii?Q?VKgGGi4MxzG73yfkuXcjQsdDssTSywhUQYgUtLPMF0i8LMrH5yY8y6/aDj3Z?=
 =?us-ascii?Q?0RMIGwSyP6cGWq5ps2gMglR7jTyz8cOvG7f//sbbOSu6cgb6KvqVBfe8Kwi+?=
 =?us-ascii?Q?wEGRgxjOJ4GtFpCgDFponrMFVuH77NL63DYDT2+5rCmaoK/S1Z7KNSrwAYj1?=
 =?us-ascii?Q?IoilGEd+iKfKoIYwGnt2Te3Zb5P+b5JD6thxrO4XmN4UNl9nUV9bG9f0gjrf?=
 =?us-ascii?Q?mqZPAxrdTc1AaMWsl3BHF/gZ8INe68WYpi5ZGAwzKNFm6w7k1rJoL2HEc6CV?=
 =?us-ascii?Q?X1FRIxIBLnaQef+VwBdWifCkT4QwMmLHndjWAFECILeSPM7STR9YJR5EsvIz?=
 =?us-ascii?Q?cFUcp9F9zSkunNjcFzKj9lsRen9TyL0/XRRegecX8PfKJnfzv2yuh55Thnm9?=
 =?us-ascii?Q?1WQBWhpJjXThhfWssjLTxNSigZiiSNElztF6xQJn2hVTFbz80liNAu8N/tu0?=
 =?us-ascii?Q?R/S+SUKiGs6uX066eyDlnoINZSwvkH7S8d7is0EogJ38HDMfr6O6Kl+qe/Wg?=
 =?us-ascii?Q?TH3uQKMBwleroETUDRu3M26ACtkET5kw4umhc9lFGOrb/wyalTm4oyUkN6La?=
 =?us-ascii?Q?N662ZXuTv5ZOV4mKZlCb7N5CPr3f/gQUTwnJdpQ4S1TMOqrjhB1xt7XZFRL5?=
 =?us-ascii?Q?ckgj3B6mGWMpP960/vFF5kj911lctmXGDEiIBPT2gQ+aifM/5UBGcfT+2sQk?=
 =?us-ascii?Q?X969lBmaJ3EgTQu8XkGszlwEmV+txI+ELKPrplWN/GwERWHr1VFK8Rz260sx?=
 =?us-ascii?Q?m06xYgi6+dkJ3VInjwIieWS6YIHY2JAhXxGpB4qMQQ1kMcQHhQv+hHPM8NUw?=
 =?us-ascii?Q?UejeBa7ZI+5rY/K81WIKrdSSIc4J7lTK/qfGedWjh28jWpYKLlle5PALvGqc?=
 =?us-ascii?Q?VeEJ5OhNgHGb38BNXx5hul2yMRLezzWjJP/+153Laf0fAEyB95HmTk3lAEvd?=
 =?us-ascii?Q?tVs31WvbHoILQnZEftGF70CakOB86mcghLTolUsqxHUY4B/DbGaIOzAKIOnL?=
 =?us-ascii?Q?9Nqh+QLCj9GgB0uRMR8Ltru1b0vL4c5H8FZ4WIcdI3Cp1y7ZkCqEgX4B+Xf1?=
 =?us-ascii?Q?sdWMUxG5zI/Kq46hvmJgI8wOFgGBUIYLsoHJ276+A/i+5G/TF8CefrVFhgzR?=
 =?us-ascii?Q?gzs1dbiGVdaTs+WIdAIWsKc90pPAlVzY8wC5gK+khh0rWxM3ATKBzbZd0nEi?=
 =?us-ascii?Q?G+H5H5RrAZMba0abLeyNa/mWTf2BPnAoJxsqWZjvfHrnXLi/AOb62gzJ6bnu?=
 =?us-ascii?Q?nOIS5G20W7KaKlube4ApjQMxMZRgrO5hLScls7QqR2Vmf3tJHLSmLKWrRm4Y?=
 =?us-ascii?Q?rAelLcXNyTRu2Aw6758=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1308.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e887750a-fd11-4036-3cef-08db2f9fce03
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 15:19:20.5319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 18YkPnnIPc/B0jZ2zudypoTscJs339vd5IgZuOUlDgPQ2EixWqRo1kAlodvrd1m7aIhGtVGdK6vSCRMW5GGl2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7487
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Kim,
 Jonathan" <Jonathan.Kim@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

3 tiny grammar/spelling things inline (not critical)

 Kent

> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Jonathan Kim
> Sent: Monday, March 27, 2023 2:43 PM
> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Kuehling, Felix <Felix.Kuehling@amd.com>; Kim, Jonathan
> <Jonathan.Kim@amd.com>
> Subject: [PATCH 12/34] drm/amdgpu: add configurable grace period for unma=
p
> queues
>=20
> The HWS schedule allows a grace period for wave completion prior to
> preemption for better performance by avoiding CWSR on waves that can
> potentially complete quickly. The debugger, on the other hand, will
> want to inspect wave status immediately after it actively triggers
> preemption (a suspend function to be provided).
>=20
> To minimize latency between preemption and debugger wave inspection, allo=
w
> immediate preemption by setting the grace period to 0.
>=20
> Note that setting the preepmtion grace period to 0 will result in an
> infinite grace period being set due to a CP FW bug so set it to 1 for now=
.
>=20
> v2: clarify purpose in the description of this patch
>=20
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
> ---
>  .../drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c  |  2 +
>  .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  2 +
>  .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    | 43 ++++++++++++
>  .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h    |  6 ++
>  .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c  |  2 +
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 43 ++++++++++++
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |  9 ++-
>  .../drm/amd/amdkfd/kfd_device_queue_manager.c | 62 +++++++++++++-----
>  .../drm/amd/amdkfd/kfd_device_queue_manager.h |  2 +
>  .../gpu/drm/amd/amdkfd/kfd_packet_manager.c   | 32 +++++++++
>  .../drm/amd/amdkfd/kfd_packet_manager_v9.c    | 39 +++++++++++
>  .../gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h   | 65 +++++++++++++++++++
>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  5 ++
>  13 files changed, 291 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> index a6f98141c29c..b811a0985050 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c
> @@ -82,5 +82,7 @@ const struct kfd2kgd_calls aldebaran_kfd2kgd =3D {
>  	.get_cu_occupancy =3D kgd_gfx_v9_get_cu_occupancy,
>  	.enable_debug_trap =3D kgd_aldebaran_enable_debug_trap,
>  	.disable_debug_trap =3D kgd_aldebaran_disable_debug_trap,
> +	.get_iq_wait_times =3D kgd_gfx_v9_get_iq_wait_times,
> +	.build_grace_period_packet_info =3D
> kgd_gfx_v9_build_grace_period_packet_info,
>  	.program_trap_handler_settings =3D
> kgd_gfx_v9_program_trap_handler_settings,
>  };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index d2918e5c0dea..a62bd0068515 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> @@ -410,6 +410,8 @@ const struct kfd2kgd_calls arcturus_kfd2kgd =3D {
>=20
> 	kgd_gfx_v9_set_vm_context_page_table_base,
>  	.enable_debug_trap =3D kgd_arcturus_enable_debug_trap,
>  	.disable_debug_trap =3D kgd_arcturus_disable_debug_trap,
> +	.get_iq_wait_times =3D kgd_gfx_v9_get_iq_wait_times,
> +	.build_grace_period_packet_info =3D
> kgd_gfx_v9_build_grace_period_packet_info,
>  	.get_cu_occupancy =3D kgd_gfx_v9_get_cu_occupancy,
>  	.program_trap_handler_settings =3D
> kgd_gfx_v9_program_trap_handler_settings
>  };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> index 969015281510..605387e55d33 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
> @@ -802,6 +802,47 @@ uint32_t kgd_gfx_v10_disable_debug_trap(struct
> amdgpu_device *adev,
>  	return 0;
>  }
>=20
> +/* kgd_gfx_v10_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2
> values
> + * The values read are:
> + *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloa=
ds.
> + *     atomic_offload_wait_time -- Wait Count for L2 and GDS Atomics
> Offloads.
> + *     wrm_offload_wait_time    -- Wait Count for WAIT_REG_MEM Offloads.
> + *     gws_wait_time            -- Wait Count for Global Wave Syncs.
> + *     que_sleep_wait_time      -- Wait Count for Dequeue Retry.
> + *     sch_wave_wait_time       -- Wait Count for Scheduling Wave Messag=
e.
> + *     sem_rearm_wait_time      -- Wait Count for Semaphore re-arm.
> + *     deq_retry_wait_time      -- Wait Count for Global Wave Syncs.
> + */
> +void kgd_gfx_v10_get_iq_wait_times(struct amdgpu_device *adev,
> +					uint32_t *wait_times)
> +
> +{
> +	*wait_times =3D RREG32(SOC15_REG_OFFSET(GC, 0,
> mmCP_IQ_WAIT_TIME2));
> +}
> +
> +void kgd_gfx_v10_build_grace_period_packet_info(struct amdgpu_device
> *adev,
> +						uint32_t wait_times,
> +						uint32_t grace_period,
> +						uint32_t *reg_offset,
> +						uint32_t *reg_data)
> +{
> +	*reg_data =3D wait_times;
> +
> +	/*
> +	 * The CP cannont handle a 0 grace period input and will result in


cannont -> cannot

> +	 * an infinite grace period being set so set to 1 to prevent this.


Maybe throw in a comma after "being set" for clarity

> +	 */
> +	if (grace_period =3D=3D 0)
> +		grace_period =3D 1;
> +
> +	*reg_data =3D REG_SET_FIELD(*reg_data,
> +			CP_IQ_WAIT_TIME2,
> +			SCH_WAVE,
> +			grace_period);
> +
> +	*reg_offset =3D SOC15_REG_OFFSET(GC, 0, mmCP_IQ_WAIT_TIME2);
> +}
> +
>  static void program_trap_handler_settings(struct amdgpu_device *adev,
>  		uint32_t vmid, uint64_t tba_addr, uint64_t tma_addr)
>  {
> @@ -846,5 +887,7 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd =3D {
>  	.set_vm_context_page_table_base =3D
> set_vm_context_page_table_base,
>  	.enable_debug_trap =3D kgd_gfx_v10_enable_debug_trap,
>  	.disable_debug_trap =3D kgd_gfx_v10_disable_debug_trap,
> +	.get_iq_wait_times =3D kgd_gfx_v10_get_iq_wait_times,
> +	.build_grace_period_packet_info =3D
> kgd_gfx_v10_build_grace_period_packet_info,
>  	.program_trap_handler_settings =3D program_trap_handler_settings,
>  };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> index 370d6c312981..0abc1e805180 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h
> @@ -26,3 +26,9 @@ uint32_t kgd_gfx_v10_enable_debug_trap(struct
> amdgpu_device *adev,
>  uint32_t kgd_gfx_v10_disable_debug_trap(struct amdgpu_device *adev,
>  					bool keep_trap_enabled,
>  					uint32_t vmid);
> +void kgd_gfx_v10_get_iq_wait_times(struct amdgpu_device *adev, uint32_t
> *wait_times);
> +void kgd_gfx_v10_build_grace_period_packet_info(struct amdgpu_device
> *adev,
> +					       uint32_t wait_times,
> +					       uint32_t grace_period,
> +					       uint32_t *reg_offset,
> +					       uint32_t *reg_data);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> index 73e3b9ae1fb0..c57f2a6b6e23 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c
> @@ -670,6 +670,8 @@ const struct kfd2kgd_calls gfx_v10_3_kfd2kgd =3D {
>  	.get_atc_vmid_pasid_mapping_info =3D
> get_atc_vmid_pasid_mapping_info_v10_3,
>  	.set_vm_context_page_table_base =3D
> set_vm_context_page_table_base_v10_3,
>  	.program_trap_handler_settings =3D
> program_trap_handler_settings_v10_3,
> +	.get_iq_wait_times =3D kgd_gfx_v10_get_iq_wait_times,
> +	.build_grace_period_packet_info =3D
> kgd_gfx_v10_build_grace_period_packet_info,
>  	.enable_debug_trap =3D kgd_gfx_v10_enable_debug_trap,
>  	.disable_debug_trap =3D kgd_gfx_v10_disable_debug_trap
>  };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> index e0bd61e16847..f231903bfec3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> @@ -736,6 +736,24 @@ uint32_t kgd_gfx_v9_disable_debug_trap(struct
> amdgpu_device *adev,
>  	return 0;
>  }
>=20
> +/* kgd_gfx_v9_get_iq_wait_times: Returns the mmCP_IQ_WAIT_TIME1/2
> values
> + * The values read are:
> + *     ib_offload_wait_time     -- Wait Count for Indirect Buffer Offloa=
ds.
> + *     atomic_offload_wait_time -- Wait Count for L2 and GDS Atomics
> Offloads.
> + *     wrm_offload_wait_time    -- Wait Count for WAIT_REG_MEM Offloads.
> + *     gws_wait_time            -- Wait Count for Global Wave Syncs.
> + *     que_sleep_wait_time      -- Wait Count for Dequeue Retry.
> + *     sch_wave_wait_time       -- Wait Count for Scheduling Wave Messag=
e.
> + *     sem_rearm_wait_time      -- Wait Count for Semaphore re-arm.
> + *     deq_retry_wait_time      -- Wait Count for Global Wave Syncs.
> + */
> +void kgd_gfx_v9_get_iq_wait_times(struct amdgpu_device *adev,
> +					uint32_t *wait_times)
> +
> +{
> +	*wait_times =3D RREG32(SOC15_REG_OFFSET(GC, 0,
> mmCP_IQ_WAIT_TIME2));
> +}
> +
>  void kgd_gfx_v9_set_vm_context_page_table_base(struct amdgpu_device
> *adev,
>  			uint32_t vmid, uint64_t page_table_base)
>  {
> @@ -920,6 +938,29 @@ void kgd_gfx_v9_get_cu_occupancy(struct
> amdgpu_device *adev, int pasid,
>  				adev->gfx.cu_info.max_waves_per_simd;
>  }
>=20
> +void kgd_gfx_v9_build_grace_period_packet_info(struct amdgpu_device
> *adev,
> +		uint32_t wait_times,
> +		uint32_t grace_period,
> +		uint32_t *reg_offset,
> +		uint32_t *reg_data)
> +{
> +	*reg_data =3D wait_times;
> +
> +	/*
> +	 * The CP cannont handle a 0 grace period input and will result in
cannont again

 Kent
> +	 * an infinite grace period being set so set to 1 to prevent this.
> +	 */
> +	if (grace_period =3D=3D 0)
> +		grace_period =3D 1;
> +
> +	*reg_data =3D REG_SET_FIELD(*reg_data,
> +			CP_IQ_WAIT_TIME2,
> +			SCH_WAVE,
> +			grace_period);
> +
> +	*reg_offset =3D SOC15_REG_OFFSET(GC, 0, mmCP_IQ_WAIT_TIME2);
> +}
> +
>  void kgd_gfx_v9_program_trap_handler_settings(struct amdgpu_device *adev=
,
>                          uint32_t vmid, uint64_t tba_addr, uint64_t tma_a=
ddr)
>  {
> @@ -963,6 +1004,8 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd =3D {
>  	.set_vm_context_page_table_base =3D
> kgd_gfx_v9_set_vm_context_page_table_base,
>  	.enable_debug_trap =3D kgd_gfx_v9_enable_debug_trap,
>  	.disable_debug_trap =3D kgd_gfx_v9_disable_debug_trap,
> +	.get_iq_wait_times =3D kgd_gfx_v9_get_iq_wait_times,
> +	.build_grace_period_packet_info =3D
> kgd_gfx_v9_build_grace_period_packet_info,
>  	.get_cu_occupancy =3D kgd_gfx_v9_get_cu_occupancy,
>  	.program_trap_handler_settings =3D
> kgd_gfx_v9_program_trap_handler_settings,
>  };
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> index d39256162616..c0866497cb5c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
> @@ -20,8 +20,6 @@
>   * OTHER DEALINGS IN THE SOFTWARE.
>   */
>=20
> -
> -
>  void kgd_gfx_v9_program_sh_mem_settings(struct amdgpu_device *adev,
> uint32_t vmid,
>  		uint32_t sh_mem_config,
>  		uint32_t sh_mem_ape1_base, uint32_t sh_mem_ape1_limit,
> @@ -51,7 +49,6 @@ int kgd_gfx_v9_wave_control_execute(struct
> amdgpu_device *adev,
>  					uint32_t sq_cmd);
>  bool kgd_gfx_v9_get_atc_vmid_pasid_mapping_info(struct amdgpu_device
> *adev,
>  					uint8_t vmid, uint16_t *p_pasid);
> -
>  void kgd_gfx_v9_set_vm_context_page_table_base(struct amdgpu_device
> *adev,
>  			uint32_t vmid, uint64_t page_table_base);
>  void kgd_gfx_v9_get_cu_occupancy(struct amdgpu_device *adev, int pasid,
> @@ -67,3 +64,9 @@ uint32_t kgd_gfx_v9_enable_debug_trap(struct
> amdgpu_device *adev,
>  uint32_t kgd_gfx_v9_disable_debug_trap(struct amdgpu_device *adev,
>  					bool keep_trap_enabled,
>  					uint32_t vmid);
> +void kgd_gfx_v9_get_iq_wait_times(struct amdgpu_device *adev, uint32_t
> *wait_times);
> +void kgd_gfx_v9_build_grace_period_packet_info(struct amdgpu_device
> *adev,
> +					       uint32_t wait_times,
> +					       uint32_t grace_period,
> +					       uint32_t *reg_offset,
> +					       uint32_t *reg_data);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index bf3fe7db76f3..807cad60d21e 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -46,10 +46,13 @@ static int set_pasid_vmid_mapping(struct
> device_queue_manager *dqm,
>=20
>  static int execute_queues_cpsch(struct device_queue_manager *dqm,
>  				enum kfd_unmap_queues_filter filter,
> -				uint32_t filter_param);
> +				uint32_t filter_param,
> +				uint32_t grace_period);
>  static int unmap_queues_cpsch(struct device_queue_manager *dqm,
>  				enum kfd_unmap_queues_filter filter,
> -				uint32_t filter_param, bool reset);
> +				uint32_t filter_param,
> +				uint32_t grace_period,
> +				bool reset);
>=20
>  static int map_queues_cpsch(struct device_queue_manager *dqm);
>=20
> @@ -839,7 +842,7 @@ static int update_queue(struct device_queue_manager
> *dqm, struct queue *q,
>  	if (dqm->sched_policy !=3D KFD_SCHED_POLICY_NO_HWS) {
>  		if (!dqm->dev->shared_resources.enable_mes)
>  			retval =3D unmap_queues_cpsch(dqm,
> -
> KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0, false);
> +
> KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> USE_DEFAULT_GRACE_PERIOD, false);
>  		else if (prev_active)
>  			retval =3D remove_queue_mes(dqm, q, &pdd->qpd);
>=20
> @@ -1015,7 +1018,8 @@ static int evict_process_queues_cpsch(struct
> device_queue_manager *dqm,
>  		retval =3D execute_queues_cpsch(dqm,
>  					      qpd->is_debug ?
>=20
> KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES :
> -
> KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> +
> KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> +					      USE_DEFAULT_GRACE_PERIOD);
>=20
>  out:
>  	dqm_unlock(dqm);
> @@ -1155,8 +1159,7 @@ static int restore_process_queues_cpsch(struct
> device_queue_manager *dqm,
>  	}
>  	if (!dqm->dev->shared_resources.enable_mes)
>  		retval =3D execute_queues_cpsch(dqm,
> -
> KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> -
> +
> KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> USE_DEFAULT_GRACE_PERIOD);
>  	eviction_duration =3D get_jiffies_64() - pdd->last_evict_timestamp;
>  	atomic64_add(eviction_duration, &pdd->evict_duration_counter);
>  vm_not_acquired:
> @@ -1492,6 +1495,9 @@ static int initialize_cpsch(struct
> device_queue_manager *dqm)
>=20
>  	init_sdma_bitmaps(dqm);
>=20
> +	if (dqm->dev->kfd2kgd->get_iq_wait_times)
> +		dqm->dev->kfd2kgd->get_iq_wait_times(dqm->dev->adev,
> +					&dqm->wait_times);
>  	return 0;
>  }
>=20
> @@ -1531,7 +1537,7 @@ static int start_cpsch(struct device_queue_manager
> *dqm)
>  	dqm->is_resetting =3D false;
>  	dqm->sched_running =3D true;
>  	if (!dqm->dev->shared_resources.enable_mes)
> -		execute_queues_cpsch(dqm,
> KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> +		execute_queues_cpsch(dqm,
> KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> USE_DEFAULT_GRACE_PERIOD);
>  	dqm_unlock(dqm);
>=20
>  	return 0;
> @@ -1556,7 +1562,7 @@ static int stop_cpsch(struct device_queue_manager
> *dqm)
>=20
>  	if (!dqm->is_hws_hang) {
>  		if (!dqm->dev->shared_resources.enable_mes)
> -			unmap_queues_cpsch(dqm,
> KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0, false);
> +			unmap_queues_cpsch(dqm,
> KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0,
> USE_DEFAULT_GRACE_PERIOD, false);
>  		else
>  			remove_all_queues_mes(dqm);
>  	}
> @@ -1598,7 +1604,8 @@ static int create_kernel_queue_cpsch(struct
> device_queue_manager *dqm,
>  	list_add(&kq->list, &qpd->priv_queue_list);
>  	increment_queue_count(dqm, qpd, kq->queue);
>  	qpd->is_debug =3D true;
> -	execute_queues_cpsch(dqm,
> KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> +	execute_queues_cpsch(dqm,
> KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> +			USE_DEFAULT_GRACE_PERIOD);
>  	dqm_unlock(dqm);
>=20
>  	return 0;
> @@ -1612,7 +1619,8 @@ static void destroy_kernel_queue_cpsch(struct
> device_queue_manager *dqm,
>  	list_del(&kq->list);
>  	decrement_queue_count(dqm, qpd, kq->queue);
>  	qpd->is_debug =3D false;
> -	execute_queues_cpsch(dqm,
> KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0);
> +	execute_queues_cpsch(dqm,
> KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0,
> +			USE_DEFAULT_GRACE_PERIOD);
>  	/*
>  	 * Unconditionally decrement this counter, regardless of the queue's
>  	 * type.
> @@ -1689,7 +1697,7 @@ static int create_queue_cpsch(struct
> device_queue_manager *dqm, struct queue *q,
>=20
>  		if (!dqm->dev->shared_resources.enable_mes)
>  			retval =3D execute_queues_cpsch(dqm,
> -
> 	KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> +
> 	KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> USE_DEFAULT_GRACE_PERIOD);
>  		else
>  			retval =3D add_queue_mes(dqm, q, qpd);
>  		if (retval)
> @@ -1778,7 +1786,9 @@ static int map_queues_cpsch(struct
> device_queue_manager *dqm)
>  /* dqm->lock mutex has to be locked before calling this function */
>  static int unmap_queues_cpsch(struct device_queue_manager *dqm,
>  				enum kfd_unmap_queues_filter filter,
> -				uint32_t filter_param, bool reset)
> +				uint32_t filter_param,
> +				uint32_t grace_period,
> +				bool reset)
>  {
>  	int retval =3D 0;
>  	struct mqd_manager *mqd_mgr;
> @@ -1790,6 +1800,12 @@ static int unmap_queues_cpsch(struct
> device_queue_manager *dqm,
>  	if (!dqm->active_runlist)
>  		return retval;
>=20
> +	if (grace_period !=3D USE_DEFAULT_GRACE_PERIOD) {
> +		retval =3D pm_update_grace_period(&dqm->packet_mgr,
> grace_period);
> +		if (retval)
> +			return retval;
> +	}
> +
>  	retval =3D pm_send_unmap_queue(&dqm->packet_mgr, filter,
> filter_param, reset);
>  	if (retval)
>  		return retval;
> @@ -1822,6 +1838,13 @@ static int unmap_queues_cpsch(struct
> device_queue_manager *dqm,
>  		return -ETIME;
>  	}
>=20
> +	/* We need to reset the grace period value for this device */
> +	if (grace_period !=3D USE_DEFAULT_GRACE_PERIOD) {
> +		if (pm_update_grace_period(&dqm->packet_mgr,
> +					USE_DEFAULT_GRACE_PERIOD))
> +			pr_err("Failed to reset grace period\n");
> +	}
> +
>  	pm_release_ib(&dqm->packet_mgr);
>  	dqm->active_runlist =3D false;
>=20
> @@ -1837,7 +1860,7 @@ static int reset_queues_cpsch(struct
> device_queue_manager *dqm,
>  	dqm_lock(dqm);
>=20
>  	retval =3D unmap_queues_cpsch(dqm,
> KFD_UNMAP_QUEUES_FILTER_BY_PASID,
> -			pasid, true);
> +			pasid, USE_DEFAULT_GRACE_PERIOD, true);
>=20
>  	dqm_unlock(dqm);
>  	return retval;
> @@ -1846,13 +1869,14 @@ static int reset_queues_cpsch(struct
> device_queue_manager *dqm,
>  /* dqm->lock mutex has to be locked before calling this function */
>  static int execute_queues_cpsch(struct device_queue_manager *dqm,
>  				enum kfd_unmap_queues_filter filter,
> -				uint32_t filter_param)
> +				uint32_t filter_param,
> +				uint32_t grace_period)
>  {
>  	int retval;
>=20
>  	if (dqm->is_hws_hang)
>  		return -EIO;
> -	retval =3D unmap_queues_cpsch(dqm, filter, filter_param, false);
> +	retval =3D unmap_queues_cpsch(dqm, filter, filter_param, grace_period,
> false);
>  	if (retval)
>  		return retval;
>=20
> @@ -1910,7 +1934,8 @@ static int destroy_queue_cpsch(struct
> device_queue_manager *dqm,
>  		if (!dqm->dev->shared_resources.enable_mes) {
>  			decrement_queue_count(dqm, qpd, q);
>  			retval =3D execute_queues_cpsch(dqm,
> -
> KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0);
> +
> KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> +
> USE_DEFAULT_GRACE_PERIOD);
>  			if (retval =3D=3D -ETIME)
>  				qpd->reset_wavefronts =3D true;
>  		} else {
> @@ -2195,7 +2220,7 @@ static int process_termination_cpsch(struct
> device_queue_manager *dqm,
>  	}
>=20
>  	if (!dqm->dev->shared_resources.enable_mes)
> -		retval =3D execute_queues_cpsch(dqm, filter, 0);
> +		retval =3D execute_queues_cpsch(dqm, filter, 0,
> USE_DEFAULT_GRACE_PERIOD);
>=20
>  	if ((!dqm->is_hws_hang) && (retval || qpd->reset_wavefronts)) {
>  		pr_warn("Resetting wave fronts (cpsch) on dev %p\n", dqm-
> >dev);
> @@ -2540,7 +2565,8 @@ int dqm_debugfs_hang_hws(struct
> device_queue_manager *dqm)
>  		return r;
>  	}
>  	dqm->active_runlist =3D true;
> -	r =3D execute_queues_cpsch(dqm,
> KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0);
> +	r =3D execute_queues_cpsch(dqm,
> KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES,
> +				0, USE_DEFAULT_GRACE_PERIOD);
>  	dqm_unlock(dqm);
>=20
>  	return r;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> index a537b9ef3e16..fb48b124161f 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> @@ -37,6 +37,7 @@
>=20
>  #define KFD_MES_PROCESS_QUANTUM		100000
>  #define KFD_MES_GANG_QUANTUM		10000
> +#define USE_DEFAULT_GRACE_PERIOD 0xffffffff
>=20
>  struct device_process_node {
>  	struct qcm_process_device *qpd;
> @@ -256,6 +257,7 @@ struct device_queue_manager {
>  	struct work_struct	hw_exception_work;
>  	struct kfd_mem_obj	hiq_sdma_mqd;
>  	bool			sched_running;
> +	uint32_t		wait_times;
>  };
>=20
>  void device_queue_manager_init_cik(
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
> index ed02b6d8bf63..c57f9a46dfcc 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c
> @@ -369,6 +369,38 @@ int pm_send_query_status(struct packet_manager
> *pm, uint64_t fence_address,
>  	return retval;
>  }
>=20
> +int pm_update_grace_period(struct packet_manager *pm, uint32_t
> grace_period)
> +{
> +	int retval =3D 0;
> +	uint32_t *buffer, size;
> +
> +	size =3D pm->pmf->set_grace_period_size;
> +
> +	mutex_lock(&pm->lock);
> +
> +	if (size) {
> +		kq_acquire_packet_buffer(pm->priv_queue,
> +			size / sizeof(uint32_t),
> +			(unsigned int **)&buffer);
> +
> +		if (!buffer) {
> +			pr_err("Failed to allocate buffer on kernel queue\n");
> +			retval =3D -ENOMEM;
> +			goto out;
> +		}
> +
> +		retval =3D pm->pmf->set_grace_period(pm, buffer, grace_period);
> +		if (!retval)
> +			kq_submit_packet(pm->priv_queue);
> +		else
> +			kq_rollback_packet(pm->priv_queue);
> +	}
> +
> +out:
> +	mutex_unlock(&pm->lock);
> +	return retval;
> +}
> +
>  int pm_send_unmap_queue(struct packet_manager *pm,
>  			enum kfd_unmap_queues_filter filter,
>  			uint32_t filter_param, bool reset)
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> index 18250845a989..f0cdc8695b8c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> @@ -251,6 +251,41 @@ static int pm_map_queues_v9(struct packet_manager
> *pm, uint32_t *buffer,
>  	return 0;
>  }
>=20
> +static int pm_set_grace_period_v9(struct packet_manager *pm,
> +		uint32_t *buffer,
> +		uint32_t grace_period)
> +{
> +	struct pm4_mec_write_data_mmio *packet;
> +	uint32_t reg_offset =3D 0;
> +	uint32_t reg_data =3D 0;
> +
> +	pm->dqm->dev->kfd2kgd->build_grace_period_packet_info(
> +			pm->dqm->dev->adev,
> +			pm->dqm->wait_times,
> +			grace_period,
> +			&reg_offset,
> +			&reg_data);
> +
> +	if (grace_period =3D=3D USE_DEFAULT_GRACE_PERIOD)
> +		reg_data =3D pm->dqm->wait_times;
> +
> +	packet =3D (struct pm4_mec_write_data_mmio *)buffer;
> +	memset(buffer, 0, sizeof(struct pm4_mec_write_data_mmio));
> +
> +	packet->header.u32All =3D pm_build_pm4_header(IT_WRITE_DATA,
> +					sizeof(struct
> pm4_mec_write_data_mmio));
> +
> +	packet->bitfields2.dst_sel  =3D
> dst_sel___write_data__mem_mapped_register;
> +	packet->bitfields2.addr_incr =3D
> +			addr_incr___write_data__do_not_increment_address;
> +
> +	packet->bitfields3.dst_mmreg_addr =3D reg_offset;
> +
> +	packet->data =3D reg_data;
> +
> +	return 0;
> +}
> +
>  static int pm_unmap_queues_v9(struct packet_manager *pm, uint32_t *buffe=
r,
>  			enum kfd_unmap_queues_filter filter,
>  			uint32_t filter_param, bool reset)
> @@ -333,6 +368,7 @@ const struct packet_manager_funcs kfd_v9_pm_funcs =3D
> {
>  	.set_resources		=3D pm_set_resources_v9,
>  	.map_queues		=3D pm_map_queues_v9,
>  	.unmap_queues		=3D pm_unmap_queues_v9,
> +	.set_grace_period       =3D pm_set_grace_period_v9,
>  	.query_status		=3D pm_query_status_v9,
>  	.release_mem		=3D NULL,
>  	.map_process_size	=3D sizeof(struct pm4_mes_map_process),
> @@ -340,6 +376,7 @@ const struct packet_manager_funcs kfd_v9_pm_funcs =3D
> {
>  	.set_resources_size	=3D sizeof(struct pm4_mes_set_resources),
>  	.map_queues_size	=3D sizeof(struct pm4_mes_map_queues),
>  	.unmap_queues_size	=3D sizeof(struct pm4_mes_unmap_queues),
> +	.set_grace_period_size  =3D sizeof(struct pm4_mec_write_data_mmio),
>  	.query_status_size	=3D sizeof(struct pm4_mes_query_status),
>  	.release_mem_size	=3D 0,
>  };
> @@ -350,6 +387,7 @@ const struct packet_manager_funcs
> kfd_aldebaran_pm_funcs =3D {
>  	.set_resources		=3D pm_set_resources_v9,
>  	.map_queues		=3D pm_map_queues_v9,
>  	.unmap_queues		=3D pm_unmap_queues_v9,
> +	.set_grace_period       =3D pm_set_grace_period_v9,
>  	.query_status		=3D pm_query_status_v9,
>  	.release_mem		=3D NULL,
>  	.map_process_size	=3D sizeof(struct
> pm4_mes_map_process_aldebaran),
> @@ -357,6 +395,7 @@ const struct packet_manager_funcs
> kfd_aldebaran_pm_funcs =3D {
>  	.set_resources_size	=3D sizeof(struct pm4_mes_set_resources),
>  	.map_queues_size	=3D sizeof(struct pm4_mes_map_queues),
>  	.unmap_queues_size	=3D sizeof(struct pm4_mes_unmap_queues),
> +	.set_grace_period_size  =3D sizeof(struct pm4_mec_write_data_mmio),
>  	.query_status_size	=3D sizeof(struct pm4_mes_query_status),
>  	.release_mem_size	=3D 0,
>  };
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
> b/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
> index a666710ed403..795001c947e1 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
> @@ -583,6 +583,71 @@ struct pm4_mec_release_mem {
>=20
>  #endif
>=20
> +#ifndef PM4_MEC_WRITE_DATA_DEFINED
> +#define PM4_MEC_WRITE_DATA_DEFINED
> +
> +enum WRITE_DATA_dst_sel_enum {
> +	dst_sel___write_data__mem_mapped_register =3D 0,
> +	dst_sel___write_data__tc_l2 =3D 2,
> +	dst_sel___write_data__gds =3D 3,
> +	dst_sel___write_data__memory =3D 5,
> +	dst_sel___write_data__memory_mapped_adc_persistent_state =3D 6,
> +};
> +
> +enum WRITE_DATA_addr_incr_enum {
> +	addr_incr___write_data__increment_address =3D 0,
> +	addr_incr___write_data__do_not_increment_address =3D 1
> +};
> +
> +enum WRITE_DATA_wr_confirm_enum {
> +	wr_confirm___write_data__do_not_wait_for_write_confirmation =3D 0,
> +	wr_confirm___write_data__wait_for_write_confirmation =3D 1
> +};
> +
> +enum WRITE_DATA_cache_policy_enum {
> +	cache_policy___write_data__lru =3D 0,
> +	cache_policy___write_data__stream =3D 1
> +};
> +
> +
> +struct pm4_mec_write_data_mmio {
> +	union {
> +		union PM4_MES_TYPE_3_HEADER header;     /*header */
> +		unsigned int ordinal1;
> +	};
> +
> +	union {
> +		struct {
> +			unsigned int reserved1:8;
> +			unsigned int dst_sel:4;
> +			unsigned int reserved2:4;
> +			unsigned int addr_incr:1;
> +			unsigned int reserved3:2;
> +			unsigned int resume_vf:1;
> +			unsigned int wr_confirm:1;
> +			unsigned int reserved4:4;
> +			unsigned int cache_policy:2;
> +			unsigned int reserved5:5;
> +		} bitfields2;
> +		unsigned int ordinal2;
> +	};
> +
> +	union {
> +		struct {
> +			unsigned int dst_mmreg_addr:18;
> +			unsigned int reserved6:14;
> +		} bitfields3;
> +		unsigned int ordinal3;
> +	};
> +
> +	uint32_t reserved7;
> +
> +	uint32_t data;
> +
> +};
> +
> +#endif
> +
>  enum {
>  	CACHE_FLUSH_AND_INV_TS_EVENT =3D 0x00000014
>  };
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index a34b000f1d25..c5f99a471211 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -1298,6 +1298,8 @@ struct packet_manager_funcs {
>  	int (*unmap_queues)(struct packet_manager *pm, uint32_t *buffer,
>  			enum kfd_unmap_queues_filter mode,
>  			uint32_t filter_param, bool reset);
> +	int (*set_grace_period)(struct packet_manager *pm, uint32_t *buffer,
> +			uint32_t grace_period);
>  	int (*query_status)(struct packet_manager *pm, uint32_t *buffer,
>  			uint64_t fence_address,	uint64_t fence_value);
>  	int (*release_mem)(uint64_t gpu_addr, uint32_t *buffer);
> @@ -1308,6 +1310,7 @@ struct packet_manager_funcs {
>  	int set_resources_size;
>  	int map_queues_size;
>  	int unmap_queues_size;
> +	int set_grace_period_size;
>  	int query_status_size;
>  	int release_mem_size;
>  };
> @@ -1330,6 +1333,8 @@ int pm_send_unmap_queue(struct packet_manager
> *pm,
>=20
>  void pm_release_ib(struct packet_manager *pm);
>=20
> +int pm_update_grace_period(struct packet_manager *pm, uint32_t
> grace_period);
> +
>  /* Following PM funcs can be shared among VI and AI */
>  unsigned int pm_build_pm4_header(unsigned int opcode, size_t packet_size=
);
>=20
> --
> 2.25.1
