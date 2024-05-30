Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6F38D4726
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 10:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C4C10E7C1;
	Thu, 30 May 2024 08:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="FP1Wec33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6B710E099
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 08:35:21 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1f4a52b9413so5284445ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 01:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717058121; x=1717662921;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SYBvWC2uepakob3TffEfi9LvE8xjuNaot5TjPvB57nM=;
 b=FP1Wec33zBQs6J5045CBFQ1evBxpyGjtj/PVg6jjZ1xV1IpnAD2o1x6UYzI07fKs0R
 XaxDUYocfcenNV8MR8uRk3QIGNFs5Jd0Iwxx8Ctkmtvn1/djyaMWply0TsEIAG5Kow4l
 nnHIPiarxTdtWb88biyCWwaBj3An1dJMEzOmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717058121; x=1717662921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SYBvWC2uepakob3TffEfi9LvE8xjuNaot5TjPvB57nM=;
 b=bgQOh1w/g5VoqKp91P/56+4RmRp0vX2UXZlvewGgxfFXrc/9IrWfN7Pyteuj4T+cOQ
 wvD+zhSBe+cM1UQ08amHe8UbdZSzzPzxjt94DDADynnNSt4nB7NMzbeX4zMq4w2kSGb1
 ZiP77z3/Nz7xGlIu1BnFINut4VC4fmCL5uMNP5TKeg5Tn41mZ79IdUhpDN9QAVvJlSDW
 8hZc/fxsGK4N4Mel7034JHOIs7f4yp2sSBtWTk5+u5F30I4YsKIsdbP5+kRs4PLDGAe8
 rhPhJfQrmM8ApjQAF6Tb6TBahdSEl/pmHv8FJD5cIFGLlqDRtvEUyeYoBValcs4aEo1G
 Hj3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0R89s1vppNWxjKrmLgwvDtiFQjjgSMfkF3RwHYPHdHb+dFNjg93sJftUpXvHOAqIWHN8nqOFlortp2p8TSYa6qs/PglfaK/h9BiE/+My5
X-Gm-Message-State: AOJu0YyzuvrT8F6W4vrwVznQPjxNhwE0U/uL7tTaAOGnZyp+bLWfre/Y
 j3yaoF6VmlIYUwC68lHpDOuKDv/TZy5CmmFNxGM6v/Fe68xBCwNUQUBcgH5ofA==
X-Google-Smtp-Source: AGHT+IH4oVIPVdvM+V301cxz4F9GYnfo02qBd9BBykJuIdjdprYe+dISGl3Mi/hIAPXdkCfDJZlaew==
X-Received: by 2002:a17:902:d4cc:b0:1f4:5f66:895 with SMTP id
 d9443c01a7336-1f61a2e44a4mr15126235ad.68.1717058120159; 
 Thu, 30 May 2024 01:35:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:65f0:63a9:90bb:50b8])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f617390fe7sm10950635ad.146.2024.05.30.01.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 01:35:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] powervr: MT8173 GPU support
Date: Thu, 30 May 2024 16:34:59 +0800
Message-ID: <20240530083513.4135052-1-wenst@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
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

Hi everyone,

This series enables the PowerVR GPU found in the MT8173 SoC, found in
some Chromebooks.

This version is different from the initial powervr driver submission [1]
in that it splits out the GPU glue layer support out of the powervr
driver and into a separate clock and power domain driver. The glue code
is otherwise the same, and also the same as found in the ChromeOS
kernels, with some extra comments and macro names added where possible.

Patch 1 adds a binding for the glue layer, called mfgtop. The glue layer
contains clock and power controls for the GPU.

Patch 2 adds a driver for the glue layer.

Patch 3 adds an entry for the MT8173 GPU and 6XT series to the PowerVR
binding.

Patch 4 adds an entry for the PowerVR 6XT series GPU to the driver.

Patch 5 corrects the clock for the GPU (called MFG) power domain.

Patch 6 adds device nodes for the GPU and glue layer to the MT8173 dtsi
file.

Patch 2 and 6 depend on patch 1 to build. I suppose some common
immutable tree would be needed from the MediaTek maintainers.

The kernel driver successfully probes the hardware and loads the
"rogue_4.40.2.51_v1.fw" firmware provided by Imagination Technologies [2].
Userspace was tested with Mesa 24.0.8 from Debian Trixie rebuilt with
the powervr vulkan driver enabled. `vulkaninfo` gives some information
about the GPU (attached at the end), but running the `triangle` example
from the Sascha Willems demos [3] with -DUSE_D2D_WSI=ON as recommended [4]
failed with:

    Can't find a display and a display mode!

Same program worked correctly on a BeaglePlay and displayed a color
gradient triangle. Not sure what went wrong here.

Anyway, please have a look and test.


Thanks
ChenYu

[1] https://lore.kernel.org/dri-devel/20220815165156.118212-2-sarah.walker@imgtec.com/
[2] https://gitlab.freedesktop.org/imagination/linux-firmware/-/tree/powervr
[3] https://github.com/SaschaWillems/Vulkan
[4] https://lore.kernel.org/dri-devel/f2b2671e-5acc-4dec-9c2e-3c9cd2e1f19e@imgtec.com/

Chen-Yu Tsai (6):
  dt-bindings: clock: mediatek: Add mt8173 mfgtop
  clk: mediatek: Add mt8173-mfgtop driver
  dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
  drm/imagination: Add compatible string entry for Series6XT
  arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
  arm64: dts: mediatek: mt8173: Add GPU device nodes

 .../clock/mediatek,mt8173-mfgtop.yaml         |  71 ++++++
 .../bindings/gpu/img,powervr-rogue.yaml       |  24 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  26 +-
 drivers/clk/mediatek/Kconfig                  |   9 +
 drivers/clk/mediatek/Makefile                 |   1 +
 drivers/clk/mediatek/clk-mt8173-mfgtop.c      | 240 ++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_drv.c         |   1 +
 include/dt-bindings/clock/mt8173-clk.h        |   7 +
 8 files changed, 374 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c


base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0

Vulkan info output:

WARNING: [Loader Message] Code 0 : terminator_CreateInstance: Received return code -3 from call to vkCreateInstance in ICD /usr/lib/aarch64-linux-gnu/libvulkan_virtio.so. Skipping this driver.
'DISPLAY' environment variable not set... skipping surface info
ERROR: [../src/panfrost/vulkan/panvk_device.c:386] Code 0 : WARNING: panvk is not a conformant vulkan implementation, pass PAN_I_WANT_A_BROKEN_VULKAN_DRIVER=1 if you know what you're doing. (VK_ERROR_INCOMPATIBLE_DRIVER)
MESA: error: No hard coded idfwdf program. Returning empty program.
MESA: error: No hard coded passthrough rta vertex shader. Returning empty shader.
MESA: error: No hard coded passthrough vertex shader. Returning empty shader.
MESA: warning: ../src/imagination/vulkan/pvr_job_context.c:71: FINISHME: Missing reset support for brn51764
MESA: warning: ../src/imagination/vulkan/pvr_job_context.c:74: FINISHME: Missing reset support for brn58839
MESA: warning: ../src/imagination/vulkan/pvr_border.c:104: FINISHME: Devices without tpu_border_colour_enhanced require entries for compressed formats to be stored in the table pre-compressed.
==========
VULKANINFO
==========

Vulkan Instance Version: 1.3.280


Instance Extensions: count = 23
===============================
	VK_EXT_acquire_drm_display             : extension revision 1
	VK_EXT_acquire_xlib_display            : extension revision 1
	VK_EXT_debug_report                    : extension revision 10
	VK_EXT_debug_utils                     : extension revision 2
	VK_EXT_direct_mode_display             : extension revision 1
	VK_EXT_display_surface_counter         : extension revision 1
	VK_EXT_surface_maintenance1            : extension revision 1
	VK_EXT_swapchain_colorspace            : extension revision 4
	VK_KHR_device_group_creation           : extension revision 1
	VK_KHR_display                         : extension revision 23
	VK_KHR_external_fence_capabilities     : extension revision 1
	VK_KHR_external_memory_capabilities    : extension revision 1
	VK_KHR_external_semaphore_capabilities : extension revision 1
	VK_KHR_get_display_properties2         : extension revision 1
	VK_KHR_get_physical_device_properties2 : extension revision 2
	VK_KHR_get_surface_capabilities2       : extension revision 1
	VK_KHR_portability_enumeration         : extension revision 1
	VK_KHR_surface                         : extension revision 25
	VK_KHR_surface_protected_capabilities  : extension revision 1
	VK_KHR_wayland_surface                 : extension revision 6
	VK_KHR_xcb_surface                     : extension revision 6
	VK_KHR_xlib_surface                    : extension revision 6
	VK_LUNARG_direct_driver_loading        : extension revision 1

Layers: count = 2
=================
VK_LAYER_MESA_device_select (Linux device selection layer) Vulkan version 1.3.211, layer version 1:
	Layer Extensions: count = 0
	Devices: count = 2
		GPU id = 0 (Imagination PowerVR Rogue GX6250)
		Layer-Device Extensions: count = 0

		GPU id = 1 (llvmpipe (LLVM 17.0.6, 128 bits))
		Layer-Device Extensions: count = 0

