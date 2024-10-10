Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7764B997E92
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 09:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4332710E882;
	Thu, 10 Oct 2024 07:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SJpQlOv8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GMcn23w+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SJpQlOv8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GMcn23w+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1934410E882;
 Thu, 10 Oct 2024 07:48:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 974031FE33;
 Thu, 10 Oct 2024 07:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728546509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
 bh=Rxd1iND5zh3Nw2/lqpc6WFoCm/Igr0Rid0WjCc3+swI=;
 b=SJpQlOv8aWWvj+CxUdzjX/qNhcN52QZ19+Et47YmF5E04GrVUHD9uM3wT1v704jucqfh9X
 5Rm5hkkWa4X18mNw5ULZINqu1a0rUGqAcQQVgNlP5Mm3V5ZaBiUKTKuqNrp0OATT5W/lbV
 mGf9Pbg+nxU/NzkRNmyKUUGre5Cp4e0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728546509;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
 bh=Rxd1iND5zh3Nw2/lqpc6WFoCm/Igr0Rid0WjCc3+swI=;
 b=GMcn23w+PjLsL94L7UdOHSbW70wYpq0Yh2IxuJ6nTRVtJ2t/dmzE8SGfEmOBO1AMp2IwXY
 YhQpUeDR1Zb05WAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SJpQlOv8;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GMcn23w+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728546509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
 bh=Rxd1iND5zh3Nw2/lqpc6WFoCm/Igr0Rid0WjCc3+swI=;
 b=SJpQlOv8aWWvj+CxUdzjX/qNhcN52QZ19+Et47YmF5E04GrVUHD9uM3wT1v704jucqfh9X
 5Rm5hkkWa4X18mNw5ULZINqu1a0rUGqAcQQVgNlP5Mm3V5ZaBiUKTKuqNrp0OATT5W/lbV
 mGf9Pbg+nxU/NzkRNmyKUUGre5Cp4e0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728546509;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
 bh=Rxd1iND5zh3Nw2/lqpc6WFoCm/Igr0Rid0WjCc3+swI=;
 b=GMcn23w+PjLsL94L7UdOHSbW70wYpq0Yh2IxuJ6nTRVtJ2t/dmzE8SGfEmOBO1AMp2IwXY
 YhQpUeDR1Zb05WAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7FF1C13A6E;
 Thu, 10 Oct 2024 07:48:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NanMHc2GB2epYQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Oct 2024 07:48:29 +0000
Message-ID: <d3916f0c-c93c-41da-9bf0-a7398f4ec97d@suse.de>
Date: Thu, 10 Oct 2024 09:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: PSA: Please fix your drm-tip merge conflicts
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
To: dri-devel <dri-devel@lists.freedesktop.org>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 974031FE33
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[]; TO_DN_EQ_ADDR_SOME(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MID_RHS_MATCH_FROM(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 
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

Hi,

it's not the first time that a merge of drm-tip failed and no one 
bothered to resolve it. It is OK to not know how to fix failed merges. 
It is not OK to leave them broken.

So if you merge a patch into DRM branches and see something like

   dim: FAILURE: Could not merge drm-xe/drm-xe-next
   dim: See the section "Resolving Conflicts when Rebuilding drm-tip"
   dim: in the drm-tip.rst documentation for how to handle this situation.

you are expected to fix it. The docs at

https://drm.pages.freedesktop.org/maintainer-tools/committer/conflict-resolution.html

can help with that. You can also ask on #dri-devel.


Specifically, while merging a fix for bochs, I just got

drm-tip> git diff
diff --cc drivers/gpu/drm/xe/xe_guc_ct.c
index d16eb9ab49fb,c7673f56d413..000000000000
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@@ -907,7 -1028,7 +1028,11 @@@ retry_same_fence
         if (!ret) {
                 xe_gt_err(gt, "Timed out wait for G2H, fence %u, action 
%04x, done %s",
                           g2h_fence.seqno, action[0], 
str_yes_no(g2h_fence.done));
++<<<<<<< HEAD
  +              xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
++=======
+               xa_erase(&ct->fence_lookup, g2h_fence.seqno);
++>>>>>>> drm-xe/drm-xe-next
                 mutex_unlock(&ct->lock);
                 return -ETIME;
         }

which must have been there for some time now. I've picked the second option.

Best regards
Thomas


-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

