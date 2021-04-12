Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8843D35C1A7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A672C6E05D;
	Mon, 12 Apr 2021 09:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7216E05D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 09:36:55 +0000 (UTC)
IronPort-SDR: MmMNI9NoR0zgenXU5IkeoKJROc8udDBi8KQJbw+KEknWlP/03dB1JaN3dqwvay66wwkIbWDEnY
 Ve4+AunQ2LlQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="279450459"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="279450459"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:36:51 -0700
IronPort-SDR: BBCOyapemeK9QZkDPBZxXvoR2i98nYdREezj2tp28wTBkgLtXJB+Xt78hIAApuRKeB+lVe58sq
 BSfQQBkcXE7g==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="417310215"
Received: from cyeni-mobl.ger.corp.intel.com (HELO localhost) ([10.252.62.41])
 by fmsmga008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:36:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, corbet@lwn.net
Subject: Re: [PATCH 1/3] drm/aperture: Add infrastructure for aperture
 ownership
In-Reply-To: <20210412090021.23054-2-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210412090021.23054-1-tzimmermann@suse.de>
 <20210412090021.23054-2-tzimmermann@suse.de>
Date: Mon, 12 Apr 2021 12:36:44 +0300
Message-ID: <87mtu3kfo3.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 12 Apr 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> + * DRM drivers should call drm_aperture_remove_conflicting_framebuffers()
> + * at the top of their probe function. The function removes any generic
> + * driver that is currently associated with the given framebuffer memory.
> + * If the framebuffer is located at PCI BAR 0, the rsp code looks as in the
> + * example given below.
> + *
> + * .. code-block:: c
> + *
> + *	static int remove_conflicting_framebuffers(struct pci_dev *pdev)
> + *	{
> + *		bool primary = false;
> + *		resource_size_t base, size;
> + *		int ret;
> + *
> + *		base = pci_resource_start(pdev, 0);
> + *		size = pci_resource_len(pdev, 0);
> + *	#ifdef CONFIG_X86
> + *		primary = pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
> + *	#endif
> + *
> + *		return drm_aperture_remove_conflicting_framebuffers(base, size, primary,
> + *		                                                    "example driver");
> + *	}
> + *
> + *	static int probe(struct pci_dev *pdev)
> + *	{
> + *		int ret;
> + *
> + *		// Remove any generic drivers...
> + *		ret = remove_conflicting_framebuffers(pdev);
> + *		if (ret)
> + *			return ret;
> + *
> + *		// ... and initialize the hardware.
> + *		...
> + *
> + *		drm_dev_register();
> + *
> + *		return 0;
> + *	}

I'm guessing you can't use tabs for the first indentation level
here. IIRC kernel-doc removes the leading comment marker and one
whitespace whether it's space or tab, resulting in rst where the
code-block contents are only partially indented.

Please test the documentation build before applying.

Otherwise, the series seems like a nice cleanup.

Acked-by: Jani Nikula <jani.nikula@intel.com>



-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
