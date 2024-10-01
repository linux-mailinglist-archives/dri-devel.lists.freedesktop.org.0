Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBBD98C576
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 20:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45AF10E65A;
	Tue,  1 Oct 2024 18:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="u4qt7krl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 386 seconds by postgrey-1.36 at gabe;
 Tue, 01 Oct 2024 18:38:02 UTC
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com
 [95.215.58.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C9110E65A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 18:38:02 +0000 (UTC)
Message-ID: <5e9769dd-459a-4ff3-aebb-bb7057192733@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1727807494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rlcHKQwn5L21aymtnarukq/iOfnG9kcJ0DkEr1DK1Lo=;
 b=u4qt7krlAH/WlmjcZxvGLaQuYPDvn//4i6Oj/BnHRm8F9LMSa8bxOvbXzLTd15EZ7pnktz
 CoUGfmRaSPfhfXCrWvCV2avcLd2CdV7WT9RjdlEzx+UjfPGq3NmOMI1cRge27qBplGZFxd
 kkF/hsu2qHQr3beT6mNTTr1uMQ7EYVU=
Date: Tue, 1 Oct 2024 14:31:28 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/8] drm: zynqmp_dp: IRQ cleanups and debugfs support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20240809193600.3360015-1-sean.anderson@linux.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20240809193600.3360015-1-sean.anderson@linux.dev>
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

On 8/9/24 15:35, Sean Anderson wrote:
> This series cleans up the zyqnmp_dp IRQ and locking situation. Once
> that's done, it adds debugfs support. The intent is to enable compliance
> testing or to help debug signal-integrity issues.
> 
> Previously, I discussed converting the HPD work(s) to a threaded IRQ. I
> did not end up doing that for this series since the steps would be
> 
> - Add locking
> - Move link retraining to a work function
> - Harden the IRQ
> - Merge the works into a threaded IRQ (omitted)
> 
> Which with the exception of the final step is the same as leaving those
> works as-is. Conversion to a threaded IRQ can be done as a follow-up.
> 
> Changes in v6:
> - Unplug DRM device before removal
> - Fix hang upon driver removal
> - Rebase onto drm-misc/drm-misc-next
> 
> Changes in v5:
> - Rebase onto drm-misc/drm-misc-next
> 
> Changes in v4:
> - Rebase onto drm/drm-next
> 
> Changes in v3:
> - Convert to a hard IRQ
> - Use AUX IRQs instead of polling
> - Take dp->lock in zynqmp_dp_hpd_work_func
> 
> Changes in v2:
> - Split off the HPD IRQ work into another commit
> - Expand the commit message
> - Document hpd_irq_work
> - Document debugfs files
> - Add ignore_aux_errors and ignore_hpd debugfs files to replace earlier
>   implicit functionality
> - Attempt to fix unreproducable, spurious build warning
> - Drop "Optionally ignore DPCD errors" in favor of a debugfs file
>   directly affecting zynqmp_dp_aux_transfer.
> 
> Sean Anderson (8):
>   drm: zynqmp_kms: Unplug DRM device before removal
>   drm: zynqmp_dp: Add locking
>   drm: zynqmp_dp: Don't retrain the link in our IRQ
>   drm: zynqmp_dp: Convert to a hard IRQ
>   drm: zynqmp_dp: Use AUX IRQs instead of polling
>   drm: zynqmp_dp: Split off several helper functions
>   drm: zynqmp_dp: Take dp->lock in zynqmp_dp_hpd_work_func
>   drm: zynqmp_dp: Add debugfs interface for compliance testing
> 
>  Documentation/gpu/drivers.rst     |   1 +
>  Documentation/gpu/zynqmp.rst      | 149 ++++++
>  MAINTAINERS                       |   1 +
>  drivers/gpu/drm/xlnx/zynqmp_dp.c  | 846 ++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xlnx/zynqmp_kms.c |   2 +-
>  5 files changed, 951 insertions(+), 48 deletions(-)
>  create mode 100644 Documentation/gpu/zynqmp.rst
> 

ping

--Sean
