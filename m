Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA775FA813
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 01:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5DB10E746;
	Mon, 10 Oct 2022 23:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FB310E746
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 23:07:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 17932B81104;
 Mon, 10 Oct 2022 23:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA251C433C1;
 Mon, 10 Oct 2022 23:07:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="gifursMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1665443250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JCoPZES4ois2jKni1UYd8LLvlEU5uwn5Pbvog+swdM4=;
 b=gifursMd+Yo9alG7+M7sUbMUsP3yDizF7ax1AZDiOvrJS3CihSynRHlWhVpIK8pt2hCTn0
 E3mu/OQgrC+lVrw9y5YCqpeMJ09KbDOkX1zDQf0+Gs0oFxkGECRmdrWLlVVJa1gRL9E6JG
 dlbn4qGiOzYQoeDhz/nuLLEO08mDGCQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e23001b4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 10 Oct 2022 23:07:29 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v6 3/7] treewide: use get_random_{u8, u16}() when possible,
 part 1
Date: Mon, 10 Oct 2022 17:06:09 -0600
Message-Id: <20221010230613.1076905-4-Jason@zx2c4.com>
In-Reply-To: <20221010230613.1076905-1-Jason@zx2c4.com>
References: <20221010230613.1076905-1-Jason@zx2c4.com>
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
Cc: linux-wireless@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 x86@kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, kernel-janitors@vger.kernel.org,
 KP Singh <kpsingh@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-mtd@lists.infradead.org, kasan-dev@googlegroups.com,
 "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>,
 WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dave Airlie <airlied@redhat.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Yury Norov <yury.norov@gmail.com>,
 =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Borislav Petkov <bp@alien8.de>, linux-nvme@lists.infradead.org,
 loongarch@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-mmc@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Florian Westphal <fw@strlen.de>, linux-mips@vger.kernel.org,
 =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 linux-crypto@vger.kernel.org, Jan Kara <jack@suse.com>,
 Thomas Graf <tgraf@suug.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than truncate a 32-bit value to a 16-bit value or an 8-bit value,
simply use the get_random_{u8,u16}() functions, which are faster than
wasting the additional bytes from a 32-bit value. This was done
mechanically with this coccinelle script:

@@
expression E;
identifier get_random_u32 =~ "get_random_int|prandom_u32|get_random_u32";
typedef u16;
typedef __be16;
typedef __le16;
typedef u8;
@@
(
- (get_random_u32() & 0xffff)
+ get_random_u16()
|
- (get_random_u32() & 0xff)
+ get_random_u8()
|
- (get_random_u32() % 65536)
+ get_random_u16()
|
- (get_random_u32() % 256)
+ get_random_u8()
|
- (get_random_u32() >> 16)
+ get_random_u16()
|
- (get_random_u32() >> 24)
+ get_random_u8()
|
- (u16)get_random_u32()
+ get_random_u16()
|
- (u8)get_random_u32()
+ get_random_u8()
|
- (__be16)get_random_u32()
+ (__be16)get_random_u16()
|
- (__le16)get_random_u32()
+ (__le16)get_random_u16()
|
- prandom_u32_max(65536)
+ get_random_u16()
|
- prandom_u32_max(256)
+ get_random_u8()
|
- E->inet_id = get_random_u32()
+ E->inet_id = get_random_u16()
)

@@
identifier get_random_u32 =~ "get_random_int|prandom_u32|get_random_u32";
typedef u16;
identifier v;
@@
- u16 v = get_random_u32();
+ u16 v = get_random_u16();

@@
identifier get_random_u32 =~ "get_random_int|prandom_u32|get_random_u32";
typedef u8;
identifier v;
@@
- u8 v = get_random_u32();
+ u8 v = get_random_u8();

@@
identifier get_random_u32 =~ "get_random_int|prandom_u32|get_random_u32";
typedef u16;
u16 v;
@@
-  v = get_random_u32();
+  v = get_random_u16();

@@
identifier get_random_u32 =~ "get_random_int|prandom_u32|get_random_u32";
typedef u8;
u8 v;
@@
-  v = get_random_u32();
+  v = get_random_u8();

