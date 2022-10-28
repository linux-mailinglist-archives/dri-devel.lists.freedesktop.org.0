Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001F7610E0F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 12:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604D910E7D7;
	Fri, 28 Oct 2022 10:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6290710E7D7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 10:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666951459; x=1698487459;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hhsMbbxGYStohAh15fvX1DMTKWlhhSTK1Gfncm9ni3g=;
 b=mefgcWK1a7IBjfh1dYUJyw3nWsJQXpgp9lG8qLdpbJq67uLR4yVDhfKl
 rZ4r7iBRSmNg42Q7mQxb4sv8m/u6KsrD0MuAhF9SA33kyNCrA3+6NXm8h
 HCAvIEoQLfPXB3Ys4y6+wDNyOLSBSwmh4FPvxiJDqCq89aYbySAvY2sCF
 XTWQDJ40rp6rPC+cViFL4cKpOwODbHJYVVgiPEFNCFMYH54JPhERhIAg2
 sddIZr8dlJNePAZ6Aqj1e4+Lhg4RGPBwMI00yEttEzKNcY/U0/6tg4P9U
 NoOw119Zm2GGfCRfu2uWuDkEaqGRh8u4Cahs/UDUlLq1twdK0stBLNiHv w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="335098198"
X-IronPort-AV: E=Sophos;i="5.95,220,1661842800"; d="scan'208";a="335098198"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2022 03:04:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="627478453"
X-IronPort-AV: E=Sophos;i="5.95,220,1661842800"; d="scan'208";a="627478453"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga007.jf.intel.com with SMTP; 28 Oct 2022 03:04:13 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 28 Oct 2022 13:04:11 +0300
Date: Fri, 28 Oct 2022 13:04:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/simpledrm: Only advertise formats that are supported
Message-ID: <Y1upGwtjWgtLUZ1k@intel.com>
References: <20221027101327.16678-1-marcan@marcan.st>
 <fa4efcfd-91b6-dc76-2e5c-eed538bccff3@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa4efcfd-91b6-dc76-2e5c-eed538bccff3@suse.de>
X-Patchwork-Hint: comment
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel@lists.freedesktop.org, Hector Martin <marcan@marcan.st>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 27, 2022 at 01:08:24PM +0200, Thomas Zimmermann wrote:
> I trust you when you say that <native>->XRGB8888 is not enough. But 
> although I've read your replies, I still don't understand why this 
> switch is necessary.
> 
> Why don't we call drm_fb_build_fourcc_list() with the native 
> format/formats and let it append a number of formats, such as adding 
> XRGB888, adding ARGB8888 if necessary, adding ARGB2101010 if necessary. 
> Each with a elaborate comment why and which userspace needs the format. (?)

Are you saying there is some real userspace that breaks without
the alpha formats? That would already be broken on many devices.

-- 
Ville Syrjälä
Intel
