Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377ED1E02B0
	for <lists+dri-devel@lfdr.de>; Sun, 24 May 2020 22:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2DD89DAB;
	Sun, 24 May 2020 20:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD45B89DAB
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 20:15:47 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C56DF804FE;
 Sun, 24 May 2020 22:06:56 +0200 (CEST)
Date: Sun, 24 May 2020 22:06:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: MIPI DSI, DBI, and tinydrm drivers
Message-ID: <20200524200655.GA44152@ravnborg.org>
References: <4QFUAQ.UPWBIKSUSOG@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <4QFUAQ.UPWBIKSUSOG@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=eEMmv47kufRDOTmcqIIA:9 a=CjuIK1q_8ugA:10 a=7gkXJVJtAAAA:8
 a=gEfo2CItAAAA:8 a=Lvo1erVcIknoxfrIJH8A:9 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19
 a=eF-Px_7h_Y1Eip52:21 a=-qj6_xpbrLTv00Q-:21 a=TOstJbjJWGlJwXmxvioA:9
 a=cu-Mrie6Tg_G6UyD:21 a=Yh7_m-EaHJ_3T3N_:21 a=E9Po1WZjFZOl8hwRPBS3:22
 a=sptkURWiP4Gy88Gu7hUp:22
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul.

On Sun, May 24, 2020 at 06:13:16PM +0200, Paul Cercueil wrote:
> Hi list,
> 
> I'd like to open a discussion about the current support of MIPI DSI and DBI
> panels.
> 
> Both are standards from the MIPI alliance, both are communication protocols
> between a LCD controller and a LCD panel, they generally both use the same
> commands (DCS), the main difference is that DSI is serial and DBI is
> generally parallel.
> 
> In the kernel right now, DSI is pretty well implemented. All the
> infrastucture to register a DSI host, DSI device etc. is there. DSI panels
> are implemented as regular drm_panel instances, and their drivers go through
> the DSI API to communicate with the panel, which makes them independent of
> the DSI host driver.
> 
> DBI, on the other hand, does not have any of this. All (?) DBI panels are
> implemented as tinydrm drivers, which make them impossible to use with
> regular DRM drivers. Writing a standard drm_panel driver is impossible, as
> there is no concept of host and device. All these tinydrm drivers register
> their own DBI host as they all do DBI over SPI.
> 
> I think this needs a good cleanup. Given that DSI and DBI are so similar, it
> would probably make sense to fuse DBI support into the current DSI code, as
> trying to update DBI would result in a lot of code being duplicated. With
> the proper host/device registration mechanism from DSI code, it would be
> possible to turn most of the tinydrm drivers into regular drm_panel drivers.

We could add proper support for a DBI bus, like we have today for DSI.
This seems like the simple approach as we then have a DSI and a DBI bus.

But many panels implement support for both DSI and DBI and then what to
do then? We could register a driver based on the configuration like we
do in some drivers already. But this would push logic to the dirvers
which we would like to keep simple.
We could also try to extend the current DSI bus support to cover
DBI too - but thats seems also to be not so elegant.

I atually started on the framework bits for implementing a DBI bus
but got sidetracked so did not get far.
And back then I also was concerned if we should go for a dedicated
DBI bus or we should do something else.

I have attached two WIP patches from when I looked at it.
The binding needs extra work and the code may not even build...

> The problem then is that these should still be available as tinydrm drivers.
> If the DSI/DBI panels can somehow register a .update_fb() callback, it would
> make it possible to have a panel-agnostic tinydrm driver, which would then
> probably open a lot of doors, and help a lot to clean the mess.
We should find a clean solution for new drivers and then we can see what
to do for the existing drivers.
We only have a few existing tiny drivers for now - and knowing the
amount of panel candidates that exist we have to make it simple to
add support for new panels, both DBI, DSI and DPI variants.

And if we could then find a way to allow the user to specify the init
sequence without modifying the kernel then we could make it much
simpler again. Noralf have a solution for this in staging but I think
we need something else in DRM.
I have had in mind if we could ut something in initrd or some sort but
that is down on the TODO list to look at.

	Sam

--ReaqsoxgOBHFXBhH
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-dt-bindings-display-add-MIPI-DBI-bus.patch"

