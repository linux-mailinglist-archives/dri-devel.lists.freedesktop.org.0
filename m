Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DD2ADAB6B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 11:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DDF10E2ED;
	Mon, 16 Jun 2025 09:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vCCjnVs1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3C910E2F4;
 Mon, 16 Jun 2025 09:04:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 516C4A51651;
 Mon, 16 Jun 2025 09:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7566C4CEEA;
 Mon, 16 Jun 2025 09:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750064655;
 bh=0cC6uUPoW8D1ceNhr+gzB+r6cQqyjYO+BddOkail6Jg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vCCjnVs15JhLr+gkD0415uzKKH65zw2YauahA6dRUAPnpTJy+lPsBQ6ucpj7PZf0N
 vvkhTkiUXBcywJwff0Ncy4b2zFm0yVpVGV7GiQuquOXqrE8cfvYNHeHu6FGWeHja/x
 rfJWVhb++gX0S2D9XIaUSle/unVj5pwTs1H3JrDm2IZdLO9fPHfwRLNxEvmC6xRKl0
 lR8bJSr2kBTAqCOF6bvWtcySDjgslavLj1rC0+8r3MbFhjezmcdlaPYgmL6J/AUDln
 bGUrLl7+vAMzJmABMvhYZUPclEUIhdfWrZ2jA9D3eDwjPsKI+PbGyr/WDrHMIoeExR
 bGrh9zQ+C8llA==
Message-ID: <92df9bdd-734b-461c-bf98-070e4fc59d50@kernel.org>
Date: Mon, 16 Jun 2025 11:04:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] rust: add support for port io
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrew Ballance <andrewjballance@gmail.com>, a.hindborg@kernel.org,
 airlied@gmail.com, akpm@linux-foundation.org, alex.gaynor@gmail.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, benno.lossin@proton.me,
 bhelgaas@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 daniel.almeida@collabora.com, fujita.tomonori@gmail.com, gary@garyguo.net,
 gregkh@linuxfoundation.org, kwilczynski@kernel.org, me@kloenk.dev,
 ojeda@kernel.org, raag.jadav@intel.com, rafael@kernel.org, simona@ffwll.ch,
 tmgross@umich.edu, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20250514105734.3898411-1-andrewjballance@gmail.com>
 <CAH5fLgjgtLQMaAZxufttzoVCJpAfTifn6VWwKZ7Q6vAOOvG+ug@mail.gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <CAH5fLgjgtLQMaAZxufttzoVCJpAfTifn6VWwKZ7Q6vAOOvG+ug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 6/16/25 10:03 AM, Alice Ryhl wrote:
> On Wed, May 14, 2025 at 12:58 PM Andrew Ballance
> <andrewjballance@gmail.com> wrote:
>>
>> currently the rust `Io` type maps to the c read{b, w, l, q}/write{b, w, l, q}
>> functions and have no support for port io. this can be a problem for pci::Bar
>> because the pointer returned by pci_iomap can be either PIO or MMIO [0].
>>
>> this patch series splits the `Io` type into `Io`, and `MMIo`. `Io` can be
>> used to access PIO or MMIO. `MMIo` can only access memory mapped IO but
>> might, depending on the arch, be faster than `Io`. and updates pci::Bar,
>> so that it is generic over Io and, a user can optionally give a compile
>> time hint about the type of io.
>>
>> Link: https://docs.kernel.org/6.11/driver-api/pci/pci.html#c.pci_iomap [0]
> 
> This series seems to try and solve parts of the same problems as
> Daniel's patchset:
> https://lore.kernel.org/rust-for-linux/20250603-topics-tyr-platform_iomem-v9-0-a27e04157e3e@collabora.com/#r
> 
> We should probably align these two patchsets so that they do not add
> incompatible abstractions for the same thing.

AFAICS, they solve different problems, i.e.

   1) Add Port I/O support to the generic I/O abstractions.
   2) Add an abstraction for generic ioremap() used to map a struct resource
      obtained from a platform device.

The patch series will conflict though, I think it would be best to rebase this
one onto Daniel's patch series, since it is close to land.
