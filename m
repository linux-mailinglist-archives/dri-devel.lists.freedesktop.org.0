Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E65F32EEF0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 16:35:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653856EBB5;
	Fri,  5 Mar 2021 15:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D04E6EC03;
 Fri,  5 Mar 2021 15:35:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJSaqcO5vRbeiwOgiMrqLNxcU3un2pgu56TivVCOqIAJw2v4zg4GcPZW/AlWUhlJeNv7Yb4MwXVd++TfKcRE9S3klaWKbkI1RC++LSCK/KYBl8CSP/Y38FakpuLM2ABrHsaEi8WGSoWajGIUEpiLz2Yfs6M8XFjucbMGL6h6wkHi4qzrsuADmYFIqLgLlaiVvQrhQnpvIh2sLFixccCHNfXA2VjFBUi8KU13xuL1UI+mkuU7kMKai02xrUrVPN3lOx8GlLjVxxp6+AwJFXLA30zJz0VyB8+fzzuugWQtL2XhZ6d0ld2b5Fyz22Pl3ZrrSEqTMoNTeBVfPjObQzg/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NO+U6nYbDCh7eZLDdcFjLaKVE47rBO77ruo/hFRD7bA=;
 b=YRrOTMAClGLDDODxF6N9XKoaLtwwxRteayN/+710/x3ugrouDtwQiv/qRcAjiUh7XEM0qgzn3LqOMwZeGnyxw3vLrhkMu7Cua/3d5Z84WWFWynXWJQTJ7eYGbS38SZytAEbbuNunc7HBbKHk+FHHNporXxqz3BTsnTTtBtFBIYG7dLZW1yAPrRrbvhqT1HIfewipJBPq4PBavLtGeNWDmNWQjQLqQwc/AZi8eZPqfsxeV4q18ljxh2eIzR/szvlYoFQZQ8oStSMIcQ+m/ctjP//pjNcH1tWdmR/9Pc7XGQFRFERSIqAogKZ8/gPPPPMyOuw7PMQp9uJPQPa4AZUb/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NO+U6nYbDCh7eZLDdcFjLaKVE47rBO77ruo/hFRD7bA=;
 b=PTBiJWfr6hUzMEungzHLD+PzUp2lwbzdugWmzM4kvqDrCfPPqPOda4YOW7oGwCfDAnHldTgnHyyslMEvjyZeLSGm8rFjFFe3ESz86SU4V7n2ZaFREm0hNfKAqFex65JswHMwrqOUGS57/FbBYnqknEkNOcn+zF7R8zuaB/Rspi8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=vmware.com;
Received: from SN6PR05MB5759.namprd05.prod.outlook.com (2603:10b6:805:103::19)
 by SN7PR05MB7776.namprd05.prod.outlook.com (2603:10b6:806:10e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.13; Fri, 5 Mar
 2021 15:35:51 +0000
Received: from SN6PR05MB5759.namprd05.prod.outlook.com
 ([fe80::24ea:f168:e288:980a]) by SN6PR05MB5759.namprd05.prod.outlook.com
 ([fe80::24ea:f168:e288:980a%5]) with mapi id 15.20.3912.023; Fri, 5 Mar 2021
 15:35:51 +0000
Subject: Re: [patch 2/7] drm/vmgfx: Replace kmap_atomic()
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <20210303132023.077167457@linutronix.de>
 <20210303132711.487711828@linutronix.de>
From: Roland Scheidegger <sroland@vmware.com>
Message-ID: <5ea9de05-31a1-855f-ab28-49c0cb6b724c@vmware.com>
Date: Fri, 5 Mar 2021 16:35:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
In-Reply-To: <20210303132711.487711828@linutronix.de>
Content-Language: de-DE
X-Originating-IP: [46.126.183.173]
X-ClientProxiedBy: GVAP278CA0006.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:20::16) To SN6PR05MB5759.namprd05.prod.outlook.com
 (2603:10b6:805:103::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.125] (46.126.183.173) by
 GVAP278CA0006.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:20::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 15:35:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56c967c0-4a56-49a8-4a18-08d8dfec5b14
X-MS-TrafficTypeDiagnostic: SN7PR05MB7776:
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN7PR05MB777677942214BB2CB9209A4BC6969@SN7PR05MB7776.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NofJGWdatcpXpusWZDcrXHRCinDXEfmJlN1kKEUlO5jOhXVIQ2lJS7huuJssfv1NqExPR7IXGPBH2KFVqEucTrumVDvsyfYrB5Usbc66kFHp9mWEgMTII2nqTLYWWginOPYFFTObp8k76my9R6CZ39B7hMvYND+plW8RhSNilVBZdlszlNbnehKmWzkHeG20r8AkPAxC8owa0dJeY/UCmES3PxA5VSeRiuzA2WK7vMcqghWGjQqA+/1XyY6bT8ctlZYveGmIcN5HmZGX+SLrhgZLe8yHbU5VI8LmAWlApXIOLGuZaoT2RT2PaUph7eheI5v833ey8wQgepeV0aWrN4GcQTwE6iKyrSxL8egn8PAHRqsYDWuYgUKKBiqn6ek+GzCYOg/c5UQ3wBXtbYWa2mgqSwsOloZbw++O/q0YxBnWI/r5tCEedOOJs1/0fjCD7SqxFb3Q8r+eHGVnH/hLD3F9ZjR9fCxpUsjSI5+6oIJ+WuN8XSQ48Bcub31FnPy37EQJpMzdmqc6yHdkC4ZCgrClYkhW++yf9XAKe3PJU/gNoXHAgzXbEnCTDzmcVSBXRONTOYexmWJFbzfdyIvT6y4l/7HL87EFl/tlXzOdoFABOK97IdQIshO5OlammF/IRHWB3fkNnq2vT9MtKRzD4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR05MB5759.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(478600001)(5660300002)(2906002)(316002)(956004)(2616005)(26005)(6666004)(186003)(53546011)(8936002)(86362001)(8676002)(36756003)(6486002)(83380400001)(31686004)(16576012)(4326008)(54906003)(7416002)(66476007)(31696002)(110136005)(16526019)(66946007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U1lSSXRrS0c3eDV6aytYb1NDd1k1NDVNb3U4NzlDbEVSSG5RRFUvbXZnaklU?=
 =?utf-8?B?SW1QbEZTTVNaWE1CMVIzQk82WjVsRnBuZDg3MDVXQTZYbkZUWUptRXZDSDdQ?=
 =?utf-8?B?U2U5Z2oyMzBseGZlR0t2MmZQWEhUQjFpSjBNQ2w5UmlPZkxmUGwwdGNVeUI2?=
 =?utf-8?B?K3dScVo4VlRoN2FJOXFkSnJxcE1haDVUQ3ZZcktYUjhaaWRQZE1WTHRBYnZj?=
 =?utf-8?B?OXFhc1ZBeHdpenNiNGZucTJaT2EyelJXWms5aDI1cVlZNWFkR0c4YUgrTjhQ?=
 =?utf-8?B?TVZqVEhqaEhpWEczbTYvd0FQSDZuVDBpUG5ib0h1dkhmNjVpZDF0RjY0MmVU?=
 =?utf-8?B?VW02QXNGWGsxQ25BbHZjWUMzVlN0bW5zSlRLallkZUVZTFNzQTg4d0IrS2xx?=
 =?utf-8?B?ZHN6QTNmNm5BM2JId0Z0TWt4ckROSXpKdkk3T1NXdW85YmMvQ0MyVFNyYTd3?=
 =?utf-8?B?U1RBbUdodDRJOGhURXpxbFYxNUZHSUZWdXZ2bUJyZ21TUGJSZmNCcEpMM2pu?=
 =?utf-8?B?NGVsVTFWdGxrbUJzSnQvQUhSamVabEQxdld2THd0RzJBVi9tZmQwRkUwcnc5?=
 =?utf-8?B?MWl4Z1IzTzVkUUNhNlYzeFRxN0h6QjJ4U1JCVmZuQXE0a1U0bHByNW9QMW5h?=
 =?utf-8?B?OXNlQ3V0OEErU2pCY3lvZFpaVnZzd2R0ZjV6RUtkclRuQzV1dEk2UlNlRVMx?=
 =?utf-8?B?THBpelRzZS9CbnRtbnpTSnUrQ3Qvd1Jpc1l1RGV1R3ErQzJyNUxQZWxvUUor?=
 =?utf-8?B?ZkFqRXJhc1FPM3VIcWwzUVFpb2lIcVJ5YnFaaVRWN1R1SURwUDl3Y3BWV2tZ?=
 =?utf-8?B?aVJEZWplUkdObTZTK0dvYlVOSVhQcEdsbytlMWV0TklKS1pRalBWSU1xdHpU?=
 =?utf-8?B?Yk1INDA4aFRDMjMrZnFZTFRJVFM1aVFkZ1VLVmtmbXZVZWZxa1ZpcGFwaEU2?=
 =?utf-8?B?WGJHMUtzeWpmekI4U2xNSzZiTkhQREdMR21WTU1yS09vTWFPL1FyVTZlWTB0?=
 =?utf-8?B?QVY0WTI0TWRCa045bWpXUzFZREFkbHI3RnRadlFEMTRZTER3NldQcHFiZGJx?=
 =?utf-8?B?UHZ4UHpMUGxYSUFsZ3ZpMmJ0VmxWMHFLck5PTkpHN2VuU09xOVJ0SmtzTU9X?=
 =?utf-8?B?UDh4T1haNUVQb0VwYko5cFZVd3g1YmtSbnUxQkFIWjhWLzlzSzEvbVVHTXly?=
 =?utf-8?B?b29sR1dOZlY3RjhkSWRvSlVpU1dzZGtnZUwyakY2YjM0OVpiUlI0Wm9UK2Rq?=
 =?utf-8?B?cUZ5V3YxeTZMWlVvNkpmU2JNb1dlcUlpMnR4RzBOUEFtdE1IcjNlMjVzZ1Iz?=
 =?utf-8?B?b1owdjRYa2t3Wk0wbVIrQXk3WEZHME81bFNyV0NxdzRybUUxajRic2pYazNo?=
 =?utf-8?B?bDFQMTRDOTlUanF2V3FSVU5CWWprdWZubkhKQ2FIRVRzWWJ5YUZzUzRIUkl5?=
 =?utf-8?B?blFjS1RVU1JDWjY4UkVFN0RUVDB2U21ZUDhCNmlGVUtUR0tsTlMwUGczNk1s?=
 =?utf-8?B?SkM5V1FYc3F4Uy9TbWJGekFpRFJ4a1c4UHZ0eVEyZjJlbUF5YnU2NW1IelRO?=
 =?utf-8?B?cC9kNlRIdFpQblNhWjhxa0ljQTBtMjVCQUVRdjJqWEFJdWhxdTZJL3laTlUz?=
 =?utf-8?B?RWFBTUlwb2g1WEYwbDhmejY2VXVvbC9LZlVXT1pmakcrSy9VTlNnVERpcitU?=
 =?utf-8?B?NnBKUDV2MEhaZ3BoTGo4SmNCL1VKdkdMd1hsMTE1d0E2L3A4TER3Ni9PVUlE?=
 =?utf-8?Q?hYuyaS3lRrd9+hdM/XkzwS/3h/KM4kVs+/4kxR8?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c967c0-4a56-49a8-4a18-08d8dfec5b14
X-MS-Exchange-CrossTenant-AuthSource: SN6PR05MB5759.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 15:35:51.0505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OkYcfP3kGmfcdbbLoc4DFutXVefiF7ZRu+JYoHaI0hvP8HvObkU+7ujbp6eYzeiVciIWfHtZJezMYD1uUZlEpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR05MB7776
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 spice-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Christian Koenig <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03.03.21 14:20, Thomas Gleixner wrote:
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
>  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c |   30 ++++++++++++------------------
>  1 file changed, 12 insertions(+), 18 deletions(-)
> 
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> @@ -375,12 +375,12 @@ static int vmw_bo_cpu_blit_line(struct v
>  		copy_size = min_t(u32, copy_size, PAGE_SIZE - src_page_offset);
>  
>  		if (unmap_src) {
> -			kunmap_atomic(d->src_addr);
> +			kunmap_local(d->src_addr);
>  			d->src_addr = NULL;
>  		}
>  
>  		if (unmap_dst) {
> -			kunmap_atomic(d->dst_addr);
> +			kunmap_local(d->dst_addr);
>  			d->dst_addr = NULL;
>  		}
>  
> @@ -388,12 +388,8 @@ static int vmw_bo_cpu_blit_line(struct v
>  			if (WARN_ON_ONCE(dst_page >= d->dst_num_pages))
>  				return -EINVAL;
>  
> -			d->dst_addr =
> -				kmap_atomic_prot(d->dst_pages[dst_page],
> -						 d->dst_prot);
> -			if (!d->dst_addr)
> -				return -ENOMEM;
> -
> +			d->dst_addr = kmap_local_page_prot(d->dst_pages[dst_page],
> +							   d->dst_prot);
>  			d->mapped_dst = dst_page;
>  		}
>  
> @@ -401,12 +397,8 @@ static int vmw_bo_cpu_blit_line(struct v
>  			if (WARN_ON_ONCE(src_page >= d->src_num_pages))
>  				return -EINVAL;
>  
> -			d->src_addr =
> -				kmap_atomic_prot(d->src_pages[src_page],
> -						 d->src_prot);
> -			if (!d->src_addr)
> -				return -ENOMEM;
> -
> +			d->src_addr = kmap_local_page_prot(d->src_pages[src_page],
> +							   d->src_prot);
>  			d->mapped_src = src_page;
>  		}
>  		diff->do_cpy(diff, d->dst_addr + dst_page_offset,
> @@ -436,8 +428,10 @@ static int vmw_bo_cpu_blit_line(struct v
>   *
>   * Performs a CPU blit from one buffer object to another avoiding a full
>   * bo vmap which may exhaust- or fragment vmalloc space.
> - * On supported architectures (x86), we're using kmap_atomic which avoids
> - * cross-processor TLB- and cache flushes and may, on non-HIGHMEM systems
> + *
> + * On supported architectures (x86), we're using kmap_local_prot() which
> + * avoids cross-processor TLB- and cache flushes. kmap_local_prot() will
> + * either map a highmem page with the proper pgprot on HIGHMEM=y systems or
>   * reference already set-up mappings.
>   *
>   * Neither of the buffer objects may be placed in PCI memory
> @@ -500,9 +494,9 @@ int vmw_bo_cpu_blit(struct ttm_buffer_ob
>  	}
>  out:
>  	if (d.src_addr)
> -		kunmap_atomic(d.src_addr);
> +		kunmap_local(d.src_addr);
>  	if (d.dst_addr)
> -		kunmap_atomic(d.dst_addr);
> +		kunmap_local(d.dst_addr);
>  
>  	return ret;
>  }
> 
> 

Seems reasonable to me.
Reviewed-by: Roland Scheidegger <sroland@vmware.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
