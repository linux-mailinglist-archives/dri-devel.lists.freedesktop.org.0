Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCTLDTLXqmnmXgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:31:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ECC221AC2
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD23F10ED44;
	Fri,  6 Mar 2026 13:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q6nQDCFQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156A710ED44
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 13:31:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6BFD360132
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 13:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220F2C4CEF7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 13:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772803885;
 bh=ldIMvkmPsb5Bw4Y3PSDxaM6rkFLT+r7UsDlUC8mHrgo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q6nQDCFQve5/yKGj4z0BWu93rKBZekJp55sWTjh9gw5anWBV3g+4/rLskOvyr9TiE
 SbR/538LjAht7Bt7Dn+H+DSAZcQBaaKfZ9Ltsphw07hMp+6Cdb4lUlZQ5sxJDhR0/k
 X/EIjIhMtY4hWyWRohJjMWCY73LCKdlj5ZPHLu7M8r2oOg36Phm49hIcXqDaTY+Q3s
 fKCOjvcFQNhRHESA44pA7vl6pMU9fpZubD4yXH7GsmrBJe3SE87uD7su0a3uCQLKYc
 6UKUgO7+ZM0FtLxHsCgDXNiqYsB1cEY3Zj2h2ZzGepd/u7XW1QteQSXdnX6ZgmTMGn
 2RSCVDg4azV6A==
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-7985d11da10so93729007b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 05:31:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ4+Ig4BZc24nmfnZHcoFANCkHhSWTgv0ltD7zR2Ugcnk+sePM6UHeuKCQSEAgNGNWfoei4bKl0V8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2/IWqVIYySFNL4BkqnZAqoOsN3W06+sRAC20/18gk+CgdcSAo
 WXE4qnBopZL4sZpUh5eNyLWLScO9mG0YV5PHVux/a95c0R+u0fEJ6GPqkNbYwmOPksnxXXBGWCy
 2KlAD0trKmWTPsQvaEfsZljFS5Ynw8ug=
X-Received: by 2002:a05:690c:c4f1:b0:798:138c:76de with SMTP id
 00721157ae682-798dd73c6a1mr17108837b3.41.1772803884445; Fri, 06 Mar 2026
 05:31:24 -0800 (PST)
MIME-Version: 1.0
References: <aYB0cRwmiIb0vVnq@aspen.lan>
 <20260203021625.578678-1-nichen@iscas.ac.cn>
In-Reply-To: <20260203021625.578678-1-nichen@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Mar 2026 14:31:11 +0100
X-Gmail-Original-Message-ID: <CAD++jLnPM0gp_mvNZt0aTEO3Yd-9ecCnm-yR0qUg7OVX5LJEfA@mail.gmail.com>
X-Gm-Features: AaiRm50P6IlZFW70jZS4zHq_zkTuyRRtcOfUdP7ijMjnor8sOJ1Mh3HktFjQo2c
Message-ID: <CAD++jLnPM0gp_mvNZt0aTEO3Yd-9ecCnm-yR0qUg7OVX5LJEfA@mail.gmail.com>
Subject: Re: [PATCH v2] backlight: sky81452-backlight: Check return value of
 devm_gpiod_get_optional() in sky81452_bl_parse_dt()
To: Chen Ni <nichen@iscas.ac.cn>
Cc: daniel@riscstar.com, danielt@kernel.org, deller@gmx.de, 
 dri-devel@lists.freedesktop.org, jingoohan1@gmail.com, lee@kernel.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Queue-Id: C7ECC221AC2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,kernel.org,gmx.de,lists.freedesktop.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nichen@iscas.ac.cn,m:daniel@riscstar.com,m:danielt@kernel.org,m:deller@gmx.de,m:jingoohan1@gmail.com,m:lee@kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[linusw@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 3:17=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote:

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

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
