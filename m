Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH40CAC/hGnG4wMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 17:02:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B3CF4E93
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 17:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC9710E90B;
	Thu,  5 Feb 2026 15:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="3AaDExPn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F06410E90B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 15:47:17 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-35338b3dd31so497455a91.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 07:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1770306437; x=1770911237; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yDKwYtSz2rHLZlmz++8JE+5jZt5IbvWeMlaBLIl+ipQ=;
 b=3AaDExPnMwh0BnI9x0zi+ABMwgxv4DuozUuFbyvfZZEgj+rmb08qx/RXe+FjokUxOx
 H7+aeohsdSZHkAnBqffO2neHjzNIl8li5y++RHQEp1m/sPTZ547c5sLN+j4SigXgBPL2
 KjuQwsgRm4JYhMDJOMMBBpQeCZp3JD/kTOwb6yuR7saKnR60Z62MwN1qC8shtTXohhcT
 QKfIKm5XLSifTunout5fJhuVNOFBubWmgxEBcWNiZkD56UF+b081uVEHFfAUb9XcWU4p
 InEZj1Hw9G4gPAbkvOZL3unoyq93lPwIkwCAqS7OaFRgq9V0YBl8/HE/RORKytRGcbOh
 g7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770306437; x=1770911237;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yDKwYtSz2rHLZlmz++8JE+5jZt5IbvWeMlaBLIl+ipQ=;
 b=c56NbkJbMnZ44h2xX6rCoPvS2uBZI5b3htABe6f8dJK41371xAQME8RCiNeTJb7xZB
 wxB/PcKSeMEy6R9aySn7hxnAl2NmQoCHD9JI1QnLhicYZM/qD5ePlx+EgCYubxhL8+zC
 jQfhVDR4m7P08jeC4TxUszrjw3iQE2hsGwWxxmea/nKEMtLYGG9KMy/85PLhv91hU9GZ
 SQpGlriB34cdrTZRUholk1lSpOzMVd4uOqIPE3aWRv3oOWuJeCp+PCWVmsrFft2CHJpy
 biYSdZloDR54pzGfTeoTFpc6Nbygbx9iWDj/Ne5rRFUky/THlkv72ooFTt/B7FPMg+mT
 RxCg==
X-Gm-Message-State: AOJu0Yy9FqsWQ2U4xqq5uAn5gE35Y1v041hn99RmS/0fX3GhTzNw6j+X
 vGD/lqYCCcwOq1uu6BmnYe50rW1ho8tf0iwp5bYshEqL1wox6m06N39q+Bz82dI0CjA=
X-Gm-Gg: AZuq6aKS1o1T06ZZTltgNu3R88nHxLVpiV4a+MYKG1e59/iaqs6hkUIC1PgZvWPk1Lu
 E/eDhg8lr/yP2pPghtPraojBzi2lBx8qoQqFmBDcwYRj8yFvkOZe0Y/0AvVVwiGOGbrJ5x5zDcO
 NWuZT05iOPhaRrVlhQsnAWA1aln48MAM46ZkISKE9V0KKU3g9wZk95afK4rsf956qXuyWxOMoVw
 U+iKpo/vRS1djE4aBELNpvEbT7erZZyCF8ckdQL4FgLU8KqZx7XzctroZRz4ViTz8zpZEBjj3Ep
 20G/C67/mb/WEpyVHLKMiskCfkyoIsFFHsnAgPN5ixq83PELGqQ/x4D+xfMYkQgqWfzPYD9FN7G
 MOcDHA+Lo9ZDeunh0efMQPGC99ixc/t1ZrrAj/b0oNpVLcF9OGQI3M+a57DXouG4IAQB31qishq
 VHF+oMmIRwDgGx1mSU4BS8Zk3apowrnjwyGeg11GDvY0Teo0xTi/WuB2l+Lw==
X-Received: by 2002:a17:90b:2889:b0:335:2747:a9b3 with SMTP id
 98e67ed59e1d1-3548720a3eamr5471859a91.32.1770306436773; 
 Thu, 05 Feb 2026 07:47:16 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3549c09df19sm2792675a91.1.2026.02.05.07.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 07:47:16 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, jesszhan0024@gmail.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, mani@kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, dev@kael-k.io,
 kever.yang@rock-chips.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v1 2/3] dt-bindings: display: panel: Add compatible for
 TAIGUAN XTI05101-01A
Date: Thu,  5 Feb 2026 23:46:56 +0800
Message-Id: <20260205154657.3085820-3-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260205154657.3085820-1-yelangyan@huaqin.corp-partner.google.com>
References: <20260205154657.3085820-1-yelangyan@huaqin.corp-partner.google.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,huaqin.corp-partner.google.com:mid,huaqin-corp-partner-google-com.20230601.gappssmtp.com:dkim];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,sntech.de,bp.renesas.com,kael-k.io,rock-chips.com];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:mani@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:dev@kael-k.io,m:kever.yang@rock-chips.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dianders@chromium.org,m:yelangyan@huaqin.corp-partner.google.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[yelangyan@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RSPAMD_URIBL_FAIL(0.00)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yelangyan@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[yelangyan.huaqin.corp-partner.google.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: A4B3CF4E93
X-Rspamd-Action: no action

Add a new compatible for the panel TAIGUAN XTI05101-01A. This panel uses
JD9365DA-H3 IC, so add the compatible to the jd9365da-h3 binding files.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index 5802fb3c9ffe..cac8ff562492 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -23,6 +23,7 @@ properties:
           - melfas,lmfbx101117480
           - radxa,display-10hd-ad001
           - radxa,display-8hd-ad002
+          - taiguan,xti05101-01a
       - const: jadard,jd9365da-h3
 
   reg:
-- 
2.34.1

