Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOjkBlcIgmmCOQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 15:38:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5493DDAB00
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 15:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F35910E30A;
	Tue,  3 Feb 2026 14:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IQfEhumb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860E610E30A;
 Tue,  3 Feb 2026 14:38:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5425260132;
 Tue,  3 Feb 2026 14:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FF7C116D0;
 Tue,  3 Feb 2026 14:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1770129489;
 bh=WReFpPHX/vOfyDdWwl+g6030jPg0rzk3MFrbuFVJL+s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IQfEhumb/ciC1MHWGF+rAc1S2omrVYW18Z/irQOhTrpBbTDSFmYWZnMXijVTH8fQZ
 NxjEGhodBbtAAEgIHNZ/gdh3tMp2qGW4ydV5WG4M9EVBs0OP6JMCjkVflmQdXaqFkz
 fl8DOOty7IFV7xgiqHkETccXNawdkLUtMUC+uVak=
Date: Tue, 3 Feb 2026 15:38:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@sysophe.eu>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>, stable@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: NV04, 6.18.8 crashes on NULL pointer dereference
Message-ID: <2026020353-running-unhelpful-fbd2@gregkh>
References: <20260201185705.0c5364f1@hemera.lan.sysophe.eu>
 <20260201231451.1ef0128c@hemera.lan.sysophe.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260201231451.1ef0128c@hemera.lan.sysophe.eu>
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
X-Spamd-Result: default: False [3.19 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linuxfoundation.org:email,linuxfoundation.org:dkim,msgid.link:url]
X-Rspamd-Queue-Id: 5493DDAB00
X-Rspamd-Action: no action

On Sun, Feb 01, 2026 at 11:14:51PM +0100, Bruno Prémont wrote:
> Bisect completed.
> 
> The offending patch is:
> commit 448a2071a843831fe5fa71545cbfa7e15ee8966d (HEAD)
> Author: Lyude Paul <lyude@redhat.com>
> Date:   Wed Jan 21 14:13:10 2026 -0500
> 
>     drm/nouveau/disp: Set drm_mode_config_funcs.atomic_(check|commit)
>     
>     commit 604826acb3f53c6648a7ee99a3914ead680ab7fb upstream.
>     
>     Apparently we never actually filled these in, despite the fact that we do
>     in fact technically support atomic modesetting.
>     
>     Since not having these filled in causes us to potentially forget to disable
>     fbdev and friends during suspend/resume, let's fix it.
>     
>     Signed-off-by: Lyude Paul <lyude@redhat.com>
>     Cc: stable@vger.kernel.org
>     Reviewed-by: Dave Airlie <airlied@redhat.com>
>     Link: https://patch.msgid.link/20260121191320.210342-1-lyude@redhat.com
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
>  drivers/gpu/drm/nouveau/nouveau_display.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> 
> It landed in 6.18.8. Seems like not all chip generations are ready for
> atomic modesetting.

Is this also a problem in 6.19-rc?

thanks,

greg k-h
