Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29305733C36
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 00:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD0710E69D;
	Fri, 16 Jun 2023 22:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F56010E69C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 22:14:42 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1b50394a7f2so8738875ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 15:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1686953682; x=1689545682;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=C/xe7jc1CvSh+cpJzdKMh2McMwViCbLHpdyFIHV6Jxw=;
 b=anC6VXkrc0++mKgIb/kPK3h5RY/uW7USvPW3ZQSMYTPkmB+dAashJ8HsAFOAFpjH2E
 Qj/H8xb9a8gK0wF+1V3xsPGw5cSNx5P4uix55S0ov9S7TxXxcBLE1M6yYmdj4PMHjrWF
 bNK/nwLmk7zdi4B4RDycfEDdf+x4st6IhoB3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686953682; x=1689545682;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C/xe7jc1CvSh+cpJzdKMh2McMwViCbLHpdyFIHV6Jxw=;
 b=D7aqa2jEBrZgcMBJqxWsJI3cy6bRqiLvD4SDqGI42e7ssWDSNy/ZAJPYhgBUNuHiTC
 GUm4KygAe3wIxDSMxGb6l9J31wXZCgBWe8aICFatYs2txthhvPBnf68Q8CUuYpVOL5Jf
 OJ34gLJ1QlQq6zyBaH0UQio3sehKBeFDNjcueXS6rUdhbo7wNRjameqs/SAyVmtgwRUo
 9yMrRh5hkGajEl6m3dVCe1/3RuhJvxr2x4QQQbrfvjdRrdCDIDgnpifaWzkSCvuP7C7L
 4K3QVv4GBwrAk+yNaGCowF+Qz+hkHTFRpIzClkeDDHRq3smUCEyLbAQ6IgO117LqlmEM
 b3hA==
X-Gm-Message-State: AC+VfDwdAiXuQeBUdtwjW9O7g5L5luiETOSMnJiu0ZXVywsFzp+2LeL/
 nhzBMAE9Ypj0sl3nzuIk5dgeLA==
X-Google-Smtp-Source: ACHHUZ6deOAJNk5WUWFeQIB4cNda6MtwgJrO48DTkcDVo7kJxQhQp/HlCfD2KY1C1jX2sKhvB3HWiw==
X-Received: by 2002:a17:902:e74e:b0:1b3:8865:aaae with SMTP id
 p14-20020a170902e74e00b001b38865aaaemr3276961plf.53.1686953681718; 
 Fri, 16 Jun 2023 15:14:41 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a170902ab8c00b001aaed524541sm16220860plr.227.2023.06.16.15.14.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Jun 2023 15:14:41 -0700 (PDT)
From: Justin Chen <justin.chen@broadcom.com>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH net-next v8 05/11] net: bcmasp: Add support for wake on net
 filters
Date: Fri, 16 Jun 2023 15:14:18 -0700
Message-Id: <1686953664-17498-6-git-send-email-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1686953664-17498-1-git-send-email-justin.chen@broadcom.com>
References: <1686953664-17498-1-git-send-email-justin.chen@broadcom.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000fab03f05fe468213"
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
Cc: andrew@lunn.ch, conor+dt@kernel.org, opendmb@gmail.com,
 Justin Chen <justin.chen@broadcom.com>, florian.fainelli@broadcom.com,
 christian.koenig@amd.com, simon.horman@corigine.com, richardcochran@gmail.com,
 linux@armlinux.org.uk, sumit.semwal@linaro.org, edumazet@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000fab03f05fe468213

Add support for wake on network filters. The max match is 256 bytes.

Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
 drivers/net/ethernet/broadcom/asp2/bcmasp.c        | 595 +++++++++++++++++++++
 drivers/net/ethernet/broadcom/asp2/bcmasp.h        |  40 ++
 .../net/ethernet/broadcom/asp2/bcmasp_ethtool.c    | 131 ++++-
 drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c   |   3 +
 4 files changed, 768 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
index 40143bb566ef..51b7aa8365c8 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
@@ -130,6 +130,597 @@ void bcmasp_flush_rx_port(struct bcmasp_intf *intf)
 	rx_ctrl_core_wl(priv, mask, priv->hw_info->rx_ctrl_flush);
 }
 
