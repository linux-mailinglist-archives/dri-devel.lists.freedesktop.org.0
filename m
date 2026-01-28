Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMUOJS3peWkF1AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 11:47:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE349FA88
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 11:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874DA10E63F;
	Wed, 28 Jan 2026 10:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u86qh55p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C694110E63F;
 Wed, 28 Jan 2026 10:47:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 801ED40733;
 Wed, 28 Jan 2026 10:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2990C4AF09;
 Wed, 28 Jan 2026 10:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769597224;
 bh=xKmKGHblPsSZenvqrZey8InJuq6tz0WVn85z4/keYKU=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=u86qh55pZvVbKWRIoIpanUlPoJfy10TkSP4JTWfZCrSGe+dmfZFd1ZyDBDSycARvb
 4b4hd+IJLC+jiK0NFDM2B/P80jirpXwKuS358BRWxyrfQx0JBzDzFdOX1boeIDdhg7
 5eZ0NB0p99mzHigmu9Pgum/eidSNbRpTslQHnwJSBeBCcMPLG+WkgQPBNVd1Yq1DL/
 QcRZAV3IuKxcbJHc4/LJppHIvUNS2g1G1N5eqRjRi0bUfvjnkwpt9f8IjacXMBk287
 imvtYpVwXX9UT6SNHwSh2MoaO5fV9WED5g+7E3/ctPEAIkIDylvru7poUlVAfJnvOf
 yGpRvNmy3yUJA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 11:46:59 +0100
Message-Id: <DG05UZS433N1.378WELIDPRZVE@kernel.org>
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: clarify comments about
 invariants and pointer roles
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Gary Guo" <gary@garyguo.net>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
 <20260123-nova-core-cmdq1-v2-2-e797ec1b714c@nvidia.com>
 <DFYPX3TNI3Y2.38MQUIWHHR9Z1@garyguo.net>
 <DFZXYMSS9OOI.5NUPB8GCHRKD@nvidia.com>
 <DG02OBNM1OPY.2W9JKV0IF8VPK@nvidia.com>
In-Reply-To: <DG02OBNM1OPY.2W9JKV0IF8VPK@nvidia.com>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nvidia.com,garyguo.net,google.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AAE349FA88
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 9:17 AM CET, Alexandre Courbot wrote:
> On Wed Jan 28, 2026 at 1:35 PM JST, Eliot Courtney wrote:
>> On Tue Jan 27, 2026 at 3:04 AM JST, Gary Guo wrote:
>>> I wonder if this can be `is within 0..MSGQ_NUM_PAGES`. What do others t=
hink?
>>
>> I think this is very reasonable, since this is part of the rust
>> range syntax so it should be understandable. I also considered the
>> mathematical syntax `[0, MSGQ_NUM_PAGES)`, but not sure if this would
>> be conventional - it does seem that this notation is used in a bunch
>> of places though. Will apply your suggestion in the next version unless
>> there is a definitive convention for this.
>
> Since this is Rust code, the Rust syntax to express ranges (within ``
> quotes) makes sense IMHO.

While I really like the mathematical syntax, I think using the Rust syntax =
is
superior, as it requires zero mental cycles to translate it to what is like=
ly to
be found in the code as well.

(There also have been some considerations of using tools to validate safety
comments or invariants to some extend eventually.)
