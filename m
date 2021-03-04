Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D86632D9A4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 19:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A8A6EA63;
	Thu,  4 Mar 2021 18:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AF76EA61;
 Thu,  4 Mar 2021 18:51:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cg4+5imIluMaBvSH5yFfoshG1f/iiLodRUPkYN/lXTswn6WFjw3GRo1Z7Jcc9bvXaLu5wbejxiAvOo7EDpIpeLwJvTaI3fVSOsTd4Ld6ugMvMGYBojzl9DYDY9/mqfzpBfMOiBUa7QM/0cweGLbNjVYKRarMUW4KAL4hSUlpvRMxmxmd/2Dm7ZZkqGgJBCths1rkb6OWm9TMZNRipDfMpq3OLrnI76ZTi5Gz3AqOwde/Nae1n4f8UJ7UmIYu1A5u1sjfwE3TziDFAxYMq2cU0wGLpCIJbyv8hk5nWSETuz/3J2tFQzE842TaoWMOeYAk1D8mepQQmlYiCkn35cctJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BipIAdY8QxQQP9r6vHHu+nKM1rymChBcqHijC+nbeCA=;
 b=RMHxy+DeqeWrvEpYm+I3UB/xxmtS3TII7qhtC6vA+aHfKfxD4KXrkbXLluVqBxLOVAFw7OAEM7PCWOQuqVxqnuiqbVlmnH+rMH7acZ3fU4AR5vCQIrJOXBkRODfMw57NQr6QgywDd1OJvjEkqvSob7Dn1HQS9Lnx5px43y7VwgqyBsuxkWPNjuXjkTRmASoTiFrA3G0bsLsWqwGSMUerUqLB5CVPxSvo7WcuXYwHECau4Dzy3UE+ybtaL3UjKDqKO677OuyTsGTYJnycM0uQLMvvpTykbStg/CGH+oIPqZXGL+yzt1V0DxqLuPtvXKxDvcrphfovy4H5249h7ct9tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BipIAdY8QxQQP9r6vHHu+nKM1rymChBcqHijC+nbeCA=;
 b=Ys4/evoBToQxjsqvA/ahZwbN2aNWrExJnd7xb1ydvFWoMQvqiyVNYm7jOcJmMkxTJTjSD2K+XL7Zqz2Ir3FjS33ZwozcGq1kT0J9vVR8Hzd52vo1GKomCF0k2HGDZcPb38WF9t9gJWeiSjILNLXRwySANbuWWWpCiqapjo0LNW8=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6125.namprd05.prod.outlook.com (2603:10b6:208:ca::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9; Thu, 4 Mar
 2021 18:47:43 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::88de:ad34:82d7:a02e]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::88de:ad34:82d7:a02e%6]) with mapi id 15.20.3912.017; Thu, 4 Mar 2021
 18:47:43 +0000
From: Zack Rusin <zackr@vmware.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 2/7] drm/vmgfx: Replace kmap_atomic()
Thread-Topic: [patch 2/7] drm/vmgfx: Replace kmap_atomic()
Thread-Index: AQHXEQkLtX7XWO+vPk2wGitdZqo3uKp0K5sA
Date: Thu, 4 Mar 2021 18:47:43 +0000
Message-ID: <66B6DD38-3BE5-4B94-A15C-8A1B1D417754@vmware.com>
References: <20210303132023.077167457@linutronix.de>
 <20210303132711.487711828@linutronix.de>
In-Reply-To: <20210303132711.487711828@linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.40.0.2.32)
authentication-results: linutronix.de; dkim=none (message not signed)
 header.d=none;linutronix.de; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d81edded-bcea-45f9-f99b-08d8df3dfef9
