Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEv7GCwWgmmZPAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:37:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B5BDB5C0
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 16:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC85B10E28A;
	Tue,  3 Feb 2026 15:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aRbMDmyE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0EB10E28A;
 Tue,  3 Feb 2026 15:37:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 72BC660144;
 Tue,  3 Feb 2026 15:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC35C116D0;
 Tue,  3 Feb 2026 15:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770133030;
 bh=+92HvwUv0D9Te2Lzog9lTtSDIhdyomwaTdqHn2cdgqY=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=aRbMDmyEJUJJxr/uuq9hcztqChiHwbrX2U52O2ZmrE6uR3ctLPeQ9E2wa/T9I88KK
 h6jos09N/q+B6uWsRbAOUkebuRVDIwVBEz+dxI+R9+Qz6w+Gm5xbcvjRWalh2nwNC6
 GuBaNEkzsOMTvNmsLUGL+O0oWRTmNRPSKY4Rbq0Urbbv6dqdnnL3Q8pOVdL8M1hKlv
 Tc3lvlJ55yLP4G4nl1I5FU23GGW6Gxe5dyQt25A2XGgkAY+s1HymyAMM6j1zmIeVwN
 S73w2taQiUNrdTQu3nf7y2ES+4KrH9dNWVpo0p8XQyclAfKMl1kwx0YRLZv9Tb8Yej
 LCbAK8wTUCiLg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 16:37:06 +0100
Message-Id: <DG5FSE0B706U.1VFSJLK4DOD5C@kernel.org>
Subject: Re: NV04, 6.18.8 crashes on NULL pointer dereference
Cc: =?utf-8?q?Bruno_Pr=C3=A9mont?= <bonbons@sysophe.eu>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>, "Lyude
 Paul" <lyude@redhat.com>, <stable@vger.kernel.org>, "Dave Airlie"
 <airlied@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Maxime Ripard"
 <mripard@kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260201185705.0c5364f1@hemera.lan.sysophe.eu>
 <20260201231451.1ef0128c@hemera.lan.sysophe.eu>
 <2026020353-running-unhelpful-fbd2@gregkh>
In-Reply-To: <2026020353-running-unhelpful-fbd2@gregkh>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B8B5BDB5C0
X-Rspamd-Action: no action

On Tue Feb 3, 2026 at 3:38 PM CET, Greg KH wrote:
> On Sun, Feb 01, 2026 at 11:14:51PM +0100, Bruno Pr=C3=A9mont wrote:
>> Bisect completed.
>>=20
>> The offending patch is:
>> commit 448a2071a843831fe5fa71545cbfa7e15ee8966d (HEAD)
>> Author: Lyude Paul <lyude@redhat.com>
>> Date:   Wed Jan 21 14:13:10 2026 -0500
>>=20
>>     drm/nouveau/disp: Set drm_mode_config_funcs.atomic_(check|commit)
>>    =20
>>     commit 604826acb3f53c6648a7ee99a3914ead680ab7fb upstream.
>>    =20
>>     Apparently we never actually filled these in, despite the fact that =
we do
>>     in fact technically support atomic modesetting.
>>    =20
>>     Since not having these filled in causes us to potentially forget to =
disable
>>     fbdev and friends during suspend/resume, let's fix it.
>>    =20
>>     Signed-off-by: Lyude Paul <lyude@redhat.com>
>>     Cc: stable@vger.kernel.org
>>     Reviewed-by: Dave Airlie <airlied@redhat.com>
>>     Link: https://patch.msgid.link/20260121191320.210342-1-lyude@redhat.=
com
>>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>=20
>>  drivers/gpu/drm/nouveau/nouveau_display.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>>=20
>> It landed in 6.18.8. Seems like not all chip generations are ready for
>> atomic modesetting.
>
> Is this also a problem in 6.19-rc?

I did not test it, but a different mail [1] suggests that John did reproduc=
e
this in 6.19-rc7 too.

I've already picked up a revert [2], which should be in linux-next and shou=
ld
soon be in Linus' tree as well.

[1] https://lore.kernel.org/all/87h5s34d36.fsf@jogness.linutronix.de/
[2] https://patch.msgid.link/20260130113230.2311221-1-john.ogness@linutroni=
x.de
