Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB4AB3161F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 13:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829D310EAC2;
	Fri, 22 Aug 2025 11:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="h03m3uah";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583D310EAC5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 11:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755860980;
 bh=/ioH/M3LDzYpNRt8BKiYOZNGO079fVuLd2eOZHrZ6fM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h03m3uah3VnzQJtdD5OKKtM9gkO3j0+7d5zNOStpGKJW6Px20P8cahvl12s1YgPew
 2F5EfFJ0T+fmfQNmQxp/1ggZtN7pM/ctnXsfH/yD3k6YvhBdyICPQqI1Vy0Sd+9xlv
 YT81dDGsvvNaD7PfueyqmqnkYzU+RpNQrmwmKoKIjmsXF922AlUMEc6oH7hDgOXhoH
 qh2uW/HMdoHhSw3+p5SZpWIZeAJCo0pCEt0+/fft0xUoTq+rBaBT/4aBiDd50sxKEA
 t3G95PRWjm12Hhy7bNbC81iRUphv41b7EmfOyBgQ5lyFaX6+YexBxml6C6UbNRMRTA
 02F86oRzp+Xnw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2F2BC17E0DE3;
 Fri, 22 Aug 2025 13:09:39 +0200 (CEST)
Date: Fri, 22 Aug 2025 13:09:33 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, "=?UTF-8?B?QmrDtnJu?= Roy Baron"
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm_gem: add mutex to drm_gem_object.gpuva
Message-ID: <20250822130933.50bf1746@fedora>
In-Reply-To: <aKhNFn7hdsLapLWO@google.com>
References: <20250822-gpuva-mutex-in-gem-v2-0-c41a10d1d3b9@google.com>
 <20250822-gpuva-mutex-in-gem-v2-1-c41a10d1d3b9@google.com>
 <20250822115221.24fffc2c@fedora> <aKhNFn7hdsLapLWO@google.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 22 Aug 2025 10:57:26 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Fri, Aug 22, 2025 at 11:52:21AM +0200, Boris Brezillon wrote:
> > On Fri, 22 Aug 2025 09:28:24 +0000
> > 
> > Maybe it's time we start moving some bits of the gpuva field docs next
> > to the fields they describe:
> > 
> > 	/**
> > 	 * @gpuva: Fields used by GPUVM to manage mappings pointing to this GEM object.
> > 	 */
> > 	struct {
> > 		/**
> > 		 * @gpuva.list: list of GPU VAs attached to this GEM object.
> > 		 *
> > 		 * Drivers should lock list accesses with the GEMs &dma_resv lock
> > 		 * (&drm_gem_object.resv) or &drm_gem_object.gpuva.lock if the
> > 		 * list is being updated in places where the resv lock can't be
> > 		 * acquired (fence signalling path).
> > 		 */
> > 		struct list_head list;  
> 
> This isn't a new issue, but it's somewhat confusing to call it a list of
> VAs when it's a list of vm_bos.

Yep, that's true.

> 
> > 		/**
> > 		 * @gpuva.lock: lock protecting access to &drm_gem_object.gpuva.list
> > 		 * when the resv lock can't be used.
> > 		 *
> > 		 * Should only be used when the VM is being modified in a fence
> > 		 * signalling path, otherwise you should use &drm_gem_object.resv to
> > 		 * protect accesses to &drm_gem_object.gpuva.list.
> > 		 */
> > 		struct mutex lock;
> > 
> > 		...
> > 	};
> >   
> 
> Alice

