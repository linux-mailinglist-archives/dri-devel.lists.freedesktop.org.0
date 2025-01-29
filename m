Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A38C5A21A39
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 10:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21D410E2C1;
	Wed, 29 Jan 2025 09:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="i5Mwxy/R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pmRhPydC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i5Mwxy/R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pmRhPydC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3386C10E2C1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 09:46:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B8E0D210F5;
 Wed, 29 Jan 2025 09:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738144014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5GnOF+VEY7TThX1eeQY6brGBNSRNv8obohwk3AJ667M=;
 b=i5Mwxy/RNBFOPwFWyefOclI67Mfl4LeClU7BnbzMU2Z49ioZnnFhEdIes2aDRWIG5Qpb0p
 rLBunYuvEC7qM4x5OkOhkaKWeK+V8WjsDgKTMLf0D51Ecutz5uFtjpJqDsgAbMqJDTQ7GK
 s83Yq9bri99hD1Q5u+s3qZtg9o5bDOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738144014;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5GnOF+VEY7TThX1eeQY6brGBNSRNv8obohwk3AJ667M=;
 b=pmRhPydCZ+RgrhzOPZu1wdQVPJGdMmu2lFLf4y8etatrnARzlhrJMUPMdZgyI5WSug4evo
 LP9tmUY05JKAOgCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738144014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5GnOF+VEY7TThX1eeQY6brGBNSRNv8obohwk3AJ667M=;
 b=i5Mwxy/RNBFOPwFWyefOclI67Mfl4LeClU7BnbzMU2Z49ioZnnFhEdIes2aDRWIG5Qpb0p
 rLBunYuvEC7qM4x5OkOhkaKWeK+V8WjsDgKTMLf0D51Ecutz5uFtjpJqDsgAbMqJDTQ7GK
 s83Yq9bri99hD1Q5u+s3qZtg9o5bDOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738144014;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5GnOF+VEY7TThX1eeQY6brGBNSRNv8obohwk3AJ667M=;
 b=pmRhPydCZ+RgrhzOPZu1wdQVPJGdMmu2lFLf4y8etatrnARzlhrJMUPMdZgyI5WSug4evo
 LP9tmUY05JKAOgCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6489C137DB;
 Wed, 29 Jan 2025 09:46:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id C9NOFw35mWf7LAAAD6G6ig
 (envelope-from <tiwai@suse.de>); Wed, 29 Jan 2025 09:46:53 +0000
Date: Wed, 29 Jan 2025 10:46:53 +0100
Message-ID: <87o6zq6jg2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,	Yaron Avizrat
 <yaron.avizrat@intel.com>,	Oded Gabbay <ogabbay@kernel.org>,	Julia Lawall
 <Julia.Lawall@inria.fr>,	Nicolas Palix <nicolas.palix@imag.fr>,	James Smart
 <james.smart@broadcom.com>,	Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,	Jaroslav Kysela
 <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>,	David Sterba <dsterba@suse.com>,	Ilya
 Dryomov <idryomov@gmail.com>,	Dongsheng Yang <dongsheng.yang@easystack.cn>,
 Jens Axboe <axboe@kernel.dk>,	Xiubo Li <xiubli@redhat.com>,	Damien Le Moal
 <dlemoal@kernel.org>,	Niklas Cassel <cassel@kernel.org>,	Carlos Maiolino
 <cem@kernel.org>,	"Darrick J. Wong" <djwong@kernel.org>,	Sebastian Reichel
 <sre@kernel.org>,	Keith Busch <kbusch@kernel.org>,	Christoph Hellwig
 <hch@lst.de>,	Sagi Grimberg <sagi@grimberg.me>,	Frank Li
 <Frank.Li@nxp.com>,	Mark Brown <broonie@kernel.org>,	Shawn Guo
 <shawnguo@kernel.org>,	Sascha Hauer <s.hauer@pengutronix.de>,	Pengutronix
 Kernel Team <kernel@pengutronix.de>,	Fabio Estevam <festevam@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,	Hans de Goede
 <hdegoede@redhat.com>,	Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,	Henrique de Moraes Holschuh
 <hmh@hmh.eng.br>,	Selvin Xavier <selvin.xavier@broadcom.com>,	Kalesh AP
 <kalesh-anakkur.purayil@broadcom.com>,	Jason Gunthorpe <jgg@ziepe.ca>,	Leon
 Romanovsky <leon@kernel.org>,	cocci@inria.fr,
 linux-kernel@vger.kernel.org,	linux-scsi@vger.kernel.org,
 dri-devel@lists.freedesktop.org,	linux-sound@vger.kernel.org,
 linux-btrfs@vger.kernel.org,	ceph-devel@vger.kernel.org,
 linux-block@vger.kernel.org,	linux-ide@vger.kernel.org,
 linux-xfs@vger.kernel.org,	linux-pm@vger.kernel.org,
 linux-nvme@lists.infradead.org,	linux-spi@vger.kernel.org,
 imx@lists.linux.dev,	linux-arm-kernel@lists.infradead.org,
 platform-driver-x86@vger.kernel.org,	ibm-acpi-devel@lists.sourceforge.net,
 linux-rdma@vger.kernel.org
