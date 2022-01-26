Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1239049C69E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 10:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8279110E745;
	Wed, 26 Jan 2022 09:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE6389D8A;
 Wed, 26 Jan 2022 09:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643189988; x=1674725988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oqZaEct2FDrBOdJEYqDq4DnxcFQUdvftSGObPwwQT/8=;
 b=EJxy+9yD//7YJwSK1NV0eqEJ/DyqMzAUhplZPkeI+W6Crun7OJgbOMBr
 wPhmQsJ9sHrB0kBNwJbbNGKVS8zET4IkzS8y39jU6NhO72QqvzFZ5y8OA
 6Ja0zM9JFkb0aEWts/V+pXahU/TFLkdmhGrtTG5JpN4ANTSvONoyxQQ6u
 dAILVdXOCU5s/DInptLbIpJejTFchrfPh8PhOPt5SJbj4ZJAFzUVTnURI
 NDw9fs9gWlYg7P+B3CV5HnDHD6cU/b19moHlEDzpa/digVZWZnZgJPMbL
 C5qnrorrZDQQtY8xsbeev+Zekg67UkRFYroO19C/a8u4Tj2JCIwQN8D0S Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246293755"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="246293755"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:39:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="477433112"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 01:39:31 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-security-module@vger.kernel.org, nouveau@lists.freedesktop.org,
 netdev@vger.kernel.org
Subject: [PATCH v2 11/11] cxgb4: Use str_yes_no()
Date: Wed, 26 Jan 2022 01:39:51 -0800
Message-Id: <20220126093951.1470898-12-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126093951.1470898-1-lucas.demarchi@intel.com>
References: <20220126093951.1470898-1-lucas.demarchi@intel.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Chris Wilson <chris@chris-wilson.co.uk>, Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Leo Li <sunpeng.li@amd.com>,
 Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Raju Rangoju <rajur@chelsio.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the local yesno() implementation and adopt the str_yes_no() from
linux/string_helpers.h.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 .../ethernet/chelsio/cxgb4/cxgb4_debugfs.c    | 249 ++++++++++--------
 1 file changed, 137 insertions(+), 112 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c
