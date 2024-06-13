Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E14A907E61
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 23:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D9910EBBF;
	Thu, 13 Jun 2024 21:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LeLfrc4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585B010EBBF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 21:57:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8252461D33;
 Thu, 13 Jun 2024 21:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC137C2BBFC;
 Thu, 13 Jun 2024 21:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718315865;
 bh=MFWktKXGuccjs7bY6+gTdl9Pdrqwh0eA89XN/LyB+Y8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=LeLfrc4rxDq11v4JskN32UcgMrGmRK5xjKIxeIYKBfNnHe8Ins7JiGqxxAMJdppyl
 FrQatQ0mLLcJPdUO00Ho40YmGxPbEWnKDM2YXkgKyLXZaRZIXNPxvw7VB7ComeBtk3
 5jGzaPrIBRLZzxOoMtHvBYuS5IE+DJisKPD8rB0uVbdQ6ddz9IgbxArnQa/8uEGP0O
 SVE5CzpaYG08IjvTMJ4fsXsteeBwFqdOZWMc+4DbwhL4ACdkfwM2918DcmsBgy3AZS
 hWPYEdiJ/xaY4iqQ11+E8ijGOF6/QMxiXlAGwd9eOHk1D7gyHCAAaBXzcXoRoJATSI
 CNkuWHlKkXUEA==
Date: Thu, 13 Jun 2024 16:57:43 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v9 00/13] Make PCI's devres API more consistent
Message-ID: <20240613215743.GA1085850@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240613115032.29098-1-pstanner@redhat.com>
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

