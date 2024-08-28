Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BC3962D66
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 18:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17A110E554;
	Wed, 28 Aug 2024 16:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mqKJGlga";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8959C10E554
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 16:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724861679; x=1756397679;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MhiG3enw+ji0eAZ0R9BOt88yBzg78KB2GVTSPX+bXQY=;
 b=mqKJGlgaEtFI654bNanWl6z91nnM3FiVOpkoz/8dC+mfny0y9QIGmAp0
 k5FoJ0s8EffHPaK7kY7xRaQ1KVZEyo4Vt/wuz35Es0j9hkpT3qShYL3tx
 9i5Wenr+4ihgXMTMmOk4Fl2o1b3UEE1qT0ntMXjbWsp9jQsgfxZevdFIl
 DfU7GgfGOtl+PwN3pbEHx3tgjaMehKISWn3b2cVKUWzkDKUQ1I99TIJuE
 9V2vNXg3osn2D+0hlxrN1kyFPKGhmyC7lzKVGPeGvMEzdd4h2qPf4lo1p
 OvK29Ja6JQslb9c1jesrNXOXO1qlXdbFpoxTjc3Sxv2qaEQampB/OVnO2 g==;
X-CSE-ConnectionGUID: Ovt5bESBRAyCtyxQqpl+0g==
X-CSE-MsgGUID: 94FdTMWxQXmWvXf7sgWVkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="33974264"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="33974264"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 09:14:39 -0700
X-CSE-ConnectionGUID: 7pymODndTPqT2wefrOo4cw==
X-CSE-MsgGUID: 7bLdXbTFTP+eGER7tpKENA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="67626249"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.110])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 09:14:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 2/7] media: v4l2-core: add v4l2_debugfs_if_alloc/free()
In-Reply-To: <e50c59a6-dd2d-4692-a3b1-e67fce043683@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1724855053.git.hverkuil-cisco@xs4all.nl>
 <931a281c72e9c3081eaedc2d76806ebd770a0913.1724855053.git.hverkuil-cisco@xs4all.nl>
 <87jzg0y9bg.fsf@intel.com>
 <e50c59a6-dd2d-4692-a3b1-e67fce043683@xs4all.nl>
Date: Wed, 28 Aug 2024 19:14:31 +0300
Message-ID: <87ed68y68o.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 28 Aug 2024, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> On 28/08/2024 17:08, Jani Nikula wrote:
>> I recently discovered a lot of drm depending on getting seq_file.h and
>> debugfs.h via media/cec.h...
>
> Patches are welcome!

I've got the patch, just need to get these [1] reviewed and merged
first...

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1724689818.git.jani.nikula@intel.com


-- 
Jani Nikula, Intel
