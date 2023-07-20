Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F412C75AB3D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 11:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CA810E595;
	Thu, 20 Jul 2023 09:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0CA10E585
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 09:47:01 +0000 (UTC)
Date: Thu, 20 Jul 2023 09:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1689846419; x=1690105619;
 bh=dqMnOVFhwGcutUmZpxIgWHHQX4uB6hVlnaB+uDk+OE4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=khEt8NHj28Gk5X3RTiPtuHtCurlrsaAlh+SykOxofNgWGGmBw3Afo06sxd0Nxq1ew
 6R52J9EvgCEUaDo2Ck1E2zPFU7APSPg+zR/f2ENwiPxBLb4lYTQKasgIamCF+IT2AY
 0o5zu3uZi/rVcmWH2A79teMqWZYejTY9ndV58SFel9lAuTs5T6IvnKqW9RZ49xKHmN
 e69/8ljlGDALk69W/ZjjW7mX4wqa962x+5lQ2PdzrTbeotE96JW2vVtUnXcGVyIkWT
 c/opKcahiEZiNbUYIftJe16mrANEC6keVF2fJAhNFOokFPId0F+IuzJHTOreapDUZu
 K6I2yA1r2OW0g==
To: Zack Rusin <zackr@vmware.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v5 1/9] drm: Disable the cursor plane on atomic contexts
 with virtualized drivers
Message-ID: <xYS3Q2f4tkRhaihB8Y5aOcD8EGj35KDyUgpsiMrexx-vXLulGQRKCc9n7dCtLAsXEOxIv0uk3DIEvLYw-yiSK5c_goUQv04mp2II1cuT4YA=@emersion.fr>
In-Reply-To: <20230719014218.1700057-2-zack@kde.org>
References: <20230719014218.1700057-1-zack@kde.org>
 <20230719014218.1700057-2-zack@kde.org>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 David Airlie <airlied@linux.ie>, spice-devel@lists.freedesktop.org,
 javierm@redhat.com, banackm@vmware.com,
 Gurchetan Singh <gurchetansingh@chromium.org>, krastevm@vmware.com,
 ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, stable@vger.kernel.org, iforbes@vmware.com,
 virtualization@lists.linux-foundation.org, mombasawalam@vmware.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, July 19th, 2023 at 03:42, Zack Rusin <zack@kde.org> wrote:

> From: Zack Rusin <zackr@vmware.com>
>=20
> Cursor planes on virtualized drivers have special meaning and require
> that the clients handle them in specific ways, e.g. the cursor plane
> should react to the mouse movement the way a mouse cursor would be
> expected to and the client is required to set hotspot properties on it
> in order for the mouse events to be routed correctly.
>=20
> This breaks the contract as specified by the "universal planes". Fix it
> by disabling the cursor planes on virtualized drivers while adding
> a foundation on top of which it's possible to special case mouse cursor
> planes for clients that want it.
>=20
> Disabling the cursor planes makes some kms compositors which were broken,
> e.g. Weston, fallback to software cursor which works fine or at least
> better than currently while having no effect on others, e.g. gnome-shell
> or kwin, which put virtualized drivers on a deny-list when running in
> atomic context to make them fallback to legacy kms and avoid this issue.
>=20
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Fixes: 681e7ec73044 ("drm: Allow userspace to ask for universal plane lis=
t (v2)")
> Cc: <stable@vger.kernel.org> # v5.4+
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Chia-I Wu <olvaffe@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: virtualization@lists.linux-foundation.org
> Cc: spice-devel@lists.freedesktop.org
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Nit: I think it would be better to reflect the name of the DRM client cap i=
n
the supports_virtualized_cursor_plane field.

Regardless:

Reviewed-by: Simon Ser <contact@emersion.fr>
