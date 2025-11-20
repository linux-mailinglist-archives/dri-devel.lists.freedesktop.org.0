Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E20FDC74A95
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 15:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0939810E761;
	Thu, 20 Nov 2025 14:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="JrUOINTS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4BA10E763
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 14:52:48 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-43476cba770so4317505ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 06:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1763650367; x=1764255167;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mIp1emodWmrQX+c6TjoXmEBGWcecINECr9nK+dGHBUw=;
 b=JrUOINTSppNhoQhfX8k5syViccp3259yTxwk6ESjnwwTGWo+zCVh5Q5uru8gOo05MP
 E4wTlNeBb4F+6CK4uXm+lkS2b6vVrKRGPppQnSUoiuEMFlwEb7m05J5gjIsTDPNPunCC
 oY8Sm+3eeeq3FzZj8eRbLg4uWmMfhEHZNRXchbVKZ5q5lpDnjgK/Gi4Lbi8aGBEOGLI/
 YiHyXmk88PBRjKMzLH2syDRrgiZ3xoA1vV14frmqjnnNq6Ci2jzF7sYUQ3RWJqEp+/1C
 g8fzqYXu4vWqBOAqmoXSXxm23JeWxTlaNhVUaA5FyL8mSH2zIVciMf2GBUgEB3czdAUA
 FLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763650367; x=1764255167;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mIp1emodWmrQX+c6TjoXmEBGWcecINECr9nK+dGHBUw=;
 b=vMZQkph2fJc5zY1XJ5jKiLn/Y4V7fNhuj22I0c1TIctF9AxEyQJHlL8d8ixDAnErDU
 f8cRK/Or5oyoFCIEMY8uE7+Iqg52gYvfgHmJ3Scy2diK6xjQBK3hfY5J3MnNJhaksy7e
 SlwtbwgXARN4/6mJMt/4g0lVlrScMWqHWy3wPJGPBy5doN/ChLML+QC1n7MbYj2w7Iz5
 fCBYAYBWC1Ll1SR6YL8ff11s/etp33ozCF74972KF8XOeLXv6hCcttYAaRpoaqm1o8aG
 rUv98pICJFHC9oWPrVA+kVid7DJOWt78IV5M4cm9SR1MvFqmbGbAqE8/E5xxaBRlsc8F
 GVMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpFl9mmRUnyju60bAO/VXr3kvO2WMRWKWD3HrHE6IJx0/lgn5Az+F4yibafKaewIyDqHYRss26nUo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4oEZbObgvn7G+2kpTTWu4Tv9gJoo3J6w3keA6ipGCS5dYczi4
 QxlqXP0Xxy8QToOYdzyG1N0u2fzxBnav4hrQnOZSObA1lcbW6oyGIwlGoTRsFPnnrCM=
X-Gm-Gg: ASbGncuT5xpaqMM9UtzJA2iCd/HmvHWJDoRIQfRD/bhpQOz9+N5Dpn8YQ71OI0WXhfz
 qUP40H+By5ZUeWktOu/5eyHkWi/uVKrFBwPd8qY/8sdNCY+JgmdBLXu11aSNlsjHTgd1XiVH4Hg
 RcSTDKSgy16/w19o9xxMS317z1OkelRi1esDoKX7vV28hYtXAmHp6bfopL4wzMPblVV1v6elmKG
 k++hOEp1nxRFnciBI5pymBxhedvEvyqZgwYM/dNUryqelqn7PciwseLfHWvDh34oqU9nQJZVwZj
 hd28Cidf3KXSmJgl6ySs7lymWyAWXSUze/Bmr2W4/07OPjm/zwvmoK2ZTpojT2Yf/r/0425BS9G
 Wvbu+ma+saLkuqC6OkYLNUlWCsG3ROqzeRbTvMG6PpofWYgMQqCzoNklSVDChAE6tKsB5Obpnqq
 wKag==
X-Google-Smtp-Source: AGHT+IEmRlVKCe07qbgo1t2w3uFpBKsqx62crTftDC+8sZ0oUBIrcGL53VTRakva//fmnWvcfQrQww==
X-Received: by 2002:a05:6e02:1c01:b0:433:1d5a:5157 with SMTP id
 e9e14a558f8ab-435aa88e822mr21434775ab.6.1763650367018; 
 Thu, 20 Nov 2025 06:52:47 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5b954b207d7sm1008611173.33.2025.11.20.06.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 06:52:46 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: linux-kernel@vger.kernel.org, david.laight.linux@gmail.com
Cc: Alan Stern <stern@rowland.harvard.edu>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Alexei Starovoitov <ast@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Andrew Lunn <andrew@lunn.ch>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Ard Biesheuvel <ardb@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Borislav Petkov <bp@alien8.de>, 
 Christian Brauner <brauner@kernel.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Christoph Hellwig <hch@lst.de>, Daniel Borkmann <daniel@iogearbox.net>, 
 Dan Williams <dan.j.williams@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, David Ahern <dsahern@kernel.org>, 
 Davidlohr Bueso <dave@stgolabs.net>, 
 "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, 
 Eric Dumazet <edumazet@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, Jakub Sitnicki <jakub@cloudflare.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Jiri Slaby <jirislaby@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
 John Allen <john.allen@amd.com>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Juergen Gross <jgross@suse.com>, Kees Cook <kees@kernel.org>, 
 KP Singh <kpsingh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Mika Westerberg <westeri@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Miklos Szeredi <miklos@szeredi.hu>, Namhyung Kim <namhyung@kernel.org>, 
 Neal Cardwell <ncardwell@google.com>, nic_swsd@realtek.com, 
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
 Olivia Mackall <olivia@selenic.com>, Paolo Abeni <pabeni@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Huewe <peterhuewe@gmx.de>, 
 Peter Zijlstra <peterz@infradead.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Sean Christopherson <seanjc@google.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, Thomas Gleixner <tglx@linutronix.de>, 
 Tom Lendacky <thomas.lendacky@amd.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, x86@kernel.org, 
 Yury Norov <yury.norov@gmail.com>, amd-gfx@lists.freedesktop.org, 
 bpf@vger.kernel.org, cgroups@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org, 
 kvm@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-cxl@vger.kernel.org, linux-efi@vger.kernel.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-integrity@vger.kernel.org, linux-mm@kvack.org, 
 linux-nvme@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, mptcp@lists.linux.dev, netdev@vger.kernel.org, 
 usb-storage@lists.one-eyed-alien.net, David Hildenbrand <david@kernel.org>
In-Reply-To: <20251119224140.8616-1-david.laight.linux@gmail.com>
References: <20251119224140.8616-1-david.laight.linux@gmail.com>
Subject: Re: (subset) [PATCH 00/44] Change a lot of min_t() that might mask
 high bits
Message-Id: <176365036384.566630.2992984118137417732.b4-ty@kernel.dk>
Date: Thu, 20 Nov 2025 07:52:43 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Wed, 19 Nov 2025 22:40:56 +0000, david.laight.linux@gmail.com wrote:
> It in not uncommon for code to use min_t(uint, a, b) when one of a or b
> is 64bit and can have a value that is larger than 2^32;
> This is particularly prevelant with:
> 	uint_var = min_t(uint, uint_var, uint64_expression);
> 
> Casts to u8 and u16 are very likely to discard significant bits.
> 
> [...]

Applied, thanks!

[12/44] block: use min() instead of min_t()
        commit: 9420e720ad192c53c8d2803c5a2313b2d586adbd

Best regards,
-- 
Jens Axboe



