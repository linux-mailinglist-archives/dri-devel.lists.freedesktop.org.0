Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6BB1CBF88
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 11:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B926E2EC;
	Sat,  9 May 2020 09:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9056E147
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 09:07:08 +0000 (UTC)
Received: from mail.corsac.net (unknown [78.194.244.226])
 by smtp2-g21.free.fr (Postfix) with ESMTPS id 1F23920040F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 11:07:05 +0200 (CEST)
Received: from scapa.corsac.net (unknown
 [IPv6:2a01:e34:ec2f:4e20:6af7:28ff:fe8d:2119])
 by mail.corsac.net (Postfix) with ESMTPS id A0DC697
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 11:07:00 +0200 (CEST)
Received: from corsac (uid 1000) (envelope-from corsac@debian.org) id a024a
 by scapa.corsac.net (DragonFly Mail Agent v0.12);
 Fri, 08 May 2020 11:07:00 +0200
Message-ID: <2a05f4c4362d386d298a06a67f2f528ef603a734.camel@debian.org>
Subject: Re: [PATCH] drm/atomic: Take the atomic toys away from X
From: Yves-Alexis Perez <corsac@debian.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Fri, 08 May 2020 11:06:56 +0200
In-Reply-To: <20190905185318.31363-1-daniel.vetter@ffwll.ch>
References: <20190903190642.32588-1-daniel.vetter@ffwll.ch>
 <20190905185318.31363-1-daniel.vetter@ffwll.ch>
User-Agent: Evolution 3.36.2-1 
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 09 May 2020 09:04:57 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Michel =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>, stable@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

On Thu, 2019-09-05 at 20:53 +0200, Daniel Vetter wrote:
> The -modesetting ddx has a totally broken idea of how atomic works:
> - doesn't disable old connectors, assuming they get auto-disable like
>   with the legacy setcrtc
> - assumes ASYNC_FLIP is wired through for the atomic ioctl
> - not a single call to TEST_ONLY
> 
> Iow the implementation is a 1:1 translation of legacy ioctls to
> atomic, which is a) broken b) pointless.
> 
> We already have bugs in both i915 and amdgpu-DC where this prevents us
> from enabling neat features.
> 
> If anyone ever cares about atomic in X we can easily add a new atomic
> level (req->value == 2) for X to get back the shiny toys.
> 
> Since these broken versions of -modesetting have been shipping,
> there's really no other way to get out of this bind.

Hi Daniel and Greg (especially). It seems that this patch was never applied to
stable, maybe it fell through the cracks?

It doesn't apply as-is in 4.19 branch but a small change in the context makes
it apply. I'm experiencing issues with lightdm and vt-switch in Debian Buster
(which has a 4.19 kernel) so I'd appreciate if the patch was included in at
least that release.

Regards,
- -- 
Yves-Alexis
-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8vi34Qgfo83x35gF3rYcyPpXRFsFAl61ITAACgkQ3rYcyPpX
RFvlaAf9HZ0DTX1fAkNeNFoAgn4pFztnFq0fAwGj5iVIL4q6upE1wE3E8cDgUHeT
maQQvL3YHFXjgzgDHYNIuUMipFE1Djymoy+EB4ZoOftqsJ4CPy4pCMUAh57u7BrV
T+eBtj4n0wY0SgvoPism3QdbxY7CLLgCMJKLNrCPlkDCdJyGsZX9RIgfqvbkGM36
ftwBKcyy1iW5cAv10ehiXi/1zszA8bx2gULim3abcSjjz12ckNvBPy/BDvfFx19V
8cGgG3qD9PLmxRl80H1/mX30Ddw8Md5Fu7I/ndh3EGXLu8p8zod0rQVCQjAEW4X4
ew4tajDD2l9vWzN0sZIlyjq9fNgXBw==
=lPBO
-----END PGP SIGNATURE-----
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
