Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C8ECC6B30
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 10:06:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341FE10E6B2;
	Wed, 17 Dec 2025 09:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="ueKtvlzY";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="ja38b2lA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B512610E582
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 09:06:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-mwgq.prod.antispam.mailspamprotection.com;
 s=arckey; t=1765962391; 
 b=dH6zRRbSxL9xnsGpvx9CVoT9JsKrIDs+qcDvWx8L7UPk1fE+uI9f3PLxGwyvi5g7Ruu/VxHgy+
 KcyQJ/TN8WHOULz02cawssG+GL+JtOyfCBNh1jK5ratohWRXNN198KvF3P2jAElr0FEecrg9tk
 bJuXwYXvkE8gk9+6rr1YUZ9IPXnpEvJbZjb//LgZStWeZN+4HAsBfaqp9zPulz67YM6+ygvZPV
 Q0+SK8/j0RvBJN5+ud8xXSee/Q950xbK/g6BTYoe1W3daBKMq6/7ZElJRPzwEhh9zlgUUWtLS+
 z+mPMpmSuAGPDmnRD2KN+2I7XhizdCTznoYB4ezC0gKInw==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-mwgq.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-mwgq.prod.antispam.mailspamprotection.com;
 s=arckey; t=1765962391; 
 bh=ve2YlrOrfqp26weodtzAkKHhv6zFIo4Ht7/fa7CIS94=;
 h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
 b=SkIRBWe5C4qR0UWC51TzLY8vC977+inb59Ozf7G50ntx7/PppsLah/M/Vm7dhUH4VrSfaAHHPJ
 B+w/517RWa6QsJugeMoVwqau93VifQTUI5qJmYSpk2vYtFET8Z1NfeqnoyySLqlHG3/AeUCpNr
 msEt53u175rGOz+3feImq+PY7UGc0UZVGjYbaEUFALdpoXRXQqaAQJTX7fc5Pf7fzNd26MPkfd
 ZpIsYSUliza98l3UeYBbKGfyfQvpTLaV6f2Pwe58d6C2gLfmDnSSNAITVT6lWBLRMSyFqxIO1y
 YutuEGiGLpRIbOPxA50E4gSs69tm8Mqy5gy47YcOveXTng==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
 :Date:From:Reply-To:List-Unsubscribe;
 bh=8IimDFstunH4qRXNsjg10pPSw+FgX1OVnx8RsMzVbt0=; b=ueKtvlzYG9clzaeR4Pry3mKqP1
 MC2g7XxzvSkVj5Iz4KdT3gLv2rV2xmlcwXku2DwRL9MUYG2IJNv8mlHraYYM7+ACgfZcO8wkOwmb/
 XX28ZsgNbQNbAyr9Sisz7fMNtbcO37TlzLPd73GQZR+PiEpVADjSDozrEkwMhwv3o4rQ=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-pxq2.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vVma7-00000008poB-2ash
 for dri-devel@lists.freedesktop.org; Wed, 17 Dec 2025 08:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=8IimDFstunH4qRXNsjg10pPSw+FgX1OVnx8RsMzVbt0=; b=ja38b2lAimBZz6QfeBI2tfpipX
 q5zdlibe50cc9NgOrQ/uNb4fIuNHfT+dysLiwRuyoUfghhYFEUbASVCKswhA9UmcNBWPMpM/E1MzJ
 nF8TnJv25PkMAiu3LPurGXfE4EKT3Ej+zM0Aqg7J/zgaSU3Ep8glTBbIJCpgU/YzhV0Y=;
Received: from [79.34.194.176] (port=63558 helo=[192.168.178.175])
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vVmZz-00000000ENx-1g6t; Wed, 17 Dec 2025 08:08:15 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 17 Dec 2025 09:06:55 +0100
Subject: [PATCH v3 2/3] drm/log: avoid WARN when searching for usable
 format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-drm_draw_conv_check-v3-2-15b6f8bc1cbc@valla.it>
References: <20251217-drm_draw_conv_check-v3-0-15b6f8bc1cbc@valla.it>
In-Reply-To: <20251217-drm_draw_conv_check-v3-0-15b6f8bc1cbc@valla.it>
To: Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; i=francesco@valla.it;
 h=from:subject:message-id; bh=ve2YlrOrfqp26weodtzAkKHhv6zFIo4Ht7/fa7CIS94=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJlOKW8nG06c0PUgl7f42dKF2uYaf7S8wj+enTzZebX5q
 uDpzGX5HaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBENs9mZPh+rOj1u5Ncu5et
 /qqu63M9Uap9bYqEsseO47tqKxes2bCB4a9k1fNaWce62aujYvUKDqx02DW1rqTXLPxqyIunWk8
 yj7ICAA==
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: bd34583089fdcc5b846ed2786362888f
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vVma7-00000008poB-2ash-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-mwgq.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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

Use drm_draw_can_convert_from_xrgb8888() instead of
drm_draw_color_from_xrgb8888() while searching for a usable color
format. This avoids a WARN in case the first format is not usable.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/gpu/drm/clients/drm_log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index 4d3005273b278e8c4c0ff7a411165efb7684316e..2bd5189c967e1952f9e6ad17120b2cd920c79a96 100644
--- a/drivers/gpu/drm/clients/drm_log.c
+++ b/drivers/gpu/drm/clients/drm_log.c
@@ -182,7 +182,7 @@ static u32 drm_log_find_usable_format(struct drm_plane *plane)
 	int i;
 
 	for (i = 0; i < plane->format_count; i++)
-		if (drm_draw_color_from_xrgb8888(0xffffff, plane->format_types[i]) != 0)
+		if (drm_draw_can_convert_from_xrgb8888(plane->format_types[i]))
 			return plane->format_types[i];
 	return DRM_FORMAT_INVALID;
 }

-- 
2.52.0

