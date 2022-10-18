Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89765602852
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 11:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA32B10E4D9;
	Tue, 18 Oct 2022 09:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076F910E1FD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 09:26:47 +0000 (UTC)
Date: Tue, 18 Oct 2022 09:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1666085205; x=1666344405;
 bh=lkgJpWb4BaP1gv7AzAPzQPSfRTAjw60rN7V6Xsc2zOY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=JxJ0JbIU/XDTDzCBQ1z/bshkld/8VLeDOh03KydWqzJHV77rAWfPMKsgYkSXw7h0n
 41k8RYXmK7iFlX4mkjYC2KZokoZN/WGDAxs4zNZvSNarjWKoutmnEqkeMmRyaPkvz6
 d6kOFAW54+LCvwRLeoOhcaeZRbpk9BwSIJX9jW8n09fMtqJ42N3NEhvUBRsfVfByr1
 aaWN9H/pH5zje7/aA2ToaCIuY89p+LTcW74AU6DxO5bUyEtKp4kcFgdpZolTqu+np4
 9f165iQf8Dhen4f+4Qa/wt9hs5RngjMCJ5waT6IY4pIXDYj/qJunlyTNe4j+NtC3R3
 uWzkEbrq2IkCg==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/2] drm/connector: send hotplug uevent on connector
 cleanup
Message-ID: <ItXxb260gmsCB1yhoUXl8D1d8T7-EXkKsK9w_Qcyb2VsBCH7zAPzPfbYVWGqCJxne3pH3lpKdRLoIuOZzhfCtE9I8UByM0Y17_qVopplReg=@emersion.fr>
In-Reply-To: <Y05w5U0CAbrdA10S@intel.com>
References: <20221017153150.60675-1-contact@emersion.fr>
 <20221017153150.60675-2-contact@emersion.fr> <Y05w5U0CAbrdA10S@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, October 18th, 2022 at 11:24, Ville Syrj=C3=A4l=C3=A4 <ville.syr=
jala@linux.intel.com> wrote:

> On Mon, Oct 17, 2022 at 03:32:01PM +0000, Simon Ser wrote:
>=20
> > A typical DP-MST unplug removes a KMS connector. However care must
> > be taken to properly synchronize with user-space. The expected
> > sequence of events is the following:
> >=20
> > 1. The kernel notices that the DP-MST port is gone.
> > 2. The kernel marks the connector as disconnected, then sends a
> > uevent to make user-space re-scan the connector list.
> > 3. User-space notices the connector goes from connected to disconnected=
,
> > disables it.
> > 4. Kernel handles the the IOCTL disabling the connector. On success,
> > the very last reference to the struct drm_connector is dropped and
> > drm_connector_cleanup() is called.
> > 5. The connector is removed from the list, and a uevent is sent to tell
> > user-space that the connector disappeared.
> >=20
> > The very last step was missing. As a result, user-space thought the
> > connector still existed and could try to disable it again. Since the
> > kernel no longer knows about the connector, that would end up with
> > EINVAL and confused user-space.
>=20
> So is the uevent sent by the mst delayed destroy work
> useless now, or what is going on there?

No, that one is still useful, step (2) above.
