Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28805387AA0
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 16:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E636E883;
	Tue, 18 May 2021 14:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60A46E883;
 Tue, 18 May 2021 14:02:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3wLEDa2j3cQXkBa+fSzjxQLEKWJ8JFF9dn2JuMifmEidQcpxftdKz9mts2ev9y+3XfV/Fvj9WipxaS7QtA43QobfFaUYXvztKNFsJo2wBtbrrcLkG5HoAbOVpwsGJRgv1qi3urAdSreZtr+gI9DGtKmKU9R/0rMuTQYWuyg5QkgKuFjm7V7+FRJ2vjaMNUn7j00MnuSVWUd+Lf9AXbknoIV/6ksauBzvwW5en3l1z54yKsW3TIEAcPGwaQth7xMdXIg0q24KcBBHpwl6Pqrn8s3KIYjCCZtw5vp4tr+W07qhJ3l2brO3ltGK565Ltni6Wtj635BZgl9DAYOxMpp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vxA9p1DyLoldSmU7UIF2BaSpNbKy5LB8PjyD/neGho=;
 b=nSg+nbFWJ/nqfgelNyExkkUQdeZw9t7n1p5eSqfzsJMg5GniJZjm8Mpr2mmpLoDPDYNKkoeuXjOE6EVJRZSfiTwAaCb/iebrw1ZRwnIH++mSan2YCR/wpjz1Dn69fm2vOqXkjFEXiqdnTQWK7ewRCE/LYJ586DOsiWIBV2LQRtzJ1aqHoXsH5HgOPE6hhKWohZqFs1VwdAbszUUCDQA21qAvhMZkHad1i//rURtOWTpYhw7BhDsn1YKr/QaOnVCLojsA7SPJ6q6dgSn+EsqMYLnq/GSnp6djPbLjhgjdNM1ku3HmRyZHsprCGf4FpzonlHPyYQUoYoxER4lODtr5ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vxA9p1DyLoldSmU7UIF2BaSpNbKy5LB8PjyD/neGho=;
 b=wWkaA5Qr+vXPDciXWxpLTD33Uxh33ASJraLDHQInpHYgHrB3w7k7SGa610TLNyJZJoZ1uznep9h9q2DiLi2TJiqVVkuuMJQJdzbiiFSPhY/ynXxnnl2R0Jcaldj6ptWN+Q1wvH8bWEFLJZAfzTIUvIouWhOZ2ebQ/IzLNPsVnkM=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by BL0PR12MB2402.namprd12.prod.outlook.com (2603:10b6:207:45::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 14:02:40 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e%8]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 14:02:40 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "Wentland, Harry"
 <Harry.Wentland@amd.com>
Subject: Re: [PATCH] drm/amdgpu: Unmap all MMIO mappings
Thread-Topic: [PATCH] drm/amdgpu: Unmap all MMIO mappings
Thread-Index: AQHXS1M6N8cxiamYe0ef5VQK9FP0tarpRgYAgAAAJi0=
Date: Tue, 18 May 2021 14:02:40 +0000
Message-ID: <MN2PR12MB4488EBDF561AEED5F0C265D0F72C9@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <CADnq5_M-Sy3cF762044Ub9J=N_U6uQ2h2j40Y=fof04dXL5h7w@mail.gmail.com>
 <20210517193105.491461-1-andrey.grodzovsky@amd.com>,
 <491692a8-a7e4-66db-9cde-f660158ad256@amd.com>
