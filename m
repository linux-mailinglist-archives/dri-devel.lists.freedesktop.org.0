Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDUbMv43nGlCBgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 12:20:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 492F317566A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 12:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9DA10E158;
	Mon, 23 Feb 2026 11:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X29kwMHh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C71410E158;
 Mon, 23 Feb 2026 11:20:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D21E9432BA;
 Mon, 23 Feb 2026 11:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1EFC116C6;
 Mon, 23 Feb 2026 11:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771845626;
 bh=2C/VCJimiVdTaBfL0HoBVbkMhA9/OE2zRznQChuRiIo=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=X29kwMHhegwowdYJcdWmMhKxeNisTXffgUKi72QPcZk2HvXxu/o1X9kbdBrlVsT3Z
 joFiZ2u2K7UcnQ5FbhihaZ9Fmn5YBTGP2Yc0OeIvrCtqqOGtRLr0KRcwONfi/XyuWM
 9aE3UeOCjl4qQZvcZTSpvorvI36rTUh2LUloqemDi1HizRxPezNhwHbqMoZ49SWuUl
 YQ68XsYYptko7pDjlJjci3XlTgz+5wvYd/wUqrcdyVCKhzF+hw9LOzEYUWUPomQxYf
 w8z0lDGifpcHfmrz+wjzUi0erDUMHOr5jnSw/FHj5Hi2rfAnF8s8VI3GU5EzGPYzu+
 fhHiQp7iqVR1w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 12:20:23 +0100
Message-Id: <DGMAUQLZGPZB.FWELZM9GYP0Z@kernel.org>
Subject: Re: [PATCH v3 1/3] gpu/buddy: fix module_init() usage
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Greg KH"
 <gregkh@linuxfoundation.org>, <dri-devel@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, "Matthew Auld" <matthew.auld@intel.com>,
 "Dave Airlie" <airlied@redhat.com>, "Peter Senna Tschudin"
 <peter.senna@linux.intel.com>, <stable@vger.kernel.org>
To: "Koen Koning" <koen.koning@linux.intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <DGJPMOESHINC.1NGNT8LLY8DKW@kernel.org>
 <1771594440.99434@nvidia.com> <2026022156-citizen-shredding-5d6d@gregkh>
 <cdc31857-c9a0-4d05-a243-780dc9819cb7@nvidia.com>
 <b45a50ce-de96-42ee-90c1-0a6cd7a78cc0@linux.intel.com>
In-Reply-To: <b45a50ce-de96-42ee-90c1-0a6cd7a78cc0@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 492F317566A
X-Rspamd-Action: no action

On Mon Feb 23, 2026 at 12:17 PM CET, Koen Koning wrote:
> Thanks that makes sense, then let's just stick to addressing the current=
=20
> regression with gpu/buddy in the drm-tip tree.

The patch should go into drm-misc-next.

> Joel, could you grab the v1 of this patchset (or the v2 with with=20
> subsys_initcall, either works) and try to get it applied to drm-tip?=20
> Since this is my first time submitting patches, I'm not really sure how=
=20
> to proceed from here, and it will probably be faster if you have a look.

I think we should land your original v1; I don't know if Joel can push to
drm-misc-next, if not please let me know, I can pick it up then.
