Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1412C7869C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4050710E829;
	Fri, 21 Nov 2025 10:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EA6npLno";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4104410E821
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 10:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qxl7bbzVx5Gt7YRXwsHz2cJkueNhtNhB7gB6FTrgGk8=; b=EA6npLnolTYhon4PioV4ehf+If
 ipMKrOC8jijwQGNLFfjqJNW7S4qqRwa71s6rzUwItc8DouAfJxVTYaJBnLc4QG6WTZ18pgS4lKbXR
 HgwS7iZJ2C1y7XB6civ3lioDPLRtectbck8SYFwspoLZa2ZpUUhyy4RMzfEKElUYflVa66ZkOahWV
 X9GHmZEiNzmnZsI/lNoTzkyXQ9y1llspMgsmHyqrSELBa/H5BCnF4ZxxpKSTYDZkSMlMp+ulkY8Tp
 cntTJ4RoWLIdqfzf7Hli/dn6UCm91G8EIhwL7SICLq8DA5ukNcj088qmt9LslQst5qulWDzlwmxwz
 qh23F/uQ==;
Received: from 179-125-79-205-dinamico.pombonet.net.br ([179.125.79.205]
 helo=quatroqueijos.cascardo.eti.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vMOAG-003c9V-K2; Fri, 21 Nov 2025 11:14:52 +0100
Date: Fri, 21 Nov 2025 07:14:46 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH 2/4] drm/ttm: Resource cannot be NULL in
 ttm_resource_intersects
Message-ID: <aSA7lpt_Pg2riyVf@quatroqueijos.cascardo.eti.br>
References: <20250919131530.91247-1-tvrtko.ursulin@igalia.com>
 <20250919131530.91247-3-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919131530.91247-3-tvrtko.ursulin@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 19, 2025 at 02:15:28PM +0100, Tvrtko Ursulin wrote:
> Function has a single caller and the resource cannot be NULL therefore
> remove the early return check.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/ttm/ttm_resource.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index e2c82ad07eb4..b78be0c342f2 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -445,9 +445,6 @@ bool ttm_resource_intersects(struct ttm_device *bdev,
>  {
>  	struct ttm_resource_manager *man;
>  
> -	if (!res)
> -		return false;
> -
>  	man = ttm_manager_type(bdev, res->mem_type);
>  	if (!place || !man->func->intersects)
>  		return true;
> -- 
> 2.48.0
> 

I see a single caller, where the resource is dereferenced right before the
function call, so:

Reviewed-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
