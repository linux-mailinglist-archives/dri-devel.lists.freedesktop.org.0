Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B59A183BD2F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 10:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4546D10F33C;
	Thu, 25 Jan 2024 09:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADF410F33C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 09:24:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4528D22369;
 Thu, 25 Jan 2024 09:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1706174665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EbkcjcBi/PmQkSlj2pWcl6SvNBHPYJ2Vpw3KkDDWYLI=;
 b=IrtsHusb28AvG0BzQGAZMuTntHsHyENVr4lrnxCclGlSHXHno79Jd4YCaEI4PVb/vV8tCF
 KX5VFTbvl11jO9btAIRDW0fvW42n2wpnDQZ9kqykSdo0qU91A7dA6ujfVbpKeSXYHBbJ6Q
 bScJwLHT/mQ476Pd5SOsKhrCXN5NNkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1706174665;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EbkcjcBi/PmQkSlj2pWcl6SvNBHPYJ2Vpw3KkDDWYLI=;
 b=kv6yC6uV/6JpTrOkEmsUVwWi368svD6tyZx5QGJHEPO9Ino/hGD8cC4ahozznQOt2MEWv2
 NkIclPMdx9MBwPAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1706174665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EbkcjcBi/PmQkSlj2pWcl6SvNBHPYJ2Vpw3KkDDWYLI=;
 b=IrtsHusb28AvG0BzQGAZMuTntHsHyENVr4lrnxCclGlSHXHno79Jd4YCaEI4PVb/vV8tCF
 KX5VFTbvl11jO9btAIRDW0fvW42n2wpnDQZ9kqykSdo0qU91A7dA6ujfVbpKeSXYHBbJ6Q
 bScJwLHT/mQ476Pd5SOsKhrCXN5NNkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1706174665;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EbkcjcBi/PmQkSlj2pWcl6SvNBHPYJ2Vpw3KkDDWYLI=;
 b=kv6yC6uV/6JpTrOkEmsUVwWi368svD6tyZx5QGJHEPO9Ino/hGD8cC4ahozznQOt2MEWv2
 NkIclPMdx9MBwPAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1FCDE134C3;
 Thu, 25 Jan 2024 09:24:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id geUaB8kosmWtTwAAD6G6ig
 (envelope-from <vbabka@suse.cz>); Thu, 25 Jan 2024 09:24:25 +0000
Message-ID: <67f3e729-f5fc-415e-8fa0-f6df4e1336d1@suse.cz>
Date: Thu, 25 Jan 2024 10:24:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Drain all entities in DRM sched run job worker
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20240124210811.1639040-1-matthew.brost@intel.com>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20240124210811.1639040-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=IrtsHusb;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=kv6yC6uV
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.00 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.cz:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[10]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-0.00)[21.03%]; MID_RHS_MATCH_FROM(0.00)[];
 ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:email,intel.com:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,amd.com,leemhuis.info];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Score: -0.00
X-Rspamd-Queue-Id: 4528D22369
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
Cc: ltuikov89@gmail.com, Thorsten Leemhuis <regressions@leemhuis.info>,
 Mario Limonciello <mario.limonciello@amd.com>, daniel@ffwll.ch,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, airlied@gmail.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/24 22:08, Matthew Brost wrote:
> All entities must be drained in the DRM scheduler run job worker to
> avoid the following case. An entity found that is ready, no job found
> ready on entity, and run job worker goes idle with other entities + jobs
> ready. Draining all ready entities (i.e. loop over all ready entities)
> in the run job worker ensures all job that are ready will be scheduled.
> 
> Cc: Thorsten Leemhuis <regressions@leemhuis.info>
> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Closes: https://lore.kernel.org/all/CABXGCsM2VLs489CH-vF-1539-s3in37=bwuOWtoeeE+q26zE+Q@mail.gmail.com/
> Reported-and-tested-by: Mario Limonciello <mario.limonciello@amd.com>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3124
> Link: https://lore.kernel.org/all/20240123021155.2775-1-mario.limonciello@amd.com/
> Reported-by: Vlastimil Babka <vbabka@suse.cz>

Can change to Reported-and-tested-by: Vlastimil Babka <vbabka@suse.cz>

Thanks!

> Closes: https://lore.kernel.org/dri-devel/05ddb2da-b182-4791-8ef7-82179fd159a8@amd.com/T/#m0c31d4d1b9ae9995bb880974c4f1dbaddc33a48a
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 550492a7a031..85f082396d42 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1178,21 +1178,20 @@ static void drm_sched_run_job_work(struct work_struct *w)
>  	struct drm_sched_entity *entity;
>  	struct dma_fence *fence;
>  	struct drm_sched_fence *s_fence;
> -	struct drm_sched_job *sched_job;
> +	struct drm_sched_job *sched_job = NULL;
>  	int r;
>  
>  	if (READ_ONCE(sched->pause_submit))
>  		return;
>  
> -	entity = drm_sched_select_entity(sched);
> +	/* Find entity with a ready job */
> +	while (!sched_job && (entity = drm_sched_select_entity(sched))) {
> +		sched_job = drm_sched_entity_pop_job(entity);
> +		if (!sched_job)
> +			complete_all(&entity->entity_idle);
> +	}
>  	if (!entity)
> -		return;
> -
> -	sched_job = drm_sched_entity_pop_job(entity);
> -	if (!sched_job) {
> -		complete_all(&entity->entity_idle);
>  		return;	/* No more work */
> -	}
>  
>  	s_fence = sched_job->s_fence;
>  

