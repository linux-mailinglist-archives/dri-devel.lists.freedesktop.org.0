Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A43BFA677
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 09:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F30210E6C8;
	Wed, 22 Oct 2025 07:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lJIJm08i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFB310E6CC
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:00:17 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-426ff694c1fso1508909f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 00:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761116416; x=1761721216; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qv5bMEGvN9X32946bfYvNIl8D9oMhZpgA7zbomHxa9Y=;
 b=lJIJm08iYSLk62oQlQARlezbJX6JYjez7jyoA8n5StfaV5orcwP579PxSG+mlF9+TJ
 Ge8wFH+CXnNAPBU47MIq2svWVhIlxPjJrGHqoOyxXFbs2QWOBGxpl4E8Kxcn9pT1it+8
 kyqIhb2BXFKN2L1FC3SEsPxra0Qi6OgzL8fFPMhhgjjSB6ReMzlnKxtJSc49PYslezj+
 EdM/FPjherD83iku/kRuv+Qq1NWNEI7uL5rFuMMwZV3DPKYCCCnUwQF0e7AuaLP2sZO2
 weWouUcqhwAgusRvG32f+ZZeFzdBGwsLRjYxRAWbIrqQqsk9mkNcIpnFaEBRyZIAmA1g
 HTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761116416; x=1761721216;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qv5bMEGvN9X32946bfYvNIl8D9oMhZpgA7zbomHxa9Y=;
 b=BL6tYrT5iJNTYKyUkyMmMIEMdRIYY2tkJeLOLGaIzZfxoOHgq2ucXODBM54y+ZdnFk
 WbCSQVykDr6+6eLgCOx1P9nkduq+p501IvJ+qRtDtBX5/L2D7l86tHxq/P1881PPIYzQ
 A17TdfYlUMlq1/WkzXi02qIaUpBU/QAB2faKGXw+pZk9W5s2QYROIwXMr8sSUkLxfd6A
 tRaBCw/51w230k+werBk/FvSBUoGNpabvWg/0yUDjlNGZzFoXJdJ1+BYLZ5pqEim4OxO
 i69MW8vToKQsIgQlkX/r39SDdBpl5b0BMg2qV48cCjS6AQS8FNRiHixm7OeCgpARX7YU
 wy3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9TNw7SymVI40Pt91iqiSz+8VzsTCRooJOgBp1gdI2G6vzoR1oZKVphgjRU6h985+KkTu3CrQfEVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP8zyyIWL4oMG4UGcCN+VKd7kd1fUHFUVMOME0MpDQavnMd2iS
 Xo0CSqQ2tYoQG8Ym+I/z08fT/ch6HnS+ItQL6ipFZKa0/6ubPiZ8pLTysC5RO6WGr5o=
X-Gm-Gg: ASbGnctgwHd9dv3VTgw6n0ZA2atc2mVS0H1S99n+e7w+e92OlyDTU8tuAsmR3O1DjNE
 Yq0yaihhLKchXLsxm0MGksQIQvuaB+0kQI7paIfCYC2mFgohFQ7CW2TvREbO0gfjag96xGeffrA
 BdsXZxz9J1lp+vyC3IiWN+ImFK0RwY7lzNzJVFpcP2CDP81ItI6zHiERXRAOnIeloMLRfWOJG0w
 j/pO6T6PDgnB4pceimJCvjhKmcnL+/W+B7fQYdzaIKLL+R/PvzDKcqSBoRG0ELzF8Ox7JrBtFTi
 dyU1axkmFMtO0KsZ5BSwk35zv7n42ynaVqEomqiObENg39O6slWYiF1HtRVM7mslhULnvLLhqqI
 r3+2mWnqJo0lN0cAHZH+oFbT7WCv8/nqP9QbiXF4weeyWYcqIL/VtT6QCo+STyv/aR8r3CjVcg9
 nE5W9nmA==
X-Google-Smtp-Source: AGHT+IF9i76yH8MCk+Tr5Mn1WkODA3/xR31W7KLUDUU/ophtp3akzS53FBIQN5I5N9gZZPPgOgtIdQ==
X-Received: by 2002:a05:6000:2c0e:b0:405:3028:1bce with SMTP id
 ffacd0b85a97d-42704daed0fmr12707364f8f.32.1761116416304; 
 Wed, 22 Oct 2025 00:00:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-427f00ce3e2sm23652718f8f.47.2025.10.22.00.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 00:00:15 -0700 (PDT)
Date: Wed, 22 Oct 2025 10:00:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 jfalempe@redhat.com, javierm@redhat.com, rrameshbabu@nvidia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/7] drm/client: Remove drm_client_framebuffer_delete()
Message-ID: <202510220056.J4uIVWxn-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020151402.53013-6-tzimmermann@suse.de>
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

Hi Thomas,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-client-Remove-pitch-from-struct-drm_client_buffer/20251020-231709
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20251020151402.53013-6-tzimmermann%40suse.de
patch subject: [PATCH 5/7] drm/client: Remove drm_client_framebuffer_delete()
config: openrisc-randconfig-r072-20251021 (https://download.01.org/0day-ci/archive/20251022/202510220056.J4uIVWxn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510220056.J4uIVWxn-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_client.c:185 drm_client_buffer_delete() warn: variable dereferenced before check 'buffer' (see line 182)

vim +/buffer +185 drivers/gpu/drm/drm_client.c

449148a7300b8b Thomas Zimmermann 2025-10-20  180  void drm_client_buffer_delete(struct drm_client_buffer *buffer)
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  181  {
95d6cf3a3cf1a1 Thomas Zimmermann 2025-10-20 @182  	struct drm_gem_object *gem = drm_gem_fb_get_obj(buffer->fb, 0);
                                                                                                        ^^^^^^^^^^
buffer is dereferenced here

82e2a75e5a640c Thomas Zimmermann 2025-10-20  183  	int ret;
82e2a75e5a640c Thomas Zimmermann 2025-10-20  184  
449148a7300b8b Thomas Zimmermann 2025-10-20 @185  	if (!buffer)
                                                            ^^^^^^^
checked too late

449148a7300b8b Thomas Zimmermann 2025-10-20  186  		return;
449148a7300b8b Thomas Zimmermann 2025-10-20  187  
95d6cf3a3cf1a1 Thomas Zimmermann 2025-10-20  188  	drm_gem_vunmap(gem, &buffer->map);
95d6cf3a3cf1a1 Thomas Zimmermann 2025-10-20  189  
82e2a75e5a640c Thomas Zimmermann 2025-10-20  190  	ret = drm_mode_rmfb(buffer->client->dev, buffer->fb->base.id, buffer->client->file);
82e2a75e5a640c Thomas Zimmermann 2025-10-20  191  	if (ret)
82e2a75e5a640c Thomas Zimmermann 2025-10-20  192  		drm_err(buffer->client->dev,
82e2a75e5a640c Thomas Zimmermann 2025-10-20  193  			"Error removing FB:%u (%d)\n", buffer->fb->base.id, ret);
82e2a75e5a640c Thomas Zimmermann 2025-10-20  194  
be6ee102341bc4 Emil Velikov      2020-05-15  195  	drm_gem_object_put(buffer->gem);
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  196  
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  197  	kfree(buffer);
c76f0f7cb546b6 Noralf Trønnes    2018-07-03  198  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

