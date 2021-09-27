Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 323DC419FDE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 22:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8C06E037;
	Mon, 27 Sep 2021 20:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24DF89BAB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 20:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632773555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OyTBeu2nJrfhAV7DEhmRRF90CKUeaQ87Y9OAt8VZdh0=;
 b=VYFLardJPTY3U2atH6G/lt/5kS162bU/g6OmNCp6yU2RJZcOmZqsQ0KY/of7qHuTeAVSKh
 FfC1XtvJVPIsCJWiHuI9Zc4AWkd5qAen7T9/wWuH36hQyX9vxoX0+GZjNtgZ6rg3uF3dD7
 cNg++MOBHXPCtMN5Nyl3nVRM8OoK1T0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-glf7VgJDO2q6wjXTEHJe_w-1; Mon, 27 Sep 2021 16:12:32 -0400
X-MC-Unique: glf7VgJDO2q6wjXTEHJe_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37FB750750;
 Mon, 27 Sep 2021 20:12:31 +0000 (UTC)
Received: from Ruby.lyude.net (unknown [10.22.17.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8704910016FE;
 Mon, 27 Sep 2021 20:12:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/dp,
 drm/i915: Finish basic PWM support for VESA backlight helpers
Date: Mon, 27 Sep 2021 16:12:03 -0400
Message-Id: <20210927201206.682788-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

When I originally moved all of the VESA backlight code in i915 into DRM
helpers, one of the things I didn't have the hardware or time for
testing was machines that used a combination of PWM and DPCD in order to
control their backlights. This has since then caused some breakages and
resulted in us disabling DPCD backlight support on such machines. This
works fine, unless you have a machine that actually needs this
functionality for backlight controls to work at all. Additionally, we
will need to support PWM for when we start adding support for VESA's
product (as in the product of multiplication) control mode for better
brightness ranges.

So - let's finally finish up implementing basic support for these types
of backlights to solve these problems in our DP helpers, along with
implementing support for this in i915. And since digging into this issue
solved the last questions we really had about probing backlights in i915
for the most part, let's update some of the comments around that as
well!

Lyude Paul (3):
  drm/i915: Add support for panels with VESA backlights with PWM
    enable/disable
  drm/dp, drm/i915: Add support for VESA backlights using PWM for
    brightness control
  drm/i915: Clarify probing order in intel_dp_aux_init_backlight_funcs()

 drivers/gpu/drm/drm_dp_helper.c               | 102 ++++++++++++++----
 .../drm/i915/display/intel_dp_aux_backlight.c |  81 ++++++++++----
 drivers/gpu/drm/nouveau/nouveau_backlight.c   |   2 +-
 include/drm/drm_dp_helper.h                   |  46 ++++----
 4 files changed, 170 insertions(+), 61 deletions(-)

-- 
2.31.1

