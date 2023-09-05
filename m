Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B607922A0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 14:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E18F10E4D7;
	Tue,  5 Sep 2023 12:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF9D10E4D1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 12:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693916912; x=1725452912;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bIvwvVLX2QgqgZ6NIpuMrd+CJE12wHgoLPkmBc9kTgM=;
 b=fZxP1OnNQvt32IAXQKsV+lrJOv4kJb4aJroErXTaAQDLZGwqkKeJahDB
 vemJ6ldTSS36HmNmczDFljVm5ayXzf6YXf/6Pz2zHZFvwGlrqjNpHfdX7
 2097Uue5ptSDI2dtQux4yAkqtullE+LlFP58CGvsLo10D0gea/HhTcFfQ
 lTEaaGTcCLD1POuMHI6/z9AjOzGFdZ92gZdGcVJcJiGjm17SCUdx5Ev25
 XCE+oSSfuw9v3v7DB+iaV5FTYOVYgpqIhCUKbHg6aFQQkOyBa2JvWpXsR
 jTN4iejTVFyBdtG6ZW55gJ+2Ux9ckiOjVDchrrS/LxRvTtkURwKHMIP9N w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="379501519"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="379501519"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 05:28:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="776187146"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="776187146"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 05:28:29 -0700
Date: Tue, 5 Sep 2023 14:28:27 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] accel/habanalabs/gaudi2: Fix incorrect string length
 computation in gaudi2_psoc_razwi_get_engines()
Message-ID: <20230905122827.GD184247@linux.intel.com>
References: <d38582083ece76155dabdfd9a29d5a9dd0d6bce7.1693855091.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d38582083ece76155dabdfd9a29d5a9dd0d6bce7.1693855091.git.christophe.jaillet@wanadoo.fr>
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
Cc: kernel-janitors@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 Dani Liberman <dliberman@habana.ai>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 04, 2023 at 09:18:36PM +0200, Christophe JAILLET wrote:
> snprintf() returns the "number of characters which *would* be generated for
> the given input", not the size *really* generated.
> 
> In order to avoid too large values for 'str_size' (and potential negative
> values for "PSOC_RAZWI_ENG_STR_SIZE - str_size") use scnprintf()
> instead of snprintf().
> 
> Fixes: c0e6df916050 ("accel/habanalabs: fix address decode RAZWI handling")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
