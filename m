Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF79D11B4C5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 16:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEB56EB76;
	Wed, 11 Dec 2019 15:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366EC6EB76
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 15:50:04 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 07:50:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="207733219"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 11 Dec 2019 07:49:59 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 11 Dec 2019 17:49:59 +0200
Date: Wed, 11 Dec 2019 17:49:59 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Devarsh Thakkar <devarsh.thakkar@xilinx.com>
Subject: Re: [PATCH libdrm v4] modetest: Use floating vrefresh while dumping
 mode
Message-ID: <20191211154959.GJ1208@intel.com>
References: <1575383856-29959-1-git-send-email-devarsh.thakkar@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575383856-29959-1-git-send-email-devarsh.thakkar@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: rsk@xilinx.com, vcu-team@xilinx.com, dshah@xilinx.com,
 narmstrong@baylibre.com, dri-devel@lists.freedesktop.org, varunkum@xilinx.com,
 rvisaval@xilinx.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 03, 2019 at 06:37:36AM -0800, Devarsh Thakkar wrote:
> Add function to derive floating value of vertical
> refresh rate from drm mode using pixel clock,
> horizontal total size and vertical total size.
> =

> Use this function to find suitable mode having vrefresh
> value which is matching with user provided vrefresh value.
> =

> If user doesn't provide any vrefresh value in args then
> update vertical refresh rate value in pipe args using this
> function.
> =

> Also use this function for printing floating vrefresh while
> dumping all available modes.
> =

> This will give more accurate picture to user for available modes
> differentiated by floating vertical refresh rate and help user
> select more appropriate mode using suitable refresh rate value.
> =

> V4:
> 1) While setting mode, print mode name and vrefresh using struct
>    drmModeModeInfo instead of struct pipe_args.
> 2) Revert back to using a float value instead of float *
>    for vrefresh arg in connector_find_mode().
> =

> V3:
> 1) Change name of function used to derive refresh rate.
> =

> V2:
> 1) Don't use inline function for deriving refresh rate from mode.
> 2) If requested mode not found, print refresh rate only
>    if user had provided it in args.
> =

> Signed-off-by: Devarsh Thakkar <devarsh.thakkar@xilinx.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks. lgtm -> pushed to master.

> ---
>  tests/modetest/modetest.c | 35 +++++++++++++++++++++++------------
>  1 file changed, 23 insertions(+), 12 deletions(-)
> =

> diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
> index b4edfcb..e998e8e 100644
> --- a/tests/modetest/modetest.c
> +++ b/tests/modetest/modetest.c
> @@ -133,6 +133,12 @@ static inline int64_t U642I64(uint64_t val)
>  	return (int64_t)*((int64_t *)&val);
>  }
>  =

> +static float mode_vrefresh(drmModeModeInfo *mode)
> +{
> +	return  mode->clock * 1000.00
> +			/ (mode->htotal * mode->vtotal);
> +}
> +
>  #define bit_name_fn(res)					\
>  const char * res##_str(int type) {				\
>  	unsigned int i;						\
> @@ -210,9 +216,9 @@ static void dump_encoders(struct device *dev)
>  =

>  static void dump_mode(drmModeModeInfo *mode)
>  {
> -	printf("  %s %d %d %d %d %d %d %d %d %d %d",
> +	printf("  %s %.2f %d %d %d %d %d %d %d %d %d",
>  	       mode->name,
> -	       mode->vrefresh,
> +	       mode_vrefresh(mode),
>  	       mode->hdisplay,
>  	       mode->hsync_start,
>  	       mode->hsync_end,
> @@ -828,7 +834,6 @@ connector_find_mode(struct device *dev, uint32_t con_=
id, const char *mode_str,
>  	drmModeConnector *connector;
>  	drmModeModeInfo *mode;
>  	int i;
> -	float mode_vrefresh;
>  =

>  	connector =3D get_connector_by_id(dev, con_id);
>  	if (!connector || !connector->count_modes)
> @@ -837,15 +842,14 @@ connector_find_mode(struct device *dev, uint32_t co=
n_id, const char *mode_str,
>  	for (i =3D 0; i < connector->count_modes; i++) {
>  		mode =3D &connector->modes[i];
>  		if (!strcmp(mode->name, mode_str)) {
> -			/* If the vertical refresh frequency is not specified then return the
> -			 * first mode that match with the name. Else, return the mode that ma=
tch
> -			 * the name and the specified vertical refresh frequency.
> +			/* If the vertical refresh frequency is not specified
> +			 * then return the first mode that match with the name.
> +			 * Else, return the mode that match the name and
> +			 * the specified vertical refresh frequency.
>  			 */
> -			mode_vrefresh =3D mode->clock * 1000.00
> -					/ (mode->htotal * mode->vtotal);
>  			if (vrefresh =3D=3D 0)
>  				return mode;
> -			else if (fabs(mode_vrefresh - vrefresh) < 0.005)
> +			else if (fabs(mode_vrefresh(mode) - vrefresh) < 0.005)
>  				return mode;
>  		}
>  	}
> @@ -911,7 +915,13 @@ static int pipe_find_crtc_and_mode(struct device *de=
v, struct pipe_arg *pipe)
>  		mode =3D connector_find_mode(dev, pipe->con_ids[i],
>  					   pipe->mode_str, pipe->vrefresh);
>  		if (mode =3D=3D NULL) {
> -			fprintf(stderr,
> +			if (pipe->vrefresh)
> +				fprintf(stderr,
> +				"failed to find mode "
> +				"\"%s-%.2fHz\" for connector %s\n",
> +				pipe->mode_str, pipe->vrefresh, pipe->cons[i]);
> +			else
> +				fprintf(stderr,
>  				"failed to find mode \"%s\" for connector %s\n",
>  				pipe->mode_str, pipe->cons[i]);
>  			return -EINVAL;
> @@ -1398,7 +1408,7 @@ static void atomic_set_mode(struct device *dev, str=
uct pipe_arg *pipes, unsigned
>  			continue;
>  =

>  		printf("setting mode %s-%.2fHz on connectors ",
> -		       pipe->mode_str, pipe->vrefresh);
> +		       pipe->mode->name, mode_vrefresh(pipe->mode));
>  		for (j =3D 0; j < pipe->num_cons; ++j) {
>  			printf("%s, ", pipe->cons[j]);
>  			add_property(dev, pipe->con_ids[j], "CRTC_ID", pipe->crtc->crtc->crtc=
_id);
> @@ -1481,7 +1491,8 @@ static void set_mode(struct device *dev, struct pip=
e_arg *pipes, unsigned int co
>  			continue;
>  =

>  		printf("setting mode %s-%.2fHz@%s on connectors ",
> -		       pipe->mode_str, pipe->vrefresh, pipe->format_str);
> +		       pipe->mode->name, mode_vrefresh(pipe->mode),
> +		       pipe->format_str);
>  		for (j =3D 0; j < pipe->num_cons; ++j)
>  			printf("%s, ", pipe->cons[j]);
>  		printf("crtc %d\n", pipe->crtc->crtc->crtc_id);
> -- =

> 2.7.4

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
