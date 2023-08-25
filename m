Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76100788AFD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 16:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386FA10E0BE;
	Fri, 25 Aug 2023 14:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F326B10E165
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 14:09:07 +0000 (UTC)
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk
 [IPv6:2a01:4f8:1c1c:f269::1])
 by madras.collabora.co.uk (Postfix) with ESMTP id 4C74566071BE;
 Fri, 25 Aug 2023 15:09:04 +0100 (BST)
From: "Helen Mae Koike Fornazier" <helen.koike@collabora.com>
In-Reply-To: <87pm3b2pkz.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Fri, 25 Aug 2023 15:09:04 +0100
To: "Jani Nikula" <jani.nikula@linux.intel.com>
MIME-Version: 1.0
Message-ID: <29c7-64e8b600-1-6afffd8@162524228>
Subject: =?utf-8?q?Re=3A?= [PATCH 2/6] =?utf-8?q?drm=3A?==?utf-8?q?_ci=3A?=
 Force db410c to host mode
User-Agent: SOGoMail 5.8.4
Content-Transfer-Encoding: quoted-printable
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org,
 Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org,
 jbrunet@baylibre.com, robdclark@google.com, corbet@lwn.net,
 khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 david.heidelberg@collabora.com, linux-rockchip@lists.infradead.org,
 daniels@collabora.com, martin.blumenstingl@googlemail.com, mripard@kernel.org,
 anholt@google.com, linux-mediatek@lists.infradead.org,
 robclark@freedesktop.org, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, gustavo.padovan@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani, thanks for your comments

On Friday, August 25, 2023 10:56 -03, Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:

> On Fri, 25 Aug 2023, Vignesh Raman <vignesh.raman@collabora.com> wrot=
e:
> > Force db410c to host mode to fix network issue which results in fai=
lure
> > to mount root fs via NFS.
> > See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8=
c15c80a54dda510743cefd1c4b65b8
> >
> > Since this fix is not sent upstream, add it to build.sh script
> > before building the kernel and dts. Better approach would be
> > to use devicetree overlays.
> >
> > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > ---
> >  drivers/gpu/drm/ci/build.sh | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build=
.sh
> > index 7b014287a041..c39834bd6bd7 100644
> > --- a/drivers/gpu/drm/ci/build.sh
> > +++ b/drivers/gpu/drm/ci/build.sh
> > @@ -70,6 +70,10 @@ if [ -z "$CI=5FMERGE=5FREQUEST=5FPROJECT=5FPATH"=
 ]; then
> >      fi
> >  fi
> > =20
> > +# Force db410c to host mode to fix network issue which results in =
failure to mount root fs via NFS.
> > +# See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a62=
9b8c15c80a54dda510743cefd1c4b65b8
> > +sed -i '/&usb {/,/status =3D "okay";/s/status =3D "okay";/&\n\tdr=5F=
mode =3D "host";/' arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> > +
>=20
> It seems like a really bad idea to me to have the CI build modify the
> source tree before building.
>=20
> The kernel being built will have a dirty git repo, and the localversi=
on
> will have -dirty in it.

Is it bad?

The other option was to work with device tree overlays (but we still ne=
ed to spend some time to
see how to fit it all together)

>=20
> I think it would be better to do out-of-tree builds and assume the
> source is read-only.

I'm not sure I get what do you call out-of-tree builds.

Another option would be to apply .patch file, or to have another branch
just with fix ups for ci that would be applied in the tree before build=
ing.

>=20
> >  for opt in $ENABLE=5FKCONFIGS; do
> >    echo CONFIG=5F$opt=3Dy >> drivers/gpu/drm/ci/${KERNEL=5FARCH}.co=
nfig
> >  done
>=20
> Ditto for the config changes in the context here. Those are files in
> git, don't change them.

Probably these changes could go directly into drivers/gpu/drm/ci/${KERN=
EL=5FARCH}.config
files, no need to modify them on the fly here

>=20
> Shouldn't this use something like 'scripts/config --enable' or
> 'scripts/config --disable' on the .config file to be used for buildin=
g
> instead?

I wasn't aware about this possibility, looks cleaner indeed.

Regards,
Helen

>=20
>=20
> BR,
> Jani.
>=20
>=20
> --=20
> Jani Nikula, Intel Open Source Graphics Center

