Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 229FC7ADC76
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 17:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9359310E047;
	Mon, 25 Sep 2023 15:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E4C10E047;
 Mon, 25 Sep 2023 15:57:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ewTiZopkU6t5yEq6hhVmMPihGbKQxedeT5k5rvjz0n6rUH3svKEszIh1OAjAJ65hn9CT2PmMVagTuXmk6SgsLrCZdryfuGwiIaR9e9LnzeCAwy2IzY28iyPky+uLQXUv6kMvC8dYg5SEh4t5q+e4NNmfmyJJyH4BGJq1PwaX1QT4D1CW767HM76t+z7zgl++XOhzWCzzkfbf0cSbUIp8jbQxE8JrFTWDu8giAO/QHZzR/9vBxUwQu6xVt+x0FURysY5HZLxTP6KdoONWWay/4TXzA56MGFUtIDKSQi1R/jTMf1AJh3mgUDv9lJVuXVWOgZg3L8upeFfCEqc4Z4vpQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKBQbwAA+6W4LWvdGErpZ0JgTH7ad4P8z1yYuNqd2Oc=;
 b=Bhqp5TrPg1OnE8XZrA3+EcC8pE8gbFln+VsJwrVqy3EEPy6S1847hWG1P294xvvXRBPM9Vm212keBRsbuxqDeoLJ1kKrhtlQKABBJZw+9nVM1iZxGp4DwcGDBdsrraAD5p4eEzhWkl1g9CAkpIzPCkKZ8/ZWLF6u2SUu3BO2E55ysCesJTHUFzbToPmVXV32EDI2y0pvM/xu3GO8AfQwxBr5Dcnayruxp6ugA0a2jV6jMmVKbWmJ0mpxu1wsYx3FsVl5b0bHcaGdC1lNSZ4RN7DbmiFdZnTezvuhhaKBlyHQtHvyXst/HCWINT38s9l/RYrMT7WhfQxqh+Y+Evz1Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKBQbwAA+6W4LWvdGErpZ0JgTH7ad4P8z1yYuNqd2Oc=;
 b=yDR2Jea6RUA1m+SApHiyvm3lwkRDF3RhFTHCBvaywMJaJ347TKPMKf6ELrmvn4E3NZEocGP1/RpnI2tDjbqNGYEzwz3VjB0Eg5oYJAXYw+J4Jfg65A1FYr1D5otsBVMenmF2w6YlOnuPDzEZHOe6qVgeikFEM1wj3gMdazaIhZc=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by SA3PR12MB7903.namprd12.prod.outlook.com (2603:10b6:806:307::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 15:56:59 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::a2bb:870f:8aaa:1ba2]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::a2bb:870f:8aaa:1ba2%6]) with mapi id 15.20.6813.017; Mon, 25 Sep 2023
 15:56:59 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Douglas Anderson <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Maxime
 Ripard <mripard@kernel.org>
Subject: RE: [RFT PATCH v2 07/12] drm/amdgpu: Call
 drm_atomic_helper_shutdown() at shutdown time
Thread-Topic: [RFT PATCH v2 07/12] drm/amdgpu: Call
 drm_atomic_helper_shutdown() at shutdown time
Thread-Index: AQHZ7MHT9H814V2OZ0mLzXicKpUENrArticA
Date: Mon, 25 Sep 2023 15:56:59 +0000
Message-ID: <BL1PR12MB514407EE7F9B23BC58E40A6CF7FCA@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20230921192749.1542462-1-dianders@chromium.org>
 <20230921122641.RFT.v2.7.I27914059cc822b52db9bf72b4013b525b60e06fd@changeid>
