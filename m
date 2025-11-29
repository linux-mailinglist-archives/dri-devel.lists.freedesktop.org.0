Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F07C94482
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 17:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DFF10E03E;
	Sat, 29 Nov 2025 16:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ARMJq38y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E67310E20A
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 16:54:07 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-55999cc2a87so518495e0c.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 08:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764435246; x=1765040046; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SUdMDrZomFUZbbZgdh9LwkvsujEbVnk82m9l5aFdt8o=;
 b=ARMJq38yiJdBdisA62+a+4w73VEbp0P07apHAsT4kGRdVfjSf+yHiYAcmOkqvV96zv
 osV3fNBbnMK7STJqGYd6DZo80RR8gUjr/7CL0TNkns3bZj6I87rlkS2ror96bODxvWWL
 jycEqnMybq8AzOF7upyFYBsMLEnS/x8vzn/gkE7jTyXydKZXcAGysoovzCBvqigI8lv8
 BiBziyUY3m3V916Wxqt/89Co64a0pJpk2DHzUzgRdndC03hBS0H/M5GCnYcXXPL0nub7
 bDcR2iA6dP+u8QBff1z0QcPvIi6jvlJlVLk6V2nsHvxEBEssbBgdsnmgyzOB5722KuWw
 0RAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764435246; x=1765040046;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SUdMDrZomFUZbbZgdh9LwkvsujEbVnk82m9l5aFdt8o=;
 b=KQaLwoMTzFvSZ0thTdZfUJAZyFgPzY2HlDd0kgS8EirYPmjBMctsF5vtZThCnsNJEt
 z8cpsGK7CVV7AcNwXi2vSjdGNOnjtzNMgu1cIQ3cYYX7K0/uNJ8yWyiPJ+ToSHKR9Vze
 ZM6GvjjuchxtGjyk6lrXTaN5lCgeWkUUf9Ug8MGyH6yA/9j0+5yAMX7KOQHXl4r9e20k
 sJnOAzhR7vjqnJebZ0NFAZ9yOsFKm0WdBqmXNvC5AHvUCQffVr78GO5dt21Qmw9KSkFF
 5VxAScbpfLARCHgVhrKG0RLc6iQgYH0cFgvvYAjRXVgucGQwGBOmjwFNYkgRpj1lP0BT
 n6wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT/KBGf0Y7AZlKJxj08vxEXIefa1vNbi9R5lv2Dw5bzrSK/4foh6WmVCT3uy8fdkTMGWYWkfu5j9Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVpO14Bvj+4DoKI62G2/diqARtnxK79u1yJUKPdk1pTO979Lfv
 71zd+zkHbwgvFgd3lgWJfppEfkysjd7jm/X52qeKOBE7n+ysh0mVklLqqpZJjAvjtx8=
X-Gm-Gg: ASbGnctdvipJc6uWfACmzRfZYKTgo9cWCfjev7SSc4js6BSNEQPhWVKo0MasXwGXiO3
 +QuIyGZD7SD3znYm90CXPULHzFbB/qSL3App9vnlAbmKDCzCMSFXlcVdq8fapZOPN+eD8Lfe9W1
 DhpLWDik0y4qP2BaKGRgNenYZGYwNPjYMXaETeGxfbrY5/6AkEVY7cveaPU7UdsYOy9CVB3fpqN
 7q/I25bYfEQ3RlBBexZsbhGUbJdXUrq0v1VzLhqpICkawgpWIpwU6cwkEu5OpoxnZ0kOoqWDsCG
 TbdABgmhN5UlimXWzApqC4Q0dkJt2p10LcBXlO4S81xKbzIsA7ZeiJIKxgx5OVZxDRRruR/LHYY
 hm7LCBtvQ2bYUsGhDjjXYiIs07WN++zi000ZXOHMAXYPmsidFVSq28c9pOJyiKr5pjpvmacpefB
 JbGbjtIu0q3DWervjF
X-Google-Smtp-Source: AGHT+IG5tajmTfYoc3lFMiwar57/U6inDiuyMwTKKDkv9l56SNQgQ4HUSlYelexgYFZ7UMzNqqfw7Q==
X-Received: by 2002:a05:6122:202a:b0:55b:305b:4e3c with SMTP id
 71dfb90a1353d-55b8f00fd2cmr10936851e0c.18.1764435245594; 
 Sat, 29 Nov 2025 08:54:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 71dfb90a1353d-55cf516c50dsm3256156e0c.19.2025.11.29.08.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Nov 2025 08:54:04 -0800 (PST)
Date: Sat, 29 Nov 2025 19:53:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Matthew Brost <matthew.brost@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 8/8] drm/xe: Avoid toggling schedule state to check
 LRC timestamp in TDR
Message-ID: <202511291102.jnnKP6IB-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126214748.650107-9-matthew.brost@intel.com>
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

Hi Matthew,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-sched-Add-several-job-helpers-to-avoid-drivers-touching-scheduler-state/20251127-054955
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20251126214748.650107-9-matthew.brost%40intel.com
patch subject: [PATCH v6 8/8] drm/xe: Avoid toggling schedule state to check LRC timestamp in TDR
config: x86_64-randconfig-161-20251128 (https://download.01.org/0day-ci/archive/20251129/202511291102.jnnKP6IB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511291102.jnnKP6IB-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_lrc.c:2392 xe_lrc_timestamp() error: uninitialized symbol 'new_ts'.

vim +/new_ts +2392 drivers/gpu/drm/xe/xe_lrc.c

94c0c481e1bd20 Matthew Brost         2025-11-26  2363  u64 xe_lrc_timestamp(struct xe_lrc *lrc)
9b090d57746d96 Umesh Nerlige Ramappa 2024-05-17  2364  {
94c0c481e1bd20 Matthew Brost         2025-11-26  2365  	u64 lrc_ts, reg_ts, new_ts;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2366  	u32 engine_id;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2367  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2368  	lrc_ts = xe_lrc_ctx_timestamp(lrc);
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2369  	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2370  	if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
94c0c481e1bd20 Matthew Brost         2025-11-26  2371  		new_ts = lrc_ts;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2372  		goto done;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2373  	}
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2374  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2375  	if (lrc_ts == CONTEXT_ACTIVE) {
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2376  		engine_id = xe_lrc_engine_id(lrc);
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2377  		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
94c0c481e1bd20 Matthew Brost         2025-11-26  2378  			new_ts = reg_ts;

uninitialized on else path.

82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2379  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2380  		/* read lrc again to ensure context is still active */
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2381  		lrc_ts = xe_lrc_ctx_timestamp(lrc);

lrc_ts is re-assigned here.

82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2382  	}
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2383  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2384  	/*
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2385  	 * If context switched out, just use the lrc_ts. Note that this needs to
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2386  	 * be a separate if condition.
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2387  	 */
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2388  	if (lrc_ts != CONTEXT_ACTIVE)
94c0c481e1bd20 Matthew Brost         2025-11-26  2389  		new_ts = lrc_ts;

uninitialized on else path.

9b090d57746d96 Umesh Nerlige Ramappa 2024-05-17  2390  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2391  done:
94c0c481e1bd20 Matthew Brost         2025-11-26 @2392  	return new_ts;
94c0c481e1bd20 Matthew Brost         2025-11-26  2393  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

