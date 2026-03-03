Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEgDGyCfpmlqRwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:43:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6F81EAF13
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2854C10E674;
	Tue,  3 Mar 2026 08:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WTRSAbiK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368CD10E670
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:43:07 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-389e4330e32so79523481fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772527385; x=1773132185; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X4ctCsu/iwYqXOjPjOHAyLkKARUcVjFZmtnOvE7QpjU=;
 b=WTRSAbiKsmTpj4p0I3Lh2DMCZsMkmP2NCxkNyR+NFwnDFPao59Z9LIYc43GaYs1yVR
 vViEnlY8PHwmWGi7/VGVHbC7fwquqPWgqPp9uE3eqIGbYejKNkCNI00zH6UVBdH/Gxue
 VTloO2hsrI6Jk8qnIr11hMB5lHYrlIaYqDcbSZjzQwO279yoAsnYkqf5bShyF5QKbtO6
 ROdQXjIECgJoZ+9RqdoBvJ+tV5dsCX9An+Hsd3PjoTF3wqrRbUho4C+CuP0bKLRaheaI
 D9Dx53WinpR1QNeHbBrYbmhD8q4lN9zlF/ja+yvdKkZg2joeU8M7n0PY8hm/ctTbGQkz
 05Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772527385; x=1773132185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X4ctCsu/iwYqXOjPjOHAyLkKARUcVjFZmtnOvE7QpjU=;
 b=SpTI0peTKMz+tWsuWR9I5OdMBQkFX6/CSvUc0TP5fX7eTqO7ISglQspTKx9rawjalO
 PqBMpdh9YU+wkTmJ6G0Oh0YJVAPogZyAzeK5Gtm0+ncxAzGtUnwpqZguutisyI+aWWM6
 kK04P4p8z+o/rN0+HLTlx3RT+ePIBKJEkfGPyJbeRffIhlxOKeVfaUm7umRH7KQ3a9yN
 Lc6v4JmJPtYMAJ2ZpZhPnEVeEqjbIJr13Bw7hwBj7AwLImFXJYbkT6SBsbJawQcm188t
 kSGY2q8wmpPP6hb+Otk5kAFaC2KeqmHn9T8PG6ju9OtsAk2BWU+f8a6ava3kU65nEDoa
 eiMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoUq7rfXin8jIHYOdmKGzFEHcLYJ6G26CMcQCesQy4deRrVIo8Z7EhynjJsfC9VdhAnLvtJOHCjSg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywb5wMfJtGY3bHbNhmOUT+Efl6gtPIasAqHInTUpUci6Vv6uG3O
 YtNGzxBFyD37vC44Q6KWqKxlTMKjmxR5HjtbRuoeLLYkocaXx+kFziuh
X-Gm-Gg: ATEYQzwcM9RCMHwV85zZp8NjRAYL3WHb6LeqQWilKrf0gi8ZJGL+EPBfqYK7BzoriBU
 jhHb7iqxSRTFF729d+rszYOfRvQ4LNZTRZ44eDEynadqVAsiYBOFQSC199nP9fFnH6h27ZmN1Ao
 SgQbUIagT2Gn7Q9grBYNH3c3sp4e/0vZmJyWNztbQJG4ItJALNg814oGB2hXnhze8Zr6A4HHkEa
 JQvDP4l4wUnpWBA1eFGpiTLJ8U73XirTRKgWnTyzzCXFiS5/fPSCm9NMBy7NQAOwIxiYFDXpOxO
 Uboq7v9fubsCWEHmKIrVKa85NFLnZtZIbInh6z8UL6KUWrjPZmMDmlGN0FleGJneGJpE2rqixsX
 hC8Pembg4qzsqsWqNeh0nfCZocYMjvw8HIN9Yre2WXIxM/M21CsfffzJC27j0APrZ8aH4qHSs0K
 e0LaCYx3FR681X
X-Received: by 2002:a05:651c:515:b0:37b:9e27:89f with SMTP id
 38308e7fff4ca-389ff363a7cmr102300131fa.37.1772527385431; 
 Tue, 03 Mar 2026 00:43:05 -0800 (PST)
Received: from xeon ([188.163.112.72]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 00:43:04 -0800 (PST)
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
Subject: [PATCH v7 11/15] staging: media: tegra-video: tegra20: set VI HW
 revision
Date: Tue,  3 Mar 2026 10:42:34 +0200
Message-ID: <20260303084239.15007-12-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 1E6F81EAF13
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
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

According to TRM Tegra20, Tegra30 and Tegra114 have VI revision 1,
Tegra124 has revision 2 and Tegra210 has revision 3. Set correct revision
in tegra20_vi_soc like tegra210 does.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 4b218b9fbc26..7ceefd920cd6 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -596,6 +596,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.51.0

