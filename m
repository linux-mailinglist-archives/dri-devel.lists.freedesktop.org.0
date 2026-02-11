Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCYQI7FJjGmukgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 10:19:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE17122A57
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 10:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EC710E294;
	Wed, 11 Feb 2026 09:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M5UzgdeW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89ACA10E294;
 Wed, 11 Feb 2026 09:19:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A8535600CB;
 Wed, 11 Feb 2026 09:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D646CC4CEF7;
 Wed, 11 Feb 2026 09:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1770801581;
 bh=58Z4uB9Pkeol6hTI7MeGr7wp1yT5hcTC8QqAYBryOUM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M5UzgdeWozsUWlySaOYUfwVPWb5tNvgUx4Jz7Ar0o3Tf5GDnWXCe14TiuPNyX/x8e
 OyT8z5Kz9bWqmS6r4uJAlrBKfOViNTICENxGnoWxx5kJBQ+tuSsxXInCirkk20r4vO
 x3kpKmsWcKoqmAZFM0CavOjzN5HpVKZFNYNfyo14=
Date: Wed, 11 Feb 2026 10:19:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Michele Palazzi <sysdadmin@m1k.cloud>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 mario.limonciello@amd.com, Rodrigo.Siqueira@igalia.com,
 alex.hung@amd.com, aurabindo.pillai@amd.com, stable@vger.kernel.org
Subject: Re: [PATCH] drm/amd/display: add module param to disable immediate
 vblank off
Message-ID: <2026021146-mockup-pushup-5f47@gregkh>
References: <20260211074529.131290-1-sysdadmin@m1k.cloud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211074529.131290-1-sysdadmin@m1k.cloud>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 2FE17122A57
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 08:45:29AM +0100, Michele Palazzi wrote:
> Add amdgpu.no_vblank_immediate parameter to optionally disable the
> immediate vblank disable path on DCN35+ non-PSR CRTCs. When set to 1,
> a 2-frame offdelay is used instead, matching the behavior used for
> older hardware and DGPUs.

Please no more module parameters, this is not the 1990's with only one
one device in the system.  Please fix this the proper way.

Also, this isn't the correct way to submit patches to stable.

thanks,

greg k-h