VK_LAYER_MESA_overlay (Mesa Overlay layer) Vulkan version 1.3.211, layer version 1:
	Layer Extensions: count = 0
	Devices: count = 2
		GPU id = 0 (Imagination PowerVR Rogue GX6250)
		Layer-Device Extensions: count = 0

		GPU id = 1 (llvmpipe (LLVM 17.0.6, 128 bits))
		Layer-Device Extensions: count = 0

Device Properties and Extensions:
=================================
GPU0:
VkPhysicalDeviceProperties:
---------------------------
	apiVersion        = 1.0.274 (4194578)
	driverVersion     = 24.0.8 (100663304)
	vendorID          = 0x1010
	deviceID          = 0x6250
	deviceType        = PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU
	deviceName        = Imagination PowerVR Rogue GX6250
	pipelineCacheUUID = 6ddf30eb-d118-41f1-455f-580ae751c27b

VkPhysicalDeviceLimits:
-----------------------
	maxImageDimension1D                             = 8192
	maxImageDimension2D                             = 8192
	maxImageDimension3D                             = 2048
	maxImageDimensionCube                           = 8192
	maxImageArrayLayers                             = 2048
	maxTexelBufferElements                          = 65536
	maxUniformBufferRange                           = 134217728
	maxStorageBufferRange                           = 134217728
	maxPushConstantsSize                            = 256
	maxMemoryAllocationCount                        = 4294967295
	maxSamplerAllocationCount                       = 4294967295
	bufferImageGranularity                          = 0x00000001
	sparseAddressSpaceSize                          = 0x4000000000
	maxBoundDescriptorSets                          = 4
	maxPerStageDescriptorSamplers                   = 32
	maxPerStageDescriptorUniformBuffers             = 64
	maxPerStageDescriptorStorageBuffers             = 36
	maxPerStageDescriptorSampledImages              = 48
	maxPerStageDescriptorStorageImages              = 8
	maxPerStageDescriptorInputAttachments           = 8
	maxPerStageResources                            = 224
	maxDescriptorSetSamplers                        = 256
	maxDescriptorSetUniformBuffers                  = 256
	maxDescriptorSetUniformBuffersDynamic           = 8
	maxDescriptorSetStorageBuffers                  = 256
	maxDescriptorSetStorageBuffersDynamic           = 8
	maxDescriptorSetSampledImages                   = 256
	maxDescriptorSetStorageImages                   = 256
	maxDescriptorSetInputAttachments                = 256
	maxVertexInputAttributes                        = 16
	maxVertexInputBindings                          = 16
	maxVertexInputAttributeOffset                   = 65535
	maxVertexInputBindingStride                     = 2147483648
	maxVertexOutputComponents                       = 128
	maxTessellationGenerationLevel                  = 0
	maxTessellationPatchSize                        = 0
	maxTessellationControlPerVertexInputComponents  = 0
	maxTessellationControlPerVertexOutputComponents = 0
	maxTessellationControlPerPatchOutputComponents  = 0
	maxTessellationControlTotalOutputComponents     = 0
	maxTessellationEvaluationInputComponents        = 0
	maxTessellationEvaluationOutputComponents       = 0
	maxGeometryShaderInvocations                    = 0
	maxGeometryInputComponents                      = 0
	maxGeometryOutputComponents                     = 0
	maxGeometryOutputVertices                       = 0
	maxGeometryTotalOutputComponents                = 0
	maxFragmentInputComponents                      = 128
	maxFragmentOutputAttachments                    = 8
	maxFragmentDualSrcAttachments                   = 0
	maxFragmentCombinedOutputResources              = 52
	maxComputeSharedMemorySize                      = 16384
	maxComputeWorkGroupCount: count = 3
		65536
		65536
		65536
	maxComputeWorkGroupInvocations                  = 512
	maxComputeWorkGroupSize: count = 3
		512
		512
		64
	subPixelPrecisionBits                           = 8
	subTexelPrecisionBits                           = 8
	mipmapPrecisionBits                             = 8
	maxDrawIndexedIndexValue                        = 4294967295
	maxDrawIndirectCount                            = 2147483648
	maxSamplerLodBias                               = 16
	maxSamplerAnisotropy                            = 1
	maxViewports                                    = 1
	maxViewportDimensions: count = 2
		8192
		8192
	viewportBoundsRange: count = 2
		-16384
		16384
	viewportSubPixelBits                            = 0
	minMemoryMapAlignment                           = 64
	minTexelBufferOffsetAlignment                   = 0x00000010
	minUniformBufferOffsetAlignment                 = 0x00000004
	minStorageBufferOffsetAlignment                 = 0x00000004
	minTexelOffset                                  = -8
	maxTexelOffset                                  = 7
	minTexelGatherOffset                            = -8
	maxTexelGatherOffset                            = 7
	minInterpolationOffset                          = -0.5
	maxInterpolationOffset                          = 0.5
	subPixelInterpolationOffsetBits                 = 4
	maxFramebufferWidth                             = 8192
	maxFramebufferHeight                            = 8192
	maxFramebufferLayers                            = 2048
	framebufferColorSampleCounts: count = 4
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_2_BIT
		SAMPLE_COUNT_4_BIT
		SAMPLE_COUNT_8_BIT
	framebufferDepthSampleCounts: count = 4
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_2_BIT
		SAMPLE_COUNT_4_BIT
		SAMPLE_COUNT_8_BIT
	framebufferStencilSampleCounts: count = 4
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_2_BIT
		SAMPLE_COUNT_4_BIT
		SAMPLE_COUNT_8_BIT
	framebufferNoAttachmentsSampleCounts: count = 4
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_2_BIT
		SAMPLE_COUNT_4_BIT
		SAMPLE_COUNT_8_BIT
	maxColorAttachments                             = 8
	sampledImageColorSampleCounts: count = 4
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_2_BIT
		SAMPLE_COUNT_4_BIT
		SAMPLE_COUNT_8_BIT
	sampledImageIntegerSampleCounts: count = 4
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_2_BIT
		SAMPLE_COUNT_4_BIT
		SAMPLE_COUNT_8_BIT
	sampledImageDepthSampleCounts: count = 4
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_2_BIT
		SAMPLE_COUNT_4_BIT
		SAMPLE_COUNT_8_BIT
	sampledImageStencilSampleCounts: count = 4
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_2_BIT
		SAMPLE_COUNT_4_BIT
		SAMPLE_COUNT_8_BIT
	storageImageSampleCounts: count = 4
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_2_BIT
		SAMPLE_COUNT_4_BIT
		SAMPLE_COUNT_8_BIT
	maxSampleMaskWords                              = 1
	timestampComputeAndGraphics                     = false
	timestampPeriod                                 = 0
	maxClipDistances                                = 8
	maxCullDistances                                = 8
	maxCombinedClipAndCullDistances                 = 8
	discreteQueuePriorities                         = 2
	pointSizeRange: count = 2
		1
		511
	lineWidthRange: count = 2
		0.0625
		16
	pointSizeGranularity                            = 0.0625
	lineWidthGranularity                            = 0.0625
	strictLines                                     = false
	standardSampleLocations                         = true
	optimalBufferCopyOffsetAlignment                = 0x00000004
	optimalBufferCopyRowPitchAlignment              = 0x00000004
	nonCoherentAtomSize                             = 0x00000001

VkPhysicalDeviceSparseProperties:
---------------------------------
	residencyStandard2DBlockShape            = false
	residencyStandard2DMultisampleBlockShape = false
	residencyStandard3DBlockShape            = false
	residencyAlignedMipSize                  = false
	residencyNonResidentStrict               = false

VkPhysicalDeviceTexelBufferAlignmentPropertiesEXT:
--------------------------------------------------
	storageTexelBufferOffsetAlignmentBytes       = 0x00000010
	storageTexelBufferOffsetSingleTexelAlignment = true
	uniformTexelBufferOffsetAlignmentBytes       = 0x00000010
	uniformTexelBufferOffsetSingleTexelAlignment = false

VkPhysicalDeviceTimelineSemaphorePropertiesKHR:
-----------------------------------------------
	maxTimelineSemaphoreValueDifference = 18446744073709551615

Device Extensions: count = 20
	VK_EXT_external_memory_dma_buf        : extension revision 1
	VK_EXT_host_query_reset               : extension revision 1
	VK_EXT_private_data                   : extension revision 1
	VK_EXT_scalar_block_layout            : extension revision 1
	VK_EXT_texel_buffer_alignment         : extension revision 1
	VK_EXT_tooling_info                   : extension revision 1
	VK_KHR_bind_memory2                   : extension revision 1
	VK_KHR_copy_commands2                 : extension revision 1
	VK_KHR_external_fence                 : extension revision 1
	VK_KHR_external_fence_fd              : extension revision 1
	VK_KHR_external_memory                : extension revision 1
	VK_KHR_external_memory_fd             : extension revision 1
	VK_KHR_external_semaphore             : extension revision 1
	VK_KHR_external_semaphore_fd          : extension revision 1
	VK_KHR_format_feature_flags2          : extension revision 2
	VK_KHR_get_memory_requirements2       : extension revision 1
	VK_KHR_image_format_list              : extension revision 1
	VK_KHR_swapchain                      : extension revision 70
	VK_KHR_timeline_semaphore             : extension revision 2
	VK_KHR_uniform_buffer_standard_layout : extension revision 1