In-Reply-To: <491692a8-a7e4-66db-9cde-f660158ad256@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-05-18T14:02:39.809Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [204.111.139.213]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7dfd3727-1fc9-45b6-76a8-08d91a0599b9
x-ms-traffictypediagnostic: BL0PR12MB2402:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB24024EC5126D4924F7ED7B22F72C9@BL0PR12MB2402.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wdbv27GQENIDgVha2DQ8kqKOvjIXz1f5gYfF6njRirNcEVcpxftG+Rk2L2T9YoSqmjsDIGdehxnUc30vjLETqo6ovwcou66DQFns0mddT2YvYHXJ/4Y2AgaOzxjYiq8gPlMlFQPkvhby91e5MfX9lL/h7TaEH1NrcCJQf7GGh160THK5jN2U3MCSPBzCtNORjYsCh3WQhPAp2bLBgYndP997Vr/VGJpbm3RfnORP4F0W2/TctSAXUVmW9gX83lROMtLJp1soi2bPEa0lsRvXgG+0bGt0a6BIn3cFZDpbIUnc6/y23SCeyOkwJo5SaTIq4Wtie+rho41ayVz3Ba3ECMl93jh3tHmgf3yatf4Z9/BfE71DpQ/SrPkkDj6ziBwClCB2mfhkOIc0YAZ889egnO4Nhff0TbO3Oi+ugP7G4R/p0NrS676YeKUv3S8XCuPVELREfd0eSha9EkiYg7bMtPTmgLEpT4e5AtaB4LNfDHuMJCf1b97+B3LESQrkdDPDnZRNMJ+mPs89sRp88NIFoOcvnFyvQp3WO3Ys45HIgo1zMyxhQmqDoaSQDcT+ejnIH1hnb2x6znoUl0IIzgpioWTIx0Juvja/mYJSNkfMvyM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(4326008)(86362001)(5660300002)(186003)(316002)(6506007)(110136005)(66446008)(122000001)(54906003)(33656002)(71200400001)(53546011)(52536014)(26005)(83380400001)(9686003)(76116006)(8676002)(8936002)(55016002)(7696005)(64756008)(2906002)(66946007)(66556008)(66476007)(478600001)(19627405001)(6636002)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?piuIGabgMi6OGEbjxYYIv73Y1Luj+SIZ2XrdNM4TdQHUdL63/Z2N6AqU/BAx?=
 =?us-ascii?Q?K8kzyv22RT+y8FCXn5KioKHPo6wxiahU88kr9ZjQQqb9AzAJ1xRc0RottJ/s?=
 =?us-ascii?Q?+78xQQ+eiANh/1H9I/bCKG4iX7Sxxet/9iHaGiIUNKD5FxrY09iKUo72bhU4?=
 =?us-ascii?Q?887hy8MAN0gVAhzsTbZ9Yv1JrerpCx0T4PCn9O40606JAGSaY7ToNcYycmHX?=
 =?us-ascii?Q?xLWFQb2Ee8RrsIF9q6WsKjR3SOZwG5RNoz7bUFSPg6wH46RokParDFyjUfKu?=
 =?us-ascii?Q?I2xI9KKBHQ9HR63xFkVK6yo8+EqzB2xVMKN/qc7S6r0YF6pYbQrH5w5cNF2R?=
 =?us-ascii?Q?xYGL4a41SrXP8B4i1odR+32M9sydTmaOJbfSZWHUTR+AWP2lUeBRZxBQE/Ir?=
 =?us-ascii?Q?uv/Tyf0ZHVu/NAwm8QcP93kLrIa1JHC5ZeeO3n6ovO60KY6PXn+QBSK028FB?=
 =?us-ascii?Q?FRCrQwN9paXUPvvPw6nj+jq667OgTR24FelAziiCQ6atSIMxeuZY1GRfAx4x?=
 =?us-ascii?Q?nHDMBMVn3b42ztwMafjs5vM9928yFw/iOlcKT/qyvU9aDx4jgR1xGojvJd3u?=
 =?us-ascii?Q?KbpljICTOmTFz8+NquZbBypfWKTGUz9IYZ7EEnF5lhNgLfXZ7IE/Ldywq+wC?=
 =?us-ascii?Q?rNDKftFzBK7SH0X4CUp8hzNpwcKqO/XFtco3Uo8LAOflOsC9LDQKkABvhNMR?=
 =?us-ascii?Q?4jfbFSHKDT1uMwZ6NMFtqRSuo9MlTnYBC0vVAoNvDC6pvrEWyr7tIngiKOH7?=
 =?us-ascii?Q?aagTDVJyadqat9pJfL1gmiwkCEyrKPRKT2P4/A89crVCHAjTrz+JJl3KBc3w?=
 =?us-ascii?Q?Aqj+iZnCixKPMo/EmTTlHTbtkk/8vk7bccqax+uKrGt49H9h7qOFqwe3KRo3?=
 =?us-ascii?Q?Ldr1mysYYBLXPx4sjW3y48bmaotmz4He2J2PrQBDydvvO5yz3Y7+rTVO9uvh?=
 =?us-ascii?Q?GJEZGX5CSieZZ3WC2rQUEKW/OspDFE21usBf4djr5Z51xyVG1MwXQlPMIASJ?=
 =?us-ascii?Q?EeApeQc57hQfXaXLinx+KAsxVSDTQp/kJZs3GorsAXGY4nKuBk7Pj2FuAXID?=
 =?us-ascii?Q?DiK2gfNKKKuneRdk+cqlyvf0wseN8tPCWwIpjF1jAXIOSoiF1LtD7wYi9w+5?=
 =?us-ascii?Q?88Tl1Wq/IEh52tPYm/R5emVm6HffcRqLX9jvgQfGNgJbalfwpvUER8ol0/8Z?=
 =?us-ascii?Q?8Y8NA0b7DOjqeIigYQq3dv/X28sLgeAcJ3CJjjv0LVOBC9pOaWn8jqCjtaro?=
 =?us-ascii?Q?5B/0tJcIGM4DDMwZLh6ecTMGzkG/UnoZU1E0nXTmvemqBtEJNG8OrdDYL50U?=
 =?us-ascii?Q?nvKmfAg3QX5iEhkL3R7hAsov?=
