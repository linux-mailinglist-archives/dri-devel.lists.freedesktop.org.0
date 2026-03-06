Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mL1SB+jiqmkTYAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 15:21:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0463222867
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 15:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C0C10ED4C;
	Fri,  6 Mar 2026 14:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="irBUx9EK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1649D10ED4C
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 14:21:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 69BB26012A;
 Fri,  6 Mar 2026 14:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 208F6C2BC87;
 Fri,  6 Mar 2026 14:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772806883;
 bh=AJ4Fp34dJBBgqCFPiW2mSkY8hyI/nJchFMKNTI/zAqE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=irBUx9EKXRsw4wbrsBMW4fyjaFtlgjWLSBq8QCAeG8jMEw19b5zODEiWe3MmHX9TY
 Owy0BFYgw9fX6W11TiODk4rZDL01rYAIa3x77X+2MCDDEJBKrz6j23ovEN8i+hTago
 8CUv/MO/YM1MEWk78thWsLDoKWHwX4jSn1JMtt0H4oEzC8fJ2/GvskNbxWlsgGQCSF
 xmTjkt5Cxcn2x51fn7r+iGUTSVOznVDnG1sOYHQbjCioyEPxN02HLIrhCaQmNdfUb5
 owwZi2RuVoKyY9pWdHzTKJk4M5PyBjG7a9BhFGdZ7Ujb2+WXX+l3CoZ853b7dUTrEc
 Zi8fNVZe0ONLw==
From: Lee Jones <lee@kernel.org>
To: daniel@riscstar.com, Chen Ni <nichen@iscas.ac.cn>
Cc: danielt@kernel.org, deller@gmx.de, dri-devel@lists.freedesktop.org, 
 jingoohan1@gmail.com, lee@kernel.org, linusw@kernel.org, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260203021625.578678-1-nichen@iscas.ac.cn>
References: <20260203021625.578678-1-nichen@iscas.ac.cn>
Subject: Re: (subset) [PATCH v2] backlight: sky81452-backlight: Check
 return value of devm_gpiod_get_optional() in sky81452_bl_parse_dt()
Message-Id: <177280688082.1070847.13297561633275253446.b4-ty@kernel.org>
Date: Fri, 06 Mar 2026 14:21:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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
X-Rspamd-Queue-Id: A0463222867
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel@riscstar.com,m:nichen@iscas.ac.cn,m:danielt@kernel.org,m:deller@gmx.de,m:jingoohan1@gmail.com,m:lee@kernel.org,m:linusw@kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmx.de,lists.freedesktop.org,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lee@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue, 03 Feb 2026 10:16:25 +0800, Chen Ni wrote:
> The devm_gpiod_get_optional() function may return an ERR_PTR in case of
> genuine GPIO acquisition errors, not just NULL which indicates the
> legitimate absence of an optional GPIO.
> 
> Add an IS_ERR() check after the call in sky81452_bl_parse_dt(). On
> error, return the error code to ensure proper failure handling rather
> than proceeding with invalid pointers.
> 
> [...]

Applied, thanks!

[1/1] backlight: sky81452-backlight: Check return value of devm_gpiod_get_optional() in sky81452_bl_parse_dt()
      commit: 797cc011ae02bda26f93d25a4442d7a1a77d84df

--
Lee Jones [李琼斯]

