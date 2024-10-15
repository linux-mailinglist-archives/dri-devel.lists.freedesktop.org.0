Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CA499E476
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 12:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFB010E567;
	Tue, 15 Oct 2024 10:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="JgdiIG11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2458710E567
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 10:47:15 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4XSW4v3SfGz9tM8;
 Tue, 15 Oct 2024 12:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1728989231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zNvT+iVmdZpp8gY6AFMUKaKzKZ+fcMEWk1tBfKmtOD8=;
 b=JgdiIG11Zsz5xt69PR9KrWkkaP/RD/+z1s/YCa7rerJCspNfbrWrvtaOhtp8PjkjMLSj8h
 5tNDRb1c7XDzLb2c6sx3W0yzSvkeyYQyDDliKLBmZ3d698dPR4hejazJoCtmhlZo3FBE/E
 4vmwDL7HHKzFYrsRV54terlMGXzz95FTtFTlgu4kHrHQ8+djYWcbfQpE7hUKlotXoI/RR9
 Hj2ipFb4JtksG88xmROMkAbQt1XIDFOb6+sh0ZyprlSxJjTfi/J6aMUCeges1i9ddkboA9
 Q/vhrok79Eqn87NCVZydt/abDWEi5WgWF4UUP/BsnZMPSwNZqAls/FgtQEBq+Q==
Message-ID: <a55560b2-288f-48a5-ba79-8074e61f13fc@mailbox.org>
Date: Tue, 15 Oct 2024 12:47:08 +0200
MIME-Version: 1.0
Subject: Re: [RFC PATCH] drm/prime: introduce DRM_PRIME_FD_TO_HANDLE_NO_MOVE
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Austin Shafer <ashafer@nvidia.com>
References: <20241013133431.1356874-1-contact@emersion.fr>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA, de-CH-frami
In-Reply-To: <20241013133431.1356874-1-contact@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c6ae83dd54f26e872eb
X-MBO-RS-META: jnfrj1x659azynhgm5dxjpiyccrsae65
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

On 2024-10-13 15:34, Simon Ser wrote:
> This is a flag to opt-out of the automagic buffer migration to
> system memory when importing a DMA-BUF.
> 
> In multi-GPU scenarii, a Wayland client might allocate on any
> device. The Wayland compositor receiving the DMA-BUF has no clue
> where the buffer has been allocated from. The compositor will
> typically try to import the buffer into its "primary" device,
> although it would be capable of importing into any DRM device.
> 
> This causes issues in case buffer imports implicitly result in
> the buffer being moved to system memory. For instance, on a
> system with an Intel iGPU and an AMD dGPU, a client rendering
> with the dGPU and whose window is displayed on a screen
> connected to the dGPU would ideally not need any roundtrip
> to the iGPU. However, any attempt at figuring out where the
> DMA-BUF could be accessed from will move the buffer into system
> memory, degrading performance for the rest of the lifetime of the
> buffer.
> 
> Describing on which device the buffer has been allocated on is
> not enough: on some setups the buffer may have been allocated on
> one device but may still be directly accessible without any move
> on another device. For instance, on a split render/display system,
> a buffer allocated on the display device can be directly rendered
> to from the render device.
> 
> With this new flag, a compositor can try to import on all DRM
> devices without any side effects. If it finds a device which can
> access the buffer without a move, it can use that device to render
> the buffer. If it doesn't, it can fallback to the previous
> behavior: try to import without the flag to the "primary" device,
> knowing this could result in a move to system memory.

One problem with this approach is that even if a buffer is originally created in / intended for local VRAM of a dGPU, it may get temporarily migrated to system RAM for other reasons, e.g. to make room for other buffers in VRAM. While it resides in system RAM, importing into another device with DRM_PRIME_FD_TO_HANDLE_NO_MOVE will work, but will result in pinning the buffer to system RAM, even though this isn't optimal for the intended buffer usage.

In other words, the new flag only gives the compositor information about the current state, not about the intention of the client. Another mechanism like https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/268 is needed for the latter.

So while this flag might be useful to prevent unintended buffer migration in some cases, it can't solve all multi-GPU issues for compositors.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
