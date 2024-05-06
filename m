Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4A38BD09C
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 16:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D845D10F7D5;
	Mon,  6 May 2024 14:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="YE6SFn7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F78210F7D5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 14:46:26 +0000 (UTC)
Message-ID: <a4d54d86-fca7-43e4-b139-6cad2426c5e0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715006783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zgdfu0UqfPIrOvvxvuY2eXYRnnipZdNpDyN49yNfAe4=;
 b=YE6SFn7tj97R9aOFYJj1eR+nKlODIbGgWRrNK6Pmk67ECQo+DGhs/8n5PWQYHcaKdghXm0
 Udg5hIXOaoSIu99Lbz3fp9exDRoti2LMepKtMaCP2tQ4bUB2SeXJ3ggfFu8H+YFcjzqXbC
 w8Iz8m2cGESJ9Ey1jcZdahWSiggMVxg=
Date: Mon, 6 May 2024 10:46:17 -0400
MIME-Version: 1.0
Subject: Re: [BUG] drm: zynqmp_dp: Lockup in zynqmp_dp_bridge_detect when
 device is unbound
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <4d8f4c9b-2efb-4774-9a37-2f257f79b2c9@linux.dev>
 <363e6d48-3e40-4578-b6f6-17323395b49b@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <363e6d48-3e40-4578-b6f6-17323395b49b@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/6/24 07:16, Tomi Valkeinen wrote:
> Hi,
> 
> On 04/05/2024 00:54, Sean Anderson wrote:
>> Hi,
>>
>> I have discovered a bug in the displayport driver on drm-misc-next. To
>> trigger it, run
>>
>> echo fd4a0000.display > /sys/bus/platform/drivers/zynqmp-dpsub/unbind
>>
>> The system will become unresponsive and (after a bit) splat with a hard
>> LOCKUP. One core will be unresponsive at the first zynqmp_dp_read in
>> zynqmp_dp_bridge_detect.
>>
>> I believe the issue is due the registers being unmapped and the block
>> put into reset in zynqmp_dp_remove instead of zynqmp_dpsub_release. This
>> could be resolved by deferring things until zynqmp_dpsub_release
>> (requiring us to skip devm_*), or by adding a flag to struct zynqmp_dp
>> and checking it before each callback. A subsystem-level implementation
>> might be better for the latter.
>>
>> For a better traceback, try applying the below patch and running the
>> following commands before triggering the lockup:
>>
>> echo 4 > /sys/module/drm/parameters/debug
>> echo 8 > /proc/sys/kernel/printk
> 
> I wasn't able to reproduce. Where does the detect call come in your case? Looking at the code, afaics, it shouldn't happen.

