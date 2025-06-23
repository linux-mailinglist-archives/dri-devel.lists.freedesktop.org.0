Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D2EAE4264
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 15:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B8210E15C;
	Mon, 23 Jun 2025 13:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z5yNI46K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C64410E15C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 13:19:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 167964AAA6;
 Mon, 23 Jun 2025 13:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6E2C4CEF1;
 Mon, 23 Jun 2025 13:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1750684740;
 bh=S6Dcn9H08jcUBFFAHQLyVnjUjaUtNQTBz9ov5WLSNAQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z5yNI46K38mjvFOPWAdD2AC4gX1P1xNBoZrJPOSBg+TvuqUOmAjiS7++RLz2jBJM1
 DD658vUMhu2DVDRxQwwrVlrH9cmmZJtbV3vCWumlUx5mIIuKg73nDBWS01rfkjQpRe
 3vzFHh5NJlRJsewCwtNTJOpeKqSZa0annGnt6Kp4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Ivan T. Ivanov" <iivanov@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH 6.15 163/592] video: screen_info: Relocate framebuffers behind
 PCI bridges
Date: Mon, 23 Jun 2025 15:02:01 +0200
Message-ID: <20250623130704.156261310@linuxfoundation.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623130700.210182694@linuxfoundation.org>
References: <20250623130700.210182694@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
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

6.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 2f29b5c231011b94007d2c8a6d793992f2275db1 upstream.

Apply PCI host-bridge window offsets to screen_info framebuffers. Fixes
invalid access to I/O memory.

Resources behind a PCI host bridge can be relocated by a certain offset
in the kernel's CPU address range used for I/O. The framebuffer memory
range stored in screen_info refers to the CPU addresses as seen during
boot (where the offset is 0). During boot up, firmware may assign a
different memory offset to the PCI host bridge and thereby relocating
the framebuffer address of the PCI graphics device as seen by the kernel.
The information in screen_info must be updated as well.

The helper pcibios_bus_to_resource() performs the relocation of the
screen_info's framebuffer resource (given in PCI bus addresses). The
result matches the I/O-memory resource of the PCI graphics device (given
in CPU addresses). As before, we store away the information necessary to
later update the information in screen_info itself.

Commit 78aa89d1dfba ("firmware/sysfb: Update screen_info for relocated
EFI framebuffers") added the code for updating screen_info. It is based
on similar functionality that pre-existed in efifb. Efifb uses a pointer
to the PCI resource, while the newer code does a memcpy of the region.
Hence efifb sees any updates to the PCI resource and avoids the issue.

v3:
- Only use struct pci_bus_region for PCI bus addresses (Bjorn)
- Clarify address semantics in commit messages and comments (Bjorn)
v2:
- Fixed tags (Takashi, Ivan)
- Updated information on efifb

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reported-by: "Ivan T. Ivanov" <iivanov@suse.de>
Closes: https://bugzilla.suse.com/show_bug.cgi?id=1240696
Tested-by: "Ivan T. Ivanov" <iivanov@suse.de>
Fixes: 78aa89d1dfba ("firmware/sysfb: Update screen_info for relocated EFI framebuffers")
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.9+
Link: https://lore.kernel.org/r/20250528080234.7380-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/screen_info_pci.c |   79 +++++++++++++++++++++++++---------------
 1 file changed, 50 insertions(+), 29 deletions(-)

--- a/drivers/video/screen_info_pci.c
+++ b/drivers/video/screen_info_pci.c
@@ -7,8 +7,8 @@
 
 static struct pci_dev *screen_info_lfb_pdev;
 static size_t screen_info_lfb_bar;
-static resource_size_t screen_info_lfb_offset;
-static struct resource screen_info_lfb_res = DEFINE_RES_MEM(0, 0);
+static resource_size_t screen_info_lfb_res_start; // original start of resource
+static resource_size_t screen_info_lfb_offset; // framebuffer offset within resource
 
 static bool __screen_info_relocation_is_valid(const struct screen_info *si, struct resource *pr)
 {
@@ -31,7 +31,7 @@ void screen_info_apply_fixups(void)
 	if (screen_info_lfb_pdev) {
 		struct resource *pr = &screen_info_lfb_pdev->resource[screen_info_lfb_bar];
 
-		if (pr->start != screen_info_lfb_res.start) {
+		if (pr->start != screen_info_lfb_res_start) {
 			if (__screen_info_relocation_is_valid(si, pr)) {
 				/*
 				 * Only update base if we have an actual
@@ -47,46 +47,67 @@ void screen_info_apply_fixups(void)
 	}
 }
 
+static int __screen_info_lfb_pci_bus_region(const struct screen_info *si, unsigned int type,
+					    struct pci_bus_region *r)
+{
+	u64 base, size;
+
+	base = __screen_info_lfb_base(si);
+	if (!base)
+		return -EINVAL;
+
+	size = __screen_info_lfb_size(si, type);
+	if (!size)
+		return -EINVAL;
+
+	r->start = base;
+	r->end = base + size - 1;
+
+	return 0;
+}
+
 static void screen_info_fixup_lfb(struct pci_dev *pdev)
 {
 	unsigned int type;
-	struct resource res[SCREEN_INFO_MAX_RESOURCES];
-	size_t i, numres;
+	struct pci_bus_region bus_region;
 	int ret;
+	struct resource r = {
+		.flags = IORESOURCE_MEM,
+	};
+	const struct resource *pr;
 	const struct screen_info *si = &screen_info;
 
 	if (screen_info_lfb_pdev)
 		return; // already found
 
 	type = screen_info_video_type(si);
-	if (type != VIDEO_TYPE_EFI)
-		return; // only applies to EFI
+	if (!__screen_info_has_lfb(type))
+		return; // only applies to EFI; maybe VESA
 
-	ret = screen_info_resources(si, res, ARRAY_SIZE(res));
+	ret = __screen_info_lfb_pci_bus_region(si, type, &bus_region);
 	if (ret < 0)
 		return;
-	numres = ret;
 
-	for (i = 0; i < numres; ++i) {
-		struct resource *r = &res[i];
-		const struct resource *pr;
-
-		if (!(r->flags & IORESOURCE_MEM))
-			continue;
-		pr = pci_find_resource(pdev, r);
-		if (!pr)
-			continue;
-
-		/*
-		 * We've found a PCI device with the framebuffer
-		 * resource. Store away the parameters to track
-		 * relocation of the framebuffer aperture.
-		 */
-		screen_info_lfb_pdev = pdev;
-		screen_info_lfb_bar = pr - pdev->resource;
-		screen_info_lfb_offset = r->start - pr->start;
-		memcpy(&screen_info_lfb_res, r, sizeof(screen_info_lfb_res));
-	}
+	/*
+	 * Translate the PCI bus address to resource. Account
+	 * for an offset if the framebuffer is behind a PCI host
+	 * bridge.
+	 */
+	pcibios_bus_to_resource(pdev->bus, &r, &bus_region);
+
+	pr = pci_find_resource(pdev, &r);
+	if (!pr)
+		return;
+
+	/*
+	 * We've found a PCI device with the framebuffer
+	 * resource. Store away the parameters to track
+	 * relocation of the framebuffer aperture.
+	 */
+	screen_info_lfb_pdev = pdev;
+	screen_info_lfb_bar = pr - pdev->resource;
+	screen_info_lfb_offset = r.start - pr->start;
+	screen_info_lfb_res_start = bus_region.start;
 }
 DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_ANY_ID, PCI_ANY_ID, PCI_BASE_CLASS_DISPLAY, 16,
 			       screen_info_fixup_lfb);


