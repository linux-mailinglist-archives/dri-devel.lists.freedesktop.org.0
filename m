Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744CF93C290
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 14:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FE010E266;
	Thu, 25 Jul 2024 12:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ZgJHokfd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2225710E266
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 12:59:27 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5a5809a3bb9so136623a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 05:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721912365; x=1722517165; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Mol47svduiCaHsnKdTkKvXi18me6mAtfjU4DPCmBkQ=;
 b=ZgJHokfdRVzmY31U5Nl6G8wzlmhL04K2FriBRJ1rqMa7OBFHqh3GLHNpzjU5bP7XKt
 fI3odSg/2cSiXlR5/bJJl2Ry4e+jy6zrTOUHONOmpgJeLV75CPW0tDbgWoDC/TYCaDMZ
 sxPTA1UK+tpfSvypw7DDGyPGGjuxITmIYqxjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721912365; x=1722517165;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6Mol47svduiCaHsnKdTkKvXi18me6mAtfjU4DPCmBkQ=;
 b=DIAedvTB7rRObblR46BZFhk0bL3OITQtFLzKFDfct13I4yJdZcB6Dd49YnYgU7q3PS
 X2otPCU0nLqFJLlusmVkE5Jwq+S1eKCXDSKhTpixlH9QWQElb7u5EluNfmXPk2PkT9gl
 ENJp1cpEYvZCYMdl1HdoVq7ktMkja46tXUuOY1s8u+7+o6sRW/6cGI0inaWhCGa+UgOI
 yRw3mU0Nyb6yMiil342n5WU9hd9L8OfemfAOeoJzu1aRaLPRgP9g53vNHqQjRT7Hsi7d
 kbH9acmO1MzSb/Tgdv7RGCht1kM0wfeWm3L6aa/QNk2MEZZ4+Gh94Vexvm/5/7xzg+yQ
 1U7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr3CM+AqEFQ3/Fis78zXBPyjE401MnqRenqlq/JbY9XDDYtva9CyJy1yswG6HU5ogc/h8gqa2vLTc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1mY14eCuYFugtb5SqAk7MBXyfJDoqEgEqZF+EYS2D3P8gFh/D
 AcN1Fw79+sCGHb4a8RmKhX0lg2epL5KtXYIwYd3Pt4d/jVfEgRUQRYtWXxiV6Z0KGI7hK6qo2fO
 j
X-Google-Smtp-Source: AGHT+IELpXnY1wuR/Lf/uOugSgjmN6lRRkW0fqsPCl4qz+7WB0nTWdrMJS8EXcNnsNPBLbmmezjuqQ==
X-Received: by 2002:a17:906:dc8f:b0:a7a:aa35:409c with SMTP id
 a640c23a62f3a-a7ac5bab2cdmr96193966b.9.1721912365485; 
 Thu, 25 Jul 2024 05:59:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab2302dsm71116566b.39.2024.07.25.05.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 05:59:24 -0700 (PDT)
Date: Thu, 25 Jul 2024 14:59:22 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Marco Pagani <marpagan@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/test: use kunit action wrapper macro in the gem
 shmem test suite
Message-ID: <ZqJMKvwr6nxPjb9v@phenom.ffwll.local>
Mail-Followup-To: Marco Pagani <marpagan@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240723191036.131286-1-marpagan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723191036.131286-1-marpagan@redhat.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Tue, Jul 23, 2024 at 09:10:35PM +0200, Marco Pagani wrote:
> Replace deferred action function wrappers with equivalent ones defined
> using the macro introduced by commit 56778b49c9a2 ("kunit: Add a macro to
> wrap a deferred action function")
> 
> Signed-off-by: Marco Pagani <marpagan@redhat.com>

Merged to drm-misc-next, thanks for your patch.
-Sima

> ---
>  drivers/gpu/drm/tests/drm_gem_shmem_test.c | 27 ++++++----------------
>  1 file changed, 7 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
> index c3758faa1b83..f7f7d8b0f61f 100644
> --- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
> +++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
> @@ -23,29 +23,16 @@
>  #define TEST_BYTE		0xae
>  
>  /*
> - * Wrappers to avoid an explicit type casting when passing action
> - * functions to kunit_add_action().
> + * Wrappers to avoid cast warnings when passing action functions
> + * directly to kunit_add_action().
>   */
> -static void kfree_wrapper(void *ptr)
> -{
> -	const void *obj = ptr;
> -
> -	kfree(obj);
> -}
> -
> -static void sg_free_table_wrapper(void *ptr)
> -{
> -	struct sg_table *sgt = ptr;
> +KUNIT_DEFINE_ACTION_WRAPPER(kfree_wrapper, kfree, const void *);
>  
> -	sg_free_table(sgt);
> -}
> -
> -static void drm_gem_shmem_free_wrapper(void *ptr)
> -{
> -	struct drm_gem_shmem_object *shmem = ptr;
> +KUNIT_DEFINE_ACTION_WRAPPER(sg_free_table_wrapper, sg_free_table,
> +			    struct sg_table *);
>  
> -	drm_gem_shmem_free(shmem);
> -}
> +KUNIT_DEFINE_ACTION_WRAPPER(drm_gem_shmem_free_wrapper, drm_gem_shmem_free,
> +			    struct drm_gem_shmem_object *);
>  
>  /*
>   * Test creating a shmem GEM object backed by shmem buffer. The test
> -- 
> 2.45.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
