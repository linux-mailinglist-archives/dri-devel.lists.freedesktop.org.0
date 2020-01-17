Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9C9140DF8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 16:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4294C6F5F9;
	Fri, 17 Jan 2020 15:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E296F5F6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 15:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579275303;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=zrkLE7fSAJx3XL3C9LMLoonuEH4mlbffONJS9qij/h8=;
 b=m5i3rGvCGgaCx75IYNbvd2dYUTjak3XiCsWnr18yE+7vRb2sYyGfdOKyHHjh3tz4bY
 C/crPWF3tJKFyaG1X00yfRru3+7gqmcmyO95aZzQOhMzh9S6bIWC2kDUU27sKftLvTOw
 B+EJx+i9T4adAFUUe787kV3FColCUtLwM7XYT76MyE8VOPmKSZlde268UBThNqqrYSZW
 EUj3CKWTDdRZmX1K4rp+uRNQgkigAWslbys99mjmJRELIdMbta5Ub35Qv4k7IwwvHG6j
 nX5XplfY24zMhjp073bokJOUP1CHkaFeneJHlvqyExfBjzxkn6GS9Iv9HRUP2U5YiWWt
 GVYQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXsNXwthI1"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.1.4 AUTH)
 with ESMTPSA id h048a6w0HFZ1opI
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 17 Jan 2020 16:35:01 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 0/2] drm/modes: Apply video parameters with only reflect
 option
Date: Fri, 17 Jan 2020 16:34:27 +0100
Message-Id: <20200117153429.54700-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Stephan Gerhold <stephan@gerhold.net>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At the moment, video mode parameters like video=540x960,reflect_x,
(without rotation set) are not taken into account when applying the
mode in drm_client_modeset.c.

One of the reasons for this is that the calculation that
combines the panel_orientation with cmdline->rotation_reflection
does not handle the case when cmdline->rotation_reflection does
not have any rotation set.
(i.e. cmdline->rotation_reflection & DRM_MODE_ROTATE_MASK == 0)

However, we really should not generate such a value in the first place.
Rotation values should have exactly one rotation angle set
(DRM_MODE_ROTATE_0 for "no rotation").

This patch set changes the command line parser to make sure that we generate
only valid rotation values (defaulting to DRM_MODE_ROTATE_0).

Finally it allows DRM_MODE_ROTATE_0 when applying the rotation from
the video mode parameters to make parameters without rotation work correctly.


Changes in v3:
  - Fix the cmdline parser to generate only valid rotation values instead.
    (There should be exactly one rotation angle in a rotation value.)
  - Removed most of the original patch - combining the rotations works correctly
    if we only have valid rotation values

v2: https://lore.kernel.org/dri-devel/20191216171017.173326-1-stephan@gerhold.net/
  - Clarified commit message - parameters are parsed correctly,
    but not taken into account when applying the mode.
v1: https://lore.kernel.org/dri-devel/20191209183254.211428-1-stephan@gerhold.net/


Stephan Gerhold (2):
  drm/modes: Make sure to parse valid rotation value from cmdline
  drm/modes: Allow DRM_MODE_ROTATE_0 when applying video mode parameters

 drivers/gpu/drm/drm_client_modeset.c              |  3 ++-
 drivers/gpu/drm/drm_modes.c                       |  7 +++++++
 drivers/gpu/drm/selftests/drm_cmdline_selftests.h |  1 +
 .../gpu/drm/selftests/test-drm_cmdline_parser.c   | 15 +++++++++++++--
 4 files changed, 23 insertions(+), 3 deletions(-)

-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