// Find a potential literal
@literal_mask@
expression LITERAL;
type T;
identifier get_random_u32 =~ "get_random_int|prandom_u32|get_random_u32";
position p;
@@

        ((T)get_random_u32()@p & (LITERAL))

// Examine limits
@script:python add_one@
literal << literal_mask.LITERAL;
RESULT;
@@

value = None
if literal.startswith('0x'):
        value = int(literal, 16)
elif literal[0] in '123456789':
        value = int(literal, 10)
if value is None:
        print("I don't know how to handle %s" % (literal))
        cocci.include_match(False)
elif value < 256:
        coccinelle.RESULT = cocci.make_ident("get_random_u8")
elif value < 65536:
        coccinelle.RESULT = cocci.make_ident("get_random_u16")
else:
        print("Skipping large mask of %s" % (literal))
        cocci.include_match(False)

// Replace the literal mask with the calculated result.
@plus_one@
expression literal_mask.LITERAL;
position literal_mask.p;
identifier add_one.RESULT;
identifier FUNC;
@@

-       (FUNC()@p & (LITERAL))
+       (RESULT() & LITERAL)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Yury Norov <yury.norov@gmail.com>
Acked-by: Toke Høiland-Jørgensen <toke@toke.dk> # for sch_cake
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/arm/kernel/signal.c                                  | 2 +-
 arch/arm64/kernel/syscall.c                               | 2 +-
 crypto/testmgr.c                                          | 8 ++++----
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c             | 2 +-
 drivers/media/test-drivers/vivid/vivid-radio-rx.c         | 4 ++--
 .../net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c   | 2 +-
 drivers/net/hamradio/baycom_epp.c                         | 2 +-
 drivers/net/hamradio/hdlcdrv.c                            | 2 +-
 drivers/net/hamradio/yam.c                                | 2 +-
 drivers/net/wireguard/selftest/allowedips.c               | 4 ++--
 drivers/net/wireless/st/cw1200/wsm.c                      | 2 +-
 drivers/scsi/lpfc/lpfc_hbadisc.c                          | 6 +++---
 lib/cmdline_kunit.c                                       | 4 ++--
 net/dccp/ipv4.c                                           | 4 ++--
 net/ipv4/datagram.c                                       | 2 +-
 net/ipv4/ip_output.c                                      | 2 +-
 net/ipv4/tcp_ipv4.c                                       | 4 ++--
 net/mac80211/scan.c                                       | 2 +-
 net/netfilter/nf_nat_core.c                               | 4 ++--
 net/sched/sch_cake.c                                      | 6 +++---
 net/sctp/socket.c                                         | 2 +-
 21 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index ea128e32e8ca..e07f359254c3 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -655,7 +655,7 @@ struct page *get_signal_page(void)
 		 PAGE_SIZE / sizeof(u32));
 
 	/* Give the signal return code some randomness */
-	offset = 0x200 + (get_random_int() & 0x7fc);
+	offset = 0x200 + (get_random_u16() & 0x7fc);
 	signal_return_offset = offset;
 
 	/* Copy signal return handlers into the page */
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 733451fe7e41..d72e8f23422d 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -67,7 +67,7 @@ static void invoke_syscall(struct pt_regs *regs, unsigned int scno,
 	 *
 	 * The resulting 5 bits of entropy is seen in SP[8:4].
 	 */
-	choose_random_kstack_offset(get_random_int() & 0x1FF);
+	choose_random_kstack_offset(get_random_u16() & 0x1FF);
 }
 
 static inline bool has_syscall_work(unsigned long flags)
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index be45217acde4..981c637fa2ed 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -927,7 +927,7 @@ static void generate_random_bytes(u8 *buf, size_t count)
 			b = 0xff;
 			break;
 		default:
-			b = (u8)prandom_u32();
+			b = get_random_u8();
 			break;
 		}
 		memset(buf, b, count);
@@ -935,8 +935,8 @@ static void generate_random_bytes(u8 *buf, size_t count)
 		break;
 	case 2:
 		/* Ascending or descending bytes, plus optional mutations */
