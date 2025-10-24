Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1D8C0502E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 10:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F1C10E9FD;
	Fri, 24 Oct 2025 08:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4iS8vy6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D4910E9FD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 08:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761293789; x=1792829789;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Y6hIryfME2/PZmCw4H4nq4PMUJueVx80pY8OjCr1KyY=;
 b=g4iS8vy6q5JvMmzMps77tHvI90cEA4UYPIvl0SdkIAmyc/4CGdjeAts6
 mqc+I5nZ5dAAjCFANskfCZv/Aomj7+74nngllAugfs5M8uS84buN/0q2k
 0RwJerjflp9EnA025DOiAs6P+DXQKnpssePSUD+rLJVBkVqJ7JkWSHTcD
 R5Ux0FacINPl80akVR3pte8gyI+KkTb6HPQEyDFRLC0WWJaOqk0x6bq25
 T/w0Pc6PIX7QcC+ZS4MH4v6v5lmDVrKqWbdcIDwAN3dcQQcAJkzdQDrEc
 P2NcvujPA8r9NWSXtEZtvc97KGwRdJxNVjcZjm9c5V5mLbH2On9yKWjFX w==;
X-CSE-ConnectionGUID: HQfG5ZEGRqeyb7wnzgvAFQ==
X-CSE-MsgGUID: +RI31yihR5y4JFk5UuK+gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74145051"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="74145051"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:16:28 -0700
X-CSE-ConnectionGUID: Chd3dXKyQl6vo1nUEb8nyA==
X-CSE-MsgGUID: CnAOpA8XQ3utXO3rexXLig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="215297555"
Received: from mjruhl-desk.amr.corp.intel.com (HELO kuha.fi.intel.com)
 ([10.124.221.255])
 by fmviesa001.fm.intel.com with SMTP; 24 Oct 2025 01:16:17 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Fri, 24 Oct 2025 11:16:16 +0300
Date: Fri, 24 Oct 2025 11:16:16 +0300
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
Message-ID: <aPs10Ay_cQ5TZ7nb@kuha.fi.intel.com>
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023033009.90-2-kernel@airkyi.com>
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

> +#include <linux/notifier.h>
> +#include <linux/usb/typec_notify.h>
> +
> +static BLOCKING_NOTIFIER_HEAD(typec_notifier_list);
> +
> +int typec_register_notify(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&typec_notifier_list, nb);
> +}
> +EXPORT_SYMBOL_GPL(typec_register_notify);
> +
> +int typec_unregister_notify(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_unregister(&typec_notifier_list, nb);
> +}
> +EXPORT_SYMBOL_GPL(typec_unregister_notify);

Better name these more clearly:

typec_altmode_register_notify()
typec_altmode_unregister_notify()

thanks,

-- 
heikki
