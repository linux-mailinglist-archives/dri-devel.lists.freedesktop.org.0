Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKUvC0Q4kGkuXgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 09:54:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC6E13B7A1
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 09:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE9210E1FB;
	Sat, 14 Feb 2026 08:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="KXpuVEIF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062EB10E1FB
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 08:54:25 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-35480b0827bso944333a91.0
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 00:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1771059264; x=1771664064; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WdWNMVJJliqIP/y0cAlMhGbw1WvXxrTEtOmWxXPkTzg=;
 b=KXpuVEIFJuClUxdtI9iAJG5UmH0wduvBUDtpyGIXAEaMFaU44ECt3Ms6+iFMIYjJFW
 ukWOzGci/WBGjj0cmzl44uJh/0aiVBGtg12f1Me/lLiF2EKofN7n+2FMQQDQnzOY5n4E
 WONdIZmUcctGsBHF+JO068GRs5rovZvxwjBe3dNyjVTu3YxNgKi92pvfVI6pWVNlelAT
 PhRemYQEvarQxxxTjFceLdQXOmuWW960Pxg7xMULmIyOBj/C6QnyhVJUF21mHuKMdcSp
 U/gmGRCJh4Qzgtt+SFTCekg2ygKtQhJdtZpDRMa/pE30uH7pPRWgTUEV4FvhbOtzukdM
 Lcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771059264; x=1771664064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WdWNMVJJliqIP/y0cAlMhGbw1WvXxrTEtOmWxXPkTzg=;
 b=wfE/XGR0jwbMIOR2Q7Dw8OU0K+Lw+q3Jq0NDldjnydxMUDPZm2KbDwaflwk0VaZNK6
 OcOoxGIE6QXZfnjeVLQrxPus5wD94HOgY7cDMSt7LHirOmP2teFDqi9ceCvaSznyibER
 Q0+zSVviH8w3QB6PUcWmM8zjLwPF1KnLdS6etPbjbi1E8KlI1V47OD/ACrwc7aLWLTzq
 vDx0/LlY+8UJfHydG3mnVRk+mcIccYrYtclYSGHEEK4RdpnKzP87Vy9/Vq0FuGGsLJDi
 SntevDaM9+9K6v9Fr7+PaQ1/mJbh3Sg7NN9rzdxoGoJpglwWzTTMFeZDKd9AE6G1D3D/
 t6Lw==
X-Gm-Message-State: AOJu0YwHnnATGwhXAvC1iCyXkJX6i+rCdliVbYdB3OR9F5G1DV2oNwB4
 17oUy7wcJ10ERVZJTHSwTfYlF94hO1S+PTJ9srvi4G+aURHa4lFEYpw2f0vWt0oRGck=
X-Gm-Gg: AZuq6aJ21zAzAhSdb7jQMskha/+D2ke39iMDdCkYljKO36VXG4ETUVBA+1TYoExF5T0
 EWM24rWTQYwwhTLJKf79h884IwZVa5ygs/Qppqnuo4tqNzSqKNDuzgPUOfN8KraA/l58ZVyVOMw
 NxHpsN54JLfJFDe23AP6WaYN7jIybbEpADHhaJM400oTub69ag7+4MhfoSnklPrm28efF2wHYhJ
 jQ5dHhGXLUNxso+8mESM6oxbDv+Gs8HKczZ3wHh+x0resElFb5Yg59NqMVPSQ7Ro1ktToo/yLXN
 A8fnL2DK5sKf8/gLoNKHvbjLuaKvgJhDBdbOKMrBq0Bc4B9VZU1I4Gv4j5+iJl3NJCjMNbx0LVg
 FIymtrCbn3TyLz+qkniH+i0f5BJmV4ihPDgc7hLvtaZYvG9bNxfJcPDhqXCQ8rryl0gvBpk+Jd1
 x38U2OuBjg8iblYrLu10y7a++V7C9Z2zyBNajl2uE3JKul2R2/J5HKFvQM1tNJePEuGYghyZpsh
 RPtCoKH
X-Received: by 2002:a17:90b:3a4f:b0:354:7e46:4ab8 with SMTP id
 98e67ed59e1d1-357b51cd9a9mr2657212a91.18.1771059264542; 
 Sat, 14 Feb 2026 00:54:24 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3567ebc3af1sm10256622a91.15.2026.02.14.00.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Feb 2026 00:54:23 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 mani@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, dev@kael-k.io,
 kever.yang@rock-chips.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v3 2/3] dt-bindings: display: panel: Add compatible for
 TAIGUAN XTI05101-01A
Date: Sat, 14 Feb 2026 16:54:08 +0800
Message-Id: <20260214085409.3489057-3-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260214085409.3489057-1-yelangyan@huaqin.corp-partner.google.com>
References: <20260214085409.3489057-1-yelangyan@huaqin.corp-partner.google.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.19 / 15.00];
	DMARC_POLICY_REJECT(2.00)[google.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:mani@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:dev@kael-k.io,m:kever.yang@rock-chips.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dianders@chromium.org,m:yelangyan@huaqin.corp-partner.google.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[yelangyan@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yelangyan@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: BAC6E13B7A1
X-Rspamd-Action: no action

Add a new compatible for the panel TAIGUAN XTI05101-01A. This panel uses
JD9365DA-H3 IC, so add the compatible to the jd9365da-h3 binding files.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index 5802fb3c9ffe..0bb4980555e2 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -23,6 +23,7 @@ properties:
           - melfas,lmfbx101117480
           - radxa,display-10hd-ad001
           - radxa,display-8hd-ad002
+          - taiguanck,xti05101-01a
       - const: jadard,jd9365da-h3
 
   reg:
-- 
2.34.1