x-ms-traffictypediagnostic: MN2PR05MB6125:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB6125484484510E5027259DC8CE979@MN2PR05MB6125.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l6yWHHBuxV8YJRmdyaUbgkKzCLKdQoJpyqKB8CqV17BBJlzKVnhb1uMlqU8W2keYa+XVz+8o2u5Iil4oDiBMbRe0+5slc+hZQ6Lq5bzkTIOgAj9m49gyrkSegqNvFk4qluXekjg1PVOT0VV3THj/9KdSkaKEBxpSEaRzVD6d1XwWWcoHmI4AIC+fvYwNlgApvPeOQFJJ2fT/OaWrZlROSYclq2ZtJuJLYIwSUXIQxzcSA3FCiTMSSazom4SGjeQ72Szg/Jfw04r9NNgmQDaEH3+w5uhnnA0Noi0KTSee+2YuY3gAaotCxhis6lEGxmKogbxxb/EAPcnoEhv3+KNRGuCifWHAkJjFtfj79ME9iginQYs6wKHlsO2t4d4z9YO3aZLdQrcizD8iQbm87oSnESjfuUjahEwtzGbCu+ZRDs78zCx8hFDfSewIApdx9LATcOtIoYXtfaFHBjW/08cXW06wLjgCD8+hgHT8erDtRmGljdvXRJ/c0qcrq5xVYcuNlikz/EZSio7sqpNGE0fomfn4o2/T6IRoW1gkotyQYEe7rbvCaGh3vs755L1CrpxiItiYScrld8ldPixOT7evwg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(66556008)(36756003)(83380400001)(4326008)(71200400001)(6512007)(6486002)(64756008)(478600001)(26005)(66446008)(186003)(66946007)(316002)(7416002)(66476007)(76116006)(54906003)(5660300002)(2616005)(8936002)(6916009)(53546011)(6506007)(33656002)(2906002)(8676002)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?eq87qIr1HBOFvLSlJue1w71kyUaFeWgVttgXvOKpqXZCAuT96fSaRqRiBdwf?=
 =?us-ascii?Q?VHQZw8r6Xbqm9N4Q8roodmhLric0CGKCGsecOusVd/lR8BF0uWSLr6NMWSYX?=
 =?us-ascii?Q?l5nNMmAqfHsH+XeDaHDp/ht4JA/f4CF2ULkXir+daX7xMLUcrnzuE47doIa9?=
 =?us-ascii?Q?6phadXu9IM392jZHBeAxBivi8AqqSBFuz/uMez8vvkq/2dySNiJL2R1c/hgB?=
 =?us-ascii?Q?CkxsKFcP3r0/FoY0wlhqBp21LQTz1pKFQN+CBD2X6zn3IVahqKGrz8svtI6f?=
 =?us-ascii?Q?pcCj5ok6hNWjsAu1mXLUznKm9ZQASlk5H4+f1Bt0WcV/svpHerdX8066uw/C?=
 =?us-ascii?Q?RCS5Q6LzHhsPBPmzd8Cqu9f+su6K+jyBiYGo9ZjHeltjOTqgdRzi4c9YA7+E?=
 =?us-ascii?Q?liAV4Fqn00lFOJu9nPy1R9kPczbflsLsHxpCEV1TqZGr5mshcx+Y58QouO/U?=
 =?us-ascii?Q?jMj8463Dp5JuxD/+QC4Tl/YINnzj6ZAjOOyEef80P9Lc62K3NWLSInSEQ1pd?=
 =?us-ascii?Q?GT/kW1dczeixs9tT0MCdqatkJnN2fw+fLIOjIfic0cSUEtdgQLEgIzV1yZbv?=
 =?us-ascii?Q?KNr1boFYna9j/JDIAVTo0n26uogUu9Ie6H1pYgmmzJKd4CLHxU1M+Y7EAaGc?=
 =?us-ascii?Q?AXehVIRvOyru5SkAkiBIyCWMq13MtlDCscnscRZrthenJcoYEBM6HM+esj9P?=
 =?us-ascii?Q?i+HTl4Ab4jWIkynQGytIqcgmb/r3g8GI5h+eTGEGXd+7S8AyU6O5W9Hqic0e?=
 =?us-ascii?Q?bmWfzcg5QqHTUzMvKSvO4N/unVHe5W/hbUaszZvGgZKJvOYrGh6dyaewZUG1?=
 =?us-ascii?Q?54SqQ9jTHcz1CvDLGM64q7Dngsr/+6J81w383OxW1yl+21S5RUtxzl+x1XR9?=
 =?us-ascii?Q?07EMtoxWs3QdDOCtHvD8pD60CyfeGef9v3z/VfqkFp0ZSFLxMr1iv1omU1kM?=
 =?us-ascii?Q?jbXwOWyc3QWxbWgP+Xo/a3tsAhvHev3aLjLk8kwjrq4RKQkHyeuN2Th0rc3Z?=
 =?us-ascii?Q?Hdah1sr++AltbQH+SAASvUstP8OUUPQhiqXO9i8GEMUeLHWSiXqaaMiqib9w?=
 =?us-ascii?Q?7o7YlqAbofgU2j/Q0vCsF2uvFK3U5l9PvHHS59XaV4Y0KyJAUqXZhn4A0w/r?=
 =?us-ascii?Q?WpMFi2PCmcpmxZQcFARg/+RaCRdjeBTh5ctblg4KCJvZTcBBc2KKQrX02Byu?=
 =?us-ascii?Q?JeSL45ccYgM4dbRdoHB8+tf6OClVgquxhVWfOpUQ7atjW9avsEMx7Xdilyxh?=
 =?us-ascii?Q?gH7+RWYlWYtkf83xoGtJJrNdDoTxZJOhTHTer1++A0d1mko02TsRnwgf9T/5?=
 =?us-ascii?Q?OjKI0kMMvYnZUffK8rIEFSaB?=
