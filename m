Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULzaCSrgqWm4GgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 20:57:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90CE217DB4
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 20:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C985810EC70;
	Thu,  5 Mar 2026 19:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AY8lLLNK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFE210EC70
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 19:57:25 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-439c6fc2910so1722297f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 11:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772740644; x=1773345444; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZtSz5l75Rw6ZqIXeFcoTcvd2i9c8nNbyLRXNmlkxqoo=;
 b=AY8lLLNKoIdu5G9mIWGEki97+8WkJMzuLj2jYMy2y58qkc9YcYmEqqjpOSF0VM9Ud4
 /nuO82MXYaLt2UuofgPefPw7EDjffU4BkCdQsOpCe29AxQURutvuTfdAUeQUS5JQLeG2
 BmONuc1odE7Zi3cSBnKjrfEj437nobomfD7QoRf2bDqSHH7ORU5gNiDLi4yH6T3BXGO2
 CHGKjnLDcHpLZ4XGd4ltySir20PwSTBvM9pBOtDFDDZbChC4HutwdMOALNLPslP9dI0e
 6bYFIJkMgUpkEXFHumYaKJDbDBVmcgs+9YlbtzflkGQQSjOgAXBUWaEUUVBT7tpjx0xO
 YTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772740644; x=1773345444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZtSz5l75Rw6ZqIXeFcoTcvd2i9c8nNbyLRXNmlkxqoo=;
 b=Idh0XZ5HDZxykgR95VHAeGdi1KDWhPp1pt3ebSdjl8M6qMPmf2YK9quVALwKi0NeJ+
 At/bx1uu01/1GMmakaImZMYeQg5b1fIvcuIKd5nSbrW1RFqbTaROa6mO8JXu1yQP6tZe
 ViwsCldNCxJfHspHoF1xPfLUMrLjODsKNcxsicA+mJgfrZKbpndcHcC/8kfTOwCFHsS3
 j0YWHwykolvY1L3lNjbaNera6AwRPEG2P7NgnTUvsIfOKBwWzspRiRizw9HELx75cGzx
 xBBIqd1Jl1JlSDkfC0XlCWvZTXDlvTAI7ckIMT+1kVFiiLtcsLxDgEvnKkzeoQ7mZFiU
 Fvcg==
X-Gm-Message-State: AOJu0YyIf8HvE9hspEo5uCsxH2LNxF5mfCkSd1t6+3+jfh9bSbXpBVTm
 rj3HxLm0Ptk+o/SwPkpJ1cE2N8A/953IoScrzUKHp+qDxpPsL3yqL9A1oyh76L0f
X-Gm-Gg: ATEYQzxvMyZWeJ6sIiDOflQK3QHyIfLzHgtYTNT969hzd9PNih57+xOWsiHztoXyFVF
 u7Xoj/YxYQVHQWpDteF/qP9i4wsiSCmWL0ap2mOabbIgeXV0STJbnqMaVScMHIhCLg6Dzj53gRv
 LG/4hwvCdaWW+M0uOY7Q6mTUmVQfq45QBBAI8wAdm30T8iWvTrcCd8I2HRNV6w2Mn8qUZVpLdU0
 9Dbez9BFq3IYOQpW3qB3oGHLgk9mrJJUAgwtWxQhTsLCZg7AtfUS7KXyT0v1DAG4SCzRZ+s5jCF
 jiFWJPxzeTmTQC9MoI+UzebceU6Or3tLrP7M5j9YTMR/sJVNAmcpcPiVzK55x4vgi4oMc0DSL+n
 jOGOOe4PhSg0+po8iF8KpIjfHAbD+IPypOJReZNrgWXRMymNfEwy6pQQoXng0TK5mnOlFoASEUX
 JzW/rOmNxv28ybNlruCws=
X-Received: by 2002:a5d:5f85:0:b0:431:8f8:7f24 with SMTP id
 ffacd0b85a97d-439d72595bdmr1734488f8f.39.1772740643877; 
 Thu, 05 Mar 2026 11:57:23 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439bb686a32sm26974297f8f.13.2026.03.05.11.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 11:57:23 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>, Jagan Teki <jagan@edgeble.ai>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Marek Vasut <marex@nabladev.com>, "Kael D'Alcamo" <dev@kael-k.io>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: panel: Add compatibles for Zhunyi
 Z40046
Date: Thu,  5 Mar 2026 19:56:30 +0000
Message-ID: <20260305195650.119196-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305195650.119196-1-l.scorcia@gmail.com>
References: <20260305195650.119196-1-l.scorcia@gmail.com>
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
X-Rspamd-Queue-Id: C90CE217DB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[gmail.com,edgeble.ai,linaro.org,ffwll.ch,linux.intel.com,kernel.org,suse.de,sntech.de,nabladev.com,kael-k.io,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

The Zhunyi Z40046 is a 480x800 24-bit WVGA DSI panel based on the
Fitipower JD9161Z DSI controller found in the Xiaomi Mi Smart Clock
x04g, apparently in two different variants.

The Fitipower JD9161Z LCD driver IC is very similar to the Jadard
JD9365DA-H3, it just uses a different initialization sequence.

Since this is the first supported device from this vendor, document its
name to the vendor-prefixes.yaml file as well.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml   | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index 5802fb3c9ffe..da17072ffaaa 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -23,6 +23,8 @@ properties:
           - melfas,lmfbx101117480
           - radxa,display-10hd-ad001
           - radxa,display-8hd-ad002
+          - zhunyi,z40046v1
+          - zhunyi,z40046v2
       - const: jadard,jd9365da-h3
 
   reg:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..18121440dc22 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1913,6 +1913,8 @@ patternProperties:
     description: Shenzhen Zkmagic Technology Co., Ltd.
   "^zte,.*":
     description: ZTE Corp.
+  "^zhunyi,.*":
+    description: Shenzhen Zhunyi Technology Co., Ltd.
   "^zyxel,.*":
     description: ZyXEL Communications Corp.
 
-- 
2.43.0

