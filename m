Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B34DC00159
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 11:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A3410E02F;
	Thu, 23 Oct 2025 09:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mv7BkrUj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C673D10E02F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761210285; x=1792746285;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=q0bSQQY5SwYrEmcp4I13QmQfjO3pwF0ctbdE1M1LmXE=;
 b=Mv7BkrUjH2x/fESL1JdFHflSCduGNhB+h2o//c9ot0OC/JkrL9ur4ZHZ
 5WvtGInSONw//P6E0NY3gWGDLEEoGZQlfQwRKK/HL4Pefw0KABZTKMlvR
 yn4Yyze9+YCXqNYp6sJ3qkkxE3JeFgUehtcyVv0+zryRT9g8uix0l25wP
 cv9Mi6No/nUPN8hITCiXA6hoBElxoEF37IGr6KWV7rP1Vq+N0Nwb0Wep1
 cQxfrhu9GNzy8PX9NSxSZOxQNur9HZBisW3zfm/fQ4ag5BXkBpBuLUzHT
 UvvX0U8taZqjifBtcZiN87QONU4AcIPnx/jjMzwlFafTeRxt0lJ9HeQgf Q==;
X-CSE-ConnectionGUID: ql+79OhQQLmMBEn6rNpmTA==
X-CSE-MsgGUID: xvpA0ZsGRvOMuPsRXZmcfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86000465"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="86000465"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:04:45 -0700
X-CSE-ConnectionGUID: XCuwvFI+SqK9YXh418DnrA==
X-CSE-MsgGUID: +Dw2Sy/hQ4+K8k1hORJSyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183709423"
Received: from bkammerd-mobl.amr.corp.intel.com (HELO kuha.fi.intel.com)
 ([10.124.221.165])
 by orviesa009.jf.intel.com with SMTP; 23 Oct 2025 02:04:35 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Thu, 23 Oct 2025 12:04:33 +0300
Date: Thu, 23 Oct 2025 12:04:33 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 1/9] usb: typec: Add notifier functions
Message-ID: <aPnvoSRJefwDlpNO@kuha.fi.intel.com>
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-2-kernel@airkyi.com>
 <aPni4AeDaem_rfZH@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPni4AeDaem_rfZH@kuha.fi.intel.com>
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

On Thu, Oct 23, 2025 at 11:10:20AM +0300, Heikki Krogerus wrote:
> Hi,
> 
> > diff --git a/include/linux/usb/typec_notify.h b/include/linux/usb/typec_notify.h
> > new file mode 100644
> > index 000000000000..a3f1f3b3ae47
> > --- /dev/null
> > +++ b/include/linux/usb/typec_notify.h
> > @@ -0,0 +1,17 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef __USB_TYPEC_NOTIFY
> > +#define __USB_TYPEC_NOTIFY
> > +
> > +#include <linux/notifier.h>
> > +
> > +enum usb_typec_event {
> > +	TYPEC_ALTMODE_REGISTERED
> > +};
> 
> Don't you need to know when the altmode is removed?

I noticed that you don't because drm_dp_hpd_bridge_register() is
always resource managed. But I think you could still send an event
also when the altmode is removed already now. That way it does not
need to be separately added if and when it is needed.

thanks,

-- 
heikki
