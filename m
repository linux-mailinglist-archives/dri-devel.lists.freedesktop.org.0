Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B44B37706E
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 09:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF986E861;
	Sat,  8 May 2021 07:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF206E85B;
 Sat,  8 May 2021 07:34:27 +0000 (UTC)
Received: from pmoreau.org (unknown [88.129.173.226])
 (Authenticated sender: pierre.morrow@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 605A1B0053E;
 Sat,  8 May 2021 09:34:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1620459265;
 bh=CoRmAemj/IAoMOFqzKxhniIqN+11bAiqsffykCtDA5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F8AoDu73pLmKkDzdHapqCOTc9l2GpsNhhWg7LvSeQwEiaEfCKTiLc2DS2OvA/dUCs
 KHvWNs8pUEEB/fz1cz9YU8M96mF8JBvMe4mK4ZGcNZOCD7DfqUl1+LfRseYfPagMPB
 7IdmCnLyWLcJG6rbIhe+YSkU2onMgCudJhxn53BMgWTdXwm/JSN1lILpGM4Qlw4rAe
 iwxHaF6cSca/IwOUfyPxH+P27I4BD19siDm9zhrh/BEw0ifQcYIh/6BjggPWy7HLbx
 7TL4cvMESw4zd61rVDqO087ybwoFjoFLMjf5XD+95VS4Cn9pMlkWxRn7TZbA7rxLYf
 sWi+JvOGdN2JA==
Date: Sat, 8 May 2021 09:34:00 +0200
From: Pierre Moreau <pierre.morrow@free.fr>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] drm/nouveau: fix error return code in
 nouveau_backlight_init()
Message-ID: <20210508073400.nnmwwyoxqqiwv36w@pmoreau.org>
Mail-Followup-To: Zhen Lei <thunder.leizhen@huawei.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20210508034810.2374-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210508034810.2374-1-thunder.leizhen@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Zhen,

There was a similar patch sent in last month, though which does not seem to
have been merged yet; see
https://lists.freedesktop.org/archives/nouveau/2021-April/038451.html.

Whether `ret` should be `-ENOSPC` or `-ENOMEM` is hard to say as
`nouveau_get_backlight_name()` could fail due to either.

I will propose an alternative fix which modifies `nouveau_get_backlight_name()`
to return an int so the actual error code can be propagated back instead of
guessed, as well as fix an ida ID leak which I just spotted.

Best,
Pierre

On 2021-05-08 — 11:48, Zhen Lei wrote:
> Fix to return a negative error code from the error handling case instead
> of 0, as done elsewhere in this function.
> 
> Fixes: db1a0ae21461 ("drm/nouveau/bl: Assign different names to interfaces")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index 72f35a2babcb..097ca344a086 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -273,6 +273,7 @@ nouveau_backlight_init(struct drm_connector *connector)
>  		return -ENOMEM;
>  
>  	if (!nouveau_get_backlight_name(backlight_name, bl)) {
> +		ret = -ENOSPC;
>  		NV_ERROR(drm, "Failed to retrieve a unique name for the backlight interface\n");
>  		goto fail_alloc;
>  	}
> -- 
> 2.25.1
> 
> 