+static void bcmasp_netfilt_hw_en_wake(struct bcmasp_priv *priv,
+				      struct bcmasp_net_filter *nfilt)
+{
+	rx_filter_core_wl(priv, ASP_RX_FILTER_NET_OFFSET_L3_1(64),
+			  ASP_RX_FILTER_NET_OFFSET(nfilt->hw_index));
+
+	rx_filter_core_wl(priv, ASP_RX_FILTER_NET_OFFSET_L2(32) |
+			  ASP_RX_FILTER_NET_OFFSET_L3_0(32) |
+			  ASP_RX_FILTER_NET_OFFSET_L3_1(96) |
+			  ASP_RX_FILTER_NET_OFFSET_L4(32),
+			  ASP_RX_FILTER_NET_OFFSET(nfilt->hw_index + 1));
+
+	rx_filter_core_wl(priv, ASP_RX_FILTER_NET_CFG_CH(nfilt->port + 8) |
+			  ASP_RX_FILTER_NET_CFG_EN |
+			  ASP_RX_FILTER_NET_CFG_L2_EN |
+			  ASP_RX_FILTER_NET_CFG_L3_EN |
+			  ASP_RX_FILTER_NET_CFG_L4_EN |
+			  ASP_RX_FILTER_NET_CFG_L3_FRM(2) |
+			  ASP_RX_FILTER_NET_CFG_L4_FRM(2) |
+			  ASP_RX_FILTER_NET_CFG_UMC(nfilt->port),
+			  ASP_RX_FILTER_NET_CFG(nfilt->hw_index));
+
+	rx_filter_core_wl(priv, ASP_RX_FILTER_NET_CFG_CH(nfilt->port + 8) |
+			  ASP_RX_FILTER_NET_CFG_EN |
+			  ASP_RX_FILTER_NET_CFG_L2_EN |
+			  ASP_RX_FILTER_NET_CFG_L3_EN |
+			  ASP_RX_FILTER_NET_CFG_L4_EN |
+			  ASP_RX_FILTER_NET_CFG_L3_FRM(2) |
+			  ASP_RX_FILTER_NET_CFG_L4_FRM(2) |
+			  ASP_RX_FILTER_NET_CFG_UMC(nfilt->port),
+			  ASP_RX_FILTER_NET_CFG(nfilt->hw_index + 1));
+}
+
+#define MAX_WAKE_FILTER_SIZE		256
+enum asp_netfilt_reg_type {
+	ASP_NETFILT_MATCH = 0,
+	ASP_NETFILT_MASK,
+	ASP_NETFILT_MAX
+};
+
+static int bcmasp_netfilt_get_reg_offset(struct bcmasp_priv *priv,
+					 struct bcmasp_net_filter *nfilt,
+					 enum asp_netfilt_reg_type reg_type,
+					 u32 offset)
+{
+	u32 block_index, filter_sel;
+
+	if (offset < 32) {
+		block_index = ASP_RX_FILTER_NET_L2;
+		filter_sel = nfilt->hw_index;
+	} else if (offset < 64) {
+		block_index = ASP_RX_FILTER_NET_L2;
+		filter_sel = nfilt->hw_index + 1;
+	} else if (offset < 96) {
+		block_index = ASP_RX_FILTER_NET_L3_0;
+		filter_sel = nfilt->hw_index;
+	} else if (offset < 128) {
+		block_index = ASP_RX_FILTER_NET_L3_0;
+		filter_sel = nfilt->hw_index + 1;
+	} else if (offset < 160) {
+		block_index = ASP_RX_FILTER_NET_L3_1;
+		filter_sel = nfilt->hw_index;
+	} else if (offset < 192) {
+		block_index = ASP_RX_FILTER_NET_L3_1;
+		filter_sel = nfilt->hw_index + 1;
+	} else if (offset < 224) {
+		block_index = ASP_RX_FILTER_NET_L4;
+		filter_sel = nfilt->hw_index;
+	} else if (offset < 256) {
+		block_index = ASP_RX_FILTER_NET_L4;
+		filter_sel = nfilt->hw_index + 1;
+	} else {
+		return -EINVAL;
+	}
+
+	switch (reg_type) {
+	case ASP_NETFILT_MATCH:
+		return ASP_RX_FILTER_NET_PAT(filter_sel, block_index,
+					     (offset % 32));
+	case ASP_NETFILT_MASK:
+		return ASP_RX_FILTER_NET_MASK(filter_sel, block_index,
+					      (offset % 32));
+	default:
+		return -EINVAL;
+	}
+}
+
+static void bcmasp_netfilt_wr(struct bcmasp_priv *priv,
+			      struct bcmasp_net_filter *nfilt,
+			      enum asp_netfilt_reg_type reg_type,
+			      u32 val, u32 offset)
+{
+	int reg_offset;
+
+	/* HW only accepts 4 byte aligned writes */
+	if (!IS_ALIGNED(offset, 4) || offset > MAX_WAKE_FILTER_SIZE)
+		return;
+
+	reg_offset = bcmasp_netfilt_get_reg_offset(priv, nfilt, reg_type,
+						   offset);
+
+	rx_filter_core_wl(priv, val, reg_offset);
+}
+
+static u32 bcmasp_netfilt_rd(struct bcmasp_priv *priv,
+			     struct bcmasp_net_filter *nfilt,
+			     enum asp_netfilt_reg_type reg_type,
+			     u32 offset)
+{
+	int reg_offset;
+
+	/* HW only accepts 4 byte aligned writes */
+	if (!IS_ALIGNED(offset, 4) || offset > MAX_WAKE_FILTER_SIZE)
+		return 0;
+
+	reg_offset = bcmasp_netfilt_get_reg_offset(priv, nfilt, reg_type,
+						   offset);
+
+	return rx_filter_core_rl(priv, reg_offset);
+}
+
+static int bcmasp_netfilt_wr_m_wake(struct bcmasp_priv *priv,
+				    struct bcmasp_net_filter *nfilt,
+				    u32 offset, void *match, void *mask,
+				    size_t size)
+{
+	u32 shift, mask_val = 0, match_val = 0;
+	bool first_byte = true;
+
+	if ((offset + size) > MAX_WAKE_FILTER_SIZE)
+		return -EINVAL;
+
+	while (size--) {
+		/* The HW only accepts 4 byte aligned writes, so if we
+		 * begin unaligned or if remaining bytes less than 4,
+		 * we need to read then write to avoid losing current
+		 * register state
+		 */
+		if (first_byte && (!IS_ALIGNED(offset, 4) || size < 3)) {
+			match_val = bcmasp_netfilt_rd(priv, nfilt,
+						      ASP_NETFILT_MATCH,
+						      ALIGN_DOWN(offset, 4));
+			mask_val = bcmasp_netfilt_rd(priv, nfilt,
+						     ASP_NETFILT_MASK,
+						     ALIGN_DOWN(offset, 4));
+		}
+
+		shift = (3 - (offset % 4)) * 8;
+		match_val &= ~GENMASK(shift + 7, shift);
+		mask_val &= ~GENMASK(shift + 7, shift);
+		match_val |= (u32)(*((u8 *)match) << shift);
+		mask_val |= (u32)(*((u8 *)mask) << shift);
+
+		/* If last byte or last byte of word, write to reg */
+		if (!size || ((offset % 4) == 3)) {
+			bcmasp_netfilt_wr(priv, nfilt, ASP_NETFILT_MATCH,
+					  match_val, ALIGN_DOWN(offset, 4));
+			bcmasp_netfilt_wr(priv, nfilt, ASP_NETFILT_MASK,
+					  mask_val, ALIGN_DOWN(offset, 4));
+			first_byte = true;
+		} else {
+			first_byte = false;
+		}
+
+		offset++;
+		match++;
+		mask++;
+	}
+
+	return 0;
+}
+
+static void bcmasp_netfilt_reset_hw(struct bcmasp_priv *priv,
+				    struct bcmasp_net_filter *nfilt)
+{
+	int i;
+
+	for (i = 0; i < MAX_WAKE_FILTER_SIZE; i += 4) {
+		bcmasp_netfilt_wr(priv, nfilt, ASP_NETFILT_MATCH, 0, i);
+		bcmasp_netfilt_wr(priv, nfilt, ASP_NETFILT_MASK, 0, i);
+	}
+}
+
+static void bcmasp_netfilt_tcpip4_wr(struct bcmasp_priv *priv,
+				     struct bcmasp_net_filter *nfilt,
+				     struct ethtool_tcpip4_spec *match,
+				     struct ethtool_tcpip4_spec *mask,
+				     u32 offset)
+{
+	__be16 val_16, mask_16;
+
+	val_16 = htons(ETH_P_IP);
+	mask_16 = htons(0xFFFF);
+	bcmasp_netfilt_wr_m_wake(priv, nfilt, (ETH_ALEN * 2) + offset,
+				 &val_16, &mask_16, sizeof(val_16));
+	bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset + 1,
+				 &match->tos, &mask->tos,
+				 sizeof(match->tos));
+	bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset + 12,
+				 &match->ip4src, &mask->ip4src,
+				 sizeof(match->ip4src));
+	bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset + 16,
+				 &match->ip4dst, &mask->ip4dst,
+				 sizeof(match->ip4dst));
+	bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset + 20,
+				 &match->psrc, &mask->psrc,
+				 sizeof(match->psrc));
+	bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset + 22,
+				 &match->pdst, &mask->pdst,
+				 sizeof(match->pdst));
+}
+
+static void bcmasp_netfilt_tcpip6_wr(struct bcmasp_priv *priv,
+				     struct bcmasp_net_filter *nfilt,
+				     struct ethtool_tcpip6_spec *match,
+				     struct ethtool_tcpip6_spec *mask,
+				     u32 offset)
+{
+	__be16 val_16, mask_16;
+
+	val_16 = htons(ETH_P_IPV6);
+	mask_16 = htons(0xFFFF);
+	bcmasp_netfilt_wr_m_wake(priv, nfilt, (ETH_ALEN * 2) + offset,
+				 &val_16, &mask_16, sizeof(val_16));
+	val_16 = htons(match->tclass << 4);
+	mask_16 = htons(mask->tclass << 4);
+	bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset,
+				 &val_16, &mask_16, sizeof(val_16));
+	bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset + 8,
+				 &match->ip6src, &mask->ip6src,
+				 sizeof(match->ip6src));
+	bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset + 24,
+				 &match->ip6dst, &mask->ip6dst,
+				 sizeof(match->ip6dst));
+	bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset + 40,
+				 &match->psrc, &mask->psrc,
+				 sizeof(match->psrc));
+	bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset + 42,
+				 &match->pdst, &mask->pdst,
+				 sizeof(match->pdst));
+}
+
+static int bcmasp_netfilt_wr_to_hw(struct bcmasp_priv *priv,
+				   struct bcmasp_net_filter *nfilt)
+{
+	struct ethtool_rx_flow_spec *fs = &nfilt->fs;
+	unsigned int offset = 0;
+	__be16 val_16, mask_16;
+	u8 val_8, mask_8;
+
+	/* Currently only supports wake filters */
+	if (!nfilt->wake_filter)
+		return -EINVAL;
+
+	bcmasp_netfilt_reset_hw(priv, nfilt);
+
+	if (fs->flow_type & FLOW_MAC_EXT) {
+		bcmasp_netfilt_wr_m_wake(priv, nfilt, 0, &fs->h_ext.h_dest,
+					 &fs->m_ext.h_dest,
+					 sizeof(fs->h_ext.h_dest));
+	}
+
+	if ((fs->flow_type & FLOW_EXT) &&
+	    (fs->m_ext.vlan_etype || fs->m_ext.vlan_tci)) {
+		bcmasp_netfilt_wr_m_wake(priv, nfilt, (ETH_ALEN * 2),
+					 &fs->h_ext.vlan_etype,
+					 &fs->m_ext.vlan_etype,
+					 sizeof(fs->h_ext.vlan_etype));
+		bcmasp_netfilt_wr_m_wake(priv, nfilt, ((ETH_ALEN * 2) + 2),
+					 &fs->h_ext.vlan_tci,
+					 &fs->m_ext.vlan_tci,
+					 sizeof(fs->h_ext.vlan_tci));
+		offset += VLAN_HLEN;
+	}
+
+	switch (fs->flow_type & ~(FLOW_EXT | FLOW_MAC_EXT)) {
+	case ETHER_FLOW:
+		bcmasp_netfilt_wr_m_wake(priv, nfilt, 0,
+					 &fs->h_u.ether_spec.h_dest,
+					 &fs->m_u.ether_spec.h_dest,
+					 sizeof(fs->h_u.ether_spec.h_dest));
+		bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_ALEN,
+					 &fs->h_u.ether_spec.h_source,
+					 &fs->m_u.ether_spec.h_source,
+					 sizeof(fs->h_u.ether_spec.h_source));
+		bcmasp_netfilt_wr_m_wake(priv, nfilt, (ETH_ALEN * 2) + offset,
+					 &fs->h_u.ether_spec.h_proto,
+					 &fs->m_u.ether_spec.h_proto,
+					 sizeof(fs->h_u.ether_spec.h_proto));
+
+		break;
+	case IP_USER_FLOW:
+		val_16 = htons(ETH_P_IP);
+		mask_16 = htons(0xFFFF);
+		bcmasp_netfilt_wr_m_wake(priv, nfilt, (ETH_ALEN * 2) + offset,
+					 &val_16, &mask_16, sizeof(val_16));
+		bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset + 1,
+					 &fs->h_u.usr_ip4_spec.tos,
+					 &fs->m_u.usr_ip4_spec.tos,
+					 sizeof(fs->h_u.usr_ip4_spec.tos));
+		bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset + 9,
+					 &fs->h_u.usr_ip4_spec.proto,
+					 &fs->m_u.usr_ip4_spec.proto,
+					 sizeof(fs->h_u.usr_ip4_spec.proto));
+		bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset + 12,
+					 &fs->h_u.usr_ip4_spec.ip4src,
+					 &fs->m_u.usr_ip4_spec.ip4src,
+					 sizeof(fs->h_u.usr_ip4_spec.ip4src));
+		bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset + 16,
+					 &fs->h_u.usr_ip4_spec.ip4dst,
+					 &fs->m_u.usr_ip4_spec.ip4dst,
+					 sizeof(fs->h_u.usr_ip4_spec.ip4dst));
+		if (!fs->m_u.usr_ip4_spec.l4_4_bytes)
+			break;
+
+		/* Only supports 20 byte IPv4 header */
+		val_8 = 0x45;
+		mask_8 = 0xFF;
+		bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset,
+					 &val_8, &mask_8, sizeof(val_8));
+		bcmasp_netfilt_wr_m_wake(priv, nfilt,
+					 ETH_HLEN + 20 + offset,
+					 &fs->h_u.usr_ip4_spec.l4_4_bytes,
+					 &fs->m_u.usr_ip4_spec.l4_4_bytes,
+					 sizeof(fs->h_u.usr_ip4_spec.l4_4_bytes)
+					 );
+		break;
+	case TCP_V4_FLOW:
+		val_8 = IPPROTO_TCP;
+		mask_8 = 0xFF;
+		bcmasp_netfilt_tcpip4_wr(priv, nfilt, &fs->h_u.tcp_ip4_spec,
+					 &fs->m_u.tcp_ip4_spec, offset);
+		bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset + 9,
+					 &val_8, &mask_8, sizeof(val_8));
+		break;
+	case UDP_V4_FLOW:
+		val_8 = IPPROTO_UDP;
+		mask_8 = 0xFF;
+		bcmasp_netfilt_tcpip4_wr(priv, nfilt, &fs->h_u.udp_ip4_spec,
+					 &fs->m_u.udp_ip4_spec, offset);
+
+		bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset + 9,
+					 &val_8, &mask_8, sizeof(val_8));
+		break;
+	case TCP_V6_FLOW:
+		val_8 = IPPROTO_TCP;
+		mask_8 = 0xFF;
+		bcmasp_netfilt_tcpip6_wr(priv, nfilt, &fs->h_u.tcp_ip6_spec,
+					 &fs->m_u.tcp_ip6_spec, offset);
+		bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset + 6,
+					 &val_8, &mask_8, sizeof(val_8));
+		break;
+	case UDP_V6_FLOW:
+		val_8 = IPPROTO_UDP;
+		mask_8 = 0xFF;
+		bcmasp_netfilt_tcpip6_wr(priv, nfilt, &fs->h_u.udp_ip6_spec,
+					 &fs->m_u.udp_ip6_spec, offset);
+		bcmasp_netfilt_wr_m_wake(priv, nfilt, ETH_HLEN + offset + 6,
+					 &val_8, &mask_8, sizeof(val_8));
+		break;
+	}
+
+	bcmasp_netfilt_hw_en_wake(priv, nfilt);
+
+	return 0;
+}
+
+void bcmasp_netfilt_suspend(struct bcmasp_intf *intf)
+{
+	struct bcmasp_priv *priv = intf->parent;
+	bool write = false;
+	int ret, i;
+
+	/* Write all filters to HW */
+	for (i = 0; i < NUM_NET_FILTERS; i++) {
+		/* If the filter does not match the port, skip programming. */
+		if (!priv->net_filters[i].claimed ||
+		    priv->net_filters[i].port != intf->port)
+			continue;
+
+		if (i > 0 && (i % 2) &&
+		    priv->net_filters[i].wake_filter &&
+		    priv->net_filters[i - 1].wake_filter)
+			continue;
+
+		ret = bcmasp_netfilt_wr_to_hw(priv, &priv->net_filters[i]);
+		if (!ret)
+			write = true;
+	}
+
+	/* Successfully programmed at least one wake filter
+	 * so enable top level wake config
+	 */
+	if (write)
+		rx_filter_core_wl(priv, (ASP_RX_FILTER_OPUT_EN |
+				  ASP_RX_FILTER_LNR_MD |
+				  ASP_RX_FILTER_GEN_WK_EN |
+				  ASP_RX_FILTER_NT_FLT_EN),
+				  ASP_RX_FILTER_BLK_CTRL);
+}
+
+void bcmasp_netfilt_get_all_active(struct bcmasp_intf *intf, u32 *rule_locs,
+				   u32 *rule_cnt)
+{
+	struct bcmasp_priv *priv = intf->parent;
+	int j = 0, i;
+
+	for (i = 0; i < NUM_NET_FILTERS; i++) {
+		if (!priv->net_filters[i].claimed ||
+		    priv->net_filters[i].port != intf->port)
+			continue;
+
+		if (i > 0 && (i % 2) &&
+		    priv->net_filters[i].wake_filter &&
+		    priv->net_filters[i - 1].wake_filter)
+			continue;
+
+		rule_locs[j++] = priv->net_filters[i].fs.location;
+	}
+
+	*rule_cnt = j;
+}
+
+int bcmasp_netfilt_get_active(struct bcmasp_intf *intf)
+{
+	struct bcmasp_priv *priv = intf->parent;
+	int cnt = 0, i;
+
+	for (i = 0; i < NUM_NET_FILTERS; i++) {
+		if (!priv->net_filters[i].claimed ||
+		    priv->net_filters[i].port != intf->port)
+			continue;
+
+		/* Skip over a wake filter pair */
+		if (i > 0 && (i % 2) &&
+		    priv->net_filters[i].wake_filter &&
+		    priv->net_filters[i - 1].wake_filter)
+			continue;
+
+		cnt++;
+	}
+
+	return cnt;
+}
+
+bool bcmasp_netfilt_check_dup(struct bcmasp_intf *intf,
+			      struct ethtool_rx_flow_spec *fs)
+{
+	struct bcmasp_priv *priv = intf->parent;
+	struct ethtool_rx_flow_spec *cur;
+	size_t fs_size = 0;
+	int i;
+
+	for (i = 0; i < NUM_NET_FILTERS; i++) {
+		if (!priv->net_filters[i].claimed ||
+		    priv->net_filters[i].port != intf->port)
+			continue;
+
+		cur = &priv->net_filters[i].fs;
+
+		if (cur->flow_type != fs->flow_type ||
+		    cur->ring_cookie != fs->ring_cookie)
+			continue;
+
+		switch (fs->flow_type & ~(FLOW_EXT | FLOW_MAC_EXT)) {
+		case ETHER_FLOW:
+			fs_size = sizeof(struct ethhdr);
+			break;
+		case IP_USER_FLOW:
+			fs_size = sizeof(struct ethtool_usrip4_spec);
+			break;
+		case TCP_V6_FLOW:
+		case UDP_V6_FLOW:
+			fs_size = sizeof(struct ethtool_tcpip6_spec);
+			break;
+		case TCP_V4_FLOW:
+		case UDP_V4_FLOW:
+			fs_size = sizeof(struct ethtool_tcpip4_spec);
+			break;
+		default:
+			continue;
+		}
+
+		if (memcmp(&cur->h_u, &fs->h_u, fs_size) ||
+		    memcmp(&cur->m_u, &fs->m_u, fs_size))
+			continue;
+
+		if (cur->flow_type & FLOW_EXT) {
+			if (cur->h_ext.vlan_etype != fs->h_ext.vlan_etype ||
+			    cur->m_ext.vlan_etype != fs->m_ext.vlan_etype ||
+			    cur->h_ext.vlan_tci != fs->h_ext.vlan_tci ||
+			    cur->m_ext.vlan_tci != fs->m_ext.vlan_tci ||
+			    cur->h_ext.data[0] != fs->h_ext.data[0])
+				continue;
+		}
+		if (cur->flow_type & FLOW_MAC_EXT) {
+			if (memcmp(&cur->h_ext.h_dest,
+				   &fs->h_ext.h_dest, ETH_ALEN) ||
+			    memcmp(&cur->m_ext.h_dest,
+				   &fs->m_ext.h_dest, ETH_ALEN))
+				continue;
+		}
+
+		return true;
+	}
+
+	return false;
+}
+
+/* If no network filter found, return open filter.
+ * If no more open filters return NULL
+ */
+struct bcmasp_net_filter *bcmasp_netfilt_get_init(struct bcmasp_intf *intf,
+						  int loc, bool wake_filter,
+						  bool init)
+{
+	struct bcmasp_net_filter *nfilter = NULL;
+	struct bcmasp_priv *priv = intf->parent;
+	int i, open_index = -1;
+
+	/* Check whether we exceed the filter table capacity */
+	if (loc != RX_CLS_LOC_ANY && loc >= NUM_NET_FILTERS)
+		return ERR_PTR(-EINVAL);
+
+	/* If the filter location is busy (already claimed) and we are initializing
+	 * the filter (insertion), return a busy error code.
+	 */
+	if (loc != RX_CLS_LOC_ANY && init && priv->net_filters[loc].claimed)
+		return ERR_PTR(-EBUSY);
+
+	/* We need two filters for wake-up, so we cannot use an odd filter */
+	if (wake_filter && loc != RX_CLS_LOC_ANY && (loc % 2))
+		return ERR_PTR(-EINVAL);
+
+	/* Initialize the loop index based on the desired location or from 0 */
+	i = loc == RX_CLS_LOC_ANY ? 0 : loc;
+
+	for ( ; i < NUM_NET_FILTERS; i++) {
+		/* Found matching network filter */
+		if (!init &&
+		    priv->net_filters[i].claimed &&
+		    priv->net_filters[i].hw_index == i &&
+		    priv->net_filters[i].port == intf->port)
+			return &priv->net_filters[i];
+
+		/* If we don't need a new filter or new filter already found */
+		if (!init || open_index >= 0)
+			continue;
+
+		/* Wake filter conslidates two filters to cover more bytes
+		 * Wake filter is open if...
+		 * 1. It is an even filter
+		 * 2. The current and next filter is not claimed
+		 */
+		if (wake_filter && !(i % 2) && !priv->net_filters[i].claimed &&
+		    !priv->net_filters[i + 1].claimed)
+			open_index = i;
+		else if (!priv->net_filters[i].claimed)
+			open_index = i;
+	}
+
+	if (open_index >= 0) {
+		nfilter = &priv->net_filters[open_index];
+		nfilter->claimed = true;
+		nfilter->port = intf->port;
+		nfilter->hw_index = open_index;
+	}
+
+	if (wake_filter && open_index >= 0) {
+		/* Claim next filter */
+		priv->net_filters[open_index + 1].claimed = true;
+		priv->net_filters[open_index + 1].wake_filter = true;
+		nfilter->wake_filter = true;
+	}
+
+	return nfilter ? nfilter : ERR_PTR(-EINVAL);
+}
+
+void bcmasp_netfilt_release(struct bcmasp_intf *intf,
+			    struct bcmasp_net_filter *nfilt)
+{
+	struct bcmasp_priv *priv = intf->parent;
+
+	if (nfilt->wake_filter) {
+		memset(&priv->net_filters[nfilt->hw_index + 1], 0,
+		       sizeof(struct bcmasp_net_filter));
+	}
+
+	memset(nfilt, 0, sizeof(struct bcmasp_net_filter));
+}
+
 static void bcmasp_addr_to_uint(unsigned char *addr, u32 *high, u32 *low)
 {
 	*high = (u32)(addr[0] << 8 | addr[1]);
@@ -329,6 +920,9 @@ static void bcmasp_core_init_filters(struct bcmasp_priv *priv)
 		priv->mda_filters[i].en = 0;
 	}
 