From 228da4a6e96e18e68f992d3eb9f269383e96bc3e Mon Sep 17 00:00:00 2001
From: Sam Ravnborg <sam@ravnborg.org>
Date: Sat, 8 Feb 2020 11:31:03 +0100
Subject: [PATCH 1/2] dt-bindings: display: add MIPI DBI bus

Add binding for a GPIO based MIPI DBI bus.
The binding describes Type A and Type B.

Type C, that uses SPI, is not covered by the binding.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/mipi-dbi-bus.yaml        | 162 ++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mipi-dbi-bus.yaml

diff --git a/Documentation/devicetree/bindings/display/mipi-dbi-bus.yaml b/Documentation/devicetree/bindings/display/mipi-dbi-bus.yaml
new file mode 100644
index 000000000000..43d7a5cb0bda
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mipi-dbi-bus.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mipi-dbi-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPI DBI (Display Bus Interface) bus
+
+maintainers:
+  - Sam Ravnborg <sam@ravnborg.org>
+
+description: |
+  MIPI DBI describes a bus interface which is used for display panels.
+  MIPI DBI can be configured for different bus widths.
+ 
+  This documents describes the bindings used to represent HW that
+  is compatible with MIPI DBI - using GPIOs for signalling.
+
+  Only MIPI DBI Type 1 interfaces are supported by this binding.
+  There are three types of type 1 interfaces respectively:
+  - Type A: Motorola 6800 type parallel bus
+    Type A interface can either be "Fixed E" or "Clocked E".
+    Bus width is either 8, 9 or 16 bits.
+    Type A interfaces uses the same signal for read and write - R/WX
+  - Type B: Intel 8080 type parallel bus
+    Bus width is either 8, 9 or 16 bits.
+    Type B interfaces uses dedicated signals for read and write - RDX and WRX.
+  - C. SPI type with 3 options:
+    Option 1: 9-bit with the Data/Command signal as the ninth bit
+    Option 2: Same as above except it's sent as 16 bits
+    Option 3: 8-bit with the Data/Command signal as a separate D/CX pin
+
+  The following ascii picture shows the signals between CPU and a display.
+  The picture uses 8080 mode
+    +-----+            +---------+
+    |     |---read---->|         |
+    | CPU |---write--->| display |
+    |     |---dc------>|         |
+    |     |---cs------>|         |
+    |     |<==data[]==>|         |
+    |     |---reset--->|         |
+    +-----+            +---------+
+
+    The MIPI DBI bus can include several displays, each with their
+    individual chip selct - CSX.
+    All displays must use the same type of interface.
+    The displays are represented as child nodes of the mipi-dbi node,
+    each with a reg property that is an index to the chip selects
+    specified in the dbi node.
+
+properties:
+  # MIPI DBI Bus properties
+  $nodename:
+    pattern: "^dbi(@.*|-[0-9a-f])*$"
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  mipi-dbi-type:
+    enum:
+      - dbi-type-1-a
+      - dbi-type-1-b
+      - dbi-type-1-c
+    description: |
+      Define the type of MIPI DBI interface, either type a, b or c.
+
+  rw-gpios:
+    description: |
+      GPIO for the read/write (R/WX) signal - used for 6800 (type-1-a).
+      Data is read when high, and written when low.
+
+  read-gpios:
+    description: |
+      GPIO for the read (RDX) signal - used for 8080 (type-1-b)
+      The CPU read data at the rising edge.
+
+  write-gpios:
+    description: |
+      GPIO for the write (WRX) signal - used for 8080 (type-1-b).
+      The CPU writes data at the rising edge.
+
+  dc-gpios:
+    description: |
+      Data/command selection (D/CX).
+      Used for 6800 (type-1-a) and 8080 (type-1-b).
+      Data when high, and command when low.
+  
+  data-gpios:
+    minItems: 8
+    maxItems: 16
+    description: |
+      An array of either 4, 8 or 9 GPIO specifiers.
+      8 - 8-bit mode D[7:0]
+      9 - 9-bit mode D[8:0]
+      16 - 19-bit mode D[15:0]
+       
+  e-clock-gpios:
+    description: |
+      In Clocked E mode the CPU writes data at falling edge
+      and reads data at rising edge
+
+  te-gpios:
+    description: Tearing effect synchronization signal
+
+  reset-gpios:
+    description: Reset signal
+
+  cs-gpios:
+    minItems: 1
+    maxItems: 8
+    description: GPIOs to use for chipselect lines
+
+patternProperties:
+  "^panel@[0-7]$":
+    description: Display panels connected to the DBI bus
+    type: object
+
+required:
+  - mipi-dbi-type
+
+additionalProperties: false
+
+examples:
+  - |
+    dbi {
+      mipi-dbi-type = "dbi-type-1-b";
+      #address-cells = <1>;
+      #size-cells = <0>;
+      read-gpios = <&pioA 7 0>;
+      write-gpios = <&pioA 8 0>;
+      dc-gpios = <&pioA 9 0>;
+      data-gpios = <&pioB 0 0>,
+                   <&pioB 1 0>,
+                   <&pioB 2 0>,
+                   <&pioB 3 0>,
+                   <&pioB 4 0>,
+                   <&pioB 5 0>,
+                   <&pioB 6 0>,
+                   <&pioB 7 0>;
+      reset-gpios = <&pioA 2 0>;
+
+      /* Two displays 0 and 1 */
+      cs-gpios = <&pioC 0 0>,
+                 <&pioC 1 0>;
+
+      panel@0 {
+        compatible = "hit,hd44780-dbi";
+        reg = <0>;
+        backlight = <&gpio_backlight>;
+      };
+
+      panel@1 {
+        compatible = "winstar,foo-dbi";
+        reg = <1>;
+        backlight = <&bl_pwm>;
+      };
+    }; 
+
+...
-- 
2.25.1


