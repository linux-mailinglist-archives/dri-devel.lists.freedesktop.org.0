Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A15FDC71B48
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 02:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B62C10E289;
	Thu, 20 Nov 2025 01:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uF2z7xSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A1110E289;
 Thu, 20 Nov 2025 01:47:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E650E43A3A;
 Thu, 20 Nov 2025 01:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC38C113D0;
 Thu, 20 Nov 2025 01:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763603258;
 bh=Qz0Kt9BVZotF+W8b8C03wV9uEpjzU2IZVkSaOcZVd50=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uF2z7xSsJBEF2o7jOCGEA8BICVnf2Ll7GN/YdEoLbs8PaQeAHioKS/o3SZ7QSxsKt
 vFnjbh6TICH8PLye1zHlHKdpzDE5Fm345e4L/w0hg/fEJ7Itp2slYgup6C6JZwwIym
 LLCi+QyeEmLY48F4L7ZzcbTStdyHeEENY8Hfnp0DqQrXSF5r2MrZk7t4OMHkvbN7PR
 8Qcsuc8hp1q4+vdSlLZQjWoYyrPh5U9WhuFsg9TNqdi8dNwuUtBQRxPyNJujXI9VwL
 mc5s7M6miwKRs2zV2Elwkq7lUfoGg+X1KHfkkxDDXD+SynQUk6oIGjhckD0gmUEmi4
 nBJOVjtHwyLhA==
Date: Wed, 19 Nov 2025 17:47:34 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: david.laight.linux@gmail.com
Cc: linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Alexei Starovoitov
 <ast@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Andreas Dilger
 <adilger.kernel@dilger.ca>, Andrew Lunn <andrew@lunn.ch>, Andrew Morton
 <akpm@linux-foundation.org>, Andrii Nakryiko <andrii@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Ard Biesheuvel
 <ardb@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, Borislav Petkov <bp@alien8.de>, Christian
 Brauner <brauner@kernel.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Christoph Hellwig <hch@lst.de>, Daniel Borkmann
 <daniel@iogearbox.net>, Dan Williams <dan.j.williams@intel.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, Dave Jiang <dave.jiang@intel.com>,
 David Ahern <dsahern@kernel.org>, David Hildenbrand <david@redhat.com>,
 Davidlohr Bueso <dave@stgolabs.net>, "David S. Miller"
 <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Eric Dumazet
 <edumazet@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@redhat.com>,
 Jakub Sitnicki <jakub@cloudflare.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Jarkko Sakkinen
 <jarkko@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Jens Axboe
 <axboe@kernel.dk>, Jiri Slaby <jirislaby@kernel.org>, Johannes Weiner
 <hannes@cmpxchg.org>, John Allen <john.allen@amd.com>, Jonathan Cameron
 <jonathan.cameron@huawei.com>, Juergen Gross <jgross@suse.com>, Kees Cook
 <kees@kernel.org>, KP Singh <kpsingh@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Mika Westerberg <westeri@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Namhyung Kim
 <namhyung@kernel.org>, Neal Cardwell <ncardwell@google.com>,
 nic_swsd@realtek.com, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Olivia
 Mackall <olivia@selenic.com>, Paolo Abeni <pabeni@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Peter Huewe <peterhuewe@gmx.de>, Peter
 Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Sean Christopherson <seanjc@google.com>, Srinivas Kandagatla
 <srini@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>, "Theodore Ts'o"
 <tytso@mit.edu>, Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky
 <thomas.lendacky@amd.com>, Willem de Bruijn
 <willemdebruijn.kernel@gmail.com>, x86@kernel.org, Yury Norov
 <yury.norov@gmail.com>, amd-gfx@lists.freedesktop.org, bpf@vger.kernel.org,
 cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org,
 io-uring@vger.kernel.org, kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-mm@kvack.org,
 linux-nvme@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, mptcp@lists.linux.dev, netdev@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH 00/44] Change a lot of min_t() that might mask high bits
Message-ID: <20251119174734.5cba3f95@kernel.org>
In-Reply-To: <20251119224140.8616-1-david.laight.linux@gmail.com>
References: <20251119224140.8616-1-david.laight.linux@gmail.com>
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

On Wed, 19 Nov 2025 22:40:56 +0000 david.laight.linux@gmail.com wrote:
> I've had to trim the 124 maintainers/lists that get_maintainer.pl finds
> from 124 to under 100 to be able to send the cover letter.
> The individual patches only go to the addresses found for the associated files.
> That reduces the number of emails to a less unsane number.

Please split the networking (9?) patches out to a separate series.
It will help you with the CC list, and help us to get this applied..
