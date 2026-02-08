Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6v/VC8XOiGlkwQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 18:58:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8F11099F2
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 18:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE6C10E118;
	Sun,  8 Feb 2026 17:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="A4fnf+EJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C49E10E118
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Feb 2026 17:58:24 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so51976275e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Feb 2026 09:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770573503; x=1771178303;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xgsxpv+tOpJi9iPb3qv9iUCwN4SjO4ejQcThYO75yB4=;
 b=A4fnf+EJ+oNsa+6ZsAsyf2rnCobR9rlSzIW7w/jxIbMphJN7fs+4ILWB0iHzib9XqV
 T7sig11XiEBIm/QRfsuab42TLtU1bBxJm3OJQ4pLa/2sbdxBfqcccPgKDZEav42bjlia
 l9HYd+0ul3O/5s2BEDoctm5+O+ihnDQ19AiHMjpLAanln7sIZXNXcpz4eAGqmM5m2u4u
 ZDBm8v9Aic87Pr9LZLHsBxuPKtA1/wom6sAGJDYtfg7h6PQ5onROBLiAzl3qDEmUnOYt
 Bt+f6lT8Eaj525/++uZg7ha6LLpR/k895PBIiYG2ZxgzPYmzcGE1B8S1IO0C72A6LkhZ
 S99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770573503; x=1771178303;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xgsxpv+tOpJi9iPb3qv9iUCwN4SjO4ejQcThYO75yB4=;
 b=GiA5I8fxZvpei0aGOq1WLl1j7mqR8ONV/PbYbUjh63/UGdDEjIjQjxBdHz5NsVy6PH
 4lH2f33kAGj/NoPOLc9I7WPj2ZHFXFn5UhIdvocE/wlaH+hr+wWt38EwhUzU8P6nSQRy
 NDF5vyU9fcugLPIaVb3Q3jqwMbcCq15klrGboWOOFWfN/eaesqpIET6uaZv7pSxOLf0+
 BYfWGMtF8FZFLL1FRgaNOpsi8snCjTf5qFWOtFA+n7M3u8Q2O8YEMK7yIHnzrxSVFc62
 KGKZTmXmERriYCcbX5ScAWyuSGVOG1r/dbycH5q7QBBgQz345RtBx95ghs43AaNVO2HM
 Kpqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5UKCaxGNLnHjsUojRQNXBfDGQs8To1y1nC3dAGk5p64x9Y6XzKGlOlIH+70ZpCbt1y4ZbYkuRte4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yydq3c/HsuVE38rgrfclOhlQaWyuos+gvzzbjFWwtDNUBo9x+D8
 YW0o15tW4tg+k7zDuPTITuoVPxSV4jkDkmiG5lsNlagCHvJ0bh2CYvbO5IibEN++DS4=
X-Gm-Gg: AZuq6aKIWnewrW3x3Iw9sW9jxgADoDphQ1x1it7i+tNZDhCeK6g3ha8v01+Xhl+Talg
 t7pSLHXSrVz80KJUqWGRk2FYw3/hHhZ7mrS0U9+S5aE/g2cL3SCFOjaE7z0b2d4VUwwFH/zZ2lh
 QXrGY/W8arsKpJbx+HH7vfbE9KC/XIQ7x4u7bQWuEMU2Qm37InLaccHT2bqimaThIMHuymSLRm6
 J/3yg3Ua12C47ldyH94Iaecjnxe1rFfScTGlhW0tFSGoh28+P5FFyWUNJgslc5t9aJIrg9Ho/f6
 n/6UpHokAClthd72qlI6RpuONo66EY510bHLU8xErWTRwSiUaBXQSTylGxiF8AEUfoXXbC5cTfn
 4R+LCabE1x1SPUvUkEOD/tP806KF0m45Cqk+N2ob2Gt5RGIOwjSHNdCdVcpYGGib9lEp8u0WnjS
 /75kiQlKr++OLOVH5p
X-Received: by 2002:a05:600c:3553:b0:475:da1a:5418 with SMTP id
 5b1f17b1804b1-483201dc49emr121113255e9.1.1770573503040; 
 Sun, 08 Feb 2026 09:58:23 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4831d0b5b31sm244992875e9.4.2026.02.08.09.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Feb 2026 09:58:22 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/6] fbdev: au1100fb: support COMPILE_TEST and fix
 multi-device support
Date: Sun,  8 Feb 2026 18:57:57 +0100
Message-ID: <cover.1770572936.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=W2NuPR6ntya68Cnkaanj4tYTUVC5lDpyIcGnbNzU+tM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpiM6nZD7qhp+RL3FOLivwJlKWpXGSMkMfprYse
 0hghgfZlhuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaYjOpwAKCRCPgPtYfRL+
 TsLOB/9hYrADUnPDJUoNXepwg98D4XLi1LqcVvylr6jgtwNYUoTub2/Bf1H43C3Fb2AaUBsJ6dg
 xAOAoc9DWm79lyqidG25hbwS0dvK7Pkk4lrk1/Mlr/YLAE8+v2FaBRExH+eaFMh5DqdqIwiOyGV
 m46BaTvZVHGaeyBBIpLs/Qe5CAPww0l0Xc84wyqSi1nPgVktiLyhSZv0b4O9nEoDmtGHNQyFYzq
 7C9rm4Qwwhqsiz828wPQgFN9z3qMtQCBDoc3sPIGuayE7fm4SQbd79kNQql7gs8amA86KHhbD+x
 MrhlH1ilMjtokYg+W/yCMeRNblSyuSGKm8zq5h6Mgh8O5UKz
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[baylibre.com];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 6B8F11099F2
X-Rspamd-Action: no action

Hello,

changes since
v2 that is available at
https://lore.kernel.org/linux-fbdev/cover.1770483674.git.u.kleine-koenig@baylibre.com:

 - Remove fbregs again
 - Added a few more %d -> %zu conversions that were hidden for the
   compiler by print_dbg() being a noop, but Helge noticed anyhow.
 - patches #4 and #6 are new. #6 was used instead of defining DEBUG to 1
   for compile testing, that uncovered the additional issue fixed in
   patch #4.

Uwe Kleine-König (6):
  fbdev: au1100fb: Don't store device specific data in global variables
  fbdev: au1100fb: Mark several local functions as static
  fbdev: au1100fb: Use %zu to printk a value of type size_t
  fbdev: au1100fb: Use %pad to printk a value of type dma_addr_t
  fbdev: au1100fb: Make driver compilable on non-mips platforms
  fbdev: au1100fb: Replace custom printk wrappers by pr_*

 drivers/video/fbdev/Kconfig    |   3 +-
 drivers/video/fbdev/au1100fb.c | 130 +++++++++++++++++----------------
 drivers/video/fbdev/au1100fb.h |  17 ++---
 3 files changed, 73 insertions(+), 77 deletions(-)

base-commit: 0636e6205beed850d985276dc56fd73d785bea5c
-- 
2.47.3

