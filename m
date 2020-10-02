Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B77ED281332
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 14:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A376E102;
	Fri,  2 Oct 2020 12:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135B86E102
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 12:54:30 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F06F206DC;
 Fri,  2 Oct 2020 12:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601643269;
 bh=/Jvd9G9vUFWXYH5i7FKo0KxfQOgjboDZb1vy3XQqRlk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VnY1FpYHzs6Ieq/+EBAxAkkAD4q0eS2uCEMO8wYPuxZXlCeYbnXhfCdX6NHDZmy63
 n+H0AQyi6jdj/714c0StkOlwRukAxpH/axKD3SL1UULk63tlTRt/2kZPUqv+Tfd9mN
 O3fnmruZjie9EsvFmkvGtEd2FZMe9Hv2FSxB3Dvw=
Date: Fri, 2 Oct 2020 14:54:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v3 2/2] tty/sysrq: Add configurable handler to execute a
 compound action
Message-ID: <20201002125429.GA3350322@kroah.com>
References: <20200818112825.6445-1-andrzej.p@collabora.com>
 <20200818112825.6445-3-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818112825.6445-3-andrzej.p@collabora.com>
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
Cc: linux-input@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jiri Slaby <jslaby@suse.com>, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 18, 2020 at 01:28:25PM +0200, Andrzej Pietrasiewicz wrote:
> Userland might want to execute e.g. 'w' (show blocked tasks), followed
> by 's' (sync), followed by 1000 ms delay and then followed by 'c' (crash)
> upon a single magic SysRq. Or one might want to execute the famous "Raising
> Elephants Is So Utterly Boring" action. This patch adds a configurable
> handler, triggered with 'C', for this exact purpose. The user specifies the
> composition of the compound action using syntax similar to getopt, where
> each letter corresponds to an individual action and a colon followed by a
> number corresponds to a delay of that many milliseconds, e.g.:
> 
> ws:1000c
> 
> or
> 
> r:100eis:1000ub

A macro language for sysrq commands, who would have thought...

Anyway, _why_ would userland want to do something so crazy as this?
What is the use-case here?

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