On Thu, Jun 13, 2024 at 01:50:13PM +0200, Philipp Stanner wrote:
> Changes in v9:
>   - Remove forgotten dead code ('enabled' bit in struct pci_dev) in
>     patch No.8 ("Move pinned status bit...")
>   - Rework patch No.3:
>       - Change title from "Reimplement plural devres functions"
>         to "Add partial-BAR devres support".
>       - Drop excessive details about the general cleanup from the commit
> 	message. Only motivate why this patch's new infrastructure is
> 	necessary.
>   - Fix some minor spelling issues (s/pci/PCI ...)
> 
> Changes in v8:
>   - Rebase the series on the already merged patches which were slightly
>     modified by Bjorn Helgaas.
>   - Reword the pci_intx() commit message so it clearly states it's about
>     reworking pci_intx().
>   - Move the removal of find_pci_dr() from patch "Remove legacy
>     pcim_release()" to patch "Give pci_intx() its own devres callback"
>     since this later patch already removed all calls to that function.
>   - In patch "Give pci_intx() its own devres callback": use
>     pci_is_enabled() (and, thus, the enabled_cnt in struct pci_dev)
>     instead of a separate enabled field. (Bjorn)
> 
> Changes in v7:
>   - Split the entire series in smaller, more atomic chunks / patches
>     (Bjorn)
>   - Remove functions (such as pcim_iomap_region_range()) that do not yet
>     have a user (Bjorn)
>   - Don't export interfaces publicly anymore, except for
>     pcim_iomap_range(), needed by vboxvideo (Bjorn)
>   - Mention the actual (vboxvideo) bug in "PCI: Warn users..." commit
>     (Bjorn)
>   - Drop docstring warnings on PCI-internal functions (Bjorn)
>   - Rework docstring warnings
>   - Fix spelling in a few places. Rewrapp paragraphs (Bjorn)
> 
> Changes in v6:
>   - Restructure the cleanup in pcim_iomap_regions_request_all() so that
>     it doesn't trigger a (false positive) test robot warning. No
>     behavior change intended. (Dan Carpenter)
> 
> Changes in v5:
>   - Add Hans's Reviewed-by to vboxvideo patch (Hans de Goede)
>   - Remove stable-kernel from CC in vboxvideo patch (Hans de Goede)
> 
> Changes in v4:
>   - Rebase against linux-next
> 
> Changes in v3:
>   - Use the term "PCI devres API" at some forgotten places.
>   - Fix more grammar errors in patch #3.
>   - Remove the comment advising to call (the outdated) pcim_intx() in pci.c
>   - Rename __pcim_request_region_range() flags-field "exclusive" to
>     "req_flags", since this is what the int actually represents.
>   - Remove the call to pcim_region_request() from patch #10. (Hans)
> 
> Changes in v2:
>   - Make commit head lines congruent with PCI's style (Bjorn)
>   - Add missing error checks for devm_add_action(). (Andy)
>   - Repair the "Returns: " marks for docu generation (Andy)
>   - Initialize the addr_devres struct with memset(). (Andy)
>   - Make pcim_intx() a PCI-internal function so that new drivers won't
>     be encouraged to use the outdated pci_intx() mechanism.
>     (Andy / Philipp)
>   - Fix grammar and spelling (Bjorn)
>   - Be more precise on why pcim_iomap_table() is problematic (Bjorn)
>   - Provide the actual structs' and functions' names in the commit
>     messages (Bjorn)
>   - Remove redundant variable initializers (Andy)
>   - Regroup PM bitfield members in struct pci_dev (Andy)
>   - Make pcim_intx() visible only for the PCI subsystem so that new    
>     drivers won't use this outdated API (Andy, Myself)
>   - Add a NOTE to pcim_iomap() to warn about this function being the one
>     exception that does just return NULL.
>   - Consistently use the term "PCI devres API"; also in Patch #10 (Bjorn)
> 
> 
> ¡Hola!
> 
> PCI's devres API suffers several weaknesses:
> 
> 1. There are functions prefixed with pcim_. Those are always managed
>    counterparts to never-managed functions prefixed with pci_ – or so one
>    would like to think. There are some apparently unmanaged functions
>    (all region-request / release functions, and pci_intx()) which
>    suddenly become managed once the user has initialized the device with
>    pcim_enable_device() instead of pci_enable_device(). This "sometimes
>    yes, sometimes no" nature of those functions is confusing and
>    therefore bug-provoking. In fact, it has already caused a bug in DRM.
>    The last patch in this series fixes that bug.
> 2. iomappings: Instead of giving each mapping its own callback, the
>    existing API uses a statically allocated struct tracking one mapping
>    per bar. This is not extensible. Especially, you can't create
>    _ranged_ managed mappings that way, which many drivers want.
> 3. Managed request functions only exist as "plural versions" with a
>    bit-mask as a parameter. That's quite over-engineered considering
>    that each user only ever mapps one, maybe two bars.
> 
> This series:
> - add a set of new "singular" devres functions that use devres the way
>   its intended, with one callback per resource.
> - deprecates the existing iomap-table mechanism.
> - deprecates the hybrid nature of pci_ functions.
> - preserves backwards compatibility so that drivers using the existing
>   API won't notice any changes.
> - adds documentation, especially some warning users about the
>   complicated nature of PCI's devres.
> 
> 
> Note that this series is based on my "unify pci_iounmap"-series from a
> few weeks ago. [1]
> 
> I tested this on a x86 VM with a simple pci test-device with two
> regions. Operates and reserves resources as intended on my system.
> Kasan and kmemleak didn't find any problems.
> 
> I believe this series cleans the API up as much as possible without
> having to port all existing drivers to the new API. Especially, I think
> that this implementation is easy to extend if the need for new managed
> functions arises :)
> 
> Greetings,
> P.
> 
> Philipp Stanner (13):
>   PCI: Add and use devres helper for bit masks
>   PCI: Add devres helpers for iomap table
>   PCI: Add partial-BAR devres support
>   PCI: Deprecate two surplus devres functions
>   PCI: Make devres region requests consistent
>   PCI: Warn users about complicated devres nature
>   PCI: Remove enabled status bit from pci_devres
>   PCI: Move pinned status bit to struct pci_dev
>   PCI: Give pcim_set_mwi() its own devres callback
>   PCI: Give pci_intx() its own devres callback
>   PCI: Remove legacy pcim_release()
>   PCI: Add pcim_iomap_range()
>   drm/vboxvideo: fix mapping leaks
> 
>  drivers/gpu/drm/vboxvideo/vbox_main.c |  20 +-
>  drivers/pci/devres.c                  | 903 +++++++++++++++++++++-----
>  drivers/pci/iomap.c                   |  16 +
>  drivers/pci/pci.c                     |  94 ++-
>  drivers/pci/pci.h                     |  23 +-
>  include/linux/pci.h                   |   5 +-
>  6 files changed, 858 insertions(+), 203 deletions(-)

