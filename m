Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E2B1200E0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 10:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAC96E049;
	Mon, 16 Dec 2019 09:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F9D6E049
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 09:21:14 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3701D290B76;
 Mon, 16 Dec 2019 09:21:13 +0000 (GMT)
Date: Mon, 16 Dec 2019 10:21:09 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 16/50] drm: Add helper to create a connector for a
 chain of bridges
Message-ID: <20191216102109.6ada6a1a@collabora.com>
In-Reply-To: <20191210225750.15709-17-laurent.pinchart@ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-17-laurent.pinchart@ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Dec 2019 00:57:16 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Most bridge drivers create a DRM connector to model the connector at the
> output of the bridge. This model is historical and has worked pretty
> well so far, but causes several issues:
> 
> - It prevents supporting more complex display pipelines where DRM
> connector operations are split over multiple components. For instance a
> pipeline with a bridge connected to the DDC signals to read EDID data,
> and another one connected to the HPD signal to detect connection and
> disconnection, will not be possible to support through this model.
> 
> - It requires every bridge driver to implement similar connector
> handling code, resulting in code duplication.
> 
> - It assumes that a bridge will either be wired to a connector or to
> another bridge, but doesn't support bridges that can be used in both
> positions very well (although there is some ad-hoc support for this in
> the analogix_dp bridge driver).
> 
> In order to solve these issues, ownership of the connector needs to be
> moved to the display controller driver.
> 
> To avoid code duplication in display controller drivers, add a new
> helper to create and manage a DRM connector backed by a chain of
> bridges. All connector operations are delegating to the appropriate
> bridge in the chain.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
