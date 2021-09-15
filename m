Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC29940CA30
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 18:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079B06E97A;
	Wed, 15 Sep 2021 16:33:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2783C6E97A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
 bh=1IvY6W1kCaZ/7cNV5Mq82RQUjxWZBdhNyLxLUOJ7onE=; 
 b=LHPB1HxcSt+Famsx6Vi9OmRHg0heLRPKS9lBVqKufI/tf7PBf54SLDHzMIkwnKOsB1jAjIBD0Ibd9sZyHOw13dIsK3VjJZEd0U6BIwg+VJJqADo59EXeTXWIF9CW6byzjImuXxy8pelQEqyQ0CNmTM3Qe9OMqtEHwrfkHZxn59qQ7Fk5LN26/XcpPnMcLky/XlDB1G4DDSBvfgijah3Iv9b0odrSkwdVvz10BwU53Zf4DBABqAILua+StG4xvSsZf6nSG1OKs1wWYtjZJSaajnEaBRHpMU4aLY+pvb7ch9i2m/a8QoMP0B0vCB1iU1vCk1kw5GbnmvDRFNn00ItAuA==;
Received: from 191.49.165.83.dynamic.reverse-mundo-r.com ([83.165.49.191]
 helo=zeus) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mQXqN-0000tp-Bh; Wed, 15 Sep 2021 18:33:07 +0200
Message-ID: <c6f99075ee2ade09a749980805498666f75484fe.camel@igalia.com>
Subject: Re: [PATCH 2/3] drm/v3d: add generic ioctl extension
From: Iago Toral <itoral@igalia.com>
To: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard
 <maxime@cerno.tech>,  Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, 15 Sep 2021 18:32:57 +0200
In-Reply-To: <20210915162855.flblzgphxcf6f24h@mail.igalia.com>
References: <cover.1629307160.git.mwen@igalia.com>
 <d5647f22567a71e5ecd3f86f0110aa14f8c6006d.1629307160.git.mwen@igalia.com>
 <633623ded6ffc8c6021648452f171f9da38a02ab.camel@igalia.com>
 <20210915162855.flblzgphxcf6f24h@mail.igalia.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Wed, 2021-09-15 at 17:28 +0100, Melissa Wen wrote:
> On 09/15, Iago Toral wrote:
> > On Wed, 2021-08-18 at 18:56 +0100, Melissa Wen wrote:
(...)
> > > 
> > >  /**
> > > @@ -248,6 +266,15 @@ struct drm_v3d_submit_tfu {
> > >  	__u32 in_sync;
> > >  	/* Sync object to signal when the TFU job is done. */
> > >  	__u32 out_sync;
> > > +
> > > +	/* Number of extensions*/
> > > +	__u32 extension_count;
> > > +
> > > +	/* Pointer to an array of ioctl extensions*/
> > > +	__u64 extensions;
> > > +
> > > +	/* DRM_V3D_SUBMIT_* properties */
> > > +	__u32 flags;
> > 
> > A silly nit: maybe put flags before the extension fields above for
> > consistency with the CSD and CL submission commands.
> 
> hmm.. I arranged it that way for alignment reasons (afaiu), but I can
> (or should) include a _u32 pad right after out_sync to set these in
> the
> same sequence.

Ah, that's fine, my suggestion was just for style, let's keep it as is.

Iago


