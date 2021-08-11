Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BB03E8E75
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 12:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2CA89760;
	Wed, 11 Aug 2021 10:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A852891CC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 10:21:47 +0000 (UTC)
Date: Wed, 11 Aug 2021 10:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1628677304;
 bh=bDk/wMqwMCPs55BFKu9MMkPMlAs8hEprV+MTnJ3E6w8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=JWX8fT9mXOA2s8/SlX7kNNAPfmpsbbt+cN1IRJmg6+b+6Fz1XyPEpR7/78cgkw/Zd
 j0q84kycARWwiy+T8sGwqDM8nD7O0I4mDXUOHabvOFYUuimnhDM6aBEjJni2MD0S+b
 gtajsgKG9hVnkWWcOFyK6IyuvlRozW0PRU9HG9gjyHLlMxnI0yEC29ocyAXg2BIGk+
 22qd4zVxpQBS5Y5JkUMIA/KrMk/Az9fWXJ+aqTK/vZGxyC6BsXKv0s4WPdxcu7MnU9
 fibuSmPBM+R36bBVmu6Z6j9AbmIBgQz6J9r3ScYKESEQsQxEshUvh9ZGdugWtWVLEU
 3MUUmkUfrECxg==
To: Daniel Vetter <daniel@ffwll.ch>
From: Simon Ser <contact@emersion.fr>
Cc: John Cox <jc@kynesim.co.uk>, dri-devel@lists.freedesktop.org
Subject: Re: How to obtain a drm lease from X for overlay planes as well as a
 primary plane?
Message-ID: <Af-nitVw-cgVIRn4hPB53-PwBSuaSqzaoUQA5H6kUF6BXVYJ5noiTAE6E1K0Q_aL_PxpA08bNQuxOKbSfSHQtSR-OOUtMtyrkLfSFBT7hDE=@emersion.fr>
In-Reply-To: <YRObs1/iDhgCbMo8@phenom.ffwll.local>
References: <34a5hg1rb804h8d1471apktsgl5v9n9u1e@4ax.com>
 <YRObs1/iDhgCbMo8@phenom.ffwll.local>
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

On Wednesday, August 11th, 2021 at 11:43, Daniel Vetter <daniel@ffwll.ch> w=
rote:

> For wayland this is still in the works, so might be good if you check
> there that your use-case is properly supported. Protocol MR is here:
>
> https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests=
/67

The client requests a connector, and the compositor will decide which
resources to lease. This may or may not include overlay planes. The
connector you're interested in may or may not be available for lease.

What's your use-case? Why not use an xdg_toplevel and wl_subsurface?

DRM leases are not a good idea for regular applications. They don't
properly integrate with the rest of the desktop, and won't get input
events. Letting the compositor deal with KMS planes is the preferred
approach.
