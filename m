Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4002F410F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 02:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725E889A9F;
	Wed, 13 Jan 2021 01:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750040.outbound.protection.outlook.com [40.107.75.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D605D89A9F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 01:21:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPahcNqokxRjOpfNx9Z3m3PrtwB0vlPoGCifuZdIL5vWMg33fw4Q6NNCEo9vdT9ogfGpoVyRO7Qh4hvT5e1cizv4NOhYwCg8eJenuOsk2MLWdQ25tzrBqJ3mhtQ+YVMRNyCv4MGYRzQr4cbiZpbRQXnIhh0rdnwqekBnJNecaBLoLZAa6XS0uwVKTyBCjh0Ggy/zRzUmD3V9TbU4p4fiNV6fIPWiRty4suaV7utS4Xzm9Hp7bPUBtERAroep/+QDckbua/GdB3PLCMEoyClgkhbz25ZHdj1GhQ/TxaSw3J88x1e4J1RlbR0yp9rn8DY6+OxC4bP0Nm7vO7hwQYgqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnOQ+obYMf+G1uyKsNDBz4cxJ55kHB01+wXon3R6jSk=;
 b=MN48Ls3DxkLHCsynxmVEX0mWItfvXKw1eIYT8tNWI3c57iP9l8aLlAUrn/XzJsoD+8CG2AydrhhTbt1721bNWVjyTaTu0DucmFAP0eNtKTWG0Mkuf/Cpi4SzKktaOjHUrx96jwM4vOtWHELBIZmYApeLJ0jZOKbYyY4zGNcjCqwwTO82sdMKu9Fu50hGZN1IyHSkyre5P/nxf8k+NnT+3KGh6rZTd8Vucl3zN76u6Z+Kl0aEy9K4ZgZ55pWT8aAyQ64EcMlT2F4EXlHA4fg8ck1pCgPE108ZPcTAh3l63EAaknM9MSbu9JQNADCydRPK3Zd4luSZQu/ZVf3Z5DAdpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnOQ+obYMf+G1uyKsNDBz4cxJ55kHB01+wXon3R6jSk=;
 b=d/MiRLQucGPZuZIC05Fki3ss9RULmfi5F1vqnFjHdhhB/y9QOMvqP2nsummWSV2eBdcgnMwgQcHTGgJsSyT/UP86Y5mx0Dq+FToUyiOTNn6nIYP1uKiOKaSYVWyli7SfHRzYl18n2FKJIBHTaGZ0b5cCBOADw/aB5/bvlUWkiHY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR1201MB0031.namprd12.prod.outlook.com (2603:10b6:301:57::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 01:21:48 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98%6]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 01:21:48 +0000
Date: Wed, 13 Jan 2021 09:21:39 +0800
From: Huang Rui <ray.huang@amd.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 5.11 regression fix] drm/ttm: fix combining __GFP_HIGHMEM
 and __GFP_DMA32 flag for DMA32 pools
