Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE31D82534A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 13:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5415510E5DF;
	Fri,  5 Jan 2024 12:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D478D10E5DF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 12:21:35 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40d5aefcc2fso14715485e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 04:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704457294; x=1705062094; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qdzdLTdNjJjuQci6+69Symh+85gKlgyMSdhFghD2Gyc=;
 b=x8UUBGT/0eO90Ppt/e6BzszWz7LvUuDhb/YMeEchVDe9O6dMkBQ0V4jV6w6AYIS7Pa
 uMpUHIElM3XAynuxCN/BB4ILJnNujng24SkZAXEoleqtKVDjCgKSZekhOUxCQykHZX2n
 Ih1pssdkQS2N1iMB+6M0piklV36T+yyOCV40LB1LkF8uv5RoxU1E30Hgky8EQ2fZbmfP
 8dsO12GmKTZRkJ9nEYb7n4vEb53syQgHx+oypt/QGsgfg4W7dYoTsqG+bjIDkqTmmYxK
 AklC8UmDkInyBH14DTGVZRVWD1LVKhoKvrLQALQvO1FzoPCZa86jVFXTm0c9GuqPStOj
 fHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704457294; x=1705062094;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qdzdLTdNjJjuQci6+69Symh+85gKlgyMSdhFghD2Gyc=;
 b=F3nA+NT5GP6Mhh/iD4FNy934FHJOarRnksOptsqb5bRCmi/m0yQ4Eiwhgg1Dwfe4po
 +2JLlXQM6qeUJqiLIJkyVU2Ki8hdWwNpp4k4Gv4r+fY8pttfJ7z5SAUo5Lnjamklcfsm
 KbtdtYXJLWloGVXeY/dQAdjMJK2jNAI550vNYB4qHwAtUdKGAWr3sREaAJbJG9IV7Chm
 E7ChftXF8DJByEQmNZJk1jq6pp/t8v0DGFrkrOrCfaX0FmcixciVvz5ddgzvfO5XtSNT
 T6xbiwk7FRkIIMJJU6NqOyhEDf1LnPAM8U8lBDSSAok3wdkE9mSaTv2AOCQDTGTyXV7/
 n9aw==
X-Gm-Message-State: AOJu0Yxh4vNxOuCmKqvVRybZElxw3WRWIH1Zn59De30e0lkaFfFA/Zwj
 17Houiw5S3p89EF7mBHfMqYh4w8EesbLVxkxtZqqNS7hZWI=
X-Google-Smtp-Source: AGHT+IHbjMmOV81oLmo61E2rTHp1RWD3EMWfchgyMXOZWheLxnnphRbT718LuObXwpOYGytlzfwVWg==
X-Received: by 2002:a05:600c:1547:b0:40d:8843:d039 with SMTP id
 f7-20020a05600c154700b0040d8843d039mr1163880wmg.68.1704457294315; 
 Fri, 05 Jan 2024 04:21:34 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b0040d8cd116e4sm1419233wmq.37.2024.01.05.04.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 04:21:34 -0800 (PST)
Date: Fri, 5 Jan 2024 15:21:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: matthew.brost@intel.com
Subject: [bug report] drm/xe: shift wrapping in xe_gem_create_ioctl()
Message-ID: <ebb5c304-106c-4c6a-a377-b6a4096238cb@moroto.mountain>
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

	drivers/gpu/drm/xe/xe_bo.c:1916 xe_gem_create_ioctl()
	warn: potential integer overflow from user 'args->placement <<'

drivers/gpu/drm/xe/xe_bo.c
    1869 int xe_gem_create_ioctl(struct drm_device *dev, void *data,
    1870                         struct drm_file *file)
    1871 {
    1872         struct xe_device *xe = to_xe_device(dev);
    1873         struct xe_file *xef = to_xe_file(file);
    1874         struct drm_xe_gem_create *args = data;
    1875         struct xe_vm *vm = NULL;
    1876         struct xe_bo *bo;
    1877         unsigned int bo_flags;
    1878         u32 handle;
    1879         int err;
    1880 
    1881         if (XE_IOCTL_DBG(xe, args->extensions) ||
    1882             XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
    1883             XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
    1884                 return -EINVAL;
    1885 
    1886         /* at least one valid memory placement must be specified */
    1887         if (XE_IOCTL_DBG(xe, (args->placement & ~xe->info.mem_region_mask) ||
    1888                          !args->placement))
    1889                 return -EINVAL;
    1890 
    1891         if (XE_IOCTL_DBG(xe, args->flags &
    1892                          ~(DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
    1893                            DRM_XE_GEM_CREATE_FLAG_SCANOUT |
    1894                            DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)))
    1895                 return -EINVAL;
    1896 
    1897         if (XE_IOCTL_DBG(xe, args->handle))
    1898                 return -EINVAL;
    1899 
    1900         if (XE_IOCTL_DBG(xe, !args->size))
    1901                 return -EINVAL;
    1902 
    1903         if (XE_IOCTL_DBG(xe, args->size > SIZE_MAX))
    1904                 return -EINVAL;
    1905 
    1906         if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
    1907                 return -EINVAL;
    1908 
    1909         bo_flags = 0;
    1910         if (args->flags & DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING)
    1911                 bo_flags |= XE_BO_DEFER_BACKING;
    1912 
    1913         if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
    1914                 bo_flags |= XE_BO_SCANOUT_BIT;
    1915 
--> 1916         bo_flags |= args->placement << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
                             ^^^^^^^^^^^^^^^
Potential shift wrapping.

    1917 
    1918         if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
    1919                 if (XE_IOCTL_DBG(xe, !(bo_flags & XE_BO_CREATE_VRAM_MASK)))
    1920                         return -EINVAL;
    1921 
    1922                 bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
    1923         }
    1924 

regards,
dan carpenter
