Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CD5356799
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 11:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C17189F85;
	Wed,  7 Apr 2021 09:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from kirsty.vergenet.net (kirsty.vergenet.net [202.4.237.240])
 by gabe.freedesktop.org (Postfix) with ESMTP id 28A106E8D9;
 Wed,  7 Apr 2021 08:55:30 +0000 (UTC)
Received: by kirsty.vergenet.net (Postfix, from userid 1001)
 id D3F8425BE42; Wed,  7 Apr 2021 18:55:28 +1000 (AEST)
Date: Wed, 7 Apr 2021 09:55:17 +0100
From: Carsten Haitzler <raster@rasterman.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: Call for an EDID parsing library
Message-Id: <20210407095517.c25902cb0222ca36a2bcbfa8@rasterman.com>
In-Reply-To: <20210407114404.13b41822@eldfell>
References: <20210407114404.13b41822@eldfell>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
X-Pants: on
X-Cluestick: Get jiggy with it!
Mime-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Apr 2021 09:04:46 +0000
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
Cc: linux-media@vger.kernel.org, xorg-devel@lists.x.org,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 7 Apr 2021 11:44:04 +0300 Pekka Paalanen <ppaalanen@gmail.com> said:

> Hi all,
> 
> with display servers proliferating thanks to Wayland, and the Linux
> kernel exposing only a very limited set of information based on EDID
> (rightfully so!), the need to interpret EDID blobs is spreading even
> more. I would like to start the discussion about starting a project to
> develop a shared library for parsing EDID blobs. This is not the first
> time either, other people have suggested it years and years ago already,
> but apparently it didn't quite materialise as far as I know.
> 
> Right now, it seems that more or less every display server and other
> KMS application is hand-rolling its own EDID parsing code, even for the
> most trivial information (monitor make, model, and serial number). With
> HDR and color management support coming to Wayland, the need to parse
> more things out of EDID will only increase. These things are not
> exposed by the kernel, and most of these things have no use for the
> kernel either.
> 
> My personal motivation for this is that I don't want to be developing
> or reviewing yet another partial EDID parser implementation in Weston.
> 
> I recall ponderings about sharing the same EDID parsing code between
> the kernel and userspace, but I got the feeling that it would be a
> hindrance in process more than a benefit from sharing code. It would
> need to live in the kernel tree, to be managed with the kernel
> development process, use the kernel "standard libraries", and adhere to
> kernel programming style - all which are good and fine, but maybe also
> more restricting than useful in this case. Therefore I would suggest a
> userspace-only library.
> 
> Everyone hand-rolling their own parsing code has the obvious
> disadvantages. In the opposite, I would expect a new shared EDID
> parsing library and project to:
> - be hosted under gitlab.freedesktop.org
> - be MIT licensed
> - offer at least a C ABI
> - employ mandatory Gitlab CI to ensure with sample EDID blobs that it
>   cannot regress
> 
> Prior art can be found in various places. I believe Xorg xserver has
> its battle-tested EDID parsing code. Ajax once played with the idea in
> https://cgit.freedesktop.org/~ajax/libminitru/ . Then we have
> https://git.linuxtv.org/edid-decode.git too which has code and test
> data but not a C ABI (right?).
> 
> It does not necessarily need to be a new project. Would edid-decode
> project be open to adding a C library ABI?
> 
> edid-decode is already MIT licensed and seems to have a lot of code,
> too, but that's all I know for now.
> 
> Would there be anyone interested to take lead or work on a project like
> this?
> 
> Personally I don't think I'd be working on it, but I would be really
> happy to use it in Weston.
> 
> Should it be a new project, or grow inside edid-decode or something
> else?
> 
> I believe MIT license is important to have wide adoption of it. C ABI
> similarly. Also that it would be a "small" library without heavy
> dependencies.

I'd say it needs nothing more than libc - I can't see the justification for
more than that. If this is the case along with the above you have given, then I
see no reason for it to not be used by everyone other than the usual user
complaint of "too many dependencies (of a compositor)". :)

I'd definitely consider using it.

> What do you think? Could anyone spare their time for this?
> 
> Who would be interested in using it if this library appeared?
> 
> 
> Thanks,
> pq


-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
Carsten Haitzler - raster@rasterman.com

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
