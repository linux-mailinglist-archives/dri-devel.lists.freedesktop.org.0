Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLndIYKCpWltCwYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:28:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7191D8641
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 13:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586BF10E132;
	Mon,  2 Mar 2026 12:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WZZjyldL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C2A10E132;
 Mon,  2 Mar 2026 12:28:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 71D0360008;
 Mon,  2 Mar 2026 12:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26D6C19423;
 Mon,  2 Mar 2026 12:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772454524;
 bh=pppJWZhqbO+BUwuoj7YQnasfi5j/ybVZ9hiQDJe1kZE=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=WZZjyldLowkrRJk4nqZ8neKZ1gp3bXcL7erh2Trk5534OmoeUIICBCuLg2YNg4JMg
 O/JFkFD8lE0VCnjgNx59+mZlikEllYv3TNK183PropYzKXpcH9NSEPlgf/dnrLdZgj
 R84fdRrB7C91/cWCFj1eqpdZsgXWQ//uUopW2Xt/3j1mK9o0gs/OMZv7FbuU9xbvkR
 WGovIrGBeadpBHmE43iHYE2n0H5fSgt1ukaslvmVcgnO0ByBZSMvue2bp7DPFtZwEp
 ZqsoGxcEJyM+r8lqOJ4TchyvCtF78uqEmeypt5+8VpvUtNjTEW3bh0zm84m/avzoh9
 hKPeVibgn942Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 13:28:40 +0100
Message-Id: <DGSAOTM95PZ4.2JGBBMNRSJSNN@kernel.org>
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: add sync and async command
 queue API to `Cmdq`
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno
 Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
 <20260226-cmdq-locking-v2-2-c7e16a6d5885@nvidia.com>
 <a3b7a5c3-9689-4700-981e-d94bd2b5091d@nvidia.com>
In-Reply-To: <a3b7a5c3-9689-4700-981e-d94bd2b5091d@nvidia.com>
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,google.com,gmail.com,ffwll.ch,kernel.org,garyguo.net,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EF7191D8641
X-Rspamd-Action: no action

On Sat Feb 28, 2026 at 7:11 AM CET, John Hubbard wrote:
> The sync/async naming that GSP RM uses is a little bit "off". I
> spent some time discussing it with them, and the problem is that
> sync/async is a concept that is somewhat independent of whether
> a reply is expected. Usually, sync means a blocking wait for a
> response, which is not necessarily required in all case with
> GSP RM calls.
>
> The naming would be better here if it reflected simply that
> a response is expected, or not. I don't have great names for
> that, but "fire and forget" works well for what we have so
> far called "async". So we could do create a convention in which
> no annotation means that the API has a response that will come
> back, and some abbreviated for of "fire and forget" or "one way"
> added to the function name would mean that no response is
> expected.

I think the relevant information for the caller is whether the call is bloc=
king
or non-blocking; i.e. do we have cases where we want to block, but discard =
the
reply, or expect a reply but don't want to wait for it?

So, unless there is additional complexity I'm not aware of, I feel like
send_command() and send_command_no_wait() should be sufficient.

(Maybe send_command_wait() if we want to be a bit more explicit.)

As for the specific commands, we could have traits to control whether block=
ing
or non-blocking submissions are allowed for them in the first place, i.e. t=
his
gives us some control about whether a reply is allowed to be discarded thro=
ugh a
_no_wait() submission etc.
