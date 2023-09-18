Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7BA7A4193
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 08:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD38F10E1AB;
	Mon, 18 Sep 2023 06:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E74A10E1AB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 06:55:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="382323759"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="382323759"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2023 23:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="695417720"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="695417720"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2023 23:55:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
 (envelope-from <andy@kernel.org>) id 1qi8AI-0000000DVlr-18aJ;
 Mon, 18 Sep 2023 09:55:26 +0300
Date: Mon, 18 Sep 2023 09:55:25 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2 1/5] string.h: add array-wrappers for (v)memdup_user()
Message-ID: <ZQf0XfrKiwhvkxum@smile.fi.intel.com>
References: <cover.1694202430.git.pstanner@redhat.com>
 <93001a9f3f101be0f374080090f9c32df73ca773.1694202430.git.pstanner@redhat.com>
 <b219788a-69e6-44cf-a609-91f9640967f5@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b219788a-69e6-44cf-a609-91f9640967f5@moroto.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Christian Brauner <brauner@kernel.org>, Siddh Raman Pant <code@siddh.me>,
 Kees Cook <keescook@chromium.org>, Philipp Stanner <pstanner@redhat.com>,
 kexec@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-hardening@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 David Disseldorp <ddiss@suse.de>, Nick Alcock <nick.alcock@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 16, 2023 at 05:32:42PM +0300, Dan Carpenter wrote:
> On Fri, Sep 08, 2023 at 09:59:40PM +0200, Philipp Stanner wrote:

...

> > +static inline void *memdup_array_user(const void __user *src, size_t n, size_t size)
> > +{
> > +	size_t nbytes;
> > +
> > +	if (unlikely(check_mul_overflow(n, size, &nbytes)))
> > +		return ERR_PTR(-EOVERFLOW);
> 
> No need for an unlikely() because check_mul_overflow() already has one
> inside.

Makes sense.

> I feel like -ENOMEM is more traditional but I doubt anyone/userspace
> cares.

ENOMEM is good for the real allocation calls, here is not the one (the one is
below). Hence ENOMEM is not good candidate above. And whenever functions returns
an error pointer the caller must not assume that it will be only ENOMEM for
allocators.

> > +	return memdup_user(src, nbytes);
> > +}

-- 
With Best Regards,
Andy Shevchenko


