Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D32357ADD09
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 18:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A2C10E2A3;
	Mon, 25 Sep 2023 16:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF01C10E2A2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 16:27:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJ8V4MglDdCE57ap6+X/9pwMp9slN2I19B44sMrPNnoKwTNlyNewMy83109P9ydqbT57IUXqONFS1+vNbf08Bzy/6r3rQ+0cRuX2Nki66tb3SaM/5RWiM0ExEI2wH/hRNU4Vl3hIf8NiHLsK9tIwueReugPc0MHf9icjhjO5/sBPa1nbvtDEZCHUzZTLct3fK2zop++DUD4TGrizvbRCOZq5dtC5C2w4U3runtI3I5fXHgoOytQmZyRli2CFTTaRZcqfgOAZXEysaF1ckHlgSQ8lRFxRPKha8O/Mzm8zTczt5gvQ2wGykaH654fWU4AElEkKjEbEdkINV5y7NL4l+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoAVKf+6c0hvWOoPCodmE3purmcnxUcGbgrcVS+ew5I=;
 b=Dpyy68MAfKVISFXaMUmw3c5HIF8V55XiB2sXwvqDPQHeFKRIKLLiUDLZiRz7twCE4PPDuKCzeiwLSEZhWHeX/hU/NhkL/tryDHwLgG2Y50XFna3nrSiwYEKbMUgBPgZZN3DFj8o8wJNxH98LayVXXOfsE6pjvFaDcjR4YkkqFf/ofRdz5yjLUDceVp6NGCuXOvy983Ij8JN3PEFHAU11f/MSJNFPuObQkHVVI0WxYYLUlpyUNqXqDHZJR3MHRe4lc8Grql/lXEXZBaO8EZCzXWq2E+sD3/MFUxxl4VLggUp5IRNNVO6D432LB85cY1v4YtcoPKudYx64zyS8BWLQUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SoAVKf+6c0hvWOoPCodmE3purmcnxUcGbgrcVS+ew5I=;
 b=EbH7juE6EG//SJSsZrygzE6mrW5TgFG7uaWky4P4pdRNqCt89G3w5KlMtZYZEhic78GzmZxnEVfhCahq9eC9G2aEFqQzKdOAJ5xvYomwVdtKHCPsu7Ug0e3fl+TPd7AHUCJwZ5FvzzRkB8jDeJxozpEY55FanCxBv7Q44kEDzKE=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by SN7PR12MB8104.namprd12.prod.outlook.com (2603:10b6:806:35a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Mon, 25 Sep
 2023 16:27:52 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::a2bb:870f:8aaa:1ba2]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::a2bb:870f:8aaa:1ba2%6]) with mapi id 15.20.6813.017; Mon, 25 Sep 2023
 16:27:52 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "hdegoede@redhat.com"
 <hdegoede@redhat.com>, "markgross@kernel.org" <markgross@kernel.org>,
 "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>, "jikos@kernel.org"
 <jikos@kernel.org>, "benjamin.tissoires@redhat.com"
 <benjamin.tissoires@redhat.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
