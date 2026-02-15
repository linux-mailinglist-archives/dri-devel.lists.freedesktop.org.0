Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFxlJiGakWnlkAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 11:04:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F92013E730
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 11:04:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919B710E010;
	Sun, 15 Feb 2026 10:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="SP34syZG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net
 [178.154.239.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C8E10E010
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 10:04:12 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c1f:582e:0:640:200:0])
 by forward100a.mail.yandex.net (Yandex) with ESMTPS id AAC16C01C8;
 Sun, 15 Feb 2026 13:04:10 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id j3UBeWUGPiE0-iAOvSvzo; 
 Sun, 15 Feb 2026 13:04:09 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
 s=mail; t=1771149849;
 bh=U6+sQXT3njLPQ8KohNJXrXJPRvqzIkn4onxixnNBYnA=;
 h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
 b=SP34syZG9uV727kbJf1JQvSVgQLRscDxQmMfQtPTHeLozEOJQB3pti7TZVN7eO9zF
 RbQm8ahOD2m4Is1UJw8plbFw493oqiuzGjQSWPRaRNf+QjdAmJv53yGJNqFz7nW5hq
 aNThQjzcQhrlLaJhUP5AGzWQJxF6tRHJTdF3G6U0=
Authentication-Results: mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net;
 dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except mt8196
Date: Sun, 15 Feb 2026 13:02:51 +0300
Message-ID: <20260215100302.136719-2-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260215100302.136719-1-work@onurozkan.dev>
References: <20260215100302.136719-1-work@onurozkan.dev>
MIME-Version: 1.0
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[onurozkan.dev,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[onurozkan.dev:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:work@onurozkan.dev,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[collabora.com,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[work@onurozkan.dev,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[onurozkan.dev:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[work@onurozkan.dev,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,onurozkan.dev:mid,onurozkan.dev:dkim,onurozkan.dev:email]
X-Rspamd-Queue-Id: 2F92013E730
X-Rspamd-Action: no action

If sram-supply is missing, Panthor falls back to a
dummy regulator with a warning. This implicit behavior
hides missing DT wiring behind regulator core fallback.

Make SRAM handling explicit: require sram-supply for all
Panthor compatibles except mt8196-mali where GPU supplies
are intentionally managed outside Panthor and DT does not
model sram-supply for that compatible.

This keeps DT power modeling explicit and avoids relying on
dummy-regulator fallback.

Link: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 2249b41ca4af..5f6075f18fe3 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -206,12 +206,17 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 	 * But without knowing if it's beneficial or not (in term of power
 	 * consumption), or how much it slows down the suspend/resume steps,
 	 * let's just keep regulators enabled for the device lifetime.
+	 *
+	 * Treat sram-supply as mandatory except for mt8196-mali. It manages
+	 * SRAM outside Panthor so this driver must not require direct control
+	 * over it.
 	 */
-	ret = devm_regulator_get_enable_optional(dev, "sram");
-	if (ret && ret != -ENODEV) {
-		if (ret != -EPROBE_DEFER)
+	if (!of_device_is_compatible(dev->of_node, "mediatek,mt8196-mali")) {
+		ret = devm_regulator_get_enable_optional(dev, "sram");
+		if (ret) {
 			DRM_DEV_ERROR(dev, "Couldn't retrieve/enable sram supply\n");
-		return ret;
+			return ret;
+		}
 	}
 
 	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
-- 
2.51.2

