Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BA4B1614E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 15:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E3810E218;
	Wed, 30 Jul 2025 13:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YfSDoW1j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4401C10E218
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 13:20:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 229D5A55386;
 Wed, 30 Jul 2025 13:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37633C4CEE7;
 Wed, 30 Jul 2025 13:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753881602;
 bh=cOO1xhRqZ8XZW6yqb6BZzWz/lptf3wacbOSwwmrYTuA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YfSDoW1jPucwD+cjfbmUf38swxuoayr4/wTnG3dN5IX0OoXIonPGWp3+tDTQjVTR7
 AeSE1mHW4V4KtlLArMVbZfEHT1Y2oH6bb4CItIRgX2ISlHw3JsMrci/G7+rgLBwfwO
 V2Jy0Q6kdrPyM20rXBxDhdYeJdWStdhtnRW2/KMAQMZQ0w4SAmTVnDIbN3hUp+d2/H
 uM65tFZnnhtoVWOZ/sLcyIZxCAV8PrYtg3cnIqS6jLBm0U2fdhmEX1ncXL/u+cKqOx
 5DAWpQdEAtb17+PlTPc28yavLWTQ60uuPgL74jJ6M160oi4++z6uqLnsHWRnDjWHTH
 wOUZiFsBWBzmg==
Message-ID: <ca886ee3-3c26-403e-bba7-33eddd5eb96a@kernel.org>
Date: Wed, 30 Jul 2025 15:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rust: drm: fix `srctree/` links
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 linux-block@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <20250730130716.3278285-1-ojeda@kernel.org>
 <20250730130716.3278285-3-ojeda@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250730130716.3278285-3-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 7/30/25 3:07 PM, Miguel Ojeda wrote:
> These `srctree/` links pointed inside `linux/`, but they are directly
> under `drm/`.
> 
> Thus fix them.
> 
> This cleans a future warning that will check our `srctree/` links.
> 
> Fixes: a98a73be9ee9 ("rust: drm: file: Add File abstraction")
> Fixes: c284d3e42338 ("rust: drm: gem: Add GEM object abstraction")
> Fixes: 07c9016085f9 ("rust: drm: add driver abstractions")
> Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
> Fixes: 9a69570682b1 ("rust: drm: ioctl: Add DRM ioctl abstraction")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Good catch!

Acked-by: Danilo Krummrich <dakr@kernel.org>
