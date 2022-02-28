Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BC44C6C08
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 13:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD5910E6B4;
	Mon, 28 Feb 2022 12:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131F410E456;
 Mon, 28 Feb 2022 12:19:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gak+0VG7f2cK1qGBIYboMz3Rmo1e2+a3Qadt70yr+SXalhPkhKa3w30ibrppZy7J9X0U+bYR1DEsjxK7vkl+BudKRh2xhxnGWokUrtqa9Ya7IfUQlH57vxKDpZGaToSEDW9l7aFNG3sxll4z7Cw3o6ihXkNwnjdKSc8q1j7cNYGZijzB+GOgJtLQlm3hrumQbSSOfCPjerllCYNa+Y6byoisv/EQrCAg39Paj09WWowL67ZuiWACgQOClzLerq7E1FeC0W9wdN7gFQiQmga03SsKY43ILsXZUa9Mucd961jBDV7QKl9s8tl1ErdLe8FWGo3uTdaFMixnDJB0vZmePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFAhmo3JBYJdhOBKzHNL9AJtIawE+V/fgYNxajT2ljI=;
 b=SzZWjd1fmgSJStHirEOCRnkAmcu3OmudpoaEyqknhomm8RjYXkMjnw1ABFAQ2dq8DbNrpQGxXY9ZQCiz+GnKJJqoOOTTXEuSJttXUAE7tqLVwj72QyYBoUE01Ym1R2ysVx8qf1JEPCuK12Olclw0Hna1trvdCt7Ic2GSai4vecGnv3uFeBp1cenwkYIGQD/CdiTDXQhMTXAYac+GdgHxinfvyCaI+nKqXhAaeYMEQJpqURd4/Dsaya54VHucuv6Zoch9wWHfqV2fB2v0eT2viWGd7XTwAYkc5qGDRx9T7ETYzGx6t8awxL24AQJ31xn8GI8ufl45Byu3EOXIQm4IMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFAhmo3JBYJdhOBKzHNL9AJtIawE+V/fgYNxajT2ljI=;
 b=AlIDg5tMzU18Zc+t9R+CoEaHA+AOb1jz/Nyu5OM7D+/2O/6lpB0dewE1ku3pJKeEoY8BydetUnPZUqFvCh2ilwJroT6ut+CA2XOTHnKRtbmsCQfR7AAIyWnBiCUAjqsHtIoqImAU9HMv8ZrZaEvOJGpDXNmlwxNnn4UlV4i6ZuQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MWHPR12MB1295.namprd12.prod.outlook.com (2603:10b6:300:11::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Mon, 28 Feb
 2022 12:19:30 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 12:19:30 +0000
Message-ID: <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
Date: Mon, 28 Feb 2022 13:19:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Content-Language: en-US
To: Jakob Koschel <jakobkoschel@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220228110822.491923-3-jakobkoschel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0051.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 927c171a-822c-407a-0fdb-08d9fab491db
X-MS-TrafficTypeDiagnostic: MWHPR12MB1295:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1295A5EA7DAABF83602189E383019@MWHPR12MB1295.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qxyezJsmPy26yjbJiE7nsfiUmF0CrlIboTAwmgzX+NACMNF0P25qUQTowXZYFwLnL07ApfYLgfmlTTlbgnXiRNw3HipcQ8YR9n20WGUM4qVXClwvgS2U+5fbxmfiL1YJ3b4dKP58UnnBLEPlJ59UilT4fZs46PS1fW/z09P1pFxsFPxnfyjzXR4SKtzdPjD8pdLQ8Kuy+2l0dAgEnArYv3uj5znNa1rQ1Hoq/K9GX8bP7u3bYhwZ3G7tvOtwzFR8Ta2MGzOk18aOUbCOKf9+NPI1BAokmmASt6vuYyQl9d6diYO5nnGHvlTt8B97TsJduPfAWtmOXc4pGnhEnGvVkJzJ9Q5UoXw6MGsLnQFAvjCFOS5HUttb3W5KQYRHVWSwfogIFAGfvtFO+lDHC+zygYhcr4vKIF5NwmlrjZe/eYf8EP+TvHA9+tl3ASpRWWdauBP0CwG4cAkCxjiJR/bBkhVEPuvZl3gldzU8eZLh6J409seJbpIj1B3mXQakZi/ADxm0gFDuRFrSFkrLksAlJNLnP2ba8pyWbR8sZiD7/xv+btdb9URSvZP51q7+HLGr+O6HkKjfWrXmkHOpnHpQ0HDh1kufULkKjdiTyUbvjlsAcLox6Kv+USztKXk8wsuMfL7cp8xrU8lMEmEm4ojd6a9DhZsM9Wdu+UjIl4m5D/tT+6dGUe98wGH7LMWEEawZ3jSOjYoFYkV7E4/D5zrhIvYMsvhiVWs/D7ffpMq0AfurcvoBBzJjFVjkZdegPoSo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7406005)(6512007)(5660300002)(7366002)(7416002)(6506007)(31686004)(36756003)(6486002)(2906002)(83380400001)(2616005)(54906003)(508600001)(110136005)(31696002)(8936002)(86362001)(186003)(38100700002)(6666004)(316002)(4326008)(66476007)(66946007)(66556008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnVEZUhHVmdLQlRDREtha0hYNEd6bWZuNDJmWmFJc2I4MHI3amtWSVdaSTNv?=
 =?utf-8?B?VkxUUUMxWU5QSzNpSHU3QzdicVZ0RWFpcTc2NHk5aVJLaUF6S2EreTNldTd2?=
 =?utf-8?B?Y1ZDZEcwakpzV0VORi9yNmt5YktCVWVlaWVSTmlQWjNUZDAyQ0NBOFlKV1R0?=
 =?utf-8?B?K3VIQnZ3N1k2ajl6WURIOTVYRmdkbzFBUlFQY1ZIVDl5ZVVNZE04WWY3RzdI?=
 =?utf-8?B?NFBENGxZMVh3KzdYSmVKYzB2MlY1YytOZ3pQdjZ1NHdiRmtNSlQwYjYrSGJS?=
 =?utf-8?B?S0lmS3RRUVU1TGh2Ym0yQkdmWWFzN1VwSmNzQW1IR0RmMmU4SjZ5Mm0ydXVP?=
 =?utf-8?B?UEN6a3N0aGJVQkQrTG5nWTVYTzVDQkI1dGxlMURwN0N2Rk1FN0g1VnNKZWVW?=
 =?utf-8?B?S1VoamV3L1BKLzBnaEdCWUhEN2I3ZERSM21LVXBEcVo1M011QmVuQXZMS05Z?=
 =?utf-8?B?NFNEV2tydTR2VlFkMlNESjdzVGhaNW1PNjlBNDA0bEthUnBJc3F3UkhvaE9o?=
 =?utf-8?B?M2ZyVVcvMTNvSU13ZTl0UTRUTXZFY3IzZmxlcnlnZ2FudWM3dXZOZ3IvNEVD?=
 =?utf-8?B?cS96alNTbmFWNzZrcUVJdUgzeGM5MCs0c2JKWUZMRnkzR3E2TVUycTB2RVFy?=
 =?utf-8?B?MzE4QUtkUmQ4bCtqcmI0QktyYVVmd3k5eXZ0Z1R4ejZwekhIUFYyUjRYVkQ0?=
 =?utf-8?B?Z1JiUWpWbzRITWtSc1FTV2lIY0ZlTzhKampXVVhwbk1qbTE4NXNobDNUdWdo?=
 =?utf-8?B?dngxTjRLTGlpYmVtYzBaZWJPNEs0Nkg0Q05ERDY1RjBzZVlZMks1UVhlYTNT?=
 =?utf-8?B?LytTbGxaV29uWFpiYmRlVjc4QUh1OEYwT3FUbHpXZDNkbnNZVkJWZHArZ0Zx?=
 =?utf-8?B?bFFMV2FTUHhtZ3BJSTNzeEd1QnpZS21nWiszbEpxWXNSOU4wb3FWUEd6WUN6?=
 =?utf-8?B?bmc4OEZ4RGY3N2tsdFdhRVZhR1E5YU1QUFJFSnAxb2s1SjI0YkRYeW1ybDI5?=
 =?utf-8?B?YzQ2c0lJZ3ZSQXVZNVVYWHFMTENXclNua3lORlhuM3Bac2pLUVQ1aFdQYldQ?=
 =?utf-8?B?Qm5iVnM2RTBoYVV6eWlVWDdFTG1NaGdZeDVVeG5HdmxGOW9oVkIxMk5GanRC?=
 =?utf-8?B?L1RxOVNMOHduYUNLM0VYbzg3TTd1TmxPQjZOV2ZzZjRScjRoejlaTURnVHJj?=
 =?utf-8?B?V3E5MHZyS0FNc0VRSmg2aGM1MVhUeFppdnBjbWtSQjUxY3hjTW9sVytKY0tl?=
 =?utf-8?B?bXI2MjJNMFZRTzZSajQyMEpHMnBqZThxK2ljY0pIN2NkemdCazdMYWZTZXhO?=
 =?utf-8?B?THpWZE9iVG16UkZvNENTUkpzdkI4eFNvMGxTWi96Q214R20xeWQ2Q3ZhZEN4?=
 =?utf-8?B?ZmZJb1N2WXc0NUsreUM5ekFOc1dlQTJQVkN5TW1QSy82WmZLTkorNE1aNzNE?=
 =?utf-8?B?dFhzdnk2dys4RmtUVytnZk9Zdlhrb1ptMFk3SWlCYmpUS1JxcGRLdWNkZTV5?=
 =?utf-8?B?K3h1SFcrOFliSWhzZWt5eGFINWpaWEFXL0FpNWRRelJOd0JMS3lpdDFEMUdP?=
 =?utf-8?B?eDhPQjhjVm9MS2xoYTgvdTlGbFd5WnZ4cW9uNjRHWWdueXlwZUJRWVBGN1Bm?=
 =?utf-8?B?b2tlcmh3Tm5pU0drcVBTVVltN2w2OXpPZS9tSjd6YTY1dTJMY1MzQnB5eUQ1?=
 =?utf-8?B?c2VHME0zd3N4dVIrUVlKeE4xcVJ0QWI2dW9vaEpkelNsVXM3cWZqRGlEZTJP?=
 =?utf-8?B?MUY2RHR3MWZ0Yk82NSthdy9FTG1CQ3J4YnFMakU5UUtlZWJlN1NXazR5a1NZ?=
 =?utf-8?B?d09rUmV5QXpwTjMzK2F6SVRZNFNMTGtlUCtTNS9qc3Byc3ZaRUJFQUtJTW5y?=
 =?utf-8?B?NUNYck1SckJLTnpOR1d4L3Rpb21OSHlSR1JkVDdZZlVGUjVXWGxlRTA2bmg5?=
 =?utf-8?B?U1JDZXdQUjd0WkVjajE4dFY0QWpYNkN1cGVxdFR1OVkxUFlGUjRaUzhEQWlp?=
 =?utf-8?B?cjYwaWc1L2Y0NTVzd3lrMlBodGMybWZLb2VUWWx2US9EclJjR29OaEZ1ZjZ4?=
 =?utf-8?B?UFdYck5CMlA2UytrZUdob1Z6YjdnTEh6cElLT0lLMjByVGJJOTBZRWE1Um5h?=
 =?utf-8?B?QmZ2OFNhNXBNU1lwVGI5YkNoRnRSdFdqeGRSbmFkL1I2anJyRXZ0bW5IeVI4?=
 =?utf-8?Q?R6iIn8pdIonNpLAFjDShZ1w=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 927c171a-822c-407a-0fdb-08d9fab491db
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 12:19:30.0401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yz+/jU3IY5U41ZTP4nxROOoIIb/zKsZboh12RZsNA0NdemZ8rLgm5wIEvLhrWIBd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1295
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
Cc: linux-wireless@vger.kernel.org, alsa-devel@alsa-project.org,
 kvm@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel@lists.freedesktop.org,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, amd-gfx@lists.freedesktop.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, "Bos,
 H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dmaengine@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 linux-block@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.02.22 um 12:08 schrieb Jakob Koschel:
> If the list does not contain the expected element, the value of
> list_for_each_entry() iterator will not point to a valid structure.
> To avoid type confusion in such case, the list iterator
> scope will be limited to list_for_each_entry() loop.

We explicitly have the list_entry_is_head() macro to test after a loop 
if the element pointer points to the head of the list instead of a valid 
list entry.

So at least from my side I absolutely don't think that this is a good idea.

> In preparation to limiting scope of a list iterator to the list traversal
> loop, use a dedicated pointer to point to the found element.
> Determining if an element was found is then simply checking if
> the pointer is != NULL.

Since when do we actually want to do this?

Take this code here as an example:
> diff --git a/arch/x86/kernel/cpu/sgx/encl.c b/arch/x86/kernel/cpu/sgx/encl.c
> index 48afe96ae0f0..6c916416decc 100644
> --- a/arch/x86/kernel/cpu/sgx/encl.c
> +++ b/arch/x86/kernel/cpu/sgx/encl.c
> @@ -450,7 +450,8 @@ static void sgx_mmu_notifier_release(struct mmu_notifier *mn,
>   				     struct mm_struct *mm)
>   {
>   	struct sgx_encl_mm *encl_mm = container_of(mn, struct sgx_encl_mm, mmu_notifier);
> -	struct sgx_encl_mm *tmp = NULL;
> +	struct sgx_encl_mm *found_encl_mm = NULL;
> +	struct sgx_encl_mm *tmp;
>
>   	/*
>   	 * The enclave itself can remove encl_mm.  Note, objects can't be moved
> @@ -460,12 +461,13 @@ static void sgx_mmu_notifier_release(struct mmu_notifier *mn,
>   	list_for_each_entry(tmp, &encl_mm->encl->mm_list, list) {
>   		if (tmp == encl_mm) {
>   			list_del_rcu(&encl_mm->list);
> +			found_encl_mm = tmp;
>   			break;
>   		}
>   	}
>   	spin_unlock(&encl_mm->encl->mm_lock);
>
> -	if (tmp == encl_mm) {
> +	if (found_encl_mm) {
>   		synchronize_srcu(&encl_mm->encl->srcu);
>   		mmu_notifier_put(mn);
>   	}

I don't think that using the extra variable makes the code in any way 
more reliable or easier to read.

Regards,
Christian.
