Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO8AA9TulmngrAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 12:07:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9CB15E29F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 12:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71BA10E6CB;
	Thu, 19 Feb 2026 11:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="YW5Nmt7b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D641010E6CA
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 11:06:55 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fGrDX5DzMz9tq6;
 Thu, 19 Feb 2026 12:06:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1771499212; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type: content-transfer-encoding:content-transfer-encoding;
 bh=m0y6lwaM96ojr9y2eIzrVxaVIa5M1lK5BEvNKoY0I7U=;
 b=YW5Nmt7bbDHTf3xXI6BpIeKNzYlnWo8nF8q8qyJDMVIjIg6cr8CKm4OiYOLbmCI7+v/VBP
 er4OuQbfY2V94PcZmlTl+OwDJFY0QoC6RtzGWdwn8dwwvkoJyf+LzXC2LJ7HHC4ezBAd0+
 dc4T9/YnxgzTUXig7z/MSsgmvCtY6T1ESNoWfGso/TTOwhxkrimkS7ximupXs9EbZ9to36
 O2nfx/G3DBCVW3esxLoazatmLDGMNyJI81Gfk8lEccky3qglz3oZX1YfIsFwkZZHif4dqi
 1KXY5s/ZISsumvZiKlP0qx4EyTEodeQe4fCQOTrC1GQeMaXICvoCA9g8cWcwqg==
Message-ID: <91f84eccd59d593822dbb97c995ae9c52ba788d2.camel@mailbox.org>
Subject: Opportunistic dma_fence polling
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Boris Brezillon
 <boris.brezillon@collabora.com>, Danilo Krummrich <dakr@redhat.com>
Date: Thu, 19 Feb 2026 12:06:50 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: tq7myzmpdhnj4a37w8eonybkrihw3nuk
X-MBO-RS-ID: 6bad44f66fffb26d2d7
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:boris.brezillon@collabora.com,m:dakr@redhat.com,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: 8F9CB15E29F
X-Rspamd-Action: no action

Yo Christian,

I'd like to discuss the dma_fence fast path optimization
(ops.is_signaled) again.

As far as I understand by now, the use case is that some drivers will
never signal fences; but the consumer of the fence actively polls
whether a fence is signaled or not.

Right?

I have a bunch of questions regarding that:

   1. What does the party polling the fence typically look like? I bet
      it's not userspace, is it? Userspace I'd expect to use poll() on
      a FD, thus an underlying driver has to check the fence somehow.
   2. What if that party checks the fence, determines it is unsignaled?
      Will it then again try later?
   3. If it tries again later anyways, then what is the problem with
      the fence-issuing driver itself checking every 5, 10 or 50
      milliseconds what the counter in the GPU ring buffer is, and then
      signals all those fences?

So it circles around the question why ops.is_signaled is supposedly
unavoidable.

Regards
P.