In-Reply-To: <20230921122641.RFT.v2.7.I27914059cc822b52db9bf72b4013b525b60e06fd@changeid>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=bd244764-e62e-4e49-a944-ca8970c61285;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-09-25T15:49:19Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|SA3PR12MB7903:EE_
x-ms-office365-filtering-correlation-id: 9710ea81-f34a-475f-2cc7-08dbbde00cfd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: An/dInFsVuvD4Rg5x+yyrvbAPXV2YkyOJS3pCEUhCobHT9tdr0TowMagoJZC4QpbwalsGXJRIFRWFLhorsAQbBQE86vw9Ib1kldp6izcLonjQj3YxuVG6BlW9GBp4BHgPNquHExPrlNPVfiDSdvzMz7fLr6DtLB4UlIWG3PzZiewDWXAqL8OQImZNCARyiShztbe9UER4CSh+7s7pSK2b1nZdtzC+Vx9SphOUsygmHDQr0k67gWx5vaxhl8U8GA017hyNacWdmIjLfrGrT0zg0suG2oI8qFEZFq3wdn1TjGNC9KKLDoH9U7YuU7U7B4IO1QH3LFaOmCC41G2JVCwfgrLDw2GdNrTr/1JAOh6XtMGfPRK0WOIfkTfI5a+LC67cCcAgrCpht1lnrk29hzKWGKKDOSQrrAXuZ3iQT+0nN1Ydnwa0DHiIwQ+JgTGL9kqAAahNELylyWzzht0aDRD2jMAViaRDQd55TJTDJaI7/vZfTONm3ShRzpGddEYP8QuQL1dJUpW2VM0BEuMFKK9Q4epspMRWR2NevMauG2frCxgF7MljASN+88lb3aWoYXuX7jWNrbksxYjkn7rf7SnefULVeFtLwGjmFJ8+l0d752h2rZqZGivt8Rgd1SHULhI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(396003)(376002)(366004)(230922051799003)(186009)(1800799009)(451199024)(7696005)(26005)(6506007)(53546011)(9686003)(122000001)(38070700005)(38100700002)(86362001)(33656002)(55016003)(83380400001)(4326008)(8936002)(8676002)(316002)(41300700001)(64756008)(66446008)(66476007)(66556008)(54906003)(66946007)(5660300002)(110136005)(52536014)(76116006)(2906002)(7416002)(71200400001)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iwifzCaCGCalX891h71NhdXjsH9/hy4PvPLuoug7K42yxHAKVTDbPnBG7VXB?=
 =?us-ascii?Q?5TfiOme94XOA/7X9DTqS3GZB6ehOa3xnksk7uDLzOH75PVLaf+cBnoD/pqMi?=
 =?us-ascii?Q?50lOdYJcbou1f0DIah8cOK5q2NvW4U5+wmWu/PmBqnCtG/bb5AZdy176aooG?=
 =?us-ascii?Q?PlFVH+8NTA06EXVYKLReOG/hwo2GjEZgw0puNpRum2TPOi0tkwdxg4ncQfBk?=
 =?us-ascii?Q?9u8/MUrMCcqlA/pRPsvZKyAZzzi2ymmhA3Yli/heyhTbzoF6NBtQfU90gFxk?=
 =?us-ascii?Q?wOaXEjochKTdBA7g37Mip3V60ugefZrNYynSO7U/xHSxs44xeo6brmDTP8dw?=
 =?us-ascii?Q?mIUbe0vn9UnNQi9ze8i0alZhLTq6Qiul/4Qg2rhzl33T/Aks9Yr7KX4aJAMj?=
 =?us-ascii?Q?38woRRkhD8agfu6k2zPfx252Jv3bl2rLwEDbiDx3zI1INrC6jt2fUiA+Lxfn?=
 =?us-ascii?Q?FqPssWhQEuI7600ATqSjTtmCvSFTUEtY7DRJK2FbVamILCyd4UNp5dNERhJ1?=
 =?us-ascii?Q?qttnNyRR/QIbQg0w8VF2mgWy/KKJtR7qLoGIQiqBDHbjYw5Mc0Mrxg+b1fYi?=
 =?us-ascii?Q?eJiPId0t3YDJBTmRUzujz/8qoU9i3CgNpxTowLicBeQeE8WeCsJWhRlgyMmA?=
 =?us-ascii?Q?ARVgr45jRjQlPt3JsfA/Qe4xNtdG2/rhH/x46yrHDnYwvIeGnFCzUJ0tNqh8?=
 =?us-ascii?Q?b2UYmnhPyIMdabbTQHLFjn1B85E/SJyTF4L5wAbsSf1GdRbIoMSZvC88kdim?=
 =?us-ascii?Q?dD80W0+ZAGaor5a6EgGtPmHT8lnt7NuF2+K9i6cca/yPS6B3mnOiALWiQE9/?=
 =?us-ascii?Q?n/dIyf6KSHCY602zlwJTuo3/cCLsA7h9udaU9Uq8UcKMNE7BBGZ2Zy0s2oKX?=
 =?us-ascii?Q?MzuIv6aT8EIZEApoIP4IU7ULQ4+VH05kPcOssb/OOMUWCHEaCNqIJ26ME9jy?=
 =?us-ascii?Q?2pn9K/Tj+0KAG6k5m+Ep33DJ9/J+/Twia1N97berSbp1T5W4dWLRv3uHKtav?=
 =?us-ascii?Q?lP7j7GIAWZb0ExC9AiVYO8Uhl946XPmeo/Va1LTw/+4Ki7oxq8VjUGa+9EFh?=
 =?us-ascii?Q?XIGdqhGs8C+KycYyoUU2/WUs51BylFPDYyLo1rIIrOdGm8NCeuYbD4/7J4e8?=
 =?us-ascii?Q?kD46C3M2kEqZm1ITpgcSxYhauEET9Lx/J2bnOlCsyFAh419Lg7ie06TQekNR?=
 =?us-ascii?Q?w5ey8nERvzP0pecHGhrYFA8ZO76bRN2EXgJmAVxD/CkmYdS3YfC7BHz4l4dF?=
 =?us-ascii?Q?NzJweD5KT3YP00khmoZIABHaAi8mxU4g8d0jTNmNd8Gi8FG7k1znj1If8ZFM?=
 =?us-ascii?Q?JhGwzn6Vo5mrUYdqGQLXSo5z20dnTg0FLq11S4pfdfBK+8N0QZMb9v4aysOe?=
 =?us-ascii?Q?Fx0mgPfoXaEw2oET+bg/hqyVD4QwdCuK9XYU6d3HDNKEOwbEegLF3unVUXDN?=
 =?us-ascii?Q?Me5QIadXFytXJ9uOxO0fUpCYVrPoLkFzW9GnXB3zL9pOjUF4s3TLevt7QQo7?=
 =?us-ascii?Q?hUaw+L4DFRTohlQ4YW0tDNdfDLH32G7TutDZh2EK+ffrJS8UstG/UykD+4Hs?=
 =?us-ascii?Q?HmSlYhEbQ5rwMmcCF84=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9710ea81-f34a-475f-2cc7-08dbbde00cfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 15:56:59.1081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pn4YsOZvCseYSsUcqg4rTMFObSDg/KvoWWKIsfHxtHMnolNozjitEl4P4g+I0v9193WeTOQSFx0tRqEuTqv9Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7903
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, "SHANMUGAM,
 SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "Zhang,
 Bokun" <Bokun.Zhang@amd.com>, "Kuehling, 
 Felix" <Felix.Kuehling@amd.com>, "Zhao, Victor" <Victor.Zhao@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>, "Ma, Le" <Le.Ma@amd.com>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>, "Zhang, Morris" <Shiwu.Zhang@amd.com>,
 "Zhu, James" <James.Zhu@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> -----Original Message-----
