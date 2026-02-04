Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGo0KTMOg2k+hAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:15:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5729CE3AB5
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10F410E589;
	Wed,  4 Feb 2026 09:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uiGUZ9YI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0555610E589
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 09:15:26 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-480142406b3so48869785e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 01:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770196525; x=1770801325;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bO9G9tYPhY8+70A/i4Fl7rDlPCoV3MPLBkNv0Mgen4Y=;
 b=uiGUZ9YI1JqJEzVZLXq/4Wmxv7rGzrnbsu8BEu7dlGIYblndvJAYmvu6e48UKzhDiR
 DuZHvjEu7oxCw7nyECROjaAtgWvkfCzVQyNdCPFvPYkHkH9eLMvyRDP83NvOn2Jm4c6a
 74G7KbxBd5vtbq/2OhUP5vKMe+TZuhw99xkGzobKf0uNrRU2+oYXRy76tBzZtcYvT9n0
 dgDKpgUJMYeFCK9NP/zY1kIe5R4JY5SJyp8H3/fWxICu8yCL7ap3KHBsK12WWByZ0m3S
 F+Lh61CbTMZfS6KlcNLAVoWejonLymqQpgpuEtR1FY89zj/18WfVb171uMWMvyEUtlR9
 mmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770196525; x=1770801325;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bO9G9tYPhY8+70A/i4Fl7rDlPCoV3MPLBkNv0Mgen4Y=;
 b=TfAXPYXp05cIDhzg4E9X5+yEW/6FiZLUiqb5EyZAbhcAA0MW3n3lhCOx8gejABc8ua
 W5qttZJtj03U3paB5unUamYogjVAGhKP2CZn8jAW8cm1k84G4jRRtiWRf50W8ecPotLo
 EP6seGNgmxzNSCAPNsTZjkdoQXT7s6rYmHmiwdAmXeik3MdnlbLcEKOsLuSHYTQgQ+nr
 s34j7D8Etmh3ElSHJwcx3eFJd8ZUVP/tjoZzNGc9EsuWUXmvWXtjJ7MQpxMCy1B674wi
 czH1CgF4wFxQf8I9NV22x2+Afue3TqKoznK/aUzBUbTCFN8llAfL2NHt02Wtxxny6mky
 PhsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgAtEHRqM/kcxmzTZpm2Xi/hcNgBSm301361RHm2ctSlFjfMYRS0g+vTLLETiUqvhRJKdbG5vfQwg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWQ0lzJqhxOmTKfn0+0UCPIgBEe/glRmMVIZNg4EZsA6/c6yKA
 CCHhMc1AckpQjlOMVqD+9DHIEL6pmGMgb/pJjnPvGOWTCDxoJK6kmNbupvgPGpMhpZ8=
X-Gm-Gg: AZuq6aKA32yZBS723WbY1YjQgaRHnfyi6ncECS8/1TdcbaHxR7M1u3WD+rQjIfCetbj
 kI4+s4veh8Wu1/9jiRXmyImLtrMXYAEsN4oQW3kZ6CUa7rvSBLj7KYROoQ+IHQbuBf2FUr4F97n
 DXdIVWB4xpo0ErbtXP9BZyoCPpLct0dt+RhoaE1W0sBmzeitocEuQuHByR5kM3gSj6b6uiNwCEm
 hchfm4DppLwQMIqLn8rXEKP2WBsBuBHJcimSUC3xZjrU2MWMRxQ5DnDN3LmuhmWyrppY4pvqpj1
 BndcsId+eMr8Nh9BnUYzJHJbHSDLuNSBKNHoTJ/YA153NwGN9vQpwCXuByeviCIdjlXtAwsoj6/
 4J8lNIpdWpnCUDhe/uOoJTFpwXQ2yWIwpwOl6TufuO6ktUo3Q+idMmZM8Xdce/Ds0lb+mTR2ZEC
 n1aTdvY0V20Scg9iEHLEhXNDo6sbU8bPY18dz9GbRQ27IRq3JP66AjDHhrL9+0W1cbrVoA0byio
 IlaKBXIk1RzmQ==
X-Received: by 2002:a05:600c:1e2a:b0:477:9dc1:b706 with SMTP id
 5b1f17b1804b1-4830e988efdmr30794505e9.19.1770196524897; 
 Wed, 04 Feb 2026 01:15:24 -0800 (PST)
Received: from localhost
 (p200300f65f20eb0470629fa1229c2efb.dip0.t-ipconnect.de.
 [2003:f6:5f20:eb04:7062:9fa1:229c:2efb])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-43618058473sm5267642f8f.22.2026.02.04.01.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 01:15:24 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/3] fbdev: au1100fb: support COMPILE_TEST and fix
 multi-device support
Date: Wed,  4 Feb 2026 10:15:10 +0100
Message-ID: <cover.1770196161.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=5m9kSIVNTKtItphnRlrL11Gl8bzNdjb0IlTPZPxLNyw=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpgw4fm5EVfF5VorVtnsGTdUtnwTU9CvRL9ZmPa
 dYfsrRRt/2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaYMOHwAKCRCPgPtYfRL+
 ToTkB/oCnl1j/dWfB/K/yBWDw+ka6uMn8A8pVPT1poAR5kUjRJrosD0FvxRS7Sk0hZc9W4Vg5Qy
 9HKhOnXBhDJ37VrVCFIqy1tSRpzgKILkG8fWQg+rdEjSmaPoc9pn8ciZA8V5VA6M7/7SB8qb29Z
 gdvas+i5W+P+heNbEcM3P7OKKrJlMm+JhVjj1GaaEEYhMEMjsLU0+AuGsNxjj2UBzY4QluIPkN2
 p/WLmfMLMvY3SA952mEmDq6dTlKZrePmgiEZRLgAAPk9EvV6dY+02eCU4W71QZetl+yJ6jjvzKT
 wXTf1gCOhf1Hpix2UhOXfIfNBC4L4NI6uOJOjKkIfu0+Dq8C
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5729CE3AB5
X-Rspamd-Action: no action

Hello,

In reply to the patch that became commit 0636e6205bee ("fbdev: au1100fb:
Check return value of clk_enable() in .resume()") I pointed out that the
driver uses global data in .suspend() and .resume(). Helge asked Chen if
they want to address it, but up to now there was no reply. So to get
this thread out of my inbox I address the issue here. While working on
that I found another two variables affected and instead of installing a
mips compiler added COMPILE_TEST support (which revealed several
warnings fixed in patch #1 when compiled for ARCH=arm).

Uwe Kleine-König (3):
  fbdev: au1100fb: Mark several local functions as static
  fbdev: au1100fb: Make driver compilable on non-mips platforms
  fbdev: au1100fb: Don't store device specific data in global variables

 drivers/video/fbdev/Kconfig    |  3 +-
 drivers/video/fbdev/au1100fb.c | 86 +++++++++++++++++-----------------
 drivers/video/fbdev/au1100fb.h |  7 ++-
 3 files changed, 49 insertions(+), 47 deletions(-)


base-commit: 0636e6205beed850d985276dc56fd73d785bea5c
-- 
2.47.3

