Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF6DBEEE4F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 00:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F19E10E060;
	Sun, 19 Oct 2025 22:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K2ZfGYlg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1B510E159
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 18:35:28 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-269640c2d4bso6410025ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 11:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760898928; x=1761503728; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rRfOoLkKKIZ1P08u43a+VdAcQJSYKDXjEt4i3GhWSy8=;
 b=K2ZfGYlgI9o2FB6Z64tL2Lz+GLjOj5BTiM2XC4rLaTmcRM4wBjSt1vd8gfNqbRjf7J
 U8YTowzP6JdnNdv6H9UetRRRIf57LmsAD7kEXntbpHt+1kXMNChLfREhGT50Yg/0SPgv
 2lH/72ksYRsRnQ6M7mdQEbkK0U6SlxVqu1m7M0rpa4NSQCJdTRMxebvseFX/OpJXr/jS
 ILmBbySwMccfv4o0qzxoJtpk7RuNYWKVZ+58VbFFZXSLS7W0iBewZ0SZnCRAO/fwTkuF
 lvPtXvUAuEVo2CnUixe4mdchR/xZnzRtkU6ibF3vDBZwTNNQ+t4vUthTnFtHwp3EAh6g
 uXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760898928; x=1761503728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rRfOoLkKKIZ1P08u43a+VdAcQJSYKDXjEt4i3GhWSy8=;
 b=hNWL7T2tErEL47yr6uiRKDcUQjHW1oHi/L+yKeycy2p3oppiU6bDh7yhDTUZBkfI6E
 qXjjEiVSUn5BzTdAZfVCJSuI7+qoqd4U/ZH0gN9J/rIjed31aV1L2xyUwdKteCrKlsEH
 ywFD4Rdp2bbLC1c7QHl6sgZmuViBs09uExLhMAxmtGIWM3XdpKHjuzzQPn9qcGOy1b+G
 MkUb3+VXKQzsnsQLDqSdUSZAOLmhbxdZ4srq4Tx7Nnc7VnekFlpNmUA2baSlKGdSroMH
 KXb6PW04ANA0Nsrm/SaCiPkyPp75CWoUolN0IQTtrZRmRUlUUTxzu4RYycsZVrFz4BsS
 KvCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUFShrSy6MeJvWNEc51ugGAkLXWKfDKFFM6rnpvA2w/Mhhg/0EZgRf4qmU6ys1bqGm2BA/gKEeU4M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0f9GKCOCp5z0b+JasQcGgis7O81swH9Q4TNaP6sLpbhUIfXyc
 icvpFj2EVXMsiwEOGQ/rBe2YaAb8vqaREdcymBW5IdU1vI8r3w0r6FGX
X-Gm-Gg: ASbGnct0EPB66WZksn2GsMO4UiNHfvaAI2ZASqYorQAoYB6G4rdoNBP46uvyoCibmF1
 FqTwwi3WXrmJ7tmEvnvnrw9BaNv4Wr2Ju2OqPrJJ7HYEXlSqr0o3/oMQPuzyh8BvN+3KPY6QFzp
 NeezZTnhn4rV/v8rAyBs4OywZDv/ziY69eWmNuiWAs529OiPmMi5Uaiz6PtvnNIbsrgfPeeQcI2
 gW+DTg8p+nUiv3hlMHwZFIoFCtD+HE26SHS4VEVNhqKlalq09HkKgQMDPQqURCGLExv/+zo47D5
 FEjUqXBZJGuODMnFkMeZM2XhHeAYXBEZay6QseArBZQrJ68fufIkwlSsVyWzX1YPLOPSl/ZmbAS
 VwGsGGquBmVqCfZQ153KJgalNfDhsWmB1GtXlEfYUH4keRAfeBlOosDEx+h3Yd4SuImK29WSG2x
 bTrk0Ywvj1ww==
X-Google-Smtp-Source: AGHT+IEBr/+KS4HtviMuGoC1wIJRCMADPtQbZ3CNlH5yqb2pJ0Un5KgzQq3dwYcp0NYpYolDK9OUyw==
X-Received: by 2002:a17:903:8c3:b0:25a:4437:dbb7 with SMTP id
 d9443c01a7336-290c9d2debcmr73367365ad.4.1760898928335; 
 Sun, 19 Oct 2025 11:35:28 -0700 (PDT)
Received: from sulfur-sorcerer.. ([2409:40d4:154:dd90:39bc:ea42:d3d:15d6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471fde15sm58785055ad.84.2025.10.19.11.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 11:35:27 -0700 (PDT)
From: PIYUSH CHOUDHARY <mercmerc961@gmail.com>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, PIYUSH CHOUDHARY <mercmerc961@gmail.com>
Subject: [PATCH] video: fb: Fix typo in comment
Date: Mon, 20 Oct 2025 00:05:08 +0530
Message-ID: <20251019183508.20804-1-mercmerc961@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 19 Oct 2025 22:52:28 +0000
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

Fix typo: "verical" -> "vertical" in macro description

Signed-off-by: PIYUSH CHOUDHARY <mercmerc961@gmail.com>
---
 include/uapi/linux/fb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/fb.h b/include/uapi/linux/fb.h
index cde8f173f566..22acaaec7b1c 100644
--- a/include/uapi/linux/fb.h
+++ b/include/uapi/linux/fb.h
@@ -319,7 +319,7 @@ enum {
 #define FB_VBLANK_HAVE_VCOUNT	0x020	/* the vcount field is valid */
 #define FB_VBLANK_HAVE_HCOUNT	0x040	/* the hcount field is valid */
 #define FB_VBLANK_VSYNCING	0x080	/* currently in a vsync */
-#define FB_VBLANK_HAVE_VSYNC	0x100	/* verical syncs can be detected */
+#define FB_VBLANK_HAVE_VSYNC	0x100	/* vertical syncs can be detected */
 
 struct fb_vblank {
 	__u32 flags;			/* FB_VBLANK flags */
-- 
2.43.0

