Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C865A15BB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 17:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D8C10E71D;
	Thu, 25 Aug 2022 15:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-centralusazon11021025.outbound.protection.outlook.com [52.101.62.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B648C10E71D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 15:29:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dM0Q0OwSAQ/VvDkkezHMEWwXem3EVmXfRzEOzOHUpoNHQ77AA9LT06N+iK+3tdvIKQBJe1wcuFyLbgRRpvwnLO3EUzy6SZSOZOn8HHBUQnsUklntyZJRSnU4Xee+zU3bNB8HFi6Tcl7B8dS3SMRd2JS69UhcQ6J1O2839ff/ppgfuSINERco5Z+CSdkg5gNLsPjAd03t0nFXPPEktqW81/wMN3GCWBurDKrOwSvpAvkGKX/ca/tc3k9oCfhLGbMNhgDCkgjvggWucEdoJ9xGcOcG5L2pXP7oU3NMtteJS7MztSZKn5o2XgR83DVyGwNUru7lq0jxgKFvSjHx0rip+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnnSnkD1/B+DDzfBHARNasYhFnd1LcahDuTTGpfP0bo=;
 b=Pap/Y90dJ6+MnwwzcpqXE7gEnoNAbryvunOHig/zQhLQVo67cIMeVQJHmWqTNCa9BwGOhiUQ5SaflXATNSG9mzHmDXbxA8nsHlT6m0bqS50lOG4MmZ2NwZGy8mKhqgF616Lar97MgQVP2of/DmRv0G2+doqO3eYPlUvdGWSMF0DSplliZCa4yahuyAOLZLosuJ7PMwh07IX8pmJhe+wKaZgRwwKHvaNCRbqPSxcKguYAJ11iAgwoTZumf4oCE+SUvKZNT5+p9xWV0fNyJpkgUDIkwGjSVQRUkBtarSku8EYC80sktoe9zR8r/aRS7GU1k5Z/Y+xrQWxcLSzY+4VtKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnnSnkD1/B+DDzfBHARNasYhFnd1LcahDuTTGpfP0bo=;
 b=MlDP+iRppIqtISfe+JqS/Lrkjsncw+fifQSKHiG/eCa/gOC1Yk5/Ndbp29Et8vOg6fuTt8gP0+aIpvVtNb4LXDmNtjwzqgLVvMvL5TDaO0/hUMKD6EmZPXQXXNoXR+R10X4ftIZXtA28AO6d70oU0qfkOpmxZuzRBa1chdzDWf4=
Received: from SN6PR2101MB1693.namprd21.prod.outlook.com
 (2603:10b6:805:55::19) by CH2PR21MB1415.namprd21.prod.outlook.com
 (2603:10b6:610:5c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.4; Thu, 25 Aug
 2022 15:14:00 +0000
Received: from SN6PR2101MB1693.namprd21.prod.outlook.com
 ([fe80::6485:465a:309a:2205]) by SN6PR2101MB1693.namprd21.prod.outlook.com
 ([fe80::6485:465a:309a:2205%9]) with mapi id 15.20.5588.004; Thu, 25 Aug 2022
 15:14:00 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: vkuznets <vkuznets@redhat.com>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] Drivers: hv: Never allocate anything besides
 framebuffer from framebuffer memory region
Thread-Topic: [PATCH v2 3/3] Drivers: hv: Never allocate anything besides
 framebuffer from framebuffer memory region
Thread-Index: AQHYuGEpE7d2RJafr0aU31Hf9TT+aa2/sWyw
Date: Thu, 25 Aug 2022 15:13:59 +0000
Message-ID: <SN6PR2101MB16935E50795FAE1FA352C416D7729@SN6PR2101MB1693.namprd21.prod.outlook.com>
References: <20220825090024.1007883-1-vkuznets@redhat.com>
 <20220825090024.1007883-4-vkuznets@redhat.com>
In-Reply-To: <20220825090024.1007883-4-vkuznets@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=16b759a8-9e5e-4d5b-ab37-78573037021a;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-08-25T14:43:50Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f4fdd53-3438-4e0b-67da-08da86ac7013
x-ms-traffictypediagnostic: CH2PR21MB1415:EE_
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZgScatdKgtGc4l9xF63z3G5ItuQUbZcJCz/Fz9zstXviJha16IejeaXP4y5Ng2goowiR7UoppEj5r6oxcy5WEpxyZP70i4ZoTe+qa5meH2p1bl6eVsi37s1IPpJVHpbULHCbubqEUV4er/6RhN8RozArli3iKOspdEzXYR1X2qbIiG46G6OzHqvD5Euwqaiwhfpzd9peQ98fba1XPGi7Y0YZTGOp2VG7BFsv2fr+8tjqynwitczklx49O8nZi2dG5fhqb7Mz+U4u2DVyb7aUnD7aVujV5hMKUiONR+p3RrjxGzh1V3Czu4TfUdJmzb+7A59iF+uERTviqtlf761fKFYA3r0OV6X1qwc2mNSDCkRZBfkYJndf8oU8uaHYRgrQzhcGwBqJVv9NmtWbd56Y82eMJMjrcebOCETnVowuDg0qoUt2jXajICcvMWuNvsOQygsZ4M9Dos5YTymAkTpLLjfVOE8ZymsfntvbR4xLWO8k9KNSEoAr53GUGEusFXE6A68OpWSEMPGqByzt8nzCTE0JAxhtZjpBoXxmGe0qTF/YyohiCuU58u9dFnch3MpT8cy0k3qUGV3YCPaiirL+mw3iVIelF7NZ3PYoIluroKBb2aOZ7JYZxqo0hhU0ejX9V+BE84pFiLllTP0/ejkQs0cTDo05kMPbhn92l9YDi+lOvP7JT/u+nKDSvjFa5OFyk5mYUASj8nS8AkH1Bg/FtODIngIBB5LgmzLp3H6yo5hHMwdm5mg/wQVYZW8xzZ8C4t1ucxfrE1CT+vq5HST1Yp82pfi8gsIzIIE9xVL3CAa29bKW2PWIszPBsQ4io+w9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR2101MB1693.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199009)(10290500003)(41300700001)(54906003)(110136005)(9686003)(186003)(55016003)(8990500004)(83380400001)(26005)(7696005)(316002)(2906002)(71200400001)(33656002)(38100700002)(86362001)(4326008)(8676002)(478600001)(82960400001)(82950400001)(64756008)(38070700005)(107886003)(66556008)(66476007)(66446008)(122000001)(6506007)(52536014)(8936002)(5660300002)(76116006)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bigEWlQ5T22QzEClm9ajNLZDdhY+zyR2ZtlC8q75p6n667Ue4CJ+MyKUuZNt?=
 =?us-ascii?Q?bD3UuvNYb7fw6dgAtX3IAVJi72Ubs/lB6eT/oS9K7caPjztEhxvpEzsj+gr6?=
 =?us-ascii?Q?/0LQ1TX6h3MgECC0xjda8sQWJjRWVl+pmLp8gLoBVUWFHyuIcMbwXedu7wDE?=
 =?us-ascii?Q?iooiOQMIuAAp1hGsxGCgmh5jC1oGQ5LTPplpSa4hV91Nx++LIp61tKlHQbmb?=
 =?us-ascii?Q?tFPNVyDzY+EYBQUsgSZm4nZNmduRWTeQid3P5lkKIKwY3q2whUrLYX9ozPFY?=
 =?us-ascii?Q?3hkz68QnHZgfIjJ57y7fuCYkvyeIgh5zQ/KQPm7rRkm9//uuMvC3Fy1jWqim?=
 =?us-ascii?Q?im41q0b54OzVIeNNi26oSgL4nU8WFYwxruJrQ7aFUtY3HkFE/Sgf7FHOYmWj?=
 =?us-ascii?Q?MSWOHKhAEWzOAXtohEtV9Yw4I1SaS10oCNKb0eUoIS0ua87UEUCjTAx0yaEH?=
 =?us-ascii?Q?GDd3nJG+NrCqwRdVY0NKMQbu5Uo02b/lo5f8QPJW4chnH+uSQL6c/LVtTR9c?=
 =?us-ascii?Q?jAE9eM2swcJMFXQm0ZkTXeLsEba6NuPGY+BI4NmSSX+RfED83JYt9mBWy+NC?=
 =?us-ascii?Q?xO4kL9W3XDIWMvntrsy1CGJpwNsuxDKjI1m2hOpVZ0hIcbiS19xAIiWlzw2k?=
 =?us-ascii?Q?q+qu0PGlNgMXfIzu4MTqDM4Qs/9QgPp1TSmhDSpD4ZaPtH78hCwZy3w1yzR+?=
 =?us-ascii?Q?LzgBWyO/T/aFE5jjmTAfD3/5vN9gciFaii3SoE5FPlMvF1MOVsG9CuaH4uuB?=
 =?us-ascii?Q?Ts+7SVkSEt4Qm9GUej6GDvPXLvGOUca3rwEqz5f8M6azlQJiuMMQ2jv0AokB?=
 =?us-ascii?Q?e8d69fuiraHozNPHe9id29IEhZuj2SvPMwC/W+Xm7REneteN9y+gochLD69o?=
 =?us-ascii?Q?+s70DQGq7aYgRsslPyStBfZNeUP4/+J+eBnyu0AJKn0XmwiEKdf2gRTLkvp4?=
 =?us-ascii?Q?z2bhuKrG1zh6bO8ofMyE821MQg8q68aujDURT3tY7Ocqhx6miESkKeAV9jIT?=
 =?us-ascii?Q?qCoUCnAx+brABA8DOeKgTvvF3O+lVrYppItISU74Uqc/jTIIYaJudRwN/B6y?=
 =?us-ascii?Q?Zldth4B3/OryLJ5d+5aUrRYXWA78/z1FRMO2swr6qYFNfQUYKfy4ev46cok+?=
 =?us-ascii?Q?99eWWJQp9zmD9+RycJf9Ky/bl3LRE5/ZwcxDQ6/LX5OXKkO30QBe9G4ad26H?=
 =?us-ascii?Q?p5K43QL3C3Gm0PRcQXOXvdXUTjNwqnKlDwdVeHioO8gxYz7OS6iUlVQ/YNUq?=
 =?us-ascii?Q?HaRFTSRWnx6MCi4CmGOi7TH8tZBTR5Gfxd3g2yuSz0z+eWaZ3deSeeCVAC2m?=
 =?us-ascii?Q?w8AfNNU06ehxy45n/ir9nRigkMH45lq9Ah6nSJ1+MNVj1qPRJwG2982G94UB?=
 =?us-ascii?Q?iuySooyWltcnKRphvMndbXAg03nYbqQ2Zj0xCQ303kKbwcwIF+TeN98EZqAr?=
 =?us-ascii?Q?kXfjuNCtJ+l/CfzMy2XHDav+XgHFOq4xnTXUaF/2iLYKFJWk+4NpVU2rYgt1?=
 =?us-ascii?Q?DKdGHBLs3QuWJWiXayoDJTgur26C+ynZYqQ67TazmiHQcrA2v+pgl0hHLSh8?=
 =?us-ascii?Q?N2ea1TS14F247mJqvBR5G8en/hXQ9bCjljZ3aj0LDSPBRZh0cCT1IwNIHrJe?=
 =?us-ascii?Q?bA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR21MB1415
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
> Passed through PCI device sometimes misbehave on Gen1 VMs when Hyper-V
> DRM driver is also loaded. Looking at IOMEM assignment, we can see e.g.
>=20
> $ cat /proc/iomem
> ...
> f8000000-fffbffff : PCI Bus 0000:00
>   f8000000-fbffffff : 0000:00:08.0
>     f8000000-f8001fff : bb8c4f33-2ba2-4808-9f7f-02f3b4da22fe
> ...
> fe0000000-fffffffff : PCI Bus 0000:00
>   fe0000000-fe07fffff : bb8c4f33-2ba2-4808-9f7f-02f3b4da22fe
>     fe0000000-fe07fffff : 2ba2:00:02.0
>       fe0000000-fe07fffff : mlx4_core
>=20
> the interesting part is the 'f8000000' region as it is actually the
> VM's framebuffer:
>=20
> $ lspci -v
> ...
> 0000:00:08.0 VGA compatible controller: Microsoft Corporation Hyper-V vir=
tual VGA
> (prog-if 00 [VGA controller])
> 	Flags: bus master, fast devsel, latency 0, IRQ 11
> 	Memory at f8000000 (32-bit, non-prefetchable) [size=3D64M]
> ...
>=20
>  hv_vmbus: registering driver hyperv_drm
>  hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] Synthvid Version =
major 3, minor 5
>  hyperv_drm 0000:00:08.0: vgaarb: deactivate vga console
>  hyperv_drm 0000:00:08.0: BAR 0: can't reserve [mem 0xf8000000-0xfbffffff=
]
>  hyperv_drm 5620e0c7-8062-4dce-aeb7-520c7ef76171: [drm] Cannot request fr=
amebuffer, boot fb still active?
>=20
> Note: "Cannot request framebuffer" is not a fatal error in
> hyperv_setup_gen1() as the code assumes there's some other framebuffer
> device there but we actually have some other PCI device (mlx4 in this
> case) config space there!

