Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xFuCDJeGrWkY4AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B423230A48
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C4410E43D;
	Sun,  8 Mar 2026 14:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rcpassos.me header.i=@rcpassos.me header.b="Fyl6+6CA";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=purelymail.com header.i=@purelymail.com header.b="Dnxht6qa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890F710E00C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 00:05:36 +0000 (UTC)
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256;
 b=Fyl6+6CAtGGGKuJ+BVAHrzaZUCZfO7TgXcjm2dFdflfaCdhzaM1Pe0bs3r5t1owbLfkCG6nizSS88lmwqR0rejl2rdVogx13Tdjw615QFcbFsUNBb0Xis5SCRorfQF8X5XqUDni7l6uNVcmOG2rIuEg5araRHETpcCJ7nK1xd5rgl/HZuEOyvtX/GjPvujQaFV4RjwoBl06qSfXi1lGx/N3T/nrTRfSj/F1/PLIrmZUVQcQ4Sniy37ruyJgD/KJzCoerryUHcG+XOutrDE9MkBjV/HMIgA/hbtlNLY3awyLMOTP9gD4C5hPdRt6lvdqWsAYBwmvmtb3i5gwEP1bEZw==;
 s=purelymail1; d=rcpassos.me; v=1;
 bh=R8xSOdzYzJCd5hJX+8z//Gh+40HMLCgVDc2ZQ55Cqnk=;
 h=Received:From:To:Subject:Date; 
DKIM-Signature: a=rsa-sha256;
 b=Dnxht6qae2y0e8Q6It/WKwP+UVTkUyVIfp2SBmllxmU7CwvqMYxA5l9ng6Jkm0IAvMJAA8uN2461zvI5jSwj1K0wu1PRVyGjC5ET/GkwzIpa5lmvJL+dk5E6IGgg+2WkxQIYF9gVfCO0T0Pxpmfs0dBTzJ2DccqHBpQJxC6bA3SXSp5go9w2QnRA5CxKwLAEom4NGlgFi7wP+OYDAaRX54hYj81ia1TQ8uCY1g7n7wdEbkQS0sgOD3lh52wAyFB8puVBxfD3lXd3tNvEYfq+PrUwlInjgbxuysFn2/CYHlbD7vZVN5tXsKuBLxtWvxjSYW8H28QXnL9GwflYIrXFOQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=R8xSOdzYzJCd5hJX+8z//Gh+40HMLCgVDc2ZQ55Cqnk=;
 h=Feedback-ID:Received:From:To:Subject:Date; 
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: dri-devel@lists.freedesktop.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -240878125; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 08 Mar 2026 00:05:19 +0000 (UTC)
From: Rafael Passos <rafael@rcpassos.me>
To: alexdeucher@gmail.com
Cc: BhuvanaChandra.Pinninti@amd.com, Harry.Wentland@amd.com,
 Martin.Leung@amd.com, Sunpeng.Li@amd.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, daniel.wheeler@amd.com,
 davidbtadokoro@ime.usp.br, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rafael@rcpassos.me, ray.wu@amd.com,
 rcpassos@ime.usp.br, siqueira@igalia.com
Subject: [PATCH] drm/amd/display: fix resuming from S3 sleep for Renoir iGPU
Date: Sat,  7 Mar 2026 21:04:22 -0300
Message-ID: <20260308000515.890688-1-rafael@rcpassos.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CADnq5_Msmohg3T5KLrqPwvJGbXPOMKeNN-ZcqgTS2pHb+GjuYQ@mail.gmail.com>
References: <CADnq5_Msmohg3T5KLrqPwvJGbXPOMKeNN-ZcqgTS2pHb+GjuYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: 7B423230A48
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[rcpassos.me : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[rcpassos.me:s=purelymail1,purelymail.com:s=purelymail1];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:BhuvanaChandra.Pinninti@amd.com,m:Harry.Wentland@amd.com,m:Martin.Leung@amd.com,m:Sunpeng.Li@amd.com,m:alexander.deucher@amd.com,m:amd-gfx@lists.freedesktop.org,m:daniel.wheeler@amd.com,m:davidbtadokoro@ime.usp.br,m:linux-kernel@vger.kernel.org,m:rafael@rcpassos.me,m:ray.wu@amd.com,m:rcpassos@ime.usp.br,m:siqueira@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rafael@rcpassos.me,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@rcpassos.me,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rcpassos.me:-,purelymail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_SPAM(0.00)[0.154];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,usp.br:email,rcpassos.me:mid,rcpassos.me:email]
X-Rspamd-Action: no action

[WHAT]
Set the register offset MICROSECOND_TIME_BASE_DIV in dccg_registers for DCN=
21.
Introduce a new dccg21_init function, used in dccg_funcs.dccg_init for DCN2=
1.
The new dccg21_init sets 0x00120464 to set the MICROSECOND_TIME_BASE_DIV
register instead of 0x00120264, set by dccg2_init.

[WHY]
The previous commit introduced a change where the dcn21_s0i3_golden_init_wa
function used to read the MICROSECOND_TIME_BASE_DIV reg from hwseq, and
now started reading from dccg using dccg2_is_s0i3_golden_init_wa_done.
However, this register is not properly initialized in dccg.
Also, the value was initialized to 0x00120264 by dccg2_init, but
compared to 0x00120464. For this reason, we created a new dccg21_init
with the values specific to this card.

