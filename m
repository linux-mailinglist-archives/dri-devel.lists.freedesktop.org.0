Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOfUCmdjdmmVQAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640AE81B9E
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 19:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B9910E372;
	Sun, 25 Jan 2026 18:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZvNwLJdg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB8D10E373
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 18:39:32 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id
 4fb4d7f45d1cf-658323d1c91so558900a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 10:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769366371; x=1769971171; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wD3DZNrHRBINvEokamMq5jiUBWudz0vnljedektK4oE=;
 b=ZvNwLJdg6SgwpXRVs07hszBs/x03Q9/P1PESbSsKqYXSWTLdluGyCbJgFSwOG04TuA
 iVGcasrdu/LSzvXcJKt5/azN1/v1KKwHHd3OHLO+CJ/otyBSPpM1Ey5SrWauHrZkRUz6
 pH8Vw4x9QCcQ+s/phNTvQwVb2pHNasiwlr/Zersqv5l5H6au1lbP96muPo5XCvJgRt6E
 CcYn5z1FeBb00IXa8cUnQ4cbcg4APefbfw3VI2CRUkJYJXgoijvonC0MiHCohvR0+hBz
 mdF0Y9UpQ6q6pqlbs+bt3r3t1Aj3nzkHuIp5OGZBCH594MOnrSL22ppfXzW8afLsP9Pc
 sF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769366371; x=1769971171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wD3DZNrHRBINvEokamMq5jiUBWudz0vnljedektK4oE=;
 b=P4qozEbv1X2vsfeZ/8xA1Uk8IoumNtFqekFaZ0yfI5CajwuQGatWqrSktZ4VQAjPJH
 MUL53m/fsWYpp10VFU71ED18HUwbHm0Ucvgq8UHjucqC81zGVfoudFq66V802d8UhqU3
 W9CVD8VbzIHR2kzCE2uin6dwgKZ4WZc9zAgDmAv6rIHmhuwp2cu9ULUqizfJckuRFkzw
 1+M/ZN2WHbBdogYQkQx69G205CRPVy+VxG5GBcUseohJS7Bg0DDV3Imz2oqQBG/9vqC5
 DnitNHDKb3sNFIC3aZGvTZ+EMRu8jWuUGAbOI+RP6VG1mrdvRO0Kg9RH8hQ4ExUDfIvo
 eP/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4qSSRHKGIqd5nHLi5XqPUmIEuNYSwbcIXWSsTZiYKYlTPNXcw2pR03lQ1Sqp3alkQvAVRoKqXMY0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPYCk2HJHMVKCgA2iElmXN1lxcCcMVErs8gfvD7l1iDNCly5JN
 Uu0mz1a7Hydv23JaDelIbXjW06fiueNv9WO89Q48h9tZTDWjiPEQ8Jun
X-Gm-Gg: AZuq6aIzRuquMh5w0FsP5l2hF9La+tYUBY1s8XDAIoLP9FFd3NIZ7tkcraF0Ix+Lc54
 9Ai2nZ2KKnsKILuefs2OvBNnfzSHGvBlt8yUrjw8c1VOyLH4Y3EeznpcubmcyofE26NsQUO9YOO
 +o3johu6HgrLd16AWdb2ySlkIp8est0QXy8RAEnTPQtOsn90oI6EWur8xN83VLk6eA6zZN9n7hn
 +3f7dwzccXbrJf0wuYmSVo+XWXkNIixmZoJb6cDRHHgwOeHhy0HDmk/7O6YB01bSOEYWMn9I5Eg
 6E4eVM2IBCIIcHDgk5ljA2Y6HcmT1/MtA4ruKh/oMZcxAvuSecYswFQe1tk2SY4AGoO7OsV1Vsg
 TnfcJCXA2KlxJ93BjV+hOjqcwniK0hUome+dsxzmEYkxvNJmNNZzGWSpyWetlvVl/l5YckrYhuc
 ILGn53RrbR4BsY7Z1kjafankFqJCypDWmAvaVv3hrzt9KtuY62z327GWvfhWKaVNSI
X-Received: by 2002:a05:6402:1467:b0:658:1299:8a03 with SMTP id
 4fb4d7f45d1cf-658706c3572mr823565a12.1.1769366370537; 
 Sun, 25 Jan 2026 10:39:30 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b885b3dad3asm499133766b.12.2026.01.25.10.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 10:39:30 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org
