Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FE8A87DB7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 12:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D25310E584;
	Mon, 14 Apr 2025 10:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="JYeKybYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C11310E55F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 10:31:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744626703; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nTLVkhIsq9RBHPUaKnikIyBxWByI1Zaat/dct1C2ozXmLIFFHhFaz3ONrgBI5u0aBPUvR0r/DGXGpDY3npOAPxugP+RvqG2rOGj6/zLXMOfPTHgUNm9wcW1IeTGaNA/HfkIGHbCCtHljBBKe/Od9mQOm3Mk8ntLUsJmBSu3sO5s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744626703;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=aSADvVEnfEIn9si+2qgVA0VnF3NlSDH9GdPt3ypWHPQ=; 
 b=Ab/0ZxRluyq7apmGM9evTelbucrQN7LWHBT4H39f7W6Q21/z46K8zP9Fym2j7ED+H3mVJLEnrz3vfDEu5ltMHG2iwI0B+tJ4H9FrTVAm/PcVzZI1dbCWYy/wjcQSvBJGpbbJJvrrB9m2lQxo9J6Q7GEBmqjuAG0MwEPfkBesiqk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744626703; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=aSADvVEnfEIn9si+2qgVA0VnF3NlSDH9GdPt3ypWHPQ=;
 b=JYeKybYJuOlF/G9c2sC8/tvTFlqvmpMrB1d0DcWXRbAqMQEU+PBKUvkARnlRe70r
 6awmF4EXU/qjYutgtuuSG+9dHQzdeQtKyicZjwiqucIx9MjvZn+L5KKzVfUeeo2bLGn
 sNb1OfGCGKPKDCrniiVYLiv91Nec+89KbgULp6ZU=
Received: by mx.zohomail.com with SMTPS id 1744626701723504.2927375934539;
 Mon, 14 Apr 2025 03:31:41 -0700 (PDT)
Message-ID: <155da4a7-cfca-4df4-bb8e-7c4bea59c9f4@collabora.com>
Date: Mon, 14 Apr 2025 13:31:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/client: Do not pin in drm_client_buffer_vmap()
To: Thomas Zimmermann <tzimmermann@suse.de>, boris.brezillon@collabora.com,
 airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20250404132907.225803-1-tzimmermann@suse.de>
 <20250404132907.225803-2-tzimmermann@suse.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20250404132907.225803-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 4/4/25 16:23, Thomas Zimmermann wrote:
> +int drm_client_buffer_vmap(struct drm_client_buffer *buffer,
> +			   struct iosys_map *map_copy)
>  {
>  	struct drm_gem_object *gem = buffer->gem;
>  	struct iosys_map *map = &buffer->map;
>  	int ret;
>  
>  	drm_gem_lock(gem);
> -
> -	ret = drm_gem_pin_locked(gem);
> -	if (ret)
> -		goto err_drm_gem_pin_locked;
>  	ret = drm_gem_vmap_locked(gem, map);
> -	if (ret)
> -		goto err_drm_gem_vmap;
> -
>  	drm_gem_unlock(gem);

The lock+unlock can be replaced with a single drm_gem_vmap_unlocked().

-- 
Best regards,
Dmitry
