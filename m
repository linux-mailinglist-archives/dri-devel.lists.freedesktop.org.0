Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP35LfqZpmnfRgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:21:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D471EAB3D
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132FA10E65A;
	Tue,  3 Mar 2026 08:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EHOkTtcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1111B10E656
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:21:09 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-38706f96202so64972571fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772526067; x=1773130867; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ix27v4RKXp8YjgwGqEFOBW4BOUCwMQv182F7z4ea5QM=;
 b=EHOkTtcJa8UcAIDpUr7RhEoU+BMO9HwlnkP2umDhJD1kFE18xMZo5aS0IcLMRgWZZj
 Lb6O55W0aUOJa5MLKRjqAMbpQeMCqsn7a3Jy8tSrwFAoXEqd0fr0oYWoZTo/CyZWk3yk
 2KXGfp1BhlWV3RhsXKSreZvn3HY8DMftBo/JlTbLx42lVWaT77QQbJL1FGvJlc6kvZgc
 l6VnxvdNzAYeV/rcvj3R0IabFJkYgo+AJmwIsqFvQRhzxS9V58gwL2vWKWCO/luA9LyQ
 kookF/T5o6Eu+ZljYwzls99cEtW2BS3KZ8vhYqHM8U5axiXCwB5z2PaI2my6Ay0mkDbw
 ap2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772526067; x=1773130867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ix27v4RKXp8YjgwGqEFOBW4BOUCwMQv182F7z4ea5QM=;
 b=gFDWbKjaO7zg5TlSMvEFe9wNotz6HX8DAL5cev0a598JyhLDa4Pg0q6jIoCeyKJ9lW
 c0tF98Efao9pKaFnDsrrDPEoyxBQWVIDH81GzNsmW+oFwXBSAKcGbHgLXWM20Ik6a1Lg
 rFOV1q3CxJG7xFhLcsuHXgXLmqklF5ex2NxbojtCbMioDIU2C5mHkjLUg6C5xDd/fPoJ
 FwNEOQYAMLsB7EscSjVL4ABJUVsZzacwxNETYV3SEZ5YlVMtmlnzy3MNeNpnU8XRUJom
 d1bUtdemgwsoMsgciqUlvgmWz5YH0SfLSRIPaHiiBwfmKsIwldLc0LkuYtSsi+cmiUDj
 gRZg==
X-Gm-Message-State: AOJu0YzSh+1xV2BJNNhUQj73pctn8MI8HrlH3JBXlnhB6J1DkDB4x3Zl
 LRN7OCxuBGN+PerwvrNVs1KMmexWCo8fzqGc8QaG8BLj0MBg4I1muy/d
X-Gm-Gg: ATEYQzz6cwqn9TKi0BZ8kD2y1cbNkPbhalgu9KXQoQ1KqsgDTRMw2hOcg4Wx55WAcJB
 75YQv8fiQkZDuKHIjPfyUWNdxFozJA1iAPAiWtD9AFgN97ntQXc89D0OTFIm6+5PaChb4pnRRSl
 BIpm0hlvWAfh/QjKIKrekOC91Hlys+sCSbil3gQS5NvDcQacMwABSENgSuyTI46qs0F8NWFJrZO
 7baOMlrxCvYIGjp9LJhUflZXalC7a9cRwTXpP2tU8MoWBxfR5NE2z7xd6GJiZH92Zn45XHLR4Eb
 cKqzn++XA9MZb6EpGPCUU4Ccj5B6XtQu3G1AVD7oq94UPN9ORjmWrc7Wt14QvFs1anZBictiA4b
 /ypiuqulcPaoqQE4NcEKWCiDLS5iD3mDVRvJQ6V1it+aW832GoqPTNzId/63cmiR9Hd/KF3YUtx
 BQXBSXXV2cQHyy
X-Received: by 2002:a05:651c:4409:10b0:386:8ea2:ef7 with SMTP id
 38308e7fff4ca-389ff35763amr89501711fa.32.1772526067135; 
 Tue, 03 Mar 2026 00:21:07 -0800 (PST)
Received: from xeon ([188.163.112.72]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f2ffe02bsm30856171fa.27.2026.03.03.00.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 00:21:06 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindigs: display: extend the LVDS codec with Triple
 10-BIT LVDS Transmitter
Date: Tue,  3 Mar 2026 10:20:36 +0200
Message-ID: <20260303082038.11352-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303082038.11352-1-clamor95@gmail.com>
References: <20260303082038.11352-1-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 21D471EAB3D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

From: David Heidelberg <david@ixit.cz>

LVDS transmitter used in the Microsoft Surface RT.

Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Robert Foss <rfoss@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 4f52e35d0253..90ddedbba738 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -33,6 +33,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - idt,v103      # For the Triple 10-BIT LVDS Transmitter
               - onnn,fin3385  # OnSemi FIN3385
               - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
               - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
-- 
2.51.0

