Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDUFO2VinWksPQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95582183C95
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C736010E4F9;
	Tue, 24 Feb 2026 08:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=hughsie.com header.i=@hughsie.com header.b="FZiyg9V6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch
 [109.224.244.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABD810E2F0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 10:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hughsie.com;
 s=protonmail; t=1771842968; x=1772102168;
 bh=wlPxbYQ09raR8c9f9yh3OyWNVoqzxtgCNjZCxQ9kzho=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=FZiyg9V6pOhoOzknoWg+nRjGNaKV8Cqos2UiFhGwVYieb1p7RWezat3P79dQliFyA
 2USclfi3LyifUt503vKbpjRmqqvwywB1j7k5bgzy+9o91Cd9PfzexGw2H61TgQh1/r
 etdIzHriECJVixV/H1bH+kDO1aJ1RjxxxkGGXwIteywV/gYfJsT/Iiok+R4UqxfXp7
 Sg631jPXtkNB2qFRl3HkUkPt4QTGKPFkkPBNzEWGbe5KxpTPzYTKI+94g9uVpfRtl+
 EZ9iACbBV5XdGgd7xyUvZVnIs1vwsK+Pdmn0ekNgotFXISkf/PEIuotChPDWbO4Ypw
 /M8QtslRe31ew==
Date: Mon, 23 Feb 2026 10:36:04 +0000
To: Dave Airlie <airlied@gmail.com>
From: Richard Hughes <richard@hughsie.com>
Cc: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Richard Hughes <hughsient@gmail.com>
Subject: Re: power saving, dpcd access and fwupd/userspace expectations
Message-ID: <V7Oft5ogN7avgue7E2hBbe-LFTwSat4fxeq2JDFZZ2WVrY-RhI7ppGW679951_y6m35aiOhwticn9RJWQSpN0Pyl4WaAwm7s25Ce2d86nUo=@hughsie.com>
In-Reply-To: <CAPM=9twLVo3reNhokXdUH7j7rSWe=JspaF4=Up9ziVMo1kC4uQ@mail.gmail.com>
References: <CAPM=9twkqUu=CJ6+AotavnDga5F=2SGRcjLeZNRy1soFbrO6cA@mail.gmail.com>
 <aZv1XP3vkXQrdFxs@intel.com>
 <CAPM=9twLVo3reNhokXdUH7j7rSWe=JspaF4=Up9ziVMo1kC4uQ@mail.gmail.com>
Feedback-ID: 110239754:user:proton
X-Pm-Message-ID: 74c00448a7ae83fd7304e002cfbce83e2bd5dc8d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 24 Feb 2026 08:33:17 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[hughsie.com,quarantine];
	R_DKIM_ALLOW(-0.20)[hughsie.com:s=protonmail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:ville.syrjala@linux.intel.com,m:hughsient@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[richard@hughsie.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,lists.freedesktop.org,gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[richard@hughsie.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[hughsie.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 95582183C95
X-Rspamd-Action: no action

On Monday, 23 February 2026 at 07:35, Dave Airlie <airlied@gmail.com> wrote=
:
> In that case we should probably hook the dpcd device into runtime
> power and have it make sure that the parent is awake, so if someone
> opens the dpcd device and keeps it open, we keep the power on?

I think that's sensible. I'm also not against fwupd also poking the hardwar=
e before and after the update, e.g. like a powersave "inhibit" that gets en=
abled and disabled.

> > I've also occasionally wondered what happens to the thing whose
> > firmware is being updated if other AUX transfers are happening at
> > the same time...
> That is a good question also.

Ideally, I'd like vendors to use the USB interface to update dock hardware =
-- it's much safer as you said. At the moment the problem is "solved" by lo=
ts of retries. :/

Richard
