Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF50B59E4D2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 16:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC4510E6DA;
	Tue, 23 Aug 2022 14:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-cusazon11020017.outbound.protection.outlook.com [52.101.61.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB24113F92
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 14:03:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4OMSb+u6xANQADckVg5FslHlakQNNQUAI2Se4i5QvvanDzXX9H3FQgwHHI3q74KcgAOY5ZQGwRje9exKiptj4dGdNQ/xtsOj/gDcJnjgBLRYPrI0TO7rqGgs9e1TrLT+QLl0ZCpuHrbgdIlJBflKYg+TwcQsebS4a6V3YPGcZICuwvCDOZVfcYHdsM1fq8P7yfKjmhpqrBHh3BqzSSebXogbSdNLmt0PyEht1ccN8tY3WC6R4dlKujWpzLn6fppdVR/HxE2FI1x8qNDLunRMqxt60kjZStLza1iUbXi4XyjJ+KPWQ8xZiGpx1j9GIfoO7fpMwTYC9GYAv8+lJJbsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCgtZWQEl8hI/2kt3DDKtda185mIT7pHTlxOVcTQgns=;
 b=n9PXiMyb9PnkiWrHa3j0q1joPjH6WpRVXN3j2MzPQyrgKs0FBte/D3gzpdkpJTvSJEN0mzB0oZw6lPor4peHAzECmET2tly8niXqfYFIK7oJAi6Z9KAcEwQaEUzAUuHDXoU6eNeioNzxaaai4pViARcbt3pygGdMrYX5xWZOVrpF9pJ/KaxScPXRPJgnEXsX/vfPIklqn4SKY6uHUlGCLA6CNCjs/YjP2vsxTdODeByvGerl260P/+h1Gejl08Ns0KfUr1n4H1obdpoS+bRsE0pzzkJ0N+VHOBRBgLd/GhtcncuPeqJmSI4iiSOCrMyQrX0gw5p1afrO/b1LEUUf+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCgtZWQEl8hI/2kt3DDKtda185mIT7pHTlxOVcTQgns=;
 b=gMEx/nZeomot2lgk4PZPUWg20RSFf/t85w84I5UJCV5gFbCnnL20rqTZ2IcEiB18qcOplKA6wYRqk6/Cqyxtni9tsS+6+9Zm41bzMQRecfSrOatUlRYHy1L4P2Gb0jTjZxnYm+DmUzQMMDo0gx41fyUnGUv1ZXxQnSREaeCasac=
Received: from PH0PR21MB3025.namprd21.prod.outlook.com (2603:10b6:510:d2::21)
 by SJ1PR21MB3432.namprd21.prod.outlook.com (2603:10b6:a03:454::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.2; Tue, 23 Aug
 2022 14:03:08 +0000
Received: from PH0PR21MB3025.namprd21.prod.outlook.com
 ([fe80::e848:505e:d1e3:97a0]) by PH0PR21MB3025.namprd21.prod.outlook.com
 ([fe80::e848:505e:d1e3:97a0%9]) with mapi id 15.20.5588.003; Tue, 23 Aug 2022
 14:03:08 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: vkuznets <vkuznets@redhat.com>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH v1 3/4] Drivers: hv: Always reserve framebuffer region for
 Gen1 VMs
Thread-Topic: [PATCH v1 3/4] Drivers: hv: Always reserve framebuffer region
 for Gen1 VMs
Thread-Index: AQHYsw5cPiTcV0+faES8GhliJCwvRq28guxA
Date: Tue, 23 Aug 2022 14:03:07 +0000
Message-ID: <PH0PR21MB302530363C951EDBA3A3110BD7709@PH0PR21MB3025.namprd21.prod.outlook.com>
References: <20220818142508.402273-1-vkuznets@redhat.com>
 <20220818142508.402273-4-vkuznets@redhat.com>
In-Reply-To: <20220818142508.402273-4-vkuznets@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=1e353ae1-cea8-42b4-a9fb-70bc5ed143ef;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-08-23T13:30:31Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd68880c-3b39-4e41-cff4-08da851034f2
x-ms-traffictypediagnostic: SJ1PR21MB3432:EE_
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vy+ShVa/Qva8aPewYrcEkyj97MoZduhPAH5f8dZOF3OsZMCNsBLYtoRnX5t6LdzKuYEuAoFGJzoxZQlxwTR+eHOmYhZ6e+b2nEu9YYmW91R/YrqdDYMFigFoZcuhWO3nUYV0yMZjyIgh0hSJZuS/XEdfuK/Ayhqjyg9g6DnUtckAMCyDAVp929HkFvA64v4mZgtCJZnIgpYytv/EKFu9+tWNQ7IE0K4lkhcISQ49NfF1fR/ZX4IyFXcL7JreNZbNQZpGSdFQx+l16oTItgdnOsE/0YGqQVnK6Jh3dvlEkP52Eu+V3ay1qHoVkWzriQyEr/gx0Ow/ScUn7lWhTM6BUKb4IESnUfZttfn0Xeut24khVGzfyDM80zSypsP/lzpT02mMSEbB5j+eIW18+N7z7jjg5xOCWBNrqbvZRko4oc1/4WGFxYB3qdBPesoXDer7ZtC0NqzZDFTnzSPBQ4OSsaZNh/A2igzywCk/NNrIeyyW66VNmRWwffCFypt5mUAxnCtz2tRks6MjGzh8fWSOu8vFE3dfbx25loI1zHWnpG0SgYlBP4oV+vB5lKRNZr45EKx5PEQYFQj1OxdY9Eu9Jh1+Ot37tLat43vFo4tty2A6PiIAaEBy8VIpE0e90kSn5idmCT+eBtROvC5UcxZJtf7q62icJ8e3lBwjiNZk51ul3YO64blduZdCt+h7g4YC41p1qW+lW1mpXged01F03oGXxkCdGgBOuTmNC5SyjaIK5J69nPDRwKSkjzk/kJwmMO/lnXa0mCG5alF09GJxkU9T+jIcaghIL6vl5S9fiwVMS1xKwHeAA7DnPhEeGODZ6qLa9Izyf0Dw9/8HLKcFP59wQ+2sBz+606WEmNb1ULY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR21MB3025.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199009)(38070700005)(10290500003)(55016003)(52536014)(82950400001)(82960400001)(86362001)(64756008)(66556008)(66476007)(8676002)(4326008)(66446008)(76116006)(110136005)(54906003)(66946007)(316002)(38100700002)(83380400001)(966005)(478600001)(186003)(71200400001)(26005)(7696005)(6506007)(9686003)(122000001)(8936002)(107886003)(8990500004)(33656002)(5660300002)(2906002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yTOIZdTz9KSuPN+k9tOZj2Ps4oLx/2zJzWAVqOv0C4z/fE51jQG8PDt13+Iy?=
 =?us-ascii?Q?16k1APA2zpt+0a9Cccgdu4573WnYPdCDm/XCZ7KrYvPc5il0MJU63UWbf5bl?=
 =?us-ascii?Q?MAKVWSsAdtnhgzzhlbSbyne6BsRILZMsbRc/orYoZisSp0aRjltmkwxN7HlN?=
 =?us-ascii?Q?Qnz1Gi8+nd0Y0lUg56yA5O6KmcIvJxAyvYwhXqTZu9YI2cqals0aI40s2eT6?=
 =?us-ascii?Q?KWG7O6w6H+FmVl+A1gDdvXNqdlUoDSldPtQE7+Q/CB6VjJWH5mh2L8AdoFXN?=
 =?us-ascii?Q?gfJzGNRH5gx5uAJ05gMHVYuyspd85Gw6YCZrUQEMBd76Q5yEdPtG/QMT7Khg?=
 =?us-ascii?Q?b9dsiPnq/lfxyOiYUHaQXUBySDvQn9FLZUETP542i7/O8z/X1Q4eFJKdNmFn?=
 =?us-ascii?Q?ek3eepE83zIY89Zffw4YR9y9EOWvWMl7Epqu49Y9gRofrFT4tiO4nyBUQTeQ?=
 =?us-ascii?Q?1o41RI2vdSAbJECxmrm3sBHM4h4ugzuVXCiZo04UdUfGNhf5U4ofgNKWZP+N?=
 =?us-ascii?Q?PdZFC/wP6g20dr8Y8GPpljYofZCWT0T1pBtm78xfVI2erNe5YmCaUljhiZDC?=
 =?us-ascii?Q?VqVGbxl+/z6K42Y3K/9PU5dGykweNl4Mgkv8RFBTDklmwxS8yAGNYahtAXQz?=
 =?us-ascii?Q?5aFAD2RnNK4/a/eq5V+Cr9MYlnDaxnRXGhHLrYf0J9ujwnnzCOtSdEZun33V?=
 =?us-ascii?Q?6qlDWJbeXkTyf3TRijhUfMs3mVUA/TcUKW6Tng5l8iF3Ul3C8O+jfadb/bep?=
 =?us-ascii?Q?NSi7Gn7u9UobsHls2jvOy3sheKsJweqYAwKU4qQGJ87gVGobZKPoodWoU5FV?=
 =?us-ascii?Q?NDMeoEot/30gvr5cQIfmmvTYBMyG+cUNNkffQFFckHVjn5w20CDeZqs53gAf?=
 =?us-ascii?Q?CJ6kG2OfBH07OMefdd2cgJFN0pfLkrnOvqMC2Cmqfx2R1+BKsLQCiVWWEe9K?=
 =?us-ascii?Q?MqlklE0MDJaX72JT44SI5krTtAvpx+B+r842e83vTGyrChdPiJj+lxfvt8Og?=
 =?us-ascii?Q?eiKMvNvVwhNpafPhUFtFI0y6DeYdNjtglniYTK2NFWrbUpYxPPi9Lwvadm71?=
 =?us-ascii?Q?r4UWyjVwyg7yN+TOgPKQx0mWJUoqRTP21xkNjEfWYTe2BDexjX1YyxZq1qC5?=
 =?us-ascii?Q?cXjugCHotN9ncfAjB9TZ57I0M2XITSDtk5imFcguecfmcqZAm5wAaU1qXxiy?=
 =?us-ascii?Q?AR6v4SfL42+8DiiBlgjSGE8rrlpS5x+/f7GFvbn40e4/w+rjC3C3srg5bkJZ?=
 =?us-ascii?Q?7lcCpNQ1i4oXvGBG1cVcMmzogHh620V6J8e4G9tzxzcN513afTsDuLoZ5DE/?=
 =?us-ascii?Q?zLDdDi6uTkUPioORntzJ3ok4zwaxNVCLXcwWVbXsqGUhsQlN7htarfg2nfQu?=
 =?us-ascii?Q?pAowqxLq7eiQmbfMnBg/CRi8JE7+4fNP2zgdOyUMb1door5EFB+oy519gzcC?=
 =?us-ascii?Q?M05eOtx4EIGhXRwTD8n4UjVhcjHcOi0U9mL4epm5tJYGNOYaWPwg36Hl+RKf?=
 =?us-ascii?Q?Hvcmuq6KNOPTYPSxMejh/YhKFMynLsF0m0UX3AqiQ7nCgn++dqXRWGaRFVtK?=
 =?us-ascii?Q?FR3W5tjZQe/qaM7i9wmVvp+8TU01bWmxFGAaPHGonr9asV4AhBqDLLlb8738?=
 =?us-ascii?Q?Hg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR21MB3432
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
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Deepak Rawat <drawat.floss@gmail.com>, KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com> Sent: Thursday, August 18, 202=
2 7:25 AM
>=20
> vmbus_reserve_fb() tries reserving framebuffer region iff
> screen_info.lfb_base is set. Gen2 VMs seem to have it set by EFI fb
> but on Gen1 VM it is observed to be zero.=20

FWIW, in a Gen1 VM, whether screen_info.lfb_base is set depends on what
grub sets up, which in turn seems to depend on the gfxpayload=3D setting
in grub.cfg and certain versions of grub.  There are cases where it is
observed to be zero, but from our experiments it's not all cases.

In a Gen2 VM, there's an edge case where the frame buffer has been
moved, and a kexec() kernel may see the moved location instead of
what was set by EFI.  See
https://lore.kernel.org/all/20201014092429.1415040-1-kasong@redhat.com/

I think these points may be worth recording in the commit message here
so that there's accurate record for the future.  The Hyper-V and grub
idiosyncrasies make this a very tricky area.

> In fact, we do not need to
> rely on some other video driver setting it correctly as Gen1 VMs have
> a dedicated PCI device to look at. Both Hyper-V DRM and Hyper-V FB
> drivers get framebuffer base from this PCI device already so Vmbus
> driver can do the same trick.
>=20
> Check for legacy PCI video device presence and reserve the whole
> region for framebuffer.
>=20
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  drivers/hv/vmbus_drv.c | 47 +++++++++++++++++++++++++++++-------------
>  1 file changed, 33 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
> index 547ae334e5cd..6edaeefa2c3c 100644
> --- a/drivers/hv/vmbus_drv.c
> +++ b/drivers/hv/vmbus_drv.c
> @@ -35,6 +35,7 @@
>  #include <linux/kernel.h>
>  #include <linux/syscore_ops.h>
>  #include <linux/dma-map-ops.h>
> +#include <linux/pci.h>
>  #include <clocksource/hyperv_timer.h>
>  #include "hyperv_vmbus.h"
>=20
> @@ -2258,26 +2259,44 @@ static int vmbus_acpi_remove(struct acpi_device *=
device)
>=20
>  static void vmbus_reserve_fb(void)
>  {
> -	int size;
> +	resource_size_t start =3D 0, size;
> +	struct pci_dev *pdev;
> +
> +	if (efi_enabled(EFI_BOOT)) {
> +		/* Gen2 VM: get FB base from EFI framebuffer */
> +		start =3D screen_info.lfb_base;
> +		size =3D max_t(__u32, screen_info.lfb_size, 0x800000);
> +	} else {
> +		/* Gen1 VM: get FB base from PCI */
> +		pdev =3D pci_get_device(PCI_VENDOR_ID_MICROSOFT,
> +				      PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
> +		if (!pdev)
> +			return;
> +
> +		if (!(pdev->resource[0].flags & IORESOURCE_MEM))
> +			return;

Doesn't this error exit need a pci_dev_put(pdev)?  Or maybe reverse
the test like this, and the later check for !start will do the error exit.

		if (pdev->resource[0].flags & IORESOURCE_MEM) {
			start =3D pci_resource_start(pdev, 0);
			size =3D pci_resource_len(pdev, 0);
		}

> +
> +		start =3D pci_resource_start(pdev, 0);
> +		size =3D pci_resource_len(pdev, 0);
> +
> +		/*
> +		 * Release the PCI device so hyperv_drm or hyperv_fb driver can
> +		 * grab it later.
> +		 */
> +		pci_dev_put(pdev);
> +	}
> +
> +	if (!start)
> +		return;
> +
>  	/*
>  	 * Make a claim for the frame buffer in the resource tree under the
>  	 * first node, which will be the one below 4GB.  The length seems to
>  	 * be underreported, particularly in a Generation 1 VM.  So start out
>  	 * reserving a larger area and make it smaller until it succeeds.
>  	 */
> -
> -	if (screen_info.lfb_base) {
> -		if (efi_enabled(EFI_BOOT))
> -			size =3D max_t(__u32, screen_info.lfb_size, 0x800000);
> -		else
> -			size =3D max_t(__u32, screen_info.lfb_size, 0x4000000);
> -
> -		for (; !fb_mmio && (size >=3D 0x100000); size >>=3D 1) {
> -			fb_mmio =3D __request_region(hyperv_mmio,
> -						   screen_info.lfb_base, size,
> -						   fb_mmio_name, 0);
> -		}
> -	}
> +	for (; !fb_mmio && (size >=3D 0x100000); size >>=3D 1)
> +		fb_mmio =3D __request_region(hyperv_mmio, start, size, fb_mmio_name, 0=
);
> }
>=20
>  /**
> --
> 2.37.1
