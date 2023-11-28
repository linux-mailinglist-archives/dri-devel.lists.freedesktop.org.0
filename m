Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75D57FBA8E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 13:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7899110E506;
	Tue, 28 Nov 2023 12:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1EA10E506
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 12:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701176051; x=1732712051;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5K++CR/OvistPw0XQfzY/YBgYQVr3P4OlOvmEu/zZC4=;
 b=gXTbmgMBI9JWxWh3pdsub7ntkhG2pDcAauw3qNg36I6GATPTC1nyAgF9
 vPqc8UZTaYjGQko9j/LBoakBrn20KrtCNFcnC9ovXoOQ4uwSbpNKaYpqz
 ZfQLgyagThHQnCT2KdQSFyeGtTSWsQT+oqzKFeAVl/Pnc7FICIRkSGCU/
 cBrDXNB1sWOjs9Jen0SnmTSvWbKm41Dfu/yqTvWJRWnrUDgHL23qM5R2q
 zS+ZxdJJuoI1VxYFsx6okVE2xRwNcNW6bxIFW4hk6aS3VKQtc85yiWD7M
 obPkymzN+aNXptgxxh7fIsf4rM+0ElMlIhlqQboYXv1fPHQ/+puycU12R A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="377943907"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="377943907"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 04:54:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="1015900733"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; d="scan'208";a="1015900733"
Received: from mravivx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 04:54:04 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, Jonathan Corbet
 <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St?=
 =?utf-8?Q?=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v4 05/45] drm/connector: Check drm_connector_init
 pointers arguments
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
 <20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org>
Date: Tue, 28 Nov 2023 14:54:02 +0200
Message-ID: <87h6l66nth.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Nov 2023, Maxime Ripard <mripard@kernel.org> wrote:
> All the drm_connector_init variants take at least a pointer to the
> device, connector and hooks implementation.
>
> However, none of them check their value before dereferencing those
> pointers which can lead to a NULL-pointer dereference if the author
> isn't careful.

Arguably oopsing on the spot is preferrable when this can't be caused by
user input. It's always a mistake that should be caught early during
development.

Not everyone checks the return value of drm_connector_init and friends,
so those cases will lead to more mysterious bugs later. And probably
oopses as well.


BR,
Jani.


>
> Let's test those pointers instead and error out if any is NULL.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_connector.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index b0516505f7ae..2f60755dccdd 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -229,6 +229,9 @@ static int __drm_connector_init(struct drm_device *dev,
>  	struct ida *connector_ida =
>  		&drm_connector_enum_list[connector_type].ida;
>  
> +	if (!dev || !connector || !funcs)
> +		return -EINVAL;
> +
>  	WARN_ON(drm_drv_uses_atomic_modeset(dev) &&
>  		(!funcs->atomic_destroy_state ||
>  		 !funcs->atomic_duplicate_state));

-- 
Jani Nikula, Intel
