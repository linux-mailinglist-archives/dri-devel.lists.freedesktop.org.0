Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 131D55A1493
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 16:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F41810E0B1;
	Thu, 25 Aug 2022 14:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-cusazon11020019.outbound.protection.outlook.com [52.101.61.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADAC10E091
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 14:43:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWMOp/jStlsHXWRTwXaK72serNjyDNu6ja/YDy5yjpc4nJwH1lrhk81qZn7eDddZkwU6jSRValJhksyXSW6edsd9jSimZMkU+yDbWMQgQDFm94C+vAaO2mZgr8XqFkAWwOSsYhjZzGObkZoRuoW282gsEo52KKu1dzy1D0u792gJNnraMawvUS7bGf4fx4Nm+qN5TSFT/8210HMgmzgbLrONX3HKUOzZN0KI++ASGNQdUmVNsKYmxfYlKUE6CVQ8AkFEbg/15afggBOEeKjOfjkv3NtfKi841Sy8lVBLkoVyoB08Cw8VR45hcyBFOD2S2OcAcHpKoBCUqhJQgPi2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTZufm6AKxYcSLvaaUFWsDx2HbfXgOUmSBS5eJ/QqWY=;
 b=ad2Q9JBnY/C3LfGtjBu+9mBeRnSNPAwFDwUwgThPyftTv2hk/ySOvwJD67K5yotFKNc32Z6bnjqi5sU7EMsy1Ph3SlkqIaocTRtUaozGhm1pe3B5s6MdSxy9hshupVkkX/QZgz000pPQMwPgapdxvie1HQb8csMWN92OfHz0xx4XYt/8OOmBzz7EuXc/tY9Phmumv3IUzJ+rQ6xSdiW51dN/2z236rzIl/h/wSNi8j6r1XIlirx3C5laUGM3diw76lg7sNms9+FHJ1uh7yP0ScKehZ8aUhmX6C/Hslkc3gTyEwqB7Rk1LsQ/08Jw3vScrtFxG9v/1tCWr7HLjD+j8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTZufm6AKxYcSLvaaUFWsDx2HbfXgOUmSBS5eJ/QqWY=;
 b=Qqcycn9rCWSmfxTvNU+Y5qjC8eDepNhLJIkX91j2dnxfuksZKUrJQhDLUYhzh/vSLrAzlupl5576II79uBm5W8/KhhvaUEELOWx+N925wnPh86b2ArpXQwz++5dCkgK4VbD5neTf0rirT/RMIMjQXn3DXDnZh8z8SiriJRS6huw=
Received: from SN6PR2101MB1693.namprd21.prod.outlook.com
 (2603:10b6:805:55::19) by MN0PR21MB3312.namprd21.prod.outlook.com
 (2603:10b6:208:37d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.4; Thu, 25 Aug
 2022 14:43:36 +0000
Received: from SN6PR2101MB1693.namprd21.prod.outlook.com
 ([fe80::6485:465a:309a:2205]) by SN6PR2101MB1693.namprd21.prod.outlook.com
 ([fe80::6485:465a:309a:2205%9]) with mapi id 15.20.5588.004; Thu, 25 Aug 2022
 14:43:36 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: vkuznets <vkuznets@redhat.com>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] Drivers: hv: Always reserve framebuffer region for
 Gen1 VMs
Thread-Topic: [PATCH v2 2/3] Drivers: hv: Always reserve framebuffer region
 for Gen1 VMs
Thread-Index: AQHYuGEnYm68WBTqDkm/tYRDcev9Ra2/r5OA
Date: Thu, 25 Aug 2022 14:43:35 +0000
Message-ID: <SN6PR2101MB1693BDB6EF855BCE594AE376D7729@SN6PR2101MB1693.namprd21.prod.outlook.com>
References: <20220825090024.1007883-1-vkuznets@redhat.com>
 <20220825090024.1007883-3-vkuznets@redhat.com>
In-Reply-To: <20220825090024.1007883-3-vkuznets@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=fc82dbbf-bef1-45b7-8c27-1c192e732641;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-08-25T14:37:14Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a5897c2-321e-4169-528e-08da86a830f1
x-ms-traffictypediagnostic: MN0PR21MB3312:EE_
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FJjYSmy6ziBveaP+g50az1QVegMlCcypg24qRGlvBL8WKj/93zhnfe4MCtU4woxJeYguzE6yBqN8Y4MfTCqBVxeFd5tzHu9EyanbpxCFGEzyZQGVIgfBXIU+ssOKAkuQYVvcia6DqQrOPUqB6d5D5lQ8Chr6XRadPbtE3ZU0eco2okbMel2OTwsgYfkg8tVkexD4ue5IpCCN3fw+jYkl56jtOKAQpU+qyF6KrOWlvOYtdAfypE1QlpruijEquBWEObxqmoR/Uz5GT0Sv7OE+O2bDRCcwBTKKou716HCgsT4T7RwYBEaS9VtMOK2Ep7BzPK6uILy622z7CumjdPWV1E3oosVtPOUcOfb+KV6T2GEOqJ37+ajd+cuU3t+LeZL+QCUiTOyYh30L8KAibHWXzWxZB7B1TAFbUL58VlUpK6nkWYJo9mXjZnZNVAqSdjHKwzsjGv0M+XarBV0qUGWpHsdQoE92dh+4NcQIJxg0WIxbxYPlPiN8SO+RBw0ie7s1DyCFWUJIMyNO11k6eF/fPoCbREIMQ3uoQWNKDEfhBQFusQ1rokcdDzlpMvY2x7zQ6n+BZOYNGDMNiNSmi5544F8siBUwygBD4k9zxX5Y4OdQzLjimhiIhaFKMViNyfvAYNsXf+Gp2pZApwNfrdgN9tLAh+pZqngl7zHxAy6IdZTBpx6aMXFbUr9yu7bvPhB2StMs3gEEkHC86rxqetVPuY8hESDrWWR1JfyBHqp1+h81srLsrJU/ctymJ0neVb+XqPasrlu1fdeJvWyjuC5lnsrzvtBghPT1Uk/idhdgYgnhChdKLNfiAesreHPmnkVnxjRsEIm2cO6NBG8ITS2zncRhE+BOSOnWE++MrXOpJuQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR2101MB1693.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199009)(86362001)(82960400001)(82950400001)(38070700005)(122000001)(316002)(38100700002)(76116006)(54906003)(10290500003)(110136005)(66946007)(52536014)(2906002)(8936002)(5660300002)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(8990500004)(83380400001)(186003)(107886003)(966005)(41300700001)(71200400001)(7696005)(6506007)(9686003)(26005)(478600001)(55016003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jxK5pvhkYc7aCMEf3fDKHWL3jflk3bGbkoZ647/WH1mziaV+xOQUxJNSsxk+?=
 =?us-ascii?Q?vjE3Iy3V+f21qRyzn0N/Evrh5Zy/a2JIPMQpUAxvgG765klMZDHVbMdmgGi4?=
 =?us-ascii?Q?8PO30/H4LRJqXq+eVEqwsXSulRxT9DwfRKRr/0/zwX8aBk8fgmf4KEAQ1l23?=
 =?us-ascii?Q?ctxxCntfZdtBDfudtSODoxahAE7YvOU/WPWWgZIoN4xbXyJ38UQgQbnOJdrw?=
 =?us-ascii?Q?YHJrcO+6V/vfZJr4ZaNoPexfVoAZQx5XtL9ARchz4m3wR8LiaMizVUpR17OS?=
 =?us-ascii?Q?55emQdtVE1Rtn7bFn+rkpf2/shm2Fn9ZIx+21Ao1oMFJcaTMpZZ3iP2JFMlT?=
 =?us-ascii?Q?6AK4uBsupzcjhE3VXwjlJ7XerN/N8dKPKt9F0e+7+ro5VDyfhw/oHEVF8bKX?=
 =?us-ascii?Q?Cjk6LPUj2ILEkSnw2ylphsBC06xatyyFbrhtI5lRRo6pU61aQEUc3z5ambs1?=
 =?us-ascii?Q?vJ/jU4hT+axg1cWmbJw//fHuJWAHwJL2FrvsaTVY/JDW5n5zBVaICgQ5HKxV?=
 =?us-ascii?Q?e0GK98B7VWbIBKBB6fbohvus2iheIfpIDmeU6vhg+taVnBxxdH6hNlQ7VxAp?=
 =?us-ascii?Q?hdOfK7vDVa1QG4U46QZ/AWLvgvznVVvwF1I9F42lPiwv3Qzqqllhb5lEz2oF?=
 =?us-ascii?Q?By70fNQLhJHn3HIV5vcjOmjLvFn/LR+bcrD5nTQaBRQK43g/ArUBkrzn/upc?=
 =?us-ascii?Q?ShzywCgZOHIfZZiMSHfFwd+krINtn7bqAFR6Z05RiOphSDeZ08LJWRS/IXQ6?=
 =?us-ascii?Q?HQtJQE3CsJs6TuPcw5NkaQL4kunzHkA6J9jYzxubmlKYhUZaj1ufx2yXibUY?=
 =?us-ascii?Q?G9RcLNrdNpYrtHA2Sn5lACnUpgDOa9VHEJJ/9ldtfaQJ9lTY1K81MFqIVl6R?=
 =?us-ascii?Q?irXAlHPMjuHyT3SG7NRiLqZRvfUIcxYjqX2T82HixAKSKSbtiYXZSMNdj2D1?=
 =?us-ascii?Q?At05twZgAAyB6foXsPBFqGEwmDScZlIt4Ea0ROGlyOxTZL0EwmMe2nXyAJzy?=
 =?us-ascii?Q?WMnQbcnDXywsVMzkZEGQ7OocTer1slNP0wEmL3FkcuHUPRCMtmJgySRUx+lr?=
 =?us-ascii?Q?eCf4w+mGERjEYE6+skbSi701sKQod0CXEcpo+2iGMbiOM2j/SaXDGb+FXv26?=
 =?us-ascii?Q?YvGcaiaQYlCxdM65RxCNx64zluPwqYTE5YhXg2VTEOm4TS2xBikofA+7cwBq?=
 =?us-ascii?Q?ZLnwiymp6LWC2HzSW4xah9LSmR9b8r7brxc6XS/8T+7bW5/EgQ3bx4JeZoi5?=
 =?us-ascii?Q?eAyztooFPvVxdupIhi4nD8VkzmFsmulpChqF7MPoa4w1uvKtCmkvqHp7MlNn?=
 =?us-ascii?Q?p+0OpqK9/Nh/dMsHBz68do3lYLgkaEcOTjH6R3HWec+zbgGfzm++NX0K0zln?=
 =?us-ascii?Q?krxTdEzFoIpAXTos2C8lU4nfEwDBseqzSOd/4SK8j2YH1sUd/P4QHYSIQ8tQ?=
 =?us-ascii?Q?p9ZkHnWFIHgcXSh1H/S4gPJ4PGOD6xXV4xt6TzPBgxNXJNFhAQhfaWVxTY+l?=
 =?us-ascii?Q?AIEGBVJ2uANM6VJzOzpdrcGWnf5UpMGaFzVrgetARIGHvutg+KeSWUsEMBG1?=
 =?us-ascii?Q?lMBg8AKD9oj2FrvCIgX4S2h8fBxklI33KwS7FHNxO3h/kKGJgujzUx2Lmnza?=
 =?us-ascii?Q?eg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR21MB3312
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
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Deepak Rawat <drawat.floss@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com> Sent: Thursday, August 25, 202=
2 2:00 AM
>=20
> vmbus_reserve_fb() tries reserving framebuffer region iff
> 'screen_info.lfb_base' is set. Gen2 VMs seem to have it set by EFI fb

Just so I'm clear, by "EFI fb" you mean the EFI layer code that sets
up the frame buffer before the Linux kernel ever boots, right?
You are not referring to the Linux kernel EFI framebuffer
driver, which may or may not be configured in the kernel.

> (or, in some edge cases like kexec, the address where the buffer was
> moved, see https://lore.kernel.org/all/20201014092429.1415040-1-kasong@re=
dhat.com/
> but on Gen1 VM it depends on bootloader behavior. With grub, it depends
> on 'gfxpayload=3D' setting but in some cases it is observed to be zero.
> Relying on 'screen_info.lfb_base' to reserve framebuffer region is
> risky. Instead, it is possible to get the address from the dedicated
> PCI device which is always present.
>=20
> Check for legacy PCI video device presence and reserve the whole
> region for framebuffer on Gen1 VMs.
>=20
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  drivers/hv/vmbus_drv.c | 46 +++++++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
> index 23c680d1a0f5..536f68e563c6 100644
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
> @@ -2262,26 +2263,43 @@ static int vmbus_acpi_remove(struct acpi_device *=
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
> +		if (pdev->resource[0].flags & IORESOURCE_MEM) {
> +			start =3D pci_resource_start(pdev, 0);
> +			size =3D pci_resource_len(pdev, 0);
> +		}
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
>  }
>=20
>  /**
> --
> 2.37.1

Reviewed-by: Michael Kelley <mikelley@microsoft.com>
