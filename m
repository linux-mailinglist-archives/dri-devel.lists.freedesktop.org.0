Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFssAD/qimk8OwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 09:20:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C4F1182C1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 09:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF7F10E20B;
	Tue, 10 Feb 2026 08:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="TSqGC3j2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A33E10E4D7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 07:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1770708366; x=1770967566;
 bh=DUEQxGnzVTqsxG7XY59PJwUJytlx+BuBDvfcVat/qiU=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=TSqGC3j2KMAK2Rkhf1h0cUIVQfIolKGcUwoWDCkbjKcCCrOxtocwI1HMqExBEtP6r
 mN21CSzCq0TIBeQnyjJGP1Y+TW/ovBiJCfqI4ZZlOsyjikcX25v5nxUT/Ccy1qxS+L
 kDZcOXJbxu7WSb7CF1KqI4rh88//cKCQZXxPtvrC0XkeGEglXweXLhNc91ddNYgJyS
 TTUinOQxajVvJ4bKIbdUF9hiHGKBSsK2QvwVCjkhk0guSCDn6pZYNJezPw6Fp0niLV
 r1xCduWxErY4Mdjze/u11/qCkorE4i3Wh8anC6cFdC6xxpEqjaTJxKK4BNQsyQOnjI
 /ZrlG6wlNQdYQ==
Date: Tue, 10 Feb 2026 07:26:00 +0000
To: amd-gfx@lists.freedesktop.org
From: decce6 <decce6@proton.me>
Cc: decce6 <decce6@proton.me>, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/radeon: Add HAINAN clock adjustment
Message-ID: <20260210072524.15119-1-decce6@proton.me>
Feedback-ID: 132957244:user:proton
X-Pm-Message-ID: 58cf92cb1645be630600c2e92405036104c3d8c1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 10 Feb 2026 08:20:08 +0000
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:decce6@proton.me,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[decce6@proton.me,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[proton.me,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[decce6@proton.me,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[proton.me:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:mid,proton.me:dkim,proton.me:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C9C4F1182C1
X-Rspamd-Action: no action

This patch limits the clock speeds of the AMD Radeon R5 M420 GPU from
850/1000MHz (core/memory) to 800/950 MHz, making it work stably. This
patch is for radeon.

Signed-off-by: decce6 <decce6@proton.me>
---
 drivers/gpu/drm/radeon/si_dpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/radeon/si_dpm.c b/drivers/gpu/drm/radeon/si_dp=
m.c
index 9deb91970d4d..f12227145ef0 100644
--- a/drivers/gpu/drm/radeon/si_dpm.c
+++ b/drivers/gpu/drm/radeon/si_dpm.c
@@ -2925,6 +2925,11 @@ static void si_apply_state_adjust_rules(struct radeo=
n_device *rdev,
 =09=09=09max_sclk =3D 60000;
 =09=09=09max_mclk =3D 80000;
 =09=09}
+=09=09if ((rdev->pdev->device =3D=3D 0x666f) &&
+=09=09    (rdev->pdev->revision =3D=3D 0x00)) {
+=09=09=09max_sclk =3D 80000;
+=09=09=09max_mclk =3D 95000;
+=09=09}
 =09} else if (rdev->family =3D=3D CHIP_OLAND) {
 =09=09if ((rdev->pdev->revision =3D=3D 0xC7) ||
 =09=09    (rdev->pdev->revision =3D=3D 0x80) ||
--=20
2.43.0