+	for (i = 0; i < NUM_NET_FILTERS; i++)
+		rx_filter_core_wl(priv, 0x0, ASP_RX_FILTER_NET_CFG(i));
+
 	/* Top level filter enable bit should be enabled at all times, set
 	 * GEN_WAKE_CLEAR to clear the network filter wake-up which would
 	 * otherwise be sticky
@@ -654,6 +1248,7 @@ static int bcmasp_probe(struct platform_device *pdev)
 	spin_lock_init(&priv->mda_lock);
 	spin_lock_init(&priv->clk_lock);
 	mutex_init(&priv->wol_lock);
+	mutex_init(&priv->net_lock);
 
 	pdata = device_get_match_data(&pdev->dev);
 	if (!pdata)
diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.h b/drivers/net/ethernet/broadcom/asp2/bcmasp.h
index c8b66a6af584..e791b869006e 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp.h
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.h
@@ -106,6 +106,14 @@
 #define   ASP_RX_FILTER_NET_OFFSET_L3_1(val)	((val) << 16)
 #define   ASP_RX_FILTER_NET_OFFSET_L4(val)	((val) << 24)
 
+enum asp_rx_net_filter_block {
+	ASP_RX_FILTER_NET_L2 = 0,
+	ASP_RX_FILTER_NET_L3_0,
+	ASP_RX_FILTER_NET_L3_1,
+	ASP_RX_FILTER_NET_L4,
+	ASP_RX_FILTER_NET_BLOCK_MAX
+};
+
 #define ASP_EDPKT_OFFSET			0x9c000
 #define  ASP_EDPKT_ENABLE			0x4
 #define   ASP_EDPKT_ENABLE_EN			BIT(0)
@@ -307,6 +315,17 @@ struct bcmasp_intf {
 	unsigned int		wol_irq_enabled:1;
 };
 
+#define NUM_NET_FILTERS				32
+struct bcmasp_net_filter {
+	struct ethtool_rx_flow_spec	fs;
+
+	bool				claimed;
+	bool				wake_filter;
+
+	int				port;
+	unsigned int			hw_index;
+};
+
 #define NUM_MDA_FILTERS				32
 struct bcmasp_mda_filter {
 	/* Current owner of this filter */
