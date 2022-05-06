Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F23F751DC78
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 17:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30F410E81B;
	Fri,  6 May 2022 15:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78DD10E81B;
 Fri,  6 May 2022 15:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651851891; x=1683387891;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nyZ5t8pD3rFxQXXz8gDpvzek8yDDoj/KX1ArnB2/pcM=;
 b=j0QDWj1uqgYKDMPFQDudQ4+fqP3w1GcWSbxWyATSAgDkpJDmivBZb/k6
 EHoJ83AdhIpRWIacYPKMn8YnpIO4GqknJCsxKSp+pamCHwuONvF2L9Pnp
 ndP8egJrqnvafGr8iFcWfJUe+8+h+NcrEEmTQSKgSmwRllOylp5ElznnK
 UFkqS6OUiY/xiMS6hVuI65MEbo6rTJwiPjtyf+vy/sICRc5kF2Op0sGo8
 qVOF0ZeoneuxPUWAWLRkdKHTnJhBX1jJj3W+u0zix3twyLYJ1/HXCElOA
 nLAsFIvoVbTIKWk8BzVrx0dGsqTV9mCSKegiFCih6Opy4H+N5cCPD9pAs A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="267338318"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="267338318"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 08:44:51 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="586039009"
Received: from hbourgeo-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.81])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 08:44:48 -0700
Date: Fri, 6 May 2022 17:44:44 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [Intel-gfx] [PATCH] fbdev: efifb: Fix a use-after-free due early
 fb_info cleanup
Message-ID: <YnVCbJJ5DmhkD5WA@intel.intel>
References: <20220506132225.588379-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220506132225.588379-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Jones <pjones@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Fri, May 06, 2022 at 03:22:25PM +0200, Javier Martinez Canillas wrote:
> Commit d258d00fb9c7 ("fbdev: efifb: Cleanup fb_info in .fb_destroy rather
> than .remove") attempted to fix a use-after-free error due driver freeing
> the fb_info in the .remove handler instead of doing it in .fb_destroy.
> 
> But ironically that change introduced yet another use-after-free since the
> fb_info was still used after the free.
> 
> This should fix for good by freeing the fb_info at the end of the handler.
> 
> Fixes: d258d00fb9c7 ("fbdev: efifb: Cleanup fb_info in .fb_destroy rather than .remove")
> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Reported-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