VkQueueFamilyProperties:
========================
	queueProperties[0]:
	-------------------
		minImageTransferGranularity = (1,1,1)
		queueCount                  = 2
		queueFlags                  = QUEUE_GRAPHICS_BIT | QUEUE_COMPUTE_BIT | QUEUE_TRANSFER_BIT
		timestampValidBits          = 0
		present support             = false

VkPhysicalDeviceMemoryProperties:
=================================
memoryHeaps: count = 1
	memoryHeaps[0]:
		size   = 1752969216 (0x687c3000) (1.63 GiB)
		flags: count = 1
			MEMORY_HEAP_DEVICE_LOCAL_BIT
memoryTypes: count = 1
	memoryTypes[0]:
		heapIndex     = 0
		propertyFlags = 0x0007: count = 3
			MEMORY_PROPERTY_DEVICE_LOCAL_BIT
			MEMORY_PROPERTY_HOST_VISIBLE_BIT
			MEMORY_PROPERTY_HOST_COHERENT_BIT
		usable for:
			IMAGE_TILING_OPTIMAL:
				color images
				FORMAT_D16_UNORM
				FORMAT_D32_SFLOAT
				FORMAT_S8_UINT
				FORMAT_D24_UNORM_S8_UINT
				(non-sparse)
			IMAGE_TILING_LINEAR:
				color images
				(non-sparse)

VkPhysicalDeviceFeatures:
=========================
	robustBufferAccess                      = true
	fullDrawIndexUint32                     = true
	imageCubeArray                          = true
	independentBlend                        = false
	geometryShader                          = false
	tessellationShader                      = false
	sampleRateShading                       = true
	dualSrcBlend                            = false
	logicOp                                 = false
	multiDrawIndirect                       = true
	drawIndirectFirstInstance               = true
	depthClamp                              = true
	depthBiasClamp                          = true
	fillModeNonSolid                        = false
	depthBounds                             = false
	wideLines                               = true
	largePoints                             = true
	alphaToOne                              = false
	multiViewport                           = false
	samplerAnisotropy                       = false
	textureCompressionETC2                  = true
	textureCompressionASTC_LDR              = false
	textureCompressionBC                    = false
	occlusionQueryPrecise                   = false
	pipelineStatisticsQuery                 = false
	vertexPipelineStoresAndAtomics          = true
	fragmentStoresAndAtomics                = true
	shaderTessellationAndGeometryPointSize  = false
	shaderImageGatherExtended               = false
	shaderStorageImageExtendedFormats       = true
	shaderStorageImageMultisample           = false
	shaderStorageImageReadWithoutFormat     = true
	shaderStorageImageWriteWithoutFormat    = false
	shaderUniformBufferArrayDynamicIndexing = true
	shaderSampledImageArrayDynamicIndexing  = true
	shaderStorageBufferArrayDynamicIndexing = true
	shaderStorageImageArrayDynamicIndexing  = true
	shaderClipDistance                      = false
	shaderCullDistance                      = false
	shaderFloat64                           = false
	shaderInt64                             = true
	shaderInt16                             = true
	shaderResourceResidency                 = false
	shaderResourceMinLod                    = false
	sparseBinding                           = false
	sparseResidencyBuffer                   = false
	sparseResidencyImage2D                  = false
	sparseResidencyImage3D                  = false
	sparseResidency2Samples                 = false
	sparseResidency4Samples                 = false
	sparseResidency8Samples                 = false
	sparseResidency16Samples                = false
	sparseResidencyAliased                  = false
	variableMultisampleRate                 = false
	inheritedQueries                        = false

VkPhysicalDeviceHostQueryResetFeaturesEXT:
------------------------------------------
	hostQueryReset = true

VkPhysicalDevicePrivateDataFeaturesEXT:
---------------------------------------
	privateData = true

VkPhysicalDeviceScalarBlockLayoutFeaturesEXT:
---------------------------------------------
	scalarBlockLayout = true

VkPhysicalDeviceTexelBufferAlignmentFeaturesEXT:
------------------------------------------------
	texelBufferAlignment = true

VkPhysicalDeviceTimelineSemaphoreFeaturesKHR:
---------------------------------------------
	timelineSemaphore = true

VkPhysicalDeviceUniformBufferStandardLayoutFeaturesKHR:
-------------------------------------------------------
	uniformBufferStandardLayout = true


GPU1:
VkPhysicalDeviceProperties:
---------------------------
	apiVersion        = 1.3.274 (4206866)
	driverVersion     = 0.0.1 (1)
	vendorID          = 0x10005
	deviceID          = 0x0000
	deviceType        = PHYSICAL_DEVICE_TYPE_CPU
	deviceName        = llvmpipe (LLVM 17.0.6, 128 bits)
	pipelineCacheUUID = 32342e30-2e38-2d31-2b70-316161616161

VkPhysicalDeviceLimits:
-----------------------
	maxImageDimension1D                             = 16384
	maxImageDimension2D                             = 16384
	maxImageDimension3D                             = 4096
	maxImageDimensionCube                           = 32768
	maxImageArrayLayers                             = 2048
	maxTexelBufferElements                          = 134217728
	maxUniformBufferRange                           = 65536
	maxStorageBufferRange                           = 134217728
	maxPushConstantsSize                            = 256
	maxMemoryAllocationCount                        = 4294967295
	maxSamplerAllocationCount                       = 32768
	bufferImageGranularity                          = 0x00000040
	sparseAddressSpaceSize                          = 0x00000000
	maxBoundDescriptorSets                          = 8
	maxPerStageDescriptorSamplers                   = 1000000
	maxPerStageDescriptorUniformBuffers             = 1000000
	maxPerStageDescriptorStorageBuffers             = 1000000
	maxPerStageDescriptorSampledImages              = 1000000
	maxPerStageDescriptorStorageImages              = 1000000
	maxPerStageDescriptorInputAttachments           = 1000000
	maxPerStageResources                            = 1000000
	maxDescriptorSetSamplers                        = 1000000
	maxDescriptorSetUniformBuffers                  = 1000000
	maxDescriptorSetUniformBuffersDynamic           = 1000000
	maxDescriptorSetStorageBuffers                  = 1000000
	maxDescriptorSetStorageBuffersDynamic           = 1000000
	maxDescriptorSetSampledImages                   = 1000000
	maxDescriptorSetStorageImages                   = 1000000
	maxDescriptorSetInputAttachments                = 1000000
	maxVertexInputAttributes                        = 32
	maxVertexInputBindings                          = 32
	maxVertexInputAttributeOffset                   = 2047
	maxVertexInputBindingStride                     = 2048
	maxVertexOutputComponents                       = 128
	maxTessellationGenerationLevel                  = 64
	maxTessellationPatchSize                        = 32
	maxTessellationControlPerVertexInputComponents  = 128
	maxTessellationControlPerVertexOutputComponents = 128
	maxTessellationControlPerPatchOutputComponents  = 128
	maxTessellationControlTotalOutputComponents     = 4096
	maxTessellationEvaluationInputComponents        = 128
	maxTessellationEvaluationOutputComponents       = 128
	maxGeometryShaderInvocations                    = 32
	maxGeometryInputComponents                      = 64
	maxGeometryOutputComponents                     = 128
	maxGeometryOutputVertices                       = 1024
	maxGeometryTotalOutputComponents                = 1024
	maxFragmentInputComponents                      = 128
	maxFragmentOutputAttachments                    = 8
	maxFragmentDualSrcAttachments                   = 2
	maxFragmentCombinedOutputResources              = 104
	maxComputeSharedMemorySize                      = 32768
	maxComputeWorkGroupCount: count = 3
		65535
		65535
		65535
	maxComputeWorkGroupInvocations                  = 1024
	maxComputeWorkGroupSize: count = 3
		1024
		1024
		1024
	subPixelPrecisionBits                           = 8
	subTexelPrecisionBits                           = 8
	mipmapPrecisionBits                             = 4
	maxDrawIndexedIndexValue                        = 4294967295
	maxDrawIndirectCount                            = 4294967295
	maxSamplerLodBias                               = 16
	maxSamplerAnisotropy                            = 16
	maxViewports                                    = 16
	maxViewportDimensions: count = 2
		16384
		16384
	viewportBoundsRange: count = 2
		-32768
		32768
	viewportSubPixelBits                            = 0
	minMemoryMapAlignment                           = 64
	minTexelBufferOffsetAlignment                   = 0x00000010
	minUniformBufferOffsetAlignment                 = 0x00000010
	minStorageBufferOffsetAlignment                 = 0x00000010
	minTexelOffset                                  = -32
	maxTexelOffset                                  = 31
	minTexelGatherOffset                            = -32
	maxTexelGatherOffset                            = 31
	minInterpolationOffset                          = -2
	maxInterpolationOffset                          = 2
	subPixelInterpolationOffsetBits                 = 8
	maxFramebufferWidth                             = 16384
	maxFramebufferHeight                            = 16384
	maxFramebufferLayers                            = 2048
	framebufferColorSampleCounts: count = 2
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_4_BIT
	framebufferDepthSampleCounts: count = 2
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_4_BIT
	framebufferStencilSampleCounts: count = 2
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_4_BIT
	framebufferNoAttachmentsSampleCounts: count = 2
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_4_BIT
	maxColorAttachments                             = 8
	sampledImageColorSampleCounts: count = 2
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_4_BIT
	sampledImageIntegerSampleCounts: count = 2
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_4_BIT
	sampledImageDepthSampleCounts: count = 2
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_4_BIT
	sampledImageStencilSampleCounts: count = 2
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_4_BIT
	storageImageSampleCounts: count = 2
		SAMPLE_COUNT_1_BIT
		SAMPLE_COUNT_4_BIT
	maxSampleMaskWords                              = 1
	timestampComputeAndGraphics                     = true
	timestampPeriod                                 = 1
	maxClipDistances                                = 8
	maxCullDistances                                = 8
	maxCombinedClipAndCullDistances                 = 8
	discreteQueuePriorities                         = 2
	pointSizeRange: count = 2
		0
		255
	lineWidthRange: count = 2
		1
		255
	pointSizeGranularity                            = 0.125
	lineWidthGranularity                            = 0.0078125
	strictLines                                     = true
	standardSampleLocations                         = true
	optimalBufferCopyOffsetAlignment                = 0x00000080
	optimalBufferCopyRowPitchAlignment              = 0x00000080
	nonCoherentAtomSize                             = 0x00000040

