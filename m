Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E66B4FD8E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177C710E749;
	Tue,  9 Sep 2025 13:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WW7uhxoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA5610E750;
 Tue,  9 Sep 2025 13:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757425243; x=1788961243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TOKivSYM8AaGjR0sjfOBNZldzL9uNMrmIjNBs/jU5RA=;
 b=WW7uhxoVB7QPgwqIb+11dZUg0iX6qtQ0iWtJrvQMt8RIs4+W5NNnxVAV
 iim+eGH+JPHm3NP8Dghn1kUDSOg+RthFrpvh2wP7pDG80hMi9IZJ7vZce
 hHLdrNkpyTbZX0rMOQFDyxrNEb5mXwlcAjQOL2F7ppTYlQCqNjczb9YtC
 jJ6d//FQk+h7u+pl6uK34uE+ZQUCovAKsz94VkddglZt++zp5ea3H7Iyu
 YvIkfuvYjb2b2Kcn7IH941RifvTznm+6uldur2aMcSFmwsPoE9xjlC2nU
 B87i3VGKcSgqCb556cuBpVwPDNRpCpR/NRw6n7mlbh5X+d6P291vP29QU Q==;
X-CSE-ConnectionGUID: o5OG+VBPRSGKT+NRs/6Ibw==
X-CSE-MsgGUID: hsxG12lSRw+zE3qOiaT0/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59854824"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="59854824"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:40:43 -0700
X-CSE-ConnectionGUID: d5jyn5U6RTqDwtadbZsjtg==
X-CSE-MsgGUID: 3dTjMfjGQGi/s8TDcuomyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="204075081"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:40:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/hwmon: Use devm_mutex_init()
Date: Tue,  9 Sep 2025 06:40:26 -0700
Message-ID: <175742518952.1517056.6092120545087383831.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <989e96369e9e1f8a44b816962917ec76877c912d.1757252520.git.christophe.jaillet@wanadoo.fr>
References: <989e96369e9e1f8a44b816962917ec76877c912d.1757252520.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Sun, 07 Sep 2025 15:42:17 +0200, Christophe JAILLET wrote:
> Use devm_mutex_init() instead of hand-writing it.
> 
> This saves some LoC, improves readability and saves some space in the
> generated .o file.
> 
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   36884	  10296	     64	  47244	   b88c	drivers/gpu/drm/xe/xe_hwmon.o
> 
> [...]

Applied to drm-xe-next, thanks!

[1/1] drm/xe/hwmon: Use devm_mutex_init()
      commit: 7b77941724628e6171a286edbf04d67a1f1c1459

Best regards,
-- 
Lucas De Marchi

