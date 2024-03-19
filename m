Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FA0880805
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 00:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC2310F500;
	Tue, 19 Mar 2024 23:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="P9xdJew9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com
 [95.215.58.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C9510F305
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 23:02:23 +0000 (UTC)
Message-ID: <c5bc21b1-8725-4bd1-9125-16e59414fe4f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710889340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Yp8b77Z2QP7smP6uFFgzTr6GEMCJrRwCsu1CZUZOOY=;
 b=P9xdJew99zQ3RFsfgtUYwKwKaMLy497c+/b3oS9dKb1KTAZXVTCHB+yMqAX7UQikNp+E0I
 NEcMYnS1iHTY6m7IGqQbrUmkaZDjLRORjoDSSYla6B9f1aLhN88tAI7CQ6OaW4ORBqQpma
 5r7P69yqtKExGoOG+m00M+nFydPkdNc=
Date: Tue, 19 Mar 2024 19:02:15 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/8] drm: zynqmp_dp: Misc. patches and debugfs support
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@amd.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>
References: <20240319225122.3048400-1-sean.anderson@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20240319225122.3048400-1-sean.anderson@linux.dev>
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

On 3/19/24 18:51, Sean Anderson wrote:
> This series adds debugfs support for the zynqmp_dp driver. The intent is
> to enable compliance testing or to help debug signal-integrity issues.
> 
> The first four patches are general improvements (and could be applied
> independently), while the last four add debugfs support.
> 
> Changes in v2:
> - Fix kerneldoc
> - Rearrange zynqmp_dp for better padding
> - Document hpd_irq_work
> - Split off the HPD IRQ work into another commit
> - Expand the commit message
> - Document debugfs files
> - Add ignore_aux_errors and ignore_hpd debugfs files to replace earlier
>   implicit functionality
> - Attempt to fix unreproducable, spurious build warning
> - Drop "Optionally ignore DPCD errors" in favor of a debugfs file
>   directly affecting zynqmp_dp_aux_transfer.
> 
> Sean Anderson (8):
>   drm: xlnx: Fix kerneldoc
>   drm: zynqmp_dp: Downgrade log level for aux retries message
>   drm: zynqmp_dp: Adjust training values per-lane
>   drm: zynqmp_dp: Rearrange zynqmp_dp for better padding
>   drm: zynqmp_dp: Don't retrain the link in our IRQ
>   drm: zynqmp_dp: Add locking
>   drm: zynqmp_dp: Split off several helper functions
>   drm: zynqmp_dp: Add debugfs interface for compliance testing
> 
>  Documentation/gpu/drivers.rst       |   1 +
>  Documentation/gpu/zynqmp.rst        | 149 +++++
>  MAINTAINERS                         |   1 +
>  drivers/gpu/drm/xlnx/zynqmp_disp.c  |   6 +-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c    | 836 +++++++++++++++++++++++++---
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.h |   1 +
>  drivers/gpu/drm/xlnx/zynqmp_kms.h   |   4 +-
>  7 files changed, 931 insertions(+), 67 deletions(-)
>  create mode 100644 Documentation/gpu/zynqmp.rst
> 

+CC Dmitry, Tomi, and Anatoliy who I forgot to CC

Let me know if you want to be taken off CC for future revisions

--Sean
