Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3434B53CB89
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 16:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24C010E888;
	Fri,  3 Jun 2022 14:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14AC10E8F3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 14:33:06 +0000 (UTC)
Date: Fri, 03 Jun 2022 14:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1654266784; x=1654525984;
 bh=JPRCnoDfzNjsiiFvCPmDXw3bypcx7+s63ddq/qHOYqg=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=CoPkeexp7TCWRgUXsSgdFK5dcpsT/yr0bqID571e6mRAos3/hoPLK9r30wPLvVfYr
 zFkLcdGNZtKkA4B2SyePQVhEJXMVDx5Jry0/uTIeb/9GlHCLXbUonWsxWOe+yPU+Wm
 4SffEOh6DL6rxNTaxLtrSmp6o/YBoaIz7qwahqlOzCSOryVv9JvEbPuCIoRDNhQv+p
 wL33YTr75g9/QHPGkI366x0yytAtwfX2Zi2E7wJeXl3zgPZx/zEVhygsoJMXwb5n+Y
 a8ftfsQaduH5ALpcnuAOR6SN3rDTSmzzygU14qydDo4fF3uAlIipqtVyeNCKFsNN7R
 jmxBExP/r6LSQ==
To: Zack Rusin <zackr@vmware.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
Message-ID: <5Et1VowGX_0a0i5weC4YVMX7bhGDU45hQyiv4CjqyxQStY1CSUJs-xamBowRO8go8yCk1l_jgKmM_OrMB0Fdx166545AX5nL09NGsEYaBs0=@emersion.fr>
In-Reply-To: <0F911D96-1C9B-4EF1-84D7-F5335B3FFEB7@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <0F911D96-1C9B-4EF1-84D7-F5335B3FFEB7@vmware.com>
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Martin Krastev <krastevm@vmware.com>, David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, June 3rd, 2022 at 16:27, Zack Rusin <zackr@vmware.com> wrote:

> > In particular: since the driver will ignore the KMS cursor plane
> > position set by user-space, I don't think it's okay to just expose
> > without opt-in from user-space (e.g. with a DRM_CLIENT_CAP).
> >
> > cc wayland-devel and Pekka for user-space feedback.
>
> I think Thomas expressed our concerns and reasons why those wouldn=
=E2=80=99t
> work for us back then. Is there something else you=E2=80=99d like to add?

I disagreed, and I don't understand Thomas' reasoning.

KMS clients will need an update to work correctly. Adding a new prop
without a cap leaves existing KMS clients broken. Adding a cap allows
both existing KMS clients and updated KMS clients to work correctly.

> > On Thursday, June 2nd, 2022 at 17:42, Zack Rusin zack@kde.org wrote:
> >
> > > - all userspace code needs to hardcore a list of drivers which requir=
e
> > > hotspots because there's no way to query from drm "does this driver
> > > require hotspot"
> >
> > Can you elaborate? I'm not sure I understand what you mean here.
>
> Only some drivers require informations about cursor hotspot, user space
> currently has no way of figuring out which ones are those, i.e. amdgpu
> doesn=E2=80=99t care about hotspots, qxl does so when running on qxl with=
out
> properly set cursor hotspot atomic kms will result in a desktop where
> mouse clicks have incorrect coordinates.
>
> There=E2=80=99s no way to differentiate between drivers that do not care =
about
> cursor hotspots and ones that absolutely require it.

Only VM drivers should expose the hotspot properties. Real drivers like
amdgpu must not expose it.
