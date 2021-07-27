Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E10F3D7FFA
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DD96EA54;
	Tue, 27 Jul 2021 21:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0CC6E7D3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 20:59:12 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 g23-20020a17090a5797b02901765d605e14so997196pji.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hWOw/ShUhNoKqLy5xONCGFke6KYPZW2+ufIHOqWsR1c=;
 b=Eqka1sYJp9h/kcOL2iDCZMj8TDUHIPyOyWi24gmVNdYwIIDUtGl4b8/DNTzHCkhctb
 X1Gu4g1F16VPlXfoeXslbmcf523CybPlAeW0i8XL8sERdzOJ6bWtgM3NjOYQQ6fGZlTp
 cEogdwLIB8HKTpqqwiXRzBcREHtci2ey/w+f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hWOw/ShUhNoKqLy5xONCGFke6KYPZW2+ufIHOqWsR1c=;
 b=DQ6MGcpH+x8XQGTnK5slCnOsK/ZyiG0lSamm8MvWzZ4EO7+2D/GaJ22dtrGkd/hvtT
 6P09zcIgYdCPP/NB3DBgy2B08BPeK5BHtwYTljYm+WY9f4vREbUiQSutI2WBJn+RlPVT
 wust3TxfBGGHMOhiC3cnH36TE4BaJP4vJ06LHjGFbmwTUxA6J6DO6JzrseBNy2aN8PTD
 vx6e2FPmoV0qnviSLzrdXRHpx8DPoV6jNgv0S14IEEcOH6AyQrEKkosNgmfA7Cc338sB
 4xx7Lx3PnN8ZPZao0ft9dwMRRpxegAFwNyLYn1UuzxUhz3bTaZ3STkDOk4QjGb6vtsbg
 24Wg==
X-Gm-Message-State: AOAM531bWsdmzHOnsd6PuYinv5mbZPiVV5bIoCwtITnpqT/eUwGCpLjX
 6gGHAbspHGatWQw0FS4ICZ1hbA==
X-Google-Smtp-Source: ABdhPJzCtvcdnHTSNoHA3TduufzrJJn+ksgOcpN1B/ieztdmnVHd6zCFixfJFhj9+PqSiIS7/75qLA==
X-Received: by 2002:a65:4508:: with SMTP id n8mr25560953pgq.407.1627419552550; 
 Tue, 27 Jul 2021 13:59:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h9sm3799487pjk.56.2021.07.27.13.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 13:59:09 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 26/64] net/mlx5e: Use struct_group() for memcpy() region
Date: Tue, 27 Jul 2021 13:58:17 -0700
Message-Id: <20210727205855.411487-27-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065; h=from:subject;
 bh=OmCTlW0hm1yp5y421if0NwbN6lmjyu9cB7nSsW7Jn+I=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOGAWhdltIQeHU+KL/U3mjVNHTsB6UqjQVG0s1T
 MLzYTvmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzhgAKCRCJcvTf3G3AJvawD/
 0Y9nwzg1loPqMU8HK2Lrs8d4VvSmczBm8eqGoQs9EHJsiFtugTDtZN4WhRpGrTLVDHbAVJw36Npiwu
 XAp1UjSyPVsuqo0P30Ske0e8NoMe9NRQvvDWjjH/eu6DZXSUzvdTk7AyY6sDxWLnYxVHz9On+D0bSE
 bWAHPr93pFPZdB71Z39jl7X5RUPKEl9yNMoKBUeOAh/QG6qRqLWLDpsOuvHg5KjcQXH3vGCDkd/daE
 RBGpTmExsFn5PWoCaPTQMZTVcQclkMtOuewTAi348iy3H+m/p2MiHtXoIKN81BBc2DeOErD9fZkuaB
 qhnxDx5Cs0veqgZQ24hKie2iJ9udchP2z4yv2Mht8MwU5oQnyt9hFOzY7IChnZuDwpKnOopj2i7HbI
 j83p6ORtxkAPVDM3uyFLfT1z77oimcvdb0VN80OeJMLxaAlNQfdtSKGQWdXPNDgr8/R70vafFbcr1u
 sKwpuZ/TAtn/s3Co1v0I15zYAaR4JuMFRc+WQazB/GGXr4gplZyzjQthIk9WoJgGUlr1oDMzIepkwn
 LLtMC4hdZjdHAq0Jy9SOMn2P2adM+xuw3mC6Jz21qW11KnQMWkboR2/F6Nma6Zw2js4eJlngpBFH0A
 qinUegqhIOxl+dBkBKV94R0Hr+Zy+sXz6J507mfpqyDbJcpzzwnGzHISubWw==
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

Use struct_group() in struct vlan_ethhdr around members h_dest and
h_source, so they can be referenced together. This will allow memcpy()
and sizeof() to more easily reason about sizes, improve readability,
and avoid future warnings about writing beyond the end of h_dest.

"pahole" shows no size nor member offset changes to struct vlan_ethhdr.
"objdump -d" shows no object code changes.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_tx.c | 2 +-
 include/linux/if_vlan.h                         | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tx.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tx.c
index c63d78eda606..39942a952736 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tx.c
@@ -207,7 +207,7 @@ static inline void mlx5e_insert_vlan(void *start, struct sk_buff *skb, u16 ihs)
 	int cpy1_sz = 2 * ETH_ALEN;
 	int cpy2_sz = ihs - cpy1_sz;
 
-	memcpy(vhdr, skb->data, cpy1_sz);
+	memcpy(&vhdr->addrs, skb->data, cpy1_sz);
 	vhdr->h_vlan_proto = skb->vlan_proto;
 	vhdr->h_vlan_TCI = cpu_to_be16(skb_vlan_tag_get(skb));
 	memcpy(&vhdr->h_vlan_encapsulated_proto, skb->data + cpy1_sz, cpy2_sz);
diff --git a/include/linux/if_vlan.h b/include/linux/if_vlan.h
index 41a518336673..45aad461aa34 100644
--- a/include/linux/if_vlan.h
+++ b/include/linux/if_vlan.h
@@ -46,8 +46,10 @@ struct vlan_hdr {
  *	@h_vlan_encapsulated_proto: packet type ID or len
  */
 struct vlan_ethhdr {
-	unsigned char	h_dest[ETH_ALEN];
-	unsigned char	h_source[ETH_ALEN];
+	struct_group(addrs,
+		unsigned char	h_dest[ETH_ALEN];
+		unsigned char	h_source[ETH_ALEN];
+	);
 	__be16		h_vlan_proto;
 	__be16		h_vlan_TCI;
 	__be16		h_vlan_encapsulated_proto;
-- 
2.30.2

