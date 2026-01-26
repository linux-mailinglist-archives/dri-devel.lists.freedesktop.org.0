Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFV3IvV0eGnEpwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:19:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0AF91026
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748EE10E4D5;
	Tue, 27 Jan 2026 08:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="jmxXj2IC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6A610E2BD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 10:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8c
 9+Li57nUoki8zRMyzx9ZHi9b8ach+k6oTu2niUoaE=; b=jmxXj2IC2uQOgzyAym
 MjtuFtKY41jMyA7QiJQJmTBARyIf0L0yU9mugSs+MRHLOLeLtc2+NRMOiv54018V
 PJ/rdltYkIGRed5lbugO1YPpEhzpxbXLBpOAmr7YEq8LGxa9af5brRC/8BAJCwDp
 8VTah7iEtOO0Ip+5pr8C6Hlfg=
Received: from localhost.localdomain (unknown [])
 by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id
 _____wD3_z34PHdp1zExIg--.9700S2; 
 Mon, 26 Jan 2026 18:07:54 +0800 (CST)
From: luyuantao01 <luyuantao01@163.com>
To: jfalempe@redhat.com
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 luyuantao <luyuantao@kylinos.cn>
Subject: [PATCH v2] drm/panic: Fix the potential loop that causes kmsg to not
 display correctly
Date: Mon, 26 Jan 2026 18:07:32 +0800
Message-Id: <20260126100732.365-1-luyuantao01@163.com>
X-Mailer: git-send-email 2.37.2.windows.2
In-Reply-To: <20260126054059.295-1-luyuantao01@163.com>
References: <20260126054059.295-1-luyuantao01@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_z34PHdp1zExIg--.9700S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrW5Zw1fArWDJFW7Xw1rCrg_yoWkZrc_uF
 WDXwn7Xw4Y9a4DWFnrAFWfJry2k3W5ZFs293W0qa4Yvry2yF13Z3yxXF1rAF1jgFZrtF9r
 Xas2qF9YyFs7ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnaii3UUUUU==
X-Originating-IP: [221.238.56.49]
X-CM-SenderInfo: 5ox13tpqwd0iqr6rljoofrz/xtbC9BqFDGl3PPq95AAA3m
X-Mailman-Approved-At: Tue, 27 Jan 2026 08:18:47 +0000
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:jfalempe@redhat.com,m:javierm@redhat.com,m:luyuantao@kylinos.cn,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[luyuantao01@163.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[163.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luyuantao01@163.com,dri-devel-bounces@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7D0AF91026
X-Rspamd-Action: no action

From: luyuantao <luyuantao@kylinos.cn>

When kmsg_buf completes drawing the screen and yoffset is less than 0,
kmsg_dump_get_buffer continues to obtain the buffer. This potential loop may
cause panic_flush not to be executed immediately or even not to be executed
at all, resulting in a garbled screen display instead of normal logs

So, the loop should be exited immediately after drawing kmsg_buf

Signed-off-by: luyuantao <luyuantao@kylinos.cn>
---
 drivers/gpu/drm/drm_panic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index d4b6ea42db0f..f7289dbf2ef9 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -574,7 +574,8 @@ static void draw_panic_static_kmsg(struct drm_scanout_buffer *sb)
 	drm_panic_fill(sb, &r_screen, bg_color);
 
 	kmsg_dump_rewind(&iter);
-	while (kmsg_dump_get_buffer(&iter, false, kmsg_buf, sizeof(kmsg_buf), &kmsg_len)) {
+	while (yoffset >= 0 && kmsg_dump_get_buffer(&iter, false, kmsg_buf,
+				sizeof(kmsg_buf), &kmsg_len)) {
 		char *start;
 		char *end;
 
-- 
2.27.0