@@ -362,6 +381,11 @@ struct bcmasp_priv {
 
 	/* Protects accesses to ASP_CTRL_CLOCK_CTRL */
 	spinlock_t			clk_lock;
+
+	struct bcmasp_net_filter	net_filters[NUM_NET_FILTERS];
+
+	/* Network filter lock */
+	struct mutex			net_lock;
 };
 
 static inline unsigned long bcmasp_intf_rx_desc_read(struct bcmasp_intf *intf)
@@ -519,4 +543,20 @@ void bcmasp_disable_all_filters(struct bcmasp_intf *intf);
 
 void bcmasp_core_clock_set_intf(struct bcmasp_intf *intf, bool en);
 
+struct bcmasp_net_filter *bcmasp_netfilt_get_init(struct bcmasp_intf *intf,
+						  int loc, bool wake_filter,
+						  bool init);
+
+bool bcmasp_netfilt_check_dup(struct bcmasp_intf *intf,
+			      struct ethtool_rx_flow_spec *fs);
+
+void bcmasp_netfilt_release(struct bcmasp_intf *intf,
+			    struct bcmasp_net_filter *nfilt);
+
+int bcmasp_netfilt_get_active(struct bcmasp_intf *intf);
+
+void bcmasp_netfilt_get_all_active(struct bcmasp_intf *intf, u32 *rule_locs,
+				   u32 *rule_cnt);
+
+void bcmasp_netfilt_suspend(struct bcmasp_intf *intf);
 #endif
diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c b/drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c
index ae24a1f74d49..eddd1c43f00e 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c
@@ -30,7 +30,7 @@ static void bcmasp_set_msglevel(struct net_device *dev, u32 level)
 	intf->msg_enable = level;
 }
 
-#define BCMASP_SUPPORTED_WAKE   (WAKE_MAGIC | WAKE_MAGICSECURE)
+#define BCMASP_SUPPORTED_WAKE   (WAKE_MAGIC | WAKE_MAGICSECURE | WAKE_FILTER)
 static void bcmasp_get_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 {
 	struct bcmasp_intf *intf = netdev_priv(dev);
@@ -64,6 +64,133 @@ static int bcmasp_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
 	return 0;
 }
 
+static int bcmasp_flow_insert(struct net_device *dev, struct ethtool_rxnfc *cmd)
+{
+	struct bcmasp_intf *intf = netdev_priv(dev);
+	struct bcmasp_net_filter *nfilter;
+	u32 loc = cmd->fs.location;
+	bool wake = false;
+
+	if (cmd->fs.ring_cookie == RX_CLS_FLOW_WAKE)
+		wake = true;
+
+	/* Currently only supports WAKE filters */
+	if (!wake)
+		return -EOPNOTSUPP;
+
+	switch (cmd->fs.flow_type & ~(FLOW_EXT | FLOW_MAC_EXT)) {
+	case ETHER_FLOW:
+	case IP_USER_FLOW:
+	case TCP_V4_FLOW:
+	case UDP_V4_FLOW:
+	case TCP_V6_FLOW:
+	case UDP_V6_FLOW:
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	/* Check if filter already exists */
+	if (bcmasp_netfilt_check_dup(intf, &cmd->fs))
+		return -EINVAL;
+
+	nfilter = bcmasp_netfilt_get_init(intf, loc, wake, true);
+	if (IS_ERR(nfilter))
+		return PTR_ERR(nfilter);
+
+	/* Return the location where we did insert the filter */
+	cmd->fs.location = nfilter->hw_index;
+	memcpy(&nfilter->fs, &cmd->fs, sizeof(struct ethtool_rx_flow_spec));
+
+	/* Since we only support wake filters, defer register programming till
+	 * suspend time.
+	 */
+	return 0;
+}
+
+static int bcmasp_flow_delete(struct net_device *dev, struct ethtool_rxnfc *cmd)
+{
+	struct bcmasp_intf *intf = netdev_priv(dev);
+	struct bcmasp_net_filter *nfilter;
+
+	nfilter = bcmasp_netfilt_get_init(intf, cmd->fs.location, false, false);
+	if (IS_ERR(nfilter))
+		return PTR_ERR(nfilter);
+
+	bcmasp_netfilt_release(intf, nfilter);
+
+	return 0;
+}
+
+static int bcmasp_flow_get(struct bcmasp_intf *intf, struct ethtool_rxnfc *cmd)
+{
+	struct bcmasp_net_filter *nfilter;
+
+	nfilter = bcmasp_netfilt_get_init(intf, cmd->fs.location, false, false);
+	if (IS_ERR(nfilter))
+		return PTR_ERR(nfilter);
+
+	memcpy(&cmd->fs, &nfilter->fs, sizeof(nfilter->fs));
+
+	cmd->data = NUM_NET_FILTERS;
+
+	return 0;
+}
+
+static int bcmasp_set_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd)
+{
+	struct bcmasp_intf *intf = netdev_priv(dev);
+	int ret = -EOPNOTSUPP;
+
+	mutex_lock(&intf->parent->net_lock);
+
+	switch (cmd->cmd) {
+	case ETHTOOL_SRXCLSRLINS:
+		ret = bcmasp_flow_insert(dev, cmd);
+		break;
+	case ETHTOOL_SRXCLSRLDEL:
+		ret = bcmasp_flow_delete(dev, cmd);
+		break;
+	default:
+		break;
+	}
+
+	mutex_unlock(&intf->parent->net_lock);
+
+	return ret;
+}
+
+static int bcmasp_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd,
+			    u32 *rule_locs)
+{
+	struct bcmasp_intf *intf = netdev_priv(dev);
+	int err = 0;
+
+	mutex_lock(&intf->parent->net_lock);
+
+	switch (cmd->cmd) {
+	case ETHTOOL_GRXCLSRLCNT:
+		cmd->rule_cnt = bcmasp_netfilt_get_active(intf);
+		/* We support specifying rule locations */
+		cmd->data |= RX_CLS_LOC_SPECIAL;
+		break;
+	case ETHTOOL_GRXCLSRULE:
+		err = bcmasp_flow_get(intf, cmd);
+		break;
+	case ETHTOOL_GRXCLSRLALL:
+		bcmasp_netfilt_get_all_active(intf, rule_locs, &cmd->rule_cnt);
+		cmd->data = NUM_NET_FILTERS;
+		break;
+	default:
+		err = -EOPNOTSUPP;
+		break;
+	}
+
+	mutex_unlock(&intf->parent->net_lock);
+
+	return err;
+}
+
 const struct ethtool_ops bcmasp_ethtool_ops = {
 	.get_drvinfo		= bcmasp_get_drvinfo,
 	.get_link		= ethtool_op_get_link,
@@ -73,4 +200,6 @@ const struct ethtool_ops bcmasp_ethtool_ops = {
 	.set_msglevel		= bcmasp_set_msglevel,
 	.get_wol		= bcmasp_get_wol,
 	.set_wol		= bcmasp_set_wol,
+	.get_rxnfc		= bcmasp_get_rxnfc,
+	.set_rxnfc		= bcmasp_set_rxnfc,
 };
diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c b/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
index 1f6f050f9059..e221f07bf743 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
@@ -1316,6 +1316,9 @@ static void bcmasp_suspend_to_wol(struct bcmasp_intf *intf)
 	}
 	umac_wl(intf, reg, UMC_MPD_CTRL);
 
