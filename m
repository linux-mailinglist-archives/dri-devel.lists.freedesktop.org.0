Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBC135DBCB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 11:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F526E24E;
	Tue, 13 Apr 2021 09:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03556E24E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 09:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id A5EE13F4C5;
 Tue, 13 Apr 2021 11:52:44 +0200 (CEST)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Qw2WHpOR; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3aWoAbn1g9U8; Tue, 13 Apr 2021 11:52:43 +0200 (CEST)
Received: by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 40A543F3F8;
 Tue, 13 Apr 2021 11:52:42 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id CCA1D360220;
 Tue, 13 Apr 2021 11:52:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1618307563; bh=EOp67zFD5QbfXmV7XDrhHzTWFVbbVJEdXobzXFnj8h0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Qw2WHpORArkqzPYrsqzRt8U0lqx5vPkku4MrX/u/vUGPVTFii3wH56MEHJ/ZySVD5
 zBpQ0c6S7+g0DdEPjoL859YVTH3KrC2htmLKDuuSmYMwLxatE9/vQqRc9vn5oIvWSK
 K/cUYA7Mg4zS68oosxASlbakoFc5cd7Y6tN8SG3M=
Subject: Re: [PATCH v2] drm/vmwgfx: Make sure unpinning handles reservations
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20210410185956.720612-1-zackr@vmware.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <4dbce8ac-7c9f-630d-1587-e55c16778adf@shipmail.org>
Date: Tue, 13 Apr 2021 11:52:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210410185956.720612-1-zackr@vmware.com>
Content-Language: en-US
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
Cc: Martin Krastev <krastevm@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Zack,

On 4/10/21 8:59 PM, Zack Rusin wrote:
> Quite often it's a little hard to tell if reservations are already held
> in code paths that unpin bo's. While our pinning/unpinning code should
> be more explicit that requires a substential amount of work so instead
> we can avoid the issues by making sure we try to reserve before unpinning.
> Because we unpin those bo's only on destruction/error paths just that check
> tells us if we're already reserved or not and allows to cleanly unpin.
>
> Reviewed-by: Martin Krastev <krastevm@vmware.com>
> Reviewed-by: Roland Scheidegger <sroland@vmware.com>
> Fixes: d1a73c641afd ("drm/vmwgfx: Make sure we unpin no longer needed buffers")
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 11 +++++++++++
>   drivers/gpu/drm/vmwgfx/vmwgfx_mob.c | 18 ++++++++++++++----
>   2 files changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 8087a9013455..9a3133cb5cc1 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1523,8 +1523,19 @@ static inline void vmw_bo_unreference(struct vmw_buffer_object **buf)
>   
>   	*buf = NULL;
>   	if (tmp_buf != NULL) {
> +		/*
> +		 * currently pinning requires a reservation to be held
> +		 * but unreference can be called either reserved or not.
> +		 * To avoid deadloacks we have to try to get a reservation.
> +		 * This is exlusively to satisfy the requirements of the
> +		 * unpin, ttm_bo_put will handle delayed deletion for us
> +		 * in case the bo is really busy.
> +		 */
> +		bool locked = dma_resv_trylock(tmp_buf->base.base.resv);
>   		if (tmp_buf->base.pin_count > 0)
Hmm, Similar to the previous version, I figure someone another thread 
might be holding the lock and drop it here?
>   			ttm_bo_unpin(&tmp_buf->base);
And also, if this is a nested reference of a pinned buffer, you'd be 
incorrectly unpinning it.

/Thomas


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
