Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLzOKhegiGnSsgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 15:39:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 198B5108F12
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 15:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89EAE10E0F8;
	Sun,  8 Feb 2026 14:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J/ld5uUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7D910E0F8;
 Sun,  8 Feb 2026 14:39:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 76E3A40C52;
 Sun,  8 Feb 2026 14:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BEDCC16AAE;
 Sun,  8 Feb 2026 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770561553;
 bh=sCpUXs5hqD3raoioXWKHEBjb7sLilVcwMRdGPJfsY2A=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=J/ld5uUNQfm/u6yC2Dlf8bitG+VKwLy0TaPFdNBlH6gqHYu8cXwK94vxeGKPbkMt9
 /V2v0ctUgU/Bz+0cMDa2WfFvbVmWzbKUq2O7Q1seFGWXLMaEiPmxsB0WvM4Xi7evaK
 9DhfHWQiLORlechHZh0C4waw6iPnNmTo5CPXPd28tYojyyNaKxP72ErWYIRnRpivI4
 Z3GAoE3kZaQzvQmtrsVlZrifjjhzeTaJE7dpLopk1J/2MaVpJlr+idf7cc7hGbnx0Z
 US4pbBRhKH3ztEoyps9XvdKTRDNn1A+gbQNbRnDXd+57wSYC5DMqyWJj51SvutEYHF
 y5I9od25bhISA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Feb 2026 15:39:09 +0100
Message-Id: <DG9NOQTTH02S.1X58PX3EZ06MU@kernel.org>
Subject: Re: [PATCH v1 1/1] drm/nouveau/gsp: simplify code with
 acpi_get_local_u64_address()
Cc: "Dave Airlie" <airlied@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Lyude
 Paul" <lyude@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260120152049.1763055-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260120152049.1763055-1-andriy.shevchenko@linux.intel.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[redhat.com,lists.freedesktop.org,vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 198B5108F12
X-Rspamd-Action: no action

On Tue Jan 20, 2026 at 4:20 PM CET, Andy Shevchenko wrote:
> Now we have a helper so there's no need to open-code.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to drm-misc-next, thanks!
