Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28B93B8719
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 18:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6CB6EA4D;
	Wed, 30 Jun 2021 16:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 307 seconds by postgrey-1.36 at gabe;
 Wed, 30 Jun 2021 09:31:08 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2047589DE3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 09:31:07 +0000 (UTC)
Received: from [192.168.1.155] ([95.114.41.241]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MhDN4-1lLb6718EM-00eM4y; Wed, 30 Jun 2021 11:25:57 +0200
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: understanding virtio-gpu
Message-ID: <6cd88dd5-edaa-de0b-754d-754b5cb71285@metux.net>
Date: Wed, 30 Jun 2021 11:25:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DIqkbuoqdoVneg4x9V3p4WprBgWOuK3wARDDi6Ybwz3VfJF2Mpi
 +qZ6cHYH301gVSXH+GA8ARaKW0Okaqy3tyNab7LHmft2Aje+WPbLHNwvYDju8zhonexVhwm
 NqYShJ74ajQFQvBfple0m1OC6fZAYRx6Kr/zpbQjbc5r1e9PAZT4lrkTy5Z3A9Z84fUU59Z
 fSIfmsM/17AbLOpvtSfZA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hLZJhhBvnzo=:m21Ou+7EZJKnsVgWTbvTmG
 o57o8ZrQIKUF5ks6554toAsL7UZHlApYYvUkIvCPoWKtbcCYLaB1phcVopRE2kX7CGtq5RBJ6
 usec04OgXxh6b9Sh+yIosnm6gIk3lDrEgpnPrkgFjEa3ETwcsw/DStwIj82tY3J5I2mUhpJbR
 b4i+nGrLlYP0Vcoyq/7RfYepPXgQqWkZIx3Ftvg61q+cYTUjWrz78/XwoSw/liOjoy+yClgOl
 7gNtBwr/Qpj4gGgF97lR8xvoyL3bJnaBfrfJm/j88acv3+Nf0J5nTon9CrhWIGdrMu//vXQC5
 U5w7f02QYeWjknDH9G31Qt5EeeoiV0JWilAL7TlzsIKSkAXIuhfdC0ZvSlXLH1clPvm54+qVS
 fvWXcjd8qFQFSu3tT4SZGr4G213iR0pKRd6WVugkSIXpL1JOM9tC60dog6VP0rXNGMUgnCS83
 /+M+rY9bEq1Cu/A7mNO55/F8ci8vS7hn7zjc2Y0RUIrP3IkeJxcCueY6eWhoBIi6OVMjS6xiv
 XE2UaUL0R5tAsyac+C/2D2MmMxC+RHurJPcoGBQHLn//IjLgECrgG+j0Qtcn/zBLmS1UHhf0o
 h/vWHfiWavz52taXiGSWDCHTk+ppDIX230qTbkeil0pM5zhZj6Kdnf+IIMcxGW2F+0yvxlbE/
 PWkB4efxEoMHSWhgKcNavo3cGj1pOaoiF0qTyf4ZbaB5Nzqkl9PFyzmQObGTePXMbKprivz6H
 SyRZhlt0imHf4gM7rlfRrNA057SWt7MRESIEsTndHiKYwY7KRsh0Cqk9o7sc1QJi8aIzP8ezw
 PAHFn5a0aM+EnnGaGyATvIpkjJ8MCOyR3HCOe8fRub+xqfx9BW8sVzweN9q7X1ino8gIzGI
X-Mailman-Approved-At: Wed, 30 Jun 2021 16:30:44 +0000
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

Hello folks,


I'm currently trying to understand how the virtio-gpu driver actually
works and got a few noob questions:

1. virtio_gpu_pci_quirk():

   * what is the explicit framebuffer removal about ?

     Do virtio-gpu devices support several framebuffer types (but only
     one at a time) ? How does it happen that we can have that vga
     framebuffer standing in our way in the first place ?

   * why is it necessary to rename the device with "pci:" prefix ?

     since (IMHO) virtio is an actual bus, that may even exist in HW,
     but there're also several different virtio transports (got word that
     somebody's also working on an socket-based one), it smells very
     strange to me, making it look like a pci device.

     does it only work w/ pci transport ?
     what's the background of this ?

2. features[] array:

   * virgl seems only supported on little endian, and the comment tells
     that's because virgl is sending the command stream in native endian.

   * IMHO, this approach isn't entirely correct, since here we're just
     looking whether the driver/guest side is LE, but looking at the
     host/device side. otoh, it should still work if both sides are BE.

   * shouldn't we add some endianess handshake to the protocol ?
     maybe both should announce what's their native endianess and whether
     they're capable of doing the conversion, so they can aggree on what
     to do exactly ?


I'm currently trying to find ways for using virgl in containers instead
of VMs, so the container workload doesn't need to have any gpu specific
(userland) drivers anymore. Not sure whether I'll need special kernel
support for this at all.


thx,
--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
