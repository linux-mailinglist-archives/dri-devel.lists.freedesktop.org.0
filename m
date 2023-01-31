Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7199A682FB9
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 15:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DCD10E34E;
	Tue, 31 Jan 2023 14:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A024910E34E
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 14:51:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 027EEB81D1D;
 Tue, 31 Jan 2023 14:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1D6C4339C;
 Tue, 31 Jan 2023 14:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1675176676;
 bh=nsoBopMAz4duSNJoBKEMLJBHGuAUe6NkWDgn9CCh3/4=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=jrZ5LzfK8AEfiC/TmgzXeNEONR4Mq4jatwVKbFU4gGz0Mw2kq/x9arXRqUqNGOBWU
 o7sWjlV4GDDw2bcEe3Nol5ovWozKWP2yTpn3LhSjh0FGJQX7p5hMBb1bwDIPNCaWk5
 Lhcu71W618BwJcpkjBs3TP27/tZdvySzpSzbr0Ak=
Date: Tue, 31 Jan 2023 15:51:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sanan Hasanov <sanan.hasanov@knights.ucf.edu>
Subject: Re: [PATCHv2] fbcon: Check font dimension limits
Message-ID: <Y9kq4ZoBs8LkEtqs@kroah.com>
References: <20230129151740.x5p7jj2pbuilpzzt@begin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230129151740.x5p7jj2pbuilpzzt@begin>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 29, 2023 at 04:17:40PM +0100, Samuel Thibault wrote:
> blit_x and blit_y are u32, so fbcon currently cannot support fonts
> larger than 32x32.
> 
> The 32x32 case also needs shifting an unsigned int, to properly set bit
> 31, otherwise we get "UBSAN: shift-out-of-bounds in fbcon_set_font",
> as reported on:
> 
> http://lore.kernel.org/all/IA1PR07MB98308653E259A6F2CE94A4AFABCE9@IA1PR07MB9830.namprd07.prod.outlook.com
> Kernel Branch: 6.2.0-rc5-next-20230124
> Kernel config: https://drive.google.com/file/d/1F-LszDAizEEH0ZX0HcSR06v5q8FPl2Uv/view?usp=sharing
> Reproducer: https://drive.google.com/file/d/1mP1jcLBY7vWCNM60OMf-ogw-urQRjNrm/view?usp=sharing
> 
> Reported-by: Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> Fixes: 2d2699d98492 ("fbcon: font setting should check limitation of driver")
> Cc: stable@vger.kernel.org

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