Content-Type: multipart/alternative;
 boundary="_000_MN2PR12MB4488EBDF561AEED5F0C265D0F72C9MN2PR12MB4488namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dfd3727-1fc9-45b6-76a8-08d91a0599b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2021 14:02:40.4260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1A1X29/Lc4GQVlyR3vzwV0YrK73wt7KLVw84FsnQ7amfRgBl6ECGb5NxtlsWcdP3ZaytXQuIVxMOY6eiBnw1dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2402
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "helgaas@kernel.org" <helgaas@kernel.org>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_MN2PR12MB4488EBDF561AEED5F0C265D0F72C9MN2PR12MB4488namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
Sent: Tuesday, May 18, 2021 10:01 AM
To: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; amd-=
gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; linux-pci@vger.k=
ernel.org <linux-pci@vger.kernel.org>; ckoenig.leichtzumerken@gmail.com <ck=
oenig.leichtzumerken@gmail.com>; daniel.vetter@ffwll.ch <daniel.vetter@ffwl=
l.ch>; Wentland, Harry <Harry.Wentland@amd.com>
Cc: ppaalanen@gmail.com <ppaalanen@gmail.com>; Deucher, Alexander <Alexande=
r.Deucher@amd.com>; gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>=
; helgaas@kernel.org <helgaas@kernel.org>; Kuehling, Felix <Felix.Kuehling@=
amd.com>
Subject: Re: [PATCH] drm/amdgpu: Unmap all MMIO mappings

Ping

Andrey

