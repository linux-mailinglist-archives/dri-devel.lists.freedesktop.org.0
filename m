Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F09DE2C995E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADC86E55E;
	Tue,  1 Dec 2020 08:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 379 seconds by postgrey-1.36 at gabe;
 Mon, 30 Nov 2020 14:13:23 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAC56E4B3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 14:13:23 +0000 (UTC)
Received: from monopod.intra.ispras.ru (unknown [10.10.3.121])
 by mail.ispras.ru (Postfix) with ESMTPS id B671540D403D;
 Mon, 30 Nov 2020 14:07:00 +0000 (UTC)
Date: Mon, 30 Nov 2020 17:07:00 +0300 (MSK)
From: Alexander Monakov <amonakov@ispras.ru>
To: dri-devel@lists.freedesktop.org
Subject: GPU-side memory protection landscape
Message-ID: <alpine.LNX.2.20.13.2011301603550.26319@monopod.intra.ispras.ru>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On #dri-devel Daniel invited me to chime in on the topic of clearing GPU
memory handed to userspace, so here I go.

I was asking how information leak from giving userspace dirty memory
previously used by another process is not seen as a security issue.
I was pointed to a recent thread, which offers a little perspective:
https://lists.freedesktop.org/archives/dri-devel/2020-November/287144.html

I think the main argument shown there is weak:

> And for the legacy node model with authentication of clients against
> the X server, leaking that all around was ok.

seeing how there's the XCSECURITY extension that is supposed to limit
what clients can retrieve, or there could be two X servers running for
different users.


My other concern is how easy it is to cause system instability or hangs
by out-of-bounds writes from the GPU (via compute shaders or copy
commands). In my experience of several years doing GPU computing with
NVIDIA tech, I don't recall needing to lose time rebooting my PC after
running a buggy CUDA "kernel". Heck, I could run the GCC C testsuite on
the GPU without worrying about locking myself and others from the
server. But now when I develop on a laptop with AMD's latest mobile SoC,
every time I make a mistake in my GLSL code it more often than not forces
a reboot. I hope you understand what a huge pain it is.

What are the existing GPU hardware capabilities for memory protection
(both in terms of preventing random accesses to system memory like with
an IOMMU, and in terms of isolating different process contexts from each
other), and to what extend Linux DRM drivers are taking advantage of
them?

Would you consider producing a document with answers to the above so
users know what to expect?

Thank you.
Alexander
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