VkPhysicalDeviceSparseProperties:
---------------------------------
	residencyStandard2DBlockShape            = false
	residencyStandard2DMultisampleBlockShape = false
	residencyStandard3DBlockShape            = false
	residencyAlignedMipSize                  = false
	residencyNonResidentStrict               = false

VkPhysicalDeviceCustomBorderColorPropertiesEXT:
-----------------------------------------------
	maxCustomBorderColorSamplers = 32768

VkPhysicalDeviceDescriptorBufferDensityMapPropertiesEXT:
--------------------------------------------------------
	combinedImageSamplerDensityMapDescriptorSize = 0

VkPhysicalDeviceDescriptorBufferPropertiesEXT:
----------------------------------------------
	combinedImageSamplerDescriptorSingleArray            = true
	bufferlessPushDescriptors                            = true
	allowSamplerImageViewPostSubmitCreation              = false
	descriptorBufferOffsetAlignment                      = 0x00000004
	maxDescriptorBufferBindings                          = 8
	maxResourceDescriptorBufferBindings                  = 8
	maxSamplerDescriptorBufferBindings                   = 8
	maxEmbeddedImmutableSamplerBindings                  = 8
	maxEmbeddedImmutableSamplers                         = 2032
	bufferCaptureReplayDescriptorDataSize                = 0
	imageCaptureReplayDescriptorDataSize                 = 0
	imageViewCaptureReplayDescriptorDataSize             = 0
	samplerCaptureReplayDescriptorDataSize               = 0
	accelerationStructureCaptureReplayDescriptorDataSize = 0
	samplerDescriptorSize                                = 256
	combinedImageSamplerDescriptorSize                   = 256
	sampledImageDescriptorSize                           = 256
	storageImageDescriptorSize                           = 256
	uniformTexelBufferDescriptorSize                     = 256
	robustUniformTexelBufferDescriptorSize               = 256
	storageTexelBufferDescriptorSize                     = 256
	robustStorageTexelBufferDescriptorSize               = 256
	uniformBufferDescriptorSize                          = 256
	robustUniformBufferDescriptorSize                    = 256
	storageBufferDescriptorSize                          = 256
	robustStorageBufferDescriptorSize                    = 256
	inputAttachmentDescriptorSize                        = 256
	accelerationStructureDescriptorSize                  = 0
	maxSamplerDescriptorBufferRange                      = 0x08000000
	maxResourceDescriptorBufferRange                     = 0x10000000
	samplerDescriptorBufferAddressSpaceSize              = 0x08000000
	resourceDescriptorBufferAddressSpaceSize             = 0x08000000
	descriptorBufferAddressSpaceSize                     = 0x08000000

VkPhysicalDeviceExtendedDynamicState3PropertiesEXT:
---------------------------------------------------
	dynamicPrimitiveTopologyUnrestricted = true

VkPhysicalDeviceExternalMemoryHostPropertiesEXT:
------------------------------------------------
	minImportedHostPointerAlignment = 0x00001000

VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT:
-----------------------------------------------------
	graphicsPipelineLibraryFastLinking                        = true
	graphicsPipelineLibraryIndependentInterpolationDecoration = true

VkPhysicalDeviceLineRasterizationPropertiesKHR:
-----------------------------------------------
	lineSubPixelPrecisionBits = 8

VkPhysicalDeviceMaintenance5PropertiesKHR:
------------------------------------------
	earlyFragmentMultisampleCoverageAfterSampleCounting = true
	earlyFragmentSampleMaskTestBeforeSampleCounting     = false
	depthStencilSwizzleOneSupport                       = false
	polygonModePointSize                                = true
	nonStrictSinglePixelWideLinesUseParallelogram       = false
	nonStrictWideLinesUseParallelogram                  = false

VkPhysicalDeviceMaintenance6PropertiesKHR:
------------------------------------------
	blockTexelViewCompatibleMultipleLayers = true
	maxCombinedImageSamplerDescriptorCount = 3
	fragmentShadingRateClampCombinerInputs = false

VkPhysicalDeviceMeshShaderPropertiesEXT:
----------------------------------------
	maxTaskWorkGroupTotalCount            = 4194304
	maxTaskWorkGroupCount: count = 3
		65536
		65536
		65536
	maxTaskWorkGroupInvocations           = 1024
	maxTaskWorkGroupSize: count = 3
		1024
		1024
		1024
	maxTaskPayloadSize                    = 16384
	maxTaskSharedMemorySize               = 32768
	maxTaskPayloadAndSharedMemorySize     = 32768
	maxMeshWorkGroupTotalCount            = 4194304
	maxMeshWorkGroupCount: count = 3
		65536
		65536
		65536
	maxMeshWorkGroupInvocations           = 1024
	maxMeshWorkGroupSize: count = 3
		1024
		1024
		1024
	maxMeshSharedMemorySize               = 28672
	maxMeshPayloadAndSharedMemorySize     = 45056
	maxMeshOutputMemorySize               = 32768
	maxMeshPayloadAndOutputMemorySize     = 49152
	maxMeshOutputComponents               = 128
	maxMeshOutputVertices                 = 256
	maxMeshOutputPrimitives               = 256
	maxMeshOutputLayers                   = 8
	maxMeshMultiviewViewCount             = 0
	meshOutputPerVertexGranularity        = 1
	meshOutputPerPrimitiveGranularity     = 1
	maxPreferredTaskWorkGroupInvocations  = 64
	maxPreferredMeshWorkGroupInvocations  = 128
	prefersLocalInvocationVertexOutput    = true
	prefersLocalInvocationPrimitiveOutput = true
	prefersCompactVertexOutput            = true
	prefersCompactPrimitiveOutput         = false

VkPhysicalDeviceMultiDrawPropertiesEXT:
---------------------------------------
	maxMultiDrawCount = 2048

VkPhysicalDeviceNestedCommandBufferPropertiesEXT:
-------------------------------------------------
	maxCommandBufferNestingLevel = 4294967295

VkPhysicalDeviceProvokingVertexPropertiesEXT:
---------------------------------------------
	provokingVertexModePerPipeline                       = true
	transformFeedbackPreservesTriangleFanProvokingVertex = true

VkPhysicalDevicePushDescriptorPropertiesKHR:
--------------------------------------------
	maxPushDescriptors = 32

VkPhysicalDeviceRobustness2PropertiesEXT:
-----------------------------------------
	robustStorageBufferAccessSizeAlignment = 0x00000001
	robustUniformBufferAccessSizeAlignment = 0x00000001

VkPhysicalDeviceShaderObjectPropertiesEXT:
------------------------------------------
	shaderBinaryUUID     = 32342e30-2e38-2d31-2b70-316161616161
	shaderBinaryVersion  = 1

VkPhysicalDeviceTransformFeedbackPropertiesEXT:
-----------------------------------------------
	maxTransformFeedbackStreams                = 4
	maxTransformFeedbackBuffers                = 4
	maxTransformFeedbackBufferSize             = 0xffffffff
	maxTransformFeedbackStreamDataSize         = 512
	maxTransformFeedbackBufferDataSize         = 512
	maxTransformFeedbackBufferDataStride       = 512
	transformFeedbackQueries                   = true
	transformFeedbackStreamsLinesTriangles     = false
	transformFeedbackRasterizationStreamSelect = false
	transformFeedbackDraw                      = true

VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT:
----------------------------------------------------
	maxVertexAttribDivisor = 4294967295

