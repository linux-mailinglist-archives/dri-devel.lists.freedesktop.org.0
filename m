Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD568FD160
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 17:08:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB31610E1E9;
	Wed,  5 Jun 2024 15:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QPOFr4t0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A09710E1E9;
 Wed,  5 Jun 2024 15:08:40 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4214f803606so17436835e9.0; 
 Wed, 05 Jun 2024 08:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717600118; x=1718204918; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6erns6P7m66pg24yXk3vygFkTJngHmTZFzrZV+/TSUs=;
 b=QPOFr4t0SPqHUfju3JbX+Jk7GyOT8IdDAsPKzSTwl/QO77d+Oyk//FpY9A4NIpSnz6
 whnSbhpsvaYQ0osUf8sqFpqpYIeBGMmo5VEzgXl4rtMsYUBPrKP+TGTBqlI5VfHL2GeY
 8J38hutLDYn261SjZQ0ZLZiiFsSHYVBW5LnJAyrtQ304wsMV7QuMrzKm+Siv9MhstSYT
 XuxUnFGSZeK0XUSU+2RWkjfaW+kfprP77pV8JEBDCe8Hox5YSZDIR15UH5cahKx9Qfzb
 H7AVuqcLduwi6FxVsndhOdtzqrCmzevr58+Eihc+/gXKbe/j4x9PbbdMqZA8wnF70XvV
 vvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717600118; x=1718204918;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6erns6P7m66pg24yXk3vygFkTJngHmTZFzrZV+/TSUs=;
 b=ZerXyHkWoWERz5xyMJkf6vOz2gVEx+kAk5v5bXGFxOEM80wzZPRoTyylsvevpiM+dd
 SzMUhQZPdzJdGhsVx8kQnoco9UcuzX3Srb17NI7apFF7a8gOmBKvk5/8lWk2yGleR1/H
 ppiL20LvmBd71VxreUVSpq7kyq8Jf+7VqQ4BgiLXioIeC8kR5KJKJTwydGh4ERX+EBwJ
 CudJOuFH637A1W0gLNJmVjdvpqqgnnqadg0iLsLArYlM4VHdljm27MevSeTPK8MRd2r2
 oDYXYXsV583mciukMPCk69XHRbMxsFhSDI3dWcH7AQkNjoNmR/2WIM2hD9TAMbXBTDpz
 ex9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQQ2R2LxftI6sB9MYIMqLqXI9vUcdAA08APmC2zSXrpJc4s88UKJewXEh/McH43+XXaX0uUQnFBXkfDM526hbjqKR0ECzm4iReQht4gL8QlizDjNZx0aWeWKxU+SYWRoTdLWTyhaq4ph/PA4dZZg==
X-Gm-Message-State: AOJu0YwK3c1jo0W3ugJLsi7SkTYCdtbaIfwioc5oOxvDnrYI0IxwoOB3
 alDu4o3EteiwhjHnUUC7kdVC2Cz3dIs/pP3iNm4+MTrs+vhB0QTL
X-Google-Smtp-Source: AGHT+IEFu8ys0OL+E2LRlq1NQiHBA4qS5m34VFEk2S56/hrWXMWplj2HkecNf8oldUnJapE8tT/jLg==
X-Received: by 2002:a05:600c:1554:b0:41a:2044:1b3e with SMTP id
 5b1f17b1804b1-4215633812fmr22794165e9.32.1717600118154; 
 Wed, 05 Jun 2024 08:08:38 -0700 (PDT)
Received: from debian.local (host-92-13-19-4.as13285.net. [92.13.19.4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158148f91sm26280455e9.30.2024.06.05.08.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 08:08:37 -0700 (PDT)
Date: Wed, 5 Jun 2024 16:08:34 +0100
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 hughsient@gmail.com
Subject: Re: [PATCH v2] drm/client: Detect when ACPI lid is closed during
 initialization
Message-ID: <ZmB_cs-7GU-m3GXX@debian.local>
References: <20240528210319.1242-1-mario.limonciello@amd.com>
 <202406040928.Eu1gRIWv-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202406040928.Eu1gRIWv-lkp@intel.com>
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

On Tue, Jun 04, 2024 at 10:02:29AM +0800, kernel test robot wrote:
> Hi Mario,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on drm-misc/drm-misc-next]
> [also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.10-rc2 next-20240603]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/drm-client-Detect-when-ACPI-lid-is-closed-during-initialization/20240529-050440
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/20240528210319.1242-1-mario.limonciello%40amd.com
> patch subject: [PATCH v2] drm/client: Detect when ACPI lid is closed during initialization
> config: i386-randconfig-053-20240604 (https://download.01.org/0day-ci/archive/20240604/202406040928.Eu1gRIWv-lkp@intel.com/config)
> compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406040928.Eu1gRIWv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406040928.Eu1gRIWv-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    ld: drivers/gpu/drm/drm_client_modeset.o: in function `drm_client_match_edp_lid':
> >> drivers/gpu/drm/drm_client_modeset.c:281:(.text+0x221b): undefined reference to `acpi_lid_open'
> 
> 
> vim +281 drivers/gpu/drm/drm_client_modeset.c
> 
>    260	
>    261	static void drm_client_match_edp_lid(struct drm_device *dev,
>    262					     struct drm_connector **connectors,
>    263					     unsigned int connector_count,
>    264					     bool *enabled)
>    265	{
>    266		int i;
>    267	
>    268		for (i = 0; i < connector_count; i++) {
>    269			struct drm_connector *connector = connectors[i];
>    270	
>    271			switch (connector->connector_type) {
>    272			case DRM_MODE_CONNECTOR_LVDS:
>    273			case DRM_MODE_CONNECTOR_eDP:
>    274				if (!enabled[i])
>    275					continue;
>    276				break;
>    277			default:
>    278				continue;
>    279			}
>    280	
>  > 281			if (!acpi_lid_open()) {
>    282				drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed, disabling\n",
>    283					    connector->base.id, connector->name);
>    284				enabled[i] = false;
>    285			}
>    286		}
>    287	}
>    288	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

The failed config has CONFIG_ACPI_BUTTON=m. The build failure can be
fixed with:

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index b76438c31761..0271e66f44f8 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -271,11 +271,13 @@ static void drm_client_match_edp_lid(struct drm_device *dev,
                if (connector->connector_type != DRM_MODE_CONNECTOR_eDP || !enabled[i])
                        continue;

+#if defined(CONFIG_ACPI_BUTTON)
                if (!acpi_lid_open()) {
                        drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed, disabling\n",
                                    connector->base.id, connector->name);
                        enabled[i] = false;
                }
+#endif
        }
 }
