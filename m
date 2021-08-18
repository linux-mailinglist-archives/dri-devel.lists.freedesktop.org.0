Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BDA3EFACB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D776E3EF;
	Wed, 18 Aug 2021 06:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AA16E3E5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:05:57 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 j12-20020a17090aeb0c00b00179530520b3so8282367pjz.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xs7dVfyCL9iWYPvsRCT3aHsdLwLjC6pcEwrwKfCUWFg=;
 b=TEf6/TXCjpfGS9UXykN02SfNjHK5IVogzarwF+/pd4bie+1D+OFliU7/CvjJXmOFlP
 uID/DzUYWa+WnG85IGgCCCd0wZSjSbxIL9BjQiUelCHSaJE6ttcwL0indJBpV2UfG3XP
 /QuqoDZi2eevsoxzYvwIqa0mOMlVcx4djTE8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xs7dVfyCL9iWYPvsRCT3aHsdLwLjC6pcEwrwKfCUWFg=;
 b=GqV94jfmiVefHqiiaO3db1dloWB0oArr8u/vpRJ17+klYzmw4rN02zs4sZmjKpbyG/
 m3yafag1d8Jd9lZ4Fo2oL7AFcqn7/GbLt6hZbC20nwY4c7XLNlrBetmSzf3dH2DkahmA
 faiDJoZjXjeyIB0BCLa5nc+w+ttz+f8Wsykl0n9uX+u74lXSjazdqFWRzHIptEIf9YXc
 unipA9+bWPDkX62DXbJMPOWXmEwqeER+dIRwFcqcYZRasVi2G7yvPpX6pV9szXanAlWo
 mlkneeBkXncPny4GlWhoFD0qYyl/J0y3hLi/+pFDegx9NxnHZ0P1AQW+K0K6e2vTpV/4
 EqYw==
X-Gm-Message-State: AOAM5334FZyJQ7uzd68ZXBRdgY/Enk8WsXmt9l+cLb//DqeFPiYW4ij8
 AQzofbgA/WxbuzOm5rDPQ9rS+A==
X-Google-Smtp-Source: ABdhPJwTi1V24180jdpxp0J/irIQkuTbyz9wEdSSc+XtZLCOmtidlizMdtS+gLzb5nX5T1PtO2A5EA==
X-Received: by 2002:a17:90a:b105:: with SMTP id
 z5mr7594033pjq.64.1629266756958; 
 Tue, 17 Aug 2021 23:05:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id p3sm4750151pfw.152.2021.08.17.23.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:05:53 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
 Lennert Buytenhek <buytenh@wantstofly.org>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, wengjianfeng <wengjianfeng@yulong.com>,
 Lv Yunlong <lyl2019@mail.ustc.edu.cn>, Arnd Bergmann <arnd@arndb.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Allen Pais <allen.lkml@gmail.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 09/63] mwl8k: Use struct_group() for memcpy() region
Date: Tue, 17 Aug 2021 23:04:39 -0700
Message-Id: <20210818060533.3569517-10-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241; h=from:subject;
 bh=L38tHT7L5gwWnZoNqjA8WBUp8uc/YzLDlgGZNE5EF7Q=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMfQHi0c/KxdlPcXJ7NIKNf3opHAze8JHRqvZJ2
 HTMb8o6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjHwAKCRCJcvTf3G3AJsndEA
 CTyr1mrRcwMNsVqnkQNKyL2vXGiaBP+O8ZL2ZnJYif0LzQ9SgU1FelufoxGIaesSZHEE5SPnP0Tfsl
 9KJcO93AOrsZEpzIQ8drNeTOQ3lBvwG90XmnGMgbxprrjE8LUpiZhRSW7YHRT+D5AU2QRUIx8NWfMb
 abbVbTWbLt5ToBy6dxfb2m/nwWj7/j+KLjUYb1o6S/Gdh3F7rPGoJGPUhDvpfJ4ZEJwHG8eXPqBIpG
 6H1pdmsRypyZ7TWzR8qZ303ptNMXJOIqxpJWH0oX46+I8DMTK3djo8qRqPMyrocaXaHH97cU/N6f16
 CCjZgAxDqMhwoQxDT15ELj9UhtbUR98KcbTKZ65LXcHTIb3hN0+1HQUic3J6laKt3yYRNVzKQv1d94
 GldIV0iCJHVvpmLzhBYcaR+nfF+YtoIRRyh4PmHtkSgG8lcV6ALD1vQy9CkCCEzg68xUrtLP0TMdv1
 bWkRRkd8XAjLuvASWkcKkp9OxA+Nu75+d0Gdk0vAppy3FJjK3KNlSSfI+Y2g0bi0Uli2M6Pcacs1IJ
 1sepRhmyuFQR4lAMVe+6LiCvvzcOSoJKRi+SJnYEddKohZIZQqqNSVghz/13aPpi9uItW/cfE4MMXK
 I7/jg0JFYnqdJT3/iN+fC7P2L4x21xvDExvG1DjqZQouQihAaONHkkxoYo0A==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields.

Use struct_group() in struct mwl8k_cmd_set_key around members
key_material, tkip_tx_mic_key, and tkip_rx_mic_key so they can be
referenced together. This will allow memcpy() and sizeof() to more easily
reason about sizes, improve readability, and avoid future warnings about
writing beyond the end of key_material.

"pahole" shows no size nor member offset changes to struct
mwl8k_cmd_set_key. "objdump -d" shows no object code changes.

Cc: Lennert Buytenhek <buytenh@wantstofly.org>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: wengjianfeng <wengjianfeng@yulong.com>
Cc: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Allen Pais <allen.lkml@gmail.com>
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/marvell/mwl8k.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwl8k.c b/drivers/net/wireless/marvell/mwl8k.c
index 3bf6571f4149..a29277d5f9da 100644
--- a/drivers/net/wireless/marvell/mwl8k.c
+++ b/drivers/net/wireless/marvell/mwl8k.c
@@ -4225,9 +4225,11 @@ struct mwl8k_cmd_set_key {
 	__le32 key_info;
 	__le32 key_id;
 	__le16 key_len;
-	__u8 key_material[MAX_ENCR_KEY_LENGTH];
-	__u8 tkip_tx_mic_key[MIC_KEY_LENGTH];
-	__u8 tkip_rx_mic_key[MIC_KEY_LENGTH];
+	struct {
+			__u8 key_material[MAX_ENCR_KEY_LENGTH];
+			__u8 tkip_tx_mic_key[MIC_KEY_LENGTH];
+			__u8 tkip_rx_mic_key[MIC_KEY_LENGTH];
+	} tkip;
 	__le16 tkip_rsc_low;
 	__le32 tkip_rsc_high;
 	__le16 tkip_tsc_low;
@@ -4375,7 +4377,7 @@ static int mwl8k_cmd_encryption_set_key(struct ieee80211_hw *hw,
 		goto done;
 	}
 
-	memcpy(cmd->key_material, key->key, keymlen);
+	memcpy(&cmd->tkip, key->key, keymlen);
 	cmd->action = cpu_to_le32(action);
 
 	rc = mwl8k_post_pervif_cmd(hw, vif, &cmd->header);
-- 
2.30.2

