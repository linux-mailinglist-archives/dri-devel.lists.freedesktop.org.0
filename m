Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57973738C55
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96E410E335;
	Wed, 21 Jun 2023 16:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67F010E335
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 16:52:04 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 357776606F9B;
 Wed, 21 Jun 2023 17:52:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687366322;
 bh=Mm+AdwIw6r6mj9p2xBMgcytj5fGgNRK5P0AFu32aBcE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XxXJrPDXHYDdwrg+PXAIGXydRrnho3YUy4H63fkl3LJpthymz+xpDxYhUK8rvEGih
 /BeDwLrQLVYf4TkNlzimzvBoFi07iFFCAKISSlBnK4VLWDLipL9l90XOCFKuTw6YCa
 fao+g0dKfat29bFCIRoZEtyfXo3bAT9Dw4hBYsKNiT2fRzebOb17RyNo5IWkCHC+ZN
 q6nRCj3n+xqNjwPtab1T2ZJFqu0xFNgI1PDegLsqDYmR6rAX06bmCsFHIhpTcdA6L/
 JiCDksaQgGz7i2fFXy76D3HW8qPHr9gSYWr7DTCX7LJJrNZfMecxarNvUEepp21D3u
 77K3x3orm06YA==
Date: Wed, 21 Jun 2023 18:51:59 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Christian =?UTF-8?B?S8O2bmln?=" <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/2] drm: execution context for GEM buffers v5
Message-ID: <20230621185159.29a1fcc7@collabora.com>
In-Reply-To: <20230621133700.7588-1-christian.koenig@amd.com>
References: <20230621133700.7588-1-christian.koenig@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: thomas_os@shipmail.org, dakr@redhat.com, dri-devel@lists.freedesktop.org,
 arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Jun 2023 15:36:59 +0200
"Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com> wrote:

> +/**
> + * drm_exec_until_all_locked - loop until all GEM objects are locked
> + * @exec: drm_exec object
> + *
> + * Core functionality of the drm_exec object. Loops until all GEM object=
s are
> + * locked and no more contention exists. At the beginning of the loop it=
 is
> + * guaranteed that no GEM object is locked.
> + *
> + * Since labels can't be defined local to the loops body we use a jump p=
ointer
> + * to make sure that the retry is only used from within the loops body.
> + */
> +#define drm_exec_until_all_locked(exec)				\
> +	for (void *__drm_exec_retry_ptr; ({			\
> +		__label__ __drm_exec_retry;			\

The warning reported by the bot on 'drm: add drm_exec selftests v4'
should be fixed with a

		goto __drm_exec_retry;

placed here.

> +__drm_exec_retry:						\
> +		__drm_exec_retry_ptr =3D &&__drm_exec_retry;	\
> +		drm_exec_cleanup(exec);				\
> +	});)
