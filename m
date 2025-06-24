Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4125AE6D20
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 18:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA47810E5FC;
	Tue, 24 Jun 2025 16:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="PKF81/DS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from forward501d.mail.yandex.net (forward501d.mail.yandex.net
 [178.154.239.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EB510E047
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 12:31:14 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net
 [IPv6:2a02:6b8:c42:832b:0:640:fda5:0])
 by forward501d.mail.yandex.net (Yandex) with ESMTPS id 0F5F661A1F;
 Tue, 24 Jun 2025 15:31:10 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id 4VSEOs8LaeA0-juFvfTtH; 
 Tue, 24 Jun 2025 15:31:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
 s=mail; t=1750768269;
 bh=KUzUZlPWU3SLSvntobllY0hRQ6erceKcqtakC8llS30=;
 h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
 b=PKF81/DS5QIdXChUVJRELAbFDbbjMSk6Zhd0TJmV3md1Art5XzZuq8Ua3WNksVxHD
 /J327gmOHntnzMqVRBcj5qtBasPiJajsEXHfyOAp8XHJykcWm3KaT5fa3pl6MpjB7G
 qu4FRG7y6EK6KCXMxCq/0f4G4TIjcObdueQ6IBgI=
Authentication-Results: mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net;
 dkim=pass header.i=@onurozkan.dev
Date: Tue, 24 Jun 2025 15:31:02 +0300
From: Onur <work@onurozkan.dev>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <gary@garyguo.net>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <peterz@infradead.org>, <mingo@redhat.com>, <will@kernel.org>,
 <longman@redhat.com>, <felipe_life@live.com>, <daniel@sedlak.dev>,
 <bjorn3_gh@protonmail.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <lyude@redhat.com>
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
Message-ID: <20250624153102.3961f377@nimda.home>
In-Reply-To: <DAUM8B2ZUMFQ.25R95W7IDAEHM@kernel.org>
References: <20250621184454.8354-1-work@onurozkan.dev>
 <20250621184454.8354-3-work@onurozkan.dev>
 <DASY7BECFRCT.332X5ZHZMV2W@kernel.org> <aFlQ7K_mYYbrG8Cl@Mac.home>
 <DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org> <aFlpFQ4ivKw81d-y@Mac.home>
 <DAU0ELV91E2Q.35FZOII18W44J@kernel.org>
 <aFmKsE_nJkaVMv0T@tardis.local>
 <DAUARTYJ118U.YW38OP8TRVO3@kernel.org>
 <20250624083437.1e50d54c@nimda.home>
 <DAUM8B2ZUMFQ.25R95W7IDAEHM@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 24 Jun 2025 16:58:05 +0000
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

On Tue, 24 Jun 2025 10:20:48 +0200
"Benno Lossin" <lossin@kernel.org> wrote:

> On Tue Jun 24, 2025 at 7:34 AM CEST, Onur wrote:
> > Should we handle this in the initial implementation or leave it for
> > follow-up patches after the core abstraction of ww_mutex has landed?
> 
> Since you're writing these abstractions specifically for usage in
> drm, I think we should look at the intended use-cases there and then
> decide on an API.
> 
> So maybe Lyude or Dave can chime in :)
> 
> If you (or someone else) have another user for this API that needs it
> ASAP, then we can think about merging this and improve it later. But
> if we don't have a user, then we shouldn't merge it anyways.

I don't think this is urgent, but it might be better to land the basic
structure first and improve it gradually I think? I would be happy to
continue working for the improvements as I don't plan to leave it as
just the initial version.

I worked on the v5 review notes, but if we are going to consider
designing a different API, then it doesn't make much sense to send a v6
patch before finishing the design, which requires additional people in
the topic. That would also mean some of the ongoing review discussion
would be wasted.

---

Regards,
Onur