# echo fd4a0000.display > /sys/bus/platform/drivers/zynqmp-dpsub/unbind
[234105.917005] Console: switching to colour dummy device 80x25
[234105.962474] zynqmp-dpsub fd4a0000.display: [drm:drm_client_release] fbdev
[234105.970397] zynqmp-dpsub fd4a0000.display: [drm:drm_sysfs_connector_remove] [CONNECTOR:41:DP-1] removing connector from sysfs
[234105.991669] zynqmp-dpsub fd4a0000.display: [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:41:DP-1]
[234106.001833] ------------[ cut here ]------------
[234106.006570] WARNING: CPU: 2 PID: 527 at drivers/gpu/drm/xlnx/zynqmp_dp.c:1537 zynqmp_dp_bridge_detect (drivers/gpu/drm/xlnx/zynqmp_dp.c:1537 (discriminator 1)) 
[234106.016960] Modules linked in:
[234106.021306] CPU: 2 PID: 527 Comm: Xorg Not tainted 6.9.0-rc6+ #34
[234106.027858] Hardware name: xlnx,zynqmp (DT)
[234106.032146] pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[234106.039219] pc : zynqmp_dp_bridge_detect (drivers/gpu/drm/xlnx/zynqmp_dp.c:1537 (discriminator 1)) 
[234106.044297] lr : drm_bridge_connector_detect (drivers/gpu/drm/drm_bridge_connector.c:176) 
[234106.049548] sp : ffffffc0895bb980
[234106.052968] x29: ffffffc0895bb980 x28: ffffff8805fe1000 x27: ffffffc0818ff000
[234106.060251] x26: 0000000000000001 x25: 0000000000000050 x24: 0000000000001000
[234106.067534] x23: 0000000000001000 x22: ffffff8805fe0030 x21: ffffff8805fe1000
[234106.074816] x20: ffffffc0895bbae8 x19: ffffff8805fe1000 x18: 0000000000005550
[234106.082099] x17: 6e6e6f635f656c67 x16: 6e69735f65626f72 x15: 705f7265706c6568
[234106.089382] x14: 5f6d72643a6d7264 x13: 0000000000000000 x12: 0000000000000000
[234106.096664] x11: 00000000000002c5 x10: 00000000000002c5 x9 : 00000000000402c5
[234106.103947] x8 : 0000000095d72cee x7 : 00000000f1c4be6a x6 : ffffffc082707b78
[234106.111229] x5 : 0000000000000000 x4 : ffffff8801f20000 x3 : 0000000000000000
[234106.118512] x2 : ffffffc080a5a2bc x1 : 0123456789abcdef x0 : deadbeefdeadbeef
[234106.125795] Call trace:
[234106.128347] zynqmp_dp_bridge_detect (drivers/gpu/drm/xlnx/zynqmp_dp.c:1537 (discriminator 1)) 
[234106.133077] drm_bridge_connector_detect (drivers/gpu/drm/drm_bridge_connector.c:176) 
[234106.137981] drm_helper_probe_detect (drivers/gpu/drm/drm_probe_helper.c:407) 
[234106.142538] drm_helper_probe_single_connector_modes (drivers/gpu/drm/drm_probe_helper.c:596) 
[234106.148658] drm_mode_getconnector (drivers/gpu/drm/drm_connector.c:2947) 
[234106.153215] drm_ioctl_kernel (drivers/gpu/drm/drm_ioctl.c:744 (discriminator 1)) 
[234106.157251] drm_ioctl (drivers/gpu/drm/drm_ioctl.c:841) 
[234106.160767] __arm64_sys_ioctl (fs/ioctl.c:52 fs/ioctl.c:904 fs/ioctl.c:890 fs/ioctl.c:890) 
[234106.164803] invoke_syscall (arch/arm64/include/asm/current.h:19 arch/arm64/kernel/syscall.c:53) 
[234106.168665] el0_svc_common.constprop.0 (arch/arm64/kernel/syscall.c:140) 
[234106.173483] do_el0_svc (arch/arm64/kernel/syscall.c:153) 
[234106.176911] el0_svc (arch/arm64/include/asm/irqflags.h:83 arch/arm64/include/asm/irqflags.h:124 arch/arm64/include/asm/irqflags.h:137 arch/arm64/kernel/entry-common.c:165 arch/arm64/kernel/entry-common.c:178 arch/arm64/kernel/entry-common.c:713) 
[234106.180166] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:731) 
[234106.184637] el0t_64_sync (arch/arm64/kernel/entry.S:598) 
[234106.188413] irq event stamp: 348036
[234106.192006] hardirqs last enabled at (348035): console_unlock (arch/arm64/include/asm/irqflags.h:83 arch/arm64/include/asm/irqflags.h:124 arch/arm64/include/asm/irqflags.h:137 kernel/printk/printk.c:341 kernel/printk/printk.c:2731 kernel/printk/printk.c:3050) 
[234106.200816] hardirqs last disabled at (348036): el1_dbg (arch/arm64/kernel/entry-common.c:371 (discriminator 4) arch/arm64/kernel/entry-common.c:471 (discriminator 4)) 
[234106.208845] softirqs last enabled at (348030): __do_softirq (arch/arm64/include/asm/current.h:19 arch/arm64/include/asm/preempt.h:13 kernel/softirq.c:401 kernel/softirq.c:583) 
[234106.217482] softirqs last disabled at (348023): ____do_softirq (arch/arm64/kernel/irq.c:82) 
[234106.226119] ---[ end trace 0000000000000000 ]---
[234106.230974] Unable to handle kernel paging request at virtual address ffffffc08562d130
[234106.239055] Mem abort info:
[234106.242008]   ESR = 0x0000000096000007
[234106.245872]   EC = 0x25: DABT (current EL), IL = 32 bits
[234106.251375]   SET = 0, FnV = 0
[234106.254584]   EA = 0, S1PTW = 0
[234106.257841]   FSC = 0x07: level 3 translation fault
[234106.262874] Data abort info:
[234106.265870]   ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
[234106.271548]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[234106.276763]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[234106.282240] swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000001a8d000
[234106.289107] [ffffffc08562d130] pgd=10000000033d8003, p4d=10000000033d8003, pud=10000000033d8003, pmd=10000008038ce003, pte=0000000000000000
[234106.302368] Internal error: Oops: 0000000096000007 [#1] SMP
[234106.308029] Modules linked in:
[234106.311169] CPU: 2 PID: 527 Comm: Xorg Tainted: G        W          6.9.0-rc6+ #34
[234106.319170] Hardware name: xlnx,zynqmp (DT)
[234106.323433] pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[234106.330480] pc : zynqmp_dp_bridge_detect (arch/arm64/include/asm/io.h:79 include/asm-generic/io.h:223 drivers/gpu/drm/xlnx/zynqmp_dp.c:335 drivers/gpu/drm/xlnx/zynqmp_dp.c:1544) 
[234106.335455] lr : drm_bridge_connector_detect (drivers/gpu/drm/drm_bridge_connector.c:176) 
[234106.340679] sp : ffffffc0895bb980
[234106.344073] x29: ffffffc0895bb980 x28: ffffff8805fe1000 x27: ffffffc0818ff000
[234106.351304] x26: 0000000000000001 x25: 0000000000000050 x24: 0000000000001000
[234106.358534] x23: 0000000000001000 x22: ffffff8805fe0030 x21: ffffff8805fe0000
[234106.365765] x20: ffffffc0895bbae8 x19: 000000000000000a x18: 0000000000005550
[234106.372995] x17: 6e6e6f635f656c67 x16: 6e69735f65626f72 x15: 705f7265706c6568
[234106.380226] x14: 5f6d72643a6d7264 x13: 0000000000000000 x12: 0000000000000000
[234106.387456] x11: 00000000000002c5 x10: 00000000000002c5 x9 : 00000000000402c5
[234106.394687] x8 : 0000000095d72cee x7 : 00000000f1c4be6a x6 : ffffffc082707b78
[234106.401917] x5 : 0000000000000000 x4 : ffffff8801f20000 x3 : 0000000000000000
[234106.409148] x2 : ffffffc080a5a2bc x1 : ffffffc08562d130 x0 : deadbeefdeadbeef
[234106.416379] Call trace:
[234106.418904] zynqmp_dp_bridge_detect (arch/arm64/include/asm/io.h:79 include/asm-generic/io.h:223 drivers/gpu/drm/xlnx/zynqmp_dp.c:335 drivers/gpu/drm/xlnx/zynqmp_dp.c:1544) 
[234106.423522] drm_bridge_connector_detect (drivers/gpu/drm/drm_bridge_connector.c:176) 
[234106.428400] drm_helper_probe_detect (drivers/gpu/drm/drm_probe_helper.c:407) 
[234106.432931] drm_helper_probe_single_connector_modes (drivers/gpu/drm/drm_probe_helper.c:596) 
[234106.439025] drm_mode_getconnector (drivers/gpu/drm/drm_connector.c:2947) 
[234106.443556] drm_ioctl_kernel (drivers/gpu/drm/drm_ioctl.c:744 (discriminator 1)) 
[234106.447566] drm_ioctl (drivers/gpu/drm/drm_ioctl.c:841) 
[234106.451055] __arm64_sys_ioctl (fs/ioctl.c:52 fs/ioctl.c:904 fs/ioctl.c:890 fs/ioctl.c:890) 
[234106.455066] invoke_syscall (arch/arm64/include/asm/current.h:19 arch/arm64/kernel/syscall.c:53) 
[234106.458902] el0_svc_common.constprop.0 (arch/arm64/kernel/syscall.c:140) 
[234106.463693] do_el0_svc (arch/arm64/kernel/syscall.c:153) 
[234106.467096] el0_svc (arch/arm64/include/asm/irqflags.h:83 arch/arm64/include/asm/irqflags.h:124 arch/arm64/include/asm/irqflags.h:137 arch/arm64/kernel/entry-common.c:165 arch/arm64/kernel/entry-common.c:178 arch/arm64/kernel/entry-common.c:713) 
[234106.470325] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:731) 
[234106.474769] el0t_64_sync (arch/arm64/kernel/entry.S:598) 
[234106.478524] Code: d100c2d5 52800153 f9400ea1 9104c021 (b9400021)
All code
========
   0:	d100c2d5 	sub	x21, x22, #0x30
   4:	52800153 	mov	w19, #0xa                   	// #10
   8:	f9400ea1 	ldr	x1, [x21, #24]
   c:	9104c021 	add	x1, x1, #0x130
  10:*	b9400021 	ldr	w1, [x1]		<-- trapping instruction

Code starting with the faulting instruction
===========================================
   0:	b9400021 	ldr	w1, [x1]
[234106.484704] ---[ end trace 0000000000000000 ]---