--ReaqsoxgOBHFXBhH
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0002-drm-add-MIPI-DBI-bus-infrastructure.patch"

From 158322e3f55b614c20e186111fdf23a47e375931 Mon Sep 17 00:00:00 2001
From: Sam Ravnborg <sam@ravnborg.org>
Date: Sat, 8 Feb 2020 21:51:02 +0100
Subject: [PATCH 2/2] drm: add MIPI DBI bus infrastructure

Add infrastructure to register MIPI DBI display drivers.
The code is more or less a straight copy from drm_mipi_dsi
with adaptions like host => display etc.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 247 +++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dbi.h     | 135 ++++++++++++++++++
 2 files changed, 382 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 558baf989f5a..8341499e303f 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -10,6 +10,8 @@
 #include <linux/dma-buf.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
 
@@ -1327,4 +1329,249 @@ EXPORT_SYMBOL(mipi_dbi_debugfs_init);
 
 #endif
 
+static int mipi_dbi_device_match(struct device *dev, struct device_driver *drv)
+{
+        struct mipi_dbi_dev *dbi = to_mipi_dbi_dev(dev);
+
+        /* attempt OF style match */
+        if (of_driver_match_device(dev, drv))
+                return 1;
+
+        /* compare DBI device and driver names */
+        if (!strcmp(dbi->name, drv->name))
+                return 1;
+
+        return 0;
+}
+
+static int mipi_dbi_uevent(struct device *dev, struct kobj_uevent_env *env)
+{
+        struct mipi_dbi_dev *dbi = to_mipi_dbi_dev(dev);
+        int err;
+
+        err = of_device_uevent_modalias(dev, env);
+        if (err != -ENODEV)
+                return err;
+
+        add_uevent_var(env, "MODALIAS=%s%s", MIPI_DBI_MODULE_PREFIX,
+                       dbi->name);
+
+        return 0;
+}
+
+static const struct dev_pm_ops mipi_dbi_device_pm_ops = {
+        .runtime_suspend = pm_generic_runtime_suspend,
+        .runtime_resume = pm_generic_runtime_resume,
+        .suspend = pm_generic_suspend,
+        .resume = pm_generic_resume,
+        .freeze = pm_generic_freeze,
+        .thaw = pm_generic_thaw,
+        .poweroff = pm_generic_poweroff,
+        .restore = pm_generic_restore,
+};
+
+static struct bus_type mipi_dbi_bus_type = {
+        .name = "mipi-dbi",
+        .match = mipi_dbi_device_match,
+        .uevent = mipi_dbi_uevent,
+        .pm = &mipi_dbi_device_pm_ops,
+};
+
+static void mipi_dbi_dev_release(struct device *dev)
+{
+        struct mipi_dbi_dev *dbi = to_mipi_dbi_dev(dev);
+
+        of_node_put(dev->of_node);
+        kfree(dbi);
+}
+
+static const struct device_type mipi_dbi_device_type = {
+        .release = mipi_dbi_dev_release,
+};
+
+static struct mipi_dbi_dev *mipi_dbi_dev_alloc(struct mipi_dbi_display *display)
+{
+        struct mipi_dbi_dev *dbi;
+
+        dbi = kzalloc(sizeof(*dbi), GFP_KERNEL);
+        if (!dbi)
+                return ERR_PTR(-ENOMEM);
+
+        dbi->display = display;
+        dbi->dev.bus = &mipi_dbi_bus_type;
+        dbi->dev.parent = display->dev;
+        dbi->dev.type = &mipi_dbi_device_type;
+
+        device_initialize(&dbi->dev);
+
+        return dbi;
+}
+
+static int mipi_dbi_dev_add(struct mipi_dbi_dev *dbi)
+{
+        struct mipi_dbi_display *display = dbi->display;
+
+        dev_set_name(&dbi->dev, "%s.%d", dev_name(display->dev),  dbi->index);
+
+        return device_add(&dbi->dev);
+}
+
+#if IS_ENABLED(CONFIG_OF)
+static struct mipi_dbi_dev *
+of_mipi_dbi_dev_add(struct mipi_dbi_display *display, struct device_node *node)
+{
+	struct device *dev = display->dev;
+	struct mipi_dbi_dev_info info = { };
+	int ret;
+	u32 reg;
+
+	if (of_modalias_node(node, info.type, sizeof(info.type)) < 0) {
+		dev_err(dev, "modalias failure on %pOF\n", node);
+		return ERR_PTR(-EINVAL);
+	}
+
+	ret = of_property_read_u32(node, "reg", &reg);
+	if (ret) {
+		dev_err(dev, "device node %pOF has no valid reg property: %d\n",
+			node, ret);
+		return ERR_PTR(-EINVAL);
+	}
+
+	info.index = reg;
+	info.node = of_node_get(node);
+
+	return mipi_dbi_dev_register_full(display, &info);
+}
+#else
+static struct mipi_dbi_device *
+of_mipi_dbi_dev_add(struct mipi_dbi_display *display, struct device_node *node)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
+/**
+ * mipi_dbi_device_register_full - create a MIPI DBI device
+ * @host: DBI display to which this device is connected
+ * @info: pointer to template containing DBI device information
+ *
+ * Create a MIPI DBI device by using the device information provided by
+ * mipi_dbi_dev_info template
+ *
+ * Returns:
+ * A pointer to the newly created MIPI DBI device, or a pointer encoded
+ * with an error
+ */
+struct mipi_dbi_dev *
+mipi_dbi_dev_register_full(struct mipi_dbi_display *display,
+			   const struct mipi_dbi_dev_info *info)
+{
+	struct mipi_dbi_dev *dbi;
+	struct device *dev = display->dev;
+	int ret;
+
+	if (!info) {
+		dev_err(dev, "invalid mipi_dbi_device_info pointer\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (info->index > 7) {
+		dev_err(dev, "invalid index: %u\n", info->index);
+		return ERR_PTR(-EINVAL);
+	}
+
+	dbi = mipi_dbi_dev_alloc(display);
+	if (IS_ERR(dbi)) {
+		dev_err(dev, "failed to allocate DBI device %ld\n",
+			PTR_ERR(dbi));
+		return dbi;
+	}
+
+	dbi->dev.of_node = info->node;
+	dbi->index = info->index;
+	strlcpy(dbi->name, info->type, sizeof(dbi->name));
+
+	ret = mipi_dbi_dev_add(dbi);
+	if (ret) {
+		dev_err(dev, "failed to add DBI device %d\n", ret);
+		kfree(dbi);
+		return ERR_PTR(ret);
+	}
+
+	return dbi;
+}
+EXPORT_SYMBOL(mipi_dbi_dev_register_full);
+
+static DEFINE_MUTEX(display_lock);
+static LIST_HEAD(display_list);
+
+/**
+ * of_find_mipi_dbi_display_by_node() - find the MIPI DBI display
+ * matching a device tree node
+ * @node: device tree node
+ *
+ * Returns:
+ * A pointer to the MIPI DBI display corresponding to @node or NULL if no
+ * such device exists (or has not been registered yet).
+ */
+struct mipi_dbi_display *
+of_find_mipi_dbi_display_by_node(struct device_node *node)
+{
+        struct mipi_dbi_display *display;
+
+        mutex_lock(&display_lock);
+
+        list_for_each_entry(display, &display_list, list) {
+                if (display->dev->of_node == node) {
+                        mutex_unlock(&display_lock);
+                        return display;
+                }
+        }
+
+        mutex_unlock(&display_lock);
+
+        return NULL;
+}
+EXPORT_SYMBOL(of_find_mipi_dbi_display_by_node);
+
+
+int mipi_dbi_displays_register(struct mipi_dbi_display *display)
+{
+        struct device_node *node;
+
+        for_each_available_child_of_node(display->dev->of_node, node) {
+                /* skip nodes without reg property */
+                if (!of_find_property(node, "reg", NULL))
+                        continue;
+                of_mipi_dbi_dev_add(display, node);
+        }
+
+        mutex_lock(&display_lock);
+        list_add_tail(&display->list, &display_list);
+        mutex_unlock(&display_lock);
+
+        return 0;
+}
+EXPORT_SYMBOL(mipi_dbi_displays_register);
+
+/**
+ * mipi_dbi_driver_unregister() - unregister a driver for DBI devices
+ * @drv: DBI driver structure
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+void mipi_dbi_driver_unregister(struct mipi_dbi_driver *drv)
+{
+        driver_unregister(&drv->driver);
+}
+EXPORT_SYMBOL(mipi_dbi_driver_unregister);
+
+static int __init mipi_dbi_bus_init(void)
+{
+        return bus_register(&mipi_dbi_bus_type);
+}
+postcore_initcall(mipi_dbi_bus_init);
+
+MODULE_AUTHOR("Sam Ravnborg <sam@ravnborg.org>");
+MODULE_DESCRIPTION("MIPI DPI Bus");
 MODULE_LICENSE("GPL");
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index 33f325f5af2b..752c3ef273ab 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -17,6 +17,9 @@ struct spi_device;
 struct gpio_desc;
 struct regulator;
 
+#define DBI_DEV_NAME_SIZE		20
+#define MIPI_DBI_MODULE_PREFIX		"mipi-dbi:"
+
 /**
  * struct mipi_dbi - MIPI DBI interface
  */
@@ -70,6 +73,27 @@ struct mipi_dbi {
 	size_t tx_buf9_len;
 };
 
+/**
+ * struct mipi_dbi_dev_info - template for creating a mipi_dbi_dev
+ *
+ * This is populated and passed to mipi_dbi_dev_alloc to create a new
+ * DBI device
+ */
+struct mipi_dbi_dev_info {
+	/**
+	 * @type: DBI type
+	 */
+	char type[DBI_DEV_NAME_SIZE];
+	/**
+	 * @index: The display number on the bus
+	 */
+	u32 index;
+	/**
+	 * @node: pointer to OF device node
+	 */
+	struct device_node *node;
+};
+
 /**
  * struct mipi_dbi_dev - MIPI DBI device
  */
@@ -79,6 +103,26 @@ struct mipi_dbi_dev {
 	 */
 	struct drm_device drm;
 
+	/**
+	 * @dev: device
+	 */
+	struct device dev;
+
+	/**
+	 * @name: The name of the DBI device
+	 */
+	char name[DBI_DEV_NAME_SIZE];
+
+	/**
+	 * display: DBI display
+	 */
+	struct mipi_dbi_display *display;
+
+	/**
+	 * index: index of display
+	 */
+	u32 index;
+
 	/**
 	 * @pipe: Display pipe structure
 	 */
@@ -137,6 +181,11 @@ struct mipi_dbi_dev {
 	struct mipi_dbi dbi;
 };
 
+static inline struct mipi_dbi_dev *to_mipi_dbi_dev(struct device *dev)
+{
+	return container_of(dev, struct mipi_dbi_dev, dev);
+}
+
 static inline struct mipi_dbi_dev *drm_to_mipi_dbi_dev(struct drm_device *drm)
 {
 	return container_of(drm, struct mipi_dbi_dev, drm);
@@ -173,6 +222,92 @@ int mipi_dbi_command_buf(struct mipi_dbi *dbi, u8 cmd, u8 *data, size_t len);
 int mipi_dbi_command_stackbuf(struct mipi_dbi *dbi, u8 cmd, u8 *data, size_t len);
 int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 		      struct drm_rect *clip, bool swap);
+
+/**
+ * struct mipi_dbi_msg - read/write DBI buffer
+ * @index: index of display
+ * @type: payload data type
+ * @flags: flags controlling this message transmission
+ * @tx_len: length of @tx_buf
+ * @tx_buf: data to be written
+ * @rx_len: length of @rx_buf
+ * @rx_buf: data to be read, or NULL
+ */
+struct mipi_dbi_msg {
+        u8 index;
+        u8 type;
+        u16 flags;
+
+        size_t tx_len;
+        const void *tx_buf;
+
+        size_t rx_len;
+        void *rx_buf;
+};
+
+struct mipi_dbi_display;
+
+/**
+ * struct mipi_dbi_display_ops - DBI bus operations
+ * @attach: attach DBI device to DBI display
+ * @detach: detach DBI device from DBI display
+ * @transfer: transmit a DBI packet
+ *
+ * DBI packets transmitted by .transfer() are passed in as mipi_dbi_msg
+ * structures. This structure contains information about the type of packet
+ * being transmitted as well as the transmit and receive buffers. When an
+ * error is encountered during transmission, this function will return a
+ * negative error code. On success it shall return the number of bytes
+ * transmitted for write packets or the number of bytes received for read
+ * packets.
+ *
+ * Note that typically DBI packet transmission is atomic, so the .transfer()
+ * function will seldomly return anything other than the number of bytes
+ * contained in the transmit buffer on success.
+ */
+struct mipi_dbi_display_ops {
+        int (*attach)(struct mipi_dbi_display *display,
+                      struct mipi_dbi_dev *dbi);
+        int (*detach)(struct mipi_dbi_display *display,
+                      struct mipi_dbi_dev *dbi);
+        ssize_t (*transfer)(struct mipi_dbi_display *display,
+                            const struct mipi_dbi_msg *msg);
+};
+
+/**
+ * struct mipi_dbi_display - DBI display device
+ * @dev: driver model device node for this DBI display
+ * @ops: DBI host operations
+ * @list: list management
+ */
+struct mipi_dbi_display {
+        struct device *dev;
+        const struct mipi_dbi_display_ops *ops;
+        struct list_head list;
+};
+
+/**
+ * struct mipi_dbi_driver - DBI driver
+ * @driver: device driver model driver
+ * @probe: callback for device binding
+ * @remove: callback for device unbinding
+ * @shutdown: called at shutdown time to quiesce the device
+ */
+struct mipi_dbi_driver {
+        struct device_driver driver;
+        int(*probe)(struct mipi_dbi_dev *dbi);
+        int(*remove)(struct mipi_dbi_dev *dbi);
+        void (*shutdown)(struct mipi_dbi_dev *dbi);
+};
+
+struct mipi_dbi_dev *
+mipi_dbi_dev_register_full(struct mipi_dbi_display *display,
+			   const struct mipi_dbi_dev_info *info);
+struct mipi_dbi_display *
+of_find_mipi_dbi_display_by_node(struct device_node *node);
+int mipi_dbi_displays_register(struct mipi_dbi_display *display);
+void mipi_dbi_driver_unregister(struct mipi_dbi_driver *drv);
+
 /**
  * mipi_dbi_command - MIPI DCS command with optional parameter(s)
  * @dbi: MIPI DBI structure
-- 
2.25.1


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--ReaqsoxgOBHFXBhH--
