Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C933AC6D9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 11:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE7F6E9B6;
	Fri, 18 Jun 2021 09:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEC56E999;
 Fri, 18 Jun 2021 09:11:32 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id AE2D8C800B7;
 Fri, 18 Jun 2021 11:11:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id zQ1WkbLuMcXL; Fri, 18 Jun 2021 11:11:30 +0200 (CEST)
Received: from wsembach-tuxedo.fritz.box
 (p200300e37f3949001760E5710682cA7E.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f39:4900:1760:e571:682:ca7e])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 3F4B5C800B3;
 Fri, 18 Jun 2021 11:11:29 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 00/17] New uAPI drm properties for color management
Date: Fri, 18 Jun 2021 11:10:59 +0200
Message-Id: <20210618091116.14428-1-wse@tuxedocomputers.com>
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

Implementation of https://lkml.org/lkml/2021/5/12/764 now feature complete
albeit not fully tested.

I have not yet corrected the DSC behavior and double checked the dithering
behavior. I release the feature complete patch series now anyways so that
work on the userspace implementation can start.

I have no DP MST splitter at hand. I tried my best to not break anything,
but if one who has one could test it would be very helpful.

amdgpu in the former implementation was full color range only, albeit there
was a path prepared for limited color range on both rgb and ycbcr encoding,
which was never selected however. With the Broadcast RGB property, a user
can now select this program path.

On i915 Broadcast RGB still only affects rgb as ycbcr was and is always
limited with this driver, which I didn't change.

gma500 driver still uses it's own implementation of the "Broadcast RGB"
property, which doesn't have an "Automatic" setting. I too didn't touch
this as I can't test a corresponding card.


