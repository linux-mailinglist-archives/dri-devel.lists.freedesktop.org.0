Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEDC41F7CE
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 00:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD94C6F414;
	Fri,  1 Oct 2021 22:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E258B6F413
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 22:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633128856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JNT6NFPm3NCSavYO+18qUI4BjN3hpBeCTJTWq7hE5GQ=;
 b=DrQbUmKDbszPIeDHYSXwvzcjwBaWUPqOhiNxL+F/VgChGt6oNHuAaLIIZU3f9LpOk81u7L
 DmihmNfgk9XDvpUPLI67oVSIbfpcH+2YPd/Furh8vKnXmiosD5L/foK5/uZ8EchFNsE75P
 hAu0t7vynCQ1rH+gmFQJLQddgE7Ht/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-GDwH-LjqOHCsIq9770-0MQ-1; Fri, 01 Oct 2021 18:54:15 -0400
X-MC-Unique: GDwH-LjqOHCsIq9770-0MQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 670DE100C609;
 Fri,  1 Oct 2021 22:54:14 +0000 (UTC)
Received: from Ruby.redhat.com (unknown [10.22.17.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7C9060BF1;
 Fri,  1 Oct 2021 22:54:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/dp,
 drm/i915: Finish basic PWM support for VESA backlight helpers
Date: Fri,  1 Oct 2021 18:53:40 -0400
Message-Id: <20211001225344.1752203-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Changes:
* Fixup docs
* Add patch to stop us from breaking nouveau

Lyude Paul (4):
  drm/i915: Add support for panels with VESA backlights with PWM
    enable/disable
  drm/nouveau/kms/nv50-: Explicitly check DPCD backlights for aux
    enable/brightness
  drm/dp, drm/i915: Add support for VESA backlights using PWM for
    brightness control
  drm/i915: Clarify probing order in intel_dp_aux_init_backlight_funcs()

 drivers/gpu/drm/drm_dp_helper.c               | 75 +++++++++++------
 .../drm/i915/display/intel_dp_aux_backlight.c | 80 ++++++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_backlight.c   |  5 +-
 include/drm/drm_dp_helper.h                   |  7 +-
 4 files changed, 122 insertions(+), 45 deletions(-)

-- 
2.31.1

