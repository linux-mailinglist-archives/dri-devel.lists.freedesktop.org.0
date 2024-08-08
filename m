Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE28694C4ED
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 20:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3CD10E7E1;
	Thu,  8 Aug 2024 18:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="XgwkTY2V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E7210E7E4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 18:53:27 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a7a8a4e4a46so15089166b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2024 11:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1723143206; x=1723748006; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IkEjACGzvzVpDyWui0CAastgS2MJtW1SpPyiXo0+9OA=;
 b=XgwkTY2VvODzL4quWMPhxI6u3NPNvn3+GCX/VfqMqZptrxcBieJis8xuzaCIXIW9cx
 jni1+qvvWxsudNRZvxu4cNxqVZ24ZmxyrdHRy+pL3pEiEkt9fUx4mwuFfA4qfhXoP0WS
 nQv5tUHjwC4gWUUSvXl/YV2+KhaEHGSHPhpeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723143206; x=1723748006;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IkEjACGzvzVpDyWui0CAastgS2MJtW1SpPyiXo0+9OA=;
 b=cYcCvH76z/kzrLGeL1SXaKfID5B6Y3nZQWq1Y4ZuLS5vu+0aoNup4xCeawryJobLh9
 W3Q2/pXBm2X6edoGlSp1oserIRpn2qlQu91yXTAZWXeoSgR2yizSDNe19Z1+z1I5s5T/
 slXo3p9O5cGHHDS/amPyfMXBKF+D3GQSkx/azhRruHoAWL9TPfU4TU/TuQhq8AA7Kmp+
 JYxSBmhNHkvpkNiC3CHRDn4NfarJvlhfNeS5c/iC6vj5pH3MYJ8rW7JOguW2rRRQ73oL
 crNqXw1VxUN3oh7Uwbf8vZoC0i/b3sPRI9bhqXyTgszBJBLH6nWcBJzJ6+Xr9OujAqpq
 qoeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy1aFu+oUcdkjnfOjBdhgT0gmBDOmu66pmS0Mkh/4h7iHPjTOn7FpghbZunD01Dx/we135f+BV3PE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZnbjGieFqJS0Ic+blEW5378rpYh7u9LfcbhcK+gn8Lyv2J9jJ
 yp35K6nMwNj5kPCD0/ki8Ml7TxTCWRCYatAFSqX1BNBCqHCq+m+d68URqL6PPa0=
X-Google-Smtp-Source: AGHT+IHpVYfDOx/p8MfHzXJ1xhnBYqSV3VQeqOIAs8cOpZ7J8SzIoEPjrqle4fpMak448OsZOL4ZWg==
X-Received: by 2002:a17:907:94c5:b0:a7a:a3ad:6007 with SMTP id
 a640c23a62f3a-a80a2005a47mr26530566b.8.1723143205416; 
 Thu, 08 Aug 2024 11:53:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9e842bfsm771789166b.181.2024.08.08.11.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 11:53:24 -0700 (PDT)
Date: Thu, 8 Aug 2024 20:53:22 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-misc-next
Message-ID: <ZrUUIndjUtrR9urB@phenom.ffwll.local>
References: <20240801121406.GA102996@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240801121406.GA102996@linux.fritz.box>
X-Operating-System: Linux phenom 6.9.10-amd64 
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

On Thu, Aug 01, 2024 at 02:14:06PM +0200, Thomas Zimmermann wrote:
> Hi Dave, Sima,
> 
> here's the first PR for drm-misc-next for what will become Linux v6.12.
> It's the ususal mix of new features and bug fixes. Nouveau got a larger
> refactoring, there are some improvements within TTM, work on the panic
> screen progresses, mgag200 now supports VBLANK interrupts.
> 
> Best regards
> Thomas
> 
> drm-misc-next-2024-08-01:
> drm-misc-next for v6.12:
> 
> UAPI Changes:
> 
> virtio:
> - Define DRM capset
> 
> Cross-subsystem Changes:
> 
> dma-buf:
> - heaps: Clean up documentation
> 
> printk:
> - Pass description to kmsg_dump()
> 
> Core Changes:
> 
> CI:
> - Update IGT tests
> - Point upstream repo to GitLab instance
> 
> modesetting:
> - Introduce Power Saving Policy property for connectors
> - Add might_fault() to drm_modeset_lock priming
> - Add dynamic per-crtc vblank configuration support
> 
> panic:
> - Avoid build-time interference with framebuffer console
> 
> docs:
> - Document Colorspace property
> 
> scheduler:
> - Remove full_recover from drm_sched_start
> 
> TTM:
> - Make LRU walk restartable after dropping locks
> - Allow direct reclaim to allocate local memory
> 
> Driver Changes:
> 
> amdgpu:
> - Support Power Saving Policy connector property
> 
> ast:
> - astdp: Support AST2600 with VGA; Clean up HPD
> 
> bridge:
> - Silence error message on -EPROBE_DEFER
> - analogix: Clean aup
> - bridge-connector: Fix double free
> - lt6505: Disable interrupt when powered off
> - tc358767: Make default DP port preemphasis configurable
> 
> gma500:
> - Update i2c terminology
> 
> ivpu:
> - Add MODULE_FIRMWARE()
> 
> lcdif:
> - Fix pixel clock
> 
> loongson:
> - Use GEM refcount over TTM's
> 
> mgag200:
> - Improve BMC handling
> - Support VBLANK intterupts
> 
> nouveau:
> - Refactor and clean up internals
> - Use GEM refcount over TTM's
> 
> panel:
> - Shutdown fixes plus documentation
> - Refactor several drivers for better code sharing
> - boe-th101mb31ig002: Support for starry-er88577 MIPI-DSI panel plus
>   DT; Fix porch parameter
> - edp: Support AOU B116XTN02.3, AUO B116XAN06.1, AOU B116XAT04.1,
>   BOE NV140WUM-N41, BOE NV133WUM-N63, BOE NV116WHM-A4D, CMN N116BCA-EA2,
>   CMN N116BCP-EA2, CSW MNB601LS1-4
> - himax-hx8394: Support Microchip AC40T08A MIPI Display panel plus DT
> - ilitek-ili9806e: Support Densitron DMT028VGHMCMI-1D TFT plus DT
> - jd9365da: Support Melfas lmfbx101117480 MIPI-DSI panel plus DT; Refactor
>   for code sharing
> 
> sti:
> - Fix module owner
> 
> stm:
> - Avoid UAF wih managed plane and CRTC helpers
> - Fix module owner
> - Fix error handling in probe
> - Depend on COMMON_CLK
> - ltdc: Fix transparency after disabling plane; Remove unused interrupt
> 
> tegra:
> - Call drm_atomic_helper_shutdown()
> 
> v3d:
> - Clean up perfmon
> 
> vkms:
> - Clean up
> The following changes since commit d4ef5d2b7ee0cbb5f2d864716140366a618400d6:
> 
>   Merge tag 'amd-drm-fixes-6.11-2024-07-25' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-07-26 09:52:15 +1000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-2024-08-01

