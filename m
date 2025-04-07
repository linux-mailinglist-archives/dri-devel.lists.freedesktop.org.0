Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE3AA7DE86
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 15:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F4710E461;
	Mon,  7 Apr 2025 13:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Eyxdn4Mh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0208610E450;
 Mon,  7 Apr 2025 13:07:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7261B4438D;
 Mon,  7 Apr 2025 13:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C8DC4CEDD;
 Mon,  7 Apr 2025 13:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744031275;
 bh=xWhe7be5o/ojbUteURkl1C2wpnLnMk1jv3KDBCNo/ZY=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=Eyxdn4MhcX6zneXRyK4gH+8366w1qqqWPtZyPSKuGcORR1sQdtzdUz8hB1zVGmww/
 A1fSQN+CPx3GPu7shg62eCQcREJIyCzbWqt4l1qN3sao5i9DFaW1ZDBic7uw9jbNr8
 BaX4b4WWIEA1TjHMPJlUlYIbTv0HbyPyYq3Gkddw5cEFyqCumoItutsBEiNLmhFlUr
 b61NOuhhx0IftjSdlBQWwwPNFe7wjTmrXJcfxpSk4niwv8A1sDS55P1E/A5nQE/Gxd
 PVvqy9Z6tOnSXY6asarx90PnfiWo2zusbaryvwYWNn2s1S4G/nOqKSD3g6K1Q9WYpZ
 NSrB9HrSpCYFA==
Message-ID: <5acd1373-5be9-4d20-a4cd-bb88cf4c767e@kernel.org>
Date: Mon, 7 Apr 2025 15:07:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] rust: alloc: add Vec::resize and Vec::truncate
To: Andrew Ballance <andrewjballance@gmail.com>
References: <20250316111644.154602-1-andrewjballance@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, acourbot@nvidia.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Language: en-US
In-Reply-To: <20250316111644.154602-1-andrewjballance@gmail.com>
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

On 3/16/25 12:16 PM, Andrew Ballance wrote:
> This patch series implements the Vec::truncate and Vec::resize methods
> that were needed by the nova driver and removes the corresponding item
> from their task list
> 
> changes in v2:
>   - updated safety comments
>   - fixed rustdoc comment spacing
>   - reworded commit messages to be imperative
>   - Link to v1: https://lore.kernel.org/rust-for-linux/20250315024235.5282-1-andrewjballance@gmail.com/
> 
> Andrew Ballance (3):
>    rust: alloc: add Vec::truncate method
>    rust: alloc: add Vec::resize method

With the following changes, applied to rust/alloc-next, thanks!

   - Rewrote safety comment of set_len().
   - Use checked_sub(), as suggested by Tamir.

>    gpu: nova-core: remove completed Vec extentions from task list

Applied to nova-next, thanks!

>   Documentation/gpu/nova/core/todo.rst | 10 -----
>   rust/kernel/alloc/kvec.rs            | 62 ++++++++++++++++++++++++++++
>   2 files changed, 62 insertions(+), 10 deletions(-)
> 
