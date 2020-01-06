Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D73091316B9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 18:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA2A6E4C5;
	Mon,  6 Jan 2020 17:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B4D6E4CA;
 Mon,  6 Jan 2020 17:28:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jan 2020 09:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,403,1571727600"; d="scan'208";a="225496093"
Received: from plaxmina-desktop.iind.intel.com ([10.106.124.119])
 by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2020 09:28:19 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: rodrigo.vivi@intel.com, irlied@linux.ie, daniel@ffwll.ch,
 sudeep.dutt@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [Intel-gfx] [RFC 1/7] treewide: device: add condition support to
 dev_WARN
Date: Mon,  6 Jan 2020 22:53:20 +0530
Message-Id: <20200106172326.32592-2-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200106172326.32592-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200106172326.32592-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dev_WARN does not support conditional warning unlike WARN.

Add condition support to dev_WARN (file: include/linux/device.h)
to make it work like WARN and modify all existing callers to use it.

This is quite useful where we want to replace existing WARN with
dev_WARN.

Following cocci script is used to replace all the caller

   @@
   expression T;
   @@
   -dev_WARN(T,
   +dev_WARN(T, 1,
   ...)

command: spatch --sp-file <.cocci> --dir ./ --in-place --include-headers

Fix "drivers/gpu/drm/nouveau/include/nvkm/subdev/timer.h" manually as
coccinelle is unable to parse this file.

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 arch/x86/platform/intel-mid/pwr.c                   |  3 ++-
 drivers/base/core.c                                 |  2 +-
 drivers/base/dd.c                                   |  3 ++-
 drivers/dax/bus.c                                   |  2 +-
 drivers/dma/dw/core.c                               |  3 ++-
 drivers/dma/ioat/init.c                             |  2 +-
 drivers/dma/tegra210-adma.c                         |  6 ++++--
 drivers/gnss/core.c                                 |  2 +-
 drivers/gpu/drm/nouveau/include/nvkm/subdev/timer.h |  2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c             |  3 ++-
 drivers/gpu/drm/tegra/dc.c                          |  2 +-
 drivers/gpu/drm/tegra/hub.c                         |  7 ++++---
 drivers/greybus/core.c                              |  3 ++-
 drivers/i2c/i2c-core.h                              |  2 +-
 drivers/media/platform/exynos4-is/fimc-is.c         |  2 +-
 drivers/media/platform/exynos4-is/mipi-csis.c       |  2 +-
 drivers/nvdimm/label.c                              |  2 +-
 drivers/nvdimm/namespace_devs.c                     |  3 ++-
 drivers/nvdimm/nd-core.h                            |  2 +-
 drivers/pci/controller/pci-mvebu.c                  |  2 +-
 drivers/pci/endpoint/pci-epf-core.c                 |  6 +++---
 drivers/pci/iov.c                                   |  2 +-
 drivers/phy/phy-core.c                              |  2 +-
 drivers/regulator/pbias-regulator.c                 |  2 +-
 drivers/scsi/ufs/ufshcd.c                           |  3 ++-
 drivers/thunderbolt/ctl.c                           |  2 +-
 drivers/thunderbolt/nhi.c                           | 12 ++++++------
 drivers/thunderbolt/tb.h                            |  2 +-
 drivers/usb/core/urb.c                              |  8 ++++----
 drivers/usb/dwc3/dwc3-omap.c                        |  4 ++--
 drivers/usb/dwc3/ep0.c                              |  2 +-
 drivers/usb/dwc3/gadget.c                           |  6 +++---
 drivers/usb/host/uhci-q.c                           |  8 ++++----
 drivers/usb/typec/tcpm/wcove.c                      |  4 ++--
 drivers/vfio/vfio.c                                 |  4 ++--
 include/linux/device.h                              |  6 ++++--
 36 files changed, 70 insertions(+), 58 deletions(-)

diff --git a/arch/x86/platform/intel-mid/pwr.c b/arch/x86/platform/intel-mid/pwr.c
index 27288d8d3f71..bceb7c41a95e 100644
--- a/arch/x86/platform/intel-mid/pwr.c
+++ b/arch/x86/platform/intel-mid/pwr.c
@@ -197,7 +197,8 @@ static pci_power_t __find_weakest_power_state(struct mid_pwr_dev *lss,
 		lss[j].pdev = pdev;
 		lss[j].state = state;
 	} else {
-		dev_WARN(&pdev->dev, "No room for device in PWRMU LSS cache\n");
+		dev_WARN(&pdev->dev, 1,
+			 "No room for device in PWRMU LSS cache\n");
 		weakest = state;
 	}
 
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 42a672456432..ab7800d14668 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3588,7 +3588,7 @@ create_syslog_header(const struct device *dev, char *hdr, size_t hdrlen)
 	return pos;
 
 overflow:
-	dev_WARN(dev, "device/subsystem name too long");
+	dev_WARN(dev, 1, "device/subsystem name too long");
 	return 0;
 }
 
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index d811e60610d3..4935aedf2956 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -241,7 +241,8 @@ static int __driver_deferred_probe_check_state(struct device *dev)
 		return -EPROBE_DEFER;
 
 	if (!deferred_probe_timeout) {
-		dev_WARN(dev, "deferred probe timeout, ignoring dependency");
+		dev_WARN(dev, 1,
+			 "deferred probe timeout, ignoring dependency");
 		return -ETIMEDOUT;
 	}
 
diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index 46e46047a1f7..24da1c97b850 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -237,7 +237,7 @@ struct dax_region *alloc_dax_region(struct device *parent, int region_id,
 	 * developers of device-dax drivers.
 	 */
 	if (dev_get_drvdata(parent)) {
-		dev_WARN(parent, "dax core failed to setup private data\n");
+		dev_WARN(parent, 1, "dax core failed to setup private data\n");
 		return NULL;
 	}
 
diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 21cb2a58dbd2..455dafce7525 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -456,7 +456,8 @@ static void dwc_handle_error(struct dw_dma *dw, struct dw_dma_chan *dwc)
 	 * controller flagged an error instead of scribbling over
 	 * random memory locations.
 	 */
-	dev_WARN(chan2dev(&dwc->chan), "Bad descriptor submitted for DMA!\n"
+	dev_WARN(chan2dev(&dwc->chan), 1,
+				       "Bad descriptor submitted for DMA!\n"
 				       "  cookie: %d\n", bad_desc->txd.cookie);
 	dwc_dump_lli(dwc, bad_desc);
 	list_for_each_entry(child, &bad_desc->tx_list, desc_node)
diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
index a6a6dc432db8..e403b5fa635f 100644
--- a/drivers/dma/ioat/init.c
+++ b/drivers/dma/ioat/init.c
@@ -755,7 +755,7 @@ static int ioat_alloc_chan_resources(struct dma_chan *c)
 
 	chanerr = readl(ioat_chan->reg_base + IOAT_CHANERR_OFFSET);
 
-	dev_WARN(to_dev(ioat_chan),
+	dev_WARN(to_dev(ioat_chan), 1,
 		 "failed to start channel chanerr: %#x\n", chanerr);
 	ioat_free_chan_resources(c);
 	return -EFAULT;
diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 6e1268552f74..c5867241f707 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -274,7 +274,8 @@ static int tegra_adma_request_alloc(struct tegra_adma_chan *tdc,
 		break;
 
 	default:
-		dev_WARN(tdma->dev, "channel %s has invalid transfer type\n",
+		dev_WARN(tdma->dev, 1,
+			 "channel %s has invalid transfer type\n",
 			 dma_chan_name(&tdc->vc.chan));
 		return -EINVAL;
 	}
@@ -302,7 +303,8 @@ static void tegra_adma_request_free(struct tegra_adma_chan *tdc)
 		break;
 
 	default:
-		dev_WARN(tdma->dev, "channel %s has invalid transfer type\n",
+		dev_WARN(tdma->dev, 1,
+			 "channel %s has invalid transfer type\n",
 			 dma_chan_name(&tdc->vc.chan));
 		return;
 	}
diff --git a/drivers/gnss/core.c b/drivers/gnss/core.c
index e6f94501cb28..83df95f0da12 100644
--- a/drivers/gnss/core.c
+++ b/drivers/gnss/core.c
@@ -345,7 +345,7 @@ static const char *gnss_type_name(struct gnss_device *gdev)
 		name = gnss_type_names[gdev->type];
 
 	if (!name)
-		dev_WARN(&gdev->dev, "type name not defined\n");
+		dev_WARN(&gdev->dev, 1, "type name not defined\n");
 
 	return name;
 }
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/timer.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/timer.h
index a8c21c6c800b..a8379791d99c 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/timer.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/timer.h
@@ -60,7 +60,7 @@ s64 nvkm_timer_wait_test(struct nvkm_timer_wait *);
 	} while ((_taken = nvkm_timer_wait_test(&_wait)) >= 0);                \
                                                                                \
 	if (_warn && _taken < 0)                                               \
-		dev_WARN(_wait.tmr->subdev.device->dev, "timeout\n");          \
+		dev_WARN(_wait.tmr->subdev.device->dev, 1, "timeout\n");       \
 	_taken;                                                                \
 })
 #define nvkm_usec(d,u,cond...) nvkm_nsec((d), (u) * 1000, ##cond)
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index a3ed64a1f15e..38f8ea2dc89f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -447,7 +447,8 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		return -ENOENT;
 
 	if (!bo->is_heap) {
-		dev_WARN(pfdev->dev, "matching BO is not heap type (GPU VA = %llx)",
+		dev_WARN(pfdev->dev, 1,
+			 "matching BO is not heap type (GPU VA = %llx)",
 			 bo->node.start << PAGE_SHIFT);
 		ret = -EINVAL;
 		goto err_bo;
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 714af052fbef..07baf633a4f0 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -69,7 +69,7 @@ static inline unsigned int tegra_plane_offset(struct tegra_plane *plane,
 		return plane->offset + offset;
 	}
 
-	dev_WARN(plane->dc->dev, "invalid offset: %x\n", offset);
+	dev_WARN(plane->dc->dev, 1, "invalid offset: %x\n", offset);
 
 	return plane->offset + offset;
 }
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 47d985ac7cd7..8d3df12f4d34 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -76,7 +76,7 @@ static inline unsigned int tegra_plane_offset(struct tegra_plane *plane,
 		return plane->offset + offset;
 	}
 
-	dev_WARN(plane->dc->dev, "invalid offset: %x\n", offset);
+	dev_WARN(plane->dc->dev, 1, "invalid offset: %x\n", offset);
 
 	return plane->offset + offset;
 }
