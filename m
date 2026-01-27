Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Gl9EoISeWktvAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 20:31:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BB899E1B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 20:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F8710E0F7;
	Tue, 27 Jan 2026 19:31:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AOWoXjxs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33DB10E0F7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 19:31:09 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47ee807a4c5so63401635e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 11:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769542268; x=1770147068; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=sMwtm90/syzq9VdHssr2kJ43f/6cM72Zzm4oH5359UU=;
 b=AOWoXjxsG0i19mSJS56Ua1QbaQudmn5W8Pvv2FcNNe6IBVZLTu8O+5x1XqBQwKJntj
 k1EGbmcvCQwZxHHFi7p4HK0feHbJzInyW/24yudzxTQ8MkN38DqslMIUnU+8j1RFKoye
 YfFJ9BzCYqU+OqHMlIqfFeLdzIRFwC/bOQ/8NudEBRYyEngfCMY2N32kTUUACap/MPMP
 9HMzr8Jp/MOgHLUV3ajXbtMnsZ8kZorhEtQKsEgqqGLBtcAmSu5hUdCWB5lsdHz0Yo4g
 z05uEs7ctJNpK/SMWxewrSBUtkYhems6rBP83X8n+Ei/mheG/rRBkMi68xvpLuEJPQ22
 jnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769542268; x=1770147068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sMwtm90/syzq9VdHssr2kJ43f/6cM72Zzm4oH5359UU=;
 b=g/GDhOVmvgBS9Oep3BlxwC4JWcpWZGJEFPY7gsKI9xYWmRhR/gdJO5DppbtwfHpsjb
 G2i3KJtHLaaooMADxpJjGQXgLaKgFWEIxfbZTSb+1prelWsw8V9J8vITL94jSPS9M9gH
 aZNh+wbp7zGK25Bo2mrYwoyyru4+cBy6oUG+fvR+vd34JhZwh7rmoEbRPCZ0MNh5st21
 Dl/v5pORxL9VAoKNNnliBzKj5x+xlrSqd+sx5U0V34XYBZJThAduSK8hsUd2p6lsPBPa
 xnKOxgdxi0PLww+CuG1SpSGGlKtYV3y+9zXLDKUUUI9XFAbX6EdfsMjmezG6uIG4Tx6D
 HmQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxx1jH2Tlzi75pjmfTISikrvwcIiGprMOtiJ5Ky6S5obgszduLZ381Y+OTp5gU+u20y+NFyB/G7kc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1bdU6QoHofQ8cI1L3JvxjvD+dD/d1kl8eAxovHLabvXJfcRIt
 6OIVuSkJhOg3nWTtQyyAOI0Bdf3LztV6kAWx6mJOsi7tVGhtVLbQrvSD
X-Gm-Gg: AZuq6aLWziZrWHIW65iRwE66alSCkj69hqSu+gU6Dl7C+YLwucJbbVxMlcwCnTEOK64
 0OPumZKxMGqVDAw+4plC64FS4CpLlO2jMUoZ3Pj7+rXOJYm9pIPc3Iv1c0vOm3bVmUfYrBNocqo
 1SqFnfKCFtadkDDL2Ig85hg2HGI7iFVB0L/D+lPUZNsLA4Sfqs28l2ycbYLQZ9sxEB8JsuC19df
 kKQMdmfgtaz073p3D86O1qvLACTpi9/YZOTxlXKqe0fH/p53VeAaAjdoPwg22QsIy9+bcz8P3+2
 gjE0d+yTL8QlZ/PqKfHyjsWiH5EXN9kuU4YBjDPj7NdcrJv/XVdr78cHAMjCmczL63Adyg7Vwfm
 btIo/n1BwDbaN0oejbLZz7TA+0ACf2LhIF0TKZ6Zw4wabk/3xCm8iWGKbrSXtRZbyMtEPrKPjcV
 sV0C9QDXN5waPsImGQqa2ljIhFVT1aJaxOgcAFcX5Clw==
X-Received: by 2002:a05:600c:a47:b0:477:a219:cdb7 with SMTP id
 5b1f17b1804b1-48069b9b106mr34078175e9.0.1769542267818; 
 Tue, 27 Jan 2026 11:31:07 -0800 (PST)
Received: from osama.. ([41.37.41.91]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cdeafffsm12014625e9.7.2026.01.27.11.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 11:31:07 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
 Murad Masimov <m.masimov@mt-integration.ru>,
 Osama Abdelkader <osama.abdelkader@gmail.com>,
 Yongzhen Zhang <zhangyongzhen@kylinos.cn>,
 Quanmin Yan <yanquanmin1@huawei.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: fix fb_pad_unaligned_buffer mask
Date: Tue, 27 Jan 2026 20:30:55 +0100
Message-ID: <20260127193101.12343-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:simona@ffwll.ch,m:deller@gmx.de,m:tzimmermann@suse.de,m:lee@kernel.org,m:m.masimov@mt-integration.ru,m:osama.abdelkader@gmail.com,m:zhangyongzhen@kylinos.cn,m:yanquanmin1@huawei.com,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:osamaabdelkader@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[osamaabdelkader@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[ffwll.ch,gmx.de,suse.de,kernel.org,mt-integration.ru,gmail.com,kylinos.cn,huawei.com,vger.kernel.org,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[osamaabdelkader@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C8BB899E1B
X-Rspamd-Action: no action

mask is u8, so it should use 0xff instead of 0xfff
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/video/fbdev/core/fbmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index eff757ebbed1..cf199038f069 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -100,7 +100,7 @@ EXPORT_SYMBOL(fb_pad_aligned_buffer);
 void fb_pad_unaligned_buffer(u8 *dst, u32 d_pitch, u8 *src, u32 idx, u32 height,
 				u32 shift_high, u32 shift_low, u32 mod)
 {
-	u8 mask = (u8) (0xfff << shift_high), tmp;
+	u8 mask = (u8) (0xff << shift_high), tmp;
 	int i, j;
 
 	for (i = height; i--; ) {
-- 
2.43.0

