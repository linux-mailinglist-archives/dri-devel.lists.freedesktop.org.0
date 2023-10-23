Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 047DF7D34D6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 13:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39E010E137;
	Mon, 23 Oct 2023 11:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC6D10E137
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 11:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698061385; x=1729597385;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=naMve0NtYrZVuHqK6fpiTmU0a5b61Mp5wefHU8KFuO8=;
 b=k+RSkgrgQwc9C3zWXUmddjUjHjd4Cqrdzy5SZK69FoX8ajXwBI6lRbY1
 UF+/QHEC6JARcIs2EV7M+K4lMT/PzDYKPvCnzMdrgBEUqN/lOj28uZ6QD
 nb98zu6qvz8mgbxPNG82X2weggGJYJrzGQlHWBiOATcxUtTCqCLhqxNZN
 qFww62Nl6pFQbP1pILrcpsj8C65XDgQ+MOeTFyX2OyVuYsqIO9JpF+384
 0c5H2TxAUkacmMq5REVYHLHM8CW7DnN9uas+UKmRH2IKiOuRDNFho7EnZ
 ZDxjlNj9xOfThYOXMi4LubfuL4oa5N06D7ZlU4/sxisgZ765y8AI3TbVw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="390708451"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="390708451"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 04:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="1089468449"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="1089468449"
Received: from evlad-mobl.ger.corp.intel.com (HELO localhost) ([10.252.47.180])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 04:42:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>, Andrzej Hajda
 <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: bridge: adv7511: get edid in hpd_work to update
 CEC phys address
In-Reply-To: <20231014-adv7511-cec-edid-v1-1-a58ceae0b57e@bang-olufsen.dk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231014-adv7511-cec-edid-v1-1-a58ceae0b57e@bang-olufsen.dk>
Date: Mon, 23 Oct 2023 14:42:56 +0300
Message-ID: <87pm15bm4f.fsf@intel.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 14 Oct 2023, Alvin =C5=A0ipraga <alvin@pqrs.dk> wrote:
> From: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
>
> The adv7511 driver is solely responsible for setting the physical
> address of its CEC adapter. To do this, it must read the EDID. However,
> EDID is only read when either the drm_bridge_funcs :: get_edid or
> drm_connector_helper_funcs :: get_modes ops are called. Without loss of
> generality, it cannot be assumed that these ops are called when a sink
> gets attached. Therefore there exist scenarios in which the CEC physical
> address will be invalid (f.f.f.f), rendering the CEC adapter inoperable.
>
> Address this problem by always fetching the EDID in the HPD work when we
> detect a connection. The CEC physical address is set in the process.
>
> Signed-off-by: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
> ---
> Pardon the insertion of the ugly adv7511_get_edid() prototype, but I did
> not want to clobber git history by rearranging a bunch of functions. If
> this is the preferred approach I will happily re-spin the patch.
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 2611afd2c1c1..3d32c109963c 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -424,6 +424,9 @@ static bool adv7511_hpd(struct adv7511 *adv7511)
>  	return false;
>  }
>=20=20
> +static struct edid *adv7511_get_edid(struct adv7511 *adv7511,
> +				     struct drm_connector *connector);
> +
>  static void adv7511_hpd_work(struct work_struct *work)
>  {
>  	struct adv7511 *adv7511 =3D container_of(work, struct adv7511, hpd_work=
);
> @@ -457,6 +460,9 @@ static void adv7511_hpd_work(struct work_struct *work)
>  		if (adv7511->connector.dev) {
>  			if (status =3D=3D connector_status_disconnected)
>  				cec_phys_addr_invalidate(adv7511->cec_adap);
> +			else
> +				adv7511_get_edid(adv7511, &adv7511->connector);

This leaks the returned EDID.

BR,
Jani.

> +
>  			drm_kms_helper_hotplug_event(adv7511->connector.dev);
>  		} else {
>  			drm_bridge_hpd_notify(&adv7511->bridge, status);
>
> ---
> base-commit: 4366faf43308bd91c59a20c43a9f853a9c3bb6e4
> change-id: 20231014-adv7511-cec-edid-ff75bd3ac929
>

--=20
Jani Nikula, Intel