@@ -220,7 +220,8 @@ static bool tegra_dc_owns_shared_plane(struct tegra_dc *dc,
 		if (plane->dc == dc)
 			return true;
 
-		dev_WARN(dev, "head %u owns window %u but is not attached\n",
+		dev_WARN(dev, 1,
+			 "head %u owns window %u but is not attached\n",
 			 dc->pipe, plane->index);
 	}
 
@@ -241,7 +242,7 @@ static int tegra_shared_plane_set_owner(struct tegra_plane *plane,
 	owner = value & OWNER_MASK;
 
 	if (new && (owner != OWNER_MASK && owner != new->pipe)) {
-		dev_WARN(dev, "window %u owned by head %u\n", index, owner);
+		dev_WARN(dev, 1, "window %u owned by head %u\n", index, owner);
 		return -EBUSY;
 	}
 
diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
index e546c6431877..0f501db74f89 100644
--- a/drivers/greybus/core.c
+++ b/drivers/greybus/core.c
@@ -110,7 +110,8 @@ static int greybus_uevent(struct device *dev, struct kobj_uevent_env *env)
 		svc = to_gb_svc(dev);
 		hd = svc->hd;
 	} else {
-		dev_WARN(dev, "uevent for unknown greybus device \"type\"!\n");
+		dev_WARN(dev, 1,
+			 "uevent for unknown greybus device \"type\"!\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 517d98be68d2..46fded32bb00 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -51,7 +51,7 @@ static inline int __i2c_check_suspended(struct i2c_adapter *adap)
 {
 	if (test_bit(I2C_ALF_IS_SUSPENDED, &adap->locked_flags)) {
 		if (!test_and_set_bit(I2C_ALF_SUSPEND_REPORTED, &adap->locked_flags))
-			dev_WARN(&adap->dev, "Transfer while suspended\n");
+			dev_WARN(&adap->dev, 1, "Transfer while suspended\n");
 		return -ESHUTDOWN;
 	}
 
diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
index 64148b7e0d98..0998eb3723a9 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/exynos4-is/fimc-is.c
@@ -299,7 +299,7 @@ int fimc_is_wait_event(struct fimc_is *is, unsigned long bit,
 				     !state ^ test_bit(bit, &is->state),
 				     timeout);
 	if (ret == 0) {
-		dev_WARN(&is->pdev->dev, "%s() timed out\n", __func__);
+		dev_WARN(&is->pdev->dev, 1, "%s() timed out\n", __func__);
 		return -ETIME;
 	}
 	return 0;
diff --git a/drivers/media/platform/exynos4-is/mipi-csis.c b/drivers/media/platform/exynos4-is/mipi-csis.c
index 540151bbf58f..b38420bf2e56 100644
--- a/drivers/media/platform/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/exynos4-is/mipi-csis.c
@@ -822,7 +822,7 @@ static int s5pcsis_probe(struct platform_device *pdev)
 		ret = clk_set_rate(state->clock[CSIS_CLK_MUX],
 				   state->clk_frequency);
 	else
-		dev_WARN(dev, "No clock frequency specified!\n");
+		dev_WARN(dev, 1, "No clock frequency specified!\n");
 	if (ret < 0)
 		goto e_clkput;
 
diff --git a/drivers/nvdimm/label.c b/drivers/nvdimm/label.c
index 47a4828b8b31..dd86bc64ecb1 100644
--- a/drivers/nvdimm/label.c
+++ b/drivers/nvdimm/label.c
@@ -1127,7 +1127,7 @@ static int __blk_label_update(struct nd_region *nd_region,
 			break;
 		}
 		if (nd_label)
-			dev_WARN(&nsblk->common.dev,
+			dev_WARN(&nsblk->common.dev, 1,
 					"failed to track label slot%d\n", slot);
 	}
 	mutex_unlock(&nd_mapping->lock);
diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
index 032dc61725ff..7e007225a6c7 100644
--- a/drivers/nvdimm/namespace_devs.c
+++ b/drivers/nvdimm/namespace_devs.c
@@ -140,7 +140,8 @@ unsigned int pmem_sector_size(struct nd_namespace_common *ndns)
 		else if (nspm->lbasize == 4096)
 			return 4096;
 		else
-			dev_WARN(&ndns->dev, "unsupported sector size: %ld\n",
+			dev_WARN(&ndns->dev, 1,
+					"unsupported sector size: %ld\n",
 					nspm->lbasize);
 	}
 
diff --git a/drivers/nvdimm/nd-core.h b/drivers/nvdimm/nd-core.h
index ddb9d97d9129..f94cc18098e8 100644
--- a/drivers/nvdimm/nd-core.h
+++ b/drivers/nvdimm/nd-core.h
@@ -210,7 +210,7 @@ static inline void debug_nvdimm_lock(struct device *dev)
 	else if (dev->class && dev->class == nd_class)
 		mutex_lock_nested(&dev->lockdep_mutex, LOCK_NDCTL);
 	else
-		dev_WARN(dev, "unknown lock level\n");
+		dev_WARN(dev, 1, "unknown lock level\n");
 }
 
 static inline void debug_nvdimm_unlock(struct device *dev)
diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index 153a64676bc9..44c7696f8f13 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -373,7 +373,7 @@ static void mvebu_pcie_handle_iobase_change(struct mvebu_pcie_port *port)
 	}
 
 	if (!mvebu_has_ioport(port)) {
-		dev_WARN(&port->pcie->pdev->dev,
+		dev_WARN(&port->pcie->pdev->dev, 1,
 			 "Attempt to set IO when IO is disabled\n");
 		return;
 	}
diff --git a/drivers/pci/endpoint/pci-epf-core.c b/drivers/pci/endpoint/pci-epf-core.c
index fb1306de8f40..3e0a12ac4943 100644
--- a/drivers/pci/endpoint/pci-epf-core.c
+++ b/drivers/pci/endpoint/pci-epf-core.c
@@ -32,7 +32,7 @@ static const struct device_type pci_epf_type;
 void pci_epf_linkup(struct pci_epf *epf)
 {
 	if (!epf->driver) {
-		dev_WARN(&epf->dev, "epf device not bound to driver\n");
+		dev_WARN(&epf->dev, 1, "epf device not bound to driver\n");
 		return;
 	}
 
@@ -51,7 +51,7 @@ EXPORT_SYMBOL_GPL(pci_epf_linkup);
 void pci_epf_unbind(struct pci_epf *epf)
 {
 	if (!epf->driver) {
-		dev_WARN(&epf->dev, "epf device not bound to driver\n");
+		dev_WARN(&epf->dev, 1, "epf device not bound to driver\n");
 		return;
 	}
 
@@ -70,7 +70,7 @@ EXPORT_SYMBOL_GPL(pci_epf_unbind);
 int pci_epf_bind(struct pci_epf *epf)
 {
 	if (!epf->driver) {
-		dev_WARN(&epf->dev, "epf device not bound to driver\n");
+		dev_WARN(&epf->dev, 1, "epf device not bound to driver\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 1e88fd427757..8e4bf40d02a7 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -812,7 +812,7 @@ void pci_iov_update_resource(struct pci_dev *dev, int resno)
 
 	pci_read_config_word(dev, iov->pos + PCI_SRIOV_CTRL, &cmd);
 	if ((cmd & PCI_SRIOV_CTRL_VFE) && (cmd & PCI_SRIOV_CTRL_MSE)) {
-		dev_WARN(&dev->dev, "can't update enabled VF BAR%d %pR\n",
+		dev_WARN(&dev->dev, 1, "can't update enabled VF BAR%d %pR\n",
 			 vf_bar, res);
 		return;
 	}
diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index b04f4fe85ac2..38835a260170 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -653,7 +653,7 @@ struct phy *phy_get(struct device *dev, const char *string)
 	struct phy *phy;
 
 	if (string == NULL) {
-		dev_WARN(dev, "missing string\n");
+		dev_WARN(dev, 1, "missing string\n");
 		return ERR_PTR(-EINVAL);
 	}
 
diff --git a/drivers/regulator/pbias-regulator.c b/drivers/regulator/pbias-regulator.c
index bfc15dd3f730..a19684b5536d 100644
--- a/drivers/regulator/pbias-regulator.c
+++ b/drivers/regulator/pbias-regulator.c
@@ -180,7 +180,7 @@ static int pbias_regulator_probe(struct platform_device *pdev)
 			return -EINVAL;
 
 		offset = res->start;
-		dev_WARN(&pdev->dev,
+		dev_WARN(&pdev->dev, 1,
 			 "using legacy dt data for pbias offset\n");
 	}
 
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index b5966faf3e98..ad71ce2035c5 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -5771,7 +5771,8 @@ static int __ufshcd_issue_tm_cmd(struct ufs_hba *hba,
 		dev_err(hba->dev, "%s: task management cmd 0x%.2x timed-out\n",
 				__func__, tm_function);
 		if (ufshcd_clear_tm_cmd(hba, free_slot))
-			dev_WARN(hba->dev, "%s: unable clear tm cmd (slot %d) after timeout\n",
+			dev_WARN(hba->dev, 1,
+					"%s: unable clear tm cmd (slot %d) after timeout\n",
 					__func__, free_slot);
 		err = -ETIMEDOUT;
 	} else {
diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index d97813e80e5f..68dbc63ca838 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -39,7 +39,7 @@ struct tb_ctl {
 
 
 #define tb_ctl_WARN(ctl, format, arg...) \
-	dev_WARN(&(ctl)->nhi->pdev->dev, format, ## arg)
+	dev_WARN(&(ctl)->nhi->pdev->dev, 1,  format, ## arg)
 
 #define tb_ctl_err(ctl, format, arg...) \
 	dev_err(&(ctl)->nhi->pdev->dev, format, ## arg)
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 641b21b54460..70848984d950 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -102,7 +102,7 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 		active ? "enabling" : "disabling", reg, bit, old, new);
 
 	if (new == old)
-		dev_WARN(&ring->nhi->pdev->dev,
+		dev_WARN(&ring->nhi->pdev->dev, 1,
 					 "interrupt for %s %d is already %s\n",
 					 RING_TYPE(ring), ring->hop,
 					 active ? "enabled" : "disabled");
@@ -599,7 +599,7 @@ void tb_ring_start(struct tb_ring *ring)
 	if (ring->nhi->going_away)
 		goto err;
 	if (ring->running) {
-		dev_WARN(&ring->nhi->pdev->dev, "ring already started\n");
+		dev_WARN(&ring->nhi->pdev->dev, 1, "ring already started\n");
 		goto err;
 	}
 	dev_dbg(&ring->nhi->pdev->dev, "starting %s %d\n",
@@ -669,7 +669,7 @@ void tb_ring_stop(struct tb_ring *ring)
 	if (ring->nhi->going_away)
 		goto err;
 	if (!ring->running) {
-		dev_WARN(&ring->nhi->pdev->dev, "%s %d already stopped\n",
+		dev_WARN(&ring->nhi->pdev->dev, 1, "%s %d already stopped\n",
 			 RING_TYPE(ring), ring->hop);
 		goto err;
 	}
@@ -718,7 +718,7 @@ void tb_ring_free(struct tb_ring *ring)
 		ring->nhi->rx_rings[ring->hop] = NULL;
 
 	if (ring->running) {
-		dev_WARN(&ring->nhi->pdev->dev, "%s %d still running\n",
+		dev_WARN(&ring->nhi->pdev->dev, 1, "%s %d still running\n",
 			 RING_TYPE(ring), ring->hop);
 	}
 	spin_unlock_irq(&ring->nhi->lock);
@@ -1018,10 +1018,10 @@ static void nhi_shutdown(struct tb_nhi *nhi)
 
 	for (i = 0; i < nhi->hop_count; i++) {
 		if (nhi->tx_rings[i])
-			dev_WARN(&nhi->pdev->dev,
+			dev_WARN(&nhi->pdev->dev, 1,
 				 "TX ring %d is still active\n", i);
 		if (nhi->rx_rings[i])
-			dev_WARN(&nhi->pdev->dev,
+			dev_WARN(&nhi->pdev->dev, 1,
 				 "RX ring %d is still active\n", i);
 	}
 	nhi_disable_interrupts(nhi);
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index ec851f20c571..9b0fb4ee5e66 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -450,7 +450,7 @@ static inline int tb_port_write(struct tb_port *port, const void *buffer,
 }
 
 #define tb_err(tb, fmt, arg...) dev_err(&(tb)->nhi->pdev->dev, fmt, ## arg)
-#define tb_WARN(tb, fmt, arg...) dev_WARN(&(tb)->nhi->pdev->dev, fmt, ## arg)
+#define tb_WARN(tb, fmt, arg...) dev_WARN(&(tb)->nhi->pdev->dev, 1, fmt, ## arg)
 #define tb_warn(tb, fmt, arg...) dev_warn(&(tb)->nhi->pdev->dev, fmt, ## arg)
 #define tb_info(tb, fmt, arg...) dev_info(&(tb)->nhi->pdev->dev, fmt, ## arg)
 #define tb_dbg(tb, fmt, arg...) dev_dbg(&(tb)->nhi->pdev->dev, fmt, ## arg)
diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index da923ec17612..3b7a4151ba79 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -475,8 +475,8 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
 
 	/* Check that the pipe's type matches the endpoint's type */
 	if (usb_urb_ep_type_check(urb))
-		dev_WARN(&dev->dev, "BOGUS urb xfer, pipe %x != type %x\n",
-			usb_pipetype(urb->pipe), pipetypes[xfertype]);
+		dev_WARN(&dev->dev, 1, "BOGUS urb xfer, pipe %x != type %x\n",
+			 usb_pipetype(urb->pipe), pipetypes[xfertype]);
 
 	/* Check against a simple/standard policy */
 	allowed = (URB_NO_TRANSFER_DMA_MAP | URB_NO_INTERRUPT | URB_DIR_MASK |
@@ -499,8 +499,8 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
 
 	/* warn if submitter gave bogus flags */
 	if (allowed != urb->transfer_flags)
-		dev_WARN(&dev->dev, "BOGUS urb flags, %x --> %x\n",
-			urb->transfer_flags, allowed);
+		dev_WARN(&dev->dev, 1, "BOGUS urb flags, %x --> %x\n",
+			 urb->transfer_flags, allowed);
 
 	/*
 	 * Force periodic transfer intervals to be legal values that are
diff --git a/drivers/usb/dwc3/dwc3-omap.c b/drivers/usb/dwc3/dwc3-omap.c
index 8c3de2d258bf..f6ef00e2b463 100644
--- a/drivers/usb/dwc3/dwc3-omap.c
+++ b/drivers/usb/dwc3/dwc3-omap.c
@@ -258,7 +258,7 @@ static void dwc3_omap_set_mailbox(struct dwc3_omap *omap,
 		break;
 
 	default:
-		dev_WARN(omap->dev, "invalid state\n");
+		dev_WARN(omap->dev, 1, "invalid state\n");
 	}
 }
 
@@ -404,7 +404,7 @@ static void dwc3_omap_set_utmi_mode(struct dwc3_omap *omap)
 		reg &= ~USBOTGSS_UTMI_OTG_CTRL_SW_MODE;
 		break;
 	default:
-		dev_WARN(omap->dev, "UNKNOWN utmi mode %d\n", utmi_mode);
+		dev_WARN(omap->dev, 1, "UNKNOWN utmi mode %d\n", utmi_mode);
 	}
 
 	dwc3_omap_write_utmi_ctrl(omap, reg);
diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index fd1b100d2927..8eea1c5cc751 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -110,7 +110,7 @@ static int __dwc3_gadget_ep0_queue(struct dwc3_ep *dep,
 		direction = !!(dep->flags & DWC3_EP0_DIR_IN);
 
 		if (dwc->ep0state != EP0_DATA_PHASE) {
-			dev_WARN(dwc->dev, "Unexpected pending request\n");
+			dev_WARN(dwc->dev, 1, "Unexpected pending request\n");
 			return 0;
 		}
 
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 0c960a97ea02..81dfb89d3dd4 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -370,7 +370,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned cmd,
 				ret = -EAGAIN;
 				break;
 			default:
-				dev_WARN(dwc->dev, "UNKNOWN cmd status\n");
+				dev_WARN(dwc->dev, 1, "UNKNOWN cmd status\n");
 			}
 
 			break;
@@ -980,7 +980,7 @@ static void __dwc3_prepare_one_trb(struct dwc3_ep *dep, struct dwc3_trb *trb,
 		 * This is only possible with faulty memory because we
 		 * checked it already :)
 		 */
-		dev_WARN(dwc->dev, "Unknown endpoint type %d\n",
+		dev_WARN(dwc->dev, 1, "Unknown endpoint type %d\n",
 				usb_endpoint_type(dep->endpoint.desc));
 	}
 
@@ -3134,7 +3134,7 @@ static void dwc3_gadget_interrupt(struct dwc3 *dwc,
 	case DWC3_DEVICE_EVENT_OVERFLOW:
 		break;
 	default:
-		dev_WARN(dwc->dev, "UNKNOWN IRQ %d\n", event->type);
+		dev_WARN(dwc->dev, 1, "UNKNOWN IRQ %d\n", event->type);
 	}
 }
 
diff --git a/drivers/usb/host/uhci-q.c b/drivers/usb/host/uhci-q.c
index 35fcb826152c..319e997210fc 100644
--- a/drivers/usb/host/uhci-q.c
+++ b/drivers/usb/host/uhci-q.c
@@ -124,9 +124,9 @@ static struct uhci_td *uhci_alloc_td(struct uhci_hcd *uhci)
 static void uhci_free_td(struct uhci_hcd *uhci, struct uhci_td *td)
 {
 	if (!list_empty(&td->list))
-		dev_WARN(uhci_dev(uhci), "td %p still in list!\n", td);
+		dev_WARN(uhci_dev(uhci), 1, "td %p still in list!\n", td);
 	if (!list_empty(&td->fl_list))
-		dev_WARN(uhci_dev(uhci), "td %p still in fl_list!\n", td);
+		dev_WARN(uhci_dev(uhci), 1, "td %p still in fl_list!\n", td);
 
 	dma_pool_free(uhci->td_pool, td, td->dma_handle);
 }
@@ -293,7 +293,7 @@ static void uhci_free_qh(struct uhci_hcd *uhci, struct uhci_qh *qh)
 {
 	WARN_ON(qh->state != QH_STATE_IDLE && qh->udev);
 	if (!list_empty(&qh->queue))
-		dev_WARN(uhci_dev(uhci), "qh %p list not empty!\n", qh);
+		dev_WARN(uhci_dev(uhci), 1, "qh %p list not empty!\n", qh);
 
 	list_del(&qh->node);
 	if (qh->udev) {
@@ -743,7 +743,7 @@ static void uhci_free_urb_priv(struct uhci_hcd *uhci,
 	struct uhci_td *td, *tmp;
 
 	if (!list_empty(&urbp->node))
-		dev_WARN(uhci_dev(uhci), "urb %p still on QH's list!\n",
+		dev_WARN(uhci_dev(uhci), 1, "urb %p still on QH's list!\n",
 				urbp->urb);
 
 	list_for_each_entry_safe(td, tmp, &urbp->td_list, list) {
diff --git a/drivers/usb/typec/tcpm/wcove.c b/drivers/usb/typec/tcpm/wcove.c
index edc271da14f4..6591c28dda5c 100644
--- a/drivers/usb/typec/tcpm/wcove.c
+++ b/drivers/usb/typec/tcpm/wcove.c
@@ -559,14 +559,14 @@ static irqreturn_t wcove_typec_irq(int irq, void *data)
 	if (usbc_irq1) {
 		ret = regmap_write(wcove->regmap, USBC_IRQ1, usbc_irq1);
 		if (ret)
-			dev_WARN(wcove->dev, "%s failed to clear IRQ1\n",
+			dev_WARN(wcove->dev, 1, "%s failed to clear IRQ1\n",
 				 __func__);
 	}
 
 	if (usbc_irq2) {
 		ret = regmap_write(wcove->regmap, USBC_IRQ2, usbc_irq2);
 		if (ret)
-			dev_WARN(wcove->dev, "%s failed to clear IRQ2\n",
+			dev_WARN(wcove->dev, 1, "%s failed to clear IRQ2\n",
 				 __func__);
 	}
 
diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index c8482624ca34..78770a0f8de8 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -702,7 +702,7 @@ static int vfio_group_nb_add_dev(struct vfio_group *group, struct device *dev)
 		return 0;
 
 	/* TODO Prevent device auto probing */
-	dev_WARN(dev, "Device added to live group %d!\n",
+	dev_WARN(dev, 1, "Device added to live group %d!\n",
 		 iommu_group_id(group->iommu_group));
 
 	return 0;
@@ -825,7 +825,7 @@ int vfio_add_group_dev(struct device *dev,
 
 	device = vfio_group_get_device(group, dev);
 	if (device) {
-		dev_WARN(dev, "Device already exists on group %d\n",
+		dev_WARN(dev, 1, "Device already exists on group %d\n",
 			 iommu_group_id(iommu_group));
 		vfio_device_put(device);
 		vfio_group_put(group);
diff --git a/include/linux/device.h b/include/linux/device.h
index 96ff76731e93..829ffc02cb74 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1895,8 +1895,10 @@ do {									\
  * dev_WARN*() acts like dev_printk(), but with the key difference of
  * using WARN/WARN_ONCE to include file/line information and a backtrace.
  */
-#define dev_WARN(dev, format, arg...) \
-	WARN(1, "%s %s: " format, dev_driver_string(dev), dev_name(dev), ## arg);
+
+#define dev_WARN(dev, condition, format, arg...) \
+	WARN(condition, "%s %s: " format, \
+			dev_driver_string(dev), dev_name(dev), ## arg)
 
 #define dev_WARN_ONCE(dev, condition, format, arg...) \
 	WARN_ONCE(condition, "%s %s: " format, \
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
