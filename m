Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4FEA72E1E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 11:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDFC310E0DE;
	Thu, 27 Mar 2025 10:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="aI7NcPQo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 82418 seconds by postgrey-1.36 at gabe;
 Thu, 27 Mar 2025 10:48:01 UTC
Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com
 [136.143.184.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D99910E0DE
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 10:48:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743072470; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GPYgmz/h88wcVwYhJs0PstoPte9cQSl2D7nFaUgJhmbcSs818eyPjKGmhpY8cZOgFzpiSTXBtYRVzfmP8rqg2h9fptYTNYs1IF6JV1Vli4HM3yG9nmnH9dHildOmlhe2XFgK/vSUxQsctfqt3LjZAdJqFsSHm55EQVfHyxEF+Tk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743072470;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=N9CUUIz1HSpH/dh6MsdDIsc/y4ngPpTTDVGcmiGs+cY=; 
 b=C+PJWoiQt7wEGWCwYqv6zPKHZ3QU/W0+8RbXzVixkcZCQR7VHo4JlwbH9FzDp0CXVdCGhTOMdHXjZNOZS1ON0zVOkAvjDA8yi0qp6HciwAFflhONdErmO2Iwn3GQz9T6hu9iQzZO2iqk35EDBD6HM6xP98CXMelmnhJBUGqD7iU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743072470; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=N9CUUIz1HSpH/dh6MsdDIsc/y4ngPpTTDVGcmiGs+cY=;
 b=aI7NcPQoGXQIUHAFX4XZsI/mX9/ppH9UwV21WTR5igIHkdtjlS7DEBvTCU6FRa71
 Xi3DO8dpAYWIKVLbFqWIxNmJHtnbHWeVAzjvLi250sVoW7Py5HfgyFvWoquk6sQoQ8C
 SFWqeLk5SHm9lAy1TudvPFuoSAM71WXlFr8bVbJ8=
Received: by mx.zohomail.com with SMTPS id 1743072468418639.7351757233582;
 Thu, 27 Mar 2025 03:47:48 -0700 (PDT)
Message-ID: <ea76efe5-77e7-48ac-8ab6-6682e91ff46c@collabora.com>
Date: Thu, 27 Mar 2025 13:47:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] accel/ivpu: pages_use_count is now a refcount_t
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel@collabora.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
References: <20250327104300.1982058-1-boris.brezillon@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250327104300.1982058-1-boris.brezillon@collabora.com>
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

On 3/27/25 13:42, Boris Brezillon wrote:
> Commit 051b6646d36d ("drm/shmem-helper: Use refcount_t for
> pages_use_count") changed the type of
> drm_gem_shmem_object::pages_use_count but accel drivers were left
> behind.
> 
> Fixes: 051b6646d36d ("drm/shmem-helper: Use refcount_t for pages_use_count")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Cc: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/accel/ivpu/ivpu_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index 8741c73b92ce..09c9c5256af5 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -282,7 +282,7 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
>  	ivpu_bo_unbind_locked(bo);
>  	mutex_destroy(&bo->lock);
>  
> -	drm_WARN_ON(obj->dev, bo->base.pages_use_count > 1);
> +	drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > 1);
>  	drm_gem_shmem_free(&bo->base);
>  }
>  

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
