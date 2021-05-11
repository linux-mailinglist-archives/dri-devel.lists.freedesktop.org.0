Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAED37A024
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 08:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0777E6E9D6;
	Tue, 11 May 2021 06:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C356E9D5;
 Tue, 11 May 2021 06:55:42 +0000 (UTC)
IronPort-SDR: SLVnqkir0b5kRoKObsqDPBdFQ88JTjgFvtGVG9NfcVCvoW4aPD59x2lxSUE869e7je6QgK0K5r
 n9Kjz7u4OX0g==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="199439949"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="199439949"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 23:55:41 -0700
IronPort-SDR: ctgxOA3SIyHB7zc7AqfRBbjNXGNL/FaP4Fxv+v47gg7D3EWWK/XMD4cPJNu40uczbmXoAWn/6R
 dUG7fdh81jgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536844425"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 10 May 2021 23:55:36 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 11 May 2021 09:55:36 +0300
Date: Tue, 11 May 2021 09:55:36 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 7/8] usb: typec: altmodes/displayport: Make
 dp_altmode_notify() more generic
Message-ID: <YJoqaKps8L5QNJoU@kuha.fi.intel.com>
References: <20210505162415.531876-1-hdegoede@redhat.com>
 <20210505162415.531876-8-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210505162415.531876-8-hdegoede@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 platform-driver-x86@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 05, 2021 at 06:24:14PM +0200, Hans de Goede wrote:
> Make dp_altmode_notify() handle the dp->data.conf == 0 case too,
> rather then having separate code-paths for this in various places
> which call it.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/altmodes/displayport.c | 35 +++++++++---------------
>  1 file changed, 13 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index b7f094435b00..aa669b9cf70e 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -66,10 +66,17 @@ struct dp_altmode {
>  
>  static int dp_altmode_notify(struct dp_altmode *dp)
>  {
> -	u8 state = get_count_order(DP_CONF_GET_PIN_ASSIGN(dp->data.conf));
> +	unsigned long conf;
> +	u8 state;
> +
> +	if (dp->data.conf) {
> +		state = get_count_order(DP_CONF_GET_PIN_ASSIGN(dp->data.conf));
> +		conf = TYPEC_MODAL_STATE(state);
> +	} else {
> +		conf = TYPEC_STATE_USB;
> +	}
>  
> -	return typec_altmode_notify(dp->alt, TYPEC_MODAL_STATE(state),
> -				   &dp->data);
> +	return typec_altmode_notify(dp->alt, conf, &dp->data);
>  }
>  
>  static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
> @@ -137,21 +144,10 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  
>  static int dp_altmode_configured(struct dp_altmode *dp)
>  {
> -	int ret;
> -
>  	sysfs_notify(&dp->alt->dev.kobj, "displayport", "configuration");
> -
> -	if (!dp->data.conf)
> -		return typec_altmode_notify(dp->alt, TYPEC_STATE_USB,
> -					    &dp->data);
> -
> -	ret = dp_altmode_notify(dp);
> -	if (ret)
> -		return ret;
> -
>  	sysfs_notify(&dp->alt->dev.kobj, "displayport", "pin_assignment");
>  
> -	return 0;
> +	return dp_altmode_notify(dp);
>  }
>  
>  static int dp_altmode_configure_vdm(struct dp_altmode *dp, u32 conf)
> @@ -172,13 +168,8 @@ static int dp_altmode_configure_vdm(struct dp_altmode *dp, u32 conf)
>  	}
>  
>  	ret = typec_altmode_vdm(dp->alt, header, &conf, 2);
> -	if (ret) {
> -		if (DP_CONF_GET_PIN_ASSIGN(dp->data.conf))
> -			dp_altmode_notify(dp);
> -		else
> -			typec_altmode_notify(dp->alt, TYPEC_STATE_USB,
> -					     &dp->data);
> -	}
> +	if (ret)
> +		dp_altmode_notify(dp);
>  
>  	return ret;
>  }
> -- 
> 2.31.1

-- 
heikki
