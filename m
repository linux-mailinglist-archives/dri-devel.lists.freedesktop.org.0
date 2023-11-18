Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C26D7F0039
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 16:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC7B10E0A1;
	Sat, 18 Nov 2023 15:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com
 [91.218.175.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EB510E0A1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 15:06:19 +0000 (UTC)
Message-ID: <86a8affd-d20e-49c2-938f-76dcec8eae46@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1700319976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0UXsDke3x1X00Mgt8xJbKXRug7CCJ3MJFS3Y3oJANr4=;
 b=E0NhVUOayH/fKL9gkKWuuEkB5tpCNWKrdynb/PRNsO5D8LJjtEmgZxZM9iKif12oIEH8Wa
 jDOQ1vSO1k9SYc80GY+JXLWqDH6HQe5dU4JPs8Eg1NEU6Ih3mm2oINBtm62RmdZSWzl342
 QwPNWlsTpe9gyw0TQtbBMSBsskb+YqE=
Date: Sat, 18 Nov 2023 23:06:07 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/10] drm/ast: Detect device type before init
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, airlied@gmail.com
References: <20231116100240.22975-1-tzimmermann@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231116100240.22975-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/11/16 17:59, Thomas Zimmermann wrote:
> Detecting the ast device's chipset type and configuration mode
> involves several registers, DT properties and possibly POSTing
> parts of the chip. It is preferable to do this before initializing
> the DRM driver, so that that each chip type can have an individual
> setup code.
>
> The patchset addresses the problem by moving all early detection
> code before the allocation of the ast device.
>
> Patch one gets a lock out of the way. The lock is only relevant
> for mode setting. Move it there.
>
> Patches 2 and 3 rework the detection of the correct I/O memory
> ranges. It is now self-contained, more readable and works without
> an instance of struct ast_device.
>
> Patches 4 to 7 rework the setup of various registers that are
> required for detection. Access helpers for I/O can now operate
> without an instance of struct ast_device. The setup functions
> operate on the I/O ranges that have been made available with
> patch 3, but again without struct ast_device.
>
> With the detection's internals done, patches 8 and 9 rework the
> chip's and config-mode's detection code to operate without struct
> ast_device as well.
>
> Finally, patch 10 moves the detection code into the PCI probe
> function. it runs before any of the DRM device code. The function
> for creating an ast device, ast_device_create(), receives the
> detected I/O memory ranges, chip type and configuration mode.
>
> This cleans up the detection code. There is more chip-specific
> code in other parts of the driver. In a later patch, the ast device
> setup can be split up so that each chip type gets its own code
> path that does not interfere with other chips.
>
> Tested on AST1100 and AST2100.


Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>


Still works, The whole series is tested with AST2400 hardware on X86-64.


$ sudo dmesg | grep "03:00.0"

ast 0000:03:00.0: Using P2A bridge for configuration
ast 0000:03:00.0: AST 2400 detected
ast 0000:03:00.0: [drm] Using analog VGA
ast 0000:03:00.0: [drm] dram MCLK=396 Mhz type=6 bus_width=16
[drm] Initialized ast 0.1.0 20120228 for 0000:03:00.0 on minor 0
ast 0000:03:00.0: [drm] fb0: astdrmfb frame buffer device


> v2:
> 	* add missing break statements (Jocelyn)
> 	* fix length test for I/O range
>
> Thomas Zimmermann (10):
>    drm/ast: Turn ioregs_lock to modeset_lock
>    drm/ast: Rework I/O register setup
>    drm/ast: Retrieve I/O-memory ranges without ast device
>    drm/ast: Add I/O helpers without ast device
>    drm/ast: Enable VGA without ast device instance
>    drm/ast: Enable MMIO without ast device instance
>    drm/ast: Partially implement POST without ast device instance
>    drm/ast: Add enum ast_config_mode
>    drm/ast: Detect ast device type and config mode without ast device
>    drm/ast: Move detection code into PCI probe helper
>
>   drivers/gpu/drm/ast/ast_drv.c  | 263 ++++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/ast/ast_drv.h  | 101 +++++++++----
>   drivers/gpu/drm/ast/ast_main.c | 244 ++----------------------------
>   drivers/gpu/drm/ast/ast_mode.c |  26 ++--
>   drivers/gpu/drm/ast/ast_post.c |  73 +++++----
>   drivers/gpu/drm/ast/ast_reg.h  |  12 +-
>   6 files changed, 413 insertions(+), 306 deletions(-)
>
>
> base-commit: b7816c393496dc4497c1327310821407f7171d8b
> prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: cbc453ee02fae02af22fbfdce56ab732c7a88c36
