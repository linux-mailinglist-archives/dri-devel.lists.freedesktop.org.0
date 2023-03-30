Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F02EF6CFD18
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA8F10ED18;
	Thu, 30 Mar 2023 07:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F32110ED15;
 Thu, 30 Mar 2023 07:41:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B2C71FE8F;
 Thu, 30 Mar 2023 07:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680162111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dUTY1XNd64qKFlaH/zT5Lxf5pTkHksszo20OFmvgBcI=;
 b=NwjC+FO+10fbeuaalpvsmy6CLT4plJuvRIgSz2OQaCk51gCWWGx6feGBP4w5ZcIZKZ9sRW
 wPltBzR3CdTfsdHAr9E7UJ+oHYcqcJo0XZyiucG4BsvhHcIJEXsHswxMY2w6MGJIrhmY0s
 l7G86TYJpjhnFCsByQHCvePjNQFFKGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680162111;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=dUTY1XNd64qKFlaH/zT5Lxf5pTkHksszo20OFmvgBcI=;
 b=qDUUfNfVFspDXFZekkgYc1aNZOxwUUET5/jpDh8KcWK+Bty5Fke9bGttKRO4BHmi+kd2nb
 YvzjHRTERhlt4lCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 768D61348E;
 Thu, 30 Mar 2023 07:41:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id v4zgGz89JWSZfQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:41:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 0/6] drm/msm: Convert fbdev to DRM client
Date: Thu, 30 Mar 2023 09:41:43 +0200
Message-Id: <20230330074150.7637-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert msm' fbdev code to struct drm_client. Replaces the current
ad-hoc integration. The conversion includes a number of cleanups. As
with most other drivers' fbdev emulation, fbdev in msm is now just
another DRM client that runs after the DRM device has been registered.

Once all drivers' fbdev emulation has been converted to struct drm_client,
we can attempt to add additional in-kernel clients. A DRM-based dmesg
log or a bootsplash are commonly mentioned. DRM can then switch easily
among the existing clients if/when required.

I did the conversion from similar experience with other drivers. But I
don't have the hardware to test this. Any testing is welcome.

Thomas Zimmermann (6):
  drm/msm: Clear aperture ownership outside of fbdev code
  drm/msm: Remove fb from struct msm_fbdev
  drm/msm: Remove struct msm_fbdev
  drm/msm: Remove fbdev from struct msm_drm_private
  drm/msm: Initialize fbdev DRM client
  drm/msm: Implement fbdev emulation as in-kernel client

 drivers/gpu/drm/msm/msm_debugfs.c |   6 +-
 drivers/gpu/drm/msm/msm_drv.c     |  21 ++--
 drivers/gpu/drm/msm/msm_drv.h     |  12 ++-
 drivers/gpu/drm/msm/msm_fbdev.c   | 168 ++++++++++++++++++------------
 4 files changed, 118 insertions(+), 89 deletions(-)

-- 
2.40.0