Subject: Re: [PATCH 04/16] ALSA: ac97: convert timeouts to secs_to_jiffies()
In-Reply-To: <20250128-converge-secs-to-jiffies-part-two-v1-4-9a6ecf0b2308@linux.microsoft.com>
References: <20250128-converge-secs-to-jiffies-part-two-v1-0-9a6ecf0b2308@linux.microsoft.com>
 <20250128-converge-secs-to-jiffies-part-two-v1-4-9a6ecf0b2308@linux.microsoft.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[linux-foundation.org,intel.com,kernel.org,inria.fr,imag.fr,broadcom.com,HansenPartnership.com,oracle.com,perex.cz,suse.com,fb.com,toxicpanda.com,gmail.com,easystack.cn,kernel.dk,redhat.com,lst.de,grimberg.me,nxp.com,pengutronix.de,amd.com,linux.intel.com,hmh.eng.br,ziepe.ca,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,lists.sourceforge.net];
 R_RATELIMIT(0.00)[to_ip_from(RL41ih3fejwepcmbj4wj583m3u)];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_GT_50(0.00)[59];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, suse.de:mid,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -1.80
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

On Tue, 28 Jan 2025 19:21:49 +0100,
Easwar Hariharan wrote:
> 
> Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
> secs_to_jiffies().  As the value here is a multiple of 1000, use
> secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplication.
> 
> This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci with
> the following Coccinelle rules:
> 
> @depends on patch@
> expression E;
> @@
> 
> -msecs_to_jiffies
> +secs_to_jiffies
> (E
> - * \( 1000 \| MSEC_PER_SEC \)
> )
> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>

Acked-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi


> ---
>  sound/pci/ac97/ac97_codec.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
> index 6e710dce5c6068ec20c2da751b6f5372ad1df211..88ac37739b7653f69af430dd0163f5ab4ddf0d0c 100644
> --- a/sound/pci/ac97/ac97_codec.c
> +++ b/sound/pci/ac97/ac97_codec.c
> @@ -2461,8 +2461,7 @@ int snd_ac97_update_power(struct snd_ac97 *ac97, int reg, int powerup)
>  		 * (for avoiding loud click noises for many (OSS) apps
>  		 *  that open/close frequently)
>  		 */
> -		schedule_delayed_work(&ac97->power_work,
> -				      msecs_to_jiffies(power_save * 1000));
> +		schedule_delayed_work(&ac97->power_work, secs_to_jiffies(power_save));
>  	else {
>  		cancel_delayed_work(&ac97->power_work);
>  		update_power_regs(ac97);
> 
> -- 
> 2.43.0
> 
