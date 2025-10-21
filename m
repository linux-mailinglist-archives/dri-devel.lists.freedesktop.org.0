Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93438BF4CE6
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 09:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213F410E2CC;
	Tue, 21 Oct 2025 07:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZNu8cu//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B4F10E2CC;
 Tue, 21 Oct 2025 07:05:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E0B38622A4;
 Tue, 21 Oct 2025 07:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D37C4CEF1;
 Tue, 21 Oct 2025 07:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1761030312;
 bh=EHsArdqsSEWKKduqFrtczKcUKMzzz51C1h76mpGhFlI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZNu8cu//JZ3YSlADe6H2B3e7usY12xgSqfAc3mg2b5zvqETI5nUwHrUobxPs7mXl3
 45+TBlX7GQaS6dUndczNC7kpv1R2BdyQDQKVSM7Qeb6bFRBHRyM6JtsZFHSf1VNlTq
 QuztdY+ldB1r4hU/DHMNlvjk0Ola2/kZ1++13Ydc=
Date: Tue, 21 Oct 2025 09:05:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, acourbot@nvidia.com,
 ira.weiny@intel.com, leon@kernel.org, daniel.almeida@collabora.com,
 bhelgaas@google.com, kwilczynski@kernel.org,
 abdiel.janulgue@gmail.com, robin.murphy@arm.com, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: driver: let probe() return impl PinInit<Self, Error>
Message-ID: <2025102158-tissue-goal-77ba@gregkh>
References: <20251016125544.15559-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016125544.15559-1-dakr@kernel.org>
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

On Thu, Oct 16, 2025 at 02:55:28PM +0200, Danilo Krummrich wrote:
> The driver model defines the lifetime of the private data stored in (and
> owned by) a bus device to be valid from when the driver is bound to a
> device (i.e. from successful probe()) until the driver is unbound from
> the device.
> 
> This is already taken care of by the Rust implementation of the driver
> model. However, we still ask drivers to return a Result<Pin<KBox<Self>>>
> from probe().
> 
> Unlike in C, where we do not have the concept of initializers, but
> rather deal with uninitialized memory, drivers can just return an
> impl PinInit<Self, Error> instead.
> 
> This contributed to more clarity to the fact that a driver returns it's
> device private data in probe() and the Rust driver model owns the data,
> manages the lifetime and - considering the lifetime - provides (safe)
> accessors for the driver.
> 
> Hence, let probe() functions return an impl PinInit<Self, Error> instead
> of Result<Pin<KBox<Self>>>.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> Depends on a minor pin-init patch [1] (Benno will send it to the list
> soon). A branch with this patch and the pin-init dependency is available
> in [2].
> 
> [1] https://github.com/Rust-for-Linux/pin-init/pull/86/commits
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=probe_return

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
