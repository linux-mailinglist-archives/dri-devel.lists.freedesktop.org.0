Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF313EFB96
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 08:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88E56E41B;
	Wed, 18 Aug 2021 06:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B1F6E40D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:14:15 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id w8so1162593pgf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 23:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f4O3R9w7Wsb1EUzo8wW0sX+4sR/BMGAQ/Nfx2MpJI38=;
 b=LYUO69wYAGl48pxViZuNMfgY0F9cuDlQY6nCQU/3p+8l2QtHc07flb9OraE46ZvIBx
 /xBG0BtrkwLHkotiYNUI/6fqla0cTVbsww7aEsuk4+Nngwd3P/pQjUKOvhuCMN7+yAE+
 Jw6YFeg29gPpHQCtelCih+4VXzxZFuDljGQ8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f4O3R9w7Wsb1EUzo8wW0sX+4sR/BMGAQ/Nfx2MpJI38=;
 b=aWrVR0+EhGROC4s3pbz3J+nRAl3Sg6/xIF6L/8zFrAAwEhagSpxPFHCBiVOYhkOhqD
 kruXKhUCFfA3omwDno0KMPH3KBm9JUidjzjtKT2+yAdRhdikwyBvVEDIvAjwFI4pn+yW
 cf73K8lTTiCWhe4h1/cLmqzOiZZ0S9hSzCEGm8mCGhuIk4HS4PvlHLj2rhW0Hw0TBAEt
 CxPOipfIyCZt85sYgGFl+y/MVgDTh5cFTj+0la0WaV0j3uJxXZ4Akax2f1gL3dU4rNwJ
 PNrbSH3Bm9vUp7KLmMs7b6ZPEUk4u7OMg6k3tDfxyTUKmwx79c136MfKDbncpa4vD/Q7
 c+Aw==
X-Gm-Message-State: AOAM5317FtnIyixTCW+9isbh+a0p6yj60ZtSatv6FaeQhDb+VklwVg3j
 72n1kxySxabDnH1MnVRhS9wmeA==
X-Google-Smtp-Source: ABdhPJywnPw6z16Ak9Sf4n0+8mKmDYgUDbPdhB9YE0Tz2tAm6kKcI6tqk6MiIjPWY4zGxPe54WmG+A==
X-Received: by 2002:a63:164e:: with SMTP id 14mr7225002pgw.246.1629267254757; 
 Tue, 17 Aug 2021 23:14:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a8sm729024pfo.79.2021.08.17.23.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:14:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rustam Kovhaev <rkovhaev@gmail.com>,
 syzbot+22794221ab96b0bab53a@syzkaller.appspotmail.com,
 Allen Pais <apais@linux.microsoft.com>,
 Romain Perier <romain.perier@gmail.com>, linux-staging@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2 19/63] staging: wlan-ng: Use struct_group() for memcpy()
 region
Date: Tue, 17 Aug 2021 23:04:49 -0700
Message-Id: <20210818060533.3569517-20-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2774; h=from:subject;
 bh=aGp1hVfQLzgNKVTBWpK4bHAQRaqFRmqtt5a8sjY+csw=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMizR57up2j4NPi4kVovJhubhBpYTgyg8yWF9zZ
 icJ94SKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjIgAKCRCJcvTf3G3AJpL6D/
 9OjwhbTRWiOOzSFBp8HIcdXHzLynmUDoremqboLQbbZFdvhzt0JN+X+5SXEKgIkDTabHGAyJJg7vbo
 zVrFanG+ya6KLCwo9BdiQAR/ueZXO5L+r/Giz1yPapqbt9k/nsEc5SYr5ucwOuJAxFE9KIGWEqYMrT
 i3E/cMd8/4hSpxFdVPIAs28n3YGzs5RdmJrvt0oE1gIolLyt89z92a2rYJdvxqr4c3EEmcmpORTtTP
 lkwRQ5y4dqKRSgda52wvAVbJiXwqCu+cZMKZbgEa3KUIL7s+H43Se99pCXw8Ub5zIFo+91KGljDQEx
 tb8lzPY0rRNNY0mbwRNYXf/W38QwRxZ3D5oUvC0N/0w4QQutHp9rU1gZioa3fOM/rHRt4HcprXi+nt
 0aVMHLjt3F6niAccQBbHURhgEcp8WwIJfTi/bJ+gg4LPSpeEvVE4tQYywNI4FkILs77ejtC8wiZxw7
 ocghlmQFrIyZuFFHQ08aqyrz9X6fmTVjexgK98h9oM/QBofgPJlUMtugzgwK/6v8LzRJ1jiml8GBZy
 OhAwKq8Jq0qW2GJdSkuk64fcF8WOlLGLlP1HErn6FXZfEY4MdumebnHUJDxpcnKVjQhgEciCCqBCSb
 /vsaJRVs0/wXUdwiP2kC/s1S+odfxQ0hXzojzVg0H0lmI3gP3DxmkZLDHg7Q==
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

