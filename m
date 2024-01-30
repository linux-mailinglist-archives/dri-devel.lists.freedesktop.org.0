Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0309B8421A6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8508310F88A;
	Tue, 30 Jan 2024 10:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFCD10F88A;
 Tue, 30 Jan 2024 10:41:20 +0000 (UTC)
Received: from 91-155-255-116.elisa-laajakaista.fi ([91.155.255.116]
 helo=RAVPPB-CIM.amr.corp.intel.com)
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1rUl2k-00000001XyY-3P6z; Tue, 30 Jan 2024 12:08:40 +0200
Message-ID: <a9f84affb01d06a826086cf6d515c913ab8fd872.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Date: Tue, 30 Jan 2024 12:08:37 +0200
In-Reply-To: <2a9cdcfc1df44568078f7c131e2e7e0f7c94e97e.1705410327.git.jani.nikula@intel.com>
References: <cover.1705410327.git.jani.nikula@intel.com>
 <2a9cdcfc1df44568078f7c131e2e7e0f7c94e97e.1705410327.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on farmhouse.coelho.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 TVD_RCVD_IP autolearn=ham autolearn_force=no version=4.0.0
Subject: Re: [PATCH 01/10] drm/print: make drm_err_printer() device specific
 by using drm_err()
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
> With few users for drm_err_printer(), it's still feasible to convert it
> to be device specific. Use drm_err() under the hood.
>=20
> While at it, make the prefix optional.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_print.c                         |  7 ++++++-
>  drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c |  4 ++--
>  drivers/gpu/drm/i915/selftests/i915_active.c        |  4 ++--
>  include/drm/drm_print.h                             | 11 ++++++++---
>  4 files changed, 18 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index 5b93c11895bb..91dbcdeaad3f 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -191,7 +191,12 @@ EXPORT_SYMBOL(__drm_printfn_debug);
> =20
>  void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf)
>  {
> -	pr_err("*ERROR* %s %pV", p->prefix, vaf);
> +	struct drm_device *drm =3D p->arg;
> +
> +	if (p->prefix)
> +		drm_err(drm, "%s %pV", p->prefix, vaf);
> +	else
> +		drm_err(drm, "%pV", vaf);
>  }
>  EXPORT_SYMBOL(__drm_printfn_err);
> =20
> diff --git a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c b/driver=
s/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> index bc441ce7b380..be827318275c 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_engine_heartbeat.c
> @@ -122,7 +122,7 @@ static int __live_idle_pulse(struct intel_engine_cs *=
engine,
>  	GEM_BUG_ON(!llist_empty(&engine->barrier_tasks));
> =20
>  	if (engine_sync_barrier(engine)) {
> -		struct drm_printer m =3D drm_err_printer("pulse");
> +		struct drm_printer m =3D drm_err_printer(&engine->i915->drm, "pulse");
> =20
>  		pr_err("%s: no heartbeat pulse?\n", engine->name);
>  		intel_engine_dump(engine, &m, "%s", engine->name);
> @@ -136,7 +136,7 @@ static int __live_idle_pulse(struct intel_engine_cs *=
engine,
>  	pulse_unlock_wait(p); /* synchronize with the retirement callback */
> =20
>  	if (!i915_active_is_idle(&p->active)) {
> -		struct drm_printer m =3D drm_err_printer("pulse");
> +		struct drm_printer m =3D drm_err_printer(&engine->i915->drm, "pulse");
> =20
>  		pr_err("%s: heartbeat pulse did not flush idle tasks\n",
>  		       engine->name);
> diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/d=
rm/i915/selftests/i915_active.c
> index b61fe850e924..8886752ade63 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_active.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_active.c
> @@ -156,7 +156,7 @@ static int live_active_wait(void *arg)
> =20
>  	__i915_active_wait(&active->base, TASK_UNINTERRUPTIBLE);
>  	if (!READ_ONCE(active->retired)) {
> -		struct drm_printer p =3D drm_err_printer(__func__);
> +		struct drm_printer p =3D drm_err_printer(&i915->drm, __func__);
> =20
>  		pr_err("i915_active not retired after waiting!\n");
>  		i915_active_print(&active->base, &p);
> @@ -189,7 +189,7 @@ static int live_active_retire(void *arg)
>  		err =3D -EIO;
> =20
>  	if (!READ_ONCE(active->retired)) {
> -		struct drm_printer p =3D drm_err_printer(__func__);
> +		struct drm_printer p =3D drm_err_printer(&i915->drm, __func__);
> =20
>  		pr_err("i915_active not retired after flushing!\n");
>  		i915_active_print(&active->base, &p);
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 5ed26a702e3e..1040213d02a4 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -35,6 +35,8 @@
> =20
>  #include <drm/drm.h>
> =20
> +struct drm_device;
> +
>  /* Do *not* use outside of drm_print.[ch]! */
>  extern unsigned long __drm_debug;
> =20
> @@ -235,16 +237,19 @@ static inline struct drm_printer drm_debug_printer(=
const char *prefix)
>  }
> =20
>  /**
> - * drm_err_printer - construct a &drm_printer that outputs to pr_err()
> - * @prefix: debug output prefix
> + * drm_err_printer - construct a &drm_printer that outputs to drm_err()
> + * @drm: the &struct drm_device pointer
> + * @prefix: debug output prefix, or NULL for no prefix
>   *
>   * RETURNS:
>   * The &drm_printer object
>   */
> -static inline struct drm_printer drm_err_printer(const char *prefix)
> +static inline struct drm_printer drm_err_printer(struct drm_device *drm,
> +						 const char *prefix)
>  {
>  	struct drm_printer p =3D {
>  		.printfn =3D __drm_printfn_err,
> +		.arg =3D drm,
>  		.prefix =3D prefix
>  	};
>  	return p;

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
