Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHOcJKwsoWk/qwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 06:33:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438E11B2E33
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 06:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F8A10E61C;
	Fri, 27 Feb 2026 05:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LdMjgSzN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC39710E61B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 05:33:27 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-82746ed8cb1so607316b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 21:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772170407; x=1772775207; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TqIhYcF+CYSjiR8zV9a6G8BIYgFMg1pnmFFZ2FA8I4I=;
 b=LdMjgSzNOX4UEON2zgUBOC5FmQ2yrul5nFoRd2TUdM9XZRZ4mmPhNXhyCJEN7B8Z4o
 TH4VncLZxX8sM3P2p8oQpJoVgHNv7pwld6zmPfsWP31h1z/y//oKtXDulGjoqWSIbKcM
 kx95erD+cAJGOG9/3SaJ9VxsGzW/QdmSNqI2Zj/Df/ECrrT+nxrBY9x+jpunou/uRPLo
 sqNCMg+eW6JZtYCCVtf8fnqQC2zJRccM64hWWIBLxfcImtrHJMUCx/brzard3pcornhc
 7ihI59N05B/zOJxYOFh9j5pPFkDYByKxiYuqKIYKQFwgJOhUd5ol13T3rrI/VE+jjaY7
 +Zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772170407; x=1772775207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TqIhYcF+CYSjiR8zV9a6G8BIYgFMg1pnmFFZ2FA8I4I=;
 b=ImODdiSbwhyFVaIqSh/F6q+CMCo8+iJ5aEs7F5guHLrv14vzURd0aDEmduw+ZFYy4f
 fg7iKWU1Tgy67qE8iNm/bVN7ilOFJPuvUpSjVsDNh0Kfaj/YarxooOZIcx0SSjNy6ZfZ
 DCS/ngbhuzUiGIWbzpmaAlI3bdRmxZl6HcNSf9WgKcwPv2UkcBdm3c2BU/s4luFmouVb
 qBRo88HK3dWKRBFjSVfiClDT+dHBYmhxWdeGo8qsNhEQW+NLxTUWLSFaz6izKhZR+7f3
 kr6EXg0virWLuDIJhwnUIA7uWxTLFh9s77G5VaLCW98USZaCWQ1URHJZXwPF07mCWx+P
 nK1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwdmfFbr6KBc1P8KX21Tt8WHOBnXvmcy+evrm/Xf7TGa9CC+2mSSspPBvYIcBUwKpVQR/cKc0P1y4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4HJ4inm0FIx2a6Cr2XL+uI4eEUc42VJotl+jjsXSfNWmDUPh6
 i3kL2PIy2c0+XFfYp3Za5hzEg8F+432+PIpOKPbP2mugmK16+NB4Hxyh
X-Gm-Gg: ATEYQzxVE5/SUMvuXhqQFmauZJ0mAK+FxOsoZBMtGnzrIHp6qwZXBDtx5JIf5dZMWYx
 PGnna+OG6bY2j2fTy9bUU0Df7MNMTvEIZN8N6StEurZikdm00ljfBuV7pMNUHog0vjYL6N+7FI+
 JcXfnwg6gwQ1nJrBO1LMeGp9vmKx5KD4BFDrd3X3LaF9W9sit42t5G0KuIqr3T+l49339pE9xUM
 FFGy9H4PloOyfsojc/A5jcAiOxc4j25h03jlhCQJU608gYp77KTAwqc9I6h12Srt42+6oiyIhSV
 2sa5DuursIyjAiUn7BpWC3LrXviZJEQeozfCUHCZRjpkjCC3dk1k0Th4aWH4vWbb5g4F7P94xSy
 pVGerhu7HE7vBRyppV8Scgdcy9k5i2N/pIMXbwWQhf3xVdakrSwEFBqH3MiKIdFAt3yJbx3wayh
 AZlIzSlXy9JqdeD5iOwdz9mOrjwxMR4GTrNXm7HbUPh+v4c7biIg==
X-Received: by 2002:a05:6a00:94c4:b0:823:c59:9cb0 with SMTP id
 d2e1a72fcca58-8274d93b0b2mr1369523b3a.1.1772170407236; 
 Thu, 26 Feb 2026 21:33:27 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8273a048615sm3815828b3a.52.2026.02.26.21.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 21:33:26 -0800 (PST)
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
Subject: [PATCH 6.1.y 5.15.y 5.10.y 2/3] drm/exynos: vidi: fix to avoid
 directly dereferencing user pointer
Date: Fri, 27 Feb 2026 14:33:16 +0900
Message-Id: <20260227053317.426000-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227053317.426000-1-aha310510@gmail.com>
References: <20260227053317.426000-1-aha310510@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 438E11B2E33
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
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index d0e394397eca..576d79ebe9a8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -252,19 +252,26 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 
 	if (vidi->connection) {
 		struct edid *raw_edid;
+		struct edid edid_buf;
+		void *edid_userptr = u64_to_user_ptr(vidi->edid);
 
-		raw_edid = (struct edid *)(unsigned long)vidi->edid;
-		if (!drm_edid_is_valid(raw_edid)) {
+		if (copy_from_user(&edid_buf, edid_userptr, sizeof(struct edid)))
+			return -EFAULT;
+
+		if (!drm_edid_is_valid(&edid_buf)) {
 			DRM_DEV_DEBUG_KMS(ctx->dev,
 					  "edid data is invalid.\n");
 			return -EINVAL;
 		}
-		ctx->raw_edid = drm_edid_duplicate(raw_edid);
-		if (!ctx->raw_edid) {
+
+		raw_edid = drm_edid_duplicate(&edid_buf);
+
+		if (!raw_edid) {
 			DRM_DEV_DEBUG_KMS(ctx->dev,
 					  "failed to allocate raw_edid.\n");
 			return -ENOMEM;
 		}
+		ctx->raw_edid = raw_edid;
 	} else {
 		/*
 		 * with connection = 0, free raw_edid
--
