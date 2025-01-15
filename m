Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B482A11677
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 02:23:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F8010E49E;
	Wed, 15 Jan 2025 01:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JhB47g2Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3D210E49E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 01:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736904208; x=1768440208;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=paczhbu4pAjCx+PYqV+VKWDepjQQNI97AeomCseFvQc=;
 b=JhB47g2QPRonOTsJeucBvsJSQa783VYy/TUB37Q6enneHYJf6TwSAcXZ
 WQN7dk/VSFe9Z/uNVXWwbCIcaq1Wxbp1rNcSpQ7Xnj8ulNAj9ogAsR9xT
 mgqpI0Jj9cTJ/roXuU8RJ4EzxIvIAUn1iB0YivmHc5Uq60YAujLRQ55eF
 5V+QNb+WBEbnpe07SxM0+G/prCoX/yLE3kA91KaTkk5ihOAT35OPSm0SP
 e8TzUp1Y8JQNSi0u8zVgImz0V0ptBdoNZd3afO8BotEO+wZt5SxXYxpjJ
 41xEGcdHRa8/acuayn3PV5RNibTT4HezU0rH4TrS7pTpLBgttd52ol0QB g==;
X-CSE-ConnectionGUID: PBGj9arNQ0C+XZLtMRjbtA==
X-CSE-MsgGUID: 3k1lh3XSSpKHivanDAUfUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="40035975"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="40035975"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 17:23:27 -0800
X-CSE-ConnectionGUID: iVvu/nl0Qke9J8ohe/aZog==
X-CSE-MsgGUID: mpR4xk+XQoK7NbA1eYAkBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="109940477"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 14 Jan 2025 17:23:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tXs7t-000PG3-1L;
 Wed, 15 Jan 2025 01:23:21 +0000
Date: Wed, 15 Jan 2025 09:22:43 +0800
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v7 4/7] drm: writeback: Create an helper for
 drm_writeback_connector initialization
Message-ID: <202501150938.a3MspUwj-lkp@intel.com>
References: <20250113-google-vkms-managed-v7-4-4f81d1893e0b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-google-vkms-managed-v7-4-4f81d1893e0b@bootlin.com>
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

