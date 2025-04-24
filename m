Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7985A9AC49
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 13:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FFF10E309;
	Thu, 24 Apr 2025 11:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PJdAdV+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6AB410E309
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 11:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745494869;
 bh=lx55gR3E7QplPbPeQROY0+HXvPpMlZ5kqkByJl98LWs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PJdAdV+04P4RrwqslAisnOgF6jhqDiygpBxjBFQYw1vNAFYdaU4tH53qF/s/bh3Ql
 dHHpjpIMRGV5hYYVOTVqM9/Ij9eHcgxvLpCrV2IkIqbXQGaom7Yzu1g84Zi2mLVKUb
 fQ89U2WUk+FljX/s4AjcX7/Y1vx29GmyhK+8QMkXwH+57/3QEIL0uWrv4T8TTu15kR
 Y8QqiQ44/dO0DheLqbMNpCuGaBVlVtWHDQIz+WQpZhBhaGBtZQ/cSwqv/c/WehcetA
 81w9WFM4SktdmNqP8jvwF1OkA21qPtyDUrz4zV0/mD58mk8ak3pKT38+EilAkxEgSm
 ePR+Eskc0roag==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0F65417E091E;
 Thu, 24 Apr 2025 13:41:09 +0200 (CEST)
Date: Thu, 24 Apr 2025 13:41:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?QWRyacOh?=
 =?UTF-8?B?bg==?= Larumbe <adrian.larumbe@collabora.com>, Arnd Bergmann
 <arnd@arndb.de>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, Florent
 Tomasin <florent.tomasin@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: fix building without CONFIG_DEBUG_FS
Message-ID: <20250424134105.087ec2f8@collabora.com>
In-Reply-To: <20250424112637.3432563-1-arnd@kernel.org>
References: <20250424112637.3432563-1-arnd@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 24 Apr 2025 13:25:47 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> When debugfs is disabled, including panthor_gem.h causes warnings
> about a non-static global function defined in a header:
> 
> In file included from drivers/gpu/drm/panthor/panthor_drv.c:30:
> drivers/gpu/drm/panthor/panthor_gem.h:222:6: error: no previous prototype for 'panthor_gem_debugfs_set_usage_flags' [-Werror=missing-prototypes]
>   222 | void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {};
> 
> This could be changed to a static inline function, but as the normal
> one is also static inline, just move the #ifdef check in there.
> The #ifdef is still needed to avoid accessing a struct member that
> does not exist without debugfs.
> 
> Fixes: a3707f53eb3f ("drm/panthor: show device-wide list of DRM GEM objects over DebugFS")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/panthor/panthor_gem.h | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index 4641994ddd7f..693842e10dee 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -209,17 +209,14 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>  
>  void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
>  
> -#ifdef CONFIG_DEBUG_FS
>  void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
>  				   struct seq_file *m);
>  static inline void
>  panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
>  {
> +#ifdef CONFIG_DEBUG_FS
>  	bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
> -}
> -
> -#else
> -void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {};
>  #endif
> +}
>  

Oops. I actually don't see a good reason to expose this function, so
could we go for something like that instead?

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 2dcf308094b2..962c2dc075db 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -42,11 +42,20 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
        mutex_unlock(&ptdev->gems.lock);
 }
 
+static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo,
+                                               u32 usage_flags)
+{
+       bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
+}
 #else
 static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
                                       struct panthor_gem_object *bo)
 {}
 static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
+static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo,
+                                               u32 usage_flags)
+{
+}
 #endif
 
 static void panthor_gem_free_object(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 4641994ddd7f..4dd732dcd59f 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -212,14 +212,6 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
 #ifdef CONFIG_DEBUG_FS
 void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
                                   struct seq_file *m);
-static inline void
-panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
-{
-       bo->debugfs.flags = usage_flags | PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIALIZED;
-}
-
-#else
-void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {};
 #endif
 
 #endif /* __PANTHOR_GEM_H__ */
