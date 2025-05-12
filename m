Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F03AB4559
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 22:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B301E10E46A;
	Mon, 12 May 2025 20:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f24Md++a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C94B10E46A;
 Mon, 12 May 2025 20:07:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6B530A4C8BA;
 Mon, 12 May 2025 20:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3828C4CEE7;
 Mon, 12 May 2025 20:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747080457;
 bh=Az4ibXiBakDxOB/LA6OaUS+wvOTTZFFucoLFx2LzIag=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=f24Md++aQzEQfOEm96/rYw7SthZNEh2UBcHOBy4HSkJeILcPVetuY/eQlWUGfZGLi
 UCmBc554nVfbXefiHzddrpkAKkGxxlW3Vkruj96EVb5aBVrjf8FV//hijvQgauRkpa
 SYuBBJlCg+9IDSjtOKtyICE8RaB2A7xUFM3K4EkgItlNofzJD8bc2M8KQejyuW4ttd
 /ecCmjUQJ2QnAAy2UUpfy4wVdpdoSFjgqmP23xUoct9Qw+QyU7T+00rIVqaxEbOm+b
 SG4aIVoNwBMESSgux1qRwhIdG9UiXf1qKh6lsUVUGbfpNa9luyaU8BAAHCTDjF3BHv
 60jLvXnJrlfGQ==
Date: Mon, 12 May 2025 15:07:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, gregkh@linuxfoundation.org, rafael@kernel.org,
 bhelgaas@google.com, kwilczynski@kernel.org, raag.jadav@intel.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, me@kloenk.dev,
 fujita.tomonori@gmail.com, daniel.almeida@collabora.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH 02/11] rust: io: Replace Io with MMIo using IoAccess trait
Message-ID: <20250512200734.GA1120867@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509031524.2604087-3-andrewjballance@gmail.com>
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

On Thu, May 08, 2025 at 10:15:15PM -0500, Andrew Ballance wrote:
> From: Fiona Behrens <me@kloenk.dev>
> 
> Replace the Io struct with a new MMIo struct that uses the different
> traits (`IoAccess`, `IoAccess64`, `IoAccessRelaxed` and
> `IoAccess64Relaxed).
> This allows to later implement PortIo and a generic Io framework.

Add blank line between paragraphs.

> +    /// Read data from a give offset known at compile time.

s/give/given/

> +    /// Bound checks are perfomed on compile time, hence if the offset is not known at compile
> +    /// time, the build will fail.

s/perfomed on/performed at/

> +    /// Bound checks are performed on runtime, it fails if the offset (plus type size) is
> +    /// out of bounds.

s/on runtime/at runtime/

> +/// This Takes either `@read` or `@write` to generate a single read or write accessor function.

s/This Takes/This takes/