Message-ID: <20210113012139.GB135176@hr-amd>
References: <20210112183249.437759-1-hdegoede@redhat.com>
Content-Disposition: inline
In-Reply-To: <20210112183249.437759-1-hdegoede@redhat.com>
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HK2PR04CA0077.apcprd04.prod.outlook.com
 (2603:1096:202:15::21) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (180.167.199.189) by
 HK2PR04CA0077.apcprd04.prod.outlook.com (2603:1096:202:15::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Wed, 13 Jan 2021 01:21:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fae803e2-97e0-4794-5f66-08d8b761991a
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0031:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB00312AA61D0177C5982580C4ECA90@MWHPR1201MB0031.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y1VAoYon/0t34/ZVUPoSkIW9rrLhGusLu8U0/JKRJaWycJlfmOwiCy9d1Q3y+yFRzS9huxrrr+RyTaujHeeL6FU4J8+oo655j4xBe8LwdPFSR4ol+E9k2cbyZD+6cJ/Z6wxpBP+cab3tF/ON8q8c+31iFtxasYLshSKLTOpsgSH5FkvSKAS6fayUo6ntLoHkD00aLqWfxx8H/0FAqhObG3AWKoUP+5gzoarh8SBoiQXD5pAj+AWEvec+o0vDMliP/RrG8SWWzRcDBldYMN4WKdwL9bB2e2qebYI/hf0jjWWhpKLny+x3WpV6EgzBawke/b+B7qSMHCHqlKp+Iexgpk8w2iF4xL36HjfUty2D2VQMC2V2XlZVjL0YmUYQUAA8MVmMyC0JUmt1wP+N+O3Tqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(6666004)(26005)(9686003)(54906003)(66946007)(55016002)(186003)(45080400002)(66556008)(16526019)(2906002)(1076003)(33716001)(4326008)(66476007)(52116002)(86362001)(6496006)(66574015)(83380400001)(956004)(5660300002)(8936002)(8676002)(316002)(478600001)(33656002)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?yb2j3tkUtkHNnZ9iHrBaRFg1zvLSzhXcSBpohBwmfQ7cwytkGltYCyVnq/?=
 =?iso-8859-1?Q?eEUAhmGmAoPYlxSxkT6uqijoynIDfXMZ7AomdlaQo83RfoBPF+F8fCsFVz?=
 =?iso-8859-1?Q?EHIli0VA5Z8XtGfFrEZ6NZhvctuRrHqFtV4y+BW8NyO0gr8VTa5t0xbPhG?=
 =?iso-8859-1?Q?ZXT3qo+uf5t6WMajS2dMS+V2Elel1g6OfT8WRMK/pQVtayS47uwgoWCjat?=
 =?iso-8859-1?Q?cCEmF5wAHEMhrDQyQiB0hYlHxcUI1KU6k3GbXv+UbYgDsbRi3bRGIXQyWr?=
 =?iso-8859-1?Q?JtRD1soUMuBD8/zLloCFP9IIKln0m5H+d0s/SRqZvQuyzdqzlotQPIQOA2?=
 =?iso-8859-1?Q?fJrFUBMWqFsP7zgBkC0V+PT7S1uzcxNaA/g1UDmPMGne1WsI7is6UbV0VP?=
 =?iso-8859-1?Q?tfv9S4VAJ5CNvJJpT7O8hPwKows+GniRyrbYhrde54RY90PIUPNV+5osRI?=
 =?iso-8859-1?Q?XUo4zCbepJL4+6dHzNuY9wIWl78Lg+wS4xmSltzr29rjnq4uz8dHEMEiG8?=
 =?iso-8859-1?Q?dy+mtiaImRM43Of6HPMLi/NFfebn/ZEM8xiXJQ+JeSGMlEtAVQ6exHNsTg?=
 =?iso-8859-1?Q?h1Qc/9WP4rn1IPwWwDQ9hqLs71xx8NVRonCVq4bAbzr7fz36KuozcAKVTf?=
 =?iso-8859-1?Q?y+skAXSQ1UkNeVGFua4e+lw7hRuUenhSWcE07cD3akjGEHFcsy8dyWWPxD?=
 =?iso-8859-1?Q?oR2PPONMq/qFtLAPAgOwOYWqr5oWYOwt0+1DUysU0AhBDsIedewo8g1YWy?=
 =?iso-8859-1?Q?MvhRtxypeNfJeQm1b1CuQty/wEM+mCTMdNUboH9Vxg12WGh2NmsnhF/NUR?=
 =?iso-8859-1?Q?QV4qqj0Dozf66RCmAM6HfWiDZdvuEMpLwL3waFUq8vYOEtRakjZEXQuZG7?=
 =?iso-8859-1?Q?k9v64iA+3PioVVXhxrcKHzncKP4Q0t2eNi95wD2DA7bdBxaqaWGooCC5JB?=
 =?iso-8859-1?Q?j22gG/DzNd1jAOoqOZ2ihKMehem//GPMkeKD86ZXSAmoQ7GMoWlMtJPjOj?=
 =?iso-8859-1?Q?ffvm2Lc21mHpRwFp8NQTcUL59icBAMKt9ltqjv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 01:21:48.0058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: fae803e2-97e0-4794-5f66-08d8b761991a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAaT8VrYyows8aCPmPpGW917ExxadzCC0lxx/c8M18GhB8D0DaIvbU+TRiUQ+0lJ2pGST+X+3v4gWvjb3hg7hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0031
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
Cc: David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 13, 2021 at 02:32:49AM +0800, Hans de Goede wrote:
> GFP_TRANSHUGE_LIGHT includes __GFP_HIGHMEM and combining
> __GFP_HIGHMEM with __GFP_DMA32 is not allowed.
> =

> So we must not set add GFP_TRANSHUGE_LIGHT to the gfp_flags when
> allocating pages from a dma32 pool.
> =

> This fixes the following oops when using a driver which uses DMA32
> pools such as the vboxvideo driver:
> =

> [  419.852194] ------------[ cut here ]------------
> [  419.852200] kernel BUG at include/linux/gfp.h:457!
> [  419.852208] invalid opcode: 0000 [#4] SMP PTI
> [  419.852212] CPU: 0 PID: 1522 Comm: Xorg Tainted: G      D           5.=
11.0-rc2+ #187
> [  419.852214] Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS Vi=
rtualBox 12/01/2006
> [  419.852216] RIP: 0010:__alloc_pages_nodemask+0x31a/0x3d0
> [  419.852222] Code: 00 00 8b 05 a8 3b 93 01 85 c0 0f 85 03 fe ff ff 89 e=
8 44 89 fa c1 e8 03 80 ca 80 83 e0 03 83 f8 01 44 0f 44 fa e9 e9 fd ff ff <=
0f> 0b 0f 0b e9 79 fd ff ff 31 c0 e9 88 fd ff ff e8 41 ad fb ff 48
> [  419.852224] RSP: 0000:ffffb1164096bc60 EFLAGS: 00010247
> [  419.852227] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000000000=
000e8e8
> [  419.852229] RDX: 0000000000000000 RSI: 0000000000000006 RDI: 000000000=
0192dc6
> [  419.852230] RBP: 0000000000192dc6 R08: 0000000000000000 R09: 000000000=
0000000
> [  419.852232] R10: 0000000000000017 R11: 00007ff303d0a000 R12: 000000000=
0000009
> [  419.852233] R13: 0000000000000009 R14: ffff8be4cafe0880 R15: ffff8be5c=
26fe000
> [  419.852235] FS:  00007ff3046e0f00(0000) GS:ffff8be5dbc00000(0000) knlG=
S:0000000000000000
> [  419.852237] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  419.852239] CR2: 00007ff303d0a000 CR3: 000000000afd8004 CR4: 000000000=
00706f0
> [  419.852243] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [  419.852244] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [  419.852246] Call Trace:
> [  419.852252]  ttm_pool_alloc+0x2e8/0x5f0 [ttm]
> [  419.852261]  ttm_tt_populate+0x9f/0xe0 [ttm]
> [  419.852267]  ttm_bo_vm_fault_reserved+0x236/0x6e0 [ttm]
> [  419.852274]  ttm_bo_vm_fault+0x4a/0xe0 [ttm]
> [  419.852279]  __do_fault+0x37/0x110
> [  419.852283]  handle_mm_fault+0x1493/0x1990
> [  419.852288]  do_user_addr_fault+0x1c7/0x4c0
> [  419.852292]  exc_page_fault+0x67/0x250
> [  419.852295]  ? asm_exc_page_fault+0x8/0x30
> [  419.852299]  asm_exc_page_fault+0x1e/0x30
> [  419.852301] RIP: 0033:0x7ff304f3cdf8
> [  419.852304] Code: 83 c0 04 83 fa 03 7e ea a8 0f 75 ee 83 fa 7f 7e e1 8=
3 c2 80 89 d6 c1 ee 07 8d 4e 01 48 c1 e1 07 48 01 c1 0f 1f 80 00 00 00 00 <=
0f> 29 00 48 83 e8 80 0f 29 40 90 0f 29 40 a0 0f 29 40 b0 0f 29 40
> [  419.852306] RSP: 002b:00007ffec360e7d8 EFLAGS: 00010206
> [  419.852308] RAX: 00007ff303d0a000 RBX: 00000000000002e2 RCX: 00007ff30=
3d0b300
> [  419.852309] RDX: 00000000000012c0 RSI: 0000000000000025 RDI: 000000000=
0000000
> [  419.852311] RBP: 0000000000001340 R08: 0000000000000000 R09: 000000000=
0000000
> [  419.852312] R10: 00007ff303d0a000 R11: 0000000000001340 R12: 00007ff30=
3d0a000
> [  419.852313] R13: 0000556665f1eb30 R14: 0000000000000000 R15: 000000000=
0000000
> [  419.852318] Modules linked in: xt_CHECKSUM xt_MASQUERADE xt_conntrack =
ipt_REJECT nf_nat_tftp nf_conntrack_tftp tun bridge stp llc nft_objref nf_c=
onntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fi=
b_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft=
_ct nft_chain_nat rfkill ip6table_nat ip6table_mangle ip6table_raw ip6table=
_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ipt=
able_mangle iptable_raw iptable_security ip_set nf_tables vboxsf nfnetlink =
ip6table_filter ip6_tables iptable_filter sunrpc vfat fat intel_rapl_msr jo=
ydev intel_rapl_common intel_powerclamp crct10dif_pclmul crc32_pclmul ghash=
_clmulni_intel snd_intel8x0 rapl snd_ac97_codec ac97_bus snd_seq snd_seq_de=
vice snd_pcm pcspkr snd_timer snd soundcore i2c_piix4 vboxguest ip_tables v=
boxvideo drm_vram_helper drm_kms_helper cec drm_ttm_helper ttm crc32c_intel=
 serio_raw e1000 drm drm_privacy_screen_helper ata_generic pata_acpi video =
fuse
> [  419.852375] ---[ end trace 511e5346897d9526 ]---
> =

> Note in case of the vboxvideo driver the DMA32 pool is allocated through
> drm_vram_helper_alloc_mm() which is also used by the bochs and
> hisilicon/hibmc drivers.
> =

> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Fixes: d099fc8f540a ("drm/ttm: new TT backend allocation pool v3")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Thanks.

Reviewed-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_poo=
l.c
> index 7b2f60616750..8b32fd8c8ccc 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -80,8 +80,9 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool=
 *pool, gfp_t gfp_flags,
>  	void *vaddr;
>  =

>  	if (order) {
> -		gfp_flags |=3D GFP_TRANSHUGE_LIGHT | __GFP_NORETRY |
> -			__GFP_KSWAPD_RECLAIM;
> +		if (!pool->use_dma32)
> +			gfp_flags |=3D GFP_TRANSHUGE_LIGHT;
> +		gfp_flags |=3D __GFP_NORETRY | __GFP_KSWAPD_RECLAIM;
>  		gfp_flags &=3D ~__GFP_MOVABLE;
>  		gfp_flags &=3D ~__GFP_COMP;
>  	}
> -- =

> 2.28.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
