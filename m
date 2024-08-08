Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB75D94BE4E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 15:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E6A10E720;
	Thu,  8 Aug 2024 13:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kM28w1F3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDCD10E720
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723122959; x=1754658959;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LDwvaXSQU6mgwf6BXtOXY9FsaYa+mYPA6eepzvwf6lk=;
 b=kM28w1F378mOeXxtOl6EBiXNKu4ocddsJ4o3CGgQo2TnlrrlRW+a+w9c
 rDUQ2RpC/4i7pmhgPSoWUv1/KgyVm7jB1ndemEbiYTxdjP1nVXm2GjMCC
 T3pSCixanNK1g7i75nscxKBEJQhzXpTjksuoYkLBPeJwmVM2ZmwT1XCCw
 J600JoaTnaKF5IQ8ZG4qlDEPhGPEMwdRXWdNWsArA6fuwLr6AZZYMekoq
 o42wL0H1LTTAGEJidCRapqaulK9Jub1L63s/YMt0rDOcmZs6elx/QanAw
 9yASGcMtKVAIyL+WkywgcPqE4xgwOENnVDXKOmtjUDeUdO29FQpdqZtEA A==;
X-CSE-ConnectionGUID: SEKgmb40RUiOir7Gjh9C0g==
X-CSE-MsgGUID: 9nH6V1yVSVeYAVf8yCD0HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21388396"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="21388396"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 06:15:59 -0700
X-CSE-ConnectionGUID: YW7BaXndT9SqanKjBLaFsA==
X-CSE-MsgGUID: PR3hQc8tTxqLm6ocscYWzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="57924489"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.81])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 06:15:52 -0700
Date: Thu, 8 Aug 2024 14:15:46 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev: omapfb: Use sysfs_emit_at() to simplify code
Message-ID: <ZrTFAk5DCmYAKR8F@ashyti-mobl2.lan>
References: <fa1c03aded0c36585d29991d85d083853c3ca871.1723119220.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa1c03aded0c36585d29991d85d083853c3ca871.1723119220.git.christophe.jaillet@wanadoo.fr>
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

Hi Christophe,

On Thu, Aug 08, 2024 at 02:14:22PM +0200, Christophe JAILLET wrote:
> This file already uses sysfs_emit(). So be consistent and also use
> sysfs_emit_at().
> 
> Moreover, size is always < PAGE_SIZE because scnprintf() (and now
> sysfs_emit_at()) returns the number of characters written not including the
> trailing '\0'. So some tests can be removed.
> 
> This slightly simplifies the code and makes it more readable.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