-		increment = (u8)prandom_u32();
-		b = (u8)prandom_u32();
+		increment = get_random_u8();
+		b = get_random_u8();
 		for (i = 0; i < count; i++, b += increment)
 			buf[i] = b;
 		mutate_buffer(buf, count);
@@ -944,7 +944,7 @@ static void generate_random_bytes(u8 *buf, size_t count)
 	default:
 		/* Fully random bytes */
 		for (i = 0; i < count; i++)
-			buf[i] = (u8)prandom_u32();
+			buf[i] = get_random_u8();
 	}
 }
 
diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
index 9b7bcdce6e44..303d02b1d71c 100644
--- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
+++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
@@ -870,7 +870,7 @@ static void precalculate_color(struct tpg_data *tpg, int k)
 		g = tpg_colors[col].g;
 		b = tpg_colors[col].b;
 	} else if (tpg->pattern == TPG_PAT_NOISE) {
-		r = g = b = prandom_u32_max(256);
+		r = g = b = get_random_u8();
 	} else if (k == TPG_COLOR_RANDOM) {
 		r = g = b = tpg->qual_offset + prandom_u32_max(196);
 	} else if (k >= TPG_COLOR_RAMP) {
diff --git a/drivers/media/test-drivers/vivid/vivid-radio-rx.c b/drivers/media/test-drivers/vivid/vivid-radio-rx.c
index 232cab508f48..8bd09589fb15 100644
--- a/drivers/media/test-drivers/vivid/vivid-radio-rx.c
+++ b/drivers/media/test-drivers/vivid/vivid-radio-rx.c
@@ -104,8 +104,8 @@ ssize_t vivid_radio_rx_read(struct file *file, char __user *buf,
 				break;
 			case 2:
 				rds.block |= V4L2_RDS_BLOCK_ERROR;
-				rds.lsb = prandom_u32_max(256);
-				rds.msb = prandom_u32_max(256);
+				rds.lsb = get_random_u8();
+				rds.msb = get_random_u8();
 				break;
 			case 3: /* Skip block altogether */
 				if (i)
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c
index f90bfba4b303..eda129d0143e 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c
@@ -1466,7 +1466,7 @@ static void make_established(struct sock *sk, u32 snd_isn, unsigned int opt)
 	tp->write_seq = snd_isn;
 	tp->snd_nxt = snd_isn;
 	tp->snd_una = snd_isn;
-	inet_sk(sk)->inet_id = prandom_u32();
+	inet_sk(sk)->inet_id = get_random_u16();
 	assign_rxopt(sk, opt);
 
 	if (tp->rcv_wnd > (RCV_BUFSIZ_M << 10))
diff --git a/drivers/net/hamradio/baycom_epp.c b/drivers/net/hamradio/baycom_epp.c
index 7df78a721b04..791b4a53d69f 100644
--- a/drivers/net/hamradio/baycom_epp.c
+++ b/drivers/net/hamradio/baycom_epp.c
@@ -438,7 +438,7 @@ static int transmit(struct baycom_state *bc, int cnt, unsigned char stat)
 			if ((--bc->hdlctx.slotcnt) > 0)
 				return 0;
 			bc->hdlctx.slotcnt = bc->ch_params.slottime;
-			if (prandom_u32_max(256) > bc->ch_params.ppersist)
+			if (get_random_u8() > bc->ch_params.ppersist)
 				return 0;
 		}
 	}
diff --git a/drivers/net/hamradio/hdlcdrv.c b/drivers/net/hamradio/hdlcdrv.c
index bef904325a0f..2263029d1a20 100644
--- a/drivers/net/hamradio/hdlcdrv.c
+++ b/drivers/net/hamradio/hdlcdrv.c
@@ -377,7 +377,7 @@ void hdlcdrv_arbitrate(struct net_device *dev, struct hdlcdrv_state *s)
 	if ((--s->hdlctx.slotcnt) > 0)
 		return;
 	s->hdlctx.slotcnt = s->ch_params.slottime;
-	if (prandom_u32_max(256) > s->ch_params.ppersist)
+	if (get_random_u8() > s->ch_params.ppersist)
 		return;
 	start_tx(dev, s);
 }
