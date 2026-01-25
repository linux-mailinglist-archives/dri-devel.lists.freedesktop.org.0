Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id t5mxMx1xdml0QwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 20:38:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BCB823B4
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 20:38:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AF310E1BE;
	Sun, 25 Jan 2026 19:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EW91Ki1b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5474E10E1BE;
 Sun, 25 Jan 2026 19:38:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3F344600C3;
 Sun, 25 Jan 2026 19:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0D6C4CEF1;
 Sun, 25 Jan 2026 19:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769369879;
 bh=CJJoAyHycnWBHWJ3K9UH9JsSF4QzEnlHxtNRXEkKYF0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EW91Ki1bnyV6hL0gLSqe0lWMgwVzGSEO4FxhMWUnXMJUxea7tCXNpnWQtApwfQsQz
 hXX+wKr1b9LhB54vNjlPyKAUT8zMLomBW7pBDjFm/C45EE4TZN/iQ9ABQo52rBYGEA
 bBjygq4DfWF0iZEbaon9lr3xXRrPyxqPKQA21ynK3QScoof5Ae+PR/nw4A8T8bC5Vr
 qBWPVTdJkJUBRaZZfEY58mWZCorDxb2GGvdNYTeB48vhxHWsj6JhL23obe5FdjbIFC
 pnEQ5wZDzrLsEvtzNMpcFqqVNbK65jGwK/QTWTxOV0itRjxTwgfB7lP4zy302fhCAf
 rmI42ODIOJDLg==
Date: Sun, 25 Jan 2026 11:37:58 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alice Ryhl
 <aliceryhl@google.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Felix Kuehling
 <felix.kuehling@amd.com>, Leon Romanovsky <leon@kernel.org>, Steven Price
 <steven.price@arm.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 7/7] netclassid: use thread_group_leader(p) in
 update_classid_task()
Message-ID: <20260125113758.0f985df0@kernel.org>
In-Reply-To: <aXY_4NSP094-Cf-2@redhat.com>
References: <aXY_h8i78n6yD9JY@redhat.com>
	<aXY_4NSP094-Cf-2@redhat.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 14BCB823B4
X-Rspamd-Action: no action

On Sun, 25 Jan 2026 17:08:00 +0100 Oleg Nesterov wrote:
> Cleanup and preparation to simplify the next changes.

Acked-by: Jakub Kicinski <kuba@kernel.org>
