Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F619CDBAD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 10:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054A010E177;
	Fri, 15 Nov 2024 09:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="hZAiRDrC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NusAPZow";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hZAiRDrC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NusAPZow";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D82810E177
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 09:34:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 15F1B211A6;
 Fri, 15 Nov 2024 09:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731663279; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6vBXymfUvdV+JhEPWNkB3RwiHp+KuigLld+r1PsDibA=;
 b=hZAiRDrCiasrKaQ969dSJgMS9GZFjzRIePGJKnyo0NaDgINgIwjyCtv/d82eMw2ZreUMUW
 mAFFf6K9OlPk1kwVZ8ZDlMS1UCMbxFOaSQmJlRMxfz1WnF1NLVTY3118qGcQhNp2dmeLWB
 OkY2Khvy72fLADe0NlJyMdlf1SYRUAE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731663279;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6vBXymfUvdV+JhEPWNkB3RwiHp+KuigLld+r1PsDibA=;
 b=NusAPZow1oxjSHSNvgjPhQ+pSeUV8NJ/VPjYgcJ+qstNr7VzYotE/i85PmoAVtu/QbTWLJ
 IpH6hvoHG2atysDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731663279; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6vBXymfUvdV+JhEPWNkB3RwiHp+KuigLld+r1PsDibA=;
 b=hZAiRDrCiasrKaQ969dSJgMS9GZFjzRIePGJKnyo0NaDgINgIwjyCtv/d82eMw2ZreUMUW
 mAFFf6K9OlPk1kwVZ8ZDlMS1UCMbxFOaSQmJlRMxfz1WnF1NLVTY3118qGcQhNp2dmeLWB
 OkY2Khvy72fLADe0NlJyMdlf1SYRUAE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731663279;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6vBXymfUvdV+JhEPWNkB3RwiHp+KuigLld+r1PsDibA=;
 b=NusAPZow1oxjSHSNvgjPhQ+pSeUV8NJ/VPjYgcJ+qstNr7VzYotE/i85PmoAVtu/QbTWLJ
 IpH6hvoHG2atysDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D50C0134B8;
 Fri, 15 Nov 2024 09:34:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UW2PMq4VN2e8RQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 15 Nov 2024 09:34:38 +0000
Message-ID: <16428288-df10-4453-b846-d4b28c42e646@suse.de>
Date: Fri, 15 Nov 2024 10:34:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm: Move client code into subdirectories
To: Jocelyn Falempe <jfalempe@redhat.com>, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20241108154600.126162-1-tzimmermann@suse.de>
 <257ca617-2ce4-45da-be67-a4423953214d@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <257ca617-2ce4-45da-be67-a4423953214d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[redhat.com,kernel.org,linux.intel.com,gmail.com,ffwll.ch];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -4.30
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

Hi


Am 08.11.24 um 17:43 schrieb Jocelyn Falempe:
> On 08/11/2024 16:42, Thomas Zimmermann wrote:
>> The drm_log client will likely be merged into DRM soon. Time to clean
>> up some of the existing files. This series moves the existing DRM
>> client for fbdev emulation and its build infrastructure into clients/
>> subdirectories. Drm_log can then be located there as well.
>>
>> The core and helper support for in-kernel DRM clients remains in
>> its current location.
>
> Thanks for this patch, it's cleaner this way.
> I've rebased drm_log on top of it, and it works.
> I've also merged the content of drm_log.h into drm_client_internal.h
> I will send the updated series when this one is merged.

Thanks again for reviewing. I almost forgot, but the series is now in 
drm-misc-next.

Best regards
Thomas

>
> Best regards,
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

