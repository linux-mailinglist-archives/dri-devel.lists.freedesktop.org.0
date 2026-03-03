Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JbIOEiKfpmk4SAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:43:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E228C1EAF22
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A5F10E675;
	Tue,  3 Mar 2026 08:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aOdAG2qV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E25B10E676
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:43:10 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-389f933034cso72155801fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772527389; x=1773132189; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jCPyOYLjH+xCK5jyX0zEVU2hkN+dQM35tiBS1e1/x50=;
 b=aOdAG2qVelITIgXw0Ef+jQfygc5/cz7mX1vSt+p2DXykwTKVfMJzwmksvd+ns25BbQ
 sNYrExzCpn4WbNuKwqQUN5uEyJk8wDOwMAc7SJ5b5ZTWU/+h7nvOpjmHJeSmrkOBsB1o
 BriIt3Q7WHxvIXoCQTxCXyHVkJXCwDjfvJQlweOsfYV/K2jcMCOtiBuX5yXsGK71BH7L
 vPw7MIvwwD7C4VzM2ok5lBDLxYJEkwVfpaDtdSojPVnWUxgQtfeGb19cO54s1xSsVhWo
 PKHWzxIqoeb7TXw5Vvi30kBf2xJJtc3CYL7nWxgsNq5TXo2dzIijXdO2yN4k7A8QCD7a
 VcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772527389; x=1773132189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jCPyOYLjH+xCK5jyX0zEVU2hkN+dQM35tiBS1e1/x50=;
 b=DkzQBo27361mcrglwecX7pUS7rDbiyFbWLMEU/+/SD7CozcZHRzV4R6H+rCMmYdLaM
 Du4hFNQIaU3CoEAW8dbzV6BmtueC3uHRa4uZ2NGeeoqFx6jjUCnKpBonaA4I5Nbq6/c/
 e9+YjFzRvISfFMYKGkX5c1p+GIy6yobtKNvwRhEEi3Wtk3doc9rXvVHe50lCcCpK10Ko
 TP2xzhQZdt0TLp/f1ChpxDyram6VCE5mipozLG7xKVuWg5G8giCJDEHpT+FMv5y64hJr
 yx1Q61SZNyzFUV/AhM8NZ1Av1TKbhJLXhCYQaZ+ebLtv5Q5nNDOwd5N5rLDaj8dRKn4m
 eCpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu9a2YY8u8CrYU6B1bpy7Iacrmp++QKPQsXWTe+9NhO2GuHuBUbqGlfZSFfICKmz+TE7D9LIU4zf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZSinkdpvu3gFeykqBAJgDm3Tpw+2o7tQtkMv815FuzktH4St/
 Vf+vX9/uyUfconKUmvpByS3AUL+V4Noa6zvIxhG5JlwJwW2Rt8n0CfLy
X-Gm-Gg: ATEYQzyfagnjk2IvYBJJilfzb3C297yk15lyu7gJIORwXUmp+VK4NOMdKOeQI4QKpLQ
 zflkJ4nkiikfzeAMyIzmeIh+JqnBidiAsVMpYLK/mviXNhRXVA3Lob0U2+TLLS06FmJ8ECtaRgE
 9UHpzFCswZxLwkppFyWfPFHBdIELyDidBtMSGQTikGiN5a4offdJEFBZ00xrUYakgkxn/LUVmPt
 vpL/5LdcTdTlAlC3qmQor3nfrtciqME79bLf1Ab/dN8ZvfF3+Mzhaug+8teSgWQ0wLWAwZSM5ng
 Pp7JPEFxkzWAOe5UvgfC53ZG1re/UenxzxrPrf6HjSdCNtbQiWW7a8QlTlcEoYSbNDEcNV9QTRZ
 Hw2Idin7t+YNNxiIQ9P51eR+Fm70QnlJ5axUrJCkr65TEKjNB/W1YmYEUpx1RH+Bu4Aw0UwoRVm
 q9/GOtfBGpz07DlX7cjj8BH0I=
X-Received: by 2002:a05:651c:b21:b0:37b:8b7e:efd with SMTP id
 38308e7fff4ca-389ff365c0dmr93909351fa.39.1772527386558; 
 Tue, 03 Mar 2026 00:43:06 -0800 (PST)
Received: from xeon ([188.163.112.72]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 00:43:06 -0800 (PST)
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
Subject: [PATCH v7 12/15] staging: media: tegra-video: tegra20: increase
 maximum VI clock frequency
Date: Tue,  3 Mar 2026 10:42:35 +0200
Message-ID: <20260303084239.15007-13-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: E228C1EAF22
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

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7ceefd920cd6..bf8755698610 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -598,7 +598,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.51.0

