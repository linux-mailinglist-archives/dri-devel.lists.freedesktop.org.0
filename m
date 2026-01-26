Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ+iHbsld2kUcwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:28:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DB285714
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B10310E3A5;
	Mon, 26 Jan 2026 08:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FYE1engo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562B110E3A5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 08:28:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 83434600CB;
 Mon, 26 Jan 2026 08:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35BFFC19421;
 Mon, 26 Jan 2026 08:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769416119;
 bh=lPRuxd5l/tcrhp290qRLo8Aqicby8MjyhGpoV7lymug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FYE1engodk8o0/IepcOpxN5MMOOgVDG8s6T7dTmwt7zwkg0/YvWl5gmb3XNEs1sK0
 4m3JfcVBwP5vHwXFIF1oe/IUSeybWv8RkkufA9kh90PHft01AnTBRgu2P/WAydjWmM
 Eg8UH27geLWia2kl/Js9Vo1wyL/nYo82xYqDp6r0ogdM4tsSHZ501I6oI1xo5s5qBA
 56+AE3CaWx2bg3D2wQG7DKjIoXR2P6KJ1UAjHFDDLOuBAzuBVEWXarCZNRaekO+2A+
 4A3V24qb0x/JA61FFbdVnRsC71LePVQp2LHg3W/16ko0w/gIvMD3ao5Hy36siibsxv
 YVu8zDidqGOdQ==
Date: Mon, 26 Jan 2026 08:28:35 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
 samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 02/12] firmware: google: framebuffer: Do not mark
 framebuffer as busy
Message-ID: <aXcls56wL0BR8B1i@google.com>
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082128.12460-3-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:briannorris@chromium.org,m:jwerner@chromium.org,m:javierm@redhat.com,m:samuel@sholland.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:chrome-platform@lists.linux.dev,m:gregkh@linuxfoundation.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tzungbi@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[chromium.org,redhat.com,sholland.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.linux.dev,lists.freedesktop.org,linuxfoundation.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:email]
X-Rspamd-Queue-Id: 31DB285714
X-Rspamd-Action: no action

On Thu, Jan 15, 2026 at 08:57:12AM +0100, Thomas Zimmermann wrote:
> Remove the flag IORESOURCE_BUSY flag from coreboot's framebuffer
> resource. It prevents simpledrm from successfully requesting the
> range for its own use; resulting in errors such as
> 
> [    2.775430] simple-framebuffer simple-framebuffer.0: [drm] could not acquire memory region [mem 0x80000000-0x80407fff flags 0x80000200]
> 
> As with other uses of simple-framebuffer, the simple-framebuffer
> device should only declare it's I/O resources, but not actively use
> them.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 851b4c14532d ("firmware: coreboot: Add coreboot framebuffer driver")

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
