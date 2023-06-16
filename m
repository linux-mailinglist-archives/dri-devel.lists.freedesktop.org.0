Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84992733C34
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 00:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABFF10E699;
	Fri, 16 Jun 2023 22:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D04B10E699
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 22:14:44 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1b517ee9157so8654025ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 15:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1686953683; x=1689545683;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=K5MKJ9EraFeHKYhJssCJ/q4TfmVCNIq/ZjLRfgMQNc4=;
 b=EhC0SIZgAD9A5nS1w3tswbmptJhacx2qwTd4wKwf9xtvTiQbWCrbz5Ge+EWARr9tTU
 E16g8nKDiVUfBwov58bZKa4C0/k8MHyts+pL0cU87+TAQnSvJZPSqLoOaOry7eV+g6m8
 YDXrUDIZlfgnXFFwD/bmKO5FnkMfPySJSQeto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686953683; x=1689545683;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K5MKJ9EraFeHKYhJssCJ/q4TfmVCNIq/ZjLRfgMQNc4=;
 b=Fg50dIa+WEDRQVHSPQMWJcbJdu9+BYdxrUiHXKauZfj7dtNzQtZ1jOPeMBIw2TtPu0
 BC37MktTMiXx41UCkpJ/qvbCUz7dQgAv22hRMVye0xTcec9ewH4eDTF9vl2YPC/l2/gF
 meQqyOF4XisPOW2GqlBo4anZLb61AjEMVfiuTWmqTwK90YNTHWqFszKcmLcNcll44LI2
 8rlhps3nScMC+tIt/yx1shoXwYFM/+kPiPMV1mShM8GAwvQzBEtI1LlMtLMQqGgaAlTi
 MhgOnm/TcgOLPtil515rUPsHFNAuxyH6dkSebka8Vrk9z2ZkTGx6gqE87b/iIF653nXQ
 LxNA==
X-Gm-Message-State: AC+VfDwLFnHc2LYp5pT/oVcyabg1gZ8IiOqVacwIebRMYJhS+TMSv7g3
 uNrayxi7nan+iLLyT0XiLNhtsg==
X-Google-Smtp-Source: ACHHUZ77u5VHB0u0DFSQt7WK8dxMR9hEYcsd+r1L9BQUi8qb1YB1XF55uP1jscdppXTdIgavyfjk7g==
X-Received: by 2002:a17:903:442:b0:1b1:d39e:28bb with SMTP id
 iw2-20020a170903044200b001b1d39e28bbmr2426746plb.34.1686953683626; 
 Fri, 16 Jun 2023 15:14:43 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a170902ab8c00b001aaed524541sm16220860plr.227.2023.06.16.15.14.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Jun 2023 15:14:43 -0700 (PDT)
From: Justin Chen <justin.chen@broadcom.com>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH net-next v8 06/11] net: bcmasp: Add support for eee mode
Date: Fri, 16 Jun 2023 15:14:19 -0700
Message-Id: <1686953664-17498-7-git-send-email-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1686953664-17498-1-git-send-email-justin.chen@broadcom.com>
References: <1686953664-17498-1-git-send-email-justin.chen@broadcom.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="00000000000015921b05fe4683cb"
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

--00000000000015921b05fe4683cb

Add support for eee mode.

Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
 drivers/net/ethernet/broadcom/asp2/bcmasp.h        |  4 ++
 .../net/ethernet/broadcom/asp2/bcmasp_ethtool.c    | 61 ++++++++++++++++++++++
 drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c   |  6 +++
 3 files changed, 71 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.h b/drivers/net/ethernet/broadcom/asp2/bcmasp.h
index e791b869006e..d6740077877a 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp.h
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.h
@@ -313,6 +313,8 @@ struct bcmasp_intf {
 	/* Used if per intf wol irq */
 	int			wol_irq;
 	unsigned int		wol_irq_enabled:1;
+
+	struct ethtool_eee	eee;
 };
 
 #define NUM_NET_FILTERS				32
@@ -559,4 +561,6 @@ void bcmasp_netfilt_get_all_active(struct bcmasp_intf *intf, u32 *rule_locs,
 				   u32 *rule_cnt);
 
 void bcmasp_netfilt_suspend(struct bcmasp_intf *intf);
+
+void bcmasp_eee_enable_set(struct bcmasp_intf *intf, bool enable);
 #endif
diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c b/drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c
index eddd1c43f00e..1e96a69043f3 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c
@@ -191,6 +191,65 @@ static int bcmasp_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd,
 	return err;
 }
 
