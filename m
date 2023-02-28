Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0F66A562A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 10:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FAF10E670;
	Tue, 28 Feb 2023 09:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F2310E670
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 09:53:56 +0000 (UTC)
Date: Tue, 28 Feb 2023 09:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1677578034; x=1677837234;
 bh=lG6pPgLOd35zLq6pHUvRbElaVDIuwqoADroI7GOnELA=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=KTh5aUocFcQqN6ON+GW+R3r97xgQKWbh/T7d9vunQb0vHMIBz7/90fW31+c+ykBJE
 2IgUXSYrwz/OXlHBIYqK9RRWxU6E0Qc24+Tu7li8lwXoVCaMf7EC94cHv2UCGuVIe1
 r8o7ImHI+aC9ngMsqt45Wb9eewTAMdaT7Lf2ImGuCzOp9bh6upRU9B7puWX4JmtMRT
 d5ZJc+KbXN9DZ6jQrnZYtJUBcKUGRwDK+2P0ClSxUfuo3OOi3gVnW6Zxnexm+oZqMU
 TnbpWq+DUd/H5CzftQKs5A2DJdBkzp4CbI/7/ahzHM/3T6XzukCS3HFnVW/0C583eq
 L3JbVExB2/TfA==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document TV margin properties
Message-ID: <UA_4dHbPqQvjG0TrP7OhP73PFlhdTNg9Mx9GW3MRGX_JskeQHTNaZyKTBj4AmJoSgutHZeQTa08RkRBuFS6xfTPpEm7MrVtJZEaq88ZYg1s=@emersion.fr>
In-Reply-To: <20230228104642.21dae84c@eldfell>
References: <20230227122108.117279-1-contact@emersion.fr>
 <20230228104642.21dae84c@eldfell>
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
Cc: =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, February 28th, 2023 at 09:46, Pekka Paalanen <ppaalanen@gmail.c=
om> wrote:

> can these be negative as well, to achieve overscan and not just
> underscan? Did I get overscan and underscan right... these are related
> to under/overscan, aren't they?
>=20
> Hmm, no, I guess that doesn't make sense, there is no room in the
> signal to have negative margins, it would result in clipping the
> framebuffer while scaling up. So this can only be used to scale
> framebuffer down, add borders, and the TV then scales it back up
> again?

Correct.

> Looks like neither my Intel nor AMD cards support these, I don't see
> the properties. More things to the list of KMS properties Weston needs
> to explicitly control. Oh, it seems vc4 exclusive for now.

i915 does support it but for TV connectors only (i915/display/intel_tv.c).
gud also supports it.

> Where does this text appear in the HTML kernel docs? I tried to look at
> drm_connector.c but I cannot find the spot where this patch applies.

Here:
https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#analog-tv-specific-co=
nnector-properties

> Is this actually a connector property? How does that work, should this
> not be a CRTC property?

Yeah, it's a connector property for some reason.

> Is this instead not scaling anything but simply sending metadata
> through the connector?

No metadata is sent. This is purely equivalent to setting up CRTC_*
properties to scale the planes.

> Or are there underlying requirements that this connector property is
> actually affecting the CRTC, which means that it is fundamentally
> impossible to use multiple connectors with different values on the same
> CRTC? And drivers will reject any attempt, so there is no need to
> define what conflicting settings will do?

I don't think any driver above supports cloning CRTCs for these
connector types. i915 sets clonable =3D false for these connectors.
vc4 picks the first connector's TV margins, always.

> IOW, does simply the existence of these properties on a connector
> guarantee that the connector must be the only one on a CRTC?

I suppose that there could exist some hardware capable of applying
margins post-CRTC? Such driver could support cloning CRTCs and still
applying the connector margins correctly.
