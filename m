Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPGEJ804jGlZjgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:07:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 501341220DA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF8B10E202;
	Wed, 11 Feb 2026 08:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IlvuhsY2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA04A10E5C7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 17:35:48 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso40264635e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770744947; x=1771349747;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=KJIHP8GTsVAAKqf5g30+6rG+sAKC0DftJYjYwIxgZG8=;
 b=IlvuhsY2Os9bH0WsziH/ed4VolALczIPnQU4sPM2j9qIZklzkpPFLTPU+1U4VScksr
 xg8Ne3HAeh/13Ui2MMZ61/II++LLy7vGZ7EW5eRtDtxq5zOtNvIR96I+zbcXvX9s/j+j
 aFWCDsxZ1YxHv7e9zen1PxOh/oOG0vrJVk/1T3pQaBTRHgic298Rq7KUvj8sSkPqM+iV
 x2+3t3Sd/ryY/j7LW3YzJrlW+jcarkv20wshv+kahFnlNf4sRNHqOy/MzPd3aA0OiLOo
 hoffmp+1ZkK0D5GgqOfBaOQIS6AqDqv2IGpwN+2EcTpFmZj0w7Ej13b2p+rqQuOC2DpG
 /+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770744947; x=1771349747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KJIHP8GTsVAAKqf5g30+6rG+sAKC0DftJYjYwIxgZG8=;
 b=rGMUX4r4CDrMagNASk25gBCWFVbjuJJpgjqnG7Dja73E1Q6MRfnpQr4/WymsbnO/Bw
 628eY2cPgQmdUlAokmySbNBj0dQOxaV2yoVR/JbiZAiqspecahVCxzQxKiLi0s6YwrLn
 SMHoHVn4aVngGr5DdAlucHMO3vhTgtfCgGmELqQ0FSdwR2EFyG0A37KU67ymO84V2xst
 6yXEkp0epnAhnBn/4llg/0otQr+BaWtHdGJ8mv4n7ZcA5nJKujKEsczK03lhuS136rgM
 qzpkq1nLXxi3JEP6RauFmcn2IuKW9fOt5bbk3XAo+Xqs0DRLIjUbPmoDW6iiekmKUoND
 9RQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXggi8ftLGBfCkkHz2Cfi/ojtwX6Jzd9QTXzOlRdaRTmDegTGmYNJHGity3Q46hJgP8Iob8p0j8O9w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzV+vIxH4VfSJhqFCHtoF2KOEcPsNGI/zAAPM1XRoRSLo/9tyvq
 Mw0Vmubb4GBOSVYvRNgplwb5pahCPkzyFtzDzZ4VHoSjXZ4tFz4seaHZAsjKJwWF0V4=
X-Gm-Gg: AZuq6aLhiS8SLMde7JU5c+8ptQTjZRjgDgZKfyvsvmGNafv4V96cnIYpTDD4wUeF8D/
 w6rORriGwDU4mI6s2L4+MksLStPgUfDhWXhJJgD4+LO6l7yJaAviGqpTuUi45NOPOAhoVQWpE5l
 Qo4nN6qQDHc/+Xsg1dUhxCzhZ0XPb4qZ7A2/3hKGMNY7Ct9F2byy1DC1GXB4zS3x6KM/qqlL4uR
 INIGnI7knwsXfaqet2Z4g7upqPlLjKRz4FxJjVwJNcSZ9pMWRqo3EwTNSh3EhvCDB0mUBATBd8n
 9GlybPtpMH4gONR80Tqno7c23hXaRhjSeCcaLfQzsS49rnUpoTVNDSbAkd9xMEtZlrm1T8K0NmE
 MKRnaTJZiM1nt4SbfJ4vWcprWlIXqR+GxIdI2h64twf/271zJdrbzD6HLHCzDzagK6w==
X-Received: by 2002:a05:600c:354f:b0:480:1c2f:b003 with SMTP id
 5b1f17b1804b1-48320212babmr159266195e9.20.1770744946922; 
 Tue, 10 Feb 2026 09:35:46 -0800 (PST)
