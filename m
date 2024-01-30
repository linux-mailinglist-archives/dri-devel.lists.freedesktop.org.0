Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABAE842165
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40577112F41;
	Tue, 30 Jan 2024 10:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF7E112F40;
 Tue, 30 Jan 2024 10:35:49 +0000 (UTC)
Received: from 91-155-255-116.elisa-laajakaista.fi ([91.155.255.116]
 helo=RAVPPB-CIM.amr.corp.intel.com)
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1rUlT1-00000001Y2C-0cGR; Tue, 30 Jan 2024 12:35:47 +0200
Message-ID: <6f9d5e5481fadb2eb452b0e3c0d3b598d9dc499b.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Date: Tue, 30 Jan 2024 12:35:46 +0200
In-Reply-To: <18b5b91e62d071675a651f6f91c58f05ad74134a.1705410327.git.jani.nikula@intel.com>
References: <cover.1705410327.git.jani.nikula@intel.com>
 <18b5b91e62d071675a651f6f91c58f05ad74134a.1705410327.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on farmhouse.coelho.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 TVD_RCVD_IP autolearn=ham autolearn_force=no version=4.0.0
Subject: Re: [PATCH 10/10] drm: remove drm_debug_printer in favor of
 drm_dbg_printer
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
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2024-01-16 at 15:07 +0200, Jani Nikula wrote:
> Convert the remaining drm_debug_printer users over to drm_dbg_printer,
> as it can handle the cases without struct drm_device pointer, and also
> provides drm debug category and prefix support. Remove drm_debug_printer
> altogether.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_modeset_lock.c |  2 +-
>  drivers/gpu/drm/drm_print.c        |  7 -------
>  drivers/gpu/drm/ttm/ttm_bo.c       |  2 +-
>  include/drm/drm_print.h            | 17 -----------------
>  4 files changed, 2 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_mod=
eset_lock.c
> index 918065982db4..7694b85e75e3 100644
> --- a/drivers/gpu/drm/drm_modeset_lock.c
> +++ b/drivers/gpu/drm/drm_modeset_lock.c
> @@ -91,7 +91,7 @@ static noinline depot_stack_handle_t __drm_stack_depot_=
save(void)
> =20
>  static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
>  {
> -	struct drm_printer p =3D drm_debug_printer("drm_modeset_lock");
> +	struct drm_printer p =3D drm_dbg_printer(NULL, DRM_UT_KMS, "drm_modeset=
_lock");
>  	unsigned long *entries;
>  	unsigned int nr_entries;
>  	char *buf;
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index 673b29c732ea..699b7dbffd7b 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -182,13 +182,6 @@ void __drm_printfn_info(struct drm_printer *p, struc=
t va_format *vaf)
>  }
>  EXPORT_SYMBOL(__drm_printfn_info);
> =20
> -void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf)
> -{
> -	/* pr_debug callsite decorations are unhelpful here */
> -	printk(KERN_DEBUG "%s %pV", p->prefix, vaf);
> -}
> -EXPORT_SYMBOL(__drm_printfn_debug);
> -
>  void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
>  {
>  	const struct drm_device *drm =3D p->arg;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index edf10618fe2b..30e1fe864826 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -49,7 +49,7 @@
>  static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
>  					struct ttm_placement *placement)
>  {
> -	struct drm_printer p =3D drm_debug_printer(TTM_PFX);
> +	struct drm_printer p =3D drm_dbg_printer(NULL, DRM_UT_CORE, TTM_PFX);
>  	struct ttm_resource_manager *man;
>  	int i, mem_type;
> =20
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 27e23c06dad4..9cc473e5d353 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -184,7 +184,6 @@ void __drm_puts_coredump(struct drm_printer *p, const=
 char *str);
>  void __drm_printfn_seq_file(struct drm_printer *p, struct va_format *vaf=
);
>  void __drm_puts_seq_file(struct drm_printer *p, const char *str);
>  void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf);
> -void __drm_printfn_debug(struct drm_printer *p, struct va_format *vaf);
>  void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf);
>  void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf);
> =20
> @@ -317,22 +316,6 @@ static inline struct drm_printer drm_info_printer(st=
ruct device *dev)
>  	return p;
>  }
> =20
> -/**
> - * drm_debug_printer - construct a &drm_printer that outputs to pr_debug=
()
> - * @prefix: debug output prefix
> - *
> - * RETURNS:
> - * The &drm_printer object
> - */
> -static inline struct drm_printer drm_debug_printer(const char *prefix)
> -{
> -	struct drm_printer p =3D {
> -		.printfn =3D __drm_printfn_debug,
> -		.prefix =3D prefix
> -	};
> -	return p;
> -}
> -
>  /**
>   * drm_dbg_printer - construct a &drm_printer for drm device specific ou=
tput
>   * @drm: the &struct drm_device pointer, or NULL

Why did you choose to make the last changes together with the patch
that removed the old version entirely? Was it because you didn't to
have any commit where the old version is defined but not used?

In any case, this is fine with me, so:

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
