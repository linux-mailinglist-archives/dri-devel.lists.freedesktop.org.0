Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D96674C6B2D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 12:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E7910E5D0;
	Mon, 28 Feb 2022 11:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF8610E39C;
 Mon, 28 Feb 2022 11:09:00 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id gb39so24033484ejc.1;
 Mon, 28 Feb 2022 03:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NwvvEiJPPM0SG7ZI4yc03tHRsjcGU4DYrm0+p7QW2+g=;
 b=XoHp2vZs5sXnnQm8jTsL06JwdjgH4Z1Am+qeboNHSyU/csHp7G8mKHTnYwT7vMJf3q
 1zZobpdX4BxBQ2erAJx74EzSCDXfVaAB33jAX9ZekfWtpz9xLL4KIzz7DciQBlIBY9DK
 vi6LJyw6u5UaEjT8CWPzRGPwv8GzX6oWgjgvygChKW8zu7PwVtsUQz/kuHu5rW/3vaBt
 P3mcu2gbh7uG62xQrliOtXiVl+brL2WoHfh7VHyAXnwazE3NNCXTKdQujGPQMoLCoB+H
 4TwL3ENhlSsI5tK0hgbUY+rfbxgFEyt/dohDr5V+g2PZ9mAGfyjh/75qZVaBOXbUEFp6
 QPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NwvvEiJPPM0SG7ZI4yc03tHRsjcGU4DYrm0+p7QW2+g=;
 b=f+XH9uSRj/e/oOCGvtlTek82HmjogCxijBpZjLX+J0LCSqA6IEUDi9wyq8K0fdpTxw
 klpvsuIWBxNsdaKW2X0gt/4Vid8spkIR7efX3CbUfCTjMb3SD9JMyJ/TXzcMnFbjVNoz
 qFRnUswGNZWkNrL+J+q3w1/XLCuvdz+jfkT4cbql7eiwG0MQNAIx3nQHe2l+gu1S+TeT
 na4TzcKnm0sq0MN5+4gQ6S0uxYeDDSzb8E76G57gnm6nJxxWv3Srv7HzV6jNCGSR1J+s
 AKE5D7fowOorO3CqnFAipmssqntiHt6Bq68R3kLuzEjLdZVc1FzEowlitZ66Q41IL7L0
 LvjA==
X-Gm-Message-State: AOAM532zv2zXA1vhDFbxsjGnj0rZl8HXFpgJDDNA+hmUc/1wJvGI3q9p
 nYErl/eDjg1xnDeejVF1s/Q=
X-Google-Smtp-Source: ABdhPJwx6JZK1Sd067eYUFaKDGIuHgaxlGXhzFGfLUQYCLtFq3NCzAqvSFrK3I6DGGTf6F+6FgXuew==
X-Received: by 2002:a17:906:2608:b0:6c9:b248:4dcf with SMTP id
 h8-20020a170906260800b006c9b2484dcfmr14572317ejc.320.1646046539415; 
 Mon, 28 Feb 2022 03:08:59 -0800 (PST)
Received: from localhost.localdomain (dhcp-077-250-038-153.chello.nl.
 [77.250.38.153]) by smtp.googlemail.com with ESMTPSA id
 z22-20020a17090655d600b006d229436793sm4209049ejp.223.2022.02.28.03.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 03:08:59 -0800 (PST)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 4/6] drivers: remove unnecessary use of list iterator variable
Date: Mon, 28 Feb 2022 12:08:20 +0100
Message-Id: <20220228110822.491923-5-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228110822.491923-1-jakobkoschel@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 28 Feb 2022 11:45:51 +0000
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 kvm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-fsdevel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 linux-block@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When list_for_each_entry() completes the iteration over the whole list
without breaking the loop, the iterator value will *always* be a bogus
pointer computed based on the head element.

To avoid type confusion use the actual list head directly instead of last
iterator value.

Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/dma/dw-edma/dw-edma-core.c             | 4 ++--
 drivers/net/ethernet/intel/i40e/i40e_ethtool.c | 3 ++-
 drivers/net/wireless/ath/ath6kl/htc_mbox.c     | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 468d1097a1ec..7883c4831857 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -136,7 +136,7 @@ static void dw_edma_free_burst(struct dw_edma_chunk *chunk)
 	}

 	/* Remove the list head */
-	kfree(child);
+	kfree(chunk->burst);
 	chunk->burst = NULL;
 }

@@ -156,7 +156,7 @@ static void dw_edma_free_chunk(struct dw_edma_desc *desc)
 	}

 	/* Remove the list head */
-	kfree(child);
+	kfree(desc->chunk);
 	desc->chunk = NULL;
 }

diff --git a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c b/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
index 091f36adbbe1..c0ea9dbc4ff6 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_ethtool.c
@@ -3963,7 +3963,8 @@ static void __i40e_reprogram_flex_pit(struct i40e_pf *pf,
 	 * correctly, the hardware will disable flexible field parsing.
 	 */
 	if (!list_empty(flex_pit_list))
-		last_offset = list_prev_entry(entry, list)->src_offset + 1;
+		last_offset = list_entry(flex_pit_list->prev,
+					 struct i40e_flex_pit, list)->src_offset + 1;

 	for (; i < 3; i++, last_offset++) {
 		i40e_write_rx_ctl(&pf->hw,
diff --git a/drivers/net/wireless/ath/ath6kl/htc_mbox.c b/drivers/net/wireless/ath/ath6kl/htc_mbox.c
index e3874421c4c0..cf5b05860799 100644
--- a/drivers/net/wireless/ath/ath6kl/htc_mbox.c
+++ b/drivers/net/wireless/ath/ath6kl/htc_mbox.c
@@ -104,7 +104,7 @@ static void ath6kl_credit_init(struct ath6kl_htc_credit_info *cred_info,
 	 * it use list_for_each_entry_reverse to walk around the whole ep list.
 	 * Therefore assign this lowestpri_ep_dist after walk around the ep_list
 	 */
-	cred_info->lowestpri_ep_dist = cur_ep_dist->list;
+	cred_info->lowestpri_ep_dist = *ep_list;

 	WARN_ON(cred_info->cur_free_credits <= 0);

--
2.25.1

