Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEBOO+hEgmlHRQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86588DDEEE
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 19:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A14E10E752;
	Tue,  3 Feb 2026 18:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L7GeOq7i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD3010E750
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 18:56:36 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b8de2b5a122so71328666b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 10:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770144995; x=1770749795; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Vvinyd/bDfTMBX7NZU90g5DKWFs8k0OH4aETYAERXs=;
 b=L7GeOq7ifzKP7V7dXBY4CVb5y4lq3gJz3WKjMYEo45vfmJbdzkC7ew1DX4Laq663qi
 HsUJKDpf2uXOg/fEmEnk35EPNhglwyF9LNXZCM3PIq7vmWXMliLYoZ3MoUCAK4d2uY1L
 4jFh2QZSwF1M2vOCsuZTZT1e9vWDIqf0hxViI2HsKX6SZGe0tQk5Wyhzna3CL49X0rmw
 xH5L8RY5KMoGecg6kEX8GLSvMMbzJFc/JPUKj9yghvTwbUtNuNZWXB1bU36AOYEEioNZ
 Eo8MWPphX6oecnAJPyu6w5l7eG+OqUW0MnrE+2+fjDLRbIk7g0bSupjCjAl1ZI2EhJPz
 7+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770144995; x=1770749795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3Vvinyd/bDfTMBX7NZU90g5DKWFs8k0OH4aETYAERXs=;
 b=HgQ9Qd/jG7kJ8FsiQxu4T+Regw9P/NSUfJ6I/l203EXZ8BcsrWRAAsiyWTsNgk/eAn
 cRv+ZJYjKGSfmKNrTg9Nc1tBvLotNDJaa/RnWUOJgfm/n9r1ahl1S3Jr1rDF04y7QG2V
 NHXgdGfZU91L+7hvYIxGDnWEW6bptchuwCOeXCV7S3lNVYz0sTFFbQU0mnlz3AaynEZ4
 oyKPcJmfCCmFnna4ESwwmMeJVgY2lR0MgZiHFup4sT8lXGwl1P7Pfkat81lgdYZK/OjS
 7d/B8aj2hgWNWpMgYQMojk2gJf2IOmnlwNaBbt/GRLL/3gq36aUqmLXsTWeEQFlo04Dd
 +B0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdxSw7UfYkpFIUZz4FJh+HYPyAQuuy6qXUvEYP3m9Yj7DxwuqcD+EB8Tm9qdws8IHGZzVUmifwaxA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyN44uufAuIhkxv2KstO/Xd8TqxmBIsVTdb7uOC5/D4gn3TRTbC
 G4oCKXiPwPLMXCcX38m1rLg4a/MiOBqnW1yjESwnsXLeXQsZxX6JJpXv
X-Gm-Gg: AZuq6aIs9CzwwDLxHhzRIY4lB0J2lpEi7znpRcp2PcMpIR4ET6JVaKKPnjs1BXLAueP
 sV3gkGIATdtV85uhnYeOaCDX7l8CyFGLgqLfd91fO79uBPuosOsp8BUehw1YqttdvXjXeHPzXlu
 oLwzywwxFbc9k2OdKNgDlVVWELKOv85fX1gpY9IUm2rgNVn7Fqxyt+/gRQIflGuuFCctIz2Gp/0
 zOfn0hMMa8Hmy7Zn23aEYK3fPavjlPZiluSDDG5YmtpEblMxI19JLlyWnnadKP8yJA+Z0I6IEtf
 Xj1+c5GyVXsvsCnAv8W5NlZg4pHzTCKSUMdk5aVKWKXJMITN6b9eUMSn/ZFceAskBveaz55LfWQ
 nLMx/4o5PisxRTlU7gEFG77zTpj/LVn2WVAId9hgAgyzEbazr9u7PQgMIYhQgNduiDF9MFXiiy4
 DxXJjGGni3Spczq1C+fqeITEYLzaZ/wDkaeumUGD9yqFcveFETZwGCKvBkFS+Lo1sj
X-Received: by 2002:a17:907:3f08:b0:b8e:7dcb:7f23 with SMTP id
 a640c23a62f3a-b8e9ef22f6amr20457566b.2.1770144995003; 
 Tue, 03 Feb 2026 10:56:35 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8e9fad97a7sm16715766b.0.2026.02.03.10.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 10:56:34 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org,
 daniel@fooishbar.org, admin@ptr1337.dev
Subject: [PATCH v3 04/19] drm/amd/display: Use bigger VRR range if found in
 AMD vsdb
Date: Tue,  3 Feb 2026 19:56:11 +0100
Message-ID: <20260203185626.55428-5-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:admin@ptr1337.dev,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 86588DDEEE
X-Rspamd-Action: no action

[Why]
Some monitors only expose their full VRR range in AMD vsdb for some
reason.

[How]
Compare exposed ranges and use the bigger one.

This check could be merged with the previous one but it's better to keep
them separate to easily convey their meaning.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4177
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 856007bba4d9..284f5b326c18 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13242,6 +13242,18 @@ static bool copy_range_to_amdgpu_connector(struct drm_connector *conn)
 	return is_freesync_capable(range);
 }
 
+/*
+ * Returns true if range from AMD vsdb is bigger
+ */
+static bool compare_ranges(struct drm_connector *conn,
+			   struct amdgpu_hdmi_vsdb_info *vsdb)
+{
+	struct drm_monitor_range_info *range = &conn->display_info.monitor_range;
+
+	return (vsdb->max_refresh_rate_hz - vsdb->min_refresh_rate_hz) >
+	       (range->max_vfreq - range->min_vfreq);
+}
+
 /**
  * amdgpu_dm_update_freesync_caps - Update Freesync capabilities
  *
@@ -13313,6 +13325,10 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		if (is_monitor_range_invalid(connector))
 			monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
 
+		/* Use bigger range if found in AMD vsdb */
+		if (compare_ranges(connector, &vsdb_info))
+			monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
+
 		if (dpcd_caps.allow_invalid_MSA_timing_param)
 			freesync_capable = copy_range_to_amdgpu_connector(connector);
 
-- 
2.52.0

