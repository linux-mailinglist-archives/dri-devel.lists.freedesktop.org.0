Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D73A7E1CCB
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 09:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F0610E289;
	Mon,  6 Nov 2023 08:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2097.outbound.protection.outlook.com [40.92.42.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0686A10E0CA
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Nov 2023 15:15:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xd+Eqjc2wq7XM4WtJex308nNgxSPmiNP5DW9DdXze+YrB3eQJ2FP3P/PFXfLJsfIfsmyf//J7T200TeCbMmwEui5pbb6NmGWkVVEwCkMsmXxz6X+kTSs4UCH1gsM52I+9p+xGx5sv6QapsRtFi+extrQZW0WAiWdUW8uhDkAV3fM7cRERxxpAngUPcZvWikrP0N0huZ3VGdCN6NPNtZxj9GEaykUCU8DJoi9KeNHN2CS+66xifFioH62BkFEldve9nSYJoaPQLV3rqcNoHU0MymrRg+X7yydo8sQCAkWD6J+P6U3S3Zeb2lFUFaPFM8k59+1AP8PGS6/A7QcNz5IaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VorxeaR0tPcsEj0IC7UDkAeMGJMwekz+Pv1hYawm2l0=;
 b=RPVlvRbct/jzqdKTA6GMbamwxzaOITuleYfcRt21D/G8VU7oJMbClAX0R4PIn5P1KGeS9o3abadcgq54YtWZkX+0rExwn8jeH/+QSpB01xfzDr+zZnkq2IsISDMVNp788Cq7b2WAEgGK4ccTUXZCwpKRv7WzBH+TcSBxWO3a1TGO0am3oL7FBMJHLSCS5BFl0HWrA8n7ApnPYs50Tot31WWuEcW2G0I6OPSwxUHMDADg1s+IbpT0iYq/BW7oDVXKtnFnfhBzERPj7UNaE6adeLTHbla+1ONSkCaDs9WF/FSbLQ/tdbryCJKHoEY/HLN1biuVptZ0YP+wRaQB4yNJOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VorxeaR0tPcsEj0IC7UDkAeMGJMwekz+Pv1hYawm2l0=;
 b=bY8gZPhuEV3O7Y91j6zOdyQfJR1p7nNF5ZtanPSbqkHS9+jj9q8elot26Znxs3LtPlXG+t/FO13Xz0jvxVKnpXgE/pm9R2Y3096wUwE7sTjgDjPx6XJ7ElGjyqCB7V/AHteoZZ253bssW0q4YRwndc3Og9lBox2/DyDp7qpgq3bfbfqhW8abfln3uglJsdl0r7MhTuFCkX2Q/WJhAm4BpRG+aBCSP8o88LmDj6S0+cMfTuA9jEA+sM930O5cnWQ4GDnwykPW6djxV/plND750jZmSYcAxI/yvMr/oMRFYLCyveJncIjvyeavvM6US5hEvAb2U1b9ckXN01e7CthxtQ==
Received: from BY3PR18MB4692.namprd18.prod.outlook.com (2603:10b6:a03:3c7::12)
 by PH7PR18MB5666.namprd18.prod.outlook.com (2603:10b6:510:2e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Sun, 5 Nov
 2023 15:15:46 +0000
Received: from BY3PR18MB4692.namprd18.prod.outlook.com
 ([fe80::4fa4:77da:f114:612a]) by BY3PR18MB4692.namprd18.prod.outlook.com
 ([fe80::4fa4:77da:f114:612a%6]) with mapi id 15.20.6954.027; Sun, 5 Nov 2023
 15:15:45 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Nischala Yelchuri <niyelchu@linux.microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "kys@microsoft.com" <kys@microsoft.com>, "haiyangz@microsoft.com"
 <haiyangz@microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
 <bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "deller@gmx.de" <deller@gmx.de>
Subject: RE: [PATCH] Replace ioremap_cache() with memremap()
Thread-Topic: [PATCH] Replace ioremap_cache() with memremap()
Thread-Index: AQHaDNzUez9nfYQyzk+2c7gpvJ79lbBr0PJg
Date: Sun, 5 Nov 2023 15:15:45 +0000
Message-ID: <BY3PR18MB469219E1401B9E1A997EA51BD4ABA@BY3PR18MB4692.namprd18.prod.outlook.com>
References: <1698854508-23036-1-git-send-email-niyelchu@linux.microsoft.com>
In-Reply-To: <1698854508-23036-1-git-send-email-niyelchu@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [K0H8C53o/bui+UHEXvpEJQHbJR9dIQAM]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4692:EE_|PH7PR18MB5666:EE_
x-ms-office365-filtering-correlation-id: 57a6393c-7f18-49d2-4c1c-08dbde1215bc
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: md/6IQYiwYcVGJm39PuQyVapNLYKd0v0Y07yZrfvKaGD0XYlDh+V9uMww1YD0rv03mKADTlX0SOm4RSJjYTWxL03gat0B3Bf8NzUE+g9vjQcrM4NzX0VLO/idL5I672Z6SS6un8VJWNHh9X6TLTHZVD7usjnRtaG0xdo5uqZDruiJ3Dg9uaVHaIHDSmYjXEiC6KEf3tGQGSFjAJ69LILIXJ0m9xEZsi3AHDLi/ln3QrMp1kwvcqBp7fR+w1SpVsjSIebRKDyRxFSSpkq+87X1D2a4bULVHRTKXQuqOYGeT9TMtrCo1a1VDMrFmUQuorkX+ubkrdN6ucmcq9IXvce379nI48kUCxcLRGt1yFPY/O7Fk0a2GMC7t0cNxK0lidimtKWmdwFSpp1usnQyJd9+G0YQa2Ff5oswp+0YIHfRAhRqFPSrQRQtDUODd9bOMx1QMT/s/p59GIF+Fi3vzDq2h37SWrSVhv1WmS/gQwtNo73Jw42+Rei4I30F00TVoWi04nPAkPo61XbmiOVDNBtrZWFE2mujQAj/l3GKRdmXV2FP7vGR1HsqWMDIOe2hFtQ
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H+Qy2hNpOhV2F3RZHPNGmKOU5qJaECY07hBMiMBxJc/ycS/AtZbGqsWddYl8?=
 =?us-ascii?Q?lbpjvw7I6nxnsdNMQE+l8upnQn5Z2peg6XLcZ51pIufWngFOKHC8bIFehW0D?=
 =?us-ascii?Q?Klrph6ve4SNdadcFOqL6u+o9gehgjJ0H/dl4SkfRch4UCGuDtp55QZF65DG6?=
 =?us-ascii?Q?dRCxfA2cWpmee4zA8Nc+nZw3432kgUGt5eJZSeltMkFqy5a/0lzrlHAVUGbh?=
 =?us-ascii?Q?gfomJlNcl0xMcBQrHJ6PbZioSwddye/Iz/a0RiaBKgmFj7Vq2jk3icY/2SV9?=
 =?us-ascii?Q?H9I4lM7Zb9qRE/e7kCtONRezH6dauYdVdzGD07rS+2NR9Q7c8gH/cXFmUtJA?=
 =?us-ascii?Q?gpdGBcYu8n3wUqqpR85fdhLoNkaZtVKcdZ3jzt1QW2d5H8NROE8GbO+10ip9?=
 =?us-ascii?Q?yPgtSWj1ggZf4kqnPUCeITEtKEBKWsAo9IluRAMLc45nAuf0CiY8CGZVY9aE?=
 =?us-ascii?Q?RXL2t29zq1HID8ALi0V5mUk9MkRj4T/zTCK8WUM2p9XLEweYja+NH59Jt9tZ?=
 =?us-ascii?Q?kBBgKCP6lwF+CE5wj9MF5oSTeKKBfbK42dbrbOFEn46JINL5gSWOuMgI1c4+?=
 =?us-ascii?Q?eEn6D4xI4nCIlkwT/Vld6JLEfajy6AvBquZijYAvGx394pM/fWiZW9gMqQI4?=
 =?us-ascii?Q?fqt+pjUFZgWXCSMWQlJWfA2BEDxnROydsodNxXNr2Q1S+05jPHIVb6kOupB3?=
 =?us-ascii?Q?VJO9Y8LPKa+/fp6TmAphng37yqekogp8uegp66J+1wD8ZFJRQEcg66PMXt1g?=
 =?us-ascii?Q?LisUPt0zs2fB3qqnlR9bYutQEN+Oq4rvHK3Moo9A96X0amdNAly4RXkLuKPN?=
 =?us-ascii?Q?hJ+qrBV2nn4bSuOAdL+vTOCfMTpq50vwa3NZDrN9ANZGl29UXfndjOH9r2WV?=
 =?us-ascii?Q?peGjGl9uC7HmE1gV48BmP+EWhj+HJcNmzZ+gmOSgUf/Wg2xhCBN0pEIMG6Lh?=
 =?us-ascii?Q?LWmBeuTfpI8H0z4LwSzsdY6huwwwbQD9g19b5eIzfCEPDwsPk+m0rdN7T8zc?=
 =?us-ascii?Q?0We0PwAfWGfszIfvBETkv30lqX1ztHBMjUxZyOlXjHPewAH31jE0jgWhVgUu?=
 =?us-ascii?Q?Th6g9ieIc51nXbkF+jDw2B1uT/JAtVgJLgQ4GjE96lUo4yw2C3D+YPLioAzy?=
 =?us-ascii?Q?F2xkJdqi9w/Ap/xGXXqaTRVrU+muULSa8cEevqbi+cVHDj7269WZhPRmXMCa?=
 =?us-ascii?Q?Jnl33wpit8QdWkSwnphLukE1qdFUeE0rYdsojg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4692.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a6393c-7f18-49d2-4c1c-08dbde1215bc
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2023 15:15:45.8443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR18MB5666
X-Mailman-Approved-At: Mon, 06 Nov 2023 08:59:21 +0000
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
Cc: "niyelchu@microsoft.com" <niyelchu@microsoft.com>,
 "singhabhinav9051571833@gmail.com" <singhabhinav9051571833@gmail.com>,
 "mhkelley@outlook.com" <mhkelley@outlook.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nischala Yelchuri <niyelchu@linux.microsoft.com> Sent: Wednesday, Nov=
ember 1, 2023 9:02 AM
>

It's customary for the patch "Subject:" line to have a prefix indicating th=
e
area of the code being modified.  This patch touches on multiple Hyper-V
drivers, so there's not a clear choice for prefix.  I would suggest using
"Drivers: hv:" as is commonly used for Hyper-V code, though other
reviewers might have a different suggestion.

 > Current Hyper-V code for CoCo VMs uses ioremap_cache() to map normal
> memory as decrypted.
> ioremap_cache() is ideally used to map I/O device memory when it has the =
characteristics
> of normal memory. It should not be used to map normal memory as the retur=
ned pointer
> has the __iomem attribute.
>=20
> Fix current code by replacing ioremap_cache() with memremap().
>=20
> No functional change intended.
>=20
> Signed-off-by: Nischala Yelchuri <niyelchu@linux.microsoft.com>
> ---
>  arch/x86/hyperv/hv_init.c               |  6 +++---
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c |  2 +-
>  drivers/hv/hv.c                         | 13 +++++++------
>  drivers/video/fbdev/hyperv_fb.c         |  6 +++---
>  4 files changed, 14 insertions(+), 13 deletions(-)
>=20
> diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
> index 21556ad87..fae43c040 100644
> --- a/arch/x86/hyperv/hv_init.c
> +++ b/arch/x86/hyperv/hv_init.c
> @@ -68,9 +68,9 @@ static int hyperv_init_ghcb(void)
>  	 */
>  	rdmsrl(MSR_AMD64_SEV_ES_GHCB, ghcb_gpa);
>=20
> -	/* Mask out vTOM bit. ioremap_cache() maps decrypted */
> +	/* Mask out vTOM bit. memremap() maps decrypted with MEMREMAP_DEC */
>  	ghcb_gpa &=3D ~ms_hyperv.shared_gpa_boundary;
> -	ghcb_va =3D (void *)ioremap_cache(ghcb_gpa, HV_HYP_PAGE_SIZE);
> +	ghcb_va =3D memremap(ghcb_gpa, HV_HYP_PAGE_SIZE, MEMREMAP_WB | MEMREMAP=
_DEC);
>  	if (!ghcb_va)
>  		return -ENOMEM;
>=20
> @@ -238,7 +238,7 @@ static int hv_cpu_die(unsigned int cpu)
>  	if (hv_ghcb_pg) {
>  		ghcb_va =3D (void **)this_cpu_ptr(hv_ghcb_pg);
>  		if (*ghcb_va)
> -			iounmap(*ghcb_va);
> +			memunmap(*ghcb_va);
>  		*ghcb_va =3D NULL;
>  	}
>=20
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> index d511d17c5..d6fec9bd3 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -92,7 +92,7 @@ static int hyperv_setup_vram(struct hyperv_drm_device
> *hv,
>  	 * connect to display properly for ARM64 Linux VM, as the host also map=
s
>  	 * the VRAM cacheable.
>  	 */
> -	hv->vram =3D ioremap_cache(hv->mem->start, hv->fb_size);
> +	hv->vram =3D memremap(hv->mem->start, hv->fb_size, MEMREMAP_WB | MEMREM=
AP_DEC);

This change has some additional implications that must be
accounted for.  The hv->vram field is declared as void __iomem *
in hyperv_drm.h.   The __iomem attribute should be dropped.
Then the use of IOSYS_MAP_INIT_VADDR_IOMEM() in
hyperv_blit_to_vram_rect() should be changed to
IOSYS_MAP_INIT_VADDR().  This has the desirable effect of=20
allowing normal memcpy() functions to be used instead of
the _toio()/_fromio() variants.

>  	if (!hv->vram) {
>  		drm_err(dev, "Failed to map vram\n");
>  		ret =3D -ENOMEM;
> diff --git a/drivers/hv/hv.c b/drivers/hv/hv.c
> index 51e5018ac..399bfa392 100644
> --- a/drivers/hv/hv.c
> +++ b/drivers/hv/hv.c
> @@ -274,11 +274,12 @@ void hv_synic_enable_regs(unsigned int cpu)
>  	simp.simp_enabled =3D 1;
>=20
>  	if (ms_hyperv.paravisor_present || hv_root_partition) {
> -		/* Mask out vTOM bit. ioremap_cache() maps decrypted */
> +		/* Mask out vTOM bit. memremap() maps decrypted with MEMREMAP_DEC */
>  		u64 base =3D (simp.base_simp_gpa << HV_HYP_PAGE_SHIFT) &
>  				~ms_hyperv.shared_gpa_boundary;
>  		hv_cpu->synic_message_page
> -			=3D (void *)ioremap_cache(base, HV_HYP_PAGE_SIZE);
> +			=3D memremap(base,
> +				   HV_HYP_PAGE_SIZE, MEMREMAP_WB | MEMREMAP_DEC);
>  		if (!hv_cpu->synic_message_page)
>  			pr_err("Fail to map synic message page.\n");
>  	} else {
> @@ -293,11 +294,11 @@ void hv_synic_enable_regs(unsigned int cpu)
>  	siefp.siefp_enabled =3D 1;
>=20
>  	if (ms_hyperv.paravisor_present || hv_root_partition) {
> -		/* Mask out vTOM bit. ioremap_cache() maps decrypted */
> +		/* Mask out vTOM bit. memremap() maps decrypted with MEMREMAP_DEC */
>  		u64 base =3D (siefp.base_siefp_gpa << HV_HYP_PAGE_SHIFT) &
>  				~ms_hyperv.shared_gpa_boundary;
>  		hv_cpu->synic_event_page
> -			=3D (void *)ioremap_cache(base, HV_HYP_PAGE_SIZE);
> +			=3D memremap(base, HV_HYP_PAGE_SIZE, MEMREMAP_WB | MEMREMAP_DEC);
>  		if (!hv_cpu->synic_event_page)
>  			pr_err("Fail to map synic event page.\n");
>  	} else {
> @@ -376,7 +377,7 @@ void hv_synic_disable_regs(unsigned int cpu)
>  	 */
>  	simp.simp_enabled =3D 0;
>  	if (ms_hyperv.paravisor_present || hv_root_partition) {
> -		iounmap(hv_cpu->synic_message_page);
> +		memunmap(hv_cpu->synic_message_page);
>  		hv_cpu->synic_message_page =3D NULL;
>  	} else {
>  		simp.base_simp_gpa =3D 0;
> @@ -388,7 +389,7 @@ void hv_synic_disable_regs(unsigned int cpu)
>  	siefp.siefp_enabled =3D 0;
>=20
>  	if (ms_hyperv.paravisor_present || hv_root_partition) {
> -		iounmap(hv_cpu->synic_event_page);
> +		memunmap(hv_cpu->synic_event_page);
>  		hv_cpu->synic_event_page =3D NULL;
>  	} else {
>  		siefp.base_siefp_gpa =3D 0;
> diff --git a/drivers/video/fbdev/hyperv_fb.c
> b/drivers/video/fbdev/hyperv_fb.c
> index bf59daf86..cd9ec1f6c 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -1034,7 +1034,7 @@ static int hvfb_getmem(struct hv_device *hdev, stru=
ct fb_info *info)
>  	 * VM Connect to display properly for ARM64 Linux VM, as the host also
>  	 * maps the VRAM cacheable.
>  	 */
> -	fb_virt =3D ioremap_cache(par->mem->start, screen_fb_size);
> +	fb_virt =3D memremap(par->mem->start, screen_fb_size, MEMREMAP_WB | MEM=
REMAP_DEC);

There's a similar situation here:  the local variable fb_virt is
declared as void __iomem *.  The __iomem attribute should
be dropped.

>  	if (!fb_virt)
>  		goto err2;
>=20
> @@ -1068,7 +1068,7 @@ static int hvfb_getmem(struct hv_device *hdev, stru=
ct fb_info *info)
>  	return 0;
>=20
>  err3:
> -	iounmap(fb_virt);
> +	memunmap(fb_virt);
>  err2:
>  	vmbus_free_mmio(par->mem->start, screen_fb_size);
>  	par->mem =3D NULL;
> @@ -1086,7 +1086,7 @@ static void hvfb_putmem(struct hv_device *hdev, str=
uct fb_info *info)
>=20
>  	if (par->need_docopy) {
>  		vfree(par->dio_vp);
> -		iounmap(info->screen_base);
> +		memunmap(info->screen_base);
>  		vmbus_free_mmio(par->mem->start, screen_fb_size);
>  	} else {
>  		hvfb_release_phymem(hdev, info->fix.smem_start,
> --
> 2.34.1