VkPhysicalDeviceVulkan11Properties:
-----------------------------------
	deviceUUID                        = 6d657361-3234-2e30-2e38-2d312b703100
	driverUUID                        = 6c6c766d-7069-7065-5555-494400000000
	deviceNodeMask                    = 0
	deviceLUIDValid                   = false
	subgroupSize                      = 4
	subgroupSupportedStages: count = 4
		SHADER_STAGE_FRAGMENT_BIT
		SHADER_STAGE_COMPUTE_BIT
		SHADER_STAGE_TASK_BIT_EXT
		SHADER_STAGE_MESH_BIT_EXT
	subgroupSupportedOperations: count = 7
		SUBGROUP_FEATURE_BASIC_BIT
		SUBGROUP_FEATURE_VOTE_BIT
		SUBGROUP_FEATURE_ARITHMETIC_BIT
		SUBGROUP_FEATURE_BALLOT_BIT
		SUBGROUP_FEATURE_SHUFFLE_BIT
		SUBGROUP_FEATURE_SHUFFLE_RELATIVE_BIT
		SUBGROUP_FEATURE_QUAD_BIT
	subgroupQuadOperationsInAllStages = false
	pointClippingBehavior             = POINT_CLIPPING_BEHAVIOR_ALL_CLIP_PLANES
	maxMultiviewViewCount             = 6
	maxMultiviewInstanceIndex         = 2147483647
	protectedNoFault                  = false
	maxPerSetDescriptors              = 1000000
	maxMemoryAllocationSize           = 0x80000000

VkPhysicalDeviceVulkan12Properties:
-----------------------------------
	driverID                                             = DRIVER_ID_MESA_LLVMPIPE
	driverName                                           = llvmpipe
	driverInfo                                           = Mesa 24.0.8-1+p1 (LLVM 17.0.6)
	conformanceVersion:
		major    = 1
		minor    = 3
		subminor = 1
		patch    = 1
	denormBehaviorIndependence                           = SHADER_FLOAT_CONTROLS_INDEPENDENCE_ALL
	roundingModeIndependence                             = SHADER_FLOAT_CONTROLS_INDEPENDENCE_ALL
	shaderSignedZeroInfNanPreserveFloat16                = true
	shaderSignedZeroInfNanPreserveFloat32                = true
	shaderSignedZeroInfNanPreserveFloat64                = true
	shaderDenormPreserveFloat16                          = false
	shaderDenormPreserveFloat32                          = false
	shaderDenormPreserveFloat64                          = false
	shaderDenormFlushToZeroFloat16                       = false
	shaderDenormFlushToZeroFloat32                       = false
	shaderDenormFlushToZeroFloat64                       = false
	shaderRoundingModeRTEFloat16                         = true
	shaderRoundingModeRTEFloat32                         = true
	shaderRoundingModeRTEFloat64                         = true
	shaderRoundingModeRTZFloat16                         = false
	shaderRoundingModeRTZFloat32                         = false
	shaderRoundingModeRTZFloat64                         = false
	maxUpdateAfterBindDescriptorsInAllPools              = 4294967295
	shaderUniformBufferArrayNonUniformIndexingNative     = true
	shaderSampledImageArrayNonUniformIndexingNative      = true
	shaderStorageBufferArrayNonUniformIndexingNative     = true
	shaderStorageImageArrayNonUniformIndexingNative      = true
	shaderInputAttachmentArrayNonUniformIndexingNative   = true
	robustBufferAccessUpdateAfterBind                    = true
	quadDivergentImplicitLod                             = true
	maxPerStageDescriptorUpdateAfterBindSamplers         = 1000000
	maxPerStageDescriptorUpdateAfterBindUniformBuffers   = 1000000
	maxPerStageDescriptorUpdateAfterBindStorageBuffers   = 1000000
	maxPerStageDescriptorUpdateAfterBindSampledImages    = 1000000
	maxPerStageDescriptorUpdateAfterBindStorageImages    = 1000000
	maxPerStageDescriptorUpdateAfterBindInputAttachments = 1000000
	maxPerStageUpdateAfterBindResources                  = 1000000
	maxDescriptorSetUpdateAfterBindSamplers              = 1000000
	maxDescriptorSetUpdateAfterBindUniformBuffers        = 1000000
	maxDescriptorSetUpdateAfterBindUniformBuffersDynamic = 1000000
	maxDescriptorSetUpdateAfterBindStorageBuffers        = 1000000
	maxDescriptorSetUpdateAfterBindStorageBuffersDynamic = 1000000
	maxDescriptorSetUpdateAfterBindSampledImages         = 1000000
	maxDescriptorSetUpdateAfterBindStorageImages         = 1000000
	maxDescriptorSetUpdateAfterBindInputAttachments      = 1000000
	supportedDepthResolveModes: count = 2
		RESOLVE_MODE_SAMPLE_ZERO_BIT
		RESOLVE_MODE_AVERAGE_BIT
	supportedStencilResolveModes: count = 1
		RESOLVE_MODE_SAMPLE_ZERO_BIT
	independentResolveNone                               = false
	independentResolve                                   = false
	filterMinmaxSingleComponentFormats                   = true
	filterMinmaxImageComponentMapping                    = true
	maxTimelineSemaphoreValueDifference                  = 18446744073709551615
	framebufferIntegerColorSampleCounts: count = 1
		SAMPLE_COUNT_1_BIT

VkPhysicalDeviceVulkan13Properties:
-----------------------------------
	minSubgroupSize                                                               = 4
	maxSubgroupSize                                                               = 4
	maxComputeWorkgroupSubgroups                                                  = 32
	requiredSubgroupSizeStages: count = 2
		SHADER_STAGE_FRAGMENT_BIT
		SHADER_STAGE_COMPUTE_BIT
	maxInlineUniformBlockSize                                                     = 4096
	maxPerStageDescriptorInlineUniformBlocks                                      = 8
	maxPerStageDescriptorUpdateAfterBindInlineUniformBlocks                       = 8
	maxDescriptorSetInlineUniformBlocks                                           = 8
	maxDescriptorSetUpdateAfterBindInlineUniformBlocks                            = 8
	maxInlineUniformTotalSize                                                     = 262144
	integerDotProduct8BitUnsignedAccelerated                                      = false
	integerDotProduct8BitSignedAccelerated                                        = false
	integerDotProduct8BitMixedSignednessAccelerated                               = false
	integerDotProduct4x8BitPackedUnsignedAccelerated                              = false
	integerDotProduct4x8BitPackedSignedAccelerated                                = false
	integerDotProduct4x8BitPackedMixedSignednessAccelerated                       = false
	integerDotProduct16BitUnsignedAccelerated                                     = false
	integerDotProduct16BitSignedAccelerated                                       = false
	integerDotProduct16BitMixedSignednessAccelerated                              = false
	integerDotProduct32BitUnsignedAccelerated                                     = false
	integerDotProduct32BitSignedAccelerated                                       = false
	integerDotProduct32BitMixedSignednessAccelerated                              = false
	integerDotProduct64BitUnsignedAccelerated                                     = false
	integerDotProduct64BitSignedAccelerated                                       = false
	integerDotProduct64BitMixedSignednessAccelerated                              = false
	integerDotProductAccumulatingSaturating8BitUnsignedAccelerated                = false
	integerDotProductAccumulatingSaturating8BitSignedAccelerated                  = false
	integerDotProductAccumulatingSaturating8BitMixedSignednessAccelerated         = false
	integerDotProductAccumulatingSaturating4x8BitPackedUnsignedAccelerated        = false
	integerDotProductAccumulatingSaturating4x8BitPackedSignedAccelerated          = false
	integerDotProductAccumulatingSaturating4x8BitPackedMixedSignednessAccelerated = false
	integerDotProductAccumulatingSaturating16BitUnsignedAccelerated               = false
	integerDotProductAccumulatingSaturating16BitSignedAccelerated                 = false
	integerDotProductAccumulatingSaturating16BitMixedSignednessAccelerated        = false
	integerDotProductAccumulatingSaturating32BitUnsignedAccelerated               = false
	integerDotProductAccumulatingSaturating32BitSignedAccelerated                 = false
	integerDotProductAccumulatingSaturating32BitMixedSignednessAccelerated        = false
	integerDotProductAccumulatingSaturating64BitUnsignedAccelerated               = false
	integerDotProductAccumulatingSaturating64BitSignedAccelerated                 = false
	integerDotProductAccumulatingSaturating64BitMixedSignednessAccelerated        = false
	storageTexelBufferOffsetAlignmentBytes                                        = 0x00000010
	storageTexelBufferOffsetSingleTexelAlignment                                  = true
	uniformTexelBufferOffsetAlignmentBytes                                        = 0x00000010
	uniformTexelBufferOffsetSingleTexelAlignment                                  = true
	maxBufferSize                                                                 = 0xffffffff

