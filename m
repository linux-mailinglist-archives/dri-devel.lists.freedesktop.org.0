Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3054235F1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 04:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECEB6ECC0;
	Wed,  6 Oct 2021 02:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC4A6ECBE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 02:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633488082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E3ytseCi5Oj9doDUfSdCM4nKRCGEoIFgdUICjz0Jf1s=;
 b=O0zILraHzF5aanKp3t9lFUSF4YR3U1mORZ07MojBTsQlQ66vZeNuqr/+WKlaCyWbhhgm32
 0TX/gJfYlLBFTlRWb2yyCy7ySl8KaYmR67ODnsrv1GxTkFwuBdw2pIQmfTSVBjx0hEDDn1
 jgF+AgSWoKaRQMXJb0YDIxUlJHMGKzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-YEH35CVKMVOY5jxgtUR7Pw-1; Tue, 05 Oct 2021 22:41:21 -0400
X-MC-Unique: YEH35CVKMVOY5jxgtUR7Pw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1510010168C0;
 Wed,  6 Oct 2021 02:41:20 +0000 (UTC)
Received: from Ruby.lyude.net (unknown [10.22.16.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E1429AA38;
 Wed,  6 Oct 2021 02:41:14 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v3 0/5] drm/dp,
 drm/i915: Finish basic PWM support for VESA backlight helpers
Date: Tue,  5 Oct 2021 22:40:13 -0400
Message-Id: <20211006024018.320394-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Changes (v3):
* Add likely fix for weird backlight scaling issues on samus-fi-bdw in intel's
  CI, which pointed out we've been leaving some (currently) unsupported
  backlight features on by mistake which certainly have the potential to cause
  problems.
Changes (v2):
* Fixup docs
* Add patch to stop us from breaking nouveau

Lyude Paul (5):
  drm/i915: Add support for panels with VESA backlights with PWM
    enable/disable
  drm/nouveau/kms/nv50-: Explicitly check DPCD backlights for aux
    enable/brightness
  drm/dp: Disable unsupported features in
    DP_EDP_BACKLIGHT_MODE_SET_REGISTER
  drm/dp, drm/i915: Add support for VESA backlights using PWM for
    brightness control
  drm/i915: Clarify probing order in intel_dp_aux_init_backlight_funcs()

 drivers/gpu/drm/drm_dp_helper.c               | 82 +++++++++++++------
 .../drm/i915/display/intel_dp_aux_backlight.c | 80 ++++++++++++++----
 drivers/gpu/drm/nouveau/nouveau_backlight.c   |  5 +-
 include/drm/drm_dp_helper.h                   |  7 +-
 4 files changed, 128 insertions(+), 46 deletions(-)

-- 
2.31.1

