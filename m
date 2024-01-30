Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C8E84213C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7D7112EBC;
	Tue, 30 Jan 2024 10:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67F010FB6F;
 Tue, 30 Jan 2024 10:27:58 +0000 (UTC)
Received: from 91-155-255-116.elisa-laajakaista.fi ([91.155.255.116]
 helo=RAVPPB-CIM.amr.corp.intel.com)
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1rUlLQ-00000001Y14-1jcl; Tue, 30 Jan 2024 12:27:56 +0200
Message-ID: <fb2251a91b54f29229a08c759ef8c6a093289873.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Date: Tue, 30 Jan 2024 12:27:55 +0200
In-Reply-To: <f2614dfcba295be20c650cdab24c3979d265f422.1705410327.git.jani.nikula@intel.com>
References: <cover.1705410327.git.jani.nikula@intel.com>
 <f2614dfcba295be20c650cdab24c3979d265f422.1705410327.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on farmhouse.coelho.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 TVD_RCVD_IP autolearn=ham autolearn_force=no version=4.0.0
Subject: Re: [PATCH 07/10] drm/i915: switch from drm_debug_printer() to
 device specific drm_dbg_printer()
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
> Prefer the device specific debug printer.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_driver.c | 3 ++-
>  drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c    | 3 ++-
>  drivers/gpu/drm/i915/gt/intel_reset.c               | 3 ++-
>  drivers/gpu/drm/i915/gt/intel_workarounds.c         | 3 ++-
>  drivers/gpu/drm/i915/gt/selftest_context.c          | 3 ++-
>  drivers/gpu/drm/i915/i915_driver.c                  | 3 ++-
>  6 files changed, 12 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/driver=
s/gpu/drm/i915/display/intel_display_driver.c
> index ecf9cb74734b..e733f7c4c6c6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> @@ -518,7 +518,8 @@ int intel_display_driver_probe(struct drm_i915_privat=
e *i915)
> =20
>  void intel_display_driver_register(struct drm_i915_private *i915)
>  {
> -	struct drm_printer p =3D drm_debug_printer("i915 display info:");
> +	struct drm_printer p =3D drm_dbg_printer(&i915->drm, DRM_UT_KMS,
> +					       "i915 display info:");
> =20
>  	if (!HAS_DISPLAY(i915))
>  		return;
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/g=
pu/drm/i915/gt/intel_engine_heartbeat.c
> index 1a8e2b7db013..0f6406f0cca0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> @@ -96,7 +96,8 @@ static void heartbeat_commit(struct i915_request *rq,
>  static void show_heartbeat(const struct i915_request *rq,
>  			   struct intel_engine_cs *engine)
>  {
> -	struct drm_printer p =3D drm_debug_printer("heartbeat");
> +	struct drm_printer p =3D drm_dbg_printer(&rq->i915->drm, DRM_UT_DRIVER,
> +					       "heartbeat");
> =20
>  	if (!rq) {
>  		intel_engine_dump(engine, &p,
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915=
/gt/intel_reset.c
> index 6801f8b95c53..c8e9aa41fdea 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1015,7 +1015,8 @@ void intel_gt_set_wedged(struct intel_gt *gt)
>  	mutex_lock(&gt->reset.mutex);
> =20
>  	if (GEM_SHOW_DEBUG()) {
> -		struct drm_printer p =3D drm_debug_printer(__func__);
> +		struct drm_printer p =3D drm_dbg_printer(&gt->i915->drm,
> +						       DRM_UT_DRIVER, __func__);
>  		struct intel_engine_cs *engine;
>  		enum intel_engine_id id;
> =20
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/dr=
m/i915/gt/intel_workarounds.c
> index 270b56fc85e2..e6f48aa967c2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1236,7 +1236,8 @@ static void __set_mcr_steering(struct i915_wa_list =
*wal,
> =20
>  static void debug_dump_steering(struct intel_gt *gt)
>  {
> -	struct drm_printer p =3D drm_debug_printer("MCR Steering:");
> +	struct drm_printer p =3D drm_dbg_printer(&gt->i915->drm, DRM_UT_DRIVER,
> +					       "MCR Steering:");
> =20
>  	if (drm_debug_enabled(DRM_UT_DRIVER))
>  		intel_gt_mcr_report_steering(&p, gt, false);
> diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm=
/i915/gt/selftest_context.c
> index 47070cba7eb1..12eca750f7d0 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_context.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_context.c
> @@ -285,7 +285,8 @@ static int __live_active_context(struct intel_engine_=
cs *engine)
>  	intel_engine_pm_flush(engine);
> =20
>  	if (intel_engine_pm_is_awake(engine)) {
> -		struct drm_printer p =3D drm_debug_printer(__func__);
> +		struct drm_printer p =3D drm_dbg_printer(&engine->i915->drm,
> +						       DRM_UT_DRIVER, __func__);
> =20
>  		intel_engine_dump(engine, &p,
>  				  "%s is still awake:%d after idle-barriers\n",
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i9=
15_driver.c
> index a951050f6a75..9ee902d5b72c 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -681,7 +681,8 @@ i915_print_iommu_status(struct drm_i915_private *i915=
, struct drm_printer *p)
>  static void i915_welcome_messages(struct drm_i915_private *dev_priv)
>  {
>  	if (drm_debug_enabled(DRM_UT_DRIVER)) {
> -		struct drm_printer p =3D drm_debug_printer("i915 device info:");
> +		struct drm_printer p =3D drm_dbg_printer(&dev_priv->drm, DRM_UT_DRIVER=
,
> +						       "device info:");
>  		struct intel_gt *gt;
>  		unsigned int i;
> =20

Okay, this are all pretty much the same pattern, so I should have given
a single r-b for the whole series, but now I have only a few left,
so...

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