This is on pci/devres with some commit log rework and the following
diffs.  I think the bar short/int thing is the only actual code
change.  Happy to squash in any other updates or things I botched.

Planned for v6.11.

diff --git a/drivers/pci/devres.c b/drivers/pci/devres.c
index 2f0379a4e58f..d9b78a0d903a 100644
--- a/drivers/pci/devres.c
+++ b/drivers/pci/devres.c
@@ -11,7 +11,7 @@
  * 1. It is very strongly tied to the statically allocated mapping table in
  *    struct pcim_iomap_devres below. This is mostly solved in the sense of the
  *    pcim_ functions in this file providing things like ranged mapping by
- *    bypassing this table, wheras the functions that were present in the old
+ *    bypassing this table, whereas the functions that were present in the old
  *    API still enter the mapping addresses into the table for users of the old
  *    API.
  *
@@ -25,10 +25,11 @@
  *    Consequently, in the new API, region requests performed by the pcim_
  *    functions are automatically cleaned up through the devres callback
  *    pcim_addr_resource_release().
- *    Users utilizing pcim_enable_device() + pci_*region*() are redirected in
+ *
+ *    Users of pcim_enable_device() + pci_*region*() are redirected in
  *    pci.c to the managed functions here in this file. This isn't exactly
- *    perfect, but the only alternative way would be to port ALL drivers using
- *    said combination to pcim_ functions.
+ *    perfect, but the only alternative way would be to port ALL drivers
+ *    using said combination to pcim_ functions.
  *
  * TODO:
  * Remove the legacy table entirely once all calls to pcim_iomap_table() in
@@ -42,7 +43,7 @@ struct pcim_iomap_devres {
 	void __iomem *table[PCI_STD_NUM_BARS];
 };
 
-/* Used to restore the old intx state on driver detach. */
+/* Used to restore the old INTx state on driver detach. */
 struct pcim_intx_devres {
 	int orig_intx;
 };
@@ -77,7 +78,7 @@ struct pcim_addr_devres {
 	void __iomem *baseaddr;
 	unsigned long offset;
 	unsigned long len;
-	short bar;
+	int bar;
 };
 
 static inline void pcim_addr_devres_clear(struct pcim_addr_devres *res)
