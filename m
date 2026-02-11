Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP+uEJuyjGlLsQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 17:47:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B198E1264C8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 17:47:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83E610E638;
	Wed, 11 Feb 2026 16:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HD0OiU/X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5437A10E09B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:47:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 668F960053;
 Wed, 11 Feb 2026 16:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B434C4CEF7;
 Wed, 11 Feb 2026 16:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770828437;
 bh=Axd6+FAx+svU01taZF9dBwsFOMn//n4UUyQCxOZzxLE=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=HD0OiU/X9XdxIPhqSht4yMAhClrCU0+gnVun0CaAq5Yb9HV7dl3p8e2GOuzP81AKF
 LjXvjZqzFdaux5+yWWAZsZ5CqvQqa6Ab+c99OfMXICjFS3xCHxzgWrR2iSI5CqvZt+
 F8nVhOZTY8JCg42YOpMEXhZ5+3qYBGKaAM8OJvKHaTfEw4H0N5K6GQ37DacuCQs+sN
 Yxah6cvl7+np9/YZHGg/IMr+itaSy5o5Ve4aiV0tSw+3DE+wpnfRoVaye1PMmcPa7K
 WMlcMazd4fO80Pw3fNwBlK0HRNFHEHdmBgVbHVme1p+R2iaqooeeLy9/wuBwK+9tAE
 S0nGTPkw+HslQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 17:47:09 +0100
Message-Id: <DGCAAE4YEDLO.299F5M641E90B@kernel.org>
Cc: "Boris Brezillon" <boris.brezillon@collabora.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Viresh Kumar"
 <viresh.kumar@linaro.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Drew Fustini" <fustini@kernel.org>, "Guo Ren"
 <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
 <linux-pwm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Maxime Ripard" <mripard@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
References: <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
 <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
 <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
 <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
 <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com>
 <20260204-angelic-vermilion-beagle-fd1507@houat>
 <20260209105047.693f2515@fedora>
 <20260211-flawless-feathered-boar-0b87ad@houat>
In-Reply-To: <20260211-flawless-feathered-boar-0b87ad@houat>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:rafael@kernel.org,m:viresh.kumar@linaro.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:ukleinek@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-pwm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:mripard@kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_CC(0.00)[collabora.com,google.com,kernel.org,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,redhat.com,baylibre.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B198E1264C8
X-Rspamd-Action: no action

On Wed Feb 11, 2026 at 5:37 PM CET, Maxime Ripard wrote:
> I do think we can find a compromise though. Miguel suggested for example
> to make the current enable/prepare/disable/unprepare function unsafe,
> and that's totally reasonable to me.
>
> Then we can implement the "managed" clock version on that unsafe API,

What do you mean with "managed" clock? Do you mean devres managed? If so, I
don't think there is any reason to switch to the unsafe API to be able to
implement devres managed APIs (see also [1]).

[1] https://lore.kernel.org/all/DFVW9MS5YLON.CVJDBYQKJ0P6@kernel.org/

> and we would end up with a "raw", unsafe, version kind of equivalent to
> the one we have today, and where callers would have to justify why their
> usage of the API is actually safe, or the new, managed, variant that is
> safe and can be easily used by most drivers.
>
> And we can call these RawClk vs Clk, or Clk vs ManagedClk, or whatever.
>
> How does that sound?

What about we just wait until we have a user that really requires an unsafe=
 API
for some reason? And if it never appears, even better. :)