VkPhysicalDeviceHostImageCopyPropertiesEXT:
-------------------------------------------
	copySrcLayoutCount                  = 23
	pCopySrcLayouts: count = 23
		IMAGE_LAYOUT_GENERAL
		IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL
		IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL
		IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL
		IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL
		IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL
		IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL
		IMAGE_LAYOUT_PREINITIALIZED
		IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL
		IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL
		IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL
		IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL
		IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL
		IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL
		IMAGE_LAYOUT_READ_ONLY_OPTIMAL
		IMAGE_LAYOUT_ATTACHMENT_OPTIMAL
		IMAGE_LAYOUT_PRESENT_SRC_KHR
		IMAGE_LAYOUT_VIDEO_DECODE_DST_KHR
		IMAGE_LAYOUT_VIDEO_DECODE_SRC_KHR
		IMAGE_LAYOUT_VIDEO_DECODE_DPB_KHR
		IMAGE_LAYOUT_SHARED_PRESENT_KHR
		IMAGE_LAYOUT_FRAGMENT_DENSITY_MAP_OPTIMAL_EXT
		IMAGE_LAYOUT_FRAGMENT_SHADING_RATE_ATTACHMENT_OPTIMAL_KHR
	copyDstLayoutCount                  = 23
	pCopyDstLayouts: count = 23
		IMAGE_LAYOUT_GENERAL
		IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL
		IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL
		IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL
		IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL
		IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL
		IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL
		IMAGE_LAYOUT_PREINITIALIZED
		IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL
		IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL
		IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL
		IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL
		IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL
		IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL
		IMAGE_LAYOUT_READ_ONLY_OPTIMAL
		IMAGE_LAYOUT_ATTACHMENT_OPTIMAL
		IMAGE_LAYOUT_PRESENT_SRC_KHR
		IMAGE_LAYOUT_VIDEO_DECODE_DST_KHR
		IMAGE_LAYOUT_VIDEO_DECODE_SRC_KHR
		IMAGE_LAYOUT_VIDEO_DECODE_DPB_KHR
		IMAGE_LAYOUT_SHARED_PRESENT_KHR
		IMAGE_LAYOUT_FRAGMENT_DENSITY_MAP_OPTIMAL_EXT
		IMAGE_LAYOUT_FRAGMENT_SHADING_RATE_ATTACHMENT_OPTIMAL_KHR
	optimalTilingLayoutUUID             = 32342e30-2e38-2d31-2b70-316161616161
	identicalMemoryTypeRequirements     = false

Device Extensions: count = 124
	VK_AMDX_shader_enqueue                        : extension revision 1
	VK_ARM_rasterization_order_attachment_access  : extension revision 1
	VK_EXT_4444_formats                           : extension revision 1
	VK_EXT_attachment_feedback_loop_dynamic_state : extension revision 1
	VK_EXT_attachment_feedback_loop_layout        : extension revision 2
	VK_EXT_border_color_swizzle                   : extension revision 1
	VK_EXT_calibrated_timestamps                  : extension revision 2
	VK_EXT_color_write_enable                     : extension revision 1
	VK_EXT_conditional_rendering                  : extension revision 2
	VK_EXT_custom_border_color                    : extension revision 12
	VK_EXT_depth_clip_control                     : extension revision 1
	VK_EXT_depth_clip_enable                      : extension revision 1
	VK_EXT_depth_range_unrestricted               : extension revision 1
	VK_EXT_descriptor_buffer                      : extension revision 1
	VK_EXT_descriptor_indexing                    : extension revision 2
	VK_EXT_dynamic_rendering_unused_attachments   : extension revision 1
	VK_EXT_extended_dynamic_state                 : extension revision 1
	VK_EXT_extended_dynamic_state2                : extension revision 1
	VK_EXT_extended_dynamic_state3                : extension revision 2
	VK_EXT_external_memory_host                   : extension revision 1
	VK_EXT_graphics_pipeline_library              : extension revision 1
	VK_EXT_host_image_copy                        : extension revision 1
	VK_EXT_host_query_reset                       : extension revision 1
	VK_EXT_image_2d_view_of_3d                    : extension revision 1
	VK_EXT_image_robustness                       : extension revision 1
	VK_EXT_image_sliced_view_of_3d                : extension revision 1
	VK_EXT_index_type_uint8                       : extension revision 1
	VK_EXT_inline_uniform_block                   : extension revision 1
	VK_EXT_line_rasterization                     : extension revision 1
	VK_EXT_load_store_op_none                     : extension revision 1
	VK_EXT_memory_budget                          : extension revision 1
	VK_EXT_memory_priority                        : extension revision 1
	VK_EXT_mesh_shader                            : extension revision 1
	VK_EXT_multi_draw                             : extension revision 1
	VK_EXT_multisampled_render_to_single_sampled  : extension revision 1
	VK_EXT_mutable_descriptor_type                : extension revision 1
	VK_EXT_nested_command_buffer                  : extension revision 1
	VK_EXT_non_seamless_cube_map                  : extension revision 1
	VK_EXT_pageable_device_local_memory           : extension revision 1
	VK_EXT_pipeline_creation_cache_control        : extension revision 3
	VK_EXT_pipeline_creation_feedback             : extension revision 1
	VK_EXT_post_depth_coverage                    : extension revision 1
	VK_EXT_primitive_topology_list_restart        : extension revision 1
	VK_EXT_primitives_generated_query             : extension revision 1
	VK_EXT_private_data                           : extension revision 1
	VK_EXT_provoking_vertex                       : extension revision 1
	VK_EXT_rasterization_order_attachment_access  : extension revision 1
	VK_EXT_robustness2                            : extension revision 1
	VK_EXT_sampler_filter_minmax                  : extension revision 2
	VK_EXT_scalar_block_layout                    : extension revision 1
	VK_EXT_separate_stencil_usage                 : extension revision 1
	VK_EXT_shader_atomic_float                    : extension revision 1
	VK_EXT_shader_atomic_float2                   : extension revision 1
	VK_EXT_shader_demote_to_helper_invocation     : extension revision 1
	VK_EXT_shader_object                          : extension revision 1
	VK_EXT_shader_stencil_export                  : extension revision 1
	VK_EXT_shader_subgroup_ballot                 : extension revision 1
	VK_EXT_shader_subgroup_vote                   : extension revision 1
	VK_EXT_shader_viewport_index_layer            : extension revision 1
	VK_EXT_subgroup_size_control                  : extension revision 2
	VK_EXT_texel_buffer_alignment                 : extension revision 1
	VK_EXT_transform_feedback                     : extension revision 1
	VK_EXT_vertex_attribute_divisor               : extension revision 3
	VK_EXT_vertex_input_dynamic_state             : extension revision 2
	VK_EXT_ycbcr_2plane_444_formats               : extension revision 1
	VK_EXT_ycbcr_image_arrays                     : extension revision 1
	VK_GOOGLE_decorate_string                     : extension revision 1
	VK_GOOGLE_hlsl_functionality1                 : extension revision 1
	VK_KHR_16bit_storage                          : extension revision 1
	VK_KHR_8bit_storage                           : extension revision 1
	VK_KHR_bind_memory2                           : extension revision 1
	VK_KHR_buffer_device_address                  : extension revision 1
	VK_KHR_copy_commands2                         : extension revision 1
	VK_KHR_create_renderpass2                     : extension revision 1
	VK_KHR_dedicated_allocation                   : extension revision 3
	VK_KHR_depth_stencil_resolve                  : extension revision 1
	VK_KHR_descriptor_update_template             : extension revision 1
	VK_KHR_device_group                           : extension revision 4
	VK_KHR_draw_indirect_count                    : extension revision 1
	VK_KHR_driver_properties                      : extension revision 1
	VK_KHR_dynamic_rendering                      : extension revision 1
	VK_KHR_external_fence                         : extension revision 1
	VK_KHR_external_memory                        : extension revision 1
	VK_KHR_external_memory_fd                     : extension revision 1
	VK_KHR_external_semaphore                     : extension revision 1
	VK_KHR_format_feature_flags2                  : extension revision 2
	VK_KHR_get_memory_requirements2               : extension revision 1
	VK_KHR_image_format_list                      : extension revision 1
	VK_KHR_imageless_framebuffer                  : extension revision 1
	VK_KHR_incremental_present                    : extension revision 2
	VK_KHR_maintenance1                           : extension revision 2
	VK_KHR_maintenance2                           : extension revision 1
	VK_KHR_maintenance3                           : extension revision 1
	VK_KHR_maintenance4                           : extension revision 2
	VK_KHR_maintenance5                           : extension revision 1
	VK_KHR_maintenance6                           : extension revision 1
	VK_KHR_map_memory2                            : extension revision 1
	VK_KHR_multiview                              : extension revision 1
	VK_KHR_pipeline_library                       : extension revision 1
	VK_KHR_push_descriptor                        : extension revision 2
	VK_KHR_relaxed_block_layout                   : extension revision 1
	VK_KHR_sampler_mirror_clamp_to_edge           : extension revision 3
	VK_KHR_sampler_ycbcr_conversion               : extension revision 14
	VK_KHR_separate_depth_stencil_layouts         : extension revision 1
	VK_KHR_shader_atomic_int64                    : extension revision 1
	VK_KHR_shader_clock                           : extension revision 1
	VK_KHR_shader_draw_parameters                 : extension revision 1
	VK_KHR_shader_float16_int8                    : extension revision 1
	VK_KHR_shader_float_controls                  : extension revision 4
	VK_KHR_shader_integer_dot_product             : extension revision 1
	VK_KHR_shader_non_semantic_info               : extension revision 1
	VK_KHR_shader_subgroup_extended_types         : extension revision 1
	VK_KHR_shader_terminate_invocation            : extension revision 1
	VK_KHR_spirv_1_4                              : extension revision 1
	VK_KHR_storage_buffer_storage_class           : extension revision 1
	VK_KHR_swapchain                              : extension revision 70
	VK_KHR_swapchain_mutable_format               : extension revision 1
	VK_KHR_synchronization2                       : extension revision 1
	VK_KHR_timeline_semaphore                     : extension revision 2
	VK_KHR_uniform_buffer_standard_layout         : extension revision 1
	VK_KHR_variable_pointers                      : extension revision 1
	VK_KHR_vulkan_memory_model                    : extension revision 3
	VK_KHR_zero_initialize_workgroup_memory       : extension revision 1
	VK_NV_device_generated_commands               : extension revision 3

