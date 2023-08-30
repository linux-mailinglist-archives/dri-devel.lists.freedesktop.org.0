Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E579978D5B4
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 13:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DD610E502;
	Wed, 30 Aug 2023 11:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A306810E502;
 Wed, 30 Aug 2023 11:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693396344; x=1724932344;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=azYBaBtXmMdjcaRlWXhnidz0WgPSb12kLE0y9XifOm8=;
 b=BeY0s1QE4UI743I/Rj0pSEpObR6rNLmW8W4tUP4jKWZIGmLTr1o3xYXa
 PXYZOGuz9AqMYS+vr3F5D06jMeoBqNyaMb+RuYeZFC0hL6QTlOy32EQ7G
 2b71EFTKq5GsTC0PlgaHwY4lWSk1JkENS7LG4bjBP5okLbtJfJoDmV+51
 9HwK7cYl17elkqKEeMQLk4Cj9DVTPXbuBdmKuvfVm4kKsqdGBgEO/+kDa
 vzT2J7th4HyhD5Fcpi5U+aEXMmHxTIdFA2xIT9qp/usOG9fHzIjqY5SoP
 HxscSvwLgzMT3rMemQgliCrwXlHyw6MkAke/n+MuroySjzOKJ/zWW4mGK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="365826815"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="365826815"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 04:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="985713025"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="985713025"
Received: from ziemtocx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.251])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 04:52:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 01/12] drm: Reorder
 drm_sysfs_connector_remove() vs. drm_debugfs_connector_remove()
In-Reply-To: <20230829113920.13713-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
 <20230829113920.13713-2-ville.syrjala@linux.intel.com>
Date: Wed, 30 Aug 2023 14:52:19 +0300
Message-ID: <875y4w21e4.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Aug 2023, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Use the standard onion peeling approach and call
> drm_debugfs_connector_remove() and
> drm_sysfs_connector_remove() in the reverse order in
> drm_connector_unregister() than what we called their
> add counterpartse in drm_connector_register().
>
> The error unwiding in drm_connector_register() is
> already doing this the correct way around.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_connector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index c44d5bcf1284..988996cf6da5 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -684,8 +684,8 @@ void drm_connector_unregister(struct drm_connector *c=
onnector)
>  	if (connector->funcs->early_unregister)
>  		connector->funcs->early_unregister(connector);
>=20=20
> -	drm_sysfs_connector_remove(connector);
>  	drm_debugfs_connector_remove(connector);
> +	drm_sysfs_connector_remove(connector);
>=20=20
>  	connector->registration_state =3D DRM_CONNECTOR_UNREGISTERED;
>  	mutex_unlock(&connector->mutex);

--=20
Jani Nikula, Intel Open Source Graphics Center
