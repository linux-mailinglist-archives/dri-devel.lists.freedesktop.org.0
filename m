Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9AkVJM+9hGmd5AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 16:57:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F78F4D52
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 16:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABFE10E199;
	Thu,  5 Feb 2026 15:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="PvVDddci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE9310E199
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 15:47:09 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2a7bced39cfso12039675ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 07:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1770306429; x=1770911229; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=demHIeaXhtYOCexws30SQF68jX3ViWOu3xcS2NdOUdo=;
 b=PvVDddcihnbbdD3xHaldEgVH2leZYHXUOsh0G0vL/UOw5e9B8IXpDjLx6kppK6mLVN
 xq1E7RIH2Tvepsou47+lc5L8q8dMIqJ06Tu4eNpLl6Q0z1c05+PwWo664JUhvET/Giin
 NSaXHYVQ9j7cV2tReyk19X1Lbp888xR7omayFFpoCPuBlltGGr6wxMxydbt3DKKZ2mV0
 6pFj9+rv5EM6G7YJXwpHYrcIAK77ct8vlIytL+ayhE5q1UsNfaQucK2uCminIPq3cPmv
 IgPmqgz1nUWwXFCC3Vv0v/E9UFaEtlLlrw1z1ACVCIuFgjfmy4QgnDeFekTPgVlsCJ5h
 mNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770306429; x=1770911229;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=demHIeaXhtYOCexws30SQF68jX3ViWOu3xcS2NdOUdo=;
 b=K77xmFrb7+vOWculE4/0B4nnPBE8hEonJGAwNxA3kEPLl+qeYHhAgsuNsT7LcakiJW
 zyHl5G72HWfi2p+eFN3gQQ0NVWXxdFrfvGMjUX/+nmse3n+qbdd7+nvrzOF8z2v91MnG
 Qdtdf4qIjPuFy7UXutnExjv7HBqB3tenygLQpCiH+8ZOwA2VMNUsBVXgp0l9dvzZ4zIq
 hHHGd9/4VuZILKAXOr+Q8X3zzdyiHikDvHQ4BtnlkyPWt9dD9ckDKb/a/WfCOqXt5u9N
 5VM2K798LnOLq4FKT4Sp9R2D5TYOBZSSEowmzEs0ffuYWV8Bb8+ULzXgiNb8znBPIzru
 IF0w==
X-Gm-Message-State: AOJu0YxB5PnoFQSafDf0KAM8VewmnuMC0s7ZAnerjKixRo8/i7a4kfwh
 m0jiu9t+6lvQoNsDsfHG7NLAUs7Alo1IR+qk0hcR/wT1CDRjHLJj2+h83c3rEa6mfNE=
X-Gm-Gg: AZuq6aLaZL73XsbXGVJZylhiDPllmTZCW/0VGAIIroSM5KP5ooMOWhOIz5xcpFv9F7F
 B+wlCn6L5WgAZ/gLPRQrVhiKdILJzJ/IrzFZ54L+4J0J+SCKtG8bkUX7QQFLxw52FPnSWzGp/t8
 FKy2Z4/50QjAr1WuABVgWSoSujwhe1y2Li6ERfygqedRhPkqxPrWI6bLfl178ja7sAyStnQWcZp
 ab6/bckhi9GArxA14Uh8otNiA724yyXHGFHgLnE8sz37SK5ckzBS06RjTXBUkiDlWqKcFNDvezq
 YzKOE8+nYIpOjw8aQDKOM1+8uqpHZjacLIGGke1v1rddCprrVbwvMgGM53VsCOGzd/zWFuWlQd7
 isOW/fBw052EXesO85c/Gx57fiB8n46ntG5BPrdocEvqtnpUcNMm8/dNUK+/w1+pKPrSgmsMmJ9
 C94XrGnKYd6nSz4NdIkCV9++hZthuN5Vz00mef7L8BvFH4FYQoHtSNx2INJQ==
X-Received: by 2002:a17:902:f682:b0:2a9:410:2400 with SMTP id
 d9443c01a7336-2a933e95230mr69060745ad.28.1770306428718; 
 Thu, 05 Feb 2026 07:47:08 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3549c09df19sm2792675a91.1.2026.02.05.07.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 07:47:08 -0800 (PST)
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
Subject: [PATCH v1 0/3] support for taiguan-xti05101-01a MIPI-DSI panel
Date: Thu,  5 Feb 2026 23:46:54 +0800
Message-Id: <20260205154657.3085820-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
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
	R_DKIM_ALLOW(-0.20)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,sntech.de,bp.renesas.com,kael-k.io,rock-chips.com];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:mani@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:dev@kael-k.io,m:kever.yang@rock-chips.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dianders@chromium.org,m:yelangyan@huaqin.corp-partner.google.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yelangyan@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_NEQ_ENVFROM(0.00)[yelangyan@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[huaqin-corp-partner-google-com.20230601.gappssmtp.com:+]
X-Rspamd-Queue-Id: F0F78F4D52
X-Rspamd-Action: no action

The panel uses the Jadard JD9365DA-H3 display controller, which is already
supported by the existing panel driver. This series introduces a new
vendor prefix, adds the corresponding devicetree compatible, and extends
the panel driver to support this specific panel variant.

Langyan Ye (3):
  dt-bindings: vendor: add taiguan
  dt-bindings: display: panel: Add compatible for TAIGUAN XTI05101-01A
  drm/panel: panel-jadard-jd9365da-h3: support for taiguan-xti05101-01a
    MIPI-DSI panel

 .../display/panel/jadard,jd9365da-h3.yaml     |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 244 ++++++++++++++++++
 3 files changed, 247 insertions(+)

-- 
2.34.1

