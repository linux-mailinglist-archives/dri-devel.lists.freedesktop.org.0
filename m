Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M2aFoudqmlLUgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:25:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEA821DDD5
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C4610ECB6;
	Fri,  6 Mar 2026 09:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFC910ECB6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 09:25:23 +0000 (UTC)
Received: from localhost (unknown [124.16.138.129])
 by APP-03 (Coremail) with SMTP id rQCowAC31dx7nappYpDuCQ--.3976S2;
 Fri, 06 Mar 2026 17:25:15 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: tzimmermann@suse.de
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] drm/sysfb: efidrm: Fix framebuffer mapping error handling
Date: Fri,  6 Mar 2026 17:19:27 +0800
Message-Id: <20260306091927.1934860-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAC31dx7nappYpDuCQ--.3976S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWr4kCr1kGrykZw4fGFW5Awb_yoW5uw48pr
 4fGFWfKr45AFsxXr4xJr1UuayFvwnagrZ29Fy3Cwsa9rn5JryUZFs5CFWj9r93JrWDC343
 Xr15AayIvFy7ArJanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
 5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeV
 CFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
 c7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s026x
 CaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
 x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
 CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
 42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUUl_MPUUUUU==
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
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
X-Rspamd-Queue-Id: CDEA821DDD5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:javierm@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:nichen@iscas.ac.cn,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[nichen@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,iscas.ac.cn];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[nichen@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

devm_memremap() returns an error pointer on failure, not NULL. Using
!screen_base to check for errors will miss error codes and treat invalid
pointers as valid addresses.

devm_memremap() returns system memory pointers (void *), while
devm_ioremap() returns I/O memory pointers (void __iomem *). The current
code incorrectly passes system memory pointers to
iosys_map_set_vaddr_iomem(), which expects I/O memory.

Fix these issues by:
- Properly checking IS_ERR() for devm_memremap() return values.
- Using iosys_map_set_vaddr_iomem() for I/O memory mappings (WC/UC).
- Using iosys_map_set_vaddr() for system memory mappings (WT/WB).

Fixes: 32ae90c66fb6 ("drm/sysfb: Add efidrm for EFI displays")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/gpu/drm/sysfb/efidrm.c | 42 ++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
index 1114359a1e62..a1da841a8dd4 100644
--- a/drivers/gpu/drm/sysfb/efidrm.c
+++ b/drivers/gpu/drm/sysfb/efidrm.c
@@ -158,6 +158,7 @@ static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
 	struct drm_device *dev;
 	struct resource *mem = NULL;
 	void __iomem *screen_base = NULL;
+	void *sys_base = NULL;
 	struct drm_plane *primary_plane;
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
@@ -165,6 +166,7 @@ static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
 	unsigned long max_width, max_height;
 	size_t nformats;
 	int ret;
+	bool is_iomem = false;
 
 	dpy = dev_get_platdata(&pdev->dev);
 	if (!dpy)
@@ -244,21 +246,37 @@ static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
 
 	mem_flags = efidrm_get_mem_flags(dev, res->start, vsize);
 
-	if (mem_flags & EFI_MEMORY_WC)
+	if (mem_flags & EFI_MEMORY_WC) {
 		screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
-	else if (mem_flags & EFI_MEMORY_UC)
+		is_iomem = true;
+		if (!screen_base)
+			return ERR_PTR(-ENOMEM);
+	} else if (mem_flags & EFI_MEMORY_UC) {
 		screen_base = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
-	else if (mem_flags & EFI_MEMORY_WT)
-		screen_base = devm_memremap(&pdev->dev, mem->start, resource_size(mem),
-					    MEMREMAP_WT);
-	else if (mem_flags & EFI_MEMORY_WB)
-		screen_base = devm_memremap(&pdev->dev, mem->start, resource_size(mem),
-					    MEMREMAP_WB);
-	else
+		is_iomem = true;
+		if (!screen_base)
+			return ERR_PTR(-ENOMEM);
+	} else if (mem_flags & EFI_MEMORY_WT) {
+		sys_base = devm_memremap(&pdev->dev, mem->start, resource_size(mem),
+					 MEMREMAP_WT);
+		is_iomem = false;
+		if (IS_ERR(sys_base))
+			return sys_base;
+	} else if (mem_flags & EFI_MEMORY_WB) {
+		sys_base = devm_memremap(&pdev->dev, mem->start, resource_size(mem),
+					 MEMREMAP_WB);
+		is_iomem = false;
+		if (IS_ERR(sys_base))
+			return sys_base;
+	} else {
 		drm_err(dev, "invalid mem_flags: 0x%llx\n", mem_flags);
-	if (!screen_base)
-		return ERR_PTR(-ENOMEM);
-	iosys_map_set_vaddr_iomem(&sysfb->fb_addr, screen_base);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (is_iomem)
+		iosys_map_set_vaddr_iomem(&sysfb->fb_addr, screen_base);
+	else
+		iosys_map_set_vaddr(&sysfb->fb_addr, sys_base);
 
 	/*
 	 * Modesetting
-- 
2.25.1

