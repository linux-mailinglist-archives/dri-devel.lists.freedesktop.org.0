Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yB5/HAs8lmkDcwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 23:24:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0691715A9CE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 23:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CA210E639;
	Wed, 18 Feb 2026 22:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TwgT2mGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A14210E639;
 Wed, 18 Feb 2026 22:24:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9BE8C6132F;
 Wed, 18 Feb 2026 22:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FAF6C116D0;
 Wed, 18 Feb 2026 22:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771453447;
 bh=zQn0Q5wZfpk7S2Q8aholhB3Xtns3J/Vj36VDYCIlYi8=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=TwgT2mGCxSaU1yc8PMjqS55Ur7/a+wcxjcuI7d3a/94mTa3Y0AFqYd/8nfUv6vyfD
 /+3lemhhupa/JVo+a3IYXvGC3201kjnFg5Onw6DBAhhr+vCuKQn7l0gPnfsR94W995
 UHPgkpQZZVzmhIYLPrJKPweANgPFyY3bDzoh3h3YDbhbiaQTCQJp5tkdlRVQcSuDKB
 KjxlfU9jFUzFS+N1jySX9rYXvlqjc7b1gKJxkbw4FGrB5wAFqi5HnX/QobLQsLPIPO
 gavC4Nd3rxv/iSA/ViW2EZlvZmUtgIbD7CtX7eXRN5vl6azqgaCEQMmVPgKEDS5NSP
 H8QFIWWJvfLkw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 23:24:01 +0100
Message-Id: <DGIFU4JV4U47.QNCVFND4EA40@kernel.org>
Subject: Re: [PATCH v10 0/8] Preparatory patches for nova-core memory
 management
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Dave
 Airlie" <airlied@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-1-joelagnelf@nvidia.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0691715A9CE
X-Rspamd-Action: no action

On Wed Feb 18, 2026 at 9:54 PM CET, Joel Fernandes wrote:
> The clist/ffi patches are ready, reviewed by Gary and Danilo. Miguel, can=
 you
> pull those via the rust tree?

I requested changes in the last version and have yet to go through this one=
. I
also think that Alex still has some comments (Cc'd him).

Please note that if this goes through the Rust tree, we have to wait for th=
e
full upcoming cycle before we can land the GPU buddy abstractions.

Alternatively, if it goes through the Rust tree, Miguel can provide a signe=
d tag
for me to merge or we can simply take it through the drm-rust tree in the f=
irst
place, if Miguel agrees with that.

> The non-Rust DRM buddy related patches are already being pulled into upst=
ream

They are in drm-misc-next, I will merge into drm-rust-next once they hit
drm-next and -rc1 is out.

> I will post the nova-core memory management patches as a separate follow-=
up
> series just after this one.
>
> The git tree with all these patches can be found at:
> git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: nova/=
mm)

This is now (at least) the third time I have to ask for a patch changelog.

	"When sending a next version, add a patch changelog to the cover letter
	or to individual patches explaining difference against previous
	submission (see The canonical patch format)." [1, 2]

Please, add a patch changelog.

(This also goes for the nova-core MM series, which is flagged as v7 despite
actually being v2).

[1] https://docs.kernel.org/process/submitting-patches.html#respond-to-revi=
ew-comments
[2] https://docs.kernel.org/process/submitting-patches.html#the-canonical-p=
atch-format
