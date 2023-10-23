Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BEA7D2C78
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 10:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0A410E18B;
	Mon, 23 Oct 2023 08:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1506 seconds by postgrey-1.36 at gabe;
 Mon, 23 Oct 2023 08:19:18 UTC
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C9910E185;
 Mon, 23 Oct 2023 08:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1698049156; x=1698308356;
 bh=WxADqybr844I3oyxhgF11CfEL7UzS7ZR4cFdELQGNvc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=U2RcwxLU7ur57UbIqCUc41rPeN8/K52RWTLgORhgJU5QCGJ7yuP/p1Xi0EqVjMKAW
 htgDguF11LRmmTvNhgmHoWbDlWHHq+nQnEHLaJAHT4svQzQszctKAuxU9jcXg88xeW
 /r2ObbAxjn+pX9LpZfk8L9RoxG1aw0Sj7i6a3cEfZXXbMmPTGUNkHqYZbxBv0yVjvM
 gbTu505EB44iV5R0BwC6vJmBbDIR8ChlOn9NLzI1ZWR4hajxOIzWT2zrQkcSw4/Usw
 EsgsAcaN63gmyTSJc7XKGcWmJi9D+KDCEIwpQtvoHTOf0n7dSJHFC02fFuln/MkBmO
 eYnQkIKLYP0Ig==
Date: Mon, 23 Oct 2023 08:19:05 +0000
To: Albert Esteve <aesteve@redhat.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v6 0/9] Fix cursor planes with virtualized drivers
Message-ID: <219B7sJmmuzo8lj-2i5F6y0pc8XM03X6NdxHUq_R76N71AcTptEPcpjKLO9Rutriw88YtJDRNqibuR-YICIkhPnrBnQSM-Uu9YCc2uZoOiM=@emersion.fr>
In-Reply-To: <CADSE00KW4+hpbAbZAusBngq5FYSa067wYJCGeetqngWRJaD9Kg@mail.gmail.com>
References: <20231023074613.41327-1-aesteve@redhat.com>
 <-ngmaSLF2S5emYjTBWcLRNzvJRoe_eZ-Nv9HQhE6ZLuK8nIE2ZbfVh2G2O2Z41GoIFIRpts0ukEtFXUx8pNAptmrZBhlXxaQGykx_qCZ_9k=@emersion.fr>
 <CADSE00KW4+hpbAbZAusBngq5FYSa067wYJCGeetqngWRJaD9Kg@mail.gmail.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: linux-doc@vger.kernel.org, qemu-devel@nongnu.org, banackm@vmware.com,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 mombasawalam@vmware.com, iforbes@vmware.com, Jonathan Corbet <corbet@lwn.net>,
 javierm@redhat.com,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 David Airlie <airlied@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Matt Roper <matthew.d.roper@intel.com>, linux-kernel@vger.kernel.org,
 krastevm@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, October 23rd, 2023 at 10:14, Albert Esteve <aesteve@redhat.com> =
wrote:

> On Mon, Oct 23, 2023 at 9:55=E2=80=AFAM Simon Ser <contact@emersion.fr> w=
rote:
>=20
> > On Monday, October 23rd, 2023 at 09:46, Albert Esteve <aesteve@redhat.c=
om> wrote:
> >=20
> > > Link to the IGT test covering this patch (already merged):
> > > https://lists.freedesktop.org/archives/igt-dev/2023-July/058427.html
> >=20
> > Hmm. IGT should not be merged before the kernel, because as long as the
> > kernel is not merged there might be some uAPI changes.
>=20
> Right, but uAPI header was not updated on the IGT side. As per suggestion=
 of the
> maintainers, I added a static variable that matches the definition on thi=
s patch:
> https://lists.freedesktop.org/archives/igt-dev/2023-August/058803.html
>=20
> +/**
> + * Clients which do set cursor hotspot and treat the cursor plane
> + * like a mouse cursor should set this property.
> + */
> +#define LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT=096
>=20
> Once this patch gets upstreamed, the localized definition will be removed=
,
> replaced by the real one.

What if this patch gets delayed and another patch using the same number
is merged into the kernel first? What if someone finds a design flaw in
the uAPI and it needs to be completely changed? The IGT test would then
be completely broken.

As a rule of thumb: never merge user-space patches before kernel. As
soon as the kernel part is merged, it's fine to locally copy definitions
if desirable.

> > > Mutter patch:
> > > https://lists.freedesktop.org/archives/igt-dev/2023-July/058427.html
> >=20
> > Seems like this link is same as IGT? Copy-pasta fail maybe?
>=20
> Ah yes, my bad, this is the correct link:
> https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3337

Thanks!