index 7d49fd4edc9e..f0d9842962ab 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c
@@ -2015,17 +2015,6 @@ static const struct file_operations rss_debugfs_fops = {
 /* RSS Configuration.
  */
 
-/* Small utility function to return the strings "yes" or "no" if the supplied
- * argument is non-zero.
- */
-static const char *yesno(int x)
-{
-	static const char *yes = "yes";
-	static const char *no = "no";
-
-	return x ? yes : no;
-}
-
 static int rss_config_show(struct seq_file *seq, void *v)
 {
 	struct adapter *adapter = seq->private;
@@ -2039,51 +2028,64 @@ static int rss_config_show(struct seq_file *seq, void *v)
 
 	rssconf = t4_read_reg(adapter, TP_RSS_CONFIG_A);
 	seq_printf(seq, "TP_RSS_CONFIG: %#x\n", rssconf);
-	seq_printf(seq, "  Tnl4TupEnIpv6: %3s\n", yesno(rssconf &
-							TNL4TUPENIPV6_F));
-	seq_printf(seq, "  Tnl2TupEnIpv6: %3s\n", yesno(rssconf &
-							TNL2TUPENIPV6_F));
-	seq_printf(seq, "  Tnl4TupEnIpv4: %3s\n", yesno(rssconf &
-							TNL4TUPENIPV4_F));
-	seq_printf(seq, "  Tnl2TupEnIpv4: %3s\n", yesno(rssconf &
-							TNL2TUPENIPV4_F));
-	seq_printf(seq, "  TnlTcpSel:     %3s\n", yesno(rssconf & TNLTCPSEL_F));
-	seq_printf(seq, "  TnlIp6Sel:     %3s\n", yesno(rssconf & TNLIP6SEL_F));
-	seq_printf(seq, "  TnlVrtSel:     %3s\n", yesno(rssconf & TNLVRTSEL_F));
-	seq_printf(seq, "  TnlMapEn:      %3s\n", yesno(rssconf & TNLMAPEN_F));
-	seq_printf(seq, "  OfdHashSave:   %3s\n", yesno(rssconf &
-							OFDHASHSAVE_F));
-	seq_printf(seq, "  OfdVrtSel:     %3s\n", yesno(rssconf & OFDVRTSEL_F));
-	seq_printf(seq, "  OfdMapEn:      %3s\n", yesno(rssconf & OFDMAPEN_F));
-	seq_printf(seq, "  OfdLkpEn:      %3s\n", yesno(rssconf & OFDLKPEN_F));
-	seq_printf(seq, "  Syn4TupEnIpv6: %3s\n", yesno(rssconf &
-							SYN4TUPENIPV6_F));
-	seq_printf(seq, "  Syn2TupEnIpv6: %3s\n", yesno(rssconf &
-							SYN2TUPENIPV6_F));
-	seq_printf(seq, "  Syn4TupEnIpv4: %3s\n", yesno(rssconf &
-							SYN4TUPENIPV4_F));
-	seq_printf(seq, "  Syn2TupEnIpv4: %3s\n", yesno(rssconf &
-							SYN2TUPENIPV4_F));
-	seq_printf(seq, "  Syn4TupEnIpv6: %3s\n", yesno(rssconf &
-							SYN4TUPENIPV6_F));
-	seq_printf(seq, "  SynIp6Sel:     %3s\n", yesno(rssconf & SYNIP6SEL_F));
-	seq_printf(seq, "  SynVrt6Sel:    %3s\n", yesno(rssconf & SYNVRTSEL_F));
-	seq_printf(seq, "  SynMapEn:      %3s\n", yesno(rssconf & SYNMAPEN_F));
-	seq_printf(seq, "  SynLkpEn:      %3s\n", yesno(rssconf & SYNLKPEN_F));
-	seq_printf(seq, "  ChnEn:         %3s\n", yesno(rssconf &
-							CHANNELENABLE_F));
-	seq_printf(seq, "  PrtEn:         %3s\n", yesno(rssconf &
-							PORTENABLE_F));
-	seq_printf(seq, "  TnlAllLkp:     %3s\n", yesno(rssconf &
-							TNLALLLOOKUP_F));
-	seq_printf(seq, "  VrtEn:         %3s\n", yesno(rssconf &
-							VIRTENABLE_F));
-	seq_printf(seq, "  CngEn:         %3s\n", yesno(rssconf &
-							CONGESTIONENABLE_F));
-	seq_printf(seq, "  HashToeplitz:  %3s\n", yesno(rssconf &
-							HASHTOEPLITZ_F));
-	seq_printf(seq, "  Udp4En:        %3s\n", yesno(rssconf & UDPENABLE_F));
-	seq_printf(seq, "  Disable:       %3s\n", yesno(rssconf & DISABLE_F));
+	seq_printf(seq, "  Tnl4TupEnIpv6: %3s\n",
+		   str_yes_no(rssconf & TNL4TUPENIPV6_F));
+	seq_printf(seq, "  Tnl2TupEnIpv6: %3s\n",
+		   str_yes_no(rssconf & TNL2TUPENIPV6_F));
+	seq_printf(seq, "  Tnl4TupEnIpv4: %3s\n",
+		   str_yes_no(rssconf & TNL4TUPENIPV4_F));
+	seq_printf(seq, "  Tnl2TupEnIpv4: %3s\n",
+		   str_yes_no(rssconf & TNL2TUPENIPV4_F));
+	seq_printf(seq, "  TnlTcpSel:     %3s\n",
+		   str_yes_no(rssconf & TNLTCPSEL_F));
+	seq_printf(seq, "  TnlIp6Sel:     %3s\n",
+		   str_yes_no(rssconf & TNLIP6SEL_F));
+	seq_printf(seq, "  TnlVrtSel:     %3s\n",
+		   str_yes_no(rssconf & TNLVRTSEL_F));
+	seq_printf(seq, "  TnlMapEn:      %3s\n",
+		   str_yes_no(rssconf & TNLMAPEN_F));
+	seq_printf(seq, "  OfdHashSave:   %3s\n",
+		   str_yes_no(rssconf & OFDHASHSAVE_F));
+	seq_printf(seq, "  OfdVrtSel:     %3s\n",
+		   str_yes_no(rssconf & OFDVRTSEL_F));
+	seq_printf(seq, "  OfdMapEn:      %3s\n",
+		   str_yes_no(rssconf & OFDMAPEN_F));
+	seq_printf(seq, "  OfdLkpEn:      %3s\n",
+		   str_yes_no(rssconf & OFDLKPEN_F));
+	seq_printf(seq, "  Syn4TupEnIpv6: %3s\n",
+		   str_yes_no(rssconf & SYN4TUPENIPV6_F));
+	seq_printf(seq, "  Syn2TupEnIpv6: %3s\n",
+		   str_yes_no(rssconf & SYN2TUPENIPV6_F));
+	seq_printf(seq, "  Syn4TupEnIpv4: %3s\n",
+		   str_yes_no(rssconf & SYN4TUPENIPV4_F));
+	seq_printf(seq, "  Syn2TupEnIpv4: %3s\n",
+		   str_yes_no(rssconf & SYN2TUPENIPV4_F));
+	seq_printf(seq, "  Syn4TupEnIpv6: %3s\n",
+		   str_yes_no(rssconf & SYN4TUPENIPV6_F));
+	seq_printf(seq, "  SynIp6Sel:     %3s\n",
+		   str_yes_no(rssconf & SYNIP6SEL_F));
+	seq_printf(seq, "  SynVrt6Sel:    %3s\n",
+		   str_yes_no(rssconf & SYNVRTSEL_F));
+	seq_printf(seq, "  SynMapEn:      %3s\n",
+		   str_yes_no(rssconf & SYNMAPEN_F));
+	seq_printf(seq, "  SynLkpEn:      %3s\n",
+		   str_yes_no(rssconf & SYNLKPEN_F));
+	seq_printf(seq, "  ChnEn:         %3s\n",
+		   str_yes_no(rssconf & CHANNELENABLE_F));
+	seq_printf(seq, "  PrtEn:         %3s\n",
+		   str_yes_no(rssconf & PORTENABLE_F));
+	seq_printf(seq, "  TnlAllLkp:     %3s\n",
+		   str_yes_no(rssconf & TNLALLLOOKUP_F));
+	seq_printf(seq, "  VrtEn:         %3s\n",
+		   str_yes_no(rssconf & VIRTENABLE_F));
+	seq_printf(seq, "  CngEn:         %3s\n",
+		   str_yes_no(rssconf & CONGESTIONENABLE_F));
+	seq_printf(seq, "  HashToeplitz:  %3s\n",
+		   str_yes_no(rssconf & HASHTOEPLITZ_F));
+	seq_printf(seq, "  Udp4En:        %3s\n",
+		   str_yes_no(rssconf & UDPENABLE_F));
+	seq_printf(seq, "  Disable:       %3s\n",
+		   str_yes_no(rssconf & DISABLE_F));
 
 	seq_puts(seq, "\n");
 
@@ -2093,19 +2095,20 @@ static int rss_config_show(struct seq_file *seq, void *v)
 	seq_printf(seq, "  MaskFilter:    %3d\n", MASKFILTER_G(rssconf));
 	if (CHELSIO_CHIP_VERSION(adapter->params.chip) > CHELSIO_T5) {
 		seq_printf(seq, "  HashAll:     %3s\n",
-			   yesno(rssconf & HASHALL_F));
+			   str_yes_no(rssconf & HASHALL_F));
 		seq_printf(seq, "  HashEth:     %3s\n",
-			   yesno(rssconf & HASHETH_F));
+			   str_yes_no(rssconf & HASHETH_F));
 	}
