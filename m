Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB2C82534B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 13:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA4510E5E4;
	Fri,  5 Jan 2024 12:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6764610E5E5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 12:22:12 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40d858c56cbso17140785e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 04:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704457331; x=1705062131; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vA6FwkyEuG2uyMNDinLLFMYwum2IR4tEfb81R7t0wM4=;
 b=oRJr9YhP8u4svaLGFn3usOKfS7r45CkBbgK3sh6l5XfZQe5Wa81ggvmSM5kOiQwgE4
 ACF4oxnyij2QEQ5LUH244dT9Ptn5Nw/wqg5c/BnWphabQcqsKnfYbU47/0+n+VyUL/Ex
 oLjfK+vEIAPJhVY258qjPBFH7zyKvdg7miWrC11jXPj4/HZQWasJ5CtfUHy/7H2I7fB/
 yrBrcx+zAWWn6klSlObI9BU6uL48oHVVX8jIib8VNN0VrhVr/Ga/8Tr35dM78Y5l/mVJ
 d8GGrNs23V6pFIh1Wq+JgSVeH24KB5grnMWHBAoBY/xoBaHAsqjlV939Lpxer7kxobqP
 T83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704457331; x=1705062131;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vA6FwkyEuG2uyMNDinLLFMYwum2IR4tEfb81R7t0wM4=;
 b=epQ02ZVTmuA28FQG9X81uvaAwKJwb6zQ2YXKFXhR4HPUrLbe4FKk1Jh5nYvKvPzqp8
 idTBNYgjDpwtg8YFsTS9yIJUjyEOIEIry4WlfIrC3svrwQ1zcU5TOZ9wQNuO1abcmAfG
 PSk3wkrL6zhMVVldKuzU5Rlq92zEanxfogQ7GBHX2ULNMGOEZm8bcCYREG8Y7ct/6vIN
 OwrrG1tjttKNdrmRcQCIG0mmav7NKwZppCl58f0i2Pfci/j1fCt6+bQluvJa6cDiYn6s
 WzRxqcubrmY9/oh1b7+1J5rAXBWm/6uWdHh0dYanLMv+mpnXhvVjJTpogCE4cpk+/cTZ
 BzcA==
X-Gm-Message-State: AOJu0YwXuCo6Uv6Bu70aaFdBSB7VQl4l5kPSBPsK7wYO7lGs6JSaPRBz
 NOoI0kXhSnQqHLVK8x++FftGACL/axLt8g==
X-Google-Smtp-Source: AGHT+IFRXBzoLefK8dQ3hNUFl9K35qP7i7gGSeIAN5Wa2ndnPhdB3qSmOQ33y0BUTJtgLV6xta7yiA==
X-Received: by 2002:a05:600c:a3af:b0:40d:3dbc:aee2 with SMTP id
 hn47-20020a05600ca3af00b0040d3dbcaee2mr1235885wmb.69.1704457330746; 
 Fri, 05 Jan 2024 04:22:10 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 t3-20020a05600c450300b0040e3960f46asm1295472wmo.14.2024.01.05.04.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 04:22:10 -0800 (PST)
Date: Fri, 5 Jan 2024 15:22:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: matthew.brost@intel.com
Subject: [bug report] drm/xe: Introduce a new DRM driver for Intel GPUs
Message-ID: <820ab774-5df3-4b27-bf02-3589bb6b4ce5@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Matthew Brost,

The patch dd08ebf6c352: "drm/xe: Introduce a new DRM driver for Intel
GPUs" from Mar 30, 2023 (linux-next), leads to the following Smatch
static checker warning:

	drivers/gpu/drm/xe/xe_bo.c:2246 xe_bo_dumb_create()
	warn: potential integer overflow from user '((args->width * cpp)) + (((64)) - 1)'

drivers/gpu/drm/xe/xe_bo.c
    2234 int xe_bo_dumb_create(struct drm_file *file_priv,
    2235                       struct drm_device *dev,
    2236                       struct drm_mode_create_dumb *args)
    2237 {
    2238         struct xe_device *xe = to_xe_device(dev);
    2239         struct xe_bo *bo;
    2240         uint32_t handle;
    2241         int cpp = DIV_ROUND_UP(args->bpp, 8);
    2242         int err;
    2243         u32 page_size = max_t(u32, PAGE_SIZE,
    2244                 xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K);
    2245 
--> 2246         args->pitch = ALIGN(args->width * cpp, 64);

drm_mode_create_dumb() guarantees that "args->width * cpp" can't
overflow but if we pick "args->width * cpp" set to U32_MAX - 63 or above
then the ALIGN() can overflow to zero.

I should have picked INT_MAX as the limit in drm_mode_create_dumb()...

    2247         args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
    2248                            page_size);
    2249 
    2250         bo = xe_bo_create_user(xe, NULL, NULL, args->size,
    2251                                DRM_XE_GEM_CPU_CACHING_WC,
    2252                                ttm_bo_type_device,
    2253                                XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
    2254                                XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
    2255                                XE_BO_NEEDS_CPU_ACCESS);
    2256         if (IS_ERR(bo))
    2257                 return PTR_ERR(bo);
    2258 
    2259         err = drm_gem_handle_create(file_priv, &bo->ttm.base, &handle);
    2260         /* drop reference from allocate - handle holds it now */
    2261         drm_gem_object_put(&bo->ttm.base);
    2262         if (!err)
    2263                 args->handle = handle;
    2264         return err;
    2265 }

regards,
dan carpenter
