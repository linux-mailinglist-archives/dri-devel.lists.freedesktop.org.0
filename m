Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 736FAB42D6F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 01:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9926810E21C;
	Wed,  3 Sep 2025 23:30:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B2CA810E21C;
 Wed,  3 Sep 2025 23:30:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF4A61655;
 Wed,  3 Sep 2025 16:30:26 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E1483F694;
 Wed,  3 Sep 2025 16:30:33 -0700 (PDT)
Date: Thu, 4 Sep 2025 00:29:24 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-sunxi
 <linux-sunxi@lists.linux.dev>
Subject: drm/etnaviv: detecting disabled Vivante GPU?
Message-ID: <20250904002924.2bc63b73@minigeek.lan>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Hi,

the Allwinner A523/A527/T527 family of SoCs feature a Vivante
"VIP9000"(?) NPU, though it seems to be disabled on many SKUs.
See https://linux-sunxi.org/A523#Family_of_sun55iw3 for a table, the
row labelled "NPU" indicates which model has the IP. We suspect it's
all the same die, with the NPU selectively fused off on some packages.

Board vendors seem to use multiple SKUs of the SoC on the same board,
so it's hard to say which particular board has the NPU or not. We
figured that on unsupported SoCs all the NPU registers read as 0,
though, so were wondering if that could be considered as a bail-out
check for the driver?
At the moment I get this, on a SoC with a disabled NPU:
[    1.677612] etnaviv etnaviv: bound 7122000.npu (ops gpu_ops)
[    1.683849] etnaviv-gpu 7122000.npu: model: GC0, revision: 0
[    1.690020] etnaviv-gpu 7122000.npu: Unknown GPU model
[    1.696145] [drm] Initialized etnaviv 1.4.0 for etnaviv on minor 0
[    1.953053] etnaviv-gpu 7122000.npu: GPU not yet idle, mask: 0x00000000

Chen-Yu got this on his board featuring the NPU:
    etnaviv-gpu 7122000.npu: model: GC9000, revision: 9003

If I get the code correctly, then etnaviv_gpu_init() correctly detects
the "unsupported" GPU model, and returns -ENXIO, but load_gpu() in
etnaviv_drv.c then somewhat ignores this, since it keeps looking for more
GPUs, and fails to notice that *none* showed up:
/sys/kernel/debug/dri/etnaviv/gpu is empty in my case.

Quick questions:
- Is reading 0 from VIVS_HI_CHIP_IDENTITY (or any other of the ID
  registers) an invalid ID, so we can use that to detect those disabled
  NPUs? If not, can any other register used to check this? The whole
  block seems to be RAZ/WI when the NPU is disabled.

- Would it be acceptable to change the logic to error out of the
  driver's init or probe routine when no GPU/NPU has been found, at
  best with a proper error message? As it stands at the moment, the
  driver is loaded, but of course nothing is usable, so it keeps
  confusing users.

Happy to provide a patch, but just wanted to test the waters.

Cheers,
Andre