VkQueueFamilyProperties:
========================
	queueProperties[0]:
	-------------------
		minImageTransferGranularity = (1,1,1)
		queueCount                  = 1
		queueFlags                  = QUEUE_GRAPHICS_BIT | QUEUE_COMPUTE_BIT | QUEUE_TRANSFER_BIT
		timestampValidBits          = 64
		present support             = false

VkPhysicalDeviceMemoryProperties:
=================================
memoryHeaps: count = 1
	memoryHeaps[0]:
		size   = 3505938432 (0xd0f86000) (3.27 GiB)
		budget = 3505938432 (0xd0f86000) (3.27 GiB)
		usage  = 522092544 (0x1f1e8000) (497.91 MiB)
		flags: count = 1
			MEMORY_HEAP_DEVICE_LOCAL_BIT
memoryTypes: count = 1
	memoryTypes[0]:
		heapIndex     = 0
		propertyFlags = 0x000f: count = 4
			MEMORY_PROPERTY_DEVICE_LOCAL_BIT
			MEMORY_PROPERTY_HOST_VISIBLE_BIT
			MEMORY_PROPERTY_HOST_COHERENT_BIT
			MEMORY_PROPERTY_HOST_CACHED_BIT
		usable for:
			IMAGE_TILING_OPTIMAL:
				color images
				FORMAT_D16_UNORM
				FORMAT_X8_D24_UNORM_PACK32
				FORMAT_D32_SFLOAT
				FORMAT_S8_UINT
				FORMAT_D24_UNORM_S8_UINT
				FORMAT_D32_SFLOAT_S8_UINT
				(non-sparse)
			IMAGE_TILING_LINEAR:
				color images
				(non-sparse)

VkPhysicalDeviceFeatures:
=========================
	robustBufferAccess                      = true
	fullDrawIndexUint32                     = true
	imageCubeArray                          = true
	independentBlend                        = true
	geometryShader                          = true
	tessellationShader                      = true
	sampleRateShading                       = true
	dualSrcBlend                            = true
	logicOp                                 = true
	multiDrawIndirect                       = true
	drawIndirectFirstInstance               = true
	depthClamp                              = true
	depthBiasClamp                          = true
	fillModeNonSolid                        = true
	depthBounds                             = false
	wideLines                               = true
	largePoints                             = true
	alphaToOne                              = true
	multiViewport                           = true
	samplerAnisotropy                       = true
	textureCompressionETC2                  = false
	textureCompressionASTC_LDR              = false
	textureCompressionBC                    = true
	occlusionQueryPrecise                   = true
	pipelineStatisticsQuery                 = true
	vertexPipelineStoresAndAtomics          = true
	fragmentStoresAndAtomics                = true
	shaderTessellationAndGeometryPointSize  = true
	shaderImageGatherExtended               = true
	shaderStorageImageExtendedFormats       = true
	shaderStorageImageMultisample           = true
	shaderStorageImageReadWithoutFormat     = true
	shaderStorageImageWriteWithoutFormat    = true
	shaderUniformBufferArrayDynamicIndexing = true
	shaderSampledImageArrayDynamicIndexing  = true
	shaderStorageBufferArrayDynamicIndexing = true
	shaderStorageImageArrayDynamicIndexing  = true
	shaderClipDistance                      = true
	shaderCullDistance                      = true
	shaderFloat64                           = true
	shaderInt64                             = true
	shaderInt16                             = true
	shaderResourceResidency                 = false
	shaderResourceMinLod                    = false
	sparseBinding                           = false
	sparseResidencyBuffer                   = false
	sparseResidencyImage2D                  = false
	sparseResidencyImage3D                  = false
	sparseResidency2Samples                 = false
	sparseResidency4Samples                 = false
	sparseResidency8Samples                 = false
	sparseResidency16Samples                = false
	sparseResidencyAliased                  = false
	variableMultisampleRate                 = false
	inheritedQueries                        = false

VkPhysicalDevice4444FormatsFeaturesEXT:
---------------------------------------
	formatA4R4G4B4 = true
	formatA4B4G4R4 = true

VkPhysicalDeviceAttachmentFeedbackLoopDynamicStateFeaturesEXT:
--------------------------------------------------------------
	attachmentFeedbackLoopDynamicState = true

VkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT:
--------------------------------------------------------
	attachmentFeedbackLoopLayout = true

VkPhysicalDeviceBorderColorSwizzleFeaturesEXT:
----------------------------------------------
	borderColorSwizzle          = true
	borderColorSwizzleFromImage = true

VkPhysicalDeviceColorWriteEnableFeaturesEXT:
--------------------------------------------
	colorWriteEnable = true

VkPhysicalDeviceConditionalRenderingFeaturesEXT:
------------------------------------------------
	conditionalRendering          = true
	inheritedConditionalRendering = false

VkPhysicalDeviceCustomBorderColorFeaturesEXT:
---------------------------------------------
	customBorderColors             = true
	customBorderColorWithoutFormat = true

VkPhysicalDeviceDepthClipControlFeaturesEXT:
--------------------------------------------
	depthClipControl = true

VkPhysicalDeviceDepthClipEnableFeaturesEXT:
-------------------------------------------
	depthClipEnable = true

VkPhysicalDeviceDescriptorBufferFeaturesEXT:
--------------------------------------------
	descriptorBuffer                   = true
	descriptorBufferCaptureReplay      = false
	descriptorBufferImageLayoutIgnored = true
	descriptorBufferPushDescriptors    = true

VkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT:
-------------------------------------------------------------
	dynamicRenderingUnusedAttachments = true

VkPhysicalDeviceExtendedDynamicState2FeaturesEXT:
-------------------------------------------------
	extendedDynamicState2                   = true
	extendedDynamicState2LogicOp            = true
	extendedDynamicState2PatchControlPoints = true

VkPhysicalDeviceExtendedDynamicState3FeaturesEXT:
-------------------------------------------------
	extendedDynamicState3TessellationDomainOrigin         = true
	extendedDynamicState3DepthClampEnable                 = true
	extendedDynamicState3PolygonMode                      = true
	extendedDynamicState3RasterizationSamples             = true
	extendedDynamicState3SampleMask                       = true
	extendedDynamicState3AlphaToCoverageEnable            = true
	extendedDynamicState3AlphaToOneEnable                 = true
	extendedDynamicState3LogicOpEnable                    = true
	extendedDynamicState3ColorBlendEnable                 = true
	extendedDynamicState3ColorBlendEquation               = true
	extendedDynamicState3ColorWriteMask                   = true
	extendedDynamicState3RasterizationStream              = false
	extendedDynamicState3ConservativeRasterizationMode    = false
	extendedDynamicState3ExtraPrimitiveOverestimationSize = false
	extendedDynamicState3DepthClipEnable                  = true
	extendedDynamicState3SampleLocationsEnable            = false
	extendedDynamicState3ColorBlendAdvanced               = false
	extendedDynamicState3ProvokingVertexMode              = true
	extendedDynamicState3LineRasterizationMode            = true
	extendedDynamicState3LineStippleEnable                = true
	extendedDynamicState3DepthClipNegativeOneToOne        = true
	extendedDynamicState3ViewportWScalingEnable           = false
	extendedDynamicState3ViewportSwizzle                  = false
	extendedDynamicState3CoverageToColorEnable            = false
	extendedDynamicState3CoverageToColorLocation          = false
	extendedDynamicState3CoverageModulationMode           = false
	extendedDynamicState3CoverageModulationTableEnable    = false
	extendedDynamicState3CoverageModulationTable          = false
	extendedDynamicState3CoverageReductionMode            = false
	extendedDynamicState3RepresentativeFragmentTestEnable = false
	extendedDynamicState3ShadingRateImageEnable           = false

VkPhysicalDeviceExtendedDynamicStateFeaturesEXT:
------------------------------------------------
	extendedDynamicState = true

VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT:
---------------------------------------------------
	graphicsPipelineLibrary = true

VkPhysicalDeviceHostImageCopyFeaturesEXT:
-----------------------------------------
	hostImageCopy = true

VkPhysicalDeviceImage2DViewOf3DFeaturesEXT:
-------------------------------------------
	image2DViewOf3D   = true
	sampler2DViewOf3D = true

VkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT:
-----------------------------------------------
	imageSlicedViewOf3D = true

VkPhysicalDeviceIndexTypeUint8FeaturesKHR:
------------------------------------------
	indexTypeUint8 = true

VkPhysicalDeviceLineRasterizationFeaturesKHR:
---------------------------------------------
	rectangularLines         = true
	bresenhamLines           = true
	smoothLines              = true
	stippledRectangularLines = true
	stippledBresenhamLines   = true
	stippledSmoothLines      = true

VkPhysicalDeviceMaintenance5FeaturesKHR:
----------------------------------------
	maintenance5 = true

VkPhysicalDeviceMaintenance6FeaturesKHR:
----------------------------------------
	maintenance6 = true

VkPhysicalDeviceMemoryPriorityFeaturesEXT:
------------------------------------------
	memoryPriority = true

VkPhysicalDeviceMeshShaderFeaturesEXT:
--------------------------------------
	taskShader                             = true
	meshShader                             = true
	multiviewMeshShader                    = false
	primitiveFragmentShadingRateMeshShader = false
	meshShaderQueries                      = true

VkPhysicalDeviceMultiDrawFeaturesEXT:
-------------------------------------
	multiDraw = true

VkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT:
-------------------------------------------------------------
	multisampledRenderToSingleSampled = true

VkPhysicalDeviceMutableDescriptorTypeFeaturesEXT:
-------------------------------------------------
	mutableDescriptorType = true

VkPhysicalDeviceNestedCommandBufferFeaturesEXT:
-----------------------------------------------
	nestedCommandBuffer                = true
	nestedCommandBufferRendering       = true
	nestedCommandBufferSimultaneousUse = true

VkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT:
----------------------------------------------
	nonSeamlessCubeMap = true

VkPhysicalDevicePageableDeviceLocalMemoryFeaturesEXT:
-----------------------------------------------------
	pageableDeviceLocalMemory = true

VkPhysicalDevicePrimitiveTopologyListRestartFeaturesEXT:
--------------------------------------------------------
	primitiveTopologyListRestart      = true
	primitiveTopologyPatchListRestart = true

VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT:
----------------------------------------------------
	primitivesGeneratedQuery                      = true
	primitivesGeneratedQueryWithRasterizerDiscard = true
	primitivesGeneratedQueryWithNonZeroStreams    = true

VkPhysicalDeviceProvokingVertexFeaturesEXT:
-------------------------------------------
	provokingVertexLast                       = true
	transformFeedbackPreservesProvokingVertex = true

VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT:
--------------------------------------------------------------
	rasterizationOrderColorAttachmentAccess   = true
	rasterizationOrderDepthAttachmentAccess   = true
	rasterizationOrderStencilAttachmentAccess = true

VkPhysicalDeviceRobustness2FeaturesEXT:
---------------------------------------
	robustBufferAccess2 = true
	robustImageAccess2  = true
	nullDescriptor      = true

VkPhysicalDeviceShaderAtomicFloat2FeaturesEXT:
----------------------------------------------
	shaderBufferFloat16Atomics      = false
	shaderBufferFloat16AtomicAdd    = false
	shaderBufferFloat16AtomicMinMax = false
	shaderBufferFloat32AtomicMinMax = true
	shaderBufferFloat64AtomicMinMax = false
	shaderSharedFloat16Atomics      = false
	shaderSharedFloat16AtomicAdd    = false
	shaderSharedFloat16AtomicMinMax = false
	shaderSharedFloat32AtomicMinMax = true
	shaderSharedFloat64AtomicMinMax = false
	shaderImageFloat32AtomicMinMax  = true
	sparseImageFloat32AtomicMinMax  = false

VkPhysicalDeviceShaderAtomicFloatFeaturesEXT:
---------------------------------------------
	shaderBufferFloat32Atomics   = true
	shaderBufferFloat32AtomicAdd = true
	shaderBufferFloat64Atomics   = false
	shaderBufferFloat64AtomicAdd = false
	shaderSharedFloat32Atomics   = true
	shaderSharedFloat32AtomicAdd = true
	shaderSharedFloat64Atomics   = false
	shaderSharedFloat64AtomicAdd = false
	shaderImageFloat32Atomics    = true
	shaderImageFloat32AtomicAdd  = true
	sparseImageFloat32Atomics    = false
	sparseImageFloat32AtomicAdd  = false

VkPhysicalDeviceShaderClockFeaturesKHR:
---------------------------------------
	shaderSubgroupClock = true
	shaderDeviceClock   = true

VkPhysicalDeviceShaderObjectFeaturesEXT:
----------------------------------------
	shaderObject = true

VkPhysicalDeviceTexelBufferAlignmentFeaturesEXT:
------------------------------------------------
	texelBufferAlignment = true

VkPhysicalDeviceTransformFeedbackFeaturesEXT:
---------------------------------------------
	transformFeedback = true
	geometryStreams   = true

VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR:
--------------------------------------------------
	vertexAttributeInstanceRateDivisor     = true
	vertexAttributeInstanceRateZeroDivisor = true

VkPhysicalDeviceVertexInputDynamicStateFeaturesEXT:
---------------------------------------------------
	vertexInputDynamicState = true

VkPhysicalDeviceVulkan11Features:
---------------------------------
	storageBuffer16BitAccess           = true
	uniformAndStorageBuffer16BitAccess = true
	storagePushConstant16              = true
	storageInputOutput16               = false
	multiview                          = true
	multiviewGeometryShader            = true
	multiviewTessellationShader        = true
	variablePointersStorageBuffer      = true
	variablePointers                   = true
	protectedMemory                    = false
	samplerYcbcrConversion             = true
	shaderDrawParameters               = true

VkPhysicalDeviceVulkan12Features:
---------------------------------
	samplerMirrorClampToEdge                           = true
	drawIndirectCount                                  = true
	storageBuffer8BitAccess                            = true
	uniformAndStorageBuffer8BitAccess                  = true
	storagePushConstant8                               = true
	shaderBufferInt64Atomics                           = true
	shaderSharedInt64Atomics                           = true
	shaderFloat16                                      = true
	shaderInt8                                         = true
	descriptorIndexing                                 = true
	shaderInputAttachmentArrayDynamicIndexing          = true
	shaderUniformTexelBufferArrayDynamicIndexing       = true
	shaderStorageTexelBufferArrayDynamicIndexing       = true
	shaderUniformBufferArrayNonUniformIndexing         = true
	shaderSampledImageArrayNonUniformIndexing          = true
	shaderStorageBufferArrayNonUniformIndexing         = true
	shaderStorageImageArrayNonUniformIndexing          = true
	shaderInputAttachmentArrayNonUniformIndexing       = true
	shaderUniformTexelBufferArrayNonUniformIndexing    = true
	shaderStorageTexelBufferArrayNonUniformIndexing    = true
	descriptorBindingUniformBufferUpdateAfterBind      = true
	descriptorBindingSampledImageUpdateAfterBind       = true
	descriptorBindingStorageImageUpdateAfterBind       = true
	descriptorBindingStorageBufferUpdateAfterBind      = true
	descriptorBindingUniformTexelBufferUpdateAfterBind = true
	descriptorBindingStorageTexelBufferUpdateAfterBind = true
	descriptorBindingUpdateUnusedWhilePending          = true
	descriptorBindingPartiallyBound                    = true
	descriptorBindingVariableDescriptorCount           = true
	runtimeDescriptorArray                             = true
	samplerFilterMinmax                                = true
	scalarBlockLayout                                  = true
	imagelessFramebuffer                               = true
	uniformBufferStandardLayout                        = true
	shaderSubgroupExtendedTypes                        = true
	separateDepthStencilLayouts                        = true
	hostQueryReset                                     = true
	timelineSemaphore                                  = true
	bufferDeviceAddress                                = true
	bufferDeviceAddressCaptureReplay                   = false
	bufferDeviceAddressMultiDevice                     = false
	vulkanMemoryModel                                  = true
	vulkanMemoryModelDeviceScope                       = true
	vulkanMemoryModelAvailabilityVisibilityChains      = true
	shaderOutputViewportIndex                          = true
	shaderOutputLayer                                  = true
	subgroupBroadcastDynamicId                         = true

VkPhysicalDeviceVulkan13Features:
---------------------------------
	robustImageAccess                                  = true
	inlineUniformBlock                                 = true
	descriptorBindingInlineUniformBlockUpdateAfterBind = true
	pipelineCreationCacheControl                       = true
	privateData                                        = true
	shaderDemoteToHelperInvocation                     = true
	shaderTerminateInvocation                          = true
	subgroupSizeControl                                = true
	computeFullSubgroups                               = true
	synchronization2                                   = true
	textureCompressionASTC_HDR                         = false
	shaderZeroInitializeWorkgroupMemory                = true
	dynamicRendering                                   = true
	shaderIntegerDotProduct                            = true
	maintenance4                                       = true

VkPhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT:
-------------------------------------------------
	ycbcr2plane444Formats = true

VkPhysicalDeviceYcbcrImageArraysFeaturesEXT:
--------------------------------------------
	ycbcrImageArrays = true


-- 
2.45.1.288.g0e0cd299f1-goog