Subject: [PATCH v2 10/19] drm/amd/display: Enable HDMI VRR over PCON
Date: Sun, 25 Jan 2026 19:39:05 +0100
Message-ID: <20260125183914.459228-11-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125183914.459228-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260125183914.459228-1-tomasz.pakula.oficjalny@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:tomasz.pakula.oficjalny@gmail.com,m:bernhard.berger@gmail.com,m:michel.daenzer@mailbox.org,m:daniel@fooishbar.org,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomaszpakulaoficjalny@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 640AE81B9E
X-Rspamd-Action: no action

[Why]
Not all TVs support FreeSync and many TVs suffer from VRR flickering
while Freesync is activated.

[How]
This works the same as FreeSync over PCON just without sending FreeSync
info packets (we're sending standard DisplayPort info packets) + reading
the VRR range from the HDMI Forum vendor specific data block. PCONs take
over HDMI VRR triggering.

Prefer HDMI VRR over FreeSync to reduce VRR flickering on many TVs.
FreeSync over HDMI seems to be a fallback solution and not a first-class
citizen. This especially helps VMM7100.

Tested with VMM7100 and CH7218 based adapters on multiple HDMI 2.1 and
HDMI 2.0 devices. (Samsung S95B, LG C4, Sony Bravia 8, Dell AW3423DWF)

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4805

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Tested-by: Bernhard Berger <bernhard.berger@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 32 ++++++++++++++++---
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2f856833806e..d3464705ab7f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13210,6 +13210,21 @@ static void monitor_range_from_vsdb(struct drm_connector *conn,
 	range->max_vfreq = vsdb->max_refresh_rate_hz;
 }
 
+/**
+ * Get VRR range from HDMI VRR info in EDID. If VRRmax == 0,
+ * try getting upper bound from AMD vsdb (if passed).
+ *
+ * @conn: drm_connector with HDMI VRR info
+ */
+static void monitor_range_from_hdmi(struct drm_connector *conn)
+{
+	struct drm_monitor_range_info *range = &conn->display_info.monitor_range;
+	struct drm_hdmi_vrr_cap *caps = &conn->display_info.hdmi.vrr_cap;
+
+	range->min_vfreq = caps->vrr_min;
+	range->max_vfreq = caps->vrr_max;
+}
+
 /*
  * Returns true if connector is capable of freesync
  * Optionally, can fetch the range from AMD vsdb
@@ -13259,6 +13274,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	struct amdgpu_hdmi_vsdb_info vsdb_info = {0};
 	struct amdgpu_hdmi_vsdb_info vsdb_did = {0};
 	struct dpcd_caps dpcd_caps = {0};
+	struct drm_hdmi_vrr_cap *hdmi_vrr;
 	const struct edid *edid;
 	bool freesync_capable = false;
 	bool valid_vsdb_cea = false;
@@ -13296,6 +13312,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
 	valid_vsdb_cea = parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info) >= 0;
 	vsdb_freesync = valid_vsdb_cea && vsdb_info.freesync_supported;
+	hdmi_vrr = &connector->display_info.hdmi.vrr_cap;
 
 	if (amdgpu_dm_connector->dc_link) {
 		dpcd_caps = amdgpu_dm_connector->dc_link->dpcd_caps;
@@ -13341,12 +13358,17 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		freesync_capable = copy_range_to_amdgpu_connector(connector);
 
 	/* DP -> HDMI PCON */
-	} else if (pcon_allowed && vsdb_freesync) {
-		amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_PCON_ALLOWED;
-		amdgpu_dm_connector->pack_sdp_v1_3 = true;
-		amdgpu_dm_connector->vsdb_info = vsdb_info;
+	} else if (pcon_allowed) {
+		/* Prefer HDMI VRR */
+		if (hdmi_vrr->supported && hdmi_vrr->vrr_max > 0)
+			monitor_range_from_hdmi(connector);
+		else if (vsdb_freesync) {
+			amdgpu_dm_connector->vsdb_info = vsdb_info;
+			monitor_range_from_vsdb(connector, &vsdb_info);
+		}
 
-		monitor_range_from_vsdb(connector, &vsdb_info);
+		amdgpu_dm_connector->pack_sdp_v1_3 = true;
+		amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_PCON_ALLOWED;
 		freesync_capable = copy_range_to_amdgpu_connector(connector);
 	}
 
-- 
2.52.0

