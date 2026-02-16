Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON+WEOURk2mL1QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 13:47:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F291436F3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 13:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBCA10E04C;
	Mon, 16 Feb 2026 12:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="etdmPV+f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17BE10E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 12:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-953a8a3ca9; t=1771246047;
 bh=V1Z3hGz1dpz3ZD/ONtlOtYsxZmcalA1tBPvg9ZVacI4=;
 b=etdmPV+flGieq3lq0W2vlRcpjarsSd7VETF12CVAzXkpHWmk8pOx2Lo6qwLx3V39ftXmuqJnn
 5odaV7XmJjMAY3L/qW3rjKG8bkaOVg0jKPfqUjspLzkHvUh7W3mf7u+j2IqHdvXOqYfRo0XhqA9
 hjj0sWIcg8cKbmk/XGVvlSv+MaZUNIygcYWMTRVcsd6tUiX8tUQrUW/5Qbt4ekW8vVoGwhDxb1w
 O+yPg7ZeCRhkQHw06r0/9LnVuonLwbvQhu+TGLGSd+RRB78rfh7pnVz7DHVwK8/15OKBjPOpqbn
 rccGRkWzDF8S1s+6eCf/UvUxsswFSYoFm0KfS5dlY8Mg==
X-Forward-Email-ID: 699311dbcde16816033f1b8a
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.6.10
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Joshua Peisach <jpeisach@ubuntu.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Joshua Peisach <jpeisach@ubuntu.com>
Subject: [PATCH 0/2] drm/radeon: use struct drm_edid
Date: Mon, 16 Feb 2026 07:46:31 -0500
Message-ID: <20260216124633.42644-1-jpeisach@ubuntu.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:jpeisach@ubuntu.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:mid,ubuntu.com:dkim]
X-Rspamd-Queue-Id: 14F291436F3
X-Rspamd-Action: no action

This series replaces uses of struct edid with struct drm_edid, to
remove usage of deprecated functions.

radeon_connector_free_edid is also no longer necessary, and is removed.

These changes are essentially the same as what I've sent for amdgpu.

Untested, testing and review much appreciated.

Link: https://lore.kernel.org/amd-gfx/20260212222029.15777-1-jpeisach@ubuntu.com/T/

Joshua Peisach (2):
  drm/radeon: use struct drm_edid instead of struct edid
  drm/radeon: remove radeon_connector_free_edid

 drivers/gpu/drm/radeon/radeon_audio.c      |  4 +-
 drivers/gpu/drm/radeon/radeon_combios.c    |  4 +-
 drivers/gpu/drm/radeon/radeon_connectors.c | 52 +++++++++-------------
 drivers/gpu/drm/radeon/radeon_mode.h       |  4 +-
 4 files changed, 28 insertions(+), 36 deletions(-)

-- 
2.51.0

