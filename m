Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5522716667C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 19:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF2D6E21C;
	Thu, 20 Feb 2020 18:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F87E6E21C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 18:42:36 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id F22EF80A60;
 Thu, 20 Feb 2020 19:42:31 +0100 (CET)
Date: Thu, 20 Feb 2020 19:42:30 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/4] drm/simple-kms: Add drm_simple_encoder_{init,
 create}()
Message-ID: <20200220184230.GA18993@ravnborg.org>
References: <20200218084815.2137-1-tzimmermann@suse.de>
 <20200218084815.2137-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218084815.2137-2-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10
 a=cNTKbyX6Oi9ivAK1HFkA:9 a=wPNLvfGTeEIA:10
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kraxel@redhat.com,
 alexander.deucher@amd.com, spice-devel@lists.freedesktop.org,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Tue, Feb 18, 2020 at 09:48:12AM +0100, Thomas Zimmermann wrote:
> This patch makes the internal encoder implementation of the simple
> KMS helpers available to drivers.
> =

> These simple-encoder helpers initialize an encoder with an empty
> implementation. This covers the requirements of most of the existing
> DRM drivers. A call to drm_simple_encoder_create() allocates and
> initializes an encoder instance, a call to drm_simple_encoder_init()
> initializes a pre-allocated instance.
> =

> v2:
> 	* move simple encoder to KMS helpers
> 	* remove name argument; simplifies implementation
> 	* don't allocate with devm_ interfaces; unsafe with DRM
> =

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_simple_kms_helper.c | 83 ++++++++++++++++++++++++-
>  include/drm/drm_simple_kms_helper.h     |  7 +++
>  2 files changed, 87 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/dr=
m_simple_kms_helper.c
> index 15fb516ae2d8..745c2f34c42b 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -26,12 +26,90 @@
>   * entity. Some flexibility for code reuse is provided through a separat=
ely
>   * allocated &drm_connector object and supporting optional &drm_bridge
>   * encoder drivers.
> + *
> + * Many drivers use an encoder with an empty implementation. Such encode=
rs
> + * fulfill the minimum requirements of the display pipeline, but don't a=
dd
> + * additional functionality. The simple-encoder functions
> + * drm_simple_encoder_init() and drm_simple_encoder_create() provide an
> + * appropriate implementation.
This paragraph reads a bit strange to me - I read this as a
justification for addding a generic encoded that can be used by exisitg
drivers.

How about something like this:

Many drivers requires a very simple encoder that only fullfill
the minimum requirements of the display pipeline and do not add
any extra functionslity.
The simple-encoder functions drm_simple_encoder_init() and
drm_simple_encoder_create() provides an imp=E5lmentation of such
a simple encoder.
The simple encoder includes automatically release of resources.

And then leave it to the changelog to tell what should be done in
existing drivers.



>   */
>  =

> -static const struct drm_encoder_funcs drm_simple_kms_encoder_funcs =3D {
> +static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup =
=3D {
>  	.destroy =3D drm_encoder_cleanup,
>  };
>  =

> +/**
> + * drm_simple_encoder_init - Initialize a preallocated encoder
> + * @dev: drm device
> + * @funcs: callbacks for this encoder
> + * @encoder_type: user visible type of the encoder
> + *
> + * Initialises a preallocated encoder that has no further functionality.=
 The
> + * encoder will be released automatically. Settings for possible CRTC and
> + * clones are left to their initial values. The encoder will be cleaned =
up
> + * automatically as part of the mode-setting cleanup.
> + *
> + * Also see drm_simple_encoder_create().
s/Also see/See also/??


> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_simple_encoder_init(struct drm_device *dev,
> +			    struct drm_encoder *encoder,
> +			    int encoder_type)
> +{
> +	return drm_encoder_init(dev, encoder,
> +				&drm_simple_encoder_funcs_cleanup,
> +				encoder_type, NULL);
> +}
> +EXPORT_SYMBOL(drm_simple_encoder_init);
> +
> +static void drm_encoder_destroy(struct drm_encoder *encoder)
> +{
> +	drm_encoder_cleanup(encoder);
> +	kfree(encoder);
> +}
> +
> +static const struct drm_encoder_funcs drm_simple_encoder_funcs_destroy =
=3D {
> +	.destroy =3D drm_encoder_destroy,
> +};
> +
> +/**
> + * drm_simple_encoder_create - Allocate and initialize an encoder
> + * @dev: drm device
> + * @encoder_type: user visible type of the encoder
> + *
> + * Allocates and initialises an encoder that has no further functionalit=
y. The
> + * encoder will be destroyed automatically as part of the mode-setting c=
leanup.
> + *
> + * See drm_simple_encoder_init() for more information.
> + *
> + * Returns:
> + * The encoder on success, a pointer-encoder error code on failure.
                                pointer-encoded?



> + */
> +struct drm_encoder *drm_simple_encoder_create(struct drm_device *dev,
> +					      int encoder_type)
> +{
> +	struct drm_encoder *encoder;
> +	int ret;
> +
> +	encoder =3D kzalloc(sizeof(*encoder), GFP_KERNEL);
> +	if (!encoder)
> +		return ERR_PTR(-ENOMEM);
> +	ret =3D drm_encoder_init(dev, encoder,
> +			       &drm_simple_encoder_funcs_destroy,
> +			       encoder_type, NULL);
> +	if (ret)
> +		goto err_kfree;
> +
> +	return encoder;
> +
> +err_kfree:
> +	kfree(encoder);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL(drm_simple_encoder_create);
> +
>  static enum drm_mode_status
>  drm_simple_kms_crtc_mode_valid(struct drm_crtc *crtc,
>  			       const struct drm_display_mode *mode)
> @@ -288,8 +366,7 @@ int drm_simple_display_pipe_init(struct drm_device *d=
ev,
>  		return ret;
>  =

>  	encoder->possible_crtcs =3D drm_crtc_mask(crtc);
> -	ret =3D drm_encoder_init(dev, encoder, &drm_simple_kms_encoder_funcs,
> -			       DRM_MODE_ENCODER_NONE, NULL);
> +	ret =3D drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_NONE);
>  	if (ret || !connector)
>  		return ret;
>  =

> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple=
_kms_helper.h
> index e253ba7bea9d..54d5066d90c7 100644
> --- a/include/drm/drm_simple_kms_helper.h
> +++ b/include/drm/drm_simple_kms_helper.h
> @@ -181,4 +181,11 @@ int drm_simple_display_pipe_init(struct drm_device *=
dev,
>  			const uint64_t *format_modifiers,
>  			struct drm_connector *connector);
>  =

> +int drm_simple_encoder_init(struct drm_device *dev,
> +			    struct drm_encoder *encoder,
> +			    int encoder_type);
> +
> +struct drm_encoder *drm_simple_encoder_create(struct drm_device *dev,
> +					      int encoder_type);
> +
>  #endif /* __LINUX_DRM_SIMPLE_KMS_HELPER_H */

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
