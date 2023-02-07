Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A242168D490
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 11:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEDF10E4C0;
	Tue,  7 Feb 2023 10:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301F410E4B4;
 Tue,  7 Feb 2023 10:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675766442; x=1707302442;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qcFJ8lJPUxyfYx7iINSQUKSa6QTwsgySD+m+W1wNhOA=;
 b=LElB6kM6yPmh0NL3Krh6kqw26pev5QRp6NyOWkVvrpey49yuHrCw5Yzc
 o9ud+kwFipIPY/7pPeBWVQmUoB5GDpDG58v1D3cWucmTwXJfPy6ljI9LU
 ZyhIvmiXgcccnhPmmmQS4ej70BKII0tTsxXy/Ffn6SweZRx5uzfkDzlPw
 bjwb81cyCB/piTF4N18wde+pvlfwVbp2DwNuXc2HUWKHtQc8d7nBjvund
 OqDL9DzG6XlgGdKcvoYsoSvOX6N7W5NzzlivF7aNrQO1CodlPb0Qp4EaM
 cRePSZ9lhUYpQeEj0qjLlq7zp301run5YmlHH5WHVshDjZ6dFIugoWhyl Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="331607581"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="331607581"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 02:40:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="735502557"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="735502557"
Received: from isergee-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.249.37.137])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 02:40:34 -0800
Date: Tue, 7 Feb 2023 11:40:31 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/pcode: Give the punit time to
 settle before fatally failing
Message-ID: <Y+Iqn7OjjtINheD2@ashyti-mobl2.lan>
References: <20230206183236.109908-1-andi.shyti@linux.intel.com>
 <d88c8392-ebd5-ffd3-d64a-a461a0f50f53@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d88c8392-ebd5-ffd3-d64a-a461a0f50f53@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

> > During module load the punit might still be busy with its booting
> > routines. During this time we try to communicate with it but we
> > fail because we don't receive any feedback from it and we return
> > immediately with a -EINVAL fatal error.
> > 
> > At this point the driver load is "dramatically" aborted. The
> > following error message notifies us about it.
> > 
> >     i915 0000:4d:00.0: drm_WARN_ON_ONCE(timeout_base_ms > 3)
> > 
> > It would be enough to wait a little in order to give the punit
> > the chance to come up bright and shiny, ready to interact with
> > the driver.
> > 
> > Wait up 10 seconds for the punit to settle and complete any
> > outstanding transactions upon module load. If it still fails try
> > again with a longer timeout, 180s, 3 minutes. If it still fails
> > then return -EPROBE_DEFER, in order to give the punit a second
> > chance.
> > 
> > Even if these timers might look long, we should consider that the
> > punit, depending on the platforms, might need long times to
> > complete its routines. Besides we want to try anything possible
> > to move forward before deciding to abort the driver's load.
> > 
> > The issue has been reported in:
> > 
> >     https://gitlab.freedesktop.org/drm/intel/-/issues/7814
> > 
> > The changes in this patch are valid only and uniquely during
> > boot. The common transactions with the punit during the driver's
> > normal operation are not affected.
> > 
> > Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > Co-developed-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> With improved commit message it looks OK for me. There is still question why
> it takes so long for punit to become ready.

It's hardware and some punit operations require that much. There
are some documents floating around that have all these
calculations.

Some devices require even more time and, after consulting with
hardware guys, Aravind had to increase the timeout to 6 minutes!

Boot routines should not require this much, thus the 20 seconds.

> Anyway:
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Thanks a lot for looking into this, Andrzej!

Andi
