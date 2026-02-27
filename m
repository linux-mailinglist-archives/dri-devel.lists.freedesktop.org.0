Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKXIAuYOoWknqAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 04:26:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E8C1B23D5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 04:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB00D10EA2A;
	Fri, 27 Feb 2026 03:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TJcv1ffc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8AA10EA2A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 03:26:26 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-3562212b427so672982a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 19:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772162785; x=1772767585; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3SNYtFmJqSV95moRlaJ0QYmUhL+TICukmgmBhi3zA4c=;
 b=TJcv1ffcN5ctzRZjic5ylG6zsaL07rjZ5kheQRRGqkjicD/BMGcDlHdG+obrzQHnQB
 rOqL+ciP5KiE5LqmFaiW0QdVFNTInHT3zzIpyyVnXDXm+j0fIRded3xN/YCzVr1fducw
 CGcOhosV4MpmERW17MD13LfW5bVEbyDCq0S/Y2kd2HeeLF61og04rk8BrjpGMCYLgR0A
 RtqMyMbDBwdak9rTweyQTzI9RylWbVCylQCDA94eYNQEl3X8M04FQPnCBs19YEr027VV
 z+3hncVAGV7veU0AALqlx7EQA75w/23h5GpwaLULDt6DIjbm9LU5shCzOCW9Smga/BsK
 NE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772162785; x=1772767585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3SNYtFmJqSV95moRlaJ0QYmUhL+TICukmgmBhi3zA4c=;
 b=BiqEvVf3y7vdMpvolNRkCVyB6csfhABE35My0Jmp0x+tL8/EVEMz6DqnA90lO+2uAm
 L3htxf1aQ3VGqHhZVcmHRdq58a/zfejX2ImqoQYvuT8igtGS0oDuC6ZhNExjaSNPXk/b
 SZlKK9Qvo02A/C3nGWfMbhGjkIX3p8zfyS3sWTzzYnREOqc7+LoS4KGNthLlpB/c+wPE
 s/D6l68Nb6mvpxVFn6mQOvkcwdF5pLRiZqQIhARUROLo3xtV2QNRAZytA/Z8yb2RvBJJ
 ek+UzsuhIDkfkIxbqoNBDImGMrnv5G+UdpxWUwsyMEkZbr4rHEW22gVHkHQhhLgMCXx+
 f4Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKhnDcKw1X1KFHZpkFqeI9GxrIM4rR0eLChhMx3HYVcizFWhOpNRUafjDasOBPIQbQWcSUPJReVM4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5y0c82zJZHTkN1ibKAKTPoWuWhB9LkDKBD9fubYI2pRDAjDAf
 Fs0u60NPjHHuE8QijNVqGHfDWxn4Dp38uOkWFRp8UQwKP1BRysWT0Q8W
X-Gm-Gg: ATEYQzy/AZ1jWRo7J/MS0CbbbsCN/9xHIi9iX9oAPv0K1OKFMrxGE9iGU7kzJWMwHPx
 mwcR2LnUWRQjqz8ganUEUDzCG6oGmzRgwZdBEFqt31nbOAjNbHMpJLO5JkaIKMugBHLtRtlFLCV
 k5CSNCTjOgxGyLBb2F6JCGbEIGuqhvzJx5kxlW1nG806FGmliQiXqcAz2ZxxgElObZEueg/Hw60
 mnvbYcuYulI2/vZNGx/fUzOUnooLtRSjFmbAQSr5PttEau6lx8UoIWs88uebNYjrMIKsd8bugUm
 vtiLHcXsl6ZSy3cTQEuMGzRKz7N55M7ZxlYFiwT4cstW4KegOemnZOjP+gAyNi/5zsMB2FqQCk/
 K7LFuhL58eI6nClTsZCysm9zDfYus7AQOLo9zPeNu1pn2QvhOPTGchhEj9xURNqa776Vh2BJusU
 zTZQCZ7YOwaVOVZyI7NwAoD4zAN8jdlit6FSlAcIZjhuTmee+v2w==
X-Received: by 2002:a17:90b:3dc7:b0:359:28b9:5f64 with SMTP id
 98e67ed59e1d1-35965c17095mr1275630a91.6.1772162785515; 
 Thu, 26 Feb 2026 19:26:25 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35912fbc363sm4501887a91.2.2026.02.26.19.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 19:26:25 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 6.12.y 2/3] drm/exynos: vidi: fix to avoid directly
 dereferencing user pointer
Date: Fri, 27 Feb 2026 12:26:14 +0900
Message-Id: <20260227032615.108139-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227032615.108139-1-aha310510@gmail.com>
References: <20260227032615.108139-1-aha310510@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,samsung.com,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:gregkh@linuxfoundation.org,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aha310510@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email]
X-Rspamd-Queue-Id: 91E8C1B23D5
X-Rspamd-Action: no action

[ Upstream commit d4c98c077c7fb2dfdece7d605e694b5ea2665085 ]

In vidi_connection_ioctl(), vidi->edid(user pointer) is directly
dereferenced in the kernel.

This allows arbitrary kernel memory access from the user space, so instead
of directly accessing the user pointer in the kernel, we should modify it
to copy edid to kernel memory using copy_from_user() and use it.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 1fe297d512e7..601406b640c7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -251,13 +251,27 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 
 	if (vidi->connection) {
 		const struct drm_edid *drm_edid;
-		const struct edid *raw_edid;
+		const void __user *edid_userptr = u64_to_user_ptr(vidi->edid);
+		void *edid_buf;
+		struct edid hdr;
 		size_t size;
 
-		raw_edid = (const struct edid *)(unsigned long)vidi->edid;
-		size = (raw_edid->extensions + 1) * EDID_LENGTH;
+		if (copy_from_user(&hdr, edid_userptr, sizeof(hdr)))
+			return -EFAULT;
 
-		drm_edid = drm_edid_alloc(raw_edid, size);
+		size = (hdr.extensions + 1) * EDID_LENGTH;
+
+		edid_buf = kmalloc(size, GFP_KERNEL);
+		if (!edid_buf)
+			return -ENOMEM;
+
+		if (copy_from_user(edid_buf, edid_userptr, size)) {
+			kfree(edid_buf);
+			return -EFAULT;
+		}
+
+		drm_edid = drm_edid_alloc(edid_buf, size);
+		kfree(edid_buf);
 		if (!drm_edid)
 			return -ENOMEM;
 
--
