Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD393D7FBE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 22:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93AF6E7D0;
	Tue, 27 Jul 2021 20:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D106E7DC
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 20:59:08 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id t21so17526596plr.13
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hAtUXOqdIbIKgIXF67i6edRxNnI31C05ADltnD47YVA=;
 b=KjyaAeWacqkMvH9zZm+BBzMkjACC5HUxdXv9tgcqmihQriCrMtd/DFnnW7F/YrD/ZY
 Ukevt5iMkwkus4GIj0BPscD7xfNb9o1NPLdX8zvYUy6Vws2evRXwUJ9SqM3iq4seKTMQ
 0scT3SXeeEgeJXutbDZfzTUKfHAc3euSilyDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hAtUXOqdIbIKgIXF67i6edRxNnI31C05ADltnD47YVA=;
 b=FjOWiD9WWX5dmcnOOx4UIbyChF+hsLg3f2Qrm79EYKMkLkzkzXMpKplV7N6vxUoW/m
 WejOtIjL4sdUc1TAXfkJ6n68l6bqSdKcEz5NcPzAREw9O0XZKUcld9K9XsJgzXosJWak
 f0mp/wMJKleLg5IDv7q1zJZEqwKGfTPtHw66AnAU3sAx93Bdu/srZrHzhgMWhkno+M5G
 vgsp1xW6kBqUhQzzmPK44Sl0HYSu3jYpJDzhiEMghyHm5R24DqNQsr93a9bwjAhLEMkg
 THU18l0B6ErSOQETRZwqC9qcoWZacaGRxqN9Gtea+slkz/pmXLV8aniKM3bvVtsfYxB1
 911w==
X-Gm-Message-State: AOAM533cYhpsn1h6gPGsO+fGuIaT9kg7xqzUm/SzMjvqpEJgdEJy+IZ+
 yQ+QGM/4B/34Hp+35Sev1XqE9A==
X-Google-Smtp-Source: ABdhPJwKVVacR07W565BalKjkQLpWp2QT/TsDZexTOWZktzaVimKCn1vRk5Czb/MD//fHQXIbyCEWw==
X-Received: by 2002:a17:90b:3581:: with SMTP id
 mm1mr5913025pjb.98.1627419548265; 
 Tue, 27 Jul 2021 13:59:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a23sm4591110pff.43.2021.07.27.13.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 13:59:05 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 10/64] lib80211: Use struct_group() for memcpy() region
Date: Tue, 27 Jul 2021 13:58:01 -0700
Message-Id: <20210727205855.411487-11-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3842; h=from:subject;
 bh=LxMwWIiVXxCqRjC5BkCQhCAsNp5uK9myZ2a4Qy1ipzQ=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOCS1cmBCRtXI7M3opQcsNvUfw7QHdDVtTF33mg
 z+crDrWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzggAKCRCJcvTf3G3AJn8DD/
 0T8GLHAQTW4lQjhfBYcVN4KkQX84OyCKR/kM+6CyPh6kkSz3omcb5syI1kQjZZfi9AQMmXGm27pqXs
 Pfzoata/9c4TApOgEv263SYMjRV3AKeFaFCN+M+Tbki7UCpUotJm9dnRg/YZOUqcEJ2jnQpyukE/h5
 WjTdoxGr75vnhyjqxtCW3aafwRG0iXBck5QQofWTgn8C998AMoFRs6Tj6WLGt00Byih284TbE5zULP
 NoahBowuHSS4qSopyrtMF5eCvftM06BTwO2pAHfSDoGwCRneDXaPTK82hxwFjKQowdrTh4iICk8J6z
 Jh8Cy9g9/qrCwlclWJxjLE11hOD2f4KFeZpANKSuUdLgh2gQH0XSCj9eew20UORocfAqHkT/RzbRTF
 SJY0WkjJuqFW0W0eO4eaZyUsWJHuNBEL3OEenTA/cKGL5oil0bnf+evfjR6n7xJYUez++9bbUL8NyK
 mwpGoz6NjtaMd6T6SdpdeK3SjBHnQVR7cnuN787a4kSO0UGQ/qiXd510dvC35+ROc9KccdBJQ9O8UG
 j59WtvEuYIf3wGvX7Gxat7V2DjodwzEvDiy+CyhMLXhp2kdRYaftK+hlMfdh3hvdX9HK1wsHqnZZNW
 2jIB6Lm8e5R4+zKVC9MC8ZxvWDlXi8uYXm03gL2lKA5E1/cQXWrwqyFnfZrw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, netdev@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields.