+void bcmasp_eee_enable_set(struct bcmasp_intf *intf, bool enable)
+{
+	u32 reg;
+
+	reg = umac_rl(intf, UMC_EEE_CTRL);
+	if (enable)
+		reg |= EEE_EN;
+	else
+		reg &= ~EEE_EN;
+	umac_wl(intf, reg, UMC_EEE_CTRL);
+
+	intf->eee.eee_enabled = enable;
+	intf->eee.eee_active = enable;
+}
+
+static int bcmasp_get_eee(struct net_device *dev, struct ethtool_eee *e)
+{
+	struct bcmasp_intf *intf = netdev_priv(dev);
+	struct ethtool_eee *p = &intf->eee;
+
+	if (!dev->phydev)
+		return -ENODEV;
+
+	e->eee_enabled = p->eee_enabled;
+	e->eee_active = p->eee_active;
+	e->tx_lpi_enabled = p->tx_lpi_enabled;
+	e->tx_lpi_timer = umac_rl(intf, UMC_EEE_LPI_TIMER);
+
+	return phy_ethtool_get_eee(dev->phydev, e);
+}
+
+static int bcmasp_set_eee(struct net_device *dev, struct ethtool_eee *e)
+{
+	struct bcmasp_intf *intf = netdev_priv(dev);
+	struct ethtool_eee *p = &intf->eee;
+	int ret;
+
+	if (!dev->phydev)
+		return -ENODEV;
+
+	if (!p->eee_enabled) {
+		bcmasp_eee_enable_set(intf, false);
+	} else {
+		ret = phy_init_eee(dev->phydev, 0);
+		if (ret) {
+			netif_err(intf, hw, dev,
+				  "EEE initialization failed: %d\n", ret);
+			return ret;
+		}
+
+		umac_wl(intf, e->tx_lpi_timer, UMC_EEE_LPI_TIMER);
+		intf->eee.eee_active = ret >= 0;
+		intf->eee.tx_lpi_enabled = e->tx_lpi_enabled;
+		bcmasp_eee_enable_set(intf, true);
+	}
+
+	return phy_ethtool_set_eee(dev->phydev, e);
+}
+
 const struct ethtool_ops bcmasp_ethtool_ops = {
 	.get_drvinfo		= bcmasp_get_drvinfo,
 	.get_link		= ethtool_op_get_link,
@@ -202,4 +261,6 @@ const struct ethtool_ops bcmasp_ethtool_ops = {
 	.set_wol		= bcmasp_set_wol,
 	.get_rxnfc		= bcmasp_get_rxnfc,
 	.set_rxnfc		= bcmasp_set_rxnfc,
+	.set_eee		= bcmasp_set_eee,
+	.get_eee		= bcmasp_get_eee,
 };
diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c b/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
index e221f07bf743..2c8a9d5711de 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
@@ -653,6 +653,9 @@ static void bcmasp_adj_link(struct net_device *dev)
 			UMC_CMD_TX_PAUSE_IGNORE);
 		reg |= cmd_bits;
 		umac_wl(intf, reg, UMC_CMD);
+
+		intf->eee.eee_active = phy_init_eee(phydev, 0) >= 0;
+		bcmasp_eee_enable_set(intf, intf->eee.eee_active);
 	}
 
 	reg = rgmii_rl(intf, RGMII_OOB_CNTRL);
@@ -1403,6 +1406,9 @@ int bcmasp_interface_resume(struct bcmasp_intf *intf)
 
 	bcmasp_resume_from_wol(intf);
 
+	if (intf->eee.eee_enabled)
+		bcmasp_eee_enable_set(intf, true);
+
 	netif_device_attach(dev);
 
 	return 0;
-- 
2.7.4


--00000000000015921b05fe4683cb
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
YIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIOi8JH/EUtf9LamFHvRPEWh/NQSXWF8NHRUc
wUeL6GriMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMDYxNjIy
MTQ0M1owaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFl
AwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATAN
BgkqhkiG9w0BAQEFAASCAQBysdwBkzBIYhKw5W9N4QMw9gLzdgPWtXWxF81y+2QYX6LEaxg8QtqN
MhcUixwSg7cAYXAmAnUTqql48Wkypx3Kj5439jmSrmduFPIDNKTTSu+XR2O22BOPzjICVpXo5Q/A
GloJy0EVU4Uw1DQ2G1cBAvQ5vL2axbCjmcokz0Akr8UYrcFgcTv1Axj1h0TSSc2uPr5asY66U503
xPVW40KG4M0/phILSJ8iWLT1GVotLCbl4Kg9vwapvzVs4/3xT674Vo+RJHD0OOGkHm5d9z7dioAJ
rwa/4xPH44RdZ7wUolPLMb5lO6oh7TLyB23MaoJs0yyBvGycapMnOu/4xT01
--00000000000015921b05fe4683cb--
