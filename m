Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 178392D6A6C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 23:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510406EB6F;
	Thu, 10 Dec 2020 22:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08966EB6F;
 Thu, 10 Dec 2020 22:01:12 +0000 (UTC)
Date: Thu, 10 Dec 2020 22:01:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607637670;
 bh=FmTLQjfSj2V4sIkgLBfO1ZQUi/M+NWkIe67YWDNBQuo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=A23OApJGdY2kZ3w4Qq6w+IYE9/5+sfej7hEwUoUWHx7Pi+QSrN90KmqEnQeQ27UMo
 WD6+jdepWn3l8gKv/e10t3gGzYHMk8ddmJVq7BpmmfHh9UnSVEg9TxabVoFbu4NdcG
 RssK30ZMipm/RI0N7h0mh+pz1fVLzlc5BF3RkrOmosrq2fPNV28fmmHJWjsZFbupkJ
 WXcY+6WPl6qSq2ISyMwJEGXXHTq/s8Ad1+SR12TsNoGRmuJEdIhi0xfqJcmTlcnaCZ
 O/5ENDxCwSXUal6Oauar+7j2yf3NzLIBDqcHcNEr5ZLe5rKmMT9HTEkdV4lS1cD2uD
 EGVDsRhieFAOA==
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 0/3] Experimental freesync video mode optimization
Message-ID: <MC46k2jDYAeDTZaSlv6T5iIq5ibkh2yYwW3KZ-XLXLwoRByjkWsEr6-6eQM4iZqmkiLoleyh84S290ytAub0bK-esJje1OGKIEilcz_iikY=@emersion.fr>
In-Reply-To: <20201210184823.285415-1-aurabindo.pillai@amd.com>
References: <20201210184823.285415-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: stylon.wang@amd.com, thong.thai@amd.com, shashank.sharma@amd.com,
 amd-gfx@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>, wayne.lin@amd.com,
 alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

(CC dri-devel, Pekka and Martin who might be interested in this as well.)

On Thursday, December 10th, 2020 at 7:48 PM, Aurabindo Pillai <aurabindo.pillai@amd.com> wrote:

> This patchset enables freesync video mode usecase where the userspace
> can request a freesync compatible video mode such that switching to this
> mode does not trigger blanking.
>
> This feature is guarded by a module parameter which is disabled by
> default. Enabling this paramters adds additional modes to the driver
> modelist, and also enables the optimization to skip modeset when using
> one of these modes.

Thanks for working on this, it's an interesting feature! However I'd like to
take some time to think about the user-space API for this.

As I understand it, some new synthetic modes are added, and user-space can
perform a test-only atomic *without* ALLOW_MODESET to figure out whether it can
switch to a mode without blanking the screen.

However the exact modes amdgpu adds are just some guesses. I think it would be
great if user-space could control the min/max refresh rate values directly.
Not only this would remove the need for the kernel to hard-code "well-known
video refresh rates", but this would also enable more use-cases. For instance
some users might want to mitigate flickering on their screen by reducing the
VRR range. Some users might want to lower their screen refresh rate for power
savings.

What do you think? Would you be fine with adding min/max VRR range properties?

If you're scared about the user-space code requirement, I can provide that.

Thanks,

Simon Ser
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
