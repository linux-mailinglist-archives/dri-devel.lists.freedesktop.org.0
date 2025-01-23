Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE697A1A7BB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 17:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DA710E876;
	Thu, 23 Jan 2025 16:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vYvPSUAw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2EC10E876
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 16:20:40 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3299E1189;
 Thu, 23 Jan 2025 17:19:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1737649175;
 bh=b++psFFn/rY5Dao2k1BfJsVMxThYoR4AEpwAfFmUKZQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vYvPSUAwKqOtyxNprbgLVvN5XhjOlsH4vEOQeXu/BTpMIglH7FMmKQbC5+YkVG1L6
 u1GG9JChRLIkz/vbDUoFLXabZkNtdMjJQpWDw+FUkSL+acOXDi0bM2F9zIacIbB9jx
 iVMmmJpiKynxDpPiaCOPiyjEVeDv1WtdybcHRf0M=
Message-ID: <e76f94b9-b138-46e7-bb18-b33dd98c9abb@ideasonboard.com>
Date: Thu, 23 Jan 2025 18:20:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm: bridge: cdns-mhdp8546: Fix possible null pointer
 dereference
To: Jayesh Choudhary <j-choudhary@ti.com>, dri-devel@lists.freedesktop.org,
 sjakhade@cadence.com, jsarha@ti.com, mripard@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: amishin@t-argos.ru, jani.nikula@intel.com, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org, devarsht@ti.com
References: <20250116111636.157641-1-j-choudhary@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <20250116111636.157641-1-j-choudhary@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 16/01/2025 13:16, Jayesh Choudhary wrote:
> For the cases we have DRM_BRIDGE_ATTACH_NO_CONNECTOR flag set,

Any idea if any other platform than K3 is using this driver? tidss 
supports DRM_BRIDGE_ATTACH_NO_CONNECTOR, so if K3 is the only user, we 
could drop the legacy !DRM_BRIDGE_ATTACH_NO_CONNECTOR case. Which would 
remove quite a bit of code, I think, and make the driver a bit more easy 
to understand (although I think it could use a major cleanup...).

> the connector structure is not initialised in the bridge. That's done
> by encoder. So in case of some failure in cdns_mhdp_atomic_enable,
> when we schedule work for modeset_retry_work, we will use the mutex
> of connector which will result in NULL pointer dereference.
> Handle it by adding condition for the connector. Otherwise, since
> the modeset_retry_work tries to set the connector status as bad,
> set the mhdp->plugged as false which would give the connector
> status as disconnected in detect hook.

I'm not quite sure if this whole system makes sense (no one else is 
doing it), but I think you can find the connector from the current 
state. Then setting the property could be done for 
DRM_BRIDGE_ATTACH_NO_CONNECTOR case too.

  Tomi

> Fixes: fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridge")
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
> 
> NOTE: Found this issue in one particular board where edid read failed.
> Issue log: <https://gist.github.com/Jayesh2000/233f87f9becdf1e66f1da6fd53f77429>
> 
> Adding conditional fixes the null pointer issue but there is still
> flooding of these logs (128 times):
> "cdns-mhdp8546 a000000.bridge: Failed to read DPCD addr 0"
> 
> Sending RFC as I am still not sure about how to handle this flooding.
> Is it okay to decrease the log level for DPCD read and DPCD write in
> the cdns_mhdp_transfer to debug?
> 
>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 24 ++++++++++---------
>   1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index d081850e3c03..6a121a2700d2 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2363,18 +2363,20 @@ static void cdns_mhdp_modeset_retry_fn(struct work_struct *work)
>   
>   	mhdp = container_of(work, typeof(*mhdp), modeset_retry_work);
>   
> -	conn = &mhdp->connector;
> -
> -	/* Grab the locks before changing connector property */
> -	mutex_lock(&conn->dev->mode_config.mutex);
> -
> -	/*
> -	 * Set connector link status to BAD and send a Uevent to notify
> -	 * userspace to do a modeset.
> -	 */
> -	drm_connector_set_link_status_property(conn, DRM_MODE_LINK_STATUS_BAD);
> -	mutex_unlock(&conn->dev->mode_config.mutex);
> +	if (mhdp->connector.dev) {
> +		conn = &mhdp->connector;
> +		/* Grab the locks before changing connector property */
> +		mutex_lock(&conn->dev->mode_config.mutex);
>   
> +		/*
> +		 * Set connector link status to BAD and send a Uevent to notify
> +		 * userspace to do a modeset.
> +		 */
> +		drm_connector_set_link_status_property(conn, DRM_MODE_LINK_STATUS_BAD);
> +		mutex_unlock(&conn->dev->mode_config.mutex);
> +	} else {
> +		mhdp->plugged = false;
> +	}
>   	/* Send Hotplug uevent so userspace can reprobe */
>   	drm_kms_helper_hotplug_event(mhdp->bridge.dev);
>   }

