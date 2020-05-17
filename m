Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD8F1D67E1
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 14:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A83A6E09E;
	Sun, 17 May 2020 12:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9151E6E09A
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:03:55 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jaI1D-0006Nw-6U; Sun, 17 May 2020 14:03:47 +0200
Message-ID: <79f9e841042bf1c0fca39366d95cfb6f74da07bd.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: fix perfmon domain interation
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 linux-kernel@vger.kernel.org
Date: Sun, 17 May 2020 14:03:44 +0200
In-Reply-To: <20200511123744.96246-1-christian.gmeiner@gmail.com>
References: <20200511123744.96246-1-christian.gmeiner@gmail.com>
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

Am Montag, den 11.05.2020, 14:37 +0200 schrieb Christian Gmeiner:
> The GC860 has one GPU device which has a 2d and 3d core. In this case
> we want to expose perfmon information for both cores.
> 
> The driver has one array which contains all possible perfmon domains
> with some meta data - doms_meta. Here we can see that for the GC860
> two elements of that array are relevant:
> 
>   doms_3d: is at index 0 in the doms_meta array with 8 perfmon domains
>   doms_2d: is at index 1 in the doms_meta array with 1 perfmon domain
> 
> The userspace driver wants to get a list of all perfmon domains and
> their perfmon signals. This is done by iterating over all domains and
> their signals. If the userspace driver wants to access the domain with
> id 8 the kernel driver fails and returns invalid data from doms_3d with
> and invalid offset.
> 
> This results in:
>   Unable to handle kernel paging request at virtual address 00000000
> 
> On such a device it is not possible to use the userspace driver at all.
> 
> The fix for this off-by-one error is quite simple.
> 
> Reported-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Paul Cercueil <paul@crapouillou.net>
> Fixes: ed1dd899baa3 ("drm/etnaviv: rework perfmon query infrastructure")
> Cc: stable@vger.kernel.or

Missing last letter of the TLD.

> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> index e6795bafcbb9..35f7171e779a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> @@ -453,7 +453,7 @@ static const struct etnaviv_pm_domain *pm_domain(const struct etnaviv_gpu *gpu,
>  		if (!(gpu->identity.features & meta->feature))
>  			continue;
>  
> -		if (meta->nr_domains < (index - offset)) {
> +		if ((meta->nr_domains - 1) < (index - offset)) {

While the logic is correct, I find this quite hard to read. A more
idiomatic way to write this (which is much easier to grok when reading
the code IMHO) would be:

if (index - offset >= meta->nr_domains)

If you agree, please send a v2 of this patch.

Regards,
Lucas
>  			offset += meta->nr_domains;
>  			continue;
>  		}

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
