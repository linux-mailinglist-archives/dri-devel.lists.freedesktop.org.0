Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNGxNQhBomlz1QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 02:12:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8151BFA73
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 02:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66BB10EC51;
	Sat, 28 Feb 2026 01:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b0P0q+xd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E723C10EC51
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 01:12:33 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-82746ed8cdcso1337081b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 17:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772241153; x=1772845953; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UVWvXlolIB1z5Wdh/ZWEpJ69krVbfULM/4hKT6Ylcj4=;
 b=b0P0q+xdcs6NGO5h624gOFU/DgAyODs2EwpARCaCPXiqdTOSUakEa/EK77RkOj2jGq
 JGltKyalt8DSsE+9hf+zZYiIkh8vX/aEyuZJwpRE3DN5D0QS5C3edBTbp79SX1pnFoc0
 NYZjwDhL4hReNviSZyjsws0LyPNFx54HhcJATw0YbnM5ukPTxRkDe+32vleRbzOOD+aa
 YrJY7goiuNp7n3z9l144Iiz4zTvFeDDMCPZ+Vq6C9MHIpH3j33O8yc0YxDPwTzKmzelv
 iyf49H0gcrHPJnIg2Jz1IgD7p7A9Jl0XGIe7JBtW4DPp2MCpuPY/ycsaNRN4O0m0RWuP
 VrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772241153; x=1772845953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UVWvXlolIB1z5Wdh/ZWEpJ69krVbfULM/4hKT6Ylcj4=;
 b=Bb0RxVEq1ktw8WU4+/zEm9mYGlRRjh7u8iPO/f3i8RqgCcCuUlZ82FoTOnvk1AditB
 sr649Ecu4KGJRhNK7h6i894KomJddnj8f1I2N9ip+jvabt0Gl5Yqckau5UHbEtsJ6J+M
 UnCfT8Y4OMvRn8JtEgKjRZAcVQ1xubSat335smaxjDWmbsJ31YNpjM9Q6GlSmukStTtB
 7mvdsy/gYrx0qyEHUrJrOhVPQQLuvAPlMLxybFU/NsolgGzgnk5W1Jl2TAqnbLZgQwHx
 m7h9XvgN/vDYco64c/Dmrtf8hNOQhQs36B0D5qMELhxXu1QNwT165XwiVq6L4s24eGtP
 4aZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3mwbTqZnng+J37KCY45foD47ej2653fXM4VbKr8ZIaJ/DL9oHbEPOvKKI916Lr7dEYaiOx5w/vQs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJx45xYYeL7fOWnFv4oeIf9qiSOo1y9CHxKWHR1A4tgNDdYRRZ
 17yCSq6RzuSBlqaCoLrLQRGuZtUxELI/rdaI0M7ciQfo77/79Mt+A81g
X-Gm-Gg: ATEYQzxoo8i0WnqpaYDg+wNaOAmbjfSHmhO5nE+uShrO5zvzrTkgZkqqI/Ey9iwlBIz
 JC3sipDfxe3miU+93NfAddEj6j1tzGDluh7XnB1Xs0vPz4iKS2XQCxU42SHMlcEQuho0GnnjjBw
 iUD4j9oJDLrEX6pRXKoZjcK2Y0H7FwyoSZc+uilYuuk/Xyrdys0KjtxRb/RmhYMePZv5zZP1ab+
 510Tmn8rbVO4XeM2Gh6k5G6eh9fvp1a0ETShOb5MzFgbixMKZtOzYFBuCaqGAA6QDda1nJyCbED
 rzy/MaSf/KaV45k8m03Vft0KbonHoPAgLASh1N/1zW4+xP8n25lGYS9MAiluGiDUJUSd+Woo86p
 +zAapc74UViKbDQc/27bEE7XLYC4+uvzC/y6GeT7E/pFty/kihoPvph5kYW6/5ww42ESOchWPlI
 Syl7c8MXPgg0aNFcBy/0JDTJKw7MUY3+cwhNPh8rfGl59/JB9m/fQJ8Q==
X-Received: by 2002:a05:6a20:56a3:b0:395:1200:3abd with SMTP id
 adf61e73a8af0-395c3b45943mr4205836637.62.1772241153329; 
 Fri, 27 Feb 2026 17:12:33 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb6f46c2sm75772845ad.89.2026.02.27.17.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 17:12:32 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Evan Quan <evan.quan@amd.com>, Sasha Levin <sashal@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Eliav Farber <farbere@amazon.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zhigang Luo <Zhigang.Luo@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Bert Karwatzki <spasswolf@web.de>, Ray Wu <ray.wu@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Roman Li <Roman.Li@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Wentao Liang <vulab@iscas.ac.cn>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH for 6.1 1/2] drm/amdgpu: use proper DC check in
 amdgpu_display_supported_domains()
Date: Fri, 27 Feb 2026 17:12:12 -0800
Message-ID: <20260228011213.423524-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228011213.423524-1-rosenp@gmail.com>
References: <20260228011213.423524-1-rosenp@gmail.com>
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,kernel.org,amazon.com,linuxfoundation.org,web.de,iscas.ac.cn,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Xinhui.Pan@amd.com,m:airlied@gmail.com,m:daniel@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:Rodrigo.Siqueira@amd.com,m:evan.quan@amd.com,m:sashal@kernel.org,m:mario.limonciello@amd.com,m:farbere@amazon.com,m:lijo.lazar@amd.com,m:Jun.Ma2@amd.com,m:gregkh@linuxfoundation.org,m:Zhigang.Luo@amd.com,m:srinivasan.shanmugam@amd.com,m:spasswolf@web.de,m:ray.wu@amd.com,m:Wayne.Lin@amd.com,m:Roman.Li@amd.com,m:hersenxs.wu@amd.com,m:vulab@iscas.ac.cn,m:amd-gfx@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8C8151BFA73
X-Rspamd-Action: no action

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 96ce96f8773da4814622fd97e5226915a2c30706 ]

amdgpu_device_asic_has_dc_support() just checks the asic itself.
amdgpu_device_has_dc_support() is a runtime check which not
only checks the asic, but also other things in the driver
like whether virtual display is enabled.  We want the latter
here.

Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index cd0bccc95205..98cce09684f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -534,7 +534,7 @@ uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
 	 */
 	if ((bo_flags & AMDGPU_GEM_CREATE_CPU_GTT_USWC) &&
 	    amdgpu_bo_support_uswc(bo_flags) &&
-	    amdgpu_device_asic_has_dc_support(adev->asic_type) &&
+	    amdgpu_device_has_dc_support(adev) &&
 	    adev->mode_info.gpu_vm_support)
 		domain |= AMDGPU_GEM_DOMAIN_GTT;
 #endif
-- 
2.53.0

