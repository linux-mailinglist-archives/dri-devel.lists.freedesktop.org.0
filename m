Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA254FCD2E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 05:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20A910FB82;
	Tue, 12 Apr 2022 03:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB5710FB7F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 03:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649734580; x=1681270580;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=USgLlHicqdKbRyScUUYgIH7kQzveCbYodWpEhoAeAus=;
 b=ZDY/xLIRuNAEhHOaZkJZfrTzxD2kV3EudVZJ9DTcFTpYjg8LxYxxHFGY
 wkdcM5s/1/PkWSzNVbuSXNb5SA7k4SvKcHODjN5Nv1Pr3f4J7C4KMupM0
 27UZjZ1p8zEaWl7Sxd3wUqhdeOjR6htRXCXuglOxo7mAWF1jsoYHKsEQf
 BeGBgDZ9ncuDBDzyn3LlOJ7Ec1NdMNF6lXPsr2TotNmgN8GBWM1084JYo
 x43menl+WxEZZkA02Yzv9WzKCVz9mut9+CadA/Xw0l9EQAzYk4aOSvYbS
 y2jU58F99nwkxBaXMTMqrrYcNqXCXV38iMqtMC3KAurmBoxUMHPgdAYzr g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="325180185"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="325180185"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 20:36:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="654908588"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2022 20:36:15 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ne7KA-0002U5-FR;
 Tue, 12 Apr 2022 03:36:14 +0000
Date: Tue, 12 Apr 2022 11:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v3 11/15] drm/shmem-helper: Add generic memory shrinker
Message-ID: <202204121135.zXHzC28U-lkp@intel.com>
References: <20220411215937.281655-12-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411215937.281655-12-dmitry.osipenko@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20220411]
[cannot apply to drm/drm-next v5.18-rc2 v5.18-rc1 v5.17 v5.18-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Osipenko/Add-generic-memory-shrinker-to-VirtIO-GPU-and-Panfrost-DRM-drivers/20220412-060325
base:    d12d7e1cfe38e0c36d28c7a9fbbc436ad0d17c14
config: arc-buildonly-randconfig-r002-20220411 (https://download.01.org/0day-ci/archive/20220412/202204121135.zXHzC28U-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/683ba8a9d72ba7770a61a9266a2b33949f3874f2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Osipenko/Add-generic-memory-shrinker-to-VirtIO-GPU-and-Panfrost-DRM-drivers/20220412-060325
        git checkout 683ba8a9d72ba7770a61a9266a2b33949f3874f2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_gem_shmem_helper.c: In function 'drm_gem_shmem_shrinker_run_objects_scan':
>> drivers/gpu/drm/drm_gem_shmem_helper.c:1358:56: warning: implicit conversion from 'enum <anonymous>' to 'enum dma_resv_usage' [-Wenum-conversion]
    1358 |                 if (!dma_resv_test_signaled(obj->resv, true))
         |                                                        ^~~~


vim +1358 drivers/gpu/drm/drm_gem_shmem_helper.c

  1299	
  1300	static unsigned long
  1301	drm_gem_shmem_shrinker_run_objects_scan(struct shrinker *shrinker,
  1302						unsigned long nr_to_scan,
  1303						bool *lock_contention,
  1304						bool evict)
  1305	{
  1306		struct drm_gem_shmem_shrinker *gem_shrinker = to_drm_shrinker(shrinker);
  1307		struct drm_gem_shmem_object *shmem;
  1308		struct list_head still_in_list;
  1309		struct drm_gem_object *obj;
  1310		unsigned long freed = 0;
  1311		struct list_head *lru;
  1312		size_t page_count;
  1313	
  1314		INIT_LIST_HEAD(&still_in_list);
  1315	
  1316		mutex_lock(&gem_shrinker->lock);
  1317	
  1318		if (evict)
  1319			lru = &gem_shrinker->lru_evictable;
  1320		else
  1321			lru = &gem_shrinker->lru_purgeable;
  1322	
  1323		while (freed < nr_to_scan) {
  1324			shmem = list_first_entry_or_null(lru, typeof(*shmem), madv_list);
  1325			if (!shmem)
  1326				break;
  1327	
  1328			obj = &shmem->base;
  1329			page_count = obj->size >> PAGE_SHIFT;
  1330			list_move_tail(&shmem->madv_list, &still_in_list);
  1331	
  1332			if (evict && get_nr_swap_pages() < page_count)
  1333				continue;
  1334	
  1335			/*
  1336			 * If it's in the process of being freed, gem_object->free()
  1337			 * may be blocked on lock waiting to remove it.  So just
  1338			 * skip it.
  1339			 */
  1340			if (!kref_get_unless_zero(&obj->refcount))
  1341				continue;
  1342	
  1343			mutex_unlock(&gem_shrinker->lock);
  1344	
  1345			/* prevent racing with job-submission code paths */
  1346			if (!dma_resv_trylock(obj->resv)) {
  1347				*lock_contention |= true;
  1348				goto shrinker_lock;
  1349			}
  1350	
  1351			/* prevent racing with the dma-buf exporting */
  1352			if (!mutex_trylock(&gem_shrinker->dev->object_name_lock)) {
  1353				*lock_contention |= true;
  1354				goto resv_unlock;
  1355			}
  1356	
  1357			/* check whether h/w uses this object */
> 1358			if (!dma_resv_test_signaled(obj->resv, true))
  1359				goto object_name_unlock;
  1360	
  1361			/* GEM may've become unpurgeable while shrinker was unlocked */
  1362			if (evict) {
  1363				if (!drm_gem_shmem_is_evictable(shmem))
  1364					goto object_name_unlock;
  1365			} else {
  1366				if (!drm_gem_shmem_is_purgeable(shmem))
  1367					goto object_name_unlock;
  1368			}
  1369	
  1370			if (evict)
  1371				freed += obj->funcs->evict(obj);
  1372			else
  1373				freed += obj->funcs->purge(obj);
  1374	object_name_unlock:
  1375			mutex_unlock(&gem_shrinker->dev->object_name_lock);
  1376	resv_unlock:
  1377			dma_resv_unlock(obj->resv);
  1378	shrinker_lock:
  1379			drm_gem_object_put(&shmem->base);
  1380			mutex_lock(&gem_shrinker->lock);
  1381		}
  1382	
  1383		list_splice_tail(&still_in_list, lru);
  1384	
  1385		mutex_unlock(&gem_shrinker->lock);
  1386	
  1387		return freed;
  1388	}
  1389	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