Fixes: 4c595e75110e ("drm/amd/display: Migrate DCCG registers access from h=
wseq to dccg component.")
Signed-off-by: Rafael Passos <rafael@rcpassos.me>
Co-developed-by: David Tadokoro <davidbtadokoro@ime.usp.br>
Signed-off-by: David Tadokoro <davidbtadokoro@ime.usp.br>
---

It took a lot of debugging to get to this point.
We are not sure this is the right fix, but it works.
We found that when reading the MICROSECOND_TIME_BASE_DIV register,
the offset was 13b in the old path and 0 in the new path.

The dcn21_s0i3_golden_init_wa is called when booting
and when waking from sleep. It compares the value from
MICROSECOND_TIME_BASE_DIV to 0x00120464.
When booting, the value was different (and this function returns true).
When waking from sleep, the value should be equal; thus,
this function would return false.

After 4c595e75110e, the value was always different than 0x00120464, so
this function always returned true, failing to wake the screen.
This happened because the offset of MICROSECOND_TIME_BASE_DIV was 0,
and READ_REG always returned 0x1186A0 (value from MILLISECOND_TIME_BASE_DIV=
?).

Things we are unsure of:
- We used SR to set MICROSECOND_TIME_BASE_DIV direclty in the
=09dccg_registers struct. We did not find other examples of this.
=09Should we set MICROSECOND_TIME_BASE_DIV to the DCCG_COMMON_REG_LIST_DCN_=
BASE ?
=09I only added it to DCN21, because it is the hardware I have (and validat=
ed it works).
- We changed 0x00120264 to 0x00120464 in the init, but dccg2 has the
=09same difference in setting and reading. We would like to know if this is=
sue
=09also affects dccg2 (and other cards), or if we are missing something.
=09Maybe we should change this value in dccg2_is_s0i3_golden_init_wa_done.

It applies to the mainline master, amdgpu drm-next and amd-staging-drm-next=
.

Any feedback is appreciated. It was a fun-frustrating-veryfun journey. :)
Code written only by humans.


 .../drm/amd/display/dc/dccg/dcn21/dcn21_dccg.c  | 17 ++++++++++++++++-
 .../display/dc/resource/dcn21/dcn21_resource.c  |  3 ++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dccg/dcn21/dcn21_dccg.c b/drive=
rs/gpu/drm/amd/display/dc/dccg/dcn21/dcn21_dccg.c
index 75c69348027e..6f96e9c189dc 100644
--- a/drivers/gpu/drm/amd/display/dc/dccg/dcn21/dcn21_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dccg/dcn21/dcn21_dccg.c
@@ -96,6 +96,21 @@ static void dccg21_update_dpp_dto(struct dccg *dccg, int=
 dpp_inst, int req_dppcl
 =09dccg->pipe_dppclk_khz[dpp_inst] =3D req_dppclk;
 }
=20
+void dccg21_init(struct dccg *dccg)
+{
+=09struct dcn_dccg *dccg_dcn =3D TO_DCN_DCCG(dccg);
+
+=09/* Hardcoded register values for DCN21
+=09 * These are specific to 100Mhz refclk
+=09 * Different ASICs with different refclk may override this in their own=
 init
+=09 */
+=09REG_WRITE(MICROSECOND_TIME_BASE_DIV, 0x00120464);
+=09REG_WRITE(MILLISECOND_TIME_BASE_DIV, 0x001186a0);
+=09REG_WRITE(DISPCLK_FREQ_CHANGE_CNTL, 0x0e01003c);
+
+=09if (REG(REFCLK_CNTL))
+=09=09REG_WRITE(REFCLK_CNTL, 0);
+}
=20
 static const struct dccg_funcs dccg21_funcs =3D {
 =09.update_dpp_dto =3D dccg21_update_dpp_dto,
@@ -103,7 +118,7 @@ static const struct dccg_funcs dccg21_funcs =3D {
 =09.set_fifo_errdet_ovr_en =3D dccg2_set_fifo_errdet_ovr_en,
 =09.otg_add_pixel =3D dccg2_otg_add_pixel,
 =09.otg_drop_pixel =3D dccg2_otg_drop_pixel,
-=09.dccg_init =3D dccg2_init,
+=09.dccg_init =3D dccg21_init,
 =09.refclk_setup =3D dccg2_refclk_setup, /* Deprecated - for backward comp=
atibility only */
 =09.allow_clock_gating =3D dccg2_allow_clock_gating,
 =09.enable_memory_low_power =3D dccg2_enable_memory_low_power,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c=
 b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
index 0f4307f8f3dd..7f8f657eb0f2 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn21/dcn21_resource.c
@@ -222,7 +222,8 @@ static const struct dce_audio_mask audio_mask =3D {
 };
=20
 static const struct dccg_registers dccg_regs =3D {
-=09=09DCCG_COMMON_REG_LIST_DCN_BASE()
+=09=09DCCG_COMMON_REG_LIST_DCN_BASE(),
+=09=09SR(MICROSECOND_TIME_BASE_DIV)
 };
=20
 static const struct dccg_shift dccg_shift =3D {
--=20
2.53.0

