Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90C5A4987D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 12:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08FC10EC73;
	Fri, 28 Feb 2025 11:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rz.uni-freiburg.de header.i=@rz.uni-freiburg.de header.b="U+Nn/b4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 435 seconds by postgrey-1.36 at gabe;
 Thu, 27 Feb 2025 11:11:15 UTC
Received: from c1422.mx.srv.dfn.de (c1422.mx.srv.dfn.de [194.95.239.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF0310EA64
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 11:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 rz.uni-freiburg.de; h=content-transfer-encoding:content-type
 :content-type:in-reply-to:from:from:content-language:references
 :subject:subject:user-agent:mime-version:date:date:message-id
 :received; s=s1; t=1740654672; x=1742469073; bh=/xAu52AlyTT122fI
 o+tPNvaTaRlBWq+OBKJq32xWrbk=; b=U+Nn/b4vlBPRfciwk/kKKtCepIQfE+93
 tsk47BLmNLWsIszJpF8aHauo35EX1F3Vci9SvZWJBct169dk4svnue3NxLYrmEKl
 mB1UzICE2HW7dyM7kuy5OkZ9ut73b0zAkCEn4l7KMIPZy0A+EXg+nYqXpeeIHrhq
 A4I9WkyUQVo=
Received: from fe1.uni-freiburg.de (fe1.uni-freiburg.de [132.230.2.221])
 by c1422.mx.srv.dfn.de (Postfix) with ESMTP id 947552C0177
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 12:11:12 +0100 (CET)
Received: from [2001:7c0:2517:a:4b56:9ec4:d188:b1a0] (account
 michael.scherle@rz.uni-freiburg.de HELO
 [IPV6:2001:7c0:2517:a:4b56:9ec4:d188:b1a0])
 by mail.uni-freiburg.de (CommuniGate Pro SMTP 6.3.19)
 with ESMTPSA id 46276879 for dri-devel@lists.freedesktop.org;
 Thu, 27 Feb 2025 12:11:12 +0100
Message-ID: <44561290-469a-45bb-b8ce-22891d5a9690@rz.uni-freiburg.de>
Date: Thu, 27 Feb 2025 12:11:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 00/10] dcc: Create a stream for non-gl/remote clients that
 want to use dmabuf (v9)
To: dri-devel@lists.freedesktop.org
References: <cover.1740651328.git.michael.scherle@rz.uni-freiburg.de>
Content-Language: en-US
From: Michael Scherle <michael.scherle@rz.uni-freiburg.de>
In-Reply-To: <cover.1740651328.git.michael.scherle@rz.uni-freiburg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Oh I made a mistake and send this to the wrong mailing list, I'm
so sorry, I wanted to send it to the spice devel.


On 27.02.25 12:03, Michael Scherle wrote:
> This merge request is based on Vivek Kasireddy's
> [PATCH v8 0/6] dcc: Create a stream for non-gl/remote clients that
> want to use dmabuf (v8), who gave me the permission to pursue the
> merge request. I also submitted this directly on gitlab but but I'm
> now also submitting it via the mailing list .I have made my changes
> in separate commits, should I merge them with the existing commits?
> 
> Original Description:
> For clients that cannot accept a dmabuf fd directly (such as those
> running on a remote system), this patch series provides a way for
> the Spice server to stream the gl/dmabuf data/buffer instead. This
> is mostly done by enabling the creation of Gst memory using a dmabuf
> fd as the source. This ability is useful given that dmabuf is the
> standard mechanism for sharing buffers between various drivers and
> userspace in many Graphics and Media usecases. Currently, this is
> tested with Qemu and remote-viewer using the x264enc/avdec_h264
> and msdkh264enc/dec plugins to stream the Guest/VM desktop but it
> can be easily extended to other plugins and applications.
> Here is roughly how things work:
> 
> The application (e.g, Qemu) chooses its preferred codec (a Gstreamer
> one) and calls gl_scanout (to update the fd) followed by gl_draw.
> In response, the Spice server checks to see if the client is capable
> of accepting a dmabuf fd directly or not. If yes, the fd is forwarded
> directly to the client; otherwise, a new stream is created.
> The Spice server then sends the dmabuf fd to the Gstreamer encoder
> which uses it as an input for creating an encoded buffer which is then
> sent to the client.
> Once the encoding process is done, an async completion cookie is sent
> to the application.
> 
> Here is a link to the previous version that used a drawable to share
> the dmabuf fd with the Gstreamer encoder:
> https://lists.freedesktop.org/archives/spice-devel/2023-January/052948.html
> This version is tested together with following (required) patches in qemu:
> https://gitlab.freedesktop.org/Vivek/qemu/-/commits/spice_gl_on_v4
> 
> Changelog:
> v9:
> 
> updated the spice-common submodule, which is needed for udev helper to identify GPU vendor
> include dmabuf encoding only if dmabuf supported and gstreamer >= 1.24
> fix a race condition when the video stream is stopped while encoding a frame
> 
> v8:
> 
> Added a new gstreamer-encoder patch to this series to convert drm format
> shared by the VMM to the appropriate Gstreamer format.
> 
> v7:
> 
> Revert back to the previous design where we do not share fd with the stream
> and scanout is the sole owner of the fd. This is because sharing fd ownership
> opens up a lot of corner cases.
> 
> v6: (Frediano)
> 
> Properly share ownership of the dmabuf fd between stream and scanout
> Ensure that a newly created stream is associated with all connected clients
> 
> v5:
> 
> Addressed review comments from Frediano mainly regarding adding autoconf
> support for gstreamer-allocators dependency and not needing to access
> scanout as part of gl draw operation
> 
> v4:
> 
> Test with Virgl enabled
> Associate dmabuf's y0_top with stream's top_down variable
> 
> v3:
> 
> Updated the second patch to have a new primary surface created
> whenever a new stream gets created. This will avoid having to
> trigger primary surface creation from Qemu. And, this change
> also fixes the following error seen with v2:
> ../server/display-channel.cpp:2074:display_channel_create_surface:
> condition `!display->priv->surfaces[surface_id]' failed
> Rebase all patches on master
> 
> v2:
> 
> Update all patches to address review comments from Frediano
> Tested this series with msdkh264enc/dec plugins that will be added
> in another patch series
> 
> Michael Scherle (3):
>   Update spice-common submodule
>   gstreamer-encoder: Include dmabuf encoding conditionally for Linux
>   dcc-send: Fix freeze when video stream is stopped during ongoing draw
> 
> Vivek Kasireddy (7):
>   gstreamer-encoder: Use a h/w based encoder with Intel GPUs if possible
>     (v5)
>   dcc: Check to see if the client supports multiple codecs (v2)
>   dcc: Create a stream associated with gl_draw for non-gl clients (v6)
>   dcc-send: Encode and send gl_draw stream data to the remote client
>     (v4)
>   gstreamer-encoder: Add an encoder function that takes dmabuf fd as
>     input (v3)
>   video-stream: Don't stop a stream associated with gl_draw (v2)
>   gstreamer-encoder: Map the drm format to appropriate Gstreamer format
> 
>  configure.ac                     |   2 +-
>  meson.build                      |  12 +-
>  server/dcc-send.cpp              | 163 ++++++++++---
>  server/dcc.cpp                   |  31 ++-
>  server/dcc.h                     |   6 +
>  server/display-channel-private.h |   1 +
>  server/display-channel.cpp       |   1 +
>  server/gstreamer-encoder.c       | 389 ++++++++++++++++++++++++++++---
>  server/video-encoder.h           |  14 ++
>  server/video-stream.cpp          | 201 +++++++++++++---
>  server/video-stream.h            |   4 +
>  subprojects/spice-common         |   2 +-
>  12 files changed, 717 insertions(+), 109 deletions(-)
> 

