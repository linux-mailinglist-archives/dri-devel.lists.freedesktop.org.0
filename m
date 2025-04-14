Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE2A884CF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 16:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F4A10E5F7;
	Mon, 14 Apr 2025 14:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="HBDCWl8b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A40310E5F7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 14:28:19 +0000 (UTC)
Date: Mon, 14 Apr 2025 10:28:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1744640894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cTMsjF9n6SoguO4hT2u+FJPG/CrTB5dYj5Tjoq5pP5Q=;
 b=HBDCWl8b4iQC38u4cxkalj3ddFDWK6bptFswxab02B1OhvHHhoJVxaiBqbat7tLoI72AAa
 /bqi6Aq/07REfSHWZfbgoG9Bk/x7agbd1k+WLaKUhBTTMS4IUYpL5nnb8WUbIGN5/AwQsW
 oVgQawJOU1KP9RRp9uAu9W+dR6lT7/3pqnx/1+udddRnlAmmHIJx1b/zx7i459RjffjAUJ
 hl72DAClTTxCKJZAOJkCVKBFPznAKkHeL+d+kK65Lyl9bFZE8LWEaepprypMTIAwS4/gFS
 9wt+/rNMaMLceP7PhHFVVmW2UqV0fRu60ICEH9ApmU9rZwtPlF3fvl2mhCluTQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 6/8] rust: drm: file: Add File abstraction
Message-ID: <Z_0bdrn14D-g8kr0@blossom>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-7-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410235546.43736-7-dakr@kernel.org>
X-Migadu-Flow: FLOW_OUT
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

> +        // SAFETY: A callback from `struct drm_driver::open` guarantees that
> +        // - `raw_dev` is valid pointer to a `sturct drm_device`

struct

> +        // - the corresponding `sturct drm_device` has been registered.

struct


> +        // SAFETY: `raw_file` valid pointer to a `struct drm_file`.

`raw_file` is a valid pointer..

With those comments fixed, this is

   Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

---

Tangential food-for-thought: might be possible to introduce a helper to
kernel::error::Result to make the error handling here more
ergonomic, but I don't know what that would look like exactly.
