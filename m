Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C1F8A38B9
	for <lists+dri-devel@lfdr.de>; Sat, 13 Apr 2024 01:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAAFE10F91A;
	Fri, 12 Apr 2024 23:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=kernel-space.org header.i=@kernel-space.org header.b="d8wk2nFN";
	dkim=pass (1024-bit key) header.d=kernel-space.org header.i=@kernel-space.org header.b="TFyPhxFl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel-space.org (mail.kernel-space.org [195.201.34.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF9010F82E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 19:56:51 +0000 (UTC)
Received: from kernel-space.org (localhost [127.0.0.1])
 by kernel-space.org (OpenSMTPD) with ESMTP id b4e22a24;
 Fri, 12 Apr 2024 19:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=kernel-space.org; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=s1; bh=7N29SYX3HmYbpP
 xdQ4e2ndUN3Ws=; b=d8wk2nFNlIZJW8hekNIJAFUsLJrtsrNhrJrZy94zCaIxMo
 SWX5fr/EcCpgoxJU3ueJPTbm8wpluva58qD14NNWKvYk6PY3Sx1f0mTsCEAHeDc2
 kJ3NY7Ori4BltyTY580JTUBfM787wXkfBgvrca/xGcQ3T8J4joEaQ/0aaZeWg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=kernel-space.org; h=from:to
 :cc:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding; q=dns; s=s1; b=JS/NfW7FofQniYdBw8lWC
 W1Zk8YWnIzkdUheDQ38vXV6g+ZpGNSSAoxeRLaZhYzpb8/ApkMdcPW1z48BktZHv
 Ls2CpY702UFqyuoCjUK7PVxxImZDE8LEhkj0K+99KqJ9FODhi8VxK27S3hjKknuw
 CMfeVNCet56Q7QNL/+uKTI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
 s=s1; t=1712951410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t26U56bTN+Ap/HY5Zz91d173EWSnEQS7Kdk5rjsewRI=;
 b=TFyPhxFl2FzHxSrMphOeDoJP0u8JPnaf6YyJcCMH7P4bMjNufA97ArNNf+3AprVCyZKnQT
 USzpDT5PUs06gZxLTsAhzAJjABSescuxe0XwIFfRJXuyNyMdQ0Zdlu9q+Ppn5IEu+Vvn2+
 GIIeuD+MWvLV0+5+OKtTQNxBBrwJ6P4=
Received: from yamato.homenet.telecomitalia.it
 (host-79-50-77-159.retail.telecomitalia.it [79.50.77.159])
 by kernel-space.org (OpenSMTPD) with ESMTPSA id 3d4dd704
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 12 Apr 2024 19:50:10 +0000 (UTC)
From: Angelo Dureghello <angelo@kernel-space.org>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com
Cc: Angelo Dureghello <angelo@kernel-space.org>
Subject: [PATCH v2 2/2] drm/dp: set pwm bit count when pwm hz is not set
Date: Fri, 12 Apr 2024 21:49:01 +0200
Message-ID: <20240412194901.1596-2-angelo@kernel-space.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412194901.1596-1-angelo@kernel-space.org>
References: <20240412194901.1596-1-angelo@kernel-space.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 12 Apr 2024 23:06:04 +0000
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

Set pwmgen_bit_count to have proper brightness inc/dec steps
even when driver_pwm_freq_hz (optional) is zero.

cat /sys/class/backlight/nv_backlight/max_brightness
255

Can now tune properly backlight from 0 to 255.

---
Changes for v2:
none

Signed-off-by: Angelo Dureghello <angelo@kernel-space.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f5d4be897866..30c4ed0f2ff1 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3768,6 +3768,7 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 	}
 
 	pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+	bl->pwmgen_bit_count = pn;
 	bl->max = (1 << pn) - 1;
 	if (!driver_pwm_freq_hz)
 		return 0;
-- 
2.44.0