@@ -108,8 +109,9 @@ static inline void pcim_addr_devres_clear(struct pcim_addr_devres *res)
  * Request a range within a device's PCI BAR.  Sanity check the input.
  */
 static int __pcim_request_region_range(struct pci_dev *pdev, int bar,
-		unsigned long offset, unsigned long maxlen,
-		const char *name, int req_flags)
+				       unsigned long offset,
+				       unsigned long maxlen,
+				       const char *name, int req_flags)
 {
 	resource_size_t start = pci_resource_start(pdev, bar);
 	resource_size_t len = pci_resource_len(pdev, bar);
@@ -118,7 +120,7 @@ static int __pcim_request_region_range(struct pci_dev *pdev, int bar,
 	if (start == 0 || len == 0) /* Unused BAR. */
 		return 0;
 	if (len <= offset)
-		return  -EINVAL;
+		return -EINVAL;
 
 	start += offset;
 	len -= offset;
@@ -141,7 +143,8 @@ static int __pcim_request_region_range(struct pci_dev *pdev, int bar,
 }
 
 static void __pcim_release_region_range(struct pci_dev *pdev, int bar,
-		unsigned long offset, unsigned long maxlen)
+					unsigned long offset,
+					unsigned long maxlen)
 {
 	resource_size_t start = pci_resource_start(pdev, bar);
 	resource_size_t len = pci_resource_len(pdev, bar);
@@ -166,7 +169,7 @@ static void __pcim_release_region_range(struct pci_dev *pdev, int bar,
 }
 
 static int __pcim_request_region(struct pci_dev *pdev, int bar,
-		const char *name, int flags)
+				 const char *name, int flags)
 {
 	unsigned long offset = 0;
 	unsigned long len = pci_resource_len(pdev, bar);
@@ -208,7 +211,7 @@ static struct pcim_addr_devres *pcim_addr_devres_alloc(struct pci_dev *pdev)
 	struct pcim_addr_devres *res;
 
 	res = devres_alloc_node(pcim_addr_resource_release, sizeof(*res),
-			GFP_KERNEL, dev_to_node(&pdev->dev));
+				GFP_KERNEL, dev_to_node(&pdev->dev));
 	if (res)
 		pcim_addr_devres_clear(res);
 	return res;
@@ -223,7 +226,8 @@ static inline void pcim_addr_devres_free(struct pcim_addr_devres *res)
 /*
  * Used by devres to identify a pcim_addr_devres.
  */
-static int pcim_addr_resources_match(struct device *dev, void *a_raw, void *b_raw)
+static int pcim_addr_resources_match(struct device *dev,
+				     void *a_raw, void *b_raw)
 {
 	struct pcim_addr_devres *a, *b;
 
@@ -402,7 +406,6 @@ int pcim_set_mwi(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL(pcim_set_mwi);
 
-
 static inline bool mask_contains_bar(int mask, int bar)
 {
 	return mask & BIT(bar);
@@ -438,8 +441,8 @@ static struct pcim_intx_devres *get_or_create_intx_devres(struct device *dev)
  *
  * Returns: 0 on success, -ENOMEM on error.
  *
- * Enables/disables PCI INTx for device @pdev.
- * Restores the original state on driver detach.
+ * Enable/disable PCI INTx for device @pdev.
+ * Restore the original state on driver detach.
  */
 int pcim_intx(struct pci_dev *pdev, int enable)
 {
@@ -492,7 +495,7 @@ int pcim_enable_device(struct pci_dev *pdev)
 
 	/*
 	 * We prefer removing the action in case of an error over
-	 * devm_add_action_or_reset() because the later could theoretically be
+	 * devm_add_action_or_reset() because the latter could theoretically be
 	 * disturbed by users having pinned the device too soon.
 	 */
 	ret = pci_enable_device(pdev);
@@ -618,7 +621,7 @@ static void pcim_remove_mapping_from_legacy_table(struct pci_dev *pdev,
  * The same as pcim_remove_mapping_from_legacy_table(), but identifies the
  * mapping by its BAR index.
  */
-static void pcim_remove_bar_from_legacy_table(struct pci_dev *pdev, short bar)
+static void pcim_remove_bar_from_legacy_table(struct pci_dev *pdev, int bar)
 {
 	void __iomem **legacy_iomap_table;
 
@@ -783,7 +786,7 @@ static void pcim_iounmap_region(struct pci_dev *pdev, int bar)
 int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name)
 {
 	int ret;
-	short bar;
+	int bar;
 	void __iomem *mapping;
 
 	for (bar = 0; bar < DEVICE_COUNT_RESOURCE; bar++) {
@@ -813,7 +816,7 @@ int pcim_iomap_regions(struct pci_dev *pdev, int mask, const char *name)
 EXPORT_SYMBOL(pcim_iomap_regions);
 
 static int _pcim_request_region(struct pci_dev *pdev, int bar, const char *name,
-		int request_flags)
+				int request_flags)
 {
 	int ret;
 	struct pcim_addr_devres *res;
@@ -903,7 +906,7 @@ void pcim_release_region(struct pci_dev *pdev, int bar)
  */
 static void pcim_release_all_regions(struct pci_dev *pdev)
 {
-	short bar;
+	int bar;
 
 	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
 		pcim_release_region(pdev, bar);
@@ -923,7 +926,7 @@ static void pcim_release_all_regions(struct pci_dev *pdev)
 static int pcim_request_all_regions(struct pci_dev *pdev, const char *name)
 {
 	int ret;
-	short bar;
+	int bar;
 
 	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
 		ret = pcim_request_region(pdev, bar, name);
@@ -960,7 +963,7 @@ static int pcim_request_all_regions(struct pci_dev *pdev, const char *name)
 int pcim_iomap_regions_request_all(struct pci_dev *pdev, int mask,
 				   const char *name)
 {
-	short bar;
+	int bar;
 	int ret;
 	void __iomem **legacy_iomap_table;
 
@@ -1004,14 +1007,14 @@ EXPORT_SYMBOL(pcim_iomap_regions_request_all);
  */
 void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
 {
-	short bar;
+	int i;
 
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
-		if (!mask_contains_bar(mask, bar))
+	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
+		if (!mask_contains_bar(mask, i))
 			continue;
 
-		pcim_iounmap_region(pdev, bar);
-		pcim_remove_bar_from_legacy_table(pdev, bar);
+		pcim_iounmap_region(pdev, i);
+		pcim_remove_bar_from_legacy_table(pdev, i);
 	}
 }
 EXPORT_SYMBOL(pcim_iounmap_regions);
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 1b4832a60047..807f8be043cd 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4073,6 +4073,11 @@ EXPORT_SYMBOL(pci_release_regions);
  *
  * Returns 0 on success, or %EBUSY on error.  A warning
  * message is also printed on failure.
+ *
+ * NOTE:
+ * This is a "hybrid" function: It's normally unmanaged, but becomes managed
+ * when pcim_enable_device() has been called in advance. This hybrid feature is
+ * DEPRECATED! If you want managed cleanup, use the pcim_* functions instead.
  */
 int pci_request_regions(struct pci_dev *pdev, const char *res_name)
 {
@@ -4437,17 +4442,13 @@ void pci_disable_parity(struct pci_dev *dev)
  * NOTE:
  * This is a "hybrid" function: It's normally unmanaged, but becomes managed
  * when pcim_enable_device() has been called in advance. This hybrid feature is
- * DEPRECATED!
+ * DEPRECATED! If you want managed cleanup, use pcim_intx() instead.
  */
 void pci_intx(struct pci_dev *pdev, int enable)
 {
 	u16 pci_command, new;
 
-	/*
-	 * This is done for backwards compatibility, because the old PCI devres
-	 * API had a mode in which this function became managed if the dev had
-	 * been enabled with pcim_enable_device() instead of pci_enable_device().
-	 */
+	/* Preserve the "hybrid" behavior for backwards compatibility */
 	if (pci_is_managed(pdev)) {
 		WARN_ON_ONCE(pcim_intx(pdev, enable) != 0);
 		return;
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index e51e6fa79fcc..e6d299b93c21 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -813,7 +813,8 @@ static inline pci_power_t mid_pci_get_power_state(struct pci_dev *pdev)
 int pcim_intx(struct pci_dev *dev, int enable);
 
 int pcim_request_region(struct pci_dev *pdev, int bar, const char *name);
-int pcim_request_region_exclusive(struct pci_dev *pdev, int bar, const char *name);
+int pcim_request_region_exclusive(struct pci_dev *pdev, int bar,
+				  const char *name);
 void pcim_release_region(struct pci_dev *pdev, int bar);
 
 /*