-	seq_printf(seq, "  UseWireCh:     %3s\n", yesno(rssconf & USEWIRECH_F));
+	seq_printf(seq, "  UseWireCh:     %3s\n",
+		   str_yes_no(rssconf & USEWIRECH_F));
 
 	seq_puts(seq, "\n");
 
 	rssconf = t4_read_reg(adapter, TP_RSS_CONFIG_OFD_A);
 	seq_printf(seq, "TP_RSS_CONFIG_OFD: %#x\n", rssconf);
 	seq_printf(seq, "  MaskSize:      %3d\n", MASKSIZE_G(rssconf));
-	seq_printf(seq, "  RRCplMapEn:    %3s\n", yesno(rssconf &
-							RRCPLMAPEN_F));
+	seq_printf(seq, "  RRCplMapEn:    %3s\n",
+		   str_yes_no(rssconf & RRCPLMAPEN_F));
 	seq_printf(seq, "  RRCplQueWidth: %3d\n", RRCPLQUEWIDTH_G(rssconf));
 
 	seq_puts(seq, "\n");
@@ -2113,7 +2116,8 @@ static int rss_config_show(struct seq_file *seq, void *v)
 	rssconf = t4_read_reg(adapter, TP_RSS_CONFIG_SYN_A);
 	seq_printf(seq, "TP_RSS_CONFIG_SYN: %#x\n", rssconf);
 	seq_printf(seq, "  MaskSize:      %3d\n", MASKSIZE_G(rssconf));
