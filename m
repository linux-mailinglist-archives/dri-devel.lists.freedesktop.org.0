Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPWoJjrKj2nMTgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 02:04:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1766D13A5B4
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 02:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6407410E852;
	Sat, 14 Feb 2026 01:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XtNLGchE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E7D10E852
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 01:04:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 67E3143DFB;
 Sat, 14 Feb 2026 01:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A848C16AAE;
 Sat, 14 Feb 2026 01:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771031095;
 bh=K0RHdhb85AGX3NTk3JN8BCHnVTm2XLyO2NxEyhx2MrM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XtNLGchEDT/k8TJGpB+GUrzqE/+TEFigkHYtpSQywEP1pyrkl8mLvKjhz1BOyrSvh
 p2nk545VRGdL9fSTfXmOs1bpxVlcr5FUI9w3bW24QgA2M4jUKIcJNElmr34RHn+gyo
 ozhNnDWavXTCkqQ0oRE3y92t9yxArOzKE/8Tf1nwKGNz5e4Aqih/5h2dEq4XJewTzI
 N0UU1RAEsgtjjPmK7W43jkVfaR2kA7kf+wy78Jicg0dkKHppGmRI+EKHeaVKwxrN9n
 9iyxytVnzzgV8s8ux8jI7U/kX/K3Ir0mRPFRS4qA4xeA0PMKwcmh+pD1qDBEo2iMEp
 mDlCryNBDru1g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tuo Li <islituo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.19-6.12] drm/panel: Fix a possible null-pointer
 dereference in jdi_panel_dsi_remove()
Date: Fri, 13 Feb 2026 19:58:59 -0500
Message-ID: <20260214010245.3671907-59-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:patches@lists.linux.dev,m:stable@vger.kernel.org,m:islituo@gmail.com,m:neil.armstrong@linaro.org,m:sashal@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,kernel.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 1766D13A5B4
X-Rspamd-Action: no action

From: Tuo Li <islituo@gmail.com>

[ Upstream commit 95eed73b871111123a8b1d31cb1fce7e902e49ea ]

In jdi_panel_dsi_remove(), jdi is explicitly checked, indicating that it
may be NULL:

  if (!jdi)
    mipi_dsi_detach(dsi);

However, when jdi is NULL, the function does not return and continues by
calling jdi_panel_disable():

  err = jdi_panel_disable(&jdi->base);

Inside jdi_panel_disable(), jdi is dereferenced unconditionally, which can
lead to a NULL-pointer dereference:

  struct jdi_panel *jdi = to_panel_jdi(panel);
  backlight_disable(jdi->backlight);

To prevent such a potential NULL-pointer dereference, return early from
jdi_panel_dsi_remove() when jdi is NULL.

Signed-off-by: Tuo Li <islituo@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Link: https://patch.msgid.link/20251218120955.11185-1-islituo@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis

### Commit Message Analysis

The commit message is clear and well-structured. It identifies a **null
pointer dereference** in `jdi_panel_dsi_remove()`. The existing code
checks `if (!jdi)` but only calls `mipi_dsi_detach(dsi)` without
returning, so execution falls through to `jdi_panel_disable(&jdi->base)`
which dereferences the NULL `jdi` pointer. This is a classic missing-
return-after-early-check bug.

The commit has been **Reviewed-by** a subsystem maintainer (Neil
Armstrong), lending credibility.

### Code Change Analysis

The fix is extremely small and surgical — it adds braces around the
existing `if (!jdi)` block and inserts a `return;` statement:

```c
- if (!jdi)
+       if (!jdi) {
                mipi_dsi_detach(dsi);
+               return;
+       }
```

This is a textbook null-pointer dereference fix. The original code
intended to handle the `jdi == NULL` case (DSI-LINK2 interface that only
needs detach), but forgot to return early, causing the function to
continue and dereference `jdi` through `jdi_panel_disable(&jdi->base)`.

### Bug Classification

- **Type**: NULL pointer dereference
- **Trigger**: When `jdi_panel_dsi_remove()` is called for the DSI-LINK2
  interface where `mipi_dsi_get_drvdata(dsi)` returns NULL
- **Consequence**: Kernel oops/crash due to dereferencing a NULL pointer
- **Severity**: Medium-High — this is a crash in a driver removal path,
  triggered during device unbind or module unload

### Scope and Risk Assessment

- **Lines changed**: 3 lines (add braces and a `return`)
- **Files changed**: 1 file
- **Risk**: Extremely low — the fix is obviously correct and cannot
  introduce regressions. It only adds an early return when `jdi` is
  NULL, which is clearly the intended behavior given the existing NULL
  check.

### Stable Kernel Criteria

1. **Obviously correct and tested**: Yes — reviewed by subsystem
   maintainer, trivially correct
2. **Fixes a real bug**: Yes — NULL pointer dereference leading to
   kernel crash
3. **Fixes an important issue**: Yes — crash in driver removal path
4. **Small and contained**: Yes — 3 lines in a single file
5. **No new features**: Correct — pure bug fix
6. **Applies cleanly**: Likely — the change is very localized

### Dependencies

This patch is self-contained with no dependencies on other commits.

### User Impact

This affects users of the JDI LPM102A188A panel (used in some
Chromebook-style devices). When the panel's DSI link is being removed
(e.g., during driver unbind or system shutdown), the kernel would crash.
While this is a niche driver, the fix is risk-free and prevents a real
crash.

**YES**

 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
index 23462065d726b..ea975170fafff 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
@@ -434,8 +434,10 @@ static void jdi_panel_dsi_remove(struct mipi_dsi_device *dsi)
 	int err;
 
 	/* only detach from host for the DSI-LINK2 interface */
-	if (!jdi)
+	if (!jdi) {
 		mipi_dsi_detach(dsi);
+		return;
+	}
 
 	err = jdi_panel_disable(&jdi->base);
 	if (err < 0)
-- 
2.51.0

