Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295BB52BD93
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 16:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A26610ECCC;
	Wed, 18 May 2022 14:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D4B10E5A2;
 Wed, 18 May 2022 14:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652884864; x=1684420864;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=N7/Lr13Nq3+cgQ9nRRBQsS1SbDGs6O+4RWMayy47cVU=;
 b=lGtU0NZWekHrr9bqn/Rx+cGLfUgwPErGBQYKlGPyKNnyDUMoy+VaziNR
 DqIBEtz5vRtxZRj4ksdsvpaf3/JOLE8Qm8urbFHUiR9Ps9n4SFo3lcbfN
 hNchNI6NTgzqtAp+L2a1g0C4rcSC8+fCRg10H9CmMuPzRTvUJXmcPS+fE
 jTuLO002r9/yI3oFfxrYXK3uc4SYQ8uzTJAnpAnJTn1XPIIq7uBJtv0yN
 8JHdaQxgjl9a8SeadaiPpcE6DE1PdxxW+Gee2662aKjnKP3jo4/Ffjvw4
 qPbqaFkT/wHWXqUFCrpNYGliZbsCjc2KNJXIfpbHr7LO7/QW+k1yfOGOm Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="358112835"
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; d="scan'208";a="358112835"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 07:41:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; d="scan'208";a="569502165"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga007.jf.intel.com with SMTP; 18 May 2022 07:40:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 May 2022 17:40:58 +0300
Date: Wed, 18 May 2022 17:40:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
Message-ID: <YoUFeoMMiTRSADrY@intel.com>
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <87pmljerpi.fsf@intel.com>
 <5423103a-3707-ba99-f45e-8608bc594bbd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5423103a-3707-ba99-f45e-8608bc594bbd@redhat.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 18, 2022 at 02:59:58PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 4/14/22 15:10, Jani Nikula wrote:
> > There are some cases where we can actually get a rough PWM/luminance
> > curve from i915 opregion. I think maybe 16 data points. We've never
> > exposed that. My idea was that you'd have a property where you could add
> > data points for the curve, it could get pre-populated by the kernel if
> > the kernel knows how to do it, defaulting to linear, but it could also
> > be set or adjusted by userspace. The point would be that the userspace
> > adjusts brightness linearly, and the kernel would use the curve data
> > points to adjust it non-linearly. The userspace could have completely
> > separated brightness adjustment and curve adjustment, and the brightness
> > adjustment would be dead simple.
> 
> Interesting, I guess this could be a future feature addition on top
> of my work.

Here's an outdated branch:
https://github.com/vsyrjala/linux/commits/blcm_backlight

Wrote that some years ago after getting fed up with the useless
non-linear respose of the brightness up/down buttons on my laptop.
Been running it ever since.

-- 
Ville Syrjälä
Intel
