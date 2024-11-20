Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327A69D431B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 21:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5F710E7AE;
	Wed, 20 Nov 2024 20:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="dW9vgHnW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vZ1hyOHD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dW9vgHnW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vZ1hyOHD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC62C10E3B6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 09:30:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B2AF0219E3;
 Wed, 20 Nov 2024 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1732095027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0MKArP0kQkMOue4b9KjMcgw0/LinHsOHLfq7ftlyArQ=;
 b=dW9vgHnWiRowoCjeAH+GenAfkuNaIINR2VTaCGwxzO4tBQZqLUt41LxaohP+Wnuv6g68eb
 QiJVd3DEVdXGoCBaltcd0YjevfpgKF0a9ZSr1JINocOjn1G4WWhHEtHkzg5kQFagYAhhjo
 GPq6J4zb4759y2HJL20gkAmqMyGNsko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1732095027;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0MKArP0kQkMOue4b9KjMcgw0/LinHsOHLfq7ftlyArQ=;
 b=vZ1hyOHD7qcRlkQWwo2GlkF7gAoxCGx1yQVBxKwohkoLdC8fajikgaZI4cbWfIteg0EogL
 X6UGuE9l/RTFtDDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1732095027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0MKArP0kQkMOue4b9KjMcgw0/LinHsOHLfq7ftlyArQ=;
 b=dW9vgHnWiRowoCjeAH+GenAfkuNaIINR2VTaCGwxzO4tBQZqLUt41LxaohP+Wnuv6g68eb
 QiJVd3DEVdXGoCBaltcd0YjevfpgKF0a9ZSr1JINocOjn1G4WWhHEtHkzg5kQFagYAhhjo
 GPq6J4zb4759y2HJL20gkAmqMyGNsko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1732095027;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0MKArP0kQkMOue4b9KjMcgw0/LinHsOHLfq7ftlyArQ=;
 b=vZ1hyOHD7qcRlkQWwo2GlkF7gAoxCGx1yQVBxKwohkoLdC8fajikgaZI4cbWfIteg0EogL
 X6UGuE9l/RTFtDDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43F7613297;
 Wed, 20 Nov 2024 09:30:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3La9DjOsPWdeUgAAD6G6ig
 (envelope-from <pperego@suse.de>); Wed, 20 Nov 2024 09:30:27 +0000
From: Paolo Perego <pperego@suse.de>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dan Carpenter <dan.carpenter@linaro.org>, Lee Jones <lee@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Paolo Perego <pperego@suse.de>,
 Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH 0/1] Removed hard-coded string by using the str_true_false()
 helper
Date: Wed, 20 Nov 2024 10:30:19 +0100
Message-ID: <20241120093020.6409-1-pperego@suse.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.98%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[linuxfoundation.org,suse.de,linaro.org,kernel.org,intel.com,gmail.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCPT_COUNT_SEVEN(0.00)[11];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
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

Hi everyone, this is my very first trivial contribution to the Linux kernel and
I started from a very basic task. 

As the subject suggests I removed hard-coded string by using str_true_false()
helper.

Paolo Perego (1):
  Remove hard-coded strings by using the helper functions
    str_true_false()

 drivers/staging/fbtft/fb_ssd1351.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.47.0

