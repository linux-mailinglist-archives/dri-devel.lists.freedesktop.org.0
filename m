Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C6WMaxJk2kT3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC9A14652C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5FA10E3C5;
	Mon, 16 Feb 2026 16:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KMPUsgY5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6636E10E3BC
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:45:26 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id
 a640c23a62f3a-b8de2b5a122so59438166b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771260325; x=1771865125; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zE1wS+bzyklMWC6UGg3g+8h32nwAI9MGCOjGOVsA3s4=;
 b=KMPUsgY5b9mp2Y5O/Q/s6PjEiEtdfuIcH1b0moiC9qyNFoec5r/o9gBzqNBypo8VZg
 L3fOWWs+MJ8Lizd185iScNm1TP8B5sOJWyRz8kHfCWaxleR7Gr5YVVaY6cSMUiQmUQWg
 kslS46suTDKbkwrCUY9rf23wdtn/sRv9iJWf0NQkKy6TY7pJV9vrrvAs/2LbwphH/69A
 YmJ/W4PrF30bg5t+06UBUSf/BtZe3rao0i9/GRprhaCEk46eO2rhWCAg3MnXLJSw6jji
 hxZXy+R5FiIjtV16VpEDzWVuTrB03qcoPfySzFQr+j8SOLrQQPFC25enD+xFlf1UkHU/
 zLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771260325; x=1771865125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zE1wS+bzyklMWC6UGg3g+8h32nwAI9MGCOjGOVsA3s4=;
 b=R1Ivs4dv4C6V/HzG3op8l9k8JWyGZDLZKPC/CKE53Qr4PApLFQl4BNKN7yqj9MkEPZ
 BjvDSA/otrrR4gQRqyHfHmLnSLwT1Uw84XqTvYFxrpDFya1ml7pJ4oMEKR3po4wb5VtF
 A0kydkgFmM3EQQJhDZXS+BhvC26tzqGugHMBb9A015em1WnRL+/zXWYqnpVvDIhYzXrG
 XQSeb6jA8m4pAXjw4IiuBon6ej5mXvWzj3FNTiLE/Z4uQCBVSpr8FC+kIZikO+3cbbcU
 wvVFOkwJFHUMvWGh35eAkZvD35Xbmt1giDIQH6UQ4kxxWBtsq6UqB2wwQoI6BEYUWUWM
 6UkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxdbvXSOs9HcYw70B0WUhpEnx12a4fE64OOS01YIkpU9XuV3ak1zJDxCBxlGOsrHssN7f9JonQJL4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUpUfq5rY1M045Ue1LyhanrubYwCO8qbq0G4GVQo77t7WxTrM0
 Vxjmlm0tyoRoQYdAQXy1cU4QRUAHhldYimB3eAMSdOU8uJ/gYYhqUPXA
X-Gm-Gg: AZuq6aLG6xgnQLBMgYXgvfpsCYF0lv8fknimnAidrNrUs6qXo16xgPxvirhbVW2qhoA
 DRpog+dRpl5JHaA06SZPPyGVBsh4RuTW+9hzNu7ox0UFUKunUCteJz3iLP0Kjw5QBFhKRf89FIy
 b28jUcuj7BPx6crPVB8lEBTcMkaqyG/ScVgKz/F3bj2BQXYajVNJoBoak6XOnBxeUpWSG5bf+Aw
 LZ8UFDWYMayzuxpLxHEvndb8sjG12VF4tzjA70DIJDkw67HH3Gnst5wpDb52pzo/8LcrYY4SuvA
 Xk38ZB1NVWLKaxlZEBF3OhkYcsC1xHMtG9pYk3TwHKk0/E+yFtGoOJK3uu5Do9BpzsduY8/DD9+
 KTPW20vBRRf6duqdbfTS79xeXb4/DiNIRFrrtQe5KnnGczEk4oK5uj9dpPAmlUtaqyb1jzsGFYA
 w+bsnxgbM3sfoGiVNXDKgn0jBdArqWbkykgTFci3C0Dk5YxBtkCnZTXcYSIEmddBmbBTIJT8e51
 rwI
X-Received: by 2002:a17:907:6eab:b0:b87:1eaf:3762 with SMTP id
 a640c23a62f3a-b8face929c5mr359565066b.7.1771260324718; 
 Mon, 16 Feb 2026 08:45:24 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735d185sm264683866b.14.2026.02.16.08.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:45:24 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v4 04/27] drm/amd/display: Move DisplayID vrr parsing
Date: Mon, 16 Feb 2026 17:44:53 +0100
Message-ID: <20260216164516.36803-5-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260216164516.36803-1-tomasz.pakula.oficjalny@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7BC9A14652C
X-Rspamd-Action: no action

[Why]
DisplayID vrr parsing was always attempted, even though it's data is
only ever used in the DP/eDP path.

[How]
Move the parsing to where it's actually needed

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 903264b26d1f..be3bb5a86959 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13326,12 +13326,11 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	if (amdgpu_dm_connector->dc_link)
 		dpcd_caps = amdgpu_dm_connector->dc_link->dpcd_caps;
 
-	/* Some eDP panels only have the refresh rate range info in DisplayID */
-	if (is_monitor_range_invalid(connector))
-		parse_edid_displayid_vrr(connector, edid);
-
 	if (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
 	    sink->sink_signal == SIGNAL_TYPE_EDP) {
+		/* Some eDP panels only have the refresh rate range info in DisplayID */
+		if (is_monitor_range_invalid(connector))
+			parse_edid_displayid_vrr(connector, edid);
 
 		if (dpcd_caps.allow_invalid_MSA_timing_param)
 			freesync_capable = copy_range_to_amdgpu_connector(connector);
-- 
2.53.0

