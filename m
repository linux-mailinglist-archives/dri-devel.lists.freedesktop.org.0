Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2467A1D3AEC
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 21:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8436EBA8;
	Thu, 14 May 2020 19:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3B96EBAB;
 Thu, 14 May 2020 19:01:50 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 5D48A8053A;
 Thu, 14 May 2020 21:01:48 +0200 (CEST)
Date: Thu, 14 May 2020 21:01:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2] drm/dp: Include the AUX CH name in the debug messages
Message-ID: <20200514190146.GA277929@ravnborg.org>
References: <20200514184040.20700-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514184040.20700-1-ville.syrjala@linux.intel.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=QyXUC8HyAAAA:8 a=7gkXJVJtAAAA:8
 a=6kA8yK9TrNV1GUk-dt4A:9 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville.

On Thu, May 14, 2020 at 09:40:40PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> To make it easier to figure out what caused a particular debug
> message let's print out aux->name.
> =

> v2: Convert drm_dp_send_real_edid_checksum() too
> =

> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
> IIRC Sam suggested that I switch to per-device logging functions at the
> same time.
I could imagine I did.

> Sadly that's going to require some amount of actual work:
> For i915/amdgpu/nouveau/etc. aux->dev is connector->kdev instead of the
> pdev->dev we want, which we could handle by walking up the tree several
> levels. However it looks like some of the armish drivers stick pdev->dev
> directly into aux->dev so there we don't want to walk up the tree. This
> means either one set of drivers will need to change their aux->dev
> assignment approach, or we're going to need another device pointer in
> there. I didn't even want to look what the bridge drivers put there.
> In the meantime I refreshed the original patch which at least lets
> us see aux->name...

Thanks for the detailed explanation.
Patch is:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> =

>  drivers/gpu/drm/drm_dp_helper.c | 67 ++++++++++++++++++---------------
>  1 file changed, 37 insertions(+), 30 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_hel=
per.c
> index 43e57632b00a..743ead068a43 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -257,7 +257,8 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux,=
 u8 request,
>  			err =3D ret;
>  	}
>  =

> -	DRM_DEBUG_KMS("Too many retries, giving up. First error: %d\n", err);
> +	DRM_DEBUG_KMS("%s: Too many retries, giving up. First error: %d\n",
> +		      aux->name, err);
>  	ret =3D err;
>  =

>  unlock:
> @@ -376,43 +377,44 @@ bool drm_dp_send_real_edid_checksum(struct drm_dp_a=
ux *aux,
>  =

>  	if (drm_dp_dpcd_read(aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
>  			     &auto_test_req, 1) < 1) {
> -		DRM_ERROR("DPCD failed read at register 0x%x\n",
> -			  DP_DEVICE_SERVICE_IRQ_VECTOR);
> +		DRM_ERROR("%s: DPCD failed read at register 0x%x\n",
> +			  aux->name, DP_DEVICE_SERVICE_IRQ_VECTOR);
>  		return false;
>  	}
>  	auto_test_req &=3D DP_AUTOMATED_TEST_REQUEST;
>  =

>  	if (drm_dp_dpcd_read(aux, DP_TEST_REQUEST, &link_edid_read, 1) < 1) {
> -		DRM_ERROR("DPCD failed read at register 0x%x\n",
> -			  DP_TEST_REQUEST);
> +		DRM_ERROR("%s: DPCD failed read at register 0x%x\n",
> +			  aux->name, DP_TEST_REQUEST);
>  		return false;
>  	}
>  	link_edid_read &=3D DP_TEST_LINK_EDID_READ;
>  =

>  	if (!auto_test_req || !link_edid_read) {
> -		DRM_DEBUG_KMS("Source DUT does not support TEST_EDID_READ\n");
> +		DRM_DEBUG_KMS("%s: Source DUT does not support TEST_EDID_READ\n",
> +			      aux->name);
>  		return false;
>  	}
>  =

>  	if (drm_dp_dpcd_write(aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
>  			      &auto_test_req, 1) < 1) {
> -		DRM_ERROR("DPCD failed write at register 0x%x\n",
> -			  DP_DEVICE_SERVICE_IRQ_VECTOR);
> +		DRM_ERROR("%s: DPCD failed write at register 0x%x\n",
> +			  aux->name, DP_DEVICE_SERVICE_IRQ_VECTOR);
>  		return false;
>  	}
>  =

>  	/* send back checksum for the last edid extension block data */
>  	if (drm_dp_dpcd_write(aux, DP_TEST_EDID_CHECKSUM,
>  			      &real_edid_checksum, 1) < 1) {
> -		DRM_ERROR("DPCD failed write at register 0x%x\n",
> -			  DP_TEST_EDID_CHECKSUM);
> +		DRM_ERROR("%s: DPCD failed write at register 0x%x\n",
> +			  aux->name, DP_TEST_EDID_CHECKSUM);
>  		return false;
>  	}
>  =

>  	test_resp |=3D DP_TEST_EDID_CHECKSUM_WRITE;
>  	if (drm_dp_dpcd_write(aux, DP_TEST_RESPONSE, &test_resp, 1) < 1) {
> -		DRM_ERROR("DPCD failed write at register 0x%x\n",
> -			  DP_TEST_RESPONSE);
> +		DRM_ERROR("%s: DPCD failed write at register 0x%x\n",
> +			  aux->name, DP_TEST_RESPONSE);
>  		return false;
>  	}
>  =

> @@ -737,10 +739,11 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux=
, struct drm_dp_aux_msg *msg)
>  			 * Avoid spamming the kernel log with timeout errors.
>  			 */
>  			if (ret =3D=3D -ETIMEDOUT)
> -				DRM_DEBUG_KMS_RATELIMITED("transaction timed out\n");
> +				DRM_DEBUG_KMS_RATELIMITED("%s: transaction timed out\n",
> +							  aux->name);
>  			else
> -				DRM_DEBUG_KMS("transaction failed: %d\n", ret);
> -
> +				DRM_DEBUG_KMS("%s: transaction failed: %d\n",
> +					      aux->name, ret);
>  			return ret;
>  		}
>  =

