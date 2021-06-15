Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0429E3A822F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 16:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8833289DB5;
	Tue, 15 Jun 2021 14:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F6F89DB5;
 Tue, 15 Jun 2021 14:14:37 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id AD27DC800A7;
 Tue, 15 Jun 2021 16:14:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id Fnry7ItCZ1uv; Tue, 15 Jun 2021 16:14:35 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300e37F3949009F7CF2Abd5Da2787.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:9f7c:f2ab:d5da:2787])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 01154C80095;
 Tue, 15 Jun 2021 16:14:34 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 00/14] New uAPI drm properties for color management
Date: Tue, 15 Jun 2021 16:14:11 +0200
Message-Id: <20210615141426.6001-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.25.1
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

I started work on my proposal for better color handling in Linux display
drivers: https://lkml.org/lkml/2021/5/12/764

In this 3rd revision everything except the generalised Broadcast RGB
implementation is included. I did however not yet include everything suggested
in the feedback for v1 and v2.

I rebased the patch series on drm-tip to have the latest changes in i915's
YCbCr420 handling and to make the intel-gfx ci not fail on merge anymore.

The read only properties are now correctly marked as immutable.

Some questions I already have:

I think Broadcast RGB is really no good name for the property as, at least in
theory, YCbCr can also be "Limited" or "Full". Should the new implementation
have a different name and make "Broadcast RGB" an alias for it? I propose
"preferred color range" as the new name.

I have not tested dp mst (both on AMD and Intel) as i have no adapter for it at
hand. If one can test it, please let me know if things break or not.

I found the DRM_MODE_PROP_ATOMIC flag and from the documentation it sounds like
"max bpc" (and "preferred color format" and "Broadcast RGB") should have it. Is
there a reason it doesn't?

I have not yet looked into dsc and dithering behaviour.

I have already submitted the first two patches separately to the lkml as they fix
potential bugs and don't introduce new uAPI.