diff --git a/drivers/net/hamradio/yam.c b/drivers/net/hamradio/yam.c
index 97a6cc5c7ae8..2ed2f836f09a 100644
--- a/drivers/net/hamradio/yam.c
+++ b/drivers/net/hamradio/yam.c
@@ -626,7 +626,7 @@ static void yam_arbitrate(struct net_device *dev)
 	yp->slotcnt = yp->slot / 10;
 
 	/* is random > persist ? */
-	if (prandom_u32_max(256) > yp->pers)
+	if (get_random_u8() > yp->pers)
 		return;
 
 	yam_start_tx(dev, yp);
diff --git a/drivers/net/wireguard/selftest/allowedips.c b/drivers/net/wireguard/selftest/allowedips.c
index 41db10f9be49..dd897c0740a2 100644
--- a/drivers/net/wireguard/selftest/allowedips.c
+++ b/drivers/net/wireguard/selftest/allowedips.c
@@ -310,7 +310,7 @@ static __init bool randomized_test(void)
 			for (k = 0; k < 4; ++k)
 				mutated[k] = (mutated[k] & mutate_mask[k]) |
 					     (~mutate_mask[k] &
-					      prandom_u32_max(256));
+					      get_random_u8());
 			cidr = prandom_u32_max(32) + 1;
 			peer = peers[prandom_u32_max(NUM_PEERS)];
 			if (wg_allowedips_insert_v4(&t,
@@ -354,7 +354,7 @@ static __init bool randomized_test(void)
 			for (k = 0; k < 4; ++k)
 				mutated[k] = (mutated[k] & mutate_mask[k]) |
 					     (~mutate_mask[k] &
-					      prandom_u32_max(256));
+					      get_random_u8());
 			cidr = prandom_u32_max(128) + 1;
 			peer = peers[prandom_u32_max(NUM_PEERS)];
 			if (wg_allowedips_insert_v6(&t,
diff --git a/drivers/net/wireless/st/cw1200/wsm.c b/drivers/net/wireless/st/cw1200/wsm.c
index 5a3e7a626702..4a9e4b5d3547 100644
--- a/drivers/net/wireless/st/cw1200/wsm.c
+++ b/drivers/net/wireless/st/cw1200/wsm.c
@@ -1594,7 +1594,7 @@ static int cw1200_get_prio_queue(struct cw1200_common *priv,
 		edca = &priv->edca.params[i];
 		score = ((edca->aifns + edca->cwmin) << 16) +
 			((edca->cwmax - edca->cwmin) *
-			 (get_random_int() & 0xFFFF));
+			 get_random_u16());
 		if (score < best && (winner < 0 || i != 3)) {
 			best = score;
 			winner = i;
diff --git a/drivers/scsi/lpfc/lpfc_hbadisc.c b/drivers/scsi/lpfc/lpfc_hbadisc.c
index c7f834ba8edb..d38ebd7281b9 100644
--- a/drivers/scsi/lpfc/lpfc_hbadisc.c
+++ b/drivers/scsi/lpfc/lpfc_hbadisc.c
@@ -2156,8 +2156,8 @@ lpfc_check_pending_fcoe_event(struct lpfc_hba *phba, uint8_t unreg_fcf)
  * This function makes an running random selection decision on FCF record to
  * use through a sequence of @fcf_cnt eligible FCF records with equal
  * probability. To perform integer manunipulation of random numbers with
- * size unit32_t, the lower 16 bits of the 32-bit random number returned
- * from prandom_u32() are taken as the random random number generated.
+ * size unit32_t, a 16-bit random number returned from get_random_u16() is
+ * taken as the random random number generated.
  *
  * Returns true when outcome is for the newly read FCF record should be
  * chosen; otherwise, return false when outcome is for keeping the previously
@@ -2169,7 +2169,7 @@ lpfc_sli4_new_fcf_random_select(struct lpfc_hba *phba, uint32_t fcf_cnt)
 	uint32_t rand_num;
 
 	/* Get 16-bit uniform random number */
-	rand_num = 0xFFFF & prandom_u32();
+	rand_num = get_random_u16();
 
 	/* Decision with probability 1/fcf_cnt */
 	if ((fcf_cnt * rand_num) < 0xFFFF)
diff --git a/lib/cmdline_kunit.c b/lib/cmdline_kunit.c
index a72a2c16066e..d4572dbc9145 100644
--- a/lib/cmdline_kunit.c
+++ b/lib/cmdline_kunit.c
@@ -76,7 +76,7 @@ static void cmdline_test_lead_int(struct kunit *test)
 		int rc = cmdline_test_values[i];
 		int offset;
 
-		sprintf(in, "%u%s", get_random_int() % 256, str);
+		sprintf(in, "%u%s", get_random_u8(), str);
 		/* Only first '-' after the number will advance the pointer */
 		offset = strlen(in) - strlen(str) + !!(rc == 2);
 		cmdline_do_one_test(test, in, rc, offset);
@@ -94,7 +94,7 @@ static void cmdline_test_tail_int(struct kunit *test)
 		int rc = strcmp(str, "") ? (strcmp(str, "-") ? 0 : 1) : 1;
 		int offset;
 
-		sprintf(in, "%s%u", str, get_random_int() % 256);
+		sprintf(in, "%s%u", str, get_random_u8());
 		/*
 		 * Only first and leading '-' not followed by integer
 		 * will advance the pointer.
diff --git a/net/dccp/ipv4.c b/net/dccp/ipv4.c
index 6a6e121dc00c..713b7b8dad7e 100644
--- a/net/dccp/ipv4.c
+++ b/net/dccp/ipv4.c
@@ -144,7 +144,7 @@ int dccp_v4_connect(struct sock *sk, struct sockaddr *uaddr, int addr_len)
 						    inet->inet_daddr,
 						    inet->inet_sport,
 						    inet->inet_dport);
-	inet->inet_id = prandom_u32();
+	inet->inet_id = get_random_u16();
 
 	err = dccp_connect(sk);
 	rt = NULL;
@@ -443,7 +443,7 @@ struct sock *dccp_v4_request_recv_sock(const struct sock *sk,
 	RCU_INIT_POINTER(newinet->inet_opt, rcu_dereference(ireq->ireq_opt));
 	newinet->mc_index  = inet_iif(skb);
 	newinet->mc_ttl	   = ip_hdr(skb)->ttl;
-	newinet->inet_id   = prandom_u32();
+	newinet->inet_id   = get_random_u16();
 
 	if (dst == NULL && (dst = inet_csk_route_child_sock(sk, newsk, req)) == NULL)
 		goto put_and_exit;
diff --git a/net/ipv4/datagram.c b/net/ipv4/datagram.c
index 405a8c2aea64..0ee7fd259730 100644
--- a/net/ipv4/datagram.c
+++ b/net/ipv4/datagram.c
@@ -73,7 +73,7 @@ int __ip4_datagram_connect(struct sock *sk, struct sockaddr *uaddr, int addr_len
 	reuseport_has_conns(sk, true);
 	sk->sk_state = TCP_ESTABLISHED;
 	sk_set_txhash(sk);
-	inet->inet_id = prandom_u32();
+	inet->inet_id = get_random_u16();
 
 	sk_dst_set(sk, &rt->dst);
 	err = 0;
diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
index 1ae83ad629b2..922c87ef1ab5 100644
--- a/net/ipv4/ip_output.c
+++ b/net/ipv4/ip_output.c
@@ -172,7 +172,7 @@ int ip_build_and_send_pkt(struct sk_buff *skb, const struct sock *sk,
 		 * Avoid using the hashed IP ident generator.
 		 */
 		if (sk->sk_protocol == IPPROTO_TCP)
-			iph->id = (__force __be16)prandom_u32();
+			iph->id = (__force __be16)get_random_u16();
 		else
 			__ip_select_ident(net, iph, 1);
 	}
diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index 6376ad915765..7a250ef9d1b7 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -323,7 +323,7 @@ int tcp_v4_connect(struct sock *sk, struct sockaddr *uaddr, int addr_len)
 						 inet->inet_daddr);
 	}
 
-	inet->inet_id = prandom_u32();
+	inet->inet_id = get_random_u16();
 
 	if (tcp_fastopen_defer_connect(sk, &err))
 		return err;
@@ -1543,7 +1543,7 @@ struct sock *tcp_v4_syn_recv_sock(const struct sock *sk, struct sk_buff *skb,
 	inet_csk(newsk)->icsk_ext_hdr_len = 0;
 	if (inet_opt)
 		inet_csk(newsk)->icsk_ext_hdr_len = inet_opt->opt.optlen;
-	newinet->inet_id = prandom_u32();
+	newinet->inet_id = get_random_u16();
 
 	/* Set ToS of the new socket based upon the value of incoming SYN.
 	 * ECT bits are set later in tcp_init_transfer().
diff --git a/net/mac80211/scan.c b/net/mac80211/scan.c
index 0e8c4f48c36d..dc3cdee51e66 100644
--- a/net/mac80211/scan.c
+++ b/net/mac80211/scan.c
@@ -641,7 +641,7 @@ static void ieee80211_send_scan_probe_req(struct ieee80211_sub_if_data *sdata,
 		if (flags & IEEE80211_PROBE_FLAG_RANDOM_SN) {
 			struct ieee80211_hdr *hdr = (void *)skb->data;
 			struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
-			u16 sn = get_random_u32();
+			u16 sn = get_random_u16();
 
 			info->control.flags |= IEEE80211_TX_CTRL_NO_SEQNO;
 			hdr->seq_ctrl =
diff --git a/net/netfilter/nf_nat_core.c b/net/netfilter/nf_nat_core.c
index d8e6380f6337..18319a6e6806 100644
--- a/net/netfilter/nf_nat_core.c
+++ b/net/netfilter/nf_nat_core.c
@@ -468,7 +468,7 @@ static void nf_nat_l4proto_unique_tuple(struct nf_conntrack_tuple *tuple,
 	if (range->flags & NF_NAT_RANGE_PROTO_OFFSET)
 		off = (ntohs(*keyptr) - ntohs(range->base_proto.all));
 	else
-		off = prandom_u32();
+		off = get_random_u16();
 
 	attempts = range_size;
 	if (attempts > max_attempts)
@@ -490,7 +490,7 @@ static void nf_nat_l4proto_unique_tuple(struct nf_conntrack_tuple *tuple,
 	if (attempts >= range_size || attempts < 16)
 		return;
 	attempts /= 2;
-	off = prandom_u32();
+	off = get_random_u16();
 	goto another_round;
 }
 
diff --git a/net/sched/sch_cake.c b/net/sched/sch_cake.c
index 55c6879d2c7e..7193d25932ce 100644
--- a/net/sched/sch_cake.c
+++ b/net/sched/sch_cake.c
@@ -2092,11 +2092,11 @@ static struct sk_buff *cake_dequeue(struct Qdisc *sch)
 
 		WARN_ON(host_load > CAKE_QUEUES);
 
-		/* The shifted prandom_u32() is a way to apply dithering to
-		 * avoid accumulating roundoff errors
+		/* The get_random_u16() is a way to apply dithering to avoid
+		 * accumulating roundoff errors
 		 */
 		flow->deficit += (b->flow_quantum * quantum_div[host_load] +
-				  (prandom_u32() >> 16)) >> 16;
+				  get_random_u16()) >> 16;
 		list_move_tail(&flow->flowchain, &b->old_flows);
 
 		goto retry;
diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index 1e354ba44960..83628c347744 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -9448,7 +9448,7 @@ void sctp_copy_sock(struct sock *newsk, struct sock *sk,
 	newinet->inet_rcv_saddr = inet->inet_rcv_saddr;
 	newinet->inet_dport = htons(asoc->peer.port);
 	newinet->pmtudisc = inet->pmtudisc;
-	newinet->inet_id = prandom_u32();
+	newinet->inet_id = get_random_u16();
 
 	newinet->uc_ttl = inet->uc_ttl;
 	newinet->mc_loop = 1;
-- 
2.37.3

