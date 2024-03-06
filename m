Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E3187404A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 20:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8201111349A;
	Wed,  6 Mar 2024 19:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nitK4iP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D197011349A;
 Wed,  6 Mar 2024 19:21:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fI+u/3k0xT/FiGI1jhgghXKFpVSFl0LAmITfj3zU3Yoaj7a1h81FxlaG/HLGQAP6AJClIy054uoHuV8ZC/Hh0PNQgp101+r1k6BcQl4BX6ldZ5Ss8xx0MjS3rvjc4dCThuScAg7eGXqwaj8XXKe3bCjs+TbQb26ciMWHVKtHLYMH1hh5w/0cN44USffB/DDJYBgi1TEcYSIhJQqgEGy5LqmfQnhMWl0cbUQ/Rqvauths8XQFcDo4kqxD+G8ot7gUklhwYN3izMgk2vXtAfOOggty42fTGkf8Q7etZ6JRjWp8ERZLiRamZ8wBJK7voIfV58URPeqd0dA6ZJhVcJGzQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7bVEq+6yA5g9tAPm2Z4n+CshDZ+dDAY+Uu5MCtfkHY=;
 b=MwTZNABy0LUk4tA8+C5hVy2J0un29g+1ByrtkOT4LUrT2Y6aTFFC6atmeVO+yCSTeC517aXPJqZGrvKwoiZ1F6x1FCdo4U6+nclq6rZF20+KM2rF+L2yH9U4DSSvtF6UrQtlQ3CjXFO0chskGlrK5U77sa4r2wHV9bNNOIRO9YjU8IMEf26j1olcJnTO5I4UA4pfU7bA5ItIberLd59hrYmllZ/Kzk8z08eJFCB83HVfuh1L+77+iyK31JjXlxhFr3Qk8ngiYf/BDOdND+SB08aY4VoXADoUis7FppOPMkK1XbQuR+OPrhDwPibY8uEsG2+CPzMaEFgN6z70ie/fTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7bVEq+6yA5g9tAPm2Z4n+CshDZ+dDAY+Uu5MCtfkHY=;
 b=nitK4iP+gJLloxpDpJK7xMsJ0RfoQDwQUzy73WaIno3HlRm6eCH8xvtmcj4wjQZTMbsKEPdgKA5VJE02DSRpgcZYhtRjB6BHTitfdmnNtNmXawgm3dYjl98nOG9AZ23g7IfsnOkPifack/ccZOoqW4HwZ1OLUncCVRRhnvw8ilA=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by DM4PR12MB6614.namprd12.prod.outlook.com (2603:10b6:8:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 19:21:32 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::b001:1430:f089:47ae]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::b001:1430:f089:47ae%7]) with mapi id 15.20.7362.024; Wed, 6 Mar 2024
 19:21:32 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Khatri, Sunil" <Sunil.Khatri@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Sharma, Shashank" <Shashank.Sharma@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Joshi, Mukul"
 <Mukul.Joshi@amd.com>, "Paneer Selvam, Arunpravin"
 <Arunpravin.PaneerSelvam@amd.com>, "Khatri, Sunil" <Sunil.Khatri@amd.com>
Subject: RE: [PATCH] drm/amdgpu: add vm fault information to devcoredump
Thread-Topic: [PATCH] drm/amdgpu: add vm fault information to devcoredump
Thread-Index: AQHab/LpDbTvt6jAikuvI23PhvfbNrErFkmg
Date: Wed, 6 Mar 2024 19:21:32 +0000
Message-ID: <BL1PR12MB514469F899DD38439EA66CB5F7212@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20240306181937.3551648-1-sunil.khatri@amd.com>
 <20240306181937.3551648-2-sunil.khatri@amd.com>
