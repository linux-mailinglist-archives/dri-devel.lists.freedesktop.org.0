Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E816813C8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 15:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3658510E26A;
	Mon, 30 Jan 2023 14:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926EE10E26A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 14:52:11 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id F35D86008767;
 Mon, 30 Jan 2023 14:52:09 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
 tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
 with UTF8LMTP id s87nkweLR25U; Mon, 30 Jan 2023 14:52:07 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt
 [IPv6:2001:690:2100:1::b3dd:b9ac])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 7EA6B6000421;
 Mon, 30 Jan 2023 14:52:07 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
 s=mail; t=1675090327;
 bh=RDkPmsbjG8K9H/t9YpVvybwEHM04LbAFRYdC4PZ62fw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=hwkK/HXRM7Zjagl2uKjjATniyiDMij9QjqqKFVl3woCsVKbjX2RXeEmPAWN2HVzF4
 7mxIq6DMw4tCjcb9Q0Xv4JK17oYssX3ULSiGzttd9DO2YSkelXguLvIymbXoyaLiQA
 FyP8HG9PQXsUPrJoDOGR8MhEaaxhe2BJ35t+3Qbw=
Received: from wslaptop (unknown [IPv6:2001:818:dcb5:dc00:d990:b664:f16:4cb2])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 0C9D6360076;
 Mon, 30 Jan 2023 14:52:07 +0000 (WET)
Date: Mon, 30 Jan 2023 14:49:09 +0000
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/2] drm/tegra: handle implicit scanout modifiers
Message-ID: <20230130144909.d5iauozyvh5fk446@wslaptop>
References: <20230120105858.214440-1-diogo.ivo@tecnico.ulisboa.pt>
 <Y8/qRSBm715P3EnB@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8/qRSBm715P3EnB@orome>
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
Cc: linux-tegra@vger.kernel.org, airlied@redhat.com,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 24, 2023 at 03:25:09PM +0100, Thierry Reding wrote:
> On Fri, Jan 20, 2023 at 10:58:56AM +0000, Diogo Ivo wrote:
> > Hello!
> > 
> > This patch series adds support for correctly displaying tiled
> > framebuffers when no modifiers are reported by userspace.
> > 
> > Patch 1 adds the sector_layout parameter to the SET/GET_TILING
> > IOCTLs so that userspace can set this field appropriately.
> > 
> > Patch 2 adds handling of the case where the buffer object
> > passed to create a framebuffer is allocated with non-linear
> > tiling but no modifier is reported.
> > 
> > Diogo Ivo (2):
> >   drm/tegra: add sector layout to SET/GET_TILING IOCTLs
> >   drm/tegra: add scanout support for implicit tiling parameters
> > 
> >  drivers/gpu/drm/tegra/drm.c  | 29 ++++++++++++++++++
> >  drivers/gpu/drm/tegra/fb.c   | 59 ++++++++++++++++++++++++++++++++++--
> >  include/uapi/drm/tegra_drm.h | 16 ++++++----
> >  3 files changed, 96 insertions(+), 8 deletions(-)
> 
> We really don't want to use SET_TILING and GET_TILING IOCTLs anymore.
> These only exist for backwards compatibility with very old userspace.
> New code should use standard DRM/KMS mechanisms to deal with
> framebuffer modifiers.

Hello,

Thank you for your review! This implementation is basically a copy of
what vc4 already does when importing resources with no modifiers
specified by userspace.

I looked into the DRM/KMS infrastructure and did not find a mechanism
to do this, but perhaps I am missing something; if this is the case,
I would be happy to submit a more fitting implementation, since handling
these implicit modifiers allows us to lift the restriction of linear
scanout buffers.

Best regards,
Diogo
