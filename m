Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C4FA4987F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 12:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD0D10EC70;
	Fri, 28 Feb 2025 11:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rz.uni-freiburg.de header.i=@rz.uni-freiburg.de header.b="nauiVRXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c1422.mx.srv.dfn.de (c1422.mx.srv.dfn.de [194.95.239.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCD210EA9F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 11:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 rz.uni-freiburg.de; h=content-transfer-encoding:content-type
 :content-type:mime-version:x-mailer:message-id:date:date:subject
 :subject:from:from:received; s=s1; t=1740654230; x=1742468631;
 bh=aWo7Yk0ZW/7bGkj9MoNAIr2LrMIcTx7MiVBdk+ZlePg=; b=nauiVRXMdXnU
 8OhXvZeHJEA0vbKIR/zSy16l1Y7kJY8IJGs/y/2GZqdbj2nDSKWmuqLxpv/gVTd1
 IV/CynnauoA+gYFnbaunIyeNs9oq4j+OPbF4LC45Gd+02pKh+P/Kd0DCNP95IEDS
 A0WuCgipVK4Ku5KyzykiovyVG5IuhvY=
Received: from fe1.uni-freiburg.de (fe1.uni-freiburg.de [132.230.2.221])
 by c1422.mx.srv.dfn.de (Postfix) with ESMTP id 711552C0121
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 12:03:50 +0100 (CET)
Received: from [2001:7c0:2517:a:4b56:9ec4:d188:b1a0] (account
 michael.scherle@rz.uni-freiburg.de HELO rz-10-126-20-105.eduroam-rz.privat)
 by mail.uni-freiburg.de (CommuniGate Pro SMTP 6.3.19)
 with ESMTPSA id 46276630; Thu, 27 Feb 2025 12:03:50 +0100
From: Michael Scherle <michael.scherle@rz.uni-freiburg.de>
To: dri-devel@lists.freedesktop.org
Cc: Michael Scherle <michael.scherle@rz.uni-freiburg.de>
Subject: [PATCH 00/10] dcc: Create a stream for non-gl/remote clients that
 want to use dmabuf (v9)
Date: Thu, 27 Feb 2025 12:03:22 +0100
Message-ID: <cover.1740651328.git.michael.scherle@rz.uni-freiburg.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Feb 2025 11:42:15 +0000
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

This merge request is based on Vivek Kasireddy's
[PATCH v8 0/6] dcc: Create a stream for non-gl/remote clients that
want to use dmabuf (v8), who gave me the permission to pursue the
merge request. I also submitted this directly on gitlab but but I'm
now also submitting it via the mailing list .I have made my changes
in separate commits, should I merge them with the existing commits?

Original Description:
For clients that cannot accept a dmabuf fd directly (such as those
running on a remote system), this patch series provides a way for
the Spice server to stream the gl/dmabuf data/buffer instead. This
is mostly done by enabling the creation of Gst memory using a dmabuf
fd as the source. This ability is useful given that dmabuf is the
standard mechanism for sharing buffers between various drivers and
userspace in many Graphics and Media usecases. Currently, this is
tested with Qemu and remote-viewer using the x264enc/avdec_h264
and msdkh264enc/dec plugins to stream the Guest/VM desktop but it
can be easily extended to other plugins and applications.
Here is roughly how things work:

The application (e.g, Qemu) chooses its preferred codec (a Gstreamer
one) and calls gl_scanout (to update the fd) followed by gl_draw.
In response, the Spice server checks to see if the client is capable
of accepting a dmabuf fd directly or not. If yes, the fd is forwarded
directly to the client; otherwise, a new stream is created.
The Spice server then sends the dmabuf fd to the Gstreamer encoder
which uses it as an input for creating an encoded buffer which is then
sent to the client.
Once the encoding process is done, an async completion cookie is sent
to the application.

Here is a link to the previous version that used a drawable to share
the dmabuf fd with the Gstreamer encoder:
https://lists.freedesktop.org/archives/spice-devel/2023-January/052948.html
This version is tested together with following (required) patches in qemu:
https://gitlab.freedesktop.org/Vivek/qemu/-/commits/spice_gl_on_v4

Changelog:
v9:

updated the spice-common submodule, which is needed for udev helper to identify GPU vendor
include dmabuf encoding only if dmabuf supported and gstreamer >= 1.24
fix a race condition when the video stream is stopped while encoding a frame

v8:

Added a new gstreamer-encoder patch to this series to convert drm format
shared by the VMM to the appropriate Gstreamer format.

v7:

Revert back to the previous design where we do not share fd with the stream
and scanout is the sole owner of the fd. This is because sharing fd ownership
opens up a lot of corner cases.

v6: (Frediano)

Properly share ownership of the dmabuf fd between stream and scanout
Ensure that a newly created stream is associated with all connected clients

v5:

Addressed review comments from Frediano mainly regarding adding autoconf
support for gstreamer-allocators dependency and not needing to access
scanout as part of gl draw operation

v4:

Test with Virgl enabled
Associate dmabuf's y0_top with stream's top_down variable

v3:

Updated the second patch to have a new primary surface created
whenever a new stream gets created. This will avoid having to
trigger primary surface creation from Qemu. And, this change
also fixes the following error seen with v2:
../server/display-channel.cpp:2074:display_channel_create_surface:
condition `!display->priv->surfaces[surface_id]' failed
Rebase all patches on master

v2:

Update all patches to address review comments from Frediano
Tested this series with msdkh264enc/dec plugins that will be added
in another patch series

Michael Scherle (3):
  Update spice-common submodule
  gstreamer-encoder: Include dmabuf encoding conditionally for Linux
  dcc-send: Fix freeze when video stream is stopped during ongoing draw

Vivek Kasireddy (7):
  gstreamer-encoder: Use a h/w based encoder with Intel GPUs if possible
    (v5)
  dcc: Check to see if the client supports multiple codecs (v2)
  dcc: Create a stream associated with gl_draw for non-gl clients (v6)
  dcc-send: Encode and send gl_draw stream data to the remote client
    (v4)
  gstreamer-encoder: Add an encoder function that takes dmabuf fd as
    input (v3)
  video-stream: Don't stop a stream associated with gl_draw (v2)
  gstreamer-encoder: Map the drm format to appropriate Gstreamer format

 configure.ac                     |   2 +-
 meson.build                      |  12 +-
 server/dcc-send.cpp              | 163 ++++++++++---
 server/dcc.cpp                   |  31 ++-
 server/dcc.h                     |   6 +
 server/display-channel-private.h |   1 +
 server/display-channel.cpp       |   1 +
 server/gstreamer-encoder.c       | 389 ++++++++++++++++++++++++++++---
 server/video-encoder.h           |  14 ++
 server/video-stream.cpp          | 201 +++++++++++++---
 server/video-stream.h            |   4 +
 subprojects/spice-common         |   2 +-
 12 files changed, 717 insertions(+), 109 deletions(-)

-- 
2.48.1

