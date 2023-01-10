Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ED36636C3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 02:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A10410E102;
	Tue, 10 Jan 2023 01:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8413410E102
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 01:39:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9DD3E614B2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 01:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154A1C433D2;
 Tue, 10 Jan 2023 01:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673314779;
 bh=vrLfad/dEaF4ahcbuNSigjh7IBnihHnE+uf7TW186+Y=;
 h=Date:From:To:Cc:Subject:From;
 b=stbxdH54iAbI7V6ELAgCiLxBF7prOUSb0gNS9VBXx72Bh+BH0p2ddWfgCS0ibUQpN
 kZH0y2ZrtoQaPDDTc0pvnvYmfTXzBQISAg3mOG+Q3L12HRD0/qAnkeJ2g6SKKzyERl
 MQ8i1kqjyHjezyhf3L7hPLfD3Wl8CHkLicKLOA6N03goN9oPzLcfUUu+sRsBbjWMVW
 yHslk5gzxvtPpyi22fOiTQR4EBf9kpsMOwEUL9iFYwkbvs5bwr9jJ6rRXJs7YKO+Br
 4kHoP2n/akDIUnQIE3AkNobhE9TPnuJpEiSufhu4ZaAi+ajLyVhKyvwZmH3vfkJMTR
 YZy61XPD13GBw==
Date: Mon, 9 Jan 2023 19:39:47 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH][next] habanalabs: Replace zero-length arrays with
 flexible-array members
Message-ID: <Y7zB4z5cxpFkPXKV@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zero-length arrays are deprecated[1] and we are moving towards
adopting C99 flexible-array members instead. So, replace zero-length
arrays in a couple of structures with flex-array members.

This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
routines on memcpy() and help us make progress towards globally
enabling -fstrict-flex-arrays=3 [2].

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays [1]
Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [2]
Link: https://github.com/KSPP/linux/issues/78
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/accel/habanalabs/include/gaudi2/gaudi2_packets.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/include/gaudi2/gaudi2_packets.h b/drivers/accel/habanalabs/include/gaudi2/gaudi2_packets.h
index 8bf90fc18bf5..a812f8503f90 100644
--- a/drivers/accel/habanalabs/include/gaudi2/gaudi2_packets.h
+++ b/drivers/accel/habanalabs/include/gaudi2/gaudi2_packets.h
@@ -59,7 +59,7 @@ struct gaudi2_packet {
 	/* The rest of the packet data follows. Use the corresponding
 	 * packet_XXX struct to deference the data, based on packet type
 	 */
-	u8 contents[0];
+	u8 contents[];
 };
 
 struct packet_nop {
@@ -80,7 +80,7 @@ struct packet_wreg32 {
 struct packet_wreg_bulk {
 	__le32 size64;
 	__le32 ctl;
-	__le64 values[0]; /* data starts here */
+	__le64 values[]; /* data starts here */
 };
 
 struct packet_msg_long {
-- 
2.34.1