In-Reply-To: <20240306181937.3551648-2-sunil.khatri@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=0075563b-7938-4750-a935-760f7b1ee0b7;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2024-03-06T19:18:44Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|DM4PR12MB6614:EE_
x-ms-office365-filtering-correlation-id: 7d6381e2-af05-4abd-d3f0-08dc3e12a1fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JMAZfnfiKrz5x1TFwMgTVHcFGcFTkrRaPE5AeLqtGZsm3+zNX/2VSAnL86ILwhyTIPNeUnGvCAXUNhnerk+a50ydgF4q6ldS/13l5lXarcKZCYlvNFLmUPkTtnDBO0+S+XX2Gu4gSWuo3trnmI8sSzRCRtousPU2uyhzroLnjS/LeCcykYaVW/MMlEPOkqUhY90WhJ1hMfu8Xh+Dntth2KOYshfPdK1zf9Kb5qnCMikOHHv1LPIkvmaKF9STQ912CuLUV896PfcNUeq2MZFH5sHVxQC1IanMscniWpMAKlTrckxktKmXIgFr7sTw4JDcJPlVpk7B+kuqr358qDx8Xw69Du7jxm2A6m4q3N5M6Aali66jK7KFPBoX9kTCN/aA5pl6XqwSFKgth4FJrDbX5yo2ioktjVJz3WSoRzFf9ClX2sJm0MZz5A52VN+0N13Oh0qG0tPTYnN5xdoYeFKVwq4lmtF/kXs0okGRfQ/mGQgAV4aVluFZNs/CcOW+v0l2KlkRmDcCyb0KvAuUTFjJ1p13c2KcMtajtcUXMDcO2EOZwFjfsl7eEB91IZjNkhUoNqaAManbnCKDQP+kM1X7d9lsHFArH5CTfIaxEQtKGkJxBuZXANofXSCI6CURVGH4Wx7y+UCC478X2wg6DEz0FxhNVtuaQSGNSx+vY284mRcvTTeW4YdW1S2aAwDl/vLRXL6m4FChTmb8TZ3ueAmNHodPLpn/Vrj1/jaOeCJw5Uk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M2Fcpdj5EFnLhTSqUS330lClK/wEKdun/cUqkPTE66qAu4WzIUu7cH8xNLto?=
 =?us-ascii?Q?Nxxh2MVYXZSzxm2uDdTaFxA+8KWyyTHocenC/h0dzxzZzBdyjNhtFyrxPWcm?=
 =?us-ascii?Q?Wg02pndGt0HkFex62OLe3QQOEnSt6YfL/CXLLHZaMgERfVjZUgZn8udohQYo?=
 =?us-ascii?Q?qJSrmo3jxlbHHSBn81q/gJBaH32f9WXlrzo0WC9MZJDx3PFOfD3l13YjYr7d?=
 =?us-ascii?Q?L2Gcva/u6s80aD0zibL3SbSVg0FFtR5A+n3o0qAqya7OYKbsmBNElCQykjqs?=
 =?us-ascii?Q?opnRG+H3Q4L7Q8arjqAwfSBmsPEoHXBk+nJ9xfbPFYaCwz0DrOM8ahxNfVUy?=
 =?us-ascii?Q?UtZZEavIUJ/qXS0FaoozycUHBKAeXlDqhaky2parL9n4PVLwIygsstXhyvzO?=
 =?us-ascii?Q?Wd7hs3Il5nv/oJB5X9144y9iN8kmZ/lM1wfChKZ1VSTiv+TrOanxiwl7fepF?=
 =?us-ascii?Q?LcBnKySbYD0cPGqHHHlwjV2gcklZ+5UN9H0iOwwdkrKBG49J1hpFmnOF4kJG?=
 =?us-ascii?Q?Bwp3pkqS5UMCKfxk3cqDe3O9WcMnH+wZTpkIcPDvDjnbD9XPH8hd1C0Gboyg?=
 =?us-ascii?Q?QiNKSW341/wpL5gTDVRJ1i7Gn4FGv36RtEaSC9JWPqS0AvYBnaiJPCfU0jPt?=
 =?us-ascii?Q?hXALnr8MdNVMUa5IEnCIplDGO1NaCGobV6QNGIJopn6Ive2CJY9L1m2MMzuo?=
 =?us-ascii?Q?HmRqvzEZadGhCd6dizdQ6xZblX28cU0m4yDhUadazK7dqCypdB1mXwE3dVWc?=
 =?us-ascii?Q?WdJpUjiEU0jmk5F3EyfbAYdEi+HrWI8fHiE0VACG3Z174jZee9NqHbIlzLw0?=
 =?us-ascii?Q?lTWx3JUlt2Inex1Fxje4Vydy/vU3eXXlGuGa2IRfDCkKRQbA7YmPqsr3JeOf?=
 =?us-ascii?Q?DD2ETo2BA+2ehkgC47SXOOLHHWZrZDnNJXzkncrQZ+ZxrrQulFXPVW788lV3?=
 =?us-ascii?Q?J99TNIyQJvhA73WLPt50Lt934Gjza8cFvwsK5D/W0ZBFOcenbxwqLzrs0zAr?=
 =?us-ascii?Q?fFse/66R4ay8ROba+RiLj+QevnD+uavcK/4cU9YTzyj0PCbXCWoBt9Pm6VER?=
 =?us-ascii?Q?f56nruHPEudHN6wd39kONMC2JSJjm4ha7ka9a2Lk3+OtBqfaw5whHoZ4X52L?=
 =?us-ascii?Q?ilZKXJ99kZFgisg8Bg8D82uplb3F/jaLEUHlWPWkXyTRz8yy6yriX+RTqTvW?=
 =?us-ascii?Q?L63Dmi8IRk8mfcudsT2iQ/x6yBzeffUJtUjj4yb2qScsv6WiM75shWggYtgm?=
 =?us-ascii?Q?mu190ZtdM/jIg6Io4Yz7Ozv+doaiZNa0awCzaFrZtd7ivPM5aZVUh5v+5DM8?=
 =?us-ascii?Q?xuuwqBzBwjE9tLfFcA1xRYCVEFfIfqFEAYpot1/8GPLhOnI7fBnfD2Ocgxht?=
 =?us-ascii?Q?z3sr0o0Ngi0aZgF8JUiv5yu8VVBpgP9qduwFRQEpo8O9HbxGJhvDuwKTr9Yb?=
 =?us-ascii?Q?ZKrfacq5+9rmiBz0u4dzzNs0NDkPdGMzjo5VQ4J8WL3wPeMqvDBfupFP/I0j?=
 =?us-ascii?Q?6iCpxd6AMlGb3vN6Ks8RVyW91xdLuV82SqjXDBNoB/Bytr9rBPQcUZVUhAYD?=
 =?us-ascii?Q?8u05T3VgYKX8Omfpxzo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6381e2-af05-4abd-d3f0-08dc3e12a1fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2024 19:21:32.7274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Cxg+NIYDjvXLlcaZWFGcoSRZSZCtYu61KoKKosMNsMfarRf/l67BjPzcoiuzIcvwpIuB80IdxM7YY4NgYKMRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6614
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

