Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E933946B1
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 19:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B366F603;
	Fri, 28 May 2021 17:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A838D6F603
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 17:54:06 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id s4so1960064plg.12
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 10:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ANKlONzWohdov+6WuLPhtLq95Lmabba/pjDXictlH4k=;
 b=mByhbx9uR7qw3+5csFqtiBmrny5PUErxiaumYIELRBs8Ijs/xcNtiUowTW2QHmGhSS
 cI906VAtactPrTU8A5fjRUAOM3qGcxGnnCAZif3JnDahkLLSXlaD6hYXARYKqVrgOcdj
 leokyJOXneOJp2VKYjLGXrQaxUHzBF7YT+bGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ANKlONzWohdov+6WuLPhtLq95Lmabba/pjDXictlH4k=;
 b=spQ8jgGr+wsEcqt+0YxmAGljKSMAR2TzmhxUJyyxoZEiE/wwqXt8n6KEuvP1oo+a51
 icGvRTkWe7ildXv9Sfe03/nMJxyKGfVEwb9SxM8Y0sAYA8KfyEmM2FnH6NzMcMJgFOpG
 XKHwsN/Kmu6TGexqTnADrltju1Zn8PFRU87MES+ZccfWQVsjgPYZ2TiBA2v7hcydOHS4
 bcOg+VlydyVDOXbx3DFlZMoBEWvYSoNWWawIzn28RxYhDiTZ03iFK+fQg6J6r6HMcVNZ
 ZT11bmQO1zwu7mHHDMhf1jCHcA/kS79atxC/BraKu+uY+Vrg4cBmm7QA0u2l3xcCj/mI
 lz4g==
X-Gm-Message-State: AOAM533jkHvH7en25iWQsV8BK1uQnDM/h3ADLvcQ6+QKUr2J5GzeV8GA
 LnrXFiZ8cg21N4qq8z7bd/jTuQ==
X-Google-Smtp-Source: ABdhPJxV6f94zLFz54LqBFWRmHCGWw+arAdFtXMyPPRV1EjRN1cZPZzO5qd5b8pWXki+rqrAZBOCqA==
X-Received: by 2002:a17:90a:aa96:: with SMTP id
 l22mr5626405pjq.173.1622224446120; 
 Fri, 28 May 2021 10:54:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z5sm3292699pfb.114.2021.05.28.10.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 10:54:05 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/amd/display: Avoid HDCP over-read and corruption
Date: Fri, 28 May 2021 10:53:54 -0700
Message-Id: <20210528175354.790719-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; g=4cf2a0636c89416b735d9eedea1837894110975d;
 i=GPlLtkYl4Vl/u1+SgJBiTZwrwkUA3g5q8nhHlBK0VMY=;
 m=/B+IjR5hEpc1KZKXt3rRQHZHXjtNP00Y56rODzGI5ak=;
 p=3dO8lx4rI19NbM9CeLbNSicq/6IC+kqbqEuhiYMdAzI=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmCxLjIACgkQiXL039xtwCa1kA//VV0
 eUIrl0DGPwzFYYACM0z9ElR4Sni6kHJQADmYI0oV5GXqxqVYMpTOwMjuLPhiZb5RDObC+tyj9MgKv
 GYhx8bIT2X7tztY4aHUpJ0HfPt+sjSzOMvgkLb0F7SOpSxgYp4AJ+aMRp5NUYpcTAZnOKN4k3J1/h
 ojMvo9Y3WX7DIw00WJC6CkgAdNxYretO1gpNmTRnW89KAHaQEpdn9LECYebozdVB122FFCH0qBnre
 5g5wbM2tAH8O3n4alGiQyEbJa16AdWazV8DBYP5YvrDc4dQnMtM1UXXE9K4ZuZPBokx93Av+jfJX6
 N6xrqXcuspSluMjJxe89+6CwyIqrhVWpEFmjtPaPVVDamEYmIYIX4TwahDu93x5Dvb2mP7tSMsRkx
 wmjZw/rRcxlkeBYHJKekTmYsZepdREXApoxWTAtbHU4eoQkU7nfUwo3Nl1s7SaKHVQcLSGCAZPGUW
 I95pVsNvURFGjSoSoH7rKGZnENTPIRnNadOpwYwigFku5mSKE+P5jflW2UzmUxPIHPH/4ABZ1GVLS
 KqooaDCaBF2czw5/41fq3U/e9Pf+lhbxe+IbHd8+lf9iQC7AHePUogh5hWgrALi8JUqKBX/Nz8wDn
 j2v2QxS+8Q+4Hp0egW8y3Sl12DkukVrhY5EDXYZKy0KgS7HgBmJCE9Z1qF1OpDoc=
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
Cc: Martin Tsai <martin.tsai@amd.com>, Kees Cook <keescook@chromium.org>,
 Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 Wenjing Liu <wenjing.liu@amd.com>, Anson Jacob <Anson.Jacob@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Wheeler <daniel.wheeler@amd.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Bindu Ramamurthy <bindu.r@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of reading the desired 5 bytes of the actual target field,
the code was reading 8. This could result in a corrupted value if the
trailing 3 bytes were non-zero, so instead use an appropriately sized
and zero-initialized bounce buffer, and read only 5 bytes before casting
to u64.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
index 2cbd931363bd..6d26d9c63ab2 100644
--- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
+++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp1_execution.c
@@ -29,8 +29,10 @@ static inline enum mod_hdcp_status validate_bksv(struct mod_hdcp *hdcp)
 {
 	uint64_t n = 0;
 	uint8_t count = 0;
+	u8 bksv[sizeof(n)] = { };
 
-	memcpy(&n, hdcp->auth.msg.hdcp1.bksv, sizeof(uint64_t));
+	memcpy(bksv, hdcp->auth.msg.hdcp1.bksv, sizeof(hdcp->auth.msg.hdcp1.bksv));
+	n = *(uint64_t *)bksv;
 
 	while (n) {
 		count++;
-- 
2.25.1

