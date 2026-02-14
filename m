Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DAVAUE4kGkuXgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 09:54:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AECD13B798
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 09:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EF110E1EC;
	Sat, 14 Feb 2026 08:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="S8VkAhWB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E927810E1EC
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 08:54:20 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2aaecf9c325so11290885ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Feb 2026 00:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1771059260; x=1771664060; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5wTwZEnEG/9Ds48VtKchW3YwASmIm60NJ9pqu+T/QDQ=;
 b=S8VkAhWBxrRSfWTDskkefRT3PKaLjK1alA2YK5UKhnWkTey+k30cTJaGGTlKcPkwv7
 y831x39JBiOEArH48eQwq1UmETZsSv/c2oyCgGevmlwDILGO85DBzppu5dKiPSoOzWuV
 c1CxuCQjsW3pMqRJ1eOvTfVzHXxIpuujqOwsvxSO+NxU2zlRMLBKme+KcN2g7vOKAbIN
 5k5XEn5KAfm76fbSjfu0I9YNRddImussYn8GRKMK3helNDrxW//Z5egCtcdyH8ulU+xd
 eu6edaa4cQo5YUkjZ2hK4AIG7gfFQGfIke31caF40ZGhj3ETYVjxMtkJl1IoODEJ5IkD
 ss8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771059260; x=1771664060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5wTwZEnEG/9Ds48VtKchW3YwASmIm60NJ9pqu+T/QDQ=;
 b=GZt1E4H+BvE27YeM5DsT+TXN4l2u1+9CS5K+4Zq93J2vnAr0LevPRTudArDbLbxaou
 lcNl+c6dx8WBcalW6fIZcudTfubJXhYjOQFvTzR1WOuZ7gfHmjoKl2RvX7Q4cmdPKj9k
 405MqFZdnTYBvd6D+TfcG/Mx2VDoM2vcCwk9+tUvensADkbfA53ygMyHu0vgXnhCTAdw
 zfrTyjOoTx8KplU2SREQiw/RrnaSnvIbRSGPBKVNCa2Dc7XoOHN61ZiVRoOJFYNdJ+fS
 D8e4DGRfxrcjMoU8DnfEk30uKolpapuMFUQdhiW0DFp/d8rmNWRGnePYe2NndRkoX0nd
 iuYw==
X-Gm-Message-State: AOJu0YzM1E4meSKD3GBes8qq0Lb/s+cNfnZtFTu59fq/lmotYWKpweZs
 9oOkyLxsrTRguXo4G+jZnOChTabj+6lzetlZvYkyj1aD9hg56xmwzlhKx4rl3oOA9f4=
X-Gm-Gg: AZuq6aJtGTUnag2NgKwhR6vn5MABkPe59GmscKeikZ/OeCPCAYe5NDc/fR36nVX+Blu
 /RhTgKXl0RA4SS2rhxZhohkaBpL6v5dhWpRpEp3YwEa9Y0ziTjKW5nzskcCT6SajIWW6VvdTXtb
 R+TOHkeSx8EAORSrWuTF48qNYtvsFxOTMHmsWdGhVqhAeJQwk1UKv47B1By+KGI9Isad2VVRdzm
 OGv2xzPi2KWc3tlZXLalr1d9+1unWoEIjojxhXE5MoFn0J+fiLuV4BBULEhuThI6yC9GubHDSXx
 dyEfJ07k4cgvbjMLUhsgvrTTEQYOOw63yZ7kSb1i/YdAroa9NYxBUPJHyPSiVbO2eyxAa6qOBpk
 ubUmOTcQ7zKxOLMCHjrw/GzcH9JNoAL+pADzMDLoXTArQrmtaCV+2VXimbisZKOwJwSLGQCoFlh
 wbUOnepSdJiRnDYLZL04CyfL5nAhvq30XfAjQly95uGMCBjWdAo6bqChPQhdD3AeKLCW5Ukw==
X-Received: by 2002:a17:903:230f:b0:2a0:9a3b:d2a4 with SMTP id
 d9443c01a7336-2ac9744558cmr28409435ad.10.1771059260505; 
 Sat, 14 Feb 2026 00:54:20 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3567ebc3af1sm10256622a91.15.2026.02.14.00.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Feb 2026 00:54:20 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 mani@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, dev@kael-k.io,
 kever.yang@rock-chips.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v3 1/3] dt-bindings: vendor: add taiguanck
Date: Sat, 14 Feb 2026 16:54:07 +0800
Message-Id: <20260214085409.3489057-2-yelangyan@huaqin.corp-partner.google.com>
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
X-Rspamd-Queue-Id: 8AECD13B798
X-Rspamd-Action: no action

Add the "taiguanck" vendor prefix for Shenzhen Top Group Technology Co., Ltd.

The prefix is derived from the vendor's website domain:
www.taiguanck.com/en/, which uses "taiguanck" as the primary
identifier of the company.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index fc7985f3a549..1856e455f7e6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1598,6 +1598,8 @@ patternProperties:
   "^synopsys,.*":
     description: Synopsys, Inc. (deprecated, use snps)
     deprecated: true
+  "^taiguanck,.*":
+    description: Shenzhen Top Group Technology Co., Ltd.
   "^taos,.*":
     description: Texas Advanced Optoelectronic Solutions Inc.
   "^tbs,.*":
-- 
2.34.1