-	seq_printf(seq, "  UseWireCh:     %3s\n", yesno(rssconf & USEWIRECH_F));
+	seq_printf(seq, "  UseWireCh:     %3s\n",
+		   str_yes_no(rssconf & USEWIRECH_F));
 
 	seq_puts(seq, "\n");
 
@@ -2123,15 +2127,20 @@ static int rss_config_show(struct seq_file *seq, void *v)
 		seq_printf(seq, "  KeyWrAddrX:     %3d\n",
 			   KEYWRADDRX_G(rssconf));
 		seq_printf(seq, "  KeyExtend:      %3s\n",
-			   yesno(rssconf & KEYEXTEND_F));
-	}
-	seq_printf(seq, "  VfRdRg:        %3s\n", yesno(rssconf & VFRDRG_F));
-	seq_printf(seq, "  VfRdEn:        %3s\n", yesno(rssconf & VFRDEN_F));
-	seq_printf(seq, "  VfPerrEn:      %3s\n", yesno(rssconf & VFPERREN_F));
-	seq_printf(seq, "  KeyPerrEn:     %3s\n", yesno(rssconf & KEYPERREN_F));
-	seq_printf(seq, "  DisVfVlan:     %3s\n", yesno(rssconf &
-							DISABLEVLAN_F));
-	seq_printf(seq, "  EnUpSwt:       %3s\n", yesno(rssconf & ENABLEUP0_F));
+			   str_yes_no(rssconf & KEYEXTEND_F));
+	}
+	seq_printf(seq, "  VfRdRg:        %3s\n",
+		   str_yes_no(rssconf & VFRDRG_F));
+	seq_printf(seq, "  VfRdEn:        %3s\n",
+		   str_yes_no(rssconf & VFRDEN_F));
+	seq_printf(seq, "  VfPerrEn:      %3s\n",
+		   str_yes_no(rssconf & VFPERREN_F));
+	seq_printf(seq, "  KeyPerrEn:     %3s\n",
+		   str_yes_no(rssconf & KEYPERREN_F));
+	seq_printf(seq, "  DisVfVlan:     %3s\n",
+		   str_yes_no(rssconf & DISABLEVLAN_F));
+	seq_printf(seq, "  EnUpSwt:       %3s\n",
+		   str_yes_no(rssconf & ENABLEUP0_F));
 	seq_printf(seq, "  HashDelay:     %3d\n", HASHDELAY_G(rssconf));
 	if (CHELSIO_CHIP_VERSION(adapter->params.chip) <= CHELSIO_T5)
 		seq_printf(seq, "  VfWrAddr:      %3d\n", VFWRADDR_G(rssconf));
@@ -2139,36 +2148,52 @@ static int rss_config_show(struct seq_file *seq, void *v)
 		seq_printf(seq, "  VfWrAddr:      %3d\n",
 			   T6_VFWRADDR_G(rssconf));
 	seq_printf(seq, "  KeyMode:       %s\n", keymode[KEYMODE_G(rssconf)]);
-	seq_printf(seq, "  VfWrEn:        %3s\n", yesno(rssconf & VFWREN_F));
-	seq_printf(seq, "  KeyWrEn:       %3s\n", yesno(rssconf & KEYWREN_F));
+	seq_printf(seq, "  VfWrEn:        %3s\n",
+		   str_yes_no(rssconf & VFWREN_F));
+	seq_printf(seq, "  KeyWrEn:       %3s\n",
+		   str_yes_no(rssconf & KEYWREN_F));
 	seq_printf(seq, "  KeyWrAddr:     %3d\n", KEYWRADDR_G(rssconf));
 
 	seq_puts(seq, "\n");
 
 	rssconf = t4_read_reg(adapter, TP_RSS_CONFIG_CNG_A);
 	seq_printf(seq, "TP_RSS_CONFIG_CNG: %#x\n", rssconf);