My apologies for not getting around to commenting on the previous
version of this patch.  The function hyperv_setup_gen1() and the
"Cannot request framebuffer" message have gone away as of
commit a0ab5abced55.

>=20
> The problem appears to be that vmbus_allocate_mmio() can allocate from
> the reserved framebuffer region (fb_overlap_ok), however, if the
> request to allocate MMIO comes from some other device before
> framebuffer region is taken, it can happily use framebuffer region for
> it.=20

Interesting. I had never looked at the details of vmbus_allocate_mmio().
The semantics one might assume of a parameter named "fb_overlap_ok"
aren't implemented because !fb_overlap_ok essentially has no effect.   The
existing semantics are really "prefer_fb_overlap".  This patch implements
the expected and needed semantics, which is to not allocate from the frame
buffer space when !fb_overlap_ok.

If that's an accurate high level summary, maybe this commit message
could describe it that way?  The other details you provide about what can
go wrong should still be included as well.

> Note, Gen2 VMs are usually unaffected by the issue because
> framebuffer region is already taken by EFI fb (in case kernel supports
> it) but Gen1 VMs may have this region unclaimed by the time Hyper-V PCI
> pass-through driver tries allocating MMIO space if Hyper-V DRM/FB drivers
> load after it. Devices can be brought up in any sequence so let's
> resolve the issue by always ignoring 'fb_mmio' region for non-FB
> requests, even if the region is unclaimed.
>=20
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  drivers/hv/vmbus_drv.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
> index 536f68e563c6..3c833ea60db6 100644
> --- a/drivers/hv/vmbus_drv.c
> +++ b/drivers/hv/vmbus_drv.c
> @@ -2331,7 +2331,7 @@ int vmbus_allocate_mmio(struct resource **new, stru=
ct
> hv_device *device_obj,
>  			bool fb_overlap_ok)
>  {
>  	struct resource *iter, *shadow;
> -	resource_size_t range_min, range_max, start;
> +	resource_size_t range_min, range_max, start, end;
>  	const char *dev_n =3D dev_name(&device_obj->device);
>  	int retval;
>=20
> @@ -2366,6 +2366,14 @@ int vmbus_allocate_mmio(struct resource **new, str=
uct
> hv_device *device_obj,
>  		range_max =3D iter->end;
>  		start =3D (range_min + align - 1) & ~(align - 1);
>  		for (; start + size - 1 <=3D range_max; start +=3D align) {
> +			end =3D start + size - 1;
> +
> +			/* Skip the whole fb_mmio region if not fb_overlap_ok */
> +			if (!fb_overlap_ok && fb_mmio &&
> +			    (((start >=3D fb_mmio->start) && (start <=3D fb_mmio->end)) ||
> +			     ((end >=3D fb_mmio->start) && (end <=3D fb_mmio->end))))
> +				continue;
> +
>  			shadow =3D __request_region(iter, start, size, NULL,
>  						  IORESOURCE_BUSY);
>  			if (!shadow)
> --
> 2.37.1

Other than my musings on the commit message,

Reviewed-by: Michael Kelley <mikelley@microsoft.com>