> From: Douglas Anderson <dianders@chromium.org>
> Sent: Thursday, September 21, 2023 3:27 PM
> To: dri-devel@lists.freedesktop.org; Maxime Ripard <mripard@kernel.org>
> Cc: Douglas Anderson <dianders@chromium.org>; Zhang, Bokun
> <Bokun.Zhang@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>;
> Zhu, James <James.Zhu@amd.com>; Zhao, Victor <Victor.Zhao@amd.com>;
> Pan, Xinhui <Xinhui.Pan@amd.com>; airlied@gmail.com; Deucher, Alexander
> <Alexander.Deucher@amd.com>; amd-gfx@lists.freedesktop.org; Koenig,
> Christian <Christian.Koenig@amd.com>; daniel@ffwll.ch; Kuehling, Felix
> <Felix.Kuehling@amd.com>; jim.cromie@gmail.com; Ma, Le
> <Le.Ma@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.com>; linux-
> kernel@vger.kernel.org; maarten.lankhorst@linux.intel.com; Limonciello,
> Mario <Mario.Limonciello@amd.com>; mdaenzer@redhat.com; Zhang,
> Morris <Shiwu.Zhang@amd.com>; SHANMUGAM, SRINIVASAN
> <SRINIVASAN.SHANMUGAM@amd.com>; tzimmermann@suse.de
> Subject: [RFT PATCH v2 07/12] drm/amdgpu: Call
> drm_atomic_helper_shutdown() at shutdown time
>
> Based on grepping through the source code this driver appears to be missi=
ng a
> call to drm_atomic_helper_shutdown() at system shutdown time. Among
> other things, this means that if a panel is in use that it won't be clean=
ly
> powered off at system shutdown time.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case of =
OS
> shutdown/restart comes straight out of the kernel doc "driver instance
> overview" in drm_drv.c.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This commit is only compile-time tested.
>
> ...and further, I'd say that this patch is more of a plea for help than a=
 patch I