On 2021-05-17 3:31 p.m., Andrey Grodzovsky wrote:
> Access to those must be prevented post pci_remove
>
> v6: Drop BOs list, unampping VRAM BAR is enough.
> v8:
> Add condition of xgmi.connected_to_cpu to MTTR
> handling and remove MTTR handling from the old place.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 26 +++++++++++++++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  4 ----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 ----
>   3 files changed, 23 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index f7cca25c0fa0..8b50315d1fe1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3666,6 +3666,27 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>        return r;
>   }
>
> +static void amdgpu_device_unmap_mmio(struct amdgpu_device *adev)
> +{
> +     /* Clear all CPU mappings pointing to this device */
> +     unmap_mapping_range(adev->ddev.anon_inode->i_mapping, 0, 0, 1);
> +
> +     /* Unmap all mapped bars - Doorbell, registers and VRAM */
> +     amdgpu_device_doorbell_fini(adev);
> +
> +     iounmap(adev->rmmio);
> +     adev->rmmio =3D NULL;
> +     if (adev->mman.aper_base_kaddr)
> +             iounmap(adev->mman.aper_base_kaddr);
> +     adev->mman.aper_base_kaddr =3D NULL;
> +
> +     /* Memory manager related */
> +     if (!adev->gmc.xgmi.connected_to_cpu) {
> +             arch_phys_wc_del(adev->gmc.vram_mtrr);
> +             arch_io_free_memtype_wc(adev->gmc.aper_base, adev->gmc.aper=
_size);
> +     }
> +}
> +
>   /**
>    * amdgpu_device_fini - tear down the driver
>    *
> @@ -3712,6 +3733,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *ad=
ev)
>        amdgpu_device_ip_fini_early(adev);
>
>        amdgpu_gart_dummy_page_fini(adev);
> +
> +     amdgpu_device_unmap_mmio(adev);
>   }
>
>   void amdgpu_device_fini_sw(struct amdgpu_device *adev)
> @@ -3739,9 +3762,6 @@ void amdgpu_device_fini_sw(struct amdgpu_device *ad=
ev)
>        }
>        if ((adev->pdev->class >> 8) =3D=3D PCI_CLASS_DISPLAY_VGA)
>                vga_client_register(adev->pdev, NULL, NULL, NULL);
> -     iounmap(adev->rmmio);
> -     adev->rmmio =3D NULL;
> -     amdgpu_device_doorbell_fini(adev);
>
>        if (IS_ENABLED(CONFIG_PERF_EVENTS))
>                amdgpu_pmu_fini(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index 0adffcace326..8eabe3c9ad17 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1107,10 +1107,6 @@ int amdgpu_bo_init(struct amdgpu_device *adev)
>   void amdgpu_bo_fini(struct amdgpu_device *adev)
>   {
>        amdgpu_ttm_fini(adev);
> -     if (!adev->gmc.xgmi.connected_to_cpu) {
> -             arch_phys_wc_del(adev->gmc.vram_mtrr);
> -             arch_io_free_memtype_wc(adev->gmc.aper_base, adev->gmc.aper=
_size);
> -     }
>   }
>
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 0d54e70278ca..58ad2fecc9e3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1841,10 +1841,6 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
>        amdgpu_bo_free_kernel(&adev->mman.discovery_memory, NULL, NULL);
>        amdgpu_ttm_fw_reserve_vram_fini(adev);
>
> -     if (adev->mman.aper_base_kaddr)
> -             iounmap(adev->mman.aper_base_kaddr);
> -     adev->mman.aper_base_kaddr =3D NULL;
> -
>        amdgpu_vram_mgr_fini(adev);
>        amdgpu_gtt_mgr_fini(adev);
>        ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GDS);
>

--_000_MN2PR12MB4488EBDF561AEED5F0C265D0F72C9MN2PR12MB4488namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#008000;margin:15pt;" al=
ign=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Grodzovsky, Andrey &l=
t;Andrey.Grodzovsky@amd.com&gt;<br>
<b>Sent:</b> Tuesday, May 18, 2021 10:01 AM<br>
<b>To:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt=
;; linux-pci@vger.kernel.org &lt;linux-pci@vger.kernel.org&gt;; ckoenig.lei=
chtzumerken@gmail.com &lt;ckoenig.leichtzumerken@gmail.com&gt;;
 daniel.vetter@ffwll.ch &lt;daniel.vetter@ffwll.ch&gt;; Wentland, Harry &lt=
;Harry.Wentland@amd.com&gt;<br>
<b>Cc:</b> ppaalanen@gmail.com &lt;ppaalanen@gmail.com&gt;; Deucher, Alexan=
der &lt;Alexander.Deucher@amd.com&gt;; gregkh@linuxfoundation.org &lt;gregk=
h@linuxfoundation.org&gt;; helgaas@kernel.org &lt;helgaas@kernel.org&gt;; K=
uehling, Felix &lt;Felix.Kuehling@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu: Unmap all MMIO mappings</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Ping<br>
<br>
Andrey<br>
<br>
On 2021-05-17 3:31 p.m., Andrey Grodzovsky wrote:<br>
&gt; Access to those must be prevented post pci_remove<br>
&gt; <br>
&gt; v6: Drop BOs list, unampping VRAM BAR is enough.<br>
&gt; v8:<br>
&gt; Add condition of xgmi.connected_to_cpu to MTTR<br>
&gt; handling and remove MTTR handling from the old place.<br>
&gt; <br>
&gt; Signed-off-by: Andrey Grodzovsky &lt;andrey.grodzovsky@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 26 ++++++++++=
+++++++++---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |&nbsp; 4 ----<=
br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c&nbsp;&nbsp;&nbsp; =
|&nbsp; 4 ----<br>
&gt;&nbsp;&nbsp; 3 files changed, 23 insertions(+), 11 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_device.c<br>
&gt; index f7cca25c0fa0..8b50315d1fe1 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt; @@ -3666,6 +3666,27 @@ int amdgpu_device_init(struct amdgpu_device *ad=
ev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; +static void amdgpu_device_unmap_mmio(struct amdgpu_device *adev)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Clear all CPU mappings pointing to this d=
evice */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; unmap_mapping_range(adev-&gt;ddev.anon_inode=
-&gt;i_mapping, 0, 0, 1);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Unmap all mapped bars - Doorbell, registe=
rs and VRAM */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_doorbell_fini(adev);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; iounmap(adev-&gt;rmmio);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;rmmio =3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;mman.aper_base_kaddr)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; iounmap(adev-&gt;mman.aper_base_kaddr);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;mman.aper_base_kaddr =3D NULL;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Memory manager related */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!adev-&gt;gmc.xgmi.connected_to_cpu) {<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; arch_phys_wc_del(adev-&gt;gmc.vram_mtrr);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; arch_io_free_memtype_wc(adev-&gt;gmc.aper_base, adev-&gt;gmc.aper_size)=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp;&nbsp; /**<br>
&gt;&nbsp;&nbsp;&nbsp; * amdgpu_device_fini - tear down the driver<br>
&gt;&nbsp;&nbsp;&nbsp; *<br>
&gt; @@ -3712,6 +3733,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device =
*adev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_fini_early(=
adev);<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_gart_dummy_page_fini(=
adev);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_unmap_mmio(adev);<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; void amdgpu_device_fini_sw(struct amdgpu_device *adev)<br>
&gt; @@ -3739,9 +3762,6 @@ void amdgpu_device_fini_sw(struct amdgpu_device =
*adev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((adev-&gt;pdev-&gt;class=
 &gt;&gt; 8) =3D=3D PCI_CLASS_DISPLAY_VGA)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; vga_client_register(adev-&gt;pdev, NULL, NULL, NULL);<b=
r>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; iounmap(adev-&gt;rmmio);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;rmmio =3D NULL;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_doorbell_fini(adev);<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (IS_ENABLED(CONFIG_PERF_E=
VENTS))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; amdgpu_pmu_fini(adev);<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_object.c<br>
&gt; index 0adffcace326..8eabe3c9ad17 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c<br>
&gt; @@ -1107,10 +1107,6 @@ int amdgpu_bo_init(struct amdgpu_device *adev)<=
br>
&gt;&nbsp;&nbsp; void amdgpu_bo_fini(struct amdgpu_device *adev)<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ttm_fini(adev);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (!adev-&gt;gmc.xgmi.connected_to_cpu) {<b=
r>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; arch_phys_wc_del(adev-&gt;gmc.vram_mtrr);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; arch_io_free_memtype_wc(adev-&gt;gmc.aper_base, adev-&gt;gmc.aper_size)=
;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; /**<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ttm.c<br>
&gt; index 0d54e70278ca..58ad2fecc9e3 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
&gt; @@ -1841,10 +1841,6 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev=
)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(&amp;a=
dev-&gt;mman.discovery_memory, NULL, NULL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ttm_fw_reserve_vram_f=
ini(adev);<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;mman.aper_base_kaddr)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; iounmap(adev-&gt;mman.aper_base_kaddr);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;mman.aper_base_kaddr =3D NULL;<br>
&gt; -<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_vram_mgr_fini(adev);<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_gtt_mgr_fini(adev);<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_range_man_fini(&amp;adev=
-&gt;mman.bdev, AMDGPU_PL_GDS);<br>
&gt; <br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB4488EBDF561AEED5F0C265D0F72C9MN2PR12MB4488namp_--
