Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AE757DC79
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 10:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80AD903FF;
	Fri, 22 Jul 2022 08:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo-csw.securemx.jp (mo-csw1116.securemx.jp [210.130.202.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622C5903A9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 08:34:40 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 26M8YRxT010864;
 Fri, 22 Jul 2022 17:34:27 +0900
X-Iguazu-Qid: 2wHHu0tpvrzq8OKSgE
X-Iguazu-QSIG: v=2; s=0; t=1658478866; q=2wHHu0tpvrzq8OKSgE;
 m=PlG4+L+mjN4vIVxdysur12YA8Ssaej13M/64gxBMJKw=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
 by relay.securemx.jp (mx-mr1112) id 26M8YPpC024474
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 22 Jul 2022 17:34:25 +0900
X-SA-MID: 39258161
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2 5/5] Documentation: driver-api: visconti: add a description
 of DNN driver.
Date: Fri, 22 Jul 2022 17:28:58 +0900
X-TSB-HOP2: ON
Message-Id: <20220722082858.17880-6-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220722082858.17880-1-yuji2.ishikawa@toshiba.co.jp>
References: <20220722082858.17880-1-yuji2.ishikawa@toshiba.co.jp>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, yuji2.ishikawa@toshiba.co.jp,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
v1 -> v2:
  - newly added documents
---
 Documentation/driver-api/visconti/common.rst | 115 ++++++
 Documentation/driver-api/visconti/dnn.rst    | 394 +++++++++++++++++++
 2 files changed, 509 insertions(+)
 create mode 100644 Documentation/driver-api/visconti/common.rst
 create mode 100644 Documentation/driver-api/visconti/dnn.rst

diff --git a/Documentation/driver-api/visconti/common.rst b/Documentation/driver-api/visconti/common.rst
new file mode 100644
index 000000000..cc2d3f6cd
--- /dev/null
+++ b/Documentation/driver-api/visconti/common.rst
@@ -0,0 +1,115 @@
+==========================================
+Common interfaces for Visconti IPA Drivers
+==========================================
+
+file operation
+==============
+
+IPA driver expose thair function to userspace with device files.
+
+* The device file has specific name, such as /dev/dnn0
+* device file provides some operations
+
+ - open / close
+ - two ioctls operations to control IPA 
+ - poll to wait for the finish of IPA
+
+IOCTLs
+======
+
+All IPA drivers have following two IOCTL requests.
+See individual documents of IPA drivers for detail.
+
+.. c:macro:: IOC_IPA_START
+
+starts IPA processing.
+
+.. c:macro:: IOC_IPA_GET_STATUS
+
+get the status of IPA driver
+
+IPA Addresses
+=============
+
+IPA drivers assume that the buffers for IPA HW processing are DMA-BUF
+which are phisically contiguous memory block  allocated with DMA-BUF heaps.
+The heap area is defined with a reserved-memory element in device tree description.
+See Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt for further information.
+
+Two structures are used to describe DMA-BUF instances.
+
+* :c:type:`drv_ipa_buffer_info`
+* :c:type:`drv_ipa_addr`
+
+Note that allocation size of DMA-BUF instances should be power of two.
+This is mainly because IOMMUs have very limited number of entries for translation.
+
+
+drv_ipa_buffer_info
+-------------------
+
+Information about the buffer allocated with DMA-BUF heaps.
+Applications specify the array of drv_ipa_buffer_info to the driver.
+
+drv_ipa_addr
+------------
+
+Application specify the region to be processed with two information; index for the array of drv_ipa_buffer_info and offset.
+
+.. c:macro:: IPA_INVALID_ADDR
+
+When a buffer is an optional parameter for an API, application can use :c:macro:`IPA_INVALID_ADDR` instead of NULL.
+
+For example:
+
+.. code-block:: c
+
+	struct drv_ipa_addr null_addr = IPA_INVALID_ADDR;
+
+Code exampe
+-----------
+
+.. code-block:: c
+
+	/* hogehoge */
+	/* hogehoge */
+
+Structures
+==========
+
+.. kernel-doc:: drivers/soc/visconti/uapi/ipa.h
+
+Further description of addressing
+=================================
+
+DRAM addressing space
+---------------------
+
+Visconti5 (TMPV770x) SoCs have 2 DDR controllers.
+Each space for a controller is mapped in 36bit address space as follows:
+
+* DDR0: 0x0_8000_0000 - 0x0_FFFF_FFFF
+* DDR1: 0x8_8000_0000 - 0x8_FFFF_FFFF
+
+IPAs have dedicated IOMMUs (visconti ioatu) which translate 32bit IOVA to 36bit physical address.
+Note that address registers of IPA core hardware only accept 32bit values.
+When IOMMUs are absent (by removing their description from device tree), DDR1 address must not be used for IPA.
+
+Coherent access among CPUs / IPAs
+---------------------------------
+
+Bus master of IPAs has two connections; direct access to DRAM and cache-coherent connection with CPU clusters.
+The bit 34 of 64bit address is used to distinguish direct access or coherent acccess.
+
+* DDR0 (direct):   0x0_8000_0000 - 0x0_FFFF_FFFF
+* DDR0 (coherent): 0x4_8000_0000 - 0x4_FFFF_FFFF
+* DDR1 (direct):   0x8_8000_0000 - 0x8_FFFF_FFFF
+* DDR1 (coherent): 0xC_8000_0000 - 0xC_FFFF_FFFF
+
+If the whole system should run coherent mode, make following changes in device tree description:
+
+* set coherent address for all memory and reserved-memory elements
+* set dma_coherent property to all IPA elements
+
+It is strongly recommended not to use both direct and coherent address at the same time.
+
diff --git a/Documentation/driver-api/visconti/dnn.rst b/Documentation/driver-api/visconti/dnn.rst
new file mode 100644
index 000000000..1abdd6c7c
--- /dev/null
+++ b/Documentation/driver-api/visconti/dnn.rst
@@ -0,0 +1,394 @@
+=======================
+Visconti DNN IPA driver
+=======================
+
+Hardware overview
+=================
+
+Visconti DNN IPA is a proprietary CNN/DCNN accelerator developed by Toshiba.
+This IPA integrates large scaled parallel MAC units and dedicated function units to accelerate
+inference operation of well known neural network layers. It also has dedicated DMA unit to make accesses to DRAM.
+Visconti5 SoC has 2 instances of DNN accelerator hardware.
+
+WORDS:
+
+* IPA: Image Processing Accelerator
+* CNN: Convolutional Neural Network
+* DCNN: Deep Convolutional Neural Network
+
+Software architecture
+=====================
+
+The operation of Visconti DNN IPA depends on some software components including this kernel driver.
+Some extra components are provided by Toshiba Electronic Device & Storage Company (at Jul 2022).
+
+* libdrvutil: userspace utility to build a descriptor for a NN inference operation.
+* compiler: offline tool to generate configuration binaries from caffe/onnx compatible CNN models.
+
+The Visconti DNN IPA driver receives a configuration binary and an input vector then configures hardware registers.
+Register values suitable for each run is held in a descriptor data structure generated by libdrvutil.
+
+The userland and the kernel driver use DMA-BUF to allocate/handle (phisically contiguous) memory blocks.
+
+Public user interface of Visconti DNN IPA driver is exposed as following device files.
+
+* DNN0: /dev/dnn0
+* DNN1: /dev/dnn1
+
+IOCTLs
+======
+
+IOC_IPA_START
+-------------
+
+.. c:function:: int ioctl( int fd, IOC_IPA_START, drv_dnn_descriptor_t *argp )
+    :name: IOC_IPA_START_DNN
+
+Description
+~~~~~~~~~~~
+
+This ioctl call starts the DNN processing with specified descriptor.
+:c:type:`drv_dnn_descriptor_t` should be set by :ref:`util_dnn`
+
+poll(2) will return when the DNN processing is completed.
+DNN HW does not stop IPA processing by execution error.
+DNN driver will report POLLERR with completed event, if the execution error occurs.
+Applications can check the error information by calling :c:func:`ioctl(IOC_IPA_GET_STATUS) <IOC_IPA_GET_STATUS_DNN>`.
+
+Return value
+~~~~~~~~~~~~
+
+On success, 0 is returned.
+On error, -1 is returned and the ``errno`` is set appropriately.
+
+Errors
+~~~~~~
+
+* EBUSY: Driver is busy.
+* EFAULT:
+
+  - The given descriptor is not accessible from kernel space.
+  - ``src_list`` is not accessible from kernel space.
+  - ``dst_list`` is not accessible from kernel space.
+
+* EINVAL:
+
+  - The given descriptor is not configured by :ref:`drv_DNN_config_descript_finalize`.
+  - Ion heap fd passed in :ref:`drv_DNN_config_descript_init` (buffer) is invalid.
+  - ``configuration_binary_addr.offset`` is greater than or equal to size of Ion heap pointed by ``configuration_binary_addr.buffer_index``.
+  - ``temporary_addr.offset`` is greater than or equal to size of Ion heap pointed by ``temporary_addr.buffer_index``.
+  - ``src_list[0 ~ n-1]`` is :c:macro:`IPA_INVALID_ADDR`.
+  - ``src_list[0 ~ n-1].buffer_index`` is equal to or greater than ``buffer_num`` of :ref:`drv_DNN_config_descript_init`.
+  - ``src_list[0 ~ n-1].offset`` is greater than or equal to size of Ion heap pointed by ``src_list[0 ~ n-1].buffer_index``.
+  - ``dst_list[0 ~ n-1]`` is :c:macro:`IPA_INVALID_ADDR`.
+  - ``dst_list[0 ~ n-1].buffer_index`` is equal to or greater than ``buffer_num`` of :ref:`drv_DNN_config_descript_init`.
+  - ``dst_list[0 ~ n-1].offset`` is greater than or equal to size of Ion heap pointed by ``dst_list[0 ~ n-1].buffer_index``.
+
+IOC_IPA_GET_STATUS
+------------------
+
+.. c:function:: int ioctl( int fd, IOC_IPA_GET_STATUS, drv_dnn_status_t *argp )
+    :name: IOC_IPA_GET_STATUS_DNN
+
+Description
+~~~~~~~~~~~
+
+| This ioctl call asks the DNN driver to get the state of the DNN HW.
+| See :c:type:`drv_dnn_status_t` for details.
+
+Error
+~~~~~
+
+* EFAULT: The given status structure is not accessible from kernel space.
+
+.. _util_dnn:
+
+
+Userspace utility functions
+===========================
+
+.. _drv_DNN_config_descript_init:
+
+drv_DNN_config_descript_init
+----------------------------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    int32_t drv_DNN_config_descript_init(
+        drv_dnn_descriptor_t *desc,
+        struct drv_ipa_buffer_info *buffer,
+        int32_t buffer_num
+    );
+
+Parameters
+~~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+
+    * - :c:type:`drv_dnn_descriptor_t` \*desc
+      - Pointer to the DNN descriptor structure.
+    * - :c:type:`struct drv_ipa_buffer_info <drv_ipa_buffer_info>` \*buffer
+      - Array of Ion heaps for DNN processing.
+    * - int32_t buffer_num
+      - Number of buffer. [1, 15]
+
+Description
+~~~~~~~~~~~
+
+Initializes the :c:type:`drv_dnn_descriptor_t` structure with value 0 and sets Array of Ion heaps.
+
+Return value
+~~~~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+
+    * - :c:macro:`DRV_OK`
+      - Operation completes successfully.
+    * - :c:macro:`DRV_ERROR_PARAMETER`
+      - * ``desc`` is NULL.
+        * ``buffer`` is NULL.
+        * ``buffer_num`` is out of range.
+        * ``direction`` member in ``buffer`` is invalid.
+
+.. _drv_DNN_config_exec_configuration:
+
+drv_DNN_config_exec_configuration
+---------------------------------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    int32_t drv_DNN_config_exec_configuration(
+        drv_dnn_descriptor_t *desc,
+        const void *configuration_binary,
+        struct drv_ipa_addr configuration_binary_addr,
+        struct drv_ipa_addr *src_list,
+        struct drv_ipa_addr *dst_list,
+        int32_t list_num,
+        struct drv_ipa_addr temporary_addr,
+        int32_t temporary_size
+    );
+
+Parameters
+~~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+
+    * - :c:type:`drv_dnn_descriptor_t` \*desc
+      - Pointer to the DNN descriptor structure.
+    * - const void \*configuration_binary
+      - Userland address of the configuration binary.
+    * - :c:type:`struct drv_ipa_addr <drv_ipa_addr>` \*configuration_binary_addr
+      - IPA address of the configuration binary. Should be aligned to 512 byte.
+    * - :c:type:`struct drv_ipa_addr <drv_ipa_addr>` \*src_list
+      - Userland address for the list of IPA address to input data.
+    * - :c:type:`struct drv_ipa_addr <drv_ipa_addr>` \*dst_list
+      - Userland address for the list of IPA address to output data.
+    * - int32_t list_num
+      - Number of list. [1, 1024]
+    * - :c:type:`struct drv_ipa_addr <drv_ipa_addr>` \*temporary_addr
+      - IPA address of the temporary memory. Should be aligned to 4 byte.
+    * - int32_t temporary_size
+      - Size of the temporary memory.
+
+Description
+~~~~~~~~~~~
+
+Configures :c:type:`drv_dnn_descriptor_t` structure with execute configuration parameters.
+
+* ``desc`` should be initialized by :ref:`drv_DNN_config_descript_init` before the descriptor configuration.
+* If configuration binary provides temporary buffer setting, temporary_addr should not be :c:macro:`IPA_INVALID_ADDR` and should be aligned to 4 byte.
+* If configuration binary does not provide temporary buffer setting, applications can specify :c:macro:`IPA_INVALID_ADDR` for temporary_addr.
+* Configuration binary for ``configuration_binary`` parameter should be created by DNN toolchain.
+
+
+Return value
+~~~~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+
+    * - :c:macro:`DRV_OK`
+      - Operation completes successfully.
+    * - :c:macro:`DRV_ERROR_PARAMETER`
+      - * ``desc`` is NULL.
+        * ``configuration_binary`` is NULL.
+        * ``configuration_binary_addr`` is :c:macro:`IPA_INVALID_ADDR`.
+        * ``configuration_binary_addr.buffer_index`` is equal to or greater than ``buffer_num`` of :ref:`drv_DNN_config_descript_init`.
+        * ``configuration_binary_addr.offset`` is not aligned to 512 byte.
+        * ``src_list`` is NULL.
+        * ``dst_list`` is NULL.
+        * ``list_num`` is out of range.
+        * ``temporary_addr`` is :c:macro:`IPA_INVALID_ADDR` when configuration binary requires more than 0 byte for temporary memory.
+        * ``temporary_addr.offset`` is not aligned to 4 byte when it is valid.
+        * ``temporary_addr.buffer_index`` is equal to or greater than ``buffer_num`` of :ref:`drv_DNN_config_descript_init` when it is valid.
+    * - :c:macro:`DRV_DNN_ERROR_INVALID_CONFIGURATION_BINARY`
+      - In Configuration binary,
+
+        * base address mode N is except 0:unused, 1:list, 2:fixed.
+        * base address purpose N is except 1:input, 2:output, 3:weight/bias, 4:temporary.
+        * base address mode is not list when purpose is input or output
+        * base address mode is not fixed when purpose is temporary or weight/bias
+    * - :c:macro:`DRV_DNN_ERROR_TEMPORARY_MEMORY_SIZE`
+      - ``temporary_size`` is smaller than the size which is required by configuration binary.
+
+.. _drv_DNN_config_descript_finalize:
+
+drv_DNN_config_descript_finalize
+--------------------------------
+
+Synopsis
+~~~~~~~~
+
+.. code-block:: c
+
+    int32_t drv_DNN_config_descript_finalize(
+        drv_dnn_descriptor_t *desc
+    );
+
+Parameters
+~~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+
+    * - :c:type:`drv_dnn_descriptor_t` \*desc
+      - | Pointer to the DNN descriptor structure
+
+
+Description
+~~~~~~~~~~~
+
+Checks if DNN driver descriptor configuration is complete before starting DNN HW.
+
+``desc`` should be initialized by :ref:`drv_DNN_config_descript_init` before the descriptor configuration.
+
+Return value
+~~~~~~~~~~~~
+
+.. flat-table::
+    :header-rows:  0
+
+    * - :c:macro:`DRV_OK`
+      - Operation completes successfully.
+    * - :c:macro:`DRV_ERROR_PARAMETER`
+      - ``desc`` is NULL.
+    * - :c:macro:`DRV_ERROR_IPA_CONFIG_INCOMPLETE`
+      - :ref:`drv_DNN_config_exec_configuration` is not called after :ref:`drv_DNN_config_descript_init`.
+
+Structures
+==========
+
+.. kernel-doc:: drivers/soc/visconti/uapi/dnn.h
+
+Code example
+============
+
+``src_list`` and ``dst_list`` parameter for :ref:`drv_DNN_config_exec_configuration` is the array of :c:type:`drv_ipa_addr`.
+
+.. code-block:: c
+
+    #include <fcntl.h>
+    #include <poll.h>
+    #include <stdbool.h>
+    #include <stdint.h>
+    #include <sys/ioctl.h>
+    #include <sys/mman.h>
+    #include <sys/stat.h>
+    #include <sys/types.h>
+    #include <unistd.h>
+
+    #include <linux/dma-heap.h>
+
+    #include "drv_ipa.h"
+    #include "drv_dnn_util.h"
+
+    #define HEAP_ID (2)
+    #define CONFIG_SIZE <size of configuration binary>
+    #define INPUT_SIZE <input buffer size>
+    #define OUTPUT_SIZE <output buffer size>
+    #define TEMP_SIZE <temporary size in configuration binary>
+    #define LIST_NUM (2)
+
+    #define NUM_OF_BUFS (4)
+
+    void dnn_sample(void)
+    {
+        int ret;
+        int32_t drv_ret;
+        int32_t fd_heap, fd_dnn;
+        struct pollfd fds[1];
+        int32_t timeout;
+        unsigned char *src, *config;
+        struct dma_heap_allocation_data alloc_src={0}, alloc_dst={0}, alloc_temp={0}, alloc_config={0};
+        drv_dnn_descriptor_t desc;
+
+        /* Open DMA-BUF heaps device for heap allocation */
+        fd_heap = open("/dev/dma_heap/linux,cma", O_RDWR);
+
+        /* Open DNN device for processing */
+        fd_dnn = open("/dev/dnn0", O_RDWR);
+
+        /* Input buffer */
+        alloc_src.len = INPUT_SIZE; /* Size should be power of 2 */
+        alloc_src.fd_flags = O_RDWR | O_CLOEXEC;
+        ret = ioctl(fd_heap, DMA_HEAP_IOCTL_ALLOC, &alloc_src);
+
+        src = mmap(0, alloc_src.len, PROT_READ | PROT_WRITE, MAP_SHARED, alloc_src.fd, 0);
+
+        alloc_config.len = CONFIG_SIZE; /* Size should be power of 2 */
+        alloc_config.fd_flags = O_RDWR | O_CLOEXEC;
+        ret = ioctl(fd_ion, DMA_HEAP_IOCTL_ALLOC, &alloc_config);
+
+        config = mmap(NULL, alloc_config.len, PROT_READ | PROT_WRITE, MAP_SHARED, alloc_config.fd, 0);
+
+        alloc_temp.len = TEMP_SIZE; /* Size should be power of 2 */
+        alloc_temp.fd_flags = ION_FLAG_CACHED;
+        ret = ioctl(fd_ion, DMA_HEAP_IOCTL_ALLOC, &alloc_temp);
+
+        /* Output buffer */
+        alloc_dst.len = OUTPUT_SIZE; /* Size should be power of 2 */
+        alloc_dst.flags = O_RDWR | O_CLOEXEC;
+        ret = ioctl(fd_ion, DMA_HEAP_IOCTL_ALLOC, &alloc_dst);
+
+        /* Create buffer info data for descriptor */
+        struct drv_ipa_buffer_info bufinfo[NUM_OF_BUFS]
+            = {{.fd = alloc_config.fd, .direction = DRV_IPA_DIR_TO_DEVICE},
+               {.fd = alloc_src.fd, .direction = DRV_IPA_DIR_TO_DEVICE},
+               {.fd = alloc_temp.fd, .direction = DRV_IPA_DIR_FROM_DEVICE},
+               {.fd = alloc_dst.fd, .direction = DRV_IPA_DIR_FROM_DEVICE}};
+
+        struct drv_ipa_addr config_addr = {.buffer_index = 0, .offset = 0};
+        struct drv_ipa_addr src_list_addr[LIST_NUM] = {{.buffer_index = 1, .offset = 0}, {.buffer_index = 1, .offset = 0x300}};
+        struct drv_ipa_addr temp_addr = {.buffer_index = 2, .offset = 0};
+        struct drv_ipa_addr dst_list_addr[LIST_NUM] = {{.buffer_index = 3, .offset = 0}, {.buffer_index = 3, .offset = 0x300}};
+
+        /* Configure descriptor */
+        drv_ret = drv_DNN_config_descript_init(&desc, bufinfo, NUM_OF_BUFS);
+
+        drv_ret = drv_DNN_config_exec_configuration(&desc, config, config_addr, src_list_addr, dst_list_addr, LIST_NUM, temp_addr,
+                                                    TEMP_SIZE);
+
+        drv_ret = drv_DNN_config_descript_finalize(&desc);
+
+        /* Start DNN */
+        ret = ioctl(fd_dnn, IOC_IPA_START, &desc);
+
+        /* Wait DNN */
+        fds[0].fd = fd_dnn;
+        fds[0].events = POLLIN;
+        timeout = 1000; // 1sec
+
+        ret = poll(fds, 1, timeout);
+
+        close(fd_ion);
+        close(fd_dnn);
+    }
-- 
2.17.1


