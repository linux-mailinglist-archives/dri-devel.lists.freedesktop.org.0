Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83409C3841A
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 23:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB4010E039;
	Wed,  5 Nov 2025 22:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ko6QX8fG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CD510E039;
 Wed,  5 Nov 2025 22:50:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 555C260222;
 Wed,  5 Nov 2025 22:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753FCC4CEF5;
 Wed,  5 Nov 2025 22:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762383022;
 bh=c9L/RmDqSZRKJS2TMpxVfqovIdx6B5TNr/pdfh5cdqc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ko6QX8fGTbZdDbsAdNEraj6h2EoNR6BCxSbXlQ9/DPy/N+czbDKQ6P3z7rnB/0O/q
 kkYKAZArqOYgQhqQuCI6gfTjwReggUKPEfQ8HjSmzatt2XfOejRIkZsBks4CphCPx0
 AS8PhSOLDjZN61AdpHIhIR9oTl2iR47O9KwAEqOvypJMVDgIijDgoOJZ1mvFqYZclE
 TUwuXgT9SMQZKI3QCawZGAJ1XL+eTfP8koLB79JxJtBoO+rq5U+T9/AKKdN68ohu1a
 gy17/moLB0aGONN9iwXAZS1ZTyOpjV9C3ktzyLVdPNvDN0Ce5Svufgzf5Vxh1nD90l
 pZMWXG3hdaeUA==
Message-ID: <4d07932e-8b53-4ee3-8d08-6f49d433f005@kernel.org>
Date: Wed, 5 Nov 2025 23:50:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] drm/nouveau/uvmm: Allow larger pages
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Cc: James Jones <jajones@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, Lyude Paul
 <lyude@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org
References: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
 <20251031104924.10631-3-mohamedahmedegypt2001@gmail.com>
 <0bffd718-3659-4add-90fc-fb0e098f2897@nvidia.com>
 <CAA+WOBtmbPHigscFQCFgDo=9WSM6V-JMXGCO7orP=01XOqTPHQ@mail.gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <CAA+WOBtmbPHigscFQCFgDo=9WSM6V-JMXGCO7orP=01XOqTPHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 11/4/25 12:53 AM, Mohamed Ahmed wrote:
> Thanks a lot for the shout out! Looking more at things, the logic here
> is actually redundant. It was originally copied over directly from the
> bo allocation code to stay on the safer side (basically the idea back
> then was to make both the bo and vmm sides match exactly). We aren't
> at risk of having an aligned address that is in the wrong memory type
> because the bo allocation code (nouveau_bo.c:321) forces anything that
> has the GART flag to have a page size of 4K. Anything getting a page
> size higher than that is exclusively VRAM only. Additionally,
> currently things marked VRAM only don't get evicted to host memory
> except under high memory pressure and in that case, the context is
> paused until the objects in question are paged back in, so we also
> don't have to worry about memory placement there.
> 
> The memory placement check in the vmm code could be removed but I am
> leaning more towards leaving it as is just to stay on the safer side.

If it is not necessary, please remove it. We should not carry dead code.

> At the same time, it would be more useful to keep it for the future as
> one of the future investigation targets that we want to look into is
> all the memory placement rules because the "only 4K is allowed for
> host memory" limit that nouveau imposes is a source of many pains in
> userspace (originally thought to be a HW thing but seems it's actually
> not), and having the checks on both bo and vmm paths would help
> starting out with that.

Please don't top-post, see also [1].

[1] https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying
