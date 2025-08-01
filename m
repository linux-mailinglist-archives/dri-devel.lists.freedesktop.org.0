Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CA9B17EEE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 11:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FCE10E811;
	Fri,  1 Aug 2025 09:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="brDKZSvx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2D010E811
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 09:13:19 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-458a533c069so4684645e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 02:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1754039598; x=1754644398;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=qIrCn5ChfjSuaaWKanoGK+49bYqdvqeTL1wiMqtLeRI=;
 b=brDKZSvxUppNDrQhsYY38v/xOxMQt64ZCBqZa9Jt6kBFYQ7NJGWRtRknE9DJYZbL7x
 Ot4WVaeJ6pzvYEOjL+ZfHrP3H8hW0dcvLfNaiYuJw4+eV5U9yOicYl8WSeBeUvEdaQTt
 O9YA3mOGt0sQb6nY9dS+j1pbBf7D/rghmIF2GjbieC+9BmmIFLVmcGLKjWeASLfpTyX2
 mk933ZSBjgYNdLNMsr6FZEmbR4Is+2gdRItazxP+WKE/PF1sz9BUcxkbDA+qzPvXHSD2
 7ckhpFKRVDmc68XTTog7ra0b+9j2Q1z2mAU2oE9Cvp4aAmBR5zzfNUWUiiFsDaXPJQor
 ZZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754039598; x=1754644398;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qIrCn5ChfjSuaaWKanoGK+49bYqdvqeTL1wiMqtLeRI=;
 b=tJAuT28M4OiTAz9S5sUws4qWC3mKqeqeMV5ZkDv1uJSV8JdrKmBUvNgsMRELOZxo3u
 XpXSTN/Fi7qgPm/klSJSekoI2r1FUUoiu8Leevw5TbNhytVboxe7KrH5DIJIxh68Iyuf
 ncpn3QU1oxZJNU0stlwdaV6q9R63wKjEo0ZpwMYATJHZOWEDfXTPL+aGMZoW++0T2SJJ
 XjGeNR69/PUB9upq9L8pNyUi8kikLO3DrbdnqaE7IihWwRU7bfUTDxsl7cBhG4qE7btC
 r869UUNqC48oC/H0A3GGErL68ttlz9OqZ5MJU3GUfcUbk8drn/+rEig6dAMeQNWHI8tO
 x+xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXnf+Nk4EufMH9U6IK0bCfgY69/fTJ1MpmFk83a4Ig7llg7tiDil6/pSI4ikwQjNFF940vRGecgK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjSTbKipwgRdJfcRH6zeYV8EgIrBNvCmfG/fQFaH/ZkINQZITJ
 AKz6c+9KFjxMPZzhvL/nStooMx3+MW1P27MuvThAFn24EyTuqLmQ5tIKXhIuSqLSzNeuOynPX4w
 gZd+VEEnLlRNHfGDPlQ==
X-Google-Smtp-Source: AGHT+IGjjOW9Oot2bFj3PWG3PB/y8G0bJgwiY7qUCIY2PFZOfhA37fiaHW8yWyvMMhKKK1+HLzZXKQmndCci3yU=
X-Received: from wmbgw8.prod.google.com ([2002:a05:600c:8508:b0:451:d768:b11d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46d0:b0:456:28d4:ef1 with SMTP id
 5b1f17b1804b1-45892bdff7bmr94283905e9.29.1754039597687; 
 Fri, 01 Aug 2025 02:13:17 -0700 (PDT)
Date: Fri, 1 Aug 2025 09:13:16 +0000
In-Reply-To: <20250731154919.4132-5-dakr@kernel.org>
Mime-Version: 1.0
References: <20250731154919.4132-1-dakr@kernel.org>
 <20250731154919.4132-5-dakr@kernel.org>
Message-ID: <aIyFLDvb2kGoiWW9@google.com>
Subject: Re: [PATCH 4/4] rust: drm: don't pass the address of drm::Device to
 drm_dev_put()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
 urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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

On Thu, Jul 31, 2025 at 05:48:09PM +0200, Danilo Krummrich wrote:
> In drm_dev_put() call in AlwaysRefCounted::dec_ref() we rely on struct
> drm_device to be the first field in drm::Device, whereas everywhere
> else we correctly obtain the address of the actual struct drm_device.
> 
> Analogous to the from_drm_device() helper, provide the
> into_drm_device() helper in order to address this.
> 
> Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> +    /// # Safety
> +    ///
> +    /// `ptr` must be a valid pointer to `Self`.
> +    unsafe fn into_drm_device(ptr: NonNull<Self>) -> *mut bindings::drm_device {
> +        // SAFETY: By the safety requirements of this function, `ptr` is a valid pointer to `Self`.
> +        unsafe { &raw mut (*ptr.as_ptr()).dev }.cast()
> +    }

I think it would somewhat more consistent to use the naming raw_get() or
cast_into(), but I am ok with this naming too.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
