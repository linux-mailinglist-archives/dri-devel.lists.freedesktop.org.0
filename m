Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74686BA4511
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 16:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EBB10EA7E;
	Fri, 26 Sep 2025 14:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bkVHthXZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E9B10EA7E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 14:59:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1617D4E40DFE;
 Fri, 26 Sep 2025 14:59:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C575E606B5;
 Fri, 26 Sep 2025 14:59:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 394F7102F1917; 
 Fri, 26 Sep 2025 16:58:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758898750; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=g/Kz1ie9dmVYwimov0wPhzbQRXu3e/N/BUHb33lb4LI=;
 b=bkVHthXZkidYzbifdV9SltyAzV3an0uOebGZlXz1RdqZY6tM780H+p54jSeD3ReMauLCwv
 YFBs1dtpS1qWvPTpvXq1qbMRg3w0ltTpupARRkyFT6/U24rFUmxckxyl3aZfn/3FafmHiB
 2KgWSFSRnWoKIuonMAGPDRZxpm24xyaHittPgHRs/pU7kvolDiD2Ee5aOQEoYZ4EFSN/bi
 MSzeR0ADdCjcnWgI04/E9lXI6rZR1dhbKOkbxP8GVjJzSBajx857QzZ61E7NU6HOtnm3a4
 ER0pCMdWies6+KfYMfVAKVDpg5luyBzGUW75Sxyw/ogoyEfa7j/qYp+vxVAnZA==
Date: Fri, 26 Sep 2025 16:58:47 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/connector: allow a .destroy callback for
 drmm-allocated connectors
Message-ID: <20250926165847.51f69473@booty>
In-Reply-To: <ycbx4fxqppxuopcd64i6lt7qlcsa75iv4z6q4aka7igt7pntc7@bf3toot46wxo>
References: <20250925-drm-bridge-alloc-getput-bridge-connector-v1-0-f0736e1c73ee@bootlin.com>
 <20250925-drm-bridge-alloc-getput-bridge-connector-v1-1-f0736e1c73ee@bootlin.com>
 <ycbx4fxqppxuopcd64i6lt7qlcsa75iv4z6q4aka7igt7pntc7@bf3toot46wxo>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Dmitry,

On Fri, 26 Sep 2025 01:07:26 +0300
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:

> On Thu, Sep 25, 2025 at 07:19:49PM +0200, Luca Ceresoli wrote:
> > Some code is going to need connector-specific cleanup actions (namely
> > drm_bridge_connector will need to put refcounted bridges).
> > 
> > The .destroy callback is appropriate for this task but it is currently
> > forbidden by drmm_connector_init(). Relax this limitation and document it.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > The other obvious approach would be adding a separate .cleanup callback for
> > the cleanup-only actions. I tried both, they both apparently work, so any
> > arguments and opinions on which approach is best within the overall DRM
> > design would be very useful here.  
> 
> Would it be better to use drmm-reset actions. I think the check here
> makes much more help overall than harm in your case, so I'd suggest
> leaving it in place.

Thanks for the feedback!

I think using drmm_add_action[_or_reset]() here makes sense indeed.

As I understand it, both .destroy and drmm_add_action[_or_reset]()
actions will trigger when the drm_device is removed. This is not ideal
for hotplugging because one would add/remove bridges while the
drm_device is persistent, so on multiple hot plug/unplug loops stale
resources would accumulate until the final card removal, perhaps at
system shutdown. However for now my goal is to have bridges refcount in
place to avoid use-after-free. Releasing resources for hot-unplugged
bridges for this case is a further step.

Bottom line: same drawback for both solutions, but the drmm action is
cleaner. v2 incoming with a drmm action.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
