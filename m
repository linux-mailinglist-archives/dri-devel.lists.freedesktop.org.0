Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AE2A8415A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 13:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916A110E95D;
	Thu, 10 Apr 2025 11:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QdMNCsnF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bXuucykJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v7xvWeBc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="b6V+o1VB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54C710E956
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 11:03:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F0CA12116A;
 Thu, 10 Apr 2025 11:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744282980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2u+oHCQzjwRvMuLLhVNOXttJOctNhjKmriie/dBtlpM=;
 b=QdMNCsnFZrMf1RTvcn2yobAY2VyjsrOKC713wGX2OgRWRCPJg2AhKR+VD6XnATyfpySoFb
 4LnxBd99EkHChJeuPshnRHkowZSNQTAzSQSEsuhzZ7SagMjzhEN2WrD2E2r3y/dtqnu8N4
 PqZe+N/fc7jyfIUu2nOsJd6OYVp5ixk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744282980;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2u+oHCQzjwRvMuLLhVNOXttJOctNhjKmriie/dBtlpM=;
 b=bXuucykJA/svL3p3/AfO31KTDk0ejXtW4zUWJ7FXoNIU6R3iZKklFmOnHpDxky+fxciX12
 GKVOhB8tO9NNX1Ag==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744282979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2u+oHCQzjwRvMuLLhVNOXttJOctNhjKmriie/dBtlpM=;
 b=v7xvWeBcFVTAFcwDg0rxLTtWMVL+U0r+34lU/h9SRoV+dyEBaheQ7I2AD2H3Mf6tL/YseO
 pdzajtXvS/pVdlJevtYd7cI5jHXHZLgHU5f8J1fI0AG1uk7Gq2XaawqRcjMPkuCfDEP1od
 yXP2J1aGGFY7fo7FRLafBT/8ogUdbzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744282979;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2u+oHCQzjwRvMuLLhVNOXttJOctNhjKmriie/dBtlpM=;
 b=b6V+o1VBd/9H5zVY19x3SFpoDNK42ZF6H5NKSEzS6wwZBMeWqEPSzv/xob03xkT5GvKyrs
 Hi66BGwljsY8h8AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E29313886;
 Thu, 10 Apr 2025 11:02:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uCdBJWOl92f3OQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Apr 2025 11:02:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	patrik.r.jakobsson@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 4/9] drm/udl: The number of pixels is always positive
Date: Thu, 10 Apr 2025 12:59:01 +0200
Message-ID: <20250410105948.25463-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410105948.25463-1-tzimmermann@suse.de>
References: <20250410105948.25463-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,poorly.run,gmail.com];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_FIVE(0.00)[5];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.30
X-Spam-Flag: NO
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

Store sku_pixel_limit as type unsigned long instead of int. The
number of pixels available is always positive.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/udl/udl_drv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index 918738e549d6d..145bb95ccc480 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -51,13 +51,13 @@ struct urb_list {
 struct udl_device {
 	struct drm_device drm;
 
+	unsigned long sku_pixel_limit;
+
 	struct drm_plane primary_plane;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
 	struct drm_connector connector;
 
-	int sku_pixel_limit;
-
 	struct urb_list urbs;
 };
 
-- 
2.49.0

