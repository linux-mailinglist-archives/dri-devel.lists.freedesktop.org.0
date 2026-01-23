Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JGuCyCFc2kDxAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:26:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A927705F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC9B10EB02;
	Fri, 23 Jan 2026 14:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from h5.fbrelay.privateemail.com (h5.fbrelay.privateemail.com
 [162.0.218.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAB510EB02;
 Fri, 23 Jan 2026 14:26:35 +0000 (UTC)
Received: from MTA-13-4.privateemail.com (mta-13-1.privateemail.com
 [198.54.122.107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by h5.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4dyKxM24g9z2xGP;
 Fri, 23 Jan 2026 14:26:31 +0000 (UTC)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 4dyKxJ64Jnz3hhTT;
 Fri, 23 Jan 2026 09:26:28 -0500 (EST)
Received: from hal-station.localdomain
 (bras-base-toroon4332w-grc-44-142-112-152-160.dsl.bell.ca [142.112.152.160])
 by mta-13.privateemail.com (Postfix) with ESMTPA;
 Fri, 23 Jan 2026 09:26:00 -0500 (EST)
Date: Fri, 23 Jan 2026 09:25:57 -0500
From: Hamza Mahfooz <someguy@effective-light.com>
To: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Ce Sun <cesun102@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/amdgpu: implement page_flip_timeout() support
Message-ID: <aXOE9ckM2enIgFuX@hal-station.localdomain>
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <20260123000537.2450496-2-someguy@effective-light.com>
 <10030872.eNJFYEL58v@timur-hyperion>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10030872.eNJFYEL58v@timur-hyperion>
X-Virus-Scanned: ClamAV using ClamSMTP
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
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[effective-light.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[someguy@effective-light.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.922];
	TAGGED_RCPT(0.00)[dri-devel];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,hal-station.localdomain:mid]
X-Rspamd-Queue-Id: B3A927705F
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 12:20:30PM +0100, Timur Kristóf wrote:
> MODE2 reset _is_ a full reset on APUs, it resets everything but just doesn't 
> lose the RAM contents. Also note that MODE2 reset is not supported on 
> dedicated GPUs, so this will likely trigger a full reset for those.
> 
> Can you say how you tested this? I'd be happy to test it myself too.

Unfortunately, I don't have a reliable way to reproduce timeouts.
Though, that machine usually hangs if I leave it idle overnight and
forget to turn off the display (I have DPMS disabled). So, I just let
nature run its course, I guess you can say and checked dmesg in the
morning to find that it had reset and was still usable.

