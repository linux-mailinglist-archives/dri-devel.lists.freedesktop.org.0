Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D779987A9B8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 15:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6512F10E404;
	Wed, 13 Mar 2024 14:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="IXWb0oeo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC6110E404
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 14:46:01 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 1A89D33F405
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 14:45:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1710341159; bh=vukmT26T8h9oKC0NjdSmYLtIyhrIzI2XWBGhN6aQ+yg=;
 h=From:Date:Subject:To:Cc:From;
 b=IXWb0oeobnw9EXCetyrkXGJARk3ZSCwJZqDNfrIjk3FtRfPSoQqyYK/fJWMGSrX9D
 BRfyA1l0744mkakKRCLupzJWqWOuZkyFdw/CZvaahC6OwpdwuYFF+PSoAFvP49q2e0
 Xn67H51SKT6P6d0HPicVFd6vhXTYqsqXIDxlbjIVrJTXq34QxdOhiMjNfjrmz3udnV
 iNjUwyYSkSzHAHREMZsUd8B3SD8wHsrwACjxWAPcBk2vxhyL6PCoyYjJD8BDUDqhg/
 0qhFLpOwtmrjct4JJ8uz0wIYiGLTiFp+VJJnRTqrTZ8D1TvQIFi0eT63BVeM3geY6+
 Dccl3KVRJzPNg==
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a45cdb790dfso696714366b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 07:45:59 -0700 (PDT)
X-Gm-Message-State: AOJu0YyILlFPKI31AzaXLtz53h7DtyjVkBHqGE2TVzCnyUzV1YgpUqUP
 0ittvcLV+SQ5dY0klXiO8liZvQ0y9NTT3mmm2mYsWEqwaPaSfvMhacLnP4caCTA0yfCdH4BIiWH
 SeeDHL/toUvWG3SQOsjoQCCwG+Is=
X-Google-Smtp-Source: AGHT+IHLvm7EY/grOWK3X7toXaQ0IvvX8I8xS74q4GjXazTAl2glZfEhS8GvgL1oGpX8YgvyPxHMDhku2+P+HheJ4ks=
X-Received: by 2002:a17:906:1d4c:b0:a46:2fd3:5d7f with SMTP id
 o12-20020a1709061d4c00b00a462fd35d7fmr5345406ejh.27.1710341158637; Wed, 13
 Mar 2024 07:45:58 -0700 (PDT)
MIME-Version: 1.0
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Wed, 13 Mar 2024 15:45:47 +0100
X-Gmail-Original-Message-ID: <CAFZQkGznMXLXOPEOujk6DoY_BJZ1=t9GTCQoxNEvT9ndNa=Kyg@mail.gmail.com>
Message-ID: <CAFZQkGznMXLXOPEOujk6DoY_BJZ1=t9GTCQoxNEvT9ndNa=Kyg@mail.gmail.com>
Subject: Handling pageflip timeouts
To: dri-devel@lists.freedesktop.org
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi all,

This was already discussed on IRC, but I think this should be on the
mailing list as well and get some more official conclusion that's
written down somewhere.

Recently I've experienced a GPU reset, which the system successfully
recovered from, but the display was still stuck - because amdgpu hit a
pageflip timeout, which causes the compositor to wait for a pageflip
event that will never come. Some other experiments I did before showed
that even if the compositor tries submitting new atomic commits after
a timeout, those commits are rejected with EBUSY, presumably because
the timed out pageflip is still considered "pending" on the kernel
side.

After restarting the compositor, everything continued to work
correctly, so this state can be recovered from. Because of that I
think it would be useful for the kernel to act on pageflip timeouts
differently. It should
- signal the pageflip's completion to userspace
- maybe have a new event for "pageflip failed" to give userspace more
correct information in the future
- allow new commits to happen afterwards

Another case discussed was when the device is completely removed.
Right now, if a pageflip is pending when that happens, userspace never
gets the event for pageflip completion, just like with the GPU reset.
KWin ignores pending pageflips on hotunplug, because the device is
removed it's not a big issue, but uAPI wise I would expect a pageflip
event to arrive for all commits that request them, no matter what -
and if that is not possible or desirable, uAPI has to be changed, for
example by introducing the mentioned "pageflip failed" event.

Looking forward to some answers,
Xaver Hugl
