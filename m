Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KcgKRSfpmlqRwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:43:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 575641EAEBC
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E393C10E665;
	Tue,  3 Mar 2026 08:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q8gzLPoY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A0410E665
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:42:54 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-3870902760cso88665811fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772527373; x=1773132173; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pid8l3oxr/AZHZz4pdBIzX1rDMW/6jLdB7pjgw7arVo=;
 b=Q8gzLPoYdH86LyTVKQnHXHpbfhwDMcmWqv6iSiocf2ymkuUWCHmvHovH/ZTQxNAC3t
 raW2APkb8R19xUgTBcMxs5OVUGkLSjwmFl/R6RN/2K7CchjCvRGUESxKNmO6sVPB6uXo
 UGem6JvkeHPqf5g0YkFkNZ/Oj293pqMnRqSnrV0IrxBFI+gOtbjEm6yXNKyjoTmAv7c5
 TYrxf/jxiWNWb36WvR3SGNU2GtUlSO9FC23TZ2ZDaKULHhV715sxf116GlSKWx3SoPkj
 IHunaTZsS5gqMA+9t15Lu7EZ6oRL3Ie5/IFOFlK3/JmR9ZveAoAA/3grn4U6O4n5T4VI
 xCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772527373; x=1773132173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Pid8l3oxr/AZHZz4pdBIzX1rDMW/6jLdB7pjgw7arVo=;
 b=TJQK+VXzSwkprAltOhebvPt9PXfpG0iKdDzK23FTKLUpfulyAw4z/vy2Af/BuQxc+0
 xwYvOSypxhjRLriTu9kqYJq2Atm0i6iLMEdVGunhkF3ZhtdHmYMtsEdEa+XL+OWH1nYS
 OnnpgCHqUVRy5+4hVAlFmzB5BnJm9DXA9JZ7sYAUCKWjHNjvyxA/vTWMLzUntiTWf4Jp
 Ot0aoBLah+qtfb0Qta+YrNUTuPrQNma3bUXMBxbr6PXFHjHHXlAbB6U88V9YRW3SrU9E
 /HCy9yqXNbGtMUoisM0jtHACFMfvR5uZx3d/pE9DrGUUHWBaq2eKIgkMl4Lr+NCydss2
 HWGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTib6d4o1VmJAlM/77Qb900JE0e7dqihUwgV3oAsN4lPG3+bjcM/CzWkhqiIq7f5d08TJUvPcvUFQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMM2U+IKBgfnJrGdLMyvFHcjMxgqZlFyoWZmwJimC7sL15Rv8z
 hn/5cgtNaZqhHu1jG6/UFBcykD2VVNtmkoU4h56QEMS6pyTmGqMe21xN
X-Gm-Gg: ATEYQzyzPfWIAnMF1E8DzxXvvlaGrFHncLmDSdwC7hI51oDhcbsCUHV6uj0Tq9dzUNc
 Bx1U4DDi+L0+0bmuTcUNXV3Xmn1R+t1Fl5BfD7r9Tz2OJlUhMq7He/bDg+fu8zphcoQSxtT58EB
 o6B0RoUCkjBq5s5xX05ikYuQK4RMgAUGwQeUQDsz2mJFygfqxqI8Da1zBI712ykXE+AtUCbICfD
 q79FUSpKYhlzj2tMi9HNxWLHUo276JkFXwg6KnDVMr8HFLvTPDz6DBLswf95EatQoxp4owIgQ9U
 fBiChOq+Nggv8/vN2ygzAV4Ku6nxILBu4MatT0rfCyTaNqS8LbYzNwN0gjgp/05vpsHHI0t9q5l
 Hq+eBM7OTOUGC1dPQ5dENa58kYxi48GJapEpjyxZF1qH6d2kD2RLOJMttMGFCTdy9JtKG9oxm2+
 iNbkJ/GBlMXDIr
X-Received: by 2002:a2e:bc1d:0:b0:38a:957:a125 with SMTP id
 38308e7fff4ca-38a0957a856mr72649181fa.18.1772527373025; 
 Tue, 03 Mar 2026 00:42:53 -0800 (PST)
Received: from xeon ([188.163.112.72]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 00:42:52 -0800 (PST)
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
Subject: [PATCH v7 02/15] staging: media: tegra-video: vi: adjust
 get_selection operation check
Date: Tue,  3 Mar 2026 10:42:25 +0200
Message-ID: <20260303084239.15007-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 575641EAEBC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:treding@nvidia.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:hverkuil+cisco@kernel.org,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:thierryreding@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

During __tegra_channel_try_format, the VI (Video Input) checks if the
camera sensor driver provides a get_selection operation. If this operation
is unavailable, the crop is set to 0. However, if the operation is
available but returns an error, the VI currently fails.

While this works for simple cameras with a single pad, it creates a corner
case for sensors like the mt9m114. This sensor provides the same operation
set for both IFP pads, but returns an error when get_selection is called
on an unsupported pad (such as the source pad), causing the aforementioned
behavior.

To resolve this, if get_selection is implemented but returns an error,
try_crop is now set to 0 — treating it as if the operation was not
implemented — instead of returning a failure.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index a7892036f29e..e0961bc0a017 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,17 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret) {
-				ret = -EINVAL;
-				goto out_free;
-			}
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.51.0

