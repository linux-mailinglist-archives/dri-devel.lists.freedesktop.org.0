Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFLILYk1l2k/vwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:08:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61627160873
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99EE510E713;
	Thu, 19 Feb 2026 16:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cEDlVM3s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE73F10E709
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 16:08:33 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-4376c0bffc1so920683f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 08:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771517312; x=1772122112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2mFP16bmgZwjg48X3wc2fLqGCWxd1xtWsGx4Bz/HNX0=;
 b=cEDlVM3sVO6Smx0lflVfNccVkUsQAMQ6wapmsVvdtPpQHu7XGLbuE2KUwKFlLXHAPL
 omMfKUHQr3uttNaiWaJhmb2SjBZfJKo2tDAsMBKFvQtChNiDFEtGez7Aa0WSJlTq029l
 B3CME0ht+w982Bk4jlwD+HHLqFWOpsDUoEX9nwMVfkJK61AsXToQ0iTVqQ7wCShHV2SW
 /HFyt/5mxXrOYz11DN41QDmgQkr7smVrHvaR08CgKcfv5hfQK+cthT7tg6/1A8ehXweh
 KkJc66144ELtuRqA8GaQSPvTyKynPzGOBKddQYq4Nvlp7zYfQ+WN3cvOWl9rB5uD151Z
 ntCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771517312; x=1772122112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2mFP16bmgZwjg48X3wc2fLqGCWxd1xtWsGx4Bz/HNX0=;
 b=wgIirA5H23Qh87Swhd5l7T/VIx2aiVJg2lW2//sx7j6yeBYHP37ut1IK+4tbvfgGoT
 LvmYZle8b/4OuZe0khBz/8Y5GscuPAknfS4rKc7clEwvoIJxe7HPoQ/FNU0166uhKdIP
 DIdYj9obz0BcVg4vhzLrgpH+nms4xkchE5dqMRNhW0smHfDUE7PSF4EPoT9nwPWlwy64
 3xSd2eLeuiR8tfvt2WMr20Nbow6s95qEQ42Cq4Wp3+hJ0qrWFNjYuOSGHVXNN0cyFoKy
 LOZ8LyziEyJoYReYVhuVUHkDeMPv7CKSJziRN3431C3NHZLH6uZhciKdQNFR3hLlbw+9
 HCIw==
X-Gm-Message-State: AOJu0Yzs0NgYCTcy9izP483vWixuF1cdB7Q34UDu4Jw0Ev5vUBg7S2Iu
 oq17ptlUkALkCWi+jvOi6p6A2XiW2Selt2H9m+Vb1qR0FkQqoGdjsI1O
X-Gm-Gg: AZuq6aKJxJzdXHGaOz89GNNS94OyTDapIGnf4xsTIQ9dJoYk3vNLOegoXTcJvmUd3hD
 O4JHdW/TRYPeQY1f+JtWyB8rmp7l59AkdMrsK59oIoNWzRE1/LUdM2W6LdpNYLLV3MiFHmNsRgk
 SPz1+Q6y6eGYtdjUCzkaReubCnrNbGEkUwiuPNw7aXCCU73ADfM30r5s1MmDD5hH+OPgmNVY2OZ
 I+TClaRj//0XV5rdeKQsCsymQ2NHe5hC9CTbzd/8iFCMt9S4KLpRSejJYA2ZWkAKugkNvLIepJd
 1LNWkUjMmNh6HytQts5+C5x2tITz18nwxrOuO48yzu0QC0g2X+DeuOutU/BDfqR/BxsAZQk8vCw
 9wsx25hXSbbrnr0aIizwRDIS+R2IzohVmveBidAm9melYslWHfz2ntjW3p+qSI3oQ8z5SMss6cm
 8028uMgNly9BB4q46tqpcFB2DjulwU8oz0dU9N
X-Received: by 2002:a05:6000:2f83:b0:437:9ccf:6b20 with SMTP id
 ffacd0b85a97d-4395fd693ffmr5429509f8f.55.1771517312356; 
 Thu, 19 Feb 2026 08:08:32 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1503:b900:9c42:5977:662a:d02d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac82f7sm54580031f8f.28.2026.02.19.08.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 08:08:32 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org,
	matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 8/8] dma-buf: use inline lock for the dma-fence-chain
Date: Thu, 19 Feb 2026 17:07:11 +0100
Message-ID: <20260219160822.1529-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219160822.1529-1-christian.koenig@amd.com>
References: <20260219160822.1529-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 61627160873
X-Rspamd-Action: no action

Using the inline lock is now the recommended way for dma_fence
implementations.

So use this approach for the framework's internal fences as well.

Also saves about 4 bytes for the external spinlock.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/dma-buf/dma-fence-chain.c | 3 +--
 include/linux/dma-fence-chain.h   | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a8a90acf4f34..a707792b6025 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -245,7 +245,6 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 	struct dma_fence_chain *prev_chain = to_dma_fence_chain(prev);
 	uint64_t context;
 
-	spin_lock_init(&chain->lock);
 	rcu_assign_pointer(chain->prev, prev);
 	chain->fence = fence;
 	chain->prev_seqno = 0;
@@ -261,7 +260,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 			seqno = max(prev->seqno, seqno);
 	}
 
-	dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
+	dma_fence_init64(&chain->base, &dma_fence_chain_ops, NULL,
 			 context, seqno);
 
 	/*
diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
index 68c3c1e41014..d39ce7a2e599 100644
--- a/include/linux/dma-fence-chain.h
+++ b/include/linux/dma-fence-chain.h
@@ -46,7 +46,6 @@ struct dma_fence_chain {
 		 */
 		struct irq_work work;
 	};
-	spinlock_t lock;
 };
 
 
-- 
2.43.0

