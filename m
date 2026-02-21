Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGR9GWFFmWnNSQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 06:40:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E46B316C30B
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 06:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AADB10E11A;
	Sat, 21 Feb 2026 05:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tdxOaqA7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8908310E11A;
 Sat, 21 Feb 2026 05:40:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 87D3060053;
 Sat, 21 Feb 2026 05:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D786BC4CEF7;
 Sat, 21 Feb 2026 05:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1771652442;
 bh=yOuEy796pXyfQoMRhGRH3+U0w9gjXCoTSxgNEHmKwx0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tdxOaqA7xAvsa68vFbmWTZzdT1PqVPfZcmPdG8nFL06W4R9BbMSFEC9jI5ptsrJ3K
 MiFJaK71UlGEjTvLEfaENhKk2MCNAcLs+PC0TzRSB9uVuy2401VpJfFRFLabi4UOPX
 9hKCfuy8RHvyfVnfpwZ61JBPjUWONM8YlxepcSbg=
Date: Sat, 21 Feb 2026 06:40:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: stable@vger.kernel.org, Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 "open list:AMD POWERPLAY AND SWSMU" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] Revert "drm/amd/pm: Disable MCLK switching on SI at
 high pixel clocks"
Message-ID: <2026022132-gem-stylishly-2c49@gregkh>
References: <20260221034402.69537-1-rosenp@gmail.com>
 <20260221034402.69537-2-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260221034402.69537-2-rosenp@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E46B316C30B
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 07:44:01PM -0800, Rosen Penev wrote:
> This reverts commit d033e8cf4e8f6395102cdbc3cb00dc7cb9542f53.

Why?  You need to explain why you do something, not just what you are
doing.

And this is a 6.12.59 commit, explain, in detail why you aren't wanting
it reverted anywhere else INCLUDING upstream.

thanks,

greg k-h
