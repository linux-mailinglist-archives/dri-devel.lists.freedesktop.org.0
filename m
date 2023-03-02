Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A7B6A8183
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 12:49:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCF910E123;
	Thu,  2 Mar 2023 11:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECD610E111
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 11:49:29 +0000 (UTC)
Date: Thu, 02 Mar 2023 11:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1677757767; x=1678016967;
 bh=4ERmRUFHo7MTzsePXHuPZtMW+DA1xooxRnxLXkeKRAQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=dZpoZTk9kuM2lGsDJiv0qGOBIQIlAaZMXauwi7hs2HKrE2TBimtwP66s/m/H9Rb8J
 1KpVpNM/8bmhRErEDkFW2Fzu648lPfEeupCJ1iXmETHnmXG0OHBFJCkFc3qHxxyAOn
 Ab3G4YrXMfvdnXyp0qC90tv4IG91g8L3bqk5lmvZXIitGmp/52haoZP2FYIRjdfUt/
 ens8hqdNZalSWw3U+PxK2HElSzqD0bCM2so2ANP76JqmrRBgvkqSAXHLegpSz6ouGC
 guLp7OAgoB+sxks7PUtzEl+1MgNLEiBv7ScoQXuJ9938pAKEcgLHETDZu3am0zihxN
 anQeKi3gX0N3g==
To: =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: gud: set PATH connector property
Message-ID: <PLvGFa_FMDtnNMXVQJhC2OLlTYYEJgTXWLzaapZWRaNF5iWeFC5mHYUF6PFFAftUlSjxU3KJ3yHpZzazW4qwvmB-YFcTxQw1UKkfAb7c2g4=@emersion.fr>
In-Reply-To: <9d95b8ec-8f40-699e-16b2-3ee19126457f@tronnes.org>
References: <l85gVq-EKaN9dzH4I8FXxv-4FyPkLSh7R5SgmqwFuh-oBtzFXFfvK8VVnTdvWpKBDITXvGrnMM0VijQoUkXeWCMMaFb4GSYpaUcmXm2fvlM=@emersion.fr>
 <9d95b8ec-8f40-699e-16b2-3ee19126457f@tronnes.org>
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
Cc: peter@stuge.se, DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, March 1st, 2023 at 19:07, Noralf Tr=C3=B8nnes <noralf@tronnes=
.org> wrote:

> > Would it be possible to set the PATH connector property based on the
> > USB port used by gud?
> >=20
> > This would give user-space a persistent identifier for the connector:
> > if the user plugs in a USB display on a given port, the PATH would be
> > the same even if the machine rebooted or the displays were plugged in
> > in a different order.
> >=20
> > DP-MST already sets this. User-space can use this property to store
> > output configuration metadata.
>=20
> drm_mode_connector_set_path_property() docs:
>=20
> This creates a property to expose to userspace to specify a connector
> path. This is mainly used for DisplayPort MST where connectors have a
> topology and we want to allow userspace to give them more meaningful name=
s.
>=20
> Here it says that it's about giving meaningful names to connectors, I
> think it would be useful to know that a HDMI-A connector is on a USB
> adapter for instance and not on the laptop/motherboard.

FWIW, the DP-MST PATH properties look like "mst:92-1".

> You mention output configuration however, why does userspace use the
> path to a connector when storing the multi display config and not some
> unique property on the displays themselves like the serial number?

It depends on the use-case. The reason why I'm asking about PATH is
that Sway users want a way to configure specifically by port and not by
sink. For instance, let's say I have a one USB display at home and
another USB display at work. I always use the same USB port to connect
USB displays. I want the USB display to always be arranged on the left
of my primary display, as long as that USB port is used, regardless of
which specific USB display is plugged in.

See the wlroots patch [1] and the original Sway issue [2].

[1]: https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/3979
[2]: https://github.com/swaywm/sway/issues/7062
