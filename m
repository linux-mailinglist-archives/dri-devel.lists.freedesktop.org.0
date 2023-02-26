Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 621E86A2FED
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 15:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FD710E12A;
	Sun, 26 Feb 2023 14:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from forward105j.mail.yandex.net (forward105j.mail.yandex.net
 [5.45.198.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09DE10E0E6;
 Sun, 26 Feb 2023 14:19:16 +0000 (UTC)
Received: from iva2-656890eaceb5.qloud-c.yandex.net
 (iva2-656890eaceb5.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:6902:0:640:6568:90ea])
 by forward105j.mail.yandex.net (Yandex) with ESMTP id E15C54EC884D;
 Sun, 26 Feb 2023 17:11:14 +0300 (MSK)
Received: by iva2-656890eaceb5.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id tATvDFdaca61-J9iv9dTu; Sun, 26 Feb 2023 17:11:13 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lach.pw; s=mail;
 t=1677420673; bh=tAhynSMDZaX+iE0zy9k7GywiZkOsJcg+z8IRMMvTpoY=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=TR1CW72vBYYFefZkrQMYOD+4ie7UrqgZUN7ogmOXv2lTkyg7MNIhcqr5SQ3d5LUAg
 JMbaDFI29RSQ7d4BFUoqQYEIjrJ8cVobYe3F4KRLGmHI06RsVAkkAHemJeNq+UMMRg
 kgoQowo48Otam6wrTvxWqqayZJBvwuK9JHdmdaAI=
Authentication-Results: iva2-656890eaceb5.qloud-c.yandex.net;
 dkim=pass header.i=@lach.pw
From: Yaroslav Bolyukin <iam@lach.pw>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/edid DSC pass-through timing support
Date: Sun, 26 Feb 2023 15:10:49 +0100
Message-Id: <20230226141051.21767-1-iam@lach.pw>
X-Mailer: git-send-email 2.39.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Jani Nikula <jani.nikula@intel.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yaroslav Bolyukin <iam@lach.pw>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VESA DisplayID spec allows the device to force its DSC bits per pixel
value.

For example, the HTC Vive Pro 2 VR headset uses this value in
high-resolution modes (3680x1836@90-120, 4896x2448@90-120), and when the
kernel doesn't respect this parameter, the garbage is displayed on HMD
instead.

I am unaware of any other hardware using this value; however, multiple
users have tested this patch on the Vive Pro 2, and it is known to work and
not break anything else.

Regarding driver support - I have looked at amdgpu and Nvidia's
open-gpu-kernel-modules, and both seem to have some indication for this
value; however, in Linux, it is unused in both. 

Amdgpu integration was trivial, so I implemented it in the second patch;
other kernel drivers still need the support of this value, and I don't have
the necessary hardware to implement and test the handling of this value on
them.

BR,
Yaroslav

Yaroslav Bolyukin (2):
  drm/edid: parse DRM VESA dsc bpp target
  drm/amd: use fixed dsc bits-per-pixel from edid

 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +
 .../gpu/drm/amd/display/dc/core/dc_stream.c   |  2 +
 drivers/gpu/drm/amd/display/dc/dc_types.h     |  3 ++
 drivers/gpu/drm/drm_edid.c                    | 42 ++++++++++++-------
 include/drm/drm_connector.h                   |  6 +++
 include/drm/drm_displayid.h                   |  4 ++
 6 files changed, 45 insertions(+), 14 deletions(-)


base-commit: a48bba98380cb0b43dcd01d276c7efc282e3c33f
--
2.39.1
