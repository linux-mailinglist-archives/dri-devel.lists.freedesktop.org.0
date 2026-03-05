Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eK2nBZvYqWl5GAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 20:25:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 373DD21778D
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 20:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDDE10EC6B;
	Thu,  5 Mar 2026 19:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B0Qct2R/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A81910EC63
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 19:25:10 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso86852505e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 11:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772738708; x=1773343508; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=udVO1surJnvY1exphvxwwJnv4iP2usXfpIsdzxZNz4A=;
 b=B0Qct2R/Zu9vi7APaCgEIbl4enbJqpydfu+igKJF3uf3z+r1qBlGZC4zwRt4cm1RBA
 k8aIsCsdyQj9zF+ZFKQ0A+I4/mXnDgjh90wFoOULAaIVFPGu3iYz4pMwIdQeRO+aLb5N
 uAFkHKS22Lzrti8KHzy7m9VUQL6gTm6WAAzi0MJOP+uMx+CThH37e8FX9GjWugQ9Bhm4
 OYHKBICZF/uU1UqDoSlqllfm69Xnhld/cN2Ppv7We2tzXCB6RjP5+1aOb+o2GvQqjxdA
 AcdZKiSOMRR2wSgpbURGoSbe7tWZDCLjpKOf3NNJIBViY7rgMJknLlzByK6ENGJgzh2d
 eTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772738708; x=1773343508;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=udVO1surJnvY1exphvxwwJnv4iP2usXfpIsdzxZNz4A=;
 b=ldYU4rTsy9nXHTNMTgjWjzawq7qSZuQwWit+Hn8tGcA+dBkW8gbtM+iI75v/iMAHrI
 1Dbr6NelzUQJD08RIIa73wOHUz6k4B2QS4zdoANQPsVZvmCep112emSm/zAEHIlIJfev
 28v42RqAqekW87AYYtrvjYUxUWf10d69ihRHuXF8EfC7VOtron29Qvjz5jWzbH7Ju0Yi
 /dgP86111as+MhBub0Lyz+8fkcgWTlEZNXqAgfWKxeqdEqiOoyXraM+4YmK0bz48U+U7
 NhZV2HmdVwo24mrtwDtt2usFKspaRyeesAkf+OUADExv9jQEj1wdjGGzO8Ha+3upYKGZ
 RdwQ==
X-Gm-Message-State: AOJu0YxAgTJlHFquzaRYz/WJkhrSyJnmAlw73Fs4GRPRwhuZt1X9lwhq
 JRwvysLoU5slFKL3E2lOsgOwBVg35L6A21HpvP182B3gkS9Qyx/ViVPpTSp7UCMd
X-Gm-Gg: ATEYQzwkL1wGinKYJWjqoQux6gV2FNhTJpdX1aMpHq/zDwhkwAhCIfwB5YTwRgFr/ca
 AlzYDgUkG+SUQoDAxtzaDjD704O1g9mcpEaMHv+zDr9oB9UHz8G8NLbLV0JWPZ62VRciI76/UKo
 yOddAY66PBaxqKoeOGXyEK8WSUBPy9bKEjVeDlcAAI4c/vz7rijsAmMphG+yBv+ac9mh1Vmvrie
 07j8/jhpFfR5Gups+Cv46xGfKBCd/1R6LOhivJL2vghm5vF0JkzCTnveW3bEaomqn4kpZMbaf4D
 zaJhlfhrTMykM2nJp28TAaqCj18L8z79Q+FlrlGUt7SXfUBNz9UNu9M/KrWc7Kj26k7k9nElU1R
 XMA2oEKO+AtjXNivcAqdMdc53XqXEWOYg0S0juUq5cEiewRjbMVgTDzn8PLnZ2u1vl7fUlQXkLn
 QKj927zT8JYB2BbhbidaE=
X-Received: by 2002:a05:600c:8b6c:b0:483:29f4:26b3 with SMTP id
 5b1f17b1804b1-4851ee7b559mr62874405e9.1.1772738708010; 
 Thu, 05 Mar 2026 11:25:08 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4852378dc51sm7755285e9.1.2026.03.05.11.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 11:25:07 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>, Jagan Teki <jagan@edgeble.ai>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: panel: Document the rotation property
Date: Thu,  5 Mar 2026 19:24:04 +0000
Message-ID: <20260305192405.111152-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
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
X-Rspamd-Queue-Id: 373DD21778D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,edgeble.ai,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The Jadard jd9365da-h3 driver reads and reports to DRM the orientation
property from panel-common. Document it.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index b8783eba3ddc..179401ce3aeb 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -36,6 +36,8 @@ properties:
 
   backlight: true
 
+  rotation: true
+
   port: true
 
 required:
-- 
2.43.0

