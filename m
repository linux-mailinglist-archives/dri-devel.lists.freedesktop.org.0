Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9520F329D7B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 13:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F6E6E925;
	Tue,  2 Mar 2021 12:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876636E925
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 12:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614686447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=apanCOJ0sjAqzebvsKbVF/iL/Zg0gHVTZPLRUh8BLmg=;
 b=AO3ielrAEoFqVbKhIf3jnk/JpLAcxbn/5eaxweeerYlbvZOph15qt5tzT3G1jKGclSskqk
 iBMKWA3Ti6mTDmdGdURaYfRnOkK4xH1PJ79dPIY3eEt+x0qivPxFaOlkINdMuJUPba8ITq
 q9B6Na/4n8QHWod6zypHEATmGVQy22o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-J6E7xPcaM3ypN4eKUCxmFA-1; Tue, 02 Mar 2021 07:00:45 -0500
X-MC-Unique: J6E7xPcaM3ypN4eKUCxmFA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B424F801976;
 Tue,  2 Mar 2021 12:00:43 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-7.ams2.redhat.com [10.36.115.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1DA9772E0;
 Tue,  2 Mar 2021 12:00:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH resend 0/2] drm/i915/display: Make vlv_find_free_pps() skip
 pipes which are in use for non DP purposes
Date: Tue,  2 Mar 2021 13:00:38 +0100
Message-Id: <20210302120040.94435-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Here is a resend of my patch-set to deal with an
"transcoder A assertion failure (expected off, current on)"
error + WARN (and backtrace) seen on some Bay Trail devices with a DSI panel.

I've rebased it on the latest drm-intel-next, so this time around the CI
should be able to actually apply and test it, please review.

Regards,

Hans


Hans de Goede (2):
  drm/i915/display: Add a intel_pipe_is_enabled() helper
  drm/i915/display: Make vlv_find_free_pps() skip pipes which are in use
    for non DP purposes

 drivers/gpu/drm/i915/display/intel_display.c | 20 ++++++++++++------
 drivers/gpu/drm/i915/display/intel_display.h |  2 ++
 drivers/gpu/drm/i915/display/intel_pps.c     | 22 ++++++++++++++++++++
 3 files changed, 38 insertions(+), 6 deletions(-)

-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
