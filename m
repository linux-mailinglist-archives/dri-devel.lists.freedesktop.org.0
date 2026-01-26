Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPE4L47nd2k9mQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 23:15:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB5D8DE3B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 23:15:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241FA10E0C7;
	Mon, 26 Jan 2026 22:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="JP0baOeX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1347 seconds by postgrey-1.36 at gabe;
 Mon, 26 Jan 2026 22:15:38 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50ECE10E0C7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 22:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com; h=To:
 From: Subject: Message-Id: Date: Content-Type: Content-Transfer-Encoding:
 Mime-Version; q=dns/txt; s=fe-953a8a3ca9; t=1769465737;
 bh=8XQquTS6mlXO0ky9mljiExVnw5UBFPASjDn+GIqO8wc=;
 b=JP0baOeX2v+9EFYAutGn3TAi+q144+5bJnLsFjDRXruiFqSxUn+ZsaKqrg0JeI3zZE5qSmoAk
 nDR3Q/2Lx66qIObUJIExOb3ZpezRRv3CLMjJyEUmQwED1jW7hEfGU1ouQq+jkpV7zPJooUaQDLT
 7QBa5wbCr1ftX0Y0tMv2wND7C1hQS0/CnWD4Pzv0ODgG1jzH3CBswXzacqzP4CHynpm83scYD4g
 pviCC4O6Oj0o48W64pykQGqaSnUQDjEhCDvQ6/09eNUhFs0rWX/33HCmiqjAz2kCDyOj7cF5Kwv
 +2HeyqNcAPXTKFACd6IC+EIAphcvibij1ypB1aLhYttQ==
X-Forward-Email-ID: 6977e2413b9d3c0d72f6024f
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.5.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 26 Jan 2026 16:53:04 -0500
Message-Id: <DFYURW2CTLT7.9E27EABQKKQE@ubuntu.com>
Subject: TTM: should we remove ttm_bo_put?
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.0
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4CB5D8DE3B
X-Rspamd-Action: no action

Hi all,

While looking for things to do, I noticed that in ttm_bo, the
ttm_bo_put method has a TODO with the comment: "remove!"

I was wondering if this is still a goal? Because ttm_bo_get still
exists, it's just inlined.

I also feel like that since it is used in util functions in ttm_bo_util
the removal gets rid of the "abstraction"?

Anyways, should ttm_bo_put be removed or should it make sense moving it
to ttm_bo_internal as an inline function?

Thanks,
-Josh
