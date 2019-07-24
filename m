Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E7C72EAA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173B46E4DD;
	Wed, 24 Jul 2019 12:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE136E4F4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 10:43:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shadeslayer) with ESMTPSA id 89D5028507D
From: Rohan Garg <rohan.garg@collabora.com>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH libdrm 2/2] modetest: Add a new "-r" option to set a
 default mode
Date: Wed, 24 Jul 2019 12:43:09 +0200
Message-ID: <1651589.g8xMiAdU8h@solembum>
Organization: Collabora
In-Reply-To: <20190722160823.26668-2-ezequiel@collabora.com>
References: <20190722160823.26668-1-ezequiel@collabora.com>
 <20190722160823.26668-2-ezequiel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 24 Jul 2019 12:20:46 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0255252908=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0255252908==
Content-Type: multipart/signed; boundary="nextPart2186145.tKQo9esuC9"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2186145.tKQo9esuC9
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 22 July 2019 18:08:23 CEST Ezequiel Garcia wrote:
> This option finds the first connected connector and then
> sets its preferred mode on it.
> 
> Set this option to be set when no mode or plane is set
> explicitily. This allows to quickly test, in cases where
> one just needs something displayed.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  tests/modetest/modetest.c | 81 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 75 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
> index 5e628127a130..6042aaae7cca 100644
> --- a/tests/modetest/modetest.c
> +++ b/tests/modetest/modetest.c
> @@ -901,7 +901,9 @@ static int pipe_find_crtc_and_mode(struct device *dev,
> struct pipe_arg *pipe) drmModeModeInfo *mode = NULL;
>  	int i;
> 
> -	pipe->mode = NULL;
> +	/* If set_preferred is used, a mode is already set. */
> +	if (pipe->mode)
> +		goto find_crtc;
> 
>  	for (i = 0; i < (int)pipe->num_cons; i++) {
>  		mode = connector_find_mode(dev, pipe->con_ids[i],
> @@ -913,7 +915,9 @@ static int pipe_find_crtc_and_mode(struct device *dev,
> struct pipe_arg *pipe) return -EINVAL;
>  		}
>  	}
> +	pipe->mode = mode;
> 
> +find_crtc:
>  	/* If the CRTC ID was specified, get the corresponding CRTC. 
Otherwise
>  	 * locate a CRTC that can be attached to all the connectors.
>  	 */
> @@ -935,7 +939,6 @@ static int pipe_find_crtc_and_mode(struct device *dev,
> struct pipe_arg *pipe) return -EINVAL;
>  	}
> 
> -	pipe->mode = mode;
>  	pipe->crtc->mode = mode;
> 
>  	return 0;
> @@ -1813,7 +1816,7 @@ static void parse_fill_patterns(char *arg)
> 
>  static void usage(char *name)
>  {
> -	fprintf(stderr, "usage: %s [-acDdefMPpsCvw]\n", name);
> +	fprintf(stderr, "usage: %s [-acDdefMPpsCvrw]\n", name);
> 
>  	fprintf(stderr, "\n Query options:\n\n");
>  	fprintf(stderr, "\t-c\tlist connectors\n");
> @@ -1826,6 +1829,7 @@ static void usage(char *name)
>  	fprintf(stderr, "\t-s
> <connector_id>[,<connector_id>][@<crtc_id>]:<mode>[-<vrefresh>][@<format>]\
> tset a mode\n"); fprintf(stderr, "\t-C\ttest hw cursor\n");
>  	fprintf(stderr, "\t-v\ttest vsynced page flipping\n");
> +	fprintf(stderr, "\t-r\tset the preferred mode\n");
>  	fprintf(stderr, "\t-w <obj_id>:<prop_name>:<value>\tset 
property\n");
>  	fprintf(stderr, "\t-a \tuse atomic API\n");
>  	fprintf(stderr, "\t-F pattern1,pattern2\tspecify fill 
patterns\n");
> @@ -1874,6 +1878,9 @@ static int pipe_resolve_connectors(struct device *dev,
> struct pipe_arg *pipe) char *endp;
> 
>  	for (i = 0; i < pipe->num_cons; i++) {
> +		/* If set_preferred is used, the connector is already 
resolved. */
> +		if (pipe->con_ids[i])
> +			continue;
>  		id = strtoul(pipe->cons[i], &endp, 10);
>  		if (endp == pipe->cons[i]) {
>  			connector = get_connector_by_name(dev, pipe-
>cons[i]);
> @@ -1885,14 +1892,62 @@ static int pipe_resolve_connectors(struct device
> *dev, struct pipe_arg *pipe)
> 
>  			id = connector->connector_id;
>  		}
> -
>  		pipe->con_ids[i] = id;
>  	}
> 
>  	return 0;
>  }
> 
> -static char optstr[] = "acdD:efF:M:P:ps:Cvw:";
> +static char optstr[] = "acdD:efF:M:P:ps:Cvrw:";
> +
> +static int pipe_find_preferred(struct device *dev, struct pipe_arg *pipe)
> +{
> +	drmModeRes *res = dev->resources->res;
> +	drmModeConnector *con = NULL;
> +	char *con_str;
> +	int i;
> +
> +	for (i = 0; i < res->count_connectors; i++) {
> +		con = drmModeGetConnector(dev->fd, res->connectors[i]);
> +		if (con->connection == DRM_MODE_CONNECTED)
> +			break;
> +		drmModeFreeConnector(con);
> +		con = NULL;
> +	}
> +
> +	if (!con) {
> +		printf("no connected connector!\n");
> +		return -1;
> +	}
> +
> +	con_str = malloc(8);
> +	sprintf(con_str, "%d", con->connector_id);
> +	strcpy(pipe->format_str, "XR24");
> +	pipe->fourcc = util_format_fourcc(pipe->format_str);
> +	pipe->num_cons = 1;
> +	pipe->con_ids = calloc(1, sizeof(*pipe->con_ids));
> +	pipe->cons = calloc(1, sizeof(*pipe->cons));
> +	pipe->con_ids[0] = con->connector_id;
> +	pipe->cons[0] = (const char*)con_str;
> +
> +	/* A CRTC possible will be chosen by pipe_find_crtc_and_mode. */
> +	pipe->crtc_id = (uint32_t)-1;
> +
> +	/* Return the first mode if no preferred. */
> +	pipe->mode = &con->modes[0];
> +	for (i = 0; i < con->count_modes; i++) {
> +		drmModeModeInfo *current_mode = &con->modes[i];
> +
> +		if (current_mode->type & DRM_MODE_TYPE_PREFERRED) {
> +			pipe->mode = current_mode;
> +			break;
> +		}
> +	}
> +
> +	sprintf(pipe->mode_str, "%dx%d", pipe->mode->hdisplay,
> pipe->mode->vdisplay); +
> +	return 0;
> +}
> 
>  int main(int argc, char **argv)
>  {
> @@ -1903,6 +1958,7 @@ int main(int argc, char **argv)
>  	int drop_master = 0;
>  	int test_vsync = 0;
>  	int test_cursor = 0;
> +	int set_preferred = 0;
>  	int use_atomic = 0;
>  	char *device = NULL;
>  	char *module = NULL;
> @@ -1987,6 +2043,9 @@ int main(int argc, char **argv)
>  		case 'v':
>  			test_vsync = 1;
>  			break;
> +		case 'r':
> +			set_preferred = 1;
> +			break;
>  		case 'w':
>  			prop_args = realloc(prop_args,
>  					   (prop_count + 1) * 
sizeof *prop_args);
> @@ -2008,7 +2067,7 @@ int main(int argc, char **argv)
>  	}
> 
>  	if (!args || (args == 1 && use_atomic))
> -		encoders = connectors = crtcs = planes = framebuffers = 
1;
> +		set_preferred = encoders = connectors = crtcs = planes = 
framebuffers =
> 1;
> 
>  	dev.fd = util_open(device, module);
>  	if (dev.fd < 0)
> @@ -2044,6 +2103,16 @@ int main(int argc, char **argv)
>  		return 1;
>  	}
> 
> +	if (set_preferred) {
> +		count = 1;
> +		pipe_args = calloc(1, sizeof(*pipe_args));
> +		ret = pipe_find_preferred(&dev, &pipe_args[0]);
> +		if (ret) {
> +			fprintf(stderr, "can't get preferred 
connector and mode: %s\n",
> strerror(errno)); +			return 1;
> +		}
> +	}
> +
>  	for (i = 0; i < count; i++) {
>  		if (pipe_resolve_connectors(&dev, &pipe_args[i]) < 0) {
>  			free_resources(dev.resources);

Reviewed-by: Rohan Garg <rohan.garg@collabora.com>

--nextPart2186145.tKQo9esuC9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYitc3NselT9dMmhSpwS9TvJnIJQFAl04Nj0ACgkQpwS9TvJn
IJRudQ//UKhBhszqsfBhOJjeDmTEn6fzxIGAN3ereb/u1D97VNlO8wdbaHeb6Hbx
pBeIl/Xtyz0TeJFOZo9+/C1YBgpWy3Zw1SNEUNjyYEORnZ4OPwhoGFTMySB+cTeq
UQdds2plr8h3jbRstCeQdew7QQed+xxONS9Q1AgAgDGthByiE/qzXM9DFRs24UV6
NfZ4cQYd0T5fqW+yfucU40uVuWRSFvEv+g9B6op4lyhj1CoKU/zXLiA0QB9iR+eg
DG7k4lQAQKQFOF2m3ZW+5I6d6NFMJf1PygKKOpqObbAy4yUgfNk2FtdF7X5ZCITg
ISXePwYMl0H5dmWLZH13rccvfX6PTtA0M51xYuTXu0lHv6WIhBNtxGcim8C7fecY
fJM+mQ1Hh7zwKqXBFfcIJfHAcpAd6aA191SG1pFPdOnQzfEodFcalWhrgQ2Rfbou
Ay7yq0oFxjBZ5QqQyL6KXjN+Iwt5xGy7i2xjWhw2PtjKcmDADidH+i7xE5DAompz
J5ESKaFxRCWE19POmJayZ2c/qUedPUvWzWl1mIM9k7bLBb1tDGcNvCp6lYCsMUcX
CAu5Kt1UnUWjN5TU4TL2f4Caj/0Hl+cO2gJ2vir1u7xpFW/gaI8RGPEVVeFGZBUJ
8pAD9/0qTyqeqzeXeXj1Ks5VmpjljY+Qu7RTZ5jMn85Ec7ibRl4=
=F7EN
-----END PGP SIGNATURE-----

--nextPart2186145.tKQo9esuC9--




--===============0255252908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0255252908==--



