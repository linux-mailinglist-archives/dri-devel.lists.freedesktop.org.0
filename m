Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CAF207B8B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 20:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69716E197;
	Wed, 24 Jun 2020 18:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9249D6E197
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 18:30:29 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4BC3A2A422B;
 Wed, 24 Jun 2020 19:30:28 +0100 (BST)
Date: Wed, 24 Jun 2020 20:30:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] drm/vc4: dsi: Fix bridge chain handling
Message-ID: <20200624203025.0ffea151@collabora.com>
In-Reply-To: <20200624175806.GA7351@mwanda>
References: <20200624175806.GA7351@mwanda>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Dan,

On Wed, 24 Jun 2020 20:58:06 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Hello Boris Brezillon,
> 
> The patch 033bfe7538a1: "drm/vc4: dsi: Fix bridge chain handling"
> from Dec 27, 2019, leads to the following static checker warning:
> 
> 	drivers/gpu/drm/vc4/vc4_dsi.c:758 vc4_dsi_encoder_disable()
> 	warn: iterator used outside loop: 'iter'
> 
> drivers/gpu/drm/vc4/vc4_dsi.c
>    743  static void vc4_dsi_encoder_disable(struct drm_encoder *encoder)
>    744  {
>    745          struct vc4_dsi_encoder *vc4_encoder = to_vc4_dsi_encoder(encoder);
>    746          struct vc4_dsi *dsi = vc4_encoder->dsi;
>    747          struct device *dev = &dsi->pdev->dev;
>    748          struct drm_bridge *iter;
>    749  
>    750          list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
>    751                  if (iter->funcs->disable)
>    752                          iter->funcs->disable(iter);
>    753          }
> 
> This loops backwards until iter is parked on the list head.
> 
>    754  
>    755          vc4_dsi_ulps(dsi, true);
>    756  
>    757          list_for_each_entry_from(iter, &dsi->bridge_chain, chain_node) {
> 
> But then this "continues" until the iter is parked on the list head.
> Since we ended with the iterator already on the list head then we never
> enter this loop and it is a no-op.
> 
> Am I missing something?

It should definitely be list_for_each_entry() here. Thanks for
this report. Would you mind sending a patch?

Regards,

Boris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