Hi Louis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f8a2397baf041a5cee408b082334bb09c7e161df]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/drm-vkms-Switch-to-managed-for-connector/20250114-011112
base:   f8a2397baf041a5cee408b082334bb09c7e161df
patch link:    https://lore.kernel.org/r/20250113-google-vkms-managed-v7-4-4f81d1893e0b%40bootlin.com
patch subject: [PATCH v7 4/7] drm: writeback: Create an helper for drm_writeback_connector initialization
config: i386-randconfig-014-20250115 (https://download.01.org/0day-ci/archive/20250115/202501150938.a3MspUwj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501150938.a3MspUwj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501150938.a3MspUwj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_writeback.c: In function 'drm_writeback_connector_init_with_encoder':
>> drivers/gpu/drm/drm_writeback.c:321:35: warning: unused variable 'blob' [-Wunused-variable]
     321 |         struct drm_property_blob *blob;
         |                                   ^~~~
   drivers/gpu/drm/drm_writeback.c: At top level:
   drivers/gpu/drm/drm_writeback.c:348:13: warning: 'drm_writeback_connector_cleanup' defined but not used [-Wunused-function]
     348 | static void drm_writeback_connector_cleanup(struct drm_device *dev,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/gpu/drm/drm_writeback.c:243: warning: expecting prototype for drm_writeback_connector_init_with_encoder(). Prototype was for __drm_writeback_connector_init() instead


vim +/blob +321 drivers/gpu/drm/drm_writeback.c

   214	
   215	/**
   216	 * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
   217	 * a custom encoder
   218	 *
   219	 * @dev: DRM device
   220	 * @wb_connector: Writeback connector to initialize
   221	 * @enc: handle to the already initialized drm encoder
   222	 * @formats: Array of supported pixel formats for the writeback engine
   223	 * @n_formats: Length of the formats array
   224	 *
   225	 * This function creates the writeback-connector-specific properties if they
   226	 * have not been already created, initializes the connector as
   227	 * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
   228	 * values.
   229	 *
   230	 * This function assumes that the drm_writeback_connector's encoder has already been
   231	 * created and initialized before invoking this function.
   232	 *
   233	 * In addition, this function also assumes that callers of this API will manage
   234	 * assigning the encoder helper functions, possible_crtcs and any other encoder
   235	 * specific operation.
   236	 *
   237	 * Returns: 0 on success, or a negative error code
   238	 */
   239	static int __drm_writeback_connector_init(struct drm_device *dev,
   240						  struct drm_writeback_connector *wb_connector,
   241						  struct drm_encoder *enc, const u32 *formats,
   242						  int n_formats)
 > 243	{
   244		struct drm_connector *connector = &wb_connector->base;
   245		struct drm_mode_config *config = &dev->mode_config;
   246		struct drm_property_blob *blob;
   247		int ret = create_writeback_properties(dev);
   248	
   249		if (ret != 0)
   250			return ret;
   251	
   252		connector->interlace_allowed = 0;
   253	
   254		ret = drm_connector_attach_encoder(connector, enc);
   255		if (ret)
   256			return ret;
   257	
   258		blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
   259						formats);
   260		if (IS_ERR(blob))
   261			return PTR_ERR(blob);
   262	
   263		INIT_LIST_HEAD(&wb_connector->job_queue);
   264		spin_lock_init(&wb_connector->job_lock);
   265	
   266		wb_connector->fence_context = dma_fence_context_alloc(1);
   267		spin_lock_init(&wb_connector->fence_lock);
   268		snprintf(wb_connector->timeline_name,
   269			 sizeof(wb_connector->timeline_name),
   270			 "CONNECTOR:%d-%s", connector->base.id, connector->name);
   271	
   272		drm_object_attach_property(&connector->base,
   273					   config->writeback_out_fence_ptr_property, 0);
   274	
   275		drm_object_attach_property(&connector->base,
   276					   config->writeback_fb_id_property, 0);
   277	
   278		drm_object_attach_property(&connector->base,
   279					   config->writeback_pixel_formats_property,
   280					   blob->base.id);
   281		wb_connector->pixel_formats_blob_ptr = blob;
   282	
   283		return 0;
   284	}
   285	
   286	/**
   287	 * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
   288	 * a custom encoder
   289	 *
   290	 * @dev: DRM device
   291	 * @wb_connector: Writeback connector to initialize
   292	 * @enc: handle to the already initialized drm encoder
   293	 * @con_funcs: Connector funcs vtable
   294	 * @formats: Array of supported pixel formats for the writeback engine
   295	 * @n_formats: Length of the formats array
   296	 *
   297	 * This function creates the writeback-connector-specific properties if they
   298	 * have not been already created, initializes the connector as
   299	 * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
   300	 * values.
   301	 *
   302	 * This function assumes that the drm_writeback_connector's encoder has already been
   303	 * created and initialized before invoking this function.
   304	 *
   305	 * In addition, this function also assumes that callers of this API will manage
   306	 * assigning the encoder helper functions, possible_crtcs and any other encoder
   307	 * specific operation.
   308	 *
   309	 * Drivers should always use this function instead of drm_connector_init() to
   310	 * set up writeback connectors if they want to manage themselves the lifetime of the
   311	 * associated encoder.
   312	 *
   313	 * Returns: 0 on success, or a negative error code
   314	 */
   315	int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
   316						      struct drm_writeback_connector *wb_connector,
   317						      struct drm_encoder *enc,
   318						      const struct drm_connector_funcs *con_funcs,
   319						      const u32 *formats, int n_formats)
   320	{
 > 321		struct drm_property_blob *blob;
   322		struct drm_connector *connector = &wb_connector->base;
   323		int ret;
   324	
   325		ret = drm_connector_init(dev, connector, con_funcs,
   326					 DRM_MODE_CONNECTOR_WRITEBACK);
   327		if (ret)
   328			return ret;
   329	
   330		ret = __drm_writeback_connector_init(dev, wb_connector, enc, formats,
   331						     n_formats);
   332		if (ret)
   333			drm_connector_cleanup(connector);
   334	
   335		return ret;
   336	}
   337	EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
   338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