> think is actually right. I'm _fairly_ certain that drm/amdgpu needs this =
call at
> shutdown time but the logic is a bit hard for me to follow. I'd appreciat=
e if
> anyone who actually knows what this should look like could illuminate me,=
 or
> perhaps even just post a patch themselves!
>
> (no changes since v1)
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 ++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  2 ++
>  3 files changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 8f2255b3a38a..cfcff0b37466 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1104,6 +1104,7 @@ static inline struct amdgpu_device
> *amdgpu_ttm_adev(struct ttm_device *bdev)  int amdgpu_device_init(struct
> amdgpu_device *adev,
>                      uint32_t flags);
>  void amdgpu_device_fini_hw(struct amdgpu_device *adev);
> +void amdgpu_device_shutdown_hw(struct amdgpu_device *adev);
>  void amdgpu_device_fini_sw(struct amdgpu_device *adev);
>
>  int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev); diff --git
> a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index a2cdde0ca0a7..fa5925c2092d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4247,6 +4247,16 @@ void amdgpu_device_fini_hw(struct
> amdgpu_device *adev)
>
>  }
>
> +void amdgpu_device_shutdown_hw(struct amdgpu_device *adev) {

This needs a better name since its only for displays.  Also maybe move it i=
nto amdgpu_display.c since it's really about turning off the displays.  Tha=
t said is this really even needed?  The driver already calls its suspend fu=
nctionality to turn off all of the hardware and put it into a quiescent sta=
te before shutdown.  Basically shares the same code we use for suspend.


> +     if (adev->mode_info.mode_config_initialized) {
> +             if (!drm_drv_uses_atomic_modeset(adev_to_drm(adev)))
> +                     drm_helper_force_disable_all(adev_to_drm(adev));
> +             else
> +                     drm_atomic_helper_shutdown(adev_to_drm(adev));
> +     }
> +}
> +
>  void amdgpu_device_fini_sw(struct amdgpu_device *adev)  {
>       int idx;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index e90f730eb715..3a7cbff111d1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2333,6 +2333,8 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
>       struct drm_device *dev =3D pci_get_drvdata(pdev);
>       struct amdgpu_device *adev =3D drm_to_adev(dev);
>
> +     amdgpu_device_shutdown_hw(adev);

I would move this after the ras_intr check below.

Alex

> +
>       if (amdgpu_ras_intr_triggered())
>               return;
>
> --
> 2.42.0.515.g380fc7ccd1-goog

