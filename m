Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CD083AE57
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 17:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DE510F71B;
	Wed, 24 Jan 2024 16:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B43C10F723
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 16:27:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BE6B01F7FB;
 Wed, 24 Jan 2024 16:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1706113619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=symhIeQH+xFWWu7ZkOKh67eF07PcSm6nFW937Q3F2fE=;
 b=lQ9tgBBWiCAYqZ9mf1n59omqAWxrXnqo/eL8Hw7Xya/3iKO6iKDWcOMoGSCGkoy6hGlWjE
 EWDSIEU8zsiL9ZQ6GOeTuLVJp96KhHPG5dsNk8KMPvlt3HZJQ8BY8wMhZ6rxSQnjuBNsYB
 Vl9cUcdmX0Uz9K8djynrRG7lp9SgYrQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1706113619;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=symhIeQH+xFWWu7ZkOKh67eF07PcSm6nFW937Q3F2fE=;
 b=oE8dTMc/hcssgtim+YYGpNPM7dkYgeDUHTeGwm6Iqi1wBQvReA/gdltDK5A8IIfSovxVRp
 QfA9m/vVVlUCXqBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1706113619; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=symhIeQH+xFWWu7ZkOKh67eF07PcSm6nFW937Q3F2fE=;
 b=lQ9tgBBWiCAYqZ9mf1n59omqAWxrXnqo/eL8Hw7Xya/3iKO6iKDWcOMoGSCGkoy6hGlWjE
 EWDSIEU8zsiL9ZQ6GOeTuLVJp96KhHPG5dsNk8KMPvlt3HZJQ8BY8wMhZ6rxSQnjuBNsYB
 Vl9cUcdmX0Uz9K8djynrRG7lp9SgYrQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1706113619;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=symhIeQH+xFWWu7ZkOKh67eF07PcSm6nFW937Q3F2fE=;
 b=oE8dTMc/hcssgtim+YYGpNPM7dkYgeDUHTeGwm6Iqi1wBQvReA/gdltDK5A8IIfSovxVRp
 QfA9m/vVVlUCXqBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A48911333E;
 Wed, 24 Jan 2024 16:26:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UYzJJ1M6sWVnIwAAD6G6ig
 (envelope-from <vbabka@suse.cz>); Wed, 24 Jan 2024 16:26:59 +0000
Message-ID: <c2995f42-7b35-4d3f-8882-433354b2513a@suse.cz>
Date: Wed, 24 Jan 2024 17:26:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Revert "drm/sched: Split free_job into own work item"
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
References: <20240123021155.2775-1-mario.limonciello@amd.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20240123021155.2775-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-0.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BAYES_HAM(-0.00)[27.73%]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 TO_DN_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[11];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,intel.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,lists.freedesktop.org,vger.kernel.org];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.09
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 "open list:DRM GPU SCHEDULER" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/23/24 03:11, Mario Limonciello wrote:
> commit f7fe64ad0f22 ("drm/sched: Split free_job into own work item")
> causes graphics hangs at GDM or right after logging in on a
> Framework 13 AMD laptop (containing a Phoenix APU).
> 
> This reverts commit f7fe64ad0f22ff034f8ebcfbd7299ee9cc9b57d7.
> 
> Fixes: f7fe64ad0f22 ("drm/sched: Split free_job into own work item")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> This is a regression introduced in 6.8-rc1, bisected from 6.7.
> This revert done on top of 6.8-rc1 fixes the issue.

Applying this revert on 6.8-rc1 fixed my issues reported here:
https://lore.kernel.org/all/2faccc1a-7fdd-499b-aa0a-bd54f4068f3e@suse.cz/

Let me know if there's another fix instead of revert so I can test.

Thanks,
Vlastimil

> 
> I'm happy to gather any data to use to properly debug if that is
> preferable to a revert.
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 133 +++++++++----------------
>  include/drm/gpu_scheduler.h            |   4 +-
>  2 files changed, 48 insertions(+), 89 deletions(-)
> 

