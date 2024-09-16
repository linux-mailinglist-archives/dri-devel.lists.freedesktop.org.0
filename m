Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5400979A44
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 06:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E7C10E013;
	Mon, 16 Sep 2024 04:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bMsTXyvy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E03910E013
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 04:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1726460121;
 bh=aSMGNOW8vImcRzjGRzIsVUvVAA6VLJ9IpG/L1pmcNJw=;
 h=Date:From:To:Cc:Subject:From;
 b=bMsTXyvyjD60NmFjP3DNMjJRGM2GSjWfWj9cAop6UPf1SExGyqBCSvbEeJ2oMYlpq
 LPg/SH5Bn9C08Qc8he9wXuvpGfuJRtELI4Z+tqw2mLIQEcEWy6A89HKJLiLSV3eiKY
 YPbnrWWDaqJHfLQSH/83RTVRAyIpKVvRH0EuTqZcHLDlPuaHvt0uPsxNvzmNhfaA4B
 y+BzViOp3e8AcjcAx9n0M8hs5MtCbV7dvGRvmFGoqbwnUpnoeeuvwJAbxSmkuExRWw
 eEPC3q0YfURp9q/MieKoB0XmXh5T8swsdB91ibbmwuyZJqy/8vYgLzarxrVWFNhbIP
 X8vyLAi9jIF3g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4X6Wm65Bglz4x8F;
 Mon, 16 Sep 2024 14:15:18 +1000 (AEST)
Date: Mon, 16 Sep 2024 14:15:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Jerry Zuo <jerry.zuo@amd.com>,
 DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mario Limonciello
 <mario.limonciello@amd.com>, Sung Joon Kim <sungjoon.kim@amd.com>, Tobias
 Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20240916141517.3ef8b349@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HvdUI/1MpsauEbBmWYRX.8l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/HvdUI/1MpsauEbBmWYRX.8l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c

between commit:

  e835d5144f5e ("drm/amd/display: Avoid race between dcn35_set_drr() and dc=
_state_destruct()")

from Linus' tree and commit:

  be7a6a517164 ("drm/amd/display: Check stream pointer is initialized befor=
e accessing")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
index d5e9aec52a05,a4c6decee0f8..000000000000
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
@@@ -1462,17 -1414,10 +1414,17 @@@ void dcn35_set_drr(struct pipe_ctx **pi
  	params.vertical_total_mid_frame_num =3D adjust.v_total_mid_frame_num;
 =20
  	for (i =3D 0; i < num_pipes; i++) {
 -		if ((pipe_ctx[i]->stream_res.tg !=3D NULL) && pipe_ctx[i]->stream_res.t=
g->funcs) {
 +		/* dc_state_destruct() might null the stream resources, so fetch tg
 +		 * here first to avoid a race condition. The lifetime of the pointee
 +		 * itself (the timing_generator object) is not a problem here.
 +		 */
 +		struct timing_generator *tg =3D pipe_ctx[i]->stream_res.tg;
 +
 +		if ((tg !=3D NULL) && tg->funcs) {
- 			struct dc_crtc_timing *timing =3D &pipe_ctx[i]->stream->timing;
- 			struct dc *dc =3D pipe_ctx[i]->stream->ctx->dc;
 +
- 			if (dc->debug.static_screen_wait_frames) {
+ 			if (pipe_ctx[i]->stream && pipe_ctx[i]->stream->ctx->dc->debug.static_=
screen_wait_frames) {
+ 				struct dc_crtc_timing *timing =3D &pipe_ctx[i]->stream->timing;
+ 				struct dc *dc =3D pipe_ctx[i]->stream->ctx->dc;
  				unsigned int frame_rate =3D timing->pix_clk_100hz / (timing->h_total =
* timing->v_total);
 =20
  				if (frame_rate >=3D 120 && dc->caps.ips_support &&

--Sig_/HvdUI/1MpsauEbBmWYRX.8l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbnsNUACgkQAVBC80lX
0GxHvQgAj60CcQjHqGW9DeZwTLnIAkTkI69oWMob4SjNdxTfMq92EvdjZosF+QCL
jGq217kLdUlrpABe0xGyswi3oGjDR1H7fFnDr7yQeVsmrSgSMuDjIL52ypLEDhJ+
P9hMXZ1q0ZKJ4loRFuPXZujaWsGz2woZvGxfG/XNBLiOtyX9k+zkSrXVZb8fiZCa
ygtyYsHb6OmXVe6+w/UMeaOKPK7HyvA6gB1Xy8kUx1SCIA2qNsgSamKvv5h3DzPt
wj+cuzzvGIHgy8TApcQ+uuyJ6/hBTVI9j4SOJfujKPr8rX1YFCKbAK9M/RwZAh2x
N6Zi4qBdaKv+WZWx6+6BlDBc7bOpkg==
=fI6z
-----END PGP SIGNATURE-----

--Sig_/HvdUI/1MpsauEbBmWYRX.8l--
