Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D2071075A
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 10:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E6B10E7ED;
	Thu, 25 May 2023 08:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F0710E7ED
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 08:31:59 +0000 (UTC)
Received: from 91-155-254-196.elisa-laajakaista.fi ([91.155.254.196]
 helo=[192.168.100.137])
 by farmhouse.coelho.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <luca@coelho.fi>) id 1q25th-008cGu-T9;
 Thu, 25 May 2023 11:00:35 +0300
Message-ID: <932e123be78bfe5b656c46d779c8dd92dea1078c.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org
Date: Thu, 25 May 2023 11:00:33 +0300
In-Reply-To: <20230502143906.2401-5-ville.syrjala@linux.intel.com>
References: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
 <20230502143906.2401-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on farmhouse.coelho.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 TVD_RCVD_IP autolearn=ham autolearn_force=no version=3.4.6
Subject: Re: [Intel-gfx] [PATCH 04/11] drm/i915: Fix FEC pipe A vs. DDI A mixup
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2023-05-02 at 17:38 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> On pre-TGL FEC is a port level feature, not a transcoder
> level features, and it's DDI A which doesn't have it, not
> trancodere A.

A couple of typos: "level feature" and "transcoder A".


>  Check for the correct thing when determining
> whether FEC is supported or not.
>=20
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 4361c1ac65c3..b27b4fb71ed7 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1212,13 +1212,13 @@ void intel_dp_compute_rate(struct intel_dp *intel=
_dp, int port_clock,
>  static bool intel_dp_source_supports_fec(struct intel_dp *intel_dp,
>  					 const struct intel_crtc_state *pipe_config)
>  {
> +	struct intel_encoder *encoder =3D &dp_to_dig_port(intel_dp)->base;
>  	struct drm_i915_private *dev_priv =3D dp_to_i915(intel_dp);
> =20
> -	/* On TGL, FEC is supported on all Pipes */
>  	if (DISPLAY_VER(dev_priv) >=3D 12)
>  		return true;
> =20
> -	if (DISPLAY_VER(dev_priv) =3D=3D 11 && pipe_config->cpu_transcoder !=3D=
 TRANSCODER_A)
> +	if (DISPLAY_VER(dev_priv) =3D=3D 11 && encoder->port !=3D PORT_A)
>  		return true;
> =20
>  	return false;

Other than that, looks good:

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
