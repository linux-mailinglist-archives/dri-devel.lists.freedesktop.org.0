Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98E2A87DCA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 12:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB6C10E0A7;
	Mon, 14 Apr 2025 10:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="gk51CMqQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D030110E0A7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 10:37:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744627070; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UVyaK+btp2MtZ1kzXacaMOaU7IEVrqsVOQuZtDYrb6ugy3Rk7NOpNa7A7fuZWp2TnIz8Io+d9RqZAiAQ122t2DvqlQokyme7ebHm/o9N+gRzuks7tiKKaF/dRWRX5bIYaNmm6isA/eAldFVA7mwKVaj+Hedxhbqa9CMs0sRVZ10=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744627070;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ilenXFQjlA7aElJbnGnksuspLa1f/EIMKeY5OUhFTRE=; 
 b=BWRZXQv9pFncls+l+kEiG6tKQ22cRw5pHixPSVgRPGgFP+t8GV3+2aIEKF8zTLWA135lY1tg3s7Ow1woIwZ403aDx5Zek03eiWvFpHgEL63/cngVY6qgvsCNSK4LnN34TiLF/wNziVvqwBb6Vm3QE912F3aPz9CtvHvgRxVzvnE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744627070; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ilenXFQjlA7aElJbnGnksuspLa1f/EIMKeY5OUhFTRE=;
 b=gk51CMqQdhrpRnBH2sQYAVirkobum4QgZIbC1qsCGvCNrJiBAUEq97TYQsGgWcRf
 sYXPtZ66A5COpu1TF7cbKJHaJwWDIcxZp9mD9lFR9p82IjhC+Cl8UOoMjMWEJIRrjCy
 eUwXg0BfeBrIPfpUtPVY+nL/SaAcpxAC75271uMo=
Received: by mx.zohomail.com with SMTPS id 1744627058388857.7454732352876;
 Mon, 14 Apr 2025 03:37:38 -0700 (PDT)
Message-ID: <b0741bde-6d4d-4247-9051-9ffb811048fb@collabora.com>
Date: Mon, 14 Apr 2025 13:37:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/gem: Inline drm_gem_pin() into PRIME helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, boris.brezillon@collabora.com,
 airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20250404132907.225803-1-tzimmermann@suse.de>
 <20250404132907.225803-5-tzimmermann@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250404132907.225803-5-tzimmermann@suse.de>
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
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 9b71f7a9f3f8a..498485f4501f9 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -126,7 +126,8 @@ struct drm_gem_object_funcs {
>  	/**
>  	 * @pin:
>  	 *
> -	 * Pin backing buffer in memory. Used by the drm_gem_map_attach() helper.
> +	 * Pin backing buffer in memory, such that importers can access it.

Saying `such that dma-buf importers` would make it more clear that this
is about dma-bufs, IMO. Otherwise looks good.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