Content-ID: <7EE4BFD3EF0A8644B48E47036134F532@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81edded-bcea-45f9-f99b-08d8df3dfef9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2021 18:47:43.4460 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yfiT4G+ZB/Ef0pgYDKS0QJ2U7yAeQXQkiXvzB2LIMClOOE/hQzrO7KbdxwnjdBt2fY6WMBU3x83emiFK0gE4qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6125
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
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Roland Scheidegger <sroland@vmware.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Huang Rui <ray.huang@amd.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Christian Koenig <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> On Mar 3, 2021, at 08:20, Thomas Gleixner <tglx@linutronix.de> wrote:
> 
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> There is no reason to disable pagefaults and preemption as a side effect of
> kmap_atomic_prot().
> 
> Use kmap_local_page_prot() instead and document the reasoning for the
> mapping usage with the given pgprot.
> 
> Remove the NULL pointer check for the map. These functions return a valid
> address for valid pages and the return was bogus anyway as it would have
> left preemption and pagefaults disabled.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> Cc: Roland Scheidegger <sroland@vmware.com>
> Cc: Zack Rusin <zackr@vmware.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---
> drivers/gpu/drm/vmwgfx/vmwgfx_blit.c |   30 ++++++++++++------------------
> 1 file changed, 12 insertions(+), 18 deletions(-)
> 
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> @@ -375,12 +375,12 @@ static int vmw_bo_cpu_blit_line(struct v
> 		copy_size = min_t(u32, copy_size, PAGE_SIZE - src_page_offset);
> 
> 		if (unmap_src) {
> -			kunmap_atomic(d->src_addr);
> +			kunmap_local(d->src_addr);
> 			d->src_addr = NULL;
> 		}
> 
> 		if (unmap_dst) {
> -			kunmap_atomic(d->dst_addr);
> +			kunmap_local(d->dst_addr);
> 			d->dst_addr = NULL;
> 		}
> 
> @@ -388,12 +388,8 @@ static int vmw_bo_cpu_blit_line(struct v
> 			if (WARN_ON_ONCE(dst_page >= d->dst_num_pages))
> 				return -EINVAL;
> 
> -			d->dst_addr =
> -				kmap_atomic_prot(d->dst_pages[dst_page],
> -						 d->dst_prot);
> -			if (!d->dst_addr)
> -				return -ENOMEM;
> -
> +			d->dst_addr = kmap_local_page_prot(d->dst_pages[dst_page],
> +							   d->dst_prot);
> 			d->mapped_dst = dst_page;
> 		}
> 
> @@ -401,12 +397,8 @@ static int vmw_bo_cpu_blit_line(struct v
> 			if (WARN_ON_ONCE(src_page >= d->src_num_pages))
> 				return -EINVAL;
> 
> -			d->src_addr =
> -				kmap_atomic_prot(d->src_pages[src_page],
> -						 d->src_prot);
> -			if (!d->src_addr)
> -				return -ENOMEM;
> -
> +			d->src_addr = kmap_local_page_prot(d->src_pages[src_page],
> +							   d->src_prot);
> 			d->mapped_src = src_page;
> 		}
> 		diff->do_cpy(diff, d->dst_addr + dst_page_offset,
> @@ -436,8 +428,10 @@ static int vmw_bo_cpu_blit_line(struct v
>  *
>  * Performs a CPU blit from one buffer object to another avoiding a full
>  * bo vmap which may exhaust- or fragment vmalloc space.
> - * On supported architectures (x86), we're using kmap_atomic which avoids
> - * cross-processor TLB- and cache flushes and may, on non-HIGHMEM systems
> + *
> + * On supported architectures (x86), we're using kmap_local_prot() which
> + * avoids cross-processor TLB- and cache flushes. kmap_local_prot() will
> + * either map a highmem page with the proper pgprot on HIGHMEM=y systems or
>  * reference already set-up mappings.
>  *
>  * Neither of the buffer objects may be placed in PCI memory
> @@ -500,9 +494,9 @@ int vmw_bo_cpu_blit(struct ttm_buffer_ob
> 	}
> out:
> 	if (d.src_addr)
> -		kunmap_atomic(d.src_addr);
> +		kunmap_local(d.src_addr);
> 	if (d.dst_addr)
> -		kunmap_atomic(d.dst_addr);
> +		kunmap_local(d.dst_addr);
> 
> 	return ret;
> }


Looks good. Thanks.

Reviewed-by: Zack Rusin <zackr@vmware.com>

z

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
