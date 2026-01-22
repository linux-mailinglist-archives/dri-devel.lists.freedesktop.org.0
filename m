Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGKSEItLcmnpfAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 17:08:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF677699F5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 17:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C9E10EA0B;
	Thu, 22 Jan 2026 16:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE22910EA1A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 16:08:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 816DC436CE;
 Thu, 22 Jan 2026 16:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68B0C2BCAF;
 Thu, 22 Jan 2026 16:08:36 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Marek Vasut <marek.vasut@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm/imagination: Convert to dev_pm_domain_{at,de}tach_list()
Date: Thu, 22 Jan 2026 17:08:32 +0100
Message-ID: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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
X-Spamd-Result: default: False [1.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:marek.vasut@mailbox.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:geert@glider.be,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	FREEMAIL_TO(0.00)[imgtec.com,mailbox.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	TAGGED_FROM(0.00)[renesas];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[geert@glider.be,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,glider.be:mid,glider.be:email]
X-Rspamd-Queue-Id: BF677699F5
X-Rspamd-Action: no action

Call the dev_pm_domain_attach_list() and dev_pm_domain_detach_list()
helpers instead of open-coding multi PM Domain handling.

This changes behavior slightly:
  - The new handling is also applied in case of a single PM Domain,
  - PM Domains are now referred to by index instead of by name, but
    "make dtbs_check" enforces the actual naming and ordering anyway,
  - There are no longer device links created between virtual domain
    devices, only between virtual devices and the parent device.
None of this should have an actual impact on functionality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested lightly on R-Car M3-W: driver probes and firmware is loaded.
---
 drivers/gpu/drm/imagination/pvr_device.h |  13 +--
 drivers/gpu/drm/imagination/pvr_power.c  | 105 ++---------------------
 2 files changed, 9 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 491718fb87a1b608..a823f6f7e0b659c6 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -148,19 +148,12 @@ struct pvr_device {
 	struct clk *mem_clk;
 
 	/**
-	 * @power: Optional power domain devices.
+	 * @pds: Optional power domain devices.
 	 *
 	 * On platforms with more than one power domain for the GPU, they are
-	 * stored here in @domain_devs, along with links between them in
-	 * @domain_links. The size of @domain_devs is given by @domain_count,
-	 * while the size of @domain_links is (2 * @domain_count) - 1.
+	 * stored here, along with links between them.
 	 */
-	struct pvr_device_power {
-		struct device **domain_devs;
-		struct device_link **domain_links;
-
-		u32 domain_count;
-	} power;
+	struct dev_pm_domain_list *pds;
 
 	/**
 	 * @reset: Optional reset line.
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index b9f801c63260cb81..cc6efab3c8b015ce 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -594,110 +594,17 @@ pvr_watchdog_fini(struct pvr_device *pvr_dev)
 int pvr_power_domains_init(struct pvr_device *pvr_dev)
 {
 	struct device *dev = from_pvr_device(pvr_dev)->dev;
+	int ret;
 
-	struct device_link **domain_links __free(kfree) = NULL;
-	struct device **domain_devs __free(kfree) = NULL;
-	int domain_count;
-	int link_count;
-
-	char dev_name[2] = "a";
-	int err;
-	int i;
-
-	domain_count = of_count_phandle_with_args(dev->of_node, "power-domains",
-						  "#power-domain-cells");
-	if (domain_count < 0)
-		return domain_count;
-
-	if (domain_count <= 1)
-		return 0;
-
-	link_count = domain_count + (domain_count - 1);
-
-	domain_devs = kcalloc(domain_count, sizeof(*domain_devs), GFP_KERNEL);
-	if (!domain_devs)
-		return -ENOMEM;
-
-	domain_links = kcalloc(link_count, sizeof(*domain_links), GFP_KERNEL);
-	if (!domain_links)
-		return -ENOMEM;
-
-	for (i = 0; i < domain_count; i++) {
-		struct device *domain_dev;
-
-		dev_name[0] = 'a' + i;
-		domain_dev = dev_pm_domain_attach_by_name(dev, dev_name);
-		if (IS_ERR_OR_NULL(domain_dev)) {
-			err = domain_dev ? PTR_ERR(domain_dev) : -ENODEV;
-			goto err_detach;
-		}
-
-		domain_devs[i] = domain_dev;
-	}
-
-	for (i = 0; i < domain_count; i++) {
-		struct device_link *link;
-
-		link = device_link_add(dev, domain_devs[i], DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
-		if (!link) {
-			err = -ENODEV;
-			goto err_unlink;
-		}
-
-		domain_links[i] = link;
-	}
-
-	for (i = domain_count; i < link_count; i++) {
-		struct device_link *link;
-
-		link = device_link_add(domain_devs[i - domain_count + 1],
-				       domain_devs[i - domain_count],
-				       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
-		if (!link) {
-			err = -ENODEV;
-			goto err_unlink;
-		}
-
-		domain_links[i] = link;
-	}
-
-	pvr_dev->power = (struct pvr_device_power){
-		.domain_devs = no_free_ptr(domain_devs),
-		.domain_links = no_free_ptr(domain_links),
-		.domain_count = domain_count,
-	};
+	ret = dev_pm_domain_attach_list(dev, NULL, &pvr_dev->pds);
+	if (ret < 0)
+		return ret;
 
 	return 0;
-
-err_unlink:
-	while (--i >= 0)
-		device_link_del(domain_links[i]);
-
-	i = domain_count;
-
-err_detach:
-	while (--i >= 0)
-		dev_pm_domain_detach(domain_devs[i], true);
-
-	return err;
 }
 
 void pvr_power_domains_fini(struct pvr_device *pvr_dev)
 {
-	const int domain_count = pvr_dev->power.domain_count;
-
-	int i = domain_count + (domain_count - 1);
-
-	while (--i >= 0)
-		device_link_del(pvr_dev->power.domain_links[i]);
-
-	i = domain_count;
-
-	while (--i >= 0)
-		dev_pm_domain_detach(pvr_dev->power.domain_devs[i], true);
-
-	kfree(pvr_dev->power.domain_links);
-	kfree(pvr_dev->power.domain_devs);
-
-	pvr_dev->power = (struct pvr_device_power){ 0 };
+	dev_pm_domain_detach_list(pvr_dev->pds);
+	pvr_dev->pds = NULL;
 }
-- 
2.43.0

