Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7773D8141
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5E46EA66;
	Tue, 27 Jul 2021 21:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389F76E9EF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 21:16:55 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id m1so1904449pjv.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XdwAH1wi5GybK4WACckEvbqqM0uNwW2ti2D4UdHSPZY=;
 b=Ok0JMPyOntA2/shXMQ9U1we++nT0qhfqh/2CJDQ7K4u1UjNQxoXnu4xajkK85E02cp
 OtK4XcDGy3wt7Tpk39IjjY6WKVrrLzGuvSAivYryWC7kRY63lA/xKQX2Vbk2E2Uavoj/
 TmQhzEwGrkAcpR2gJlO/FcTIp5gwC+F1KR0zE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XdwAH1wi5GybK4WACckEvbqqM0uNwW2ti2D4UdHSPZY=;
 b=RGz6aR3zkxLy/F4HksTE+22/3BObNkd0Ocughx1nzTWb0IqwKlKaSGiBaYxvfVh7Rt
 W2YDJBNaTRvVtdI2bJzpZqCawrFZaK2x+W/QV+XbPgeFPY3SxQPAZ9uRuTCVFsUj+DyK
 4H03LffBtvgJXgLabo6kkxOIKJa8sGEh3Yhshw/GqbbYN3IzyWQKyAmzKazdKzkWmsza
 7jQx5harq1/7J01aRn2lEITu00l/AFhT0zvWqI5jQXyClMdOvOdHP78FpBylgdWGt6n9
 72ljrtEGRvppRFbFfKKIgPlLt6nEngXfyNq0c+J5CyM2+OjK6OTONz4eP0JQAZx2byMx
 l8ng==
X-Gm-Message-State: AOAM532pF3oLxz1263T+IuxiiSLB9XtnPuQbRCE+fyuR8WoBBHK8zGXW
 c1wpIqh55Ckhy0RRII8RiPi1+0cYRvKsCE2+
X-Google-Smtp-Source: ABdhPJzNDR76qJ9OM5+z4CUAyTRDn6tOs0lDe4jIL47eptis/B+O9LnGDX5Q+EGMdPEud5CnEN4QqQ==
X-Received: by 2002:a17:902:c950:b029:12b:6dff:737e with SMTP id
 i16-20020a170902c950b029012b6dff737emr20365641pla.23.1627420614916; 
 Tue, 27 Jul 2021 14:16:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id y9sm1353654pfq.199.2021.07.27.14.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 14:16:53 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 20/64] intersil: Use struct_group() for memcpy() region
Date: Tue, 27 Jul 2021 13:58:11 -0700
Message-Id: <20210727205855.411487-21-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2591; h=from:subject;
 bh=XN4EcfAHOcyqzqxgubXwSLF7jbqQXUd6RGr4EKrJNsA=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOEPEvZgYdYMavqPMgeDE6afWty3UdJd13OmXSL
 GPE0C+OJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzhAAKCRCJcvTf3G3AJr8VD/
 9xVNxDN0+Jpu0O3w+sAgW+rnCimDM7o6SG5YedgqLo9ucHl7vx4cyG9meVQGqMt9RqIGfOuGWKUhx8
 evPPkXhtqKEjLE9v6VbPKbcPAdcxh53eNx6j/QQCiD3ESy8EJWHhyi/1KC67cB50MeFLrW1O9lRLib
 KKuFycwhUjoh/Yf8VpDYUfNnYsn14knw+crJhaBTBggW55XmcO40aq/5WJYXp6vMSfcz6ZP2EWHk7X
 A7aNdVQ0uGEpCjRX0mqgIVDJeNnFivh2USUz4PVh6dZvVtegtUZ2Er0Oci5RoOwxWyXq/b6Erf0u4T
 twTqUdOnuOxP4/90seGDGkAX57dqITIzgJL0r9ENwWqSQqsPbLiKa1/asyzzEkUno7IAG5XBysCpu6
 /UTarLm65AFjDrqgWfoh5tW46HI6qD+TBBvzHaKyX7X+LpVAnSVr3JjkdVO8P6H8yhL0opZP0C0HrZ
 EM6Th8xtyqMF0uHuhxj+93uIAvn5I7EZMEpFO/cLBzH04SfZZHCiywH1/jb/LjBKyf0zPQJQ1Vzpq1
 TjAcn1pDlmxmr8t8QsbsbCjiwVyi9itWGM7tEeZ6WberH/QZcolHGoIakzm3k6rcGS90K3xsGVrVNR
 iuzAs+ECABSmTkuBrwO8EFf2/FSBUsGUtUvVELOjF7CEOssim03OhfpzKyzA==
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

Use struct_group() in struct hfa384x_tx_frame around members
frame_control, duration_id, addr1, addr2, addr3, and seq_ctrl, so they
can be referenced together. This will allow memcpy() and sizeof() to
more easily reason about sizes, improve readability, and avoid future
warnings about writing beyond the end of frame_control.

"pahole" shows no size nor member offset changes to struct
hfa384x_tx_frame. "objdump -d" shows no object code changes.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/intersil/hostap/hostap_hw.c   |  5 +++--
 drivers/net/wireless/intersil/hostap/hostap_wlan.h | 14 ++++++++------
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/intersil/hostap/hostap_hw.c b/drivers/net/wireless/intersil/hostap/hostap_hw.c
index 9a19046217df..cea8a9ddc4da 100644
--- a/drivers/net/wireless/intersil/hostap/hostap_hw.c
+++ b/drivers/net/wireless/intersil/hostap/hostap_hw.c
@@ -1812,8 +1812,9 @@ static int prism2_tx_80211(struct sk_buff *skb, struct net_device *dev)
 	memset(&txdesc, 0, sizeof(txdesc));
 
 	/* skb->data starts with txdesc->frame_control */
-	hdr_len = 24;
-	skb_copy_from_linear_data(skb, &txdesc.frame_control, hdr_len);
+	hdr_len = sizeof(txdesc.frame);
+	BUILD_BUG_ON(hdr_len != 24);
+	skb_copy_from_linear_data(skb, &txdesc.frame, hdr_len);
 	if (ieee80211_is_data(txdesc.frame_control) &&
 	    ieee80211_has_a4(txdesc.frame_control) &&
 	    skb->len >= 30) {
diff --git a/drivers/net/wireless/intersil/hostap/hostap_wlan.h b/drivers/net/wireless/intersil/hostap/hostap_wlan.h
index dd2603d9b5d3..174735a137c5 100644
--- a/drivers/net/wireless/intersil/hostap/hostap_wlan.h
+++ b/drivers/net/wireless/intersil/hostap/hostap_wlan.h
@@ -115,12 +115,14 @@ struct hfa384x_tx_frame {
 	__le16 tx_control; /* HFA384X_TX_CTRL_ flags */
 
 	/* 802.11 */
-	__le16 frame_control; /* parts not used */
-	__le16 duration_id;
-	u8 addr1[ETH_ALEN];
-	u8 addr2[ETH_ALEN]; /* filled by firmware */
-	u8 addr3[ETH_ALEN];
-	__le16 seq_ctrl; /* filled by firmware */
+	struct_group(frame,
+		__le16 frame_control; /* parts not used */
+		__le16 duration_id;
+		u8 addr1[ETH_ALEN];
+		u8 addr2[ETH_ALEN]; /* filled by firmware */
+		u8 addr3[ETH_ALEN];
+		__le16 seq_ctrl; /* filled by firmware */
+	);
 	u8 addr4[ETH_ALEN];
 	__le16 data_len;
 
-- 
2.30.2

