Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ0CCD3qimk8OwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 09:20:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B387E1182B8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 09:20:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDD810E073;
	Tue, 10 Feb 2026 08:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="IiYxKvjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0180610E4D7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 07:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1770708247; x=1770967447;
 bh=8k4jRBizb8wbTH2MvFjtt8bKoAW5NJA/sTHOq7f3wvA=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=IiYxKvjsVaNFdnWmNX2n0R0EKLWvK1FZJC9JR2YgMvlLHbooKrSQHiQQGdf9Rrctd
 W0avumKMbvp2npUqMFKIYu7uAtzb164u2snGYPuUrHP1nmAeuEETybbPqT2eNFj2Ge
 JJf/sD8GkxMUCM8kNngIRUHPmELp5fa+e5DVACgGfNgqKfnqujlGCPDXlGDqnjEAJF
 2nWyk+U64IU89LOQD6yxYXuSFBULv0fuHGJu1R+QPYjIlN0A3pkLUvnBP9tnfmFs2w
 UwWbZYN214NKJS6Ht3WOU+Zmo6Dg1zK7fhz0H3pmtFV4FpmrsfZVR0jEj981JgdPbK
 i7Vsf5lcaybkw==
Date: Tue, 10 Feb 2026 07:24:01 +0000
To: amd-gfx@lists.freedesktop.org
From: decce6 <decce6@proton.me>
Cc: decce6 <decce6@proton.me>, Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?utf-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Alexandre Demers <alexandre.f.demers@gmail.com>, "chr[]" <chris@rudorff.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Add HAINAN clock adjustment
Message-ID: <20260210072309.14911-1-decce6@proton.me>
Feedback-ID: 132957244:user:proton
X-Pm-Message-ID: 1d446622ab18ce7d7d96c3c5e595d9a3697351a4
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:decce6@proton.me,m:kenneth.feng@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:timur.kristof@gmail.com,m:lijo.lazar@amd.com,m:alexandre.f.demers@gmail.com,m:chris@rudorff.com,m:sunil.khatri@amd.com,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,m:alexandrefdemers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[decce6@proton.me,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[proton.me,amd.com,gmail.com,ffwll.ch,rudorff.com,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[proton.me:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[decce6@proton.me,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,proton.me:mid,proton.me:dkim,proton.me:email]
X-Rspamd-Queue-Id: B387E1182B8
X-Rspamd-Action: no action

This patch limits the clock speeds of the AMD Radeon R5 M420 GPU from
850/1000MHz (core/memory) to 800/950 MHz, making it work stably. This
patch is for amdgpu.

Signed-off-by: decce6 <decce6@proton.me>
---
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/a=
md/pm/legacy-dpm/si_dpm.c
index 1f539cc65f41..b5d895537477 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -3468,6 +3468,11 @@ static void si_apply_state_adjust_rules(struct amdgp=
u_device *adev,
 =09=09=09max_sclk =3D 60000;
 =09=09=09max_mclk =3D 80000;
 =09=09}
+=09=09if ((adev->pdev->device =3D=3D 0x666f) &&
+=09=09    (adev->pdev->revision =3D=3D 0x00)) {
+=09=09=09max_sclk =3D 80000;
+=09=09=09max_mclk =3D 95000;
+=09=09}
 =09} else if (adev->asic_type =3D=3D CHIP_OLAND) {
 =09=09if ((adev->pdev->revision =3D=3D 0xC7) ||
 =09=09    (adev->pdev->revision =3D=3D 0x80) ||
--=20
2.43.0


