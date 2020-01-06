Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF69131021
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 11:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC92589E9E;
	Mon,  6 Jan 2020 10:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E2189E9E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 10:15:36 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ioPQ4-0002KV-M8; Mon, 06 Jan 2020 11:15:32 +0100
Message-ID: <82299ef95e44190d9bcea29bacb5651f3dc75b64.camel@pengutronix.de>
Subject: Re: [PATCH 5/6] drm/etnaviv: update hwdb selection logic
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 linux-kernel@vger.kernel.org
Date: Mon, 06 Jan 2020 11:15:32 +0100
In-Reply-To: <20200102100230.420009-6-christian.gmeiner@gmail.com>
References: <20200102100230.420009-1-christian.gmeiner@gmail.com>
 <20200102100230.420009-6-christian.gmeiner@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Do, 2020-01-02 at 11:02 +0100, Christian Gmeiner wrote:
> Take product id, customer id and eco id into account. If that
> delivers no match try a search for model and revision.
> 
> Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> index eb0f3eb87ced..d1744f1b44b1 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> @@ -44,9 +44,26 @@ bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu)
>  	struct etnaviv_chip_identity *ident = &gpu->identity;
>  	int i;
>  
> +	/* accurate match */
>  	for (i = 0; i < ARRAY_SIZE(etnaviv_chip_identities); i++) {
>  		if (etnaviv_chip_identities[i].model == ident->model &&
> -		    etnaviv_chip_identities[i].revision == ident->revision) {
> +		    etnaviv_chip_identities[i].revision == ident->revision &&
> +		    etnaviv_chip_identities[i].product_id == ident->product_id &&

Why not simply make this:
(etnaviv_chip_identities[i].product_id == ident->product_id ||
etnaviv_chip_identities[i].product_id == ~0U)
and similar for customer and eco ID?

With this we don't need two different walks through the HWDB, as long
as the more specific entries in the DB are ordered to the front of the
array.

Regards,
Lucas

> +		    etnaviv_chip_identities[i].customer_id == ident->customer_id &&
> +		    etnaviv_chip_identities[i].eco_id == ident->eco_id) {
> +			memcpy(ident, &etnaviv_chip_identities[i],
> +			       sizeof(*ident));
> +			return true;
> +		}
> +	}
> +
> +	/* match based only on model and revision */
> +	for (i = 0; i < ARRAY_SIZE(etnaviv_chip_identities); i++) {
> +		if (etnaviv_chip_identities[i].model == ident->model &&
> +		    etnaviv_chip_identities[i].revision == ident->revision &&
> +		    etnaviv_chip_identities[i].product_id == ~0U &&
> +		    etnaviv_chip_identities[i].customer_id == ~0U &&
> +		    etnaviv_chip_identities[i].eco_id == ~0U) {
>  			memcpy(ident, &etnaviv_chip_identities[i],
>  			       sizeof(*ident));
>  			return true;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
