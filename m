Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8260314FAFA
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2020 00:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C412D6E546;
	Sat,  1 Feb 2020 23:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0151.hostedemail.com
 [216.40.44.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FB56E546
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Feb 2020 23:38:56 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id A4059182CED28;
 Sat,  1 Feb 2020 23:38:53 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::,
 RULES_HIT:41:355:379:599:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2525:2560:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3622:3865:3867:3868:3870:3871:3872:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:6119:8957:9025:10004:10400:10848:11026:11232:11657:11658:11914:12043:12297:12438:12555:12740:12760:12895:12986:13069:13311:13357:13439:14181:14659:14721:21080:21433:21451:21611:21627:21740:21795:21990:30051:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: flock06_30532222dbd16
X-Filterd-Recvd-Size: 2806
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf03.hostedemail.com (Postfix) with ESMTPA;
 Sat,  1 Feb 2020 23:38:51 +0000 (UTC)
Message-ID: <b9b671508d478469c1ad43206dd29d770bfb7818.camel@perches.com>
Subject: Re: [PATCH] drm/amdkfd: Make process queues logs less verbose
From: Joe Perches <joe@perches.com>
To: Julian Sax <jsbc@gmx.de>, amd-gfx@lists.freedesktop.org
Date: Sat, 01 Feb 2020 15:37:43 -0800
In-Reply-To: <20200201231101.2127964-1-jsbc@gmx.de>
References: <20200201231101.2127964-1-jsbc@gmx.de>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2020-02-02 at 00:11 +0100, Julian Sax wrote:
> During normal usage, especially if jobs are started and stopped in rapid
> succession, the kernel log is filled with messages like this:
> 
> [38732.522910] Restoring PASID 0x8003 queues
> [38732.666767] Evicting PASID 0x8003 queues
> [38732.714074] Restoring PASID 0x8003 queues
> [38732.815633] Evicting PASID 0x8003 queues
> [38732.834961] Restoring PASID 0x8003 queues
> [38732.840536] Evicting PASID 0x8003 queues
> [38732.869846] Restoring PASID 0x8003 queues
> [38732.893655] Evicting PASID 0x8003 queues
> [38732.927975] Restoring PASID 0x8003 queues
> 
> According to [1], these messages are expected, but they carry little
> value for the end user, so turn them into debug messages.
> 
> [1] https://github.com/RadeonOpenCompute/ROCm/issues/343

trivia:

> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
[]
> @@ -604,7 +604,7 @@ static int evict_process_queues_nocpsch(struct device_queue_manager *dqm,
>  		goto out;
> 
>  	pdd = qpd_to_pdd(qpd);
> -	pr_info_ratelimited("Evicting PASID 0x%x queues\n",
> +	pr_debug_ratelimited("Evicting PASID 0x%x queues\n",
>  			    pdd->process->pasid);

It would be nicer to realign all the subsequent lines in a
single statement to the now moved open parenthesis.

> 
>  	/* Mark all queues as evicted. Deactivate all active queues on
> @@ -650,7 +650,7 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
>  		goto out;
> 
>  	pdd = qpd_to_pdd(qpd);
> -	pr_info_ratelimited("Evicting PASID 0x%x queues\n",
> +	pr_debug_ratelimited("Evicting PASID 0x%x queues\n",
>  			    pdd->process->pasid);

etc...


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
