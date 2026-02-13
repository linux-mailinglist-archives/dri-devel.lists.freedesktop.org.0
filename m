Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJwnHKXQjmnKFAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 08:20:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF7133767
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 08:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B19E10E79E;
	Fri, 13 Feb 2026 07:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="dE2wg5Yw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9D510E79E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 07:20:01 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-82311f4070cso371180b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 23:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1770967201; x=1771572001; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tG48E0q5sqsrKWbziqVKSM7WFcZQMVDv3PMe5rDG3bI=;
 b=dE2wg5YwjWBisH2EPZYQqaq7AbssXDfRw7EPR/1FJAcoRcuWyplRKoogAcsZaY5KMH
 ADW7dh6ibQ7MSXK2YvPuiAnGvM2Cb8/+mCMjJN2fNs2LwCLjKh6Agrok7u1p1D/dx6iS
 Vzsuxu+VV+s3IK95X55MVMiWdLZdZ3K1fWx+kXQJ0YtI+Fstswf1uHhbfdHP8B7Qlh0a
 1RNG4lx2aFTlEcyjXbxw5l0EKIBImJ51aZfJ6vs1qk0bDqyQ3DN39lWkNJvK8tX5KkNH
 6UPjiQQkOISe+UAI2Oz3ELJY8bR2wZQPiaKgGpANZJTCZORIgVP/u2BPQkk4Vkkps42J
 g61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770967201; x=1771572001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tG48E0q5sqsrKWbziqVKSM7WFcZQMVDv3PMe5rDG3bI=;
 b=pchrkRJ/b1OwBPiFlg1eT6dlCbpqjq1Yi2iwELHlvHMVJrKhmkuUWJxmxTmBGnIXAL
 /Rf4Fs/dKOyTxLzVuyhkXHxErGxRl0SsqerZUeG12tvkSAY+lucMDFf9+hwwsxxs4P6+
 +qDjKBwZLnUNJOA8CbvboXp67QC49AEbxYNMLMZfvu+a3B+mbbQjM8M86E9kPM8iFeJl
 qK3OskvB6Cwi3zkcZmMrvuKmBolLwpfKsnoWa4teSh25llhXL2BZCeOPLuM6sxq//6cZ
 YCZJ0KTHRTFDt/9tSxFH6Kf9QWv4idFQJ4uEaYM+hnJ846o54/XGJ57yamc12EBXtLcM
 wEGA==
X-Gm-Message-State: AOJu0YyZNiaajTVt03QnJwT21tI/DOqBJCy+XHGc0xJy/PMPV2DA603K
 tlUCtpKyisnlXFNYmPTDJ5w8qMqj3i8SQBRuK3UkHxPS11SO/AtOUbU+xhM5gBir07M=
X-Gm-Gg: AZuq6aItluGbg0Z0rU9vwofutNl53Ut0KYkZZFrXkqFJI9Onmnv4Bp9URHGzkEWFEM2
 6CpHUsELNa0pzj2A207IhxtWtO0bP17z2A2+m6kSvaNi9vuKtuEl1LskHD24lLGdsuh/qX6MfPG
 R3ZZY0eEDQa2cXFwrWerKtfcmHxV6DojfYpVzXYf1U8MhgR3/uTje0Cxwx8O9AdQF8VXJdQTpGU
 dEpay/n5NmDVrHSQaenasWoevM4qVsyQYf4KV6Ff3yM3C60RBiNYStT3e6xrBap2MKXNrFb7I8A
 fwVjdsSHxA1dRby5xi2CGCRBZwz9WBU+au6tMuGMtQ+ubcd6if1gXFxGcCBvrQ6twHDddVz/X3E
 x9lOULGgvAqlaawufVt1TPiXqAlRMR6TrBShZBXhprH25wyLXVJzxfiN6+Kdy3JF3G/gWw/EOWk
 +LQ3Dc8wE5MJgZuLPcMBpwLO2IV7ISorm33X82sW3ejRAFAwaRHxIuLfrkKOcTxw3ix6CZvQ==
X-Received: by 2002:a05:6a00:1991:b0:7e8:3fcb:9b0b with SMTP id
 d2e1a72fcca58-824c9d1967emr998256b3a.33.1770967201500; 
 Thu, 12 Feb 2026 23:20:01 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c6b95278sm1856936b3a.53.2026.02.12.23.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Feb 2026 23:20:01 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 mani@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, dev@kael-k.io,
 kever.yang@rock-chips.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/3] dt-bindings: display: panel: Add compatible for
 TAIGUAN XTI05101-01A
Date: Fri, 13 Feb 2026 15:19:45 +0800
Message-Id: <20260213071946.1436852-3-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260213071946.1436852-1-yelangyan@huaqin.corp-partner.google.com>
References: <20260213071946.1436852-1-yelangyan@huaqin.corp-partner.google.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,huaqin.corp-partner.google.com:mid,huaqin-corp-partner-google-com.20230601.gappssmtp.com:dkim,microchip.com:email];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:mani@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:dev@kael-k.io,m:kever.yang@rock-chips.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dianders@chromium.org,m:yelangyan@huaqin.corp-partner.google.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[yelangyan@huaqin.corp-partner.google.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
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
X-Rspamd-Queue-Id: 0CEF7133767
X-Rspamd-Action: no action

Add a new compatible for the panel TAIGUAN XTI05101-01A. This panel uses
JD9365DA-H3 IC, so add the compatible to the jd9365da-h3 binding files.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

