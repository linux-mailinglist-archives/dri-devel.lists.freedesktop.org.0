Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDqAGSOfpmlqRwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:43:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D81491EAF2F
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B139C10E676;
	Tue,  3 Mar 2026 08:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cpRTPyE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F014D10E672
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:43:10 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-389f2c46d80so77776341fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772527389; x=1773132189; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xr+OjmRQzkV1Pp7uXV6oto+bq13Pjg/MusGbR6wa4s0=;
 b=cpRTPyE8Q39wdX5BmeP3RXHeImd97t7nKVKzKyDsx9VLJKs1yAAxH3EJG3GLIh7DWr
 IqkShjCbvEL6CaQzgusr3qfB0lhfj3KbMmNYNblEo8B4OG4hDXoPHc5CDuj+nJq78rXr
 6vUn8gwi7bXow7QDGMLxCZChknxWDm+90WmCQp3sXITcD+mlXb5UxfqKY6dHTCH2AGiR
 1azQrpeI9AbYEoQlGZ74r3ieg/NPkNqGMgC1Y2A9o3knVb7KmeNR9fXGEptykoGMPrqS
 axYaDcCt+lCcTFo12G6nXuKb3WM7AVrjHuTsh2PPa3MDSNXuGWJZ8grIBoDUsgdjN0LA
 Qyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772527389; x=1773132189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xr+OjmRQzkV1Pp7uXV6oto+bq13Pjg/MusGbR6wa4s0=;
 b=p8rYQ8PINX+k5K/TMV9VZw0Rv0MnX/jlVNwrwBTb8fiZLUhesNOyO3rpVT1HCS23nU
 nHhNm9Hc+r78XT4l/tPdaDO1ivPNco4dC6L3GTsZEDIoJ/Zq/y+Mt/Nt8JshkXaA7fJk
 ezORCkOy37It+9O+Dnw2E/wGrLkvuKN0WpGeliwCUs6psHTK2kSPrtR+sdZLoJ6H6G/4
 ixxsMGjAvKwCjqqLaIqBv5hP/lHIc1cE/3NPvMZ1RSZZOWF5OyeamjFbGGUyZJLnEMyO
 a2fK8Bqld7fUmlWBNCne7DFcDncIdE6RoS+BhJ5GsAhTY4XaEtI0eNHmjJZIU+qv7rH3
 AzdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0pzM0TjLzFu+4xQeW8gKhq5QCmwV2+pQXbOISfgFB6a9a39Af134Dfv1ky3B58ifkdOhTkGrQpnk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygDoTPYYWXtqVIPfQxWHlKTC7zNjs5Ac198FycSnjzwJjzp58s
 glNkIweJJoembrVV+ThDWefsxYfrc6tlKkDnmD9xacz1Fr1S98n1wDrJ
X-Gm-Gg: ATEYQzySzp7+Jf1TsOXTApXqT5Kdf5xZ3oBPjAN6tL3r9ejVJ06CFsMM1Tx5t8D4bcT
 +7PSAp5kSOts1nEb7bDJc0bfdwNpjf3KOj1T05iQQHXLu9unO5OjGRNwIqmE6XaJfIYviCs0h+m
 iKvVZHMcL89/q1rvYzyXgFe1wJhmskqrb5+WJEPSmRBvURDAQrVL/f1lHtS26+4+qHj0tD/D/yp
 o6ZJhxYixlDJe2wETEoKF+mn8smIFXKj5NC35fT/jAgEi4WIWydtMZI57uRhoPjhqQ+ttFo5xtK
 lW5dUpCPCFJ8er8Hjc+kXRPFySlwuAUSTNZBGw4CF/TE1tzlUaoeMSIwm2STWJ9U0uYLiLfJfmv
 XSgXuT8w5peLd6yWRLpoYCndG6kZ76cJoRdE1UfoZ5C+dlxxcQEL1tymuLBp9KXt1287J+Hh/it
 2Gnje7iSRONVo1
X-Received: by 2002:a05:651c:4211:b0:382:f78d:a0c with SMTP id
 38308e7fff4ca-389ff34dfa3mr115153421fa.21.1772527389114; 
 Tue, 03 Mar 2026 00:43:09 -0800 (PST)
Received: from xeon ([188.163.112.72]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 00:43:08 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v7 14/15] staging: media: tegra-video: tegra20: adjust luma
 buffer stride
Date: Tue,  3 Mar 2026 10:42:37 +0200
Message-ID: <20260303084239.15007-15-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: D81491EAF2F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:treding@nvidia.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:hverkuil+cisco@kernel.org,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:thierryreding@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:email]
X-Rspamd-Action: no action

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 36a57078d539..1b8f2a2213f2 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -504,7 +504,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.51.0