Received: from localhost ([151.57.64.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d82a4afsm152981265e9.11.2026.02.10.09.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 09:35:46 -0800 (PST)
From: Francesco Lavra <flavra@baylibre.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/fb-helper: Fix clipping when damage area spans a single
 scanline
Date: Tue, 10 Feb 2026 18:35:45 +0100
Message-Id: <20260210173545.733937-1-flavra@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1396; i=flavra@baylibre.com;
 h=from:subject; bh=z4dx2Zvg10AKpT6f6N5qjQehok5RmqOeBKD3QGQMTmM=;
 b=owEB7QES/pANAwAKAe3xO3POlDZfAcsmYgBpi2whHYBnBnqArzUu3FQn39m2vsLxbxvPsTzdH
 6332iTgVYyJAbMEAAEKAB0WIQSGV4VPlTvcox7DFObt8TtzzpQ2XwUCaYtsIQAKCRDt8TtzzpQ2
 X7GYDACWV9qSaYXPkDT1eZhryqg4QDV3PJmeYs48hFuOY6KDW28cBihvLBXlPRr9BA916ik3dTO
 uWziBAnL9P7P5tSAdSPQqB37t9zbqQ2bcS6drIly0qFyww0mQUwgnEQXzdoRCq5IQCqpsFyY4He
 yx6Em52OgbzzUBDbL7iK39QHJp6feAjCkPO33Pys4Y2i0yjGCEaLChFNzYDDqmLNj0fTMjPee1a
 H2F4bcSZ2mLqceX2+nTlurgUgyJyRgKXruMAVkUOmHWtP8XvGdPjhb0avQXnTxyMZFhbn0/F8Qy
 ekL0IcFSsMB1RBWkC2CyCZSsaJe6eQ6DHlA37L1AlRrD8ltaIy1zYH6LJq2Rd2HJd9YZ89Ynyzk
 VAmjqAbw5pgqtYyV97Wjdsyh1xQnhsH7mk9dbVjlFhNNpW4NywctlhgFkATYyX2DfRd6xW3G3es
 09Nc6ZBOr9RzJem81iPR1m3xDe4bB02wqjIJlXT5b4hRxLK9S+f/WRmcsk2NnQbxgutCo=
X-Developer-Key: i=flavra@baylibre.com; a=openpgp;
 fpr=8657854F953BDCA31EC314E6EDF13B73CE94365F
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 11 Feb 2026 08:07:28 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[flavra@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:javierm@redhat.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,redhat.com,lists.freedesktop.org,vger.kernel.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[flavra@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,baylibre.com:mid,baylibre.com:email]
X-Rspamd-Queue-Id: 501341220DA
X-Rspamd-Action: no action

When the damage area resulting from a dirty memory range spans a single
scanline, the width of the rectangle is calculated dynamically because it
may not coincide with the framebuffer width.
If the dirty range ends exactly at the end of the scanline, the `bit_end`
variable is incorrectly assigned a 0 value, which results in a bogus clip
rectangle where the x2 coordinate is 0. This prevents the dirty scanline
from being flushed to the hardware.
Change the calculation of the `bit_end` value to fix the x2 coordinate
value in the above edge case.

Fixes: ded74cafeea9 ("drm/fb-helper: Clip damage area horizontally")
Signed-off-by: Francesco Lavra <flavra@baylibre.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 4b47aa0dab35..d545342d24b3 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -608,7 +608,7 @@ static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off,
 		 * the number of horizontal pixels that need an update.
 		 */
 		off_t bit_off = (off % line_length) * 8;
-		off_t bit_end = (end % line_length) * 8;
+		off_t bit_end = bit_off + len * 8;
 
 		x1 = bit_off / info->var.bits_per_pixel;
 		x2 = DIV_ROUND_UP(bit_end, info->var.bits_per_pixel);
-- 
2.39.5