> @@ -754,11 +757,12 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux=
, struct drm_dp_aux_msg *msg)
>  			break;
>  =

>  		case DP_AUX_NATIVE_REPLY_NACK:
> -			DRM_DEBUG_KMS("native nack (result=3D%d, size=3D%zu)\n", ret, msg->si=
ze);
> +			DRM_DEBUG_KMS("%s: native nack (result=3D%d, size=3D%zu)\n",
> +				      aux->name, ret, msg->size);
>  			return -EREMOTEIO;
>  =

>  		case DP_AUX_NATIVE_REPLY_DEFER:
> -			DRM_DEBUG_KMS("native defer\n");
> +			DRM_DEBUG_KMS("%s: native defer\n", aux->name);
>  			/*
>  			 * We could check for I2C bit rate capabilities and if
>  			 * available adjust this interval. We could also be
> @@ -772,7 +776,8 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux, =
struct drm_dp_aux_msg *msg)
>  			continue;
>  =

>  		default:
> -			DRM_ERROR("invalid native reply %#04x\n", msg->reply);
> +			DRM_ERROR("%s: invalid native reply %#04x\n",
> +				  aux->name, msg->reply);
>  			return -EREMOTEIO;
>  		}
>  =

> @@ -787,13 +792,13 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux=
, struct drm_dp_aux_msg *msg)
>  			return ret;
>  =

>  		case DP_AUX_I2C_REPLY_NACK:
> -			DRM_DEBUG_KMS("I2C nack (result=3D%d, size=3D%zu)\n",
> -				      ret, msg->size);
> +			DRM_DEBUG_KMS("%s: I2C nack (result=3D%d, size=3D%zu)\n",
> +				      aux->name, ret, msg->size);
>  			aux->i2c_nack_count++;
>  			return -EREMOTEIO;
>  =

>  		case DP_AUX_I2C_REPLY_DEFER:
> -			DRM_DEBUG_KMS("I2C defer\n");
> +			DRM_DEBUG_KMS("%s: I2C defer\n", aux->name);
>  			/* DP Compliance Test 4.2.2.5 Requirement:
>  			 * Must have at least 7 retries for I2C defers on the
>  			 * transaction to pass this test
> @@ -807,12 +812,13 @@ static int drm_dp_i2c_do_msg(struct drm_dp_aux *aux=
, struct drm_dp_aux_msg *msg)
>  			continue;
>  =

>  		default:
> -			DRM_ERROR("invalid I2C reply %#04x\n", msg->reply);
> +			DRM_ERROR("%s: invalid I2C reply %#04x\n",
> +				  aux->name, msg->reply);
>  			return -EREMOTEIO;
>  		}
>  	}
>  =

> -	DRM_DEBUG_KMS("too many retries, giving up\n");
> +	DRM_DEBUG_KMS("%s: Too many retries, giving up\n", aux->name);
>  	return -EREMOTEIO;
>  }
>  =

> @@ -841,8 +847,8 @@ static int drm_dp_i2c_drain_msg(struct drm_dp_aux *au=
x, struct drm_dp_aux_msg *o
>  			return err =3D=3D 0 ? -EPROTO : err;
>  =

>  		if (err < msg.size && err < ret) {
> -			DRM_DEBUG_KMS("Partial I2C reply: requested %zu bytes got %d bytes\n",
> -				      msg.size, err);
> +			DRM_DEBUG_KMS("%s: Partial I2C reply: requested %zu bytes got %d byte=
s\n",
> +				      aux->name, msg.size, err);
>  			ret =3D err;
>  		}
>  =

> @@ -1021,11 +1027,12 @@ static void drm_dp_aux_crc_work(struct work_struc=
t *work)
>  		}
>  =

>  		if (ret =3D=3D -EAGAIN) {
> -			DRM_DEBUG_KMS("Get CRC failed after retrying: %d\n",
> -				      ret);
> +			DRM_DEBUG_KMS("%s: Get CRC failed after retrying: %d\n",
> +				      aux->name, ret);
>  			continue;
>  		} else if (ret) {
> -			DRM_DEBUG_KMS("Failed to get a CRC: %d\n", ret);
> +			DRM_DEBUG_KMS("%s: Failed to get a CRC: %d\n",
> +				      aux->name, ret);
>  			continue;
>  		}
>  =

> @@ -1387,8 +1394,8 @@ int drm_dp_read_desc(struct drm_dp_aux *aux, struct=
 drm_dp_desc *desc,
>  =

>  	dev_id_len =3D strnlen(ident->device_id, sizeof(ident->device_id));
>  =

> -	DRM_DEBUG_KMS("DP %s: OUI %*phD dev-ID %*pE HW-rev %d.%d SW-rev %d.%d q=
uirks 0x%04x\n",
> -		      is_branch ? "branch" : "sink",
> +	DRM_DEBUG_KMS("%s: DP %s: OUI %*phD dev-ID %*pE HW-rev %d.%d SW-rev %d.=
%d quirks 0x%04x\n",
> +		      aux->name, is_branch ? "branch" : "sink",
>  		      (int)sizeof(ident->oui), ident->oui,
>  		      dev_id_len, ident->device_id,
>  		      ident->hw_rev >> 4, ident->hw_rev & 0xf,
> -- =

> 2.26.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
