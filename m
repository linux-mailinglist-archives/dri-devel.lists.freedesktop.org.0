Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D89D64BAE6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 18:21:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D139310E341;
	Tue, 13 Dec 2022 17:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE90C10E33E;
 Tue, 13 Dec 2022 17:21:15 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4NWldY52tfz9sWS;
 Tue, 13 Dec 2022 18:21:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1670952065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CtChoi82BmLeoGtOFF6qiJaQkI2NfhZWBwwNmyKfz1k=;
 b=WalwCNFKF5qQHv7tI1SChxZ8AYjXKH0CocxGJ9QqAesssBef0GqHhgxUJ+GvNnvcSAaeKm
 HR1jIxXkobtEd5QLrW5SCKcaAelz4QyE6K1BhDdDqEu8cMnKDrO2rt0Rs1xczP0RpV8Wdk
 9Yj3a0iqlc/9KzjTvo7S+097Bcr8gBIIr3QjtoFmTI8vWZcPeYFrFtuxYsIADGOuOjpE6g
 1YHaEa4DsDongIecCXXSxgORXZywiZDwktLgCwPE2dkV60fLAht8bZrmcxddhRK3T8rHOL
 acBz1y/vN8pDP7AZ+uOWN/J5nJSudImkC5mpM6sFWwZaZIHYR8OMelwkwV3tVA==
Message-ID: <114c2e02-41c8-8576-f88d-1c50f41deb9e@mailbox.org>
Date: Tue, 13 Dec 2022 18:20:59 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 16/16] drm/amd/display: Don't restrict bpc to 8 bpc
Content-Language: en-CA
To: Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-17-harry.wentland@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20221212182137.374625-17-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e36e6376ea1392e1da3
X-MBO-RS-META: pm6d1n1kpih1yo7rir49w7fo6j49r3fb
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/12/22 19:21, Harry Wentland wrote:
> This will let us pass kms_hdr.bpc_switch.
> 
> I don't see any good reasons why we still need to
> limit bpc to 8 bpc and doing so is problematic when
> we enable HDR.
> 
> If I remember correctly there might have been some
> displays out there where the advertised link bandwidth
> was not large enough to drive the default timing at
> max bpc. This would leave to an atomic commit/check
> failure which should really be handled in compositors
> with some sort of fallback mechanism.
> 
> If this somehow turns out to still be an issue I
> suggest we add a module parameter to allow users to
> limit the max_bpc to a desired value.

While leaving the fallback for user space to handle makes some sense in theory, in practice most KMS display servers likely won't handle it.

Another issue is that if mode validation is based on the maximum bpc value, it may reject modes which would work with lower bpc.


What Ville (CC'd) suggested before instead (and what i915 seems to be doing already) is that the driver should do mode validation based on the *minimum* bpc, and automatically make the effective bpc lower than the maximum as needed to make the rest of the atomic state work.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