Thread-Topic: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
Thread-Index: AQHZ7X21jc91/MVWOEyvwgwS3OmQarArvY7g
Date: Mon, 25 Sep 2023 16:27:52 +0000
Message-ID: <BL1PR12MB51442D18C314B1E34B77DE2BF7FCA@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-14-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20230922175056.244940-14-Shyam-sundar.S-k@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=3c5a584a-fe4a-43ce-9811-b8eb97d1a348;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-09-25T16:21:07Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|SN7PR12MB8104:EE_
x-ms-office365-filtering-correlation-id: 4153ffd5-29fb-42ad-e531-08dbbde45ddf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L9zv7FqLYoqryO0YmTL5yGN6Lh1JAwhzIkn75lAEKxEDtx5VV+NMP+IfZoexHK7+Fpbx5uN4pTJ+SN+VbxLtb2sux8g2j+m3HPK6yHM1Ns0f2V09+If3HN10dylzHUL+BHJW3uvOLFOF3SF6nLESEBGYbMbuSsMuAvQLeOmR4E5Sp3Uf0MMFqBzYiwIIkCDR0TRrIwCuZL0B0FzJoQkM/l0am/a2mYDTwjaNlcZ1AY68FAYcPOI9bSAWysWJ8areS9ErPwJdv+6Sues2csUN5xJqFNsBuJ33oqQ9vjVub9IhoFWQ83fGbK5h+40ZbSXevGn5S/+UzDVh/iNxixAqPuurPC570PQy/HYL8ZhjRrA991bepwsuVvSyGPkPL/C8wWx12TIXrmpgG9kbSgIHCf7ONpE9W++ZV913Ui52x9L/3ws0nTceEqrifWOGlNmutNbn157QYYU96LwF5rHY8HYAGWXPMDxr4nAAh0ZloX8XQnj0oRNDwjpI4RAJzSzwyejCymSGvr/cP/x7bTbUpkiYC8Jk4BAmZ802x3gmvUrBEzJ9JM3wzzn/hg7tkIvQPVwI+/5igER5I7Qf3naggaf1Ts21/cYJpwVbUhpyzzMv5+Qk5UIUpKIevnJbxjuHPXn9l3ubOt7D3FvXkXeARQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(396003)(366004)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(9686003)(55016003)(122000001)(7696005)(53546011)(6506007)(26005)(71200400001)(921005)(66476007)(66946007)(110136005)(64756008)(8936002)(76116006)(33656002)(66446008)(66556008)(7416002)(2906002)(54906003)(86362001)(8676002)(4326008)(5660300002)(52536014)(38100700002)(41300700001)(316002)(478600001)(83380400001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?n2WS7ax9YUNUa8yddcSLxQjcl+wEhcwXq20mLvM+00lHDWRj2pU87ZoT+CyJ?=
 =?us-ascii?Q?kbQFvpGW0Fn/WVLHumrxpccTiumEFCrwZ0rZkZQ3933ZKFJkT5wUeFtZVc1A?=
 =?us-ascii?Q?0eGyrC26/CcMp5QwS7UA0R0uznJJg0jxUYZGzHjpWjYfDio4EYnjOTvKIJKW?=
 =?us-ascii?Q?uZXhKxUZEPWFIDcD6mGhojWIu/8xezyag4o6FnhUT+tmebgICx7zL769gRlh?=
 =?us-ascii?Q?BxQJe8YFYDcVCFyMcaoKTeE7VEqWwr5RGgpD8kZb1aum1DI1JW8k2fuzGsZi?=
 =?us-ascii?Q?uv1AyNEws/x3uTO004slbpA3lkNhI1rr0ndrGDmYpux7HW6toFsQZ0oZ1SlR?=
 =?us-ascii?Q?wqa6Eh7KIMPZVC7xwRTn2HQ/7XyqcA0hvfBzVBLqCLCy0s2zOKZsdPHceLTr?=
 =?us-ascii?Q?rx0KY5A1AGvKlalmKQzyHHoD9KUwRp5O2GgMFaBJxgdRTajUuruysjUBMNzi?=
 =?us-ascii?Q?mTh5jBk3t8JAN/Fz9NcjM8L70xKPc2ncYgAxyBs8wNkPYiMVTY964RT/LRnP?=
 =?us-ascii?Q?KOdB2AJmyn+nwGabE9eR8xaKoENt+mOZxpBzHW/Gpxtf0JHXP7dyCfXKb+Gn?=
 =?us-ascii?Q?pph6TscPYXJ3A1yHa2C5MJG/Ix7FshVBrN+XP4JEWTS8aGcRWAonpggdjpVr?=
 =?us-ascii?Q?cfdUVMyy0IqaR/ZmaDAriwAkcWjvSfKlVxyphbom2zqhCL60npJ4ZS2s+set?=
 =?us-ascii?Q?VQ3swZaJXSO1IpPBGAVoMf8tsv4JAGaNkcjf7QcXPWGN6NLy0lZuExF9Nr+U?=
 =?us-ascii?Q?Lyxv4WN92kyn3rkrdsKbWWsoyScJpz7axP3CBUgGU3JsIpVJlYOedhSPk3yy?=
 =?us-ascii?Q?no4ZkliOW5GZjS2RVxtcJgmhxQC+uuB96tUHPgU8AIJOQwZ9XGn7pRJ+NIUb?=
 =?us-ascii?Q?GvP1aCer/ckYSPmC+77aiKm5DgxnLhPbUB1RE4u9XOjiaIVMESiV6pBxAKoj?=
 =?us-ascii?Q?6FKf0uqkZMqACZb2CskgwSmSmoX4QvC5mue+mCv9yjcNsxBKoNOVbzpRj9G8?=
 =?us-ascii?Q?1kcsrep3yQD+8KsqU09piD1Wwucn/hU2AUO8DHdOa+n5re03FRsMc7H+QPaq?=
 =?us-ascii?Q?TQ6ne4kSafGfK7MhBjm+bUruQVmzNUYFyLAh4qB1bPJvAeBYfcNdoGvdDK20?=
 =?us-ascii?Q?fIvajZxGuUsrZpysyua67vBX2W9f/+l+1brbxVjXAsi6Z9ifjXM9gTKLGeQL?=
 =?us-ascii?Q?rAIM2bTJ2yJ+ht/8OJcbj9k2tNiX30LBHfVJadoNj5H7jshS/Eidk8RfFYnn?=
 =?us-ascii?Q?1yKFPPU8FOiL0ul4koYe7INNzRAbtXB9NOOEOL+mjlrnJn8lzKMYRZxd2K2X?=
 =?us-ascii?Q?XcoslV6YL6qjn/q7Wuj85JH14aqNzZyZcExKTi0f1wQOFh4gs3P99NZOV0Pm?=
 =?us-ascii?Q?bKhvvPsDJo/SYwBzVcvV/lwLiwa4fElr1oXKEpKhjaMt09AqSFEwMYE+6b5k?=
 =?us-ascii?Q?T8n69Iv6whDxOhcGayJ9xnNIO27HYQvHtPGKX4lzASFACDDqCqdctsWSt+rb?=
 =?us-ascii?Q?FM6HweL6X6hQWC0dZrJ4YqB6uRmD3DjTa8aZF598jH/2MYUHxnfOWXKqPD4M?=
 =?us-ascii?Q?8A86doN8m0jL/NzitzA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4153ffd5-29fb-42ad-e531-08dbbde45ddf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 16:27:52.7677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: anpkwfrYpkDKNbv/Ne4d6Vlyxt1Df1EqDyUitBppkc1CdcZReHfbumcdG7I8inUQZDs2nPpuncx25bUHbW834g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8104
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
Cc: "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Patil Rajesh <Patil.Reddy@amd.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Shyam Sundar S K
> Sent: Friday, September 22, 2023 1:51 PM
> To: hdegoede@redhat.com; markgross@kernel.org; Natikar, Basavaraj
> <Basavaraj.Natikar@amd.com>; jikos@kernel.org;
> benjamin.tissoires@redhat.com; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> airlied@gmail.com; daniel@ffwll.ch
> Cc: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>; amd-
> gfx@lists.freedesktop.org; platform-driver-x86@vger.kernel.org; dri-
> devel@lists.freedesktop.org; Patil Rajesh <Patil.Reddy@amd.com>; linux-
> input@vger.kernel.org; Limonciello, Mario <Mario.Limonciello@amd.com>
> Subject: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set
> interface
>
> For the Smart PC Solution to fully work, it has to enact to the actions c=
oming
> from TA. Add the initial code path for set interface to AMDGPU.

This seems to be limited to backlight at this point.  What does setting or =
not setting the backlight level mean for the system when this framework is =
in place?  What if a user manually changes the backlight level?  Additional=
 comments below.

>
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 21
> +++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h      |  2 ++
>  drivers/platform/x86/amd/pmf/tee-if.c   | 19 +++++++++++++++++--
>  include/linux/amd-pmf-io.h              |  1 +
>  4 files changed, 41 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
> index 232d11833ddc..5c567bff0548 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
> @@ -68,3 +68,24 @@ int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data
> *pmf)
>       return 0;
>  }
>  EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
> +
> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf) {
> +     struct drm_device *drm_dev =3D pci_get_drvdata(pmf->gpu_dev);
> +     struct amdgpu_device *adev =3D drm_to_adev(drm_dev);
> +     struct backlight_device *bd;
> +
> +     if (!(adev->flags & AMD_IS_APU)) {
> +             DRM_ERROR("PMF-AMDGPU interface not supported\n");
> +             return -ENODEV;
> +     }
> +
> +     bd =3D backlight_device_get_by_type(BACKLIGHT_RAW);
> +     if (!bd)
> +             return -ENODEV;
> +
> +     backlight_device_set_brightness(bd, pmf->brightness);
> +
> +     return 0;
> +}
> +EXPORT_SYMBOL_GPL(amd_pmf_set_gfx_data);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h
> b/drivers/platform/x86/amd/pmf/pmf.h
> index 9032df4ba48a..ce89cc0daa5a 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -73,6 +73,7 @@
>  #define PMF_POLICY_STT_SKINTEMP_APU                          7
>  #define PMF_POLICY_STT_SKINTEMP_HS2                          8
>  #define PMF_POLICY_SYSTEM_STATE                                      9
> +#define PMF_POLICY_DISPLAY_BRIGHTNESS                                12
>  #define PMF_POLICY_P3T                                               38
>
>  /* TA macros */
> @@ -480,6 +481,7 @@ enum ta_pmf_error_type {  };
>
>  struct pmf_action_table {
> +     unsigned long display_brightness;
>       enum system_state system_state;
>       unsigned long spl; /* in mW */
>       unsigned long sppt; /* in mW */
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
> b/drivers/platform/x86/amd/pmf/tee-if.c
> index 1608996654e8..eefffff83a4c 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -79,10 +79,10 @@ static int amd_pmf_update_uevents(struct
> amd_pmf_dev *dev, u16 event)
>       return 0;
>  }
>
> -static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct
> ta_pmf_enact_result *out)
> +static int amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct
> +ta_pmf_enact_result *out)
>  {
>       u32 val, event =3D 0;
> -     int idx;
> +     int idx, ret;
>
>       for (idx =3D 0; idx < out->actions_count; idx++) {
>               val =3D out->actions_list[idx].value;
> @@ -160,8 +160,23 @@ static void amd_pmf_apply_policies(struct
> amd_pmf_dev *dev, struct ta_pmf_enact_
>                               dev->prev_data->system_state =3D 0;
>                       }
>                       break;
> +
> +             case PMF_POLICY_DISPLAY_BRIGHTNESS:
> +                     ret =3D amd_pmf_get_gfx_data(&dev->gfx_data);
> +                     if (ret)
> +                             return ret;
> +
> +                     dev->prev_data->display_brightness =3D dev-
> >gfx_data.brightness;

Are we using standardized units for the brightness?  On the GPU side, we al=
ign with the standard blacklight interface, but internally, the driver has =
to convert units depending on the type of backlight controller used on the =
platform.  Presumably PMF does something similar?

Alex

> +                     if (dev->prev_data->display_brightness !=3D val) {
> +                             dev->gfx_data.brightness =3D val;
> +                             amd_pmf_set_gfx_data(&dev->gfx_data);
> +                             dev_dbg(dev->dev, "update
> DISPLAY_BRIGHTNESS : %d\n", val);
> +                     }
> +                     break;
>               }
>       }
> +
> +     return 0;
>  }
>
>  static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev) diff --git
> a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h index
> a2d4af231362..ecae387ddaa6 100644
> --- a/include/linux/amd-pmf-io.h
> +++ b/include/linux/amd-pmf-io.h
> @@ -25,4 +25,5 @@ struct amd_gpu_pmf_data {  };
>
>  int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
>  #endif
> --
> 2.25.1