[Public]

> -----Original Message-----
> From: Sunil Khatri <sunil.khatri@amd.com>
> Sent: Wednesday, March 6, 2024 1:20 PM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Sharma, Shashank
> <Shashank.Sharma@amd.com>
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux=
-
> kernel@vger.kernel.org; Joshi, Mukul <Mukul.Joshi@amd.com>; Paneer
> Selvam, Arunpravin <Arunpravin.PaneerSelvam@amd.com>; Khatri, Sunil
> <Sunil.Khatri@amd.com>
> Subject: [PATCH] drm/amdgpu: add vm fault information to devcoredump
>
> Add page fault information to the devcoredump.
>
> Output of devcoredump:
> **** AMDGPU Device Coredump ****
> version: 1
> kernel: 6.7.0-amd-staging-drm-next
> module: amdgpu
> time: 29.725011811
> process_name: soft_recovery_p PID: 1720
>
> Ring timed out details
> IP Type: 0 Ring Name: gfx_0.0.0
>
> [gfxhub] Page fault observed for GPU family:143 Faulty page starting at

I think we should add a separate section for the GPU identification informa=
tion (family, PCI ids, IP versions, etc.).  For this patch, I think fine to=
 just print the fault address and status.

Alex

> address 0x0000000000000000 Protection fault status register:0x301031
>
> VRAM is lost due to GPU reset!
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 15 ++++++++++++++-
> drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h |  1 +
>  2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index 147100c27c2d..d7fea6cdf2f9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -203,8 +203,20 @@ amdgpu_devcoredump_read(char *buffer, loff_t
> offset, size_t count,
>                          coredump->ring->name);
>       }
>
> +     if (coredump->fault_info.status) {
> +             struct amdgpu_vm_fault_info *fault_info =3D &coredump-
> >fault_info;
> +
> +             drm_printf(&p, "\n[%s] Page fault observed for GPU
> family:%d\n",
> +                        fault_info->vmhub ? "mmhub" : "gfxhub",
> +                        coredump->adev->family);
> +             drm_printf(&p, "Faulty page starting at address 0x%016llx\n=
",
> +                        fault_info->addr);
> +             drm_printf(&p, "Protection fault status register:0x%x\n",
> +                        fault_info->status);
> +     }
> +
>       if (coredump->reset_vram_lost)
> -             drm_printf(&p, "VRAM is lost due to GPU reset!\n");
> +             drm_printf(&p, "\nVRAM is lost due to GPU reset!\n");
>       if (coredump->adev->reset_info.num_regs) {
>               drm_printf(&p, "AMDGPU register dumps:\nOffset:
> Value:\n");
>
> @@ -253,6 +265,7 @@ void amdgpu_coredump(struct amdgpu_device
> *adev, bool vram_lost,
>       if (job) {
>               s_job =3D &job->base;
>               coredump->ring =3D to_amdgpu_ring(s_job->sched);
> +             coredump->fault_info =3D job->vm->fault_info;
>       }
>
>       coredump->adev =3D adev;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> index 60522963aaca..3197955264f9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> @@ -98,6 +98,7 @@ struct amdgpu_coredump_info {
>       struct timespec64               reset_time;
>       bool                            reset_vram_lost;
>       struct amdgpu_ring                      *ring;
> +     struct amdgpu_vm_fault_info     fault_info;
>  };
>  #endif
>
> --
> 2.34.1

