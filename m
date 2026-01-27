Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDefI4PEeGmltAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 14:58:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3654953C3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 14:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9FC10E595;
	Tue, 27 Jan 2026 13:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEgLb6eg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BFF10E57A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769522303; x=1801058303;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=og59pwZnyOqe7PNgzDbUl3i3pkVIgIempTHbdxTELvk=;
 b=EEgLb6egniyOnIDvGY0jN361Q+wfxPCsbD/uvJ+of0q9Zcvbs8NZpO+y
 CnLnc1vs8uHdqCiMqFlHU1Ikn0A8U8QGA1mp7kcgP+3ujjC1JJaiE4p+O
 g5xtw58+0EnVbWV6lh8A+2D2JeN15aYNWtW3bC8hUczfazqHhqbATdCQp
 Vhh4KsHMvxytfk2Z/dRMBJHLrXwfwzcmRtqmzG6Z60HsOu0dmKJjR23XP
 rBIloMw2l7095IApbaeFyPvcbXpMUaD5pmKZMEN9/GBP6X2TufTPdQ4Hp
 +nFah58JgEDPE4XzatieMNdgmFsVzqYrqGNyPsYPT5H6SYRslzQU3YAkt g==;
X-CSE-ConnectionGUID: MeqpKj7eQveMvYhtoEbbpQ==
X-CSE-MsgGUID: xxkCiRCYTCudFcs5db4D3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="73302720"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="73302720"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 05:58:22 -0800
X-CSE-ConnectionGUID: BCzws0wPRNOMRGWv4OMbDg==
X-CSE-MsgGUID: 9fMvMzQpQUu7qdSrTcjCXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207876830"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 05:58:16 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, Heiko
 =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Louis
 Chauvet <louis.chauvet@bootlin.com>, Haneen Mohammed
 <hamohammed.sa@gmail.com>, Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 Diederik de Haas <diederik@cknow-tech.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 1/4] uapi: Provide DIV_ROUND_CLOSEST()
In-Reply-To: <20260127-rk3588-bgcolor-v5-1-b25aa8613211@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260127-rk3588-bgcolor-v5-0-b25aa8613211@collabora.com>
 <20260127-rk3588-bgcolor-v5-1-b25aa8613211@collabora.com>
Date: Tue, 27 Jan 2026 15:58:13 +0200
Message-ID: <baf075b2370a13cddd597a3d421b5f39290d87a4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cristian.ciocaltea@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:robert.mader@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:nfraprado@collabora.com,m:diederik@cknow-tech.com,m:andriy.shevchenko@linux.intel.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,rock-chips.com,sntech.de,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F3654953C3
X-Rspamd-Action: no action

On Tue, 27 Jan 2026, Cristian Ciocaltea <cristian.ciocaltea@collabora.com> =
wrote:
> Currently DIV_ROUND_CLOSEST() is only available for the kernel via
> include/linux/math.h.
>
> Expose it to userland as well by adding __KERNEL_DIV_ROUND_CLOSEST() as
> a common definition in uapi.
>
> Additionally, ensure it allows building ISO C applications by switching
> from the 'typeof' GNU extension to the ISO-friendly __typeof__.

I am not convinced that it's a good idea to make the implementation of
kernel DIV_ROUND_CLOSEST() part of the kernel UAPI, which is what this
change effectively does.

I'd at least like to get an ack from Andy Shevchenko first (Cc'd).


BR,
Jani.

> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  include/linux/math.h       | 18 +-----------------
>  include/uapi/linux/const.h | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/include/linux/math.h b/include/linux/math.h
> index 6dc1d1d32fbc..1e8fb3efbc8c 100644
> --- a/include/linux/math.h
> +++ b/include/linux/math.h
> @@ -89,23 +89,7 @@
>  }							\
>  )
>=20=20
> -/*
> - * Divide positive or negative dividend by positive or negative divisor
> - * and round to closest integer. Result is undefined for negative
> - * divisors if the dividend variable type is unsigned and for negative
> - * dividends if the divisor variable type is unsigned.
> - */
> -#define DIV_ROUND_CLOSEST(x, divisor)(			\
> -{							\
> -	typeof(x) __x =3D x;				\
> -	typeof(divisor) __d =3D divisor;			\
> -	(((typeof(x))-1) > 0 ||				\
> -	 ((typeof(divisor))-1) > 0 ||			\
> -	 (((__x) > 0) =3D=3D ((__d) > 0))) ?		\
> -		(((__x) + ((__d) / 2)) / (__d)) :	\
> -		(((__x) - ((__d) / 2)) / (__d));	\
> -}							\
> -)
> +#define DIV_ROUND_CLOSEST __KERNEL_DIV_ROUND_CLOSEST
>  /*
>   * Same as above but for u64 dividends. divisor must be a 32-bit
>   * number.
> diff --git a/include/uapi/linux/const.h b/include/uapi/linux/const.h
> index b8f629ef135f..471877322f47 100644
> --- a/include/uapi/linux/const.h
> +++ b/include/uapi/linux/const.h
> @@ -50,4 +50,21 @@
>=20=20
>  #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>=20=20
> +/*
> + * Divide positive or negative dividend by positive or negative divisor
> + * and round to closest integer. Result is undefined for negative
> + * divisors if the dividend variable type is unsigned and for negative
> + * dividends if the divisor variable type is unsigned.
> + */
> +#define __KERNEL_DIV_ROUND_CLOSEST(x, divisor)(		\
> +{							\
> +	__typeof__(x) __x =3D x;				\
> +	__typeof__(divisor) __d =3D divisor;		\
> +	(((__typeof__(x))-1) > 0 ||			\
> +	 ((__typeof__(divisor))-1) > 0 ||		\
> +	 (((__x) > 0) =3D=3D ((__d) > 0))) ?		\
> +		(((__x) + ((__d) / 2)) / (__d)) :	\
> +		(((__x) - ((__d) / 2)) / (__d));	\
> +}							\
> +)
>  #endif /* _UAPI_LINUX_CONST_H */

--=20
Jani Nikula, Intel