+	if (intf->wolopts & WAKE_FILTER)
+		bcmasp_netfilt_suspend(intf);
+
 	/* UniMAC receive needs to be turned on */
 	umac_enable_set(intf, UMC_CMD_RX_EN, 1);
 
-- 
2.7.4


--000000000000fab03f05fe468213
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
NhTY3E+cXCB11wty89QStajwXdhGJTYEvUgvsq1h8CwJj9w/38ldAQf5WjhPmApYeJR2ewFrBMCM
4lHkdRJ6TDc9nXoEkypUfjJkJHe7Eal06tosh6JpAgMBAAGjggHZMIIB1TAOBgNVHQ8BAf8EBAMC
BaAwgaMGCCsGAQUFBwEBBIGWMIGTME4GCCsGAQUFBzAChkJodHRwOi8vc2VjdXJlLmdsb2JhbHNp
Z24uY29tL2NhY2VydC9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcnQwQQYIKwYBBQUHMAGG
NWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwME0G
A1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxz
aWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEkGA1UdHwRCMEAwPqA8oDqGOGh0dHA6Ly9j
cmwuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3JsMCMGA1UdEQQc
MBqBGGp1c3Rpbi5jaGVuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSME
GDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUIWGeYuaTsnIada5Xx8TR3cheUbgw
DQYJKoZIhvcNAQELBQADggEBAHNQlMqQOFYPYFO71A+8t+qWMmtOdd2iGswSOvpSZ/pmGlfw8ZvY
dRTkl27m37la84AxRkiVMes14JyOZJoMh/g7fbgPlU14eBc6WQWkIA6AmNkduFWTr1pRezkjpeo6
xVmdBLM4VY1TFDYj7S8H2adPuypd62uHMY/MZi+BIUys4uAFA+N3NuUBNjcVZXYPplYxxKEuIFq6
sDL+OV16G+F9CkNMN3txsym8Nnx5WAYZb6+rBUIhMGz70V05xsHQfzvo2s7f0J1tJ5BoRlPPhL0h
VOnWA3h71u9TfSsv+PXVm3P21TfOS2uc1hbzEqyENCP4i5XQ0rv0TmPW42GZ0o4xggJtMIICaQIB
ATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYDVQQDEyhH
bG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwj8BKLXNpALfemdRAwDQYJ
YIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIO1+crPrs31/hglWw9dnzbSWqfd/Qyas2+0Z
q2fRNjJbMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMDYxNjIy
MTQ0MlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFl
AwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATAN
BgkqhkiG9w0BAQEFAASCAQCTVmpA+QSWQag8WxfQN6DnnxgoehyauSE0K6DRfcnBMnZxtyJ6miSo
5Lf+QOYqUACo+DnQRf0zeL2IlsuUo4EeEswSRU3X2EnpMtFozLoHmjOxRilsCuxc5Zkjm9SzVz88
/ZSgnpRMI6Q4R4JMd7K7ImkrwOD/m24bd0Mq5MeeHGx4CDEWmy6LLxX6alCBPs+MAd+lnpSducoE
jJ1bzt5TdsedOe1r5GJoX2KnQAa/JD+X5WhTp6UvbeAoEhh6k/5tFd3/rJgnpZChe5YdbwP8rZOd
zUa75QhTiX3WVYsI4d9oPHFgqV3KycgTi80Q8jWpNGZOdFO9etwBlDNgiAX1
--000000000000fab03f05fe468213--