Use struct_group() in struct hfa384x_tx_frame around members
frame_control, duration_id, address[1-4], and sequence_control, so they
can be referenced together. This will allow memcpy() and sizeof() to
more easily reason about sizes, improve readability, and avoid future
warnings about writing beyond the end of frame_control.

"pahole" shows no size nor member offset changes to struct
hfa384x_tx_frame. "objdump -d" shows no meaningful object code changes
(i.e. only source line number induced differences.)

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rustam Kovhaev <rkovhaev@gmail.com>
Cc: syzbot+22794221ab96b0bab53a@syzkaller.appspotmail.com
Cc: Allen Pais <apais@linux.microsoft.com>
Cc: Romain Perier <romain.perier@gmail.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://lore.kernel.org/lkml/YQDvC4CghCazix4w@kroah.com
---
 drivers/staging/wlan-ng/hfa384x.h     | 16 +++++++++-------
 drivers/staging/wlan-ng/hfa384x_usb.c |  4 +++-
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/wlan-ng/hfa384x.h b/drivers/staging/wlan-ng/hfa384x.h
index 88e894dd3568..87eb87e3beab 100644
--- a/drivers/staging/wlan-ng/hfa384x.h
+++ b/drivers/staging/wlan-ng/hfa384x.h
@@ -476,13 +476,15 @@ struct hfa384x_tx_frame {
 
 	/*-- 802.11 Header Information --*/
 
-	u16 frame_control;
-	u16 duration_id;
-	u8 address1[6];
-	u8 address2[6];
-	u8 address3[6];
-	u16 sequence_control;
-	u8 address4[6];
+	struct_group(p80211,
+		u16 frame_control;
+		u16 duration_id;
+		u8 address1[6];
+		u8 address2[6];
+		u8 address3[6];
+		u16 sequence_control;
+		u8 address4[6];
+	);
 	__le16 data_len;		/* little endian format */
 
 	/*-- 802.3 Header Information --*/
diff --git a/drivers/staging/wlan-ng/hfa384x_usb.c b/drivers/staging/wlan-ng/hfa384x_usb.c
index f2a0e16b0318..38aaae7a2d69 100644
--- a/drivers/staging/wlan-ng/hfa384x_usb.c
+++ b/drivers/staging/wlan-ng/hfa384x_usb.c
@@ -2516,7 +2516,9 @@ int hfa384x_drvr_txframe(struct hfa384x *hw, struct sk_buff *skb,
 	cpu_to_le16s(&hw->txbuff.txfrm.desc.tx_control);
 
 	/* copy the header over to the txdesc */
-	memcpy(&hw->txbuff.txfrm.desc.frame_control, p80211_hdr,
+	BUILD_BUG_ON(sizeof(hw->txbuff.txfrm.desc.p80211) !=
+		     sizeof(union p80211_hdr));
+	memcpy(&hw->txbuff.txfrm.desc.p80211, p80211_hdr,
 	       sizeof(union p80211_hdr));
 
 	/* if we're using host WEP, increase size by IV+ICV */
-- 
2.30.2