-	seq_printf(seq, "  ChnCount3:     %3s\n", yesno(rssconf & CHNCOUNT3_F));
-	seq_printf(seq, "  ChnCount2:     %3s\n", yesno(rssconf & CHNCOUNT2_F));
-	seq_printf(seq, "  ChnCount1:     %3s\n", yesno(rssconf & CHNCOUNT1_F));
-	seq_printf(seq, "  ChnCount0:     %3s\n", yesno(rssconf & CHNCOUNT0_F));
-	seq_printf(seq, "  ChnUndFlow3:   %3s\n", yesno(rssconf &
-							CHNUNDFLOW3_F));
-	seq_printf(seq, "  ChnUndFlow2:   %3s\n", yesno(rssconf &
-							CHNUNDFLOW2_F));
-	seq_printf(seq, "  ChnUndFlow1:   %3s\n", yesno(rssconf &
-							CHNUNDFLOW1_F));
-	seq_printf(seq, "  ChnUndFlow0:   %3s\n", yesno(rssconf &
-							CHNUNDFLOW0_F));
-	seq_printf(seq, "  RstChn3:       %3s\n", yesno(rssconf & RSTCHN3_F));
-	seq_printf(seq, "  RstChn2:       %3s\n", yesno(rssconf & RSTCHN2_F));
-	seq_printf(seq, "  RstChn1:       %3s\n", yesno(rssconf & RSTCHN1_F));
-	seq_printf(seq, "  RstChn0:       %3s\n", yesno(rssconf & RSTCHN0_F));
-	seq_printf(seq, "  UpdVld:        %3s\n", yesno(rssconf & UPDVLD_F));
-	seq_printf(seq, "  Xoff:          %3s\n", yesno(rssconf & XOFF_F));
-	seq_printf(seq, "  UpdChn3:       %3s\n", yesno(rssconf & UPDCHN3_F));
-	seq_printf(seq, "  UpdChn2:       %3s\n", yesno(rssconf & UPDCHN2_F));
-	seq_printf(seq, "  UpdChn1:       %3s\n", yesno(rssconf & UPDCHN1_F));
-	seq_printf(seq, "  UpdChn0:       %3s\n", yesno(rssconf & UPDCHN0_F));
+	seq_printf(seq, "  ChnCount3:     %3s\n",
+		   str_yes_no(rssconf & CHNCOUNT3_F));
+	seq_printf(seq, "  ChnCount2:     %3s\n",
+		   str_yes_no(rssconf & CHNCOUNT2_F));
+	seq_printf(seq, "  ChnCount1:     %3s\n",
+		   str_yes_no(rssconf & CHNCOUNT1_F));
+	seq_printf(seq, "  ChnCount0:     %3s\n",
+		   str_yes_no(rssconf & CHNCOUNT0_F));
+	seq_printf(seq, "  ChnUndFlow3:   %3s\n",
+		   str_yes_no(rssconf & CHNUNDFLOW3_F));
+	seq_printf(seq, "  ChnUndFlow2:   %3s\n",
+		   str_yes_no(rssconf & CHNUNDFLOW2_F));
+	seq_printf(seq, "  ChnUndFlow1:   %3s\n",
+		   str_yes_no(rssconf & CHNUNDFLOW1_F));
+	seq_printf(seq, "  ChnUndFlow0:   %3s\n",
+		   str_yes_no(rssconf & CHNUNDFLOW0_F));
+	seq_printf(seq, "  RstChn3:       %3s\n",
+		   str_yes_no(rssconf & RSTCHN3_F));
+	seq_printf(seq, "  RstChn2:       %3s\n",
+		   str_yes_no(rssconf & RSTCHN2_F));
+	seq_printf(seq, "  RstChn1:       %3s\n",
+		   str_yes_no(rssconf & RSTCHN1_F));
+	seq_printf(seq, "  RstChn0:       %3s\n",
+		   str_yes_no(rssconf & RSTCHN0_F));
+	seq_printf(seq, "  UpdVld:        %3s\n",
+		   str_yes_no(rssconf & UPDVLD_F));
+	seq_printf(seq, "  Xoff:          %3s\n",
+		   str_yes_no(rssconf & XOFF_F));
+	seq_printf(seq, "  UpdChn3:       %3s\n",
+		   str_yes_no(rssconf & UPDCHN3_F));
+	seq_printf(seq, "  UpdChn2:       %3s\n",
+		   str_yes_no(rssconf & UPDCHN2_F));
+	seq_printf(seq, "  UpdChn1:       %3s\n",
+		   str_yes_no(rssconf & UPDCHN1_F));
+	seq_printf(seq, "  UpdChn0:       %3s\n",
+		   str_yes_no(rssconf & UPDCHN0_F));
 	seq_printf(seq, "  Queue:         %3d\n", QUEUE_G(rssconf));
 
 	return 0;
