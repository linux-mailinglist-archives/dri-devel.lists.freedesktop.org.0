Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C6E9D431F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 21:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E184110E7B4;
	Wed, 20 Nov 2024 20:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.b="VjbPx9I4";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="j9WWvi26";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="VjbPx9I4";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="j9WWvi26";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED09210E16B;
 Wed, 20 Nov 2024 20:22:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A1519219C8;
 Wed, 20 Nov 2024 20:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1732134174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T8/tNUooQV0+xMGUbKphrSADXf1KF0K9IWmikCqItKg=;
 b=VjbPx9I4rQUrbMZ0TAh+bLsQqrxeeXdFuraltbyG/LQKi3M3QXBmaM45CU++3LC81rXhxv
 yk2LauXm4aCsX81XiksX7o3gWMwDlwEjdOnVxmxSAh/cMTPmS9CUEkY7B+HJ2Mz2xKwJr9
 pT1la16pbnJ5m+0hvQ/25HhfAobtxDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1732134174;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T8/tNUooQV0+xMGUbKphrSADXf1KF0K9IWmikCqItKg=;
 b=j9WWvi26JB0prFm5+ahPFjfsyOav3aDUKdex7oXNQ3i+7xvAXmjEGO0F3bkKKVPcIER9eZ
 uGymagMQNamyBLBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1732134174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T8/tNUooQV0+xMGUbKphrSADXf1KF0K9IWmikCqItKg=;
 b=VjbPx9I4rQUrbMZ0TAh+bLsQqrxeeXdFuraltbyG/LQKi3M3QXBmaM45CU++3LC81rXhxv
 yk2LauXm4aCsX81XiksX7o3gWMwDlwEjdOnVxmxSAh/cMTPmS9CUEkY7B+HJ2Mz2xKwJr9
 pT1la16pbnJ5m+0hvQ/25HhfAobtxDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1732134174;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T8/tNUooQV0+xMGUbKphrSADXf1KF0K9IWmikCqItKg=;
 b=j9WWvi26JB0prFm5+ahPFjfsyOav3aDUKdex7oXNQ3i+7xvAXmjEGO0F3bkKKVPcIER9eZ
 uGymagMQNamyBLBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3506F13942;
 Wed, 20 Nov 2024 20:22:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IIufCh5FPmfvFgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Wed, 20 Nov 2024 20:22:54 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-arm-msm@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>, Masahiro Yamada <masahiroy@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-kbuild@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/msm: require python3 and xml.parsers.expat module
Date: Wed, 20 Nov 2024 21:22:42 +0100
Message-ID: <20241120202242.49131-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241120202242.49131-1-pvorel@suse.cz>
References: <20241120202242.49131-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.992];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_SEVEN(0.00)[7];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO
X-Mailman-Approved-At: Wed, 20 Nov 2024 20:33:14 +0000
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

0fddd045f88e introduced python3 dependency, require it to quick early.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v1->v2:
* use HAVE_PYTHON3

 drivers/gpu/drm/msm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 90c68106b63b..03ea0c83f11e 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -11,6 +11,7 @@ config DRM_MSM
 	depends on QCOM_LLCC || QCOM_LLCC=n
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
 	depends on PM
+	depends on HAVE_PYTHON3
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-- 
2.45.2

