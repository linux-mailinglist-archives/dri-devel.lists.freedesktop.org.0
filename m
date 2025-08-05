Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A68B1B0B9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 11:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3346C10E25C;
	Tue,  5 Aug 2025 09:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="mHJbf5RA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from forward502a.mail.yandex.net (forward502a.mail.yandex.net
 [178.154.239.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A46910E25C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 09:08:24 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c1f:e8d:0:640:bba7:0])
 by forward502a.mail.yandex.net (Yandex) with ESMTPS id 4B88081A59;
 Tue, 05 Aug 2025 12:08:21 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id F8c5BVUpU8c0-GO7I7gnR; 
 Tue, 05 Aug 2025 12:08:20 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
 s=mail; t=1754384900;
 bh=PPtHV1CcZHiPaeg/tV5PXIHzxoWkTlwtb+No67Nl1YI=;
 h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
 b=mHJbf5RATew33cYKT4274q6R9/CCdg5u/Kih/XYV+UPnNEKJ13tmaUdip3q5s/H7H
 t2ECpm9kRWNaOB23S/HVObYWcT+ULrXQls+Aw5aV0QPpF/+dMD0Z34ZnH3s0q9rpbA
 9TnIQlxFV7JSmOSaVU1+GUPg7LuEfkvuy8Q4ftXA=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.vla.yp-c.yandex.net;
 dkim=pass header.i=@onurozkan.dev
Date: Tue, 5 Aug 2025 12:08:13 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 longman@redhat.com, felipe_life@live.com, daniel@sedlak.dev,
 bjorn3_gh@protonmail.com, dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
Message-ID: <20250805120813.1f8714f5@nimda.home>
In-Reply-To: <E997DCAF-552F-4EF2-BF94-1385ECADF543@collabora.com>
References: <20250621184454.8354-1-work@onurozkan.dev>
 <20250621184454.8354-3-work@onurozkan.dev>
 <DASY7BECFRCT.332X5ZHZMV2W@kernel.org> <aFlQ7K_mYYbrG8Cl@Mac.home>
 <DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org> <aFlpFQ4ivKw81d-y@Mac.home>
 <DAU0ELV91E2Q.35FZOII18W44J@kernel.org>
 <20250707163913.5ffc046d@nimda.home>
 <DB5XIWGZ8U36.1VB58YBJFL7OT@kernel.org>
 <20250707210613.2fd5bb55@nimda.home>
 <DB62ZN1LTO31.1HVWDLAWJWVM8@kernel.org>
 <FF481535-86EF-41EB-830A-1DA2434AAEA0@collabora.com>
 <DBRVNP4MM5KO.3IXLMXKGK4XTS@kernel.org>
 <E997DCAF-552F-4EF2-BF94-1385ECADF543@collabora.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-unknown-linux-gnu)
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

On Sat, 2 Aug 2025 11:15:07 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:
 
> Btw, I can also try to implement a proof of concept, so long as
> people agree that this approach makes sense.

It's not necessary to provide a full P.o.C but a small demonstration of
the kind of ww_mutex API you would prefer would be helpful. Seeing a few
sample Rust use-cases (especially in comparison to existing C
implementations) would give a clearer picture for me.

At the moment, the implementation is just a wrapper ([1]) around the C
ww_mutex with no additional functionality, mostly because we don't have
a solid consensus on the API design yet (we had some ideas about Tuple
based approach, but seems like that isn't going to be useful for most
of the ww_mutex users).

[1]: https://github.com/onur-ozkan/linux/commits/673e01a9c309c

> By the way, dri-devel seems to not be on cc? Added them now.

Thanks!

--

Regards,
Onur