@@ -2263,17 +2288,17 @@ static int rss_pf_config_show(struct seq_file *seq, void *v, int idx)
 		pfconf = v;
 		seq_printf(seq, "%3d  %3s %3s %3s  %3d  %3d  %3d   %3s %3s   %3s %3s   %3s  %3d  %3d\n",
 			   idx,
-			   yesno(pfconf->rss_pf_config & MAPENABLE_F),
-			   yesno(pfconf->rss_pf_config & CHNENABLE_F),
-			   yesno(pfconf->rss_pf_config & PRTENABLE_F),
+			   str_yes_no(pfconf->rss_pf_config & MAPENABLE_F),
+			   str_yes_no(pfconf->rss_pf_config & CHNENABLE_F),
+			   str_yes_no(pfconf->rss_pf_config & PRTENABLE_F),
 			   G_PFnLKPIDX(pfconf->rss_pf_map, idx),
 			   G_PFnMSKSIZE(pfconf->rss_pf_mask, idx),
 			   IVFWIDTH_G(pfconf->rss_pf_config),
-			   yesno(pfconf->rss_pf_config & IP6FOURTUPEN_F),
-			   yesno(pfconf->rss_pf_config & IP6TWOTUPEN_F),
-			   yesno(pfconf->rss_pf_config & IP4FOURTUPEN_F),
-			   yesno(pfconf->rss_pf_config & IP4TWOTUPEN_F),
-			   yesno(pfconf->rss_pf_config & UDPFOURTUPEN_F),
+			   str_yes_no(pfconf->rss_pf_config & IP6FOURTUPEN_F),
+			   str_yes_no(pfconf->rss_pf_config & IP6TWOTUPEN_F),
+			   str_yes_no(pfconf->rss_pf_config & IP4FOURTUPEN_F),
+			   str_yes_no(pfconf->rss_pf_config & IP4TWOTUPEN_F),
+			   str_yes_no(pfconf->rss_pf_config & UDPFOURTUPEN_F),
 			   CH1DEFAULTQUEUE_G(pfconf->rss_pf_config),
 			   CH0DEFAULTQUEUE_G(pfconf->rss_pf_config));
 
@@ -2334,16 +2359,16 @@ static int rss_vf_config_show(struct seq_file *seq, void *v, int idx)
 
 		seq_printf(seq, "%3d  %3s %3s  %3d   %3s %3s   %3s %3s   %3s  %3s   %3s  %4d  %3d %#10x\n",
 			   idx,
-			   yesno(vfconf->rss_vf_vfh & VFCHNEN_F),
-			   yesno(vfconf->rss_vf_vfh & VFPRTEN_F),
+			   str_yes_no(vfconf->rss_vf_vfh & VFCHNEN_F),
+			   str_yes_no(vfconf->rss_vf_vfh & VFPRTEN_F),
 			   VFLKPIDX_G(vfconf->rss_vf_vfh),
-			   yesno(vfconf->rss_vf_vfh & VFVLNEX_F),
-			   yesno(vfconf->rss_vf_vfh & VFUPEN_F),
-			   yesno(vfconf->rss_vf_vfh & VFIP4FOURTUPEN_F),
-			   yesno(vfconf->rss_vf_vfh & VFIP6TWOTUPEN_F),
-			   yesno(vfconf->rss_vf_vfh & VFIP4FOURTUPEN_F),
-			   yesno(vfconf->rss_vf_vfh & VFIP4TWOTUPEN_F),
-			   yesno(vfconf->rss_vf_vfh & ENABLEUDPHASH_F),
+			   str_yes_no(vfconf->rss_vf_vfh & VFVLNEX_F),
+			   str_yes_no(vfconf->rss_vf_vfh & VFUPEN_F),
+			   str_yes_no(vfconf->rss_vf_vfh & VFIP4FOURTUPEN_F),
+			   str_yes_no(vfconf->rss_vf_vfh & VFIP6TWOTUPEN_F),
+			   str_yes_no(vfconf->rss_vf_vfh & VFIP4FOURTUPEN_F),
+			   str_yes_no(vfconf->rss_vf_vfh & VFIP4TWOTUPEN_F),
+			   str_yes_no(vfconf->rss_vf_vfh & ENABLEUDPHASH_F),
 			   DEFAULTQUEUE_G(vfconf->rss_vf_vfh),
 			   KEYINDEX_G(vfconf->rss_vf_vfh),
 			   vfconf->rss_vf_vfl);
-- 
2.34.1