Use struct_group() around members addr1, addr2, and addr3 in struct
ieee80211_hdr so they can be referenced together. This will allow memcpy()
and sizeof() to more easily reason about sizes, improve readability,
and avoid future warnings about writing beyond the end of addr1.

"pahole" shows no size nor member offset changes to struct ieee80211_hdr.
"objdump -d" shows no meaningful object code changes (i.e. only source
line number induced differences and optimizations).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 5 +++--
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 5 +++--
 include/linux/ieee80211.h                     | 8 +++++---
 net/wireless/lib80211_crypt_ccmp.c            | 3 ++-
 4 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index a99f439328f1..be7cf42855a1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1421,8 +1421,9 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 		ClearRetry(BIP_AAD);
 		ClearPwrMgt(BIP_AAD);
 		ClearMData(BIP_AAD);
-		/* conscruct AAD, copy address 1 to address 3 */
-		memcpy(BIP_AAD+2, pwlanhdr->addr1, 18);
+		/* conscruct AAD, copy address 1 through address 3 */
+		BUILD_BUG_ON(sizeof(pwlanhdr->addrs) != 3 * ETH_ALEN);
+		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, 3 * ETH_ALEN);
 
 		if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
 			, BIP_AAD, ori_len, mic))
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 79e4d7df1ef5..cb47db784130 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1198,8 +1198,9 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 		ClearRetry(BIP_AAD);
 		ClearPwrMgt(BIP_AAD);
 		ClearMData(BIP_AAD);
-		/* conscruct AAD, copy address 1 to address 3 */
-		memcpy(BIP_AAD+2, pwlanhdr->addr1, 18);
+		/* conscruct AAD, copy address 1 through address 3 */
+		BUILD_BUG_ON(sizeof(pwlanhdr->addrs) != 3 * ETH_ALEN);
+		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, 3 * ETH_ALEN);
 		/* copy management fram body */
 		memcpy(BIP_AAD+BIP_AAD_SIZE, MGMT_body, frame_body_len);
 		/* calculate mic */
diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index a6730072d13a..d7932b520aaf 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -297,9 +297,11 @@ static inline u16 ieee80211_sn_sub(u16 sn1, u16 sn2)
 struct ieee80211_hdr {
 	__le16 frame_control;
 	__le16 duration_id;
-	u8 addr1[ETH_ALEN];
-	u8 addr2[ETH_ALEN];
-	u8 addr3[ETH_ALEN];
+	struct_group(addrs,
+		u8 addr1[ETH_ALEN];
+		u8 addr2[ETH_ALEN];
+		u8 addr3[ETH_ALEN];
+	);
 	__le16 seq_ctrl;
 	u8 addr4[ETH_ALEN];
 } __packed __aligned(2);
diff --git a/net/wireless/lib80211_crypt_ccmp.c b/net/wireless/lib80211_crypt_ccmp.c
index 6a5f08f7491e..21d7c39bb394 100644
--- a/net/wireless/lib80211_crypt_ccmp.c
+++ b/net/wireless/lib80211_crypt_ccmp.c
@@ -136,7 +136,8 @@ static int ccmp_init_iv_and_aad(const struct ieee80211_hdr *hdr,
 	pos = (u8 *) hdr;
 	aad[0] = pos[0] & 0x8f;
 	aad[1] = pos[1] & 0xc7;
-	memcpy(aad + 2, hdr->addr1, 3 * ETH_ALEN);
+	BUILD_BUG_ON(sizeof(hdr->addrs) != 3 * ETH_ALEN);
+	memcpy(aad + 2, &hdr->addrs, ETH_ALEN);
 	pos = (u8 *) & hdr->seq_ctrl;
 	aad[20] = pos[0] & 0x0f;
 	aad[21] = 0;		/* all bits masked */
-- 
2.30.2

