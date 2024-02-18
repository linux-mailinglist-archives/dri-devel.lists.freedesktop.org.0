Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE6B8597A9
	for <lists+dri-devel@lfdr.de>; Sun, 18 Feb 2024 16:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0296E10E056;
	Sun, 18 Feb 2024 15:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VT4TJQag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141B210E056
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Feb 2024 15:49:16 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6e435542d41so11573b3a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Feb 2024 07:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708271355; x=1708876155; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=HygTjwzdRXTfZJXPzKIecTHavlYq9dpN87Z53dyDVe4=;
 b=VT4TJQagSI7YjjdymURKurrLZnn7jBXQWuQw4ggBk4p3CLcQ7eU27yK4YDhg7E7Hn8
 8dgDenourfEvRfoKTfUlHHUW3sNIRVzgLIqdKSuzLMhAL4PE4GfcKez9hztIsxujR9N1
 BhBKB8JnJqtEAs3rSd4AQD7Gb+pFE7CzbJ08lA1Ukp7gCvHZLFmR2muNCqEThgfENgGb
 S32kNr+Jmt6CraTMKu08VZo24cxAnrJBxx1A8jB/i0l6y2o9j5lL8bdeUkvKUmbenniz
 r9heRFTFYGiL+54htKhWbc2tjkgTdRY8HpNJhFhhkeJm8jepd367693LUnjQZUBVpeaL
 SvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708271355; x=1708876155;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HygTjwzdRXTfZJXPzKIecTHavlYq9dpN87Z53dyDVe4=;
 b=d9fgBz2zFlu20EutDPXsQ55x0q0ySm5N7NDxB+aGtRyilD5Q5qEhFrvIxy/tJ2GfId
 K/4jtlUobf6gaTAu3Y+UtSjL/x+pWAsf3CIaX5WmX1es1sB3TL2/BLNJICF9cOayHR9N
 cpAkgm8A6wnkgLhZSqT8bl6EcQlS2X5b+KvMP/M/eqG8bTwmhPDLx9FdMDMBVajeAXBX
 TmkZUy6uaU+ZYGMdNvYaKMuVDYOrbfy/YDclAhWiQFgfXqWVpG3RtH2fvYUK9Gbr8RHi
 kQFJeITcTdHoluqpuQOD677Elgt0Su3S8ozhZS/0RsKP0i/XIXAoQDQ5knv22K3hxG6d
 jAhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJficsNT5xDAWxCX814HCtlbuUhKrZKBbfL3tfKmSgpQJTbH5fP3YpwM7nfs5peqMGd14N0GOxIDqW8jdpyZx3lkK3tEiQF2GDhLvPKSoA
X-Gm-Message-State: AOJu0YysT/WG5uQqtLE3lyleTABl7IQkDayixAzQfNYmtKNZRnDPQ8Dy
 ZBTnqHj05f+xEcQupgGL7yjzRVkG2RLIa1ypaaiGFZWowiTLQHnE
X-Google-Smtp-Source: AGHT+IGtFTeG1xqdQuslCfg46RlX50lmgmsSXRs+AAF00N8eLRLlV9eHfM6YvKpqSj14RdRN0G6Org==
X-Received: by 2002:a62:cec2:0:b0:6df:c3b1:1c2e with SMTP id
 y185-20020a62cec2000000b006dfc3b11c2emr8689930pfg.30.1708271355446; 
 Sun, 18 Feb 2024 07:49:15 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 x42-20020a056a0018aa00b006e144bac418sm3149232pfh.74.2024.02.18.07.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Feb 2024 07:49:14 -0800 (PST)
Date: Sun, 18 Feb 2024 07:49:13 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Marco Pagani <marpagan@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5] drm/test: add a test suite for GEM objects backed by
 shmem
Message-ID: <a45b796d-5e04-4eac-b5ba-ea6bb3b6131b@roeck-us.net>
References: <20231130171417.74162-1-marpagan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130171417.74162-1-marpagan@redhat.com>
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

Hi,

On Thu, Nov 30, 2023 at 06:14:16PM +0100, Marco Pagani wrote:
> This patch introduces an initial KUnit test suite for GEM objects
> backed by shmem buffers.
> 
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Marco Pagani <marpagan@redhat.com>

When running this in qemu, I get lots of warnings backtraces in the drm
core.

WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:327
WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:173
WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:385
WARNING: CPU: 0 PID: 1341 at drivers/gpu/drm/drm_gem_shmem_helper.c:211
WARNING: CPU: 0 PID: 1345 at kernel/dma/mapping.c:194
WARNING: CPU: 0 PID: 1347 at drivers/gpu/drm/drm_gem_shmem_helper.c:429
WARNING: CPU: 0 PID: 1349 at drivers/gpu/drm/drm_gem_shmem_helper.c:445 

It looks like dma_resv_assert_held() asserts each time it is executed.
The backtrace in kernel/dma/mapping.c is triggered by
	if (WARN_ON_ONCE(!dev->dma_mask))
		return 0;
in __dma_map_sg_attrs().

Is this a possible problem in the test code, or can it be caused by
some limitations or bugs in the qemu emulation ? If so, do you have any
thoughts or ideas what those limitations / bugs might be ? 

Thanks,
Guenter
