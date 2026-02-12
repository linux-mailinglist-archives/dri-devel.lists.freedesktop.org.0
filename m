Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIjsLFNSjmmMBgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 23:21:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDCF1317EB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 23:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD5B10E2B1;
	Thu, 12 Feb 2026 22:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="bTAA0rxt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5948910E2B1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 22:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-953a8a3ca9; t=1770934861;
 bh=8LtyKwPG/bc6wio3zDAJHqbTFoe1AI885LVCRiG/Biw=;
 b=bTAA0rxt6IXhSM0dCrLYtisuZcVih2WNZPCkdRccxDq3KeiyLyFQ2k3h++RkyhrrgEZ+uuv1g
 3Hc995nwoTQ4/hiBG14ofHugr+wA0x+LdpPhjNbX1H1wy6hupro4b4iHtmhsLU9ka/Ee5Wti7Zr
 SXh2/DQ69PhQUw8+w+WCuLeafxknJzQ6zkeo4K/6sjJo2ojsShJq+1J5b1BNXagHiLa9R5O/zZC
 sRuRj55di6cbS5H7egGQU4a1X6+3diqSQJKYI0osplQFnf1rU3tyrRRCbsrCW83FEb7Z1amKRtH
 0REOc7kfiA0ztySW663JEpTJKPEdRL4dFtXUB6eT5Tlw==
X-Forward-Email-ID: 698e524a1cff1f790f796ad8
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.6.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Joshua Peisach <jpeisach@ubuntu.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com,
 Joshua Peisach <jpeisach@ubuntu.com>
Subject: [PATCH 0/2] drm/amdgpu/amdgpu_connectors: Use struct drm_edid
Date: Thu, 12 Feb 2026 17:20:27 -0500
Message-ID: <20260212222029.15777-1-jpeisach@ubuntu.com>
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
X-Rspamd-Queue-Id: 8CDCF1317EB
X-Rspamd-Action: no action

These patches replace uses of struct edid with struct drm_edid, and
updates function calls appropriately.

Additionally, amdgpu_connector_free_edid is no longer needed, and can be
removed.

Joshua Peisach (2):
  drm/amdgpu/amdgpu_connectors: use struct drm_edid instead of struct
    edid
  drm/amdgpu/amdgpu_connectors: remove amdgpu_connector_free_edid

 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 54 ++++++++-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  4 +-
 5 files changed, 30 insertions(+), 38 deletions(-)

-- 
2.51.0

