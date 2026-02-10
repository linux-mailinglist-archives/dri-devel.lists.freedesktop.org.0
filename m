Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFE0C8c4jGlZjgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:07:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C181220A8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E8810E21F;
	Wed, 11 Feb 2026 08:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jkdDawrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f194.google.com (mail-yw1-f194.google.com
 [209.85.128.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F28110E5C7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 17:30:24 +0000 (UTC)
Received: by mail-yw1-f194.google.com with SMTP id
 00721157ae682-7963aa14dbbso955867b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770744623; x=1771349423; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jIIDoThfHkVOb07+iYSdsFpmFFWma4WyN2ASPrt42Cg=;
 b=jkdDawrXjY/Jnp+08oJhWejrZ+yiev6wwnDZ+K2hOd4DaeGopVB8TABTm0f0Zl9Zdg
 9Ly9OSXiFe8Pa5Q19IC8mTk505Ks6V87WZt5LlXFZzOLlPVAkTbl1gci3kWjxFx8vrb/
 1Ih71MnpO6CjpGJznipVIy2z/MxmTxmovvkCoo117mekH5p6nXKqV4VJwSeIZ5NJduAO
 HriFsm75JfgwCaOBGjxIdSx+eXcvVS7noevpMn6cmiJu+BbPQljFg44PdSbUG5DfwyPM
 yCDCltdCanq8UF+8ULKenXcyHYn4nDXHUxqbaxnoCDl5rj4JAfBi8bbQ0J3zmITf1orQ
 eltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770744623; x=1771349423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jIIDoThfHkVOb07+iYSdsFpmFFWma4WyN2ASPrt42Cg=;
 b=VwlvfqA75bsj0cWbKLOF4HCJTSgjvhi3uD1eSJ/2th13EHFrpFMYACErAX21sml+d6
 IQ/HXGYpPAfD0SEcl71d9npT9U//29m3MP/yxLh5rbixevMtUFKqJkFMnAkkP/wPZtbi
 pbTQ2BSNAqtKD7FZ+1HcsSPjC+l8U2C9JJt9mBHAZetkWb2UzVYW/Bji6j+GRSQuSrmN
 QI6O+f0PIiJp9HyBcTM35PASG1BslrYf/VCofnUc+5nWvys30KpwB7hK3wjaZFq8uI/H
 5LFFIHwwWwc1JHAlJhJAq/e3RzgavTN7oqm/EWEnDoJJp+Q/T3sxiYQ8Igd/4kR42w5b
 4tig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDQV835WvN/yfsWliRjOzoD15JKQITi6XPswbFSfkxUeWkblWUPsucgOFFHApwFSNNuxYdCy4NoX8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbL5gqM/TfnpLx7YmiKFJ+Tp8A/52/9wc0sc/xG85q/AX3IciL
 kSWoaVVodi6G3Del9X35Thk2JtyMl/Lp1o3/D/41P7OKmRrEi+clsQ5C
X-Gm-Gg: AZuq6aLsNFZ/chd9ym7/Oy+/Xb4suqw1qJCkRxEBgNdJ+5SZSeXnxY+eTLgtkm92KNq
 35A/rODnPMZZ5DnpLs+upLdsUCsI1MctP1r9g8WuEutqtvDN+W720P86YPqyALRsCh3K4dHdz7A
 4qf8sL2AocjgSmQBmbGZOjoWmKtqSJAH2VJHBYJ3bJsW5fLjcXhvxTFSnBo+IDR3XYDy0EMgL7X
 EqtKx1+eOnn4ipS3hUGPyLmKFCqzEMX7X8+280jtvuG5Gg9bhj75mlCgUL30Kg+hx5CjD/tj6ZG
 XdtszwEc9Ze6nrDx8ZVjA+POWwTvCUtW25KCC4wIUu04X/5t+glocSkedPllekntFZtbL1g0440
 qIImzAASlotQOoXfkuNeDfcRRbGjj9cPXwVZNA/aHauyDrdgHUMSzGMNBY5PHQMCobVTlPsEP5D
 WyRmKMLPiuE2vKKMrhLRncgpTnxtBEWWyKwqKuV6qLz378oHh3hzdmFq9Ndoiqv9yqdixe8A/1P
 8KY9L7ULMwFXDeYuE0csFGg
X-Received: by 2002:a05:690c:586:b0:794:c2fc:73b1 with SMTP id
 00721157ae682-7965e15c9e7mr29878347b3.2.1770744623059; 
 Tue, 10 Feb 2026 09:30:23 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::9944])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7964e371479sm49792307b3.15.2026.02.10.09.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 09:30:22 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: andy.yan@rock-chips.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] drm/bridge: synopsys: dw-dp: correct signedness bug
Date: Tue, 10 Feb 2026 11:30:04 -0600
Message-ID: <20260210173004.791856-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 11 Feb 2026 08:07:28 +0000
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andy.yan@rock-chips.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:linux-kernel@vger.kernel.org,m:ethantidmore06@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[ethantidmore06@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,kwiboo.se,gmail.com,lists.freedesktop.org,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A9C181220A8
X-Rspamd-Action: no action

The function dw_dp_video_need_vsc_sdp() returns a bool type but in a
error path -EINVAL is returned. This allows the possibility of this
function returning true when dw_dp_get_bridge_state() fails.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 432342452..a80d955f2 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1149,7 +1149,7 @@ static bool dw_dp_video_need_vsc_sdp(struct dw_dp *dp)
 
 	state = dw_dp_get_bridge_state(dp);
 	if (!state)
-		return -EINVAL;
+		return false;
 
 	if (!link->vsc_sdp_supported)
 		return false;
-- 
2.53.0

