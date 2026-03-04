Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LkPMFgKqGn2nQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 11:32:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4F61FE629
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 11:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC5B10E9A1;
	Wed,  4 Mar 2026 10:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vsbjk/s+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712F910E9A1
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 10:32:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 985AE60097;
 Wed,  4 Mar 2026 10:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F72C19423;
 Wed,  4 Mar 2026 10:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772620370;
 bh=UB+4PkkGvhz2iDiXVKREEcSdY5tXHvNXoqqN/bi40Yc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vsbjk/s+JfirtXrENVkG7fZSQicqPrbhPjQgwCFwnfJh5/aPf1HNavZyKR4V2dAaF
 naYnFHs5ujiZQ55gmDZOmv4k72RhMa97vGOEUf8cgGWLu5VcYn9lQ0HQ33IO46c7Mb
 ompJB+IY5W4041Wh4YoonklxTYsJxqIYzlpTSCB7bzdhw5unDRN5tri8Hx4kPiPqFr
 vMvzwZvU6i37taVVrQ54hWn7OIlfmI0iu5VzuAXuQTGRcmYBOFNZ9YFExbos6mo+KC
 08jS9LRmgz4/nbAS5geecEf75UsAYsNec0pzngo1OfLm4fG1zxBxe5M4k1uIqFq3Be
 nWtkR/+lXZ6iA==
Date: Wed, 4 Mar 2026 10:32:45 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: daniel@riscstar.com, deller@gmx.de, dri-devel@lists.freedesktop.org,
 jingoohan1@gmail.com, lee@kernel.org, linusw@kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] backlight: sky81452-backlight: Check return value of
 devm_gpiod_get_optional() in sky81452_bl_parse_dt()
Message-ID: <aagKTbpLjTAymqiY@aspen.lan>
References: <aYB0cRwmiIb0vVnq@aspen.lan>
 <20260203021625.578678-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203021625.578678-1-nichen@iscas.ac.cn>
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
X-Rspamd-Queue-Id: 4F4F61FE629
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nichen@iscas.ac.cn,m:daniel@riscstar.com,m:deller@gmx.de,m:jingoohan1@gmail.com,m:lee@kernel.org,m:linusw@kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[danielt@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,gmx.de,lists.freedesktop.org,gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielt@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,iscas.ac.cn:email]
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 10:16:25AM +0800, Chen Ni wrote:
> The devm_gpiod_get_optional() function may return an ERR_PTR in case of
> genuine GPIO acquisition errors, not just NULL which indicates the
> legitimate absence of an optional GPIO.
>
> Add an IS_ERR() check after the call in sky81452_bl_parse_dt(). On
> error, return the error code to ensure proper failure handling rather
> than proceeding with invalid pointers.
>
> Fixes: e1915eec54a6 ("backlight: sky81452: Convert to GPIO descriptors")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
