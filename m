Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D48402A5C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 16:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05B689CAA;
	Tue,  7 Sep 2021 14:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C695489C63;
 Tue,  7 Sep 2021 14:03:23 +0000 (UTC)
Date: Tue, 07 Sep 2021 14:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1631023399;
 bh=KvoyyCinhGpAJZYlP3g4sT56tW81Ml+im0/rJst9yuY=;
 h=Date:To:From:Reply-To:Subject:From;
 b=PnU4MD9FRQU163F7W2o9haRUyrBMPpc8dBCs/yWgARWvP0ErliOhgliCoEuBT8805
 oc0B1fVohqDmEN/6czFy8JIrJKYpBkMzh5pi97GnlaPmQvXVzzJ1xWT7l4u/cHaTVb
 EK6oSQGgwtmhD9MFa2YwDqmfqCzHNqHbFHVCJmzg+oxNfd4Nx17tzgLlf41CjHDvLM
 EEtEfcHz8o47HlLDajbw4vcMio3K903unYtIwnXS7lK5zcqfkw7fLUpFXoo1a1V5Ue
 s12jBn9CpqpEeKqH/eqPCH0OuvUhx1ehWfIr+Y423VjmZPG5oC5L4GuBdV9AyG+t8S
 MkX0YaYtqTIWw==
To: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Harry Wentland <Harry.Wentland@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Sean Paul <seanpaul@chromium.org>
From: Simon Ser <contact@emersion.fr>
Subject: amdgpu: atomic API and cursor/overlay planes
Message-ID: <JIQ_93_cHcshiIDsrMU1huBzx9P9LVQxucx8hQArpQu7Wk5DrCl_vTXj_Q20m_L-8C8A5dSpNcSJ8ehfcCrsQpfB5QG_Spn14EYkH9chtg0=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Recently I've been discussing with various people [1] [2] about amdgpu's
handling of KMS planes. AMD hardware is a bit special when it comes to
the cursor plane, and it's not always 100% clear how that maps with the
KMS API.

Up until now we were using cursor and overlay planes in gamescope [3],
but some changes in the amdgpu driver [1] makes us unable to use planes
(and makes us fallback to composition). Basically, now the overlay
cannot be used at all unless it covers the whole CRTC.

The root cause is the cursor plane. The cursor plane can only be
enabled if there is an unscaled plane covering the whole CRTC right
underneath.

So one might assume that as long as the cursor plane isn't used, the
overlay plane could be enabled even if it doesn't cover the whole CRTC.
Unfortunately, ChromeOS uses the atomic API to setup primary/overlay
planes together with the legacy API to setup the cursor plane. This
means that at any time ChromeOS can toggle the cursor plane and will
expect the cursor plane to work.

For this reason, amdgpu now restricts the use of the overlay plane.
However this penalizes all KMS users because of a single user-space
implementation.

After discussion with Daniel Vetter [2], it seemed reasonable to add
a ChromeOS quirk in the kernel which retains the current behavior, but
require everybody else to use the atomic API properly, ie. not mix
atomic overlay plane usage with legacy cursor plane usage. This would
allow fully atomic user-space to better take advantage of overlay
planes with amdgpu.

Does this seem like an accurate summary of the situation? Does this
seem like a reasonable path forward?

Thanks,

Simon

[1]: https://lore.kernel.org/amd-gfx/SrcUnUUGJquVgjp9P79uV8sv6s-kMHG4wp0S3b=
4Nh9ksi29EIOye5edofuXkDLRvGfvkkRpQZ9JM7MNqew2B3kFUhaxsonDRXprkAYXaQUo=3D@em=
ersion.fr/
[2]: https://oftc.irclog.whitequark.org/dri-devel/2021-08-27#1630077257-163=
0078046;
[3]: https://github.com/Plagman/gamescope