Pulled, thanks.
-Sima

> 
> for you to fetch changes up to d97e71e449373efbd2403f1d7a32d416599f32ac:
> 
>   drm/bridge: synopsys: dw-mipi-dsi: enable EoTp by default (2024-08-01 13:34:18 +0200)
> 
> ----------------------------------------------------------------
> drm-misc-next for v6.12:
> 
> UAPI Changes:
> 
> virtio:
> - Define DRM capset
> 
> Cross-subsystem Changes:
> 
> dma-buf:
> - heaps: Clean up documentation
> 
> printk:
> - Pass description to kmsg_dump()
> 
> Core Changes:
> 
> CI:
> - Update IGT tests
> - Point upstream repo to GitLab instance
> 
> modesetting:
> - Introduce Power Saving Policy property for connectors
> - Add might_fault() to drm_modeset_lock priming
> - Add dynamic per-crtc vblank configuration support
> 
> panic:
> - Avoid build-time interference with framebuffer console
> 
> docs:
> - Document Colorspace property
> 
> scheduler:
> - Remove full_recover from drm_sched_start
> 
> TTM:
> - Make LRU walk restartable after dropping locks
> - Allow direct reclaim to allocate local memory
> 
> Driver Changes:
> 
> amdgpu:
> - Support Power Saving Policy connector property
> 
> ast:
> - astdp: Support AST2600 with VGA; Clean up HPD
> 
> bridge:
> - Silence error message on -EPROBE_DEFER
> - analogix: Clean aup
> - bridge-connector: Fix double free
> - lt6505: Disable interrupt when powered off
> - tc358767: Make default DP port preemphasis configurable
> 
> gma500:
> - Update i2c terminology
> 
> ivpu:
> - Add MODULE_FIRMWARE()
> 
> lcdif:
> - Fix pixel clock
> 
> loongson:
> - Use GEM refcount over TTM's
> 
> mgag200:
> - Improve BMC handling
> - Support VBLANK intterupts
> 
> nouveau:
> - Refactor and clean up internals
> - Use GEM refcount over TTM's
> 
> panel:
> - Shutdown fixes plus documentation
> - Refactor several drivers for better code sharing
> - boe-th101mb31ig002: Support for starry-er88577 MIPI-DSI panel plus
>   DT; Fix porch parameter
> - edp: Support AOU B116XTN02.3, AUO B116XAN06.1, AOU B116XAT04.1,
>   BOE NV140WUM-N41, BOE NV133WUM-N63, BOE NV116WHM-A4D, CMN N116BCA-EA2,
>   CMN N116BCP-EA2, CSW MNB601LS1-4
> - himax-hx8394: Support Microchip AC40T08A MIPI Display panel plus DT
> - ilitek-ili9806e: Support Densitron DMT028VGHMCMI-1D TFT plus DT
> - jd9365da: Support Melfas lmfbx101117480 MIPI-DSI panel plus DT; Refactor
>   for code sharing
> 
> sti:
> - Fix module owner
> 
> stm:
> - Avoid UAF wih managed plane and CRTC helpers
> - Fix module owner
> - Fix error handling in probe
> - Depend on COMMON_CLK
> - ltdc: Fix transparency after disabling plane; Remove unused interrupt
> 
> tegra:
> - Call drm_atomic_helper_shutdown()
> 
> v3d:
> - Clean up perfmon
> 
> vkms:
> - Clean up
> 
> ----------------------------------------------------------------
> Alexander F. Lent (1):
>       accel/ivpu: Add missing MODULE_FIRMWARE metadata
> 
> Alexander Stein (1):
>       drm/bridge: Silence error messages upon probe deferral
> 
> Arnd Bergmann (1):
>       drm/stm: add COMMON_CLK dependency
> 
> Ben Skeggs (37):
>       drm/nouveau: move nouveau_drm_device_fini() above init()
>       drm/nouveau: handle pci/tegra drm_dev_{alloc, register} from common code
>       drm/nouveau: replace drm_device* with nouveau_drm* as dev drvdata
>       drm/nouveau: create pci device once
>       drm/nouveau: store nvkm_device pointer in nouveau_drm
>       drm/nouveau: move allocation of root client out of nouveau_cli_init()
>       drm/nouveau: add nouveau_cli to nouveau_abi16
>       drm/nouveau: handle limited nvif ioctl in abi16
>       drm/nouveau: remove abi16->device
>       drm/nouveau: remove abi16->handles
>       drm/nouveau/nvkm: remove detect/mmio/subdev_mask from device args
>       drm/nouveau/nvkm: remove perfmon
>       drm/nouveau/nvkm: remove nvkm_client_search()
>       drm/nouveau/nvif: remove support for userspace backends
>       drm/nouveau/nvif: remove route/token
>       drm/nouveau/nvif: remove nvxx_object()
>       drm/nouveau/nvif: remove nvxx_client()
>       drm/nouveau/nvif: remove driver keep/fini
>       drm/nouveau/nvif: remove client device arg
>       drm/nouveau/nvif: remove client version
>       drm/nouveau/nvif: remove client devlist
>       drm/nouveau/nvif: remove client fini
>       drm/nouveau/nvif: remove device args
>       drm/nouveau: always map device
>       drm/nouveau/nvif: remove device rd/wr
>       drm/nouveau/nvif: remove disp chan rd/wr
>       drm/nouveau: move nvxx_* definitions to nouveau_drv.h
>       drm/nouveau: add nvif_mmu to nouveau_drm
>       drm/nouveau: pass drm to nouveau_mem_new(), instead of cli
>       drm/nouveau: pass drm to nv50_dmac_create(), rather than device+disp
>       drm/nouveau: pass cli to nouveau_channel_new() instead of drm+device
>       drm/nouveau: remove nouveau_chan.device
>       drm/nouveau: remove chan->drm
>       drm/nouveau: remove master
>       drm/nouveau: remove push pointer from nouveau_channel
>       drm/nouveau/kms: remove a few unused struct members and fn decls
>       drm/nouveau/kms: remove push pointer from nv50_dmac
> 
> Christian König (2):
>       drm/scheduler: remove full_recover from drm_sched_start
>       drm/loongson: use GEM references instead of TTMs
> 
> Christoph Fritz (1):
>       drm/bridge: synopsys: dw-mipi-dsi: enable EoTp by default
> 
> Christophe JAILLET (1):
>       drm/stm: Fix an error handling path in stm_drm_platform_probe()
> 
> Claudiu Beznea (1):
>       drm/stm: ltdc: check memory returned by devm_kzalloc()
> 
> Clayton Craft (1):
>       drm/panel-edp: Add entry for BOE NV133WUM-N63 panel
> 
> Cong Yang (6):
>       dt-bindings: display: panel: Add compatible for melfas lmfbx101117480
>       drm/panel: jd9365da: Support for Melfas lmfbx101117480 MIPI-DSI panel
>       drm/panel: jd9365da: Break some CMDS into helper functions
>       drm/panel: boe-tv101wum-nl6: Break some CMDS into helper functions
>       drm/panel: nt35521: Break some CMDS into helper functions
>       drm/panel: nt36672e: Break some CMDS into helper functions
> 
> Cristian Ciocaltea (1):
>       drm/bridge-connector: Fix double free in error handling paths
> 
> Dang Huynh (1):
>       drm: panel: boe-bf060y8m-aj0: Enable prepare_prev_first
> 
> Daniel Vetter (1):
>       drm: Add might_fault to drm_modeset_lock priming
> 
> Danilo Krummrich (3):
>       drm/nouveau: prime: fix refcount underflow
>       drm/nouveau: bo: remove unused functions
>       drm/nouveau: use GEM references instead of TTMs
> 
> Deborah Brouwer (1):
>       drm/ci: update link to Gitlab server
> 
> Dmitry Osipenko (1):
>       drm/virtio: Add DRM capset definition
> 
> Douglas Anderson (2):
>       drm/tegra: Call drm_atomic_helper_shutdown() at shutdown time
>       drm/panel: Avoid warnings w/ panel-simple/panel-edp at shutdown
> 
> Dr. David Alan Gilbert (1):
>       drm/bridge: analogix: remove unused struct 'bridge_init'
> 
> Easwar Hariharan (1):
>       drm/gma500: Make I2C terminology more inclusive
> 
> Haikun Zhou (1):
>       drm/panel-edp: Add CSW MNB601LS1-4
> 
> Hamza Mahfooz (2):
>       MAINTAINERS: add an entry for AMD DC DML
>       drm/vblank: add dynamic per-crtc vblank configuration support
> 
> Hsin-Yi Wang (1):
>       drm/panel-edp: Add BOE NV140WUM-N41
> 
> Imre Deak (1):
>       drm/dp: Add helper to dump an LTTPR PHY descriptor
> 
> Jani Nikula (1):
>       drm/nouveau: remove unused variable ret
> 
> Jiapeng Chong (2):
>       drm/stm: Remove unnecessary .owner for lvds_platform_driver
>       drm/stm: ltdc: Remove unused function plane_to_ltdc
> 
> Jocelyn Falempe (8):
>       printk: Add a short description string to kmsg_dump()
>       drm/panic: Add drm_panic_is_enabled()
>       fbcon: Add an option to disable fbcon in panic
>       drm/fb-helper: Set skip_panic if the drm driver supports drm panic
>       drm/panic: Remove build time dependency with FRAMEBUFFER_CONSOLE
>       drm/panic: Add missing static inline to drm_panic_is_enabled()
>       fbcon: Use oops_in_progress instead of panic_cpu
>       mtd: mtdoops: Fix kmsgdump parameter renaming.
> 
> Katya Orlova (1):
>       drm/stm: Avoid use-after-free issues with crtc and plane
> 
> Krzysztof Kozlowski (6):
>       drm/sti: dvo: drop driver owner assignment
>       drm/sti: hda: drop driver owner assignment
>       drm/sti: tvout: drop driver owner assignment
>       drm/sti: vtg: drop driver owner assignment
>       drm/sti: hdmi: drop driver owner assignment
>       drm/sti: hqvdp: drop driver owner assignment
> 
> Lyude Paul (1):
>       drm/vkms: Remove event from vkms_output
> 
> Manikandan Muralidharan (3):
>       dt-bindings: display: himax-hx8394: Add Microchip AC40T08A MIPI Display panel
>       drm/panel: himax-hx8394: switch to devm_gpiod_get_optional() for reset_gpio
>       drm/panel: himax-hx8394: Add Support for Microchip AC40T08A MIPI Display Panel
> 
> Marco Pagani (1):
>       drm/test: use kunit action wrapper macro in the gem shmem test suite
> 
> Marek Vasut (5):
>       drm: lcdif: Use adjusted_mode .clock instead of .crtc_clock
>       dt-bindings: display: bridge: tc358867: Document default DP preemphasis
>       drm/bridge: tc358767: Add configurable default preemphasis
>       dt-bindings: display: panel: Document Densitron DMT028VGHMCMI-1D TFT on ILI9806E DSI TCON
>       drm/panel/panel-ilitek-ili9806e: Add Densitron DMT028VGHMCMI-1D TFT to ILI9806E DSI TCON driver
> 
> Mario Limonciello (2):
>       drm: Introduce 'power saving policy' drm property
>       drm/amd: Add power_saving_policy drm property to eDP connectors
> 
> Markus Elfring (1):
>       drm/dp_mst: Simplify character output in drm_dp_mst_dump_topology()
> 
> Maíra Canal (1):
>       drm/v3d: Expose memory stats through fdinfo
> 
> Mitul Golani (1):
>       drm/dp: Describe target_rr_divider in struct drm_dp_as_sdp
> 
> Philipp Stanner (1):
>       drm/nouveau: Improve variable name in nouveau_sched_init()
> 
> Pin-yen Lin (1):
>       drm/bridge: it6505: Disable IRQ when powered off
> 
> Rajneesh Bhardwaj (1):
>       drm/ttm: Allow direct reclaim to allocate local memory v2
> 
> Sebastian Wick (1):
>       drm/drm_connector: Document Colorspace property variants
> 
> Shixiong Ou (1):
>       drm: Add the missing symbol '.'
> 
> T.J. Mercier (1):
>       dma-buf: heaps: Deduplicate docs and adopt common format
> 
> Terry Hsiao (1):
>       drm/panel-edp: Add 6 panels used by MT8186 Chromebooks
> 
> Thomas Hellström (7):
>       drm/ttm: Allow TTM LRU list nodes of different types
>       drm/ttm: Slightly clean up LRU list iteration
>       drm/ttm: Use LRU hitches
>       drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist moves
>       drm/ttm: Provide a generic LRU walker helper
>       drm/ttm: Use the LRU walker helper for swapping
>       drm/ttm: Use the LRU walker for eviction
> 
> Thomas Zimmermann (16):
>       drm/mgag200: Only set VIDRST bits in CRTC modesetting
>       drm/mgag200: Remove vidrst callbacks from struct mgag200_device_funcs
>       drm/mgag200: Rename BMC vidrst names
>       drm/mgag200: Use hexadecimal register indeces
>       drm/mgag200: Align register field names with documentation
>       drm/mgag200: Use adjusted mode values for CRTCs
>       drm/mgag200: Add dedicated variables for blanking fields
>       drm/mgag200: Add dedicted variable for <linecomp> field
>       drm/mgag200: Add vblank support
>       drm/mgag200: Implement struct drm_crtc_funcs.get_vblank_timestamp
>       Merge drm/drm-next into drm-misc-next
>       drm/ast: astdp: Test firmware status once during probing
>       drm/ast: astdp: Only test HDP state in ast_astdp_is_connected()
>       drm/ast: astdp: Perform link training during atomic_enable
>       drm/ast: astdp: Clean up EDID reading
>       drm/mgag200: Fix VBLANK interrupt handling
> 
> Tvrtko Ursulin (11):
>       drm/v3d: Prevent out of bounds access in performance query extensions
>       drm/v3d: Fix potential memory leak in the timestamp extension
>       drm/v3d: Fix potential memory leak in the performance extension
>       drm/v3d: Validate passed in drm syncobj handles in the timestamp extension
>       drm/v3d: Validate passed in drm syncobj handles in the performance extension
>       drm/v3d: Move part of copying of reset/copy performance extension to a helper
>       drm/v3d: Size the kperfmon_ids array at runtime
>       drm/v3d: Do not use intermediate storage when copying performance query results
>       drm/v3d: Move perfmon init completely into own unit
>       drm/v3d: Prefer get_user for scalar types
>       drm/v3d: Add some local variables in queries/extensions
> 
> Vignesh Raman (1):
>       drm/ci: uprev IGT
> 
> Yannick Fertre (3):
>       drm/stm: ltdc: reset plane transparency after plane disable
>       drm/stm: ltdc: add mask for lxcr register
>       drm/stm: ltdc: remove reload interrupt
> 
> Zenghui Yu (2):
>       accel/qaic: Remove the description of DRM_IOCTL_QAIC_PART_DEV
>       MAINTAINERS: Add selftests to DMA-BUF HEAPS FRAMEWORK entry
> 
> Zhaoxiong Lv (7):
>       drm/panel: boe-th101mb31ig002 : Make it compatible with other panel.
>       drm/panel: boe-th101mb31ig002: switch to devm_gpiod_get_optional() for reset_gpio
>       drm/panel: boe-th101mb31ig002: use wrapped MIPI DCS functions
>       dt-bindings: display: panel: Add compatible for starry-er88577
>       drm/panel: boe-th101mb31ig002: Support for starry-er88577 MIPI-DSI panel
>       drm/panel: boe-th101mb31ig002 : Fix the way to get porch parameters
>       drm/panel: boe-th101mb31ig002 : using drm_connector_helper_get_modes_fixed()
> 
>  Documentation/accel/qaic/qaic.rst                  |   6 -
>  .../bindings/display/bridge/toshiba,tc358767.yaml  |  21 +-
>  .../display/panel/boe,th101mb31ig002-28a.yaml      |  21 +-
>  .../bindings/display/panel/himax,hx8394.yaml       |  17 +-
>  .../bindings/display/panel/ilitek,ili9806e.yaml    |   1 +
>  .../bindings/display/panel/jadard,jd9365da-h3.yaml |   1 +
>  Documentation/gpu/todo.rst                         |  35 +-
>  MAINTAINERS                                        |   8 +
>  arch/powerpc/kernel/nvram_64.c                     |   8 +-
>  arch/powerpc/platforms/powernv/opal-kmsg.c         |   4 +-
>  arch/um/kernel/kmsg_dump.c                         |   2 +-
>  drivers/accel/ivpu/ivpu_fw.c                       |   4 +
>  drivers/dma-buf/dma-heap.c                         |  27 +-
>  drivers/gpu/drm/Kconfig                            |   2 +-
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |   4 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   4 +
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  52 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   2 +
>  drivers/gpu/drm/ast/ast_dp.c                       | 179 ++---
>  drivers/gpu/drm/ast/ast_drv.h                      |   3 +-
>  drivers/gpu/drm/ast/ast_main.c                     |   6 +-
>  drivers/gpu/drm/ast/ast_mode.c                     |   2 +
>  drivers/gpu/drm/ast/ast_post.c                     |   2 +-
>  drivers/gpu/drm/ast/ast_reg.h                      |  22 +-
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   5 -
>  drivers/gpu/drm/bridge/ite-it6505.c                |  17 +-
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |   7 +-
>  drivers/gpu/drm/bridge/tc358767.c                  |  45 +-
>  drivers/gpu/drm/ci/gitlab-ci.yml                   |   4 +-
>  drivers/gpu/drm/ci/igt_runner.sh                   |   1 +
>  drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt  |   1 +
>  drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt |  14 +-
>  drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt  |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt      |  12 +-
>  drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt     |  41 +-
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt      |   5 +-
>  drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt      |   2 +-
>  drivers/gpu/drm/ci/xfails/i915-apl-skips.txt       |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt       |  14 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt      |   9 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-skips.txt       |   5 +-
>  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt       |  24 +-
>  drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt      |   8 +-
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt       |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt       |   2 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt      |   2 +-
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt       |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt       |  25 +-
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt       |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt       |  17 +-
>  drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt      |   2 +-
>  drivers/gpu/drm/ci/xfails/i915-whl-skips.txt       |   5 +-
>  .../gpu/drm/ci/xfails/mediatek-mt8173-fails.txt    |   9 +-
>  .../gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt   |  32 +-
>  .../gpu/drm/ci/xfails/mediatek-mt8173-skips.txt    |   4 +-
>  .../gpu/drm/ci/xfails/mediatek-mt8183-fails.txt    |   2 +-
>  .../gpu/drm/ci/xfails/mediatek-mt8183-skips.txt    |   2 +-
>  drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt     |   2 +-
>  drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt     |   2 +-
>  drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt    |   5 +-
>  drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt    |   2 +-
>  drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt   |   2 +-
>  drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt    |   4 +-
>  .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt | 145 ----
>  .../msm-sc7180-trogdor-kingoftown-flakes.txt       |  18 +-
>  .../xfails/msm-sc7180-trogdor-kingoftown-skips.txt |   5 +-
>  .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    | 145 ----
>  .../msm-sc7180-trogdor-lazor-limozeen-flakes.txt   |  11 +-
>  .../msm-sc7180-trogdor-lazor-limozeen-skips.txt    |   2 +-
>  drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt    | 105 ++-
>  drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt     |   4 +-
>  .../gpu/drm/ci/xfails/rockchip-rk3288-fails.txt    |   2 +-
>  .../gpu/drm/ci/xfails/rockchip-rk3288-skips.txt    |   2 +-
>  .../gpu/drm/ci/xfails/rockchip-rk3399-fails.txt    |   2 +-
>  .../gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt   |   4 +-
>  .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt    |   2 +-
>  .../gpu/drm/ci/xfails/virtio_gpu-none-fails.txt    |  64 ++
>  .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt    |   4 +-
>  drivers/gpu/drm/ci/xfails/vkms-none-fails.txt      |   4 -
>  drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt     |  21 +
>  drivers/gpu/drm/ci/xfails/vkms-none-skips.txt      | 105 ++-
>  drivers/gpu/drm/display/drm_dp_helper.c            |  66 +-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c      |   2 +-
>  drivers/gpu/drm/drm_bridge.c                       |   9 +-
>  drivers/gpu/drm/drm_bridge_connector.c             |   8 +-
>  drivers/gpu/drm/drm_connector.c                    | 127 ++-
>  drivers/gpu/drm/drm_crtc_internal.h                |   7 +
>  drivers/gpu/drm/drm_fb_helper.c                    |   2 +
>  drivers/gpu/drm/drm_mode_config.c                  |   2 +
>  drivers/gpu/drm/drm_panel.c                        |  18 +
>  drivers/gpu/drm/drm_panic.c                        |  26 +-
>  drivers/gpu/drm/drm_probe_helper.c                 |   2 +-
>  drivers/gpu/drm/drm_vblank.c                       |  81 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c            |   2 +-
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c            |   2 +-
>  drivers/gpu/drm/gma500/intel_bios.c                |  22 +-
>  drivers/gpu/drm/gma500/intel_bios.h                |   4 +-
>  drivers/gpu/drm/gma500/intel_gmbus.c               |   2 +-
>  drivers/gpu/drm/gma500/psb_drv.h                   |   2 +-
>  drivers/gpu/drm/gma500/psb_intel_drv.h             |   2 +-
>  drivers/gpu/drm/gma500/psb_intel_lvds.c            |   4 +-
>  drivers/gpu/drm/gma500/psb_intel_sdvo.c            |  26 +-
>  drivers/gpu/drm/imagination/pvr_queue.c            |   4 +-
>  drivers/gpu/drm/lima/lima_sched.c                  |   2 +-
>  drivers/gpu/drm/loongson/lsdc_ttm.c                |   8 +-
>  drivers/gpu/drm/mgag200/mgag200_bmc.c              |   9 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.c              |  40 +
>  drivers/gpu/drm/mgag200/mgag200_drv.h              |  45 +-
>  drivers/gpu/drm/mgag200/mgag200_g200.c             |   5 +
>  drivers/gpu/drm/mgag200/mgag200_g200eh.c           |   5 +
>  drivers/gpu/drm/mgag200/mgag200_g200eh3.c          |   5 +
>  drivers/gpu/drm/mgag200/mgag200_g200er.c           |  19 +-
>  drivers/gpu/drm/mgag200/mgag200_g200ev.c           |  19 +-
>  drivers/gpu/drm/mgag200/mgag200_g200ew3.c          |   7 +-
>  drivers/gpu/drm/mgag200/mgag200_g200se.c           |  19 +-
>  drivers/gpu/drm/mgag200/mgag200_g200wb.c           |   7 +-
>  drivers/gpu/drm/mgag200/mgag200_mode.c             | 192 +++--
>  drivers/gpu/drm/mgag200/mgag200_reg.h              |   7 +
>  drivers/gpu/drm/mxsfb/lcdif_kms.c                  |   5 +-
>  drivers/gpu/drm/nouveau/Kbuild                     |   1 -
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c            |  57 +-
>  drivers/gpu/drm/nouveau/dispnv04/dac.c             |   2 +-
>  drivers/gpu/drm/nouveau/dispnv04/dfp.c             |   2 +-
>  drivers/gpu/drm/nouveau/dispnv04/disp.c            |   7 +-
>  drivers/gpu/drm/nouveau/dispnv04/disp.h            |   2 +-
>  drivers/gpu/drm/nouveau/dispnv04/hw.c              |   9 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |   4 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |   6 +-
>  drivers/gpu/drm/nouveau/dispnv50/base507c.c        |  21 +-
>  drivers/gpu/drm/nouveau/dispnv50/base827c.c        |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/base907c.c        |  10 +-
>  drivers/gpu/drm/nouveau/dispnv50/core507d.c        |   8 +-
>  drivers/gpu/drm/nouveau/dispnv50/corec37d.c        |   6 +-
>  drivers/gpu/drm/nouveau/dispnv50/corec57d.c        |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/crc907d.c         |   4 +-
>  drivers/gpu/drm/nouveau/dispnv50/crcc37d.c         |   4 +-
>  drivers/gpu/drm/nouveau/dispnv50/crcc57d.c         |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/dac507d.c         |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/dac907d.c         |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c            |  78 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.h            |  14 +-
>  drivers/gpu/drm/nouveau/dispnv50/head507d.c        |  24 +-
>  drivers/gpu/drm/nouveau/dispnv50/head827d.c        |  10 +-
>  drivers/gpu/drm/nouveau/dispnv50/head907d.c        |  26 +-
>  drivers/gpu/drm/nouveau/dispnv50/head917d.c        |   6 +-
>  drivers/gpu/drm/nouveau/dispnv50/headc37d.c        |  18 +-
>  drivers/gpu/drm/nouveau/dispnv50/headc57d.c        |  12 +-
>  drivers/gpu/drm/nouveau/dispnv50/ovly507e.c        |   6 +-
>  drivers/gpu/drm/nouveau/dispnv50/ovly827e.c        |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/ovly907e.c        |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/pior507d.c        |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/sor507d.c         |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/sor907d.c         |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/sorc37d.c         |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c        |   7 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c        |  24 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c        |  10 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c        |   2 +-
>  drivers/gpu/drm/nouveau/include/nvif/cl0080.h      |   7 -
>  drivers/gpu/drm/nouveau/include/nvif/class.h       |   3 -
>  drivers/gpu/drm/nouveau/include/nvif/client.h      |  11 +-
>  drivers/gpu/drm/nouveau/include/nvif/device.h      |  37 +-
>  drivers/gpu/drm/nouveau/include/nvif/driver.h      |   5 -
>  drivers/gpu/drm/nouveau/include/nvif/if0000.h      |  10 -
>  drivers/gpu/drm/nouveau/include/nvif/if0002.h      |  39 -
>  drivers/gpu/drm/nouveau/include/nvif/if0003.h      |  34 -
>  drivers/gpu/drm/nouveau/include/nvif/ioctl.h       |  27 -
>  drivers/gpu/drm/nouveau/include/nvif/object.h      |  24 +-
>  drivers/gpu/drm/nouveau/include/nvif/os.h          |  19 +
>  drivers/gpu/drm/nouveau/include/nvkm/core/client.h |   1 -
>  drivers/gpu/drm/nouveau/include/nvkm/core/device.h |   1 -
>  drivers/gpu/drm/nouveau/include/nvkm/core/layout.h |   1 -
>  drivers/gpu/drm/nouveau/include/nvkm/core/object.h |  14 -
>  drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h |   2 -
>  drivers/gpu/drm/nouveau/include/nvkm/core/os.h     |  19 -
>  drivers/gpu/drm/nouveau/include/nvkm/core/pci.h    |   1 -
>  drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  |   1 -
>  drivers/gpu/drm/nouveau/include/nvkm/engine/pm.h   |  29 -
>  drivers/gpu/drm/nouveau/nouveau_abi16.c            | 330 ++++++--
>  drivers/gpu/drm/nouveau/nouveau_abi16.h            |   6 +-
>  drivers/gpu/drm/nouveau/nouveau_bios.c             |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_bios.h             |   1 +
>  drivers/gpu/drm/nouveau/nouveau_bo.c               |  10 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.h               |  50 +-
>  drivers/gpu/drm/nouveau/nouveau_bo0039.c           |   6 +-
>  drivers/gpu/drm/nouveau/nouveau_bo5039.c           |   6 +-
>  drivers/gpu/drm/nouveau/nouveau_bo74c1.c           |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo85b5.c           |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo9039.c           |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_bo90b5.c           |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_boa0b5.c           |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_chan.c             |  98 ++-
>  drivers/gpu/drm/nouveau/nouveau_chan.h             |   8 +-
>  drivers/gpu/drm/nouveau/nouveau_display.c          |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_display.h          |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_dma.c              |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_dmem.c             |   8 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c              | 387 ++++-----
>  drivers/gpu/drm/nouveau/nouveau_drv.h              |  61 +-
>  drivers/gpu/drm/nouveau/nouveau_fence.c            |  17 +-
>  drivers/gpu/drm/nouveau/nouveau_gem.c              |  21 +-
>  drivers/gpu/drm/nouveau/nouveau_hwmon.c            |  46 +-
>  drivers/gpu/drm/nouveau/nouveau_led.c              |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_mem.c              |  38 +-
>  drivers/gpu/drm/nouveau/nouveau_mem.h              |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_nvif.c             |   2 -
>  drivers/gpu/drm/nouveau/nouveau_platform.c         |  12 +-
>  drivers/gpu/drm/nouveau/nouveau_prime.c            |   3 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c            |   6 +-
>  drivers/gpu/drm/nouveau/nouveau_sgdma.c            |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_ttm.c              |  12 +-
>  drivers/gpu/drm/nouveau/nouveau_usif.c             | 194 -----
>  drivers/gpu/drm/nouveau/nouveau_usif.h             |  10 -
>  drivers/gpu/drm/nouveau/nouveau_vga.c              |  14 +-
>  drivers/gpu/drm/nouveau/nv04_fence.c               |   2 +-
>  drivers/gpu/drm/nouveau/nv10_fence.c               |   4 +-
>  drivers/gpu/drm/nouveau/nv17_fence.c               |  12 +-
>  drivers/gpu/drm/nouveau/nv50_fence.c               |   4 +-
>  drivers/gpu/drm/nouveau/nv84_fence.c               |  16 +-
>  drivers/gpu/drm/nouveau/nvc0_fence.c               |   4 +-
>  drivers/gpu/drm/nouveau/nvif/client.c              |  32 +-
>  drivers/gpu/drm/nouveau/nvif/device.c              |  15 +-
>  drivers/gpu/drm/nouveau/nvif/driver.c              |  32 +-
>  drivers/gpu/drm/nouveau/nvif/object.c              |  40 -
>  drivers/gpu/drm/nouveau/nvkm/core/client.c         |  64 +-
>  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c          |  91 +--
>  drivers/gpu/drm/nouveau/nvkm/core/object.c         |  50 --
>  drivers/gpu/drm/nouveau/nvkm/core/oproxy.c         |  42 -
>  drivers/gpu/drm/nouveau/nvkm/core/uevent.c         |   4 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/Kbuild         |   1 -
>  drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  | 479 +++++-------
>  drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c   |   4 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h  |   2 -
>  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |   5 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/device/user.c  |  93 +--
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c    |  24 -
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild      |  11 -
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c      | 867 ---------------------
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c       | 165 ----
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.c     | 243 ------
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.h     |  20 -
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.c     |  66 --
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/gf117.c     |  80 --
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/gk104.c     | 184 -----
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/gt200.c     | 157 ----
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/gt215.c     | 138 ----
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c      | 123 ---
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h      |  15 -
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c      | 175 -----
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h      | 105 ---
>  drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c     |   2 +
>  .../gpu/drm/panel/panel-boe-th101mb31ig002-28a.c   | 325 +++++---
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c     | 190 ++---
>  drivers/gpu/drm/panel/panel-edp.c                  |  35 +-
>  drivers/gpu/drm/panel/panel-himax-hx8394.c         | 153 +++-
>  drivers/gpu/drm/panel/panel-ilitek-ili9806e.c      | 165 ++++
>  drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c   | 317 +++++++-
>  drivers/gpu/drm/panel/panel-novatek-nt36672e.c     |  69 +-
>  drivers/gpu/drm/panel/panel-simple.c               |  26 +-
>  .../gpu/drm/panel/panel-sony-tulip-truly-nt35521.c |  29 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c            |   2 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c              |   2 +-
>  drivers/gpu/drm/panthor/panthor_sched.c            |   2 +-
>  drivers/gpu/drm/scheduler/sched_main.c             |  25 +-
>  drivers/gpu/drm/sti/sti_dvo.c                      |   1 -
>  drivers/gpu/drm/sti/sti_hda.c                      |   1 -
>  drivers/gpu/drm/sti/sti_hdmi.c                     |   1 -
>  drivers/gpu/drm/sti/sti_hqvdp.c                    |   1 -
>  drivers/gpu/drm/sti/sti_tvout.c                    |   1 -
>  drivers/gpu/drm/sti/sti_vtg.c                      |   1 -
>  drivers/gpu/drm/stm/Kconfig                        |   1 +
>  drivers/gpu/drm/stm/drv.c                          |   7 +-
>  drivers/gpu/drm/stm/ltdc.c                         | 107 +--
>  drivers/gpu/drm/stm/lvds.c                         |   1 -
>  drivers/gpu/drm/tegra/drm.c                        |   6 +
>  drivers/gpu/drm/tests/drm_gem_shmem_test.c         |  27 +-
>  drivers/gpu/drm/ttm/tests/ttm_bo_test.c            |   6 +-
>  drivers/gpu/drm/ttm/tests/ttm_resource_test.c      |   2 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                       | 460 +++++------
>  drivers/gpu/drm/ttm/ttm_bo_util.c                  | 151 ++++
>  drivers/gpu/drm/ttm/ttm_device.c                   |  29 +-
>  drivers/gpu/drm/ttm/ttm_pool.c                     |   2 +-
>  drivers/gpu/drm/ttm/ttm_resource.c                 | 251 ++++--
>  drivers/gpu/drm/v3d/v3d_bo.c                       |  12 +
>  drivers/gpu/drm/v3d/v3d_drv.c                      |  11 +-
>  drivers/gpu/drm/v3d/v3d_drv.h                      |  16 +-
>  drivers/gpu/drm/v3d/v3d_perfmon.c                  |  40 +-
>  drivers/gpu/drm/v3d/v3d_performance_counters.h     |  16 +-
>  drivers/gpu/drm/v3d/v3d_sched.c                    | 105 ++-
>  drivers/gpu/drm/v3d/v3d_submit.c                   | 292 ++++---
>  drivers/gpu/drm/vkms/vkms_drv.h                    |   1 -
>  drivers/gpu/drm/xe/xe_vm.c                         |   4 +
>  drivers/hv/hv_common.c                             |   4 +-
>  drivers/mtd/mtdoops.c                              |   6 +-
>  drivers/video/fbdev/core/fbcon.c                   |  16 +-
>  fs/pstore/platform.c                               |  10 +-
>  include/drm/display/drm_dp.h                       |   4 +
>  include/drm/display/drm_dp_helper.h                |   3 +
>  include/drm/drm_connector.h                        |  10 +-
>  include/drm/drm_device.h                           |   5 +-
>  include/drm/drm_mode_config.h                      |   5 +
>  include/drm/drm_vblank.h                           |  37 +-
>  include/drm/gpu_scheduler.h                        |   2 +-
>  include/drm/ttm/ttm_bo.h                           |  48 +-
>  include/drm/ttm/ttm_resource.h                     |  97 ++-
>  include/linux/dma-heap.h                           |  21 +-
>  include/linux/fb.h                                 |   1 +
>  include/linux/kmsg_dump.h                          |  22 +-
>  include/uapi/drm/drm_mode.h                        |   7 +
>  include/uapi/linux/virtio_gpu.h                    |   1 +
>  kernel/panic.c                                     |   2 +-
>  kernel/printk/printk.c                             |  11 +-
>  314 files changed, 4787 insertions(+), 6107 deletions(-)
>  delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0002.h
>  delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0003.h
>  delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/pm.h
>  delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.h
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.h
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf117.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gk104.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt200.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt215.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
