Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 931EC314363
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 00:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B75A6EA1B;
	Mon,  8 Feb 2021 23:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB4E6EA13
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 22:38:21 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1612823899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=oYlVExh8VX0pz57F6MiWUgOYPKOwByipvE/Q5oPx108=;
 b=r/s6nsTHQ6t3RiQrvC0zXyHPJTUafSzZ8l5wSBKSD5yjYCloH1SScX73LgwR6M8abp0rMT
 cI6wDVU3Ba6EFU5Od/SuU0k2hbKuGNnRgrRsqDuFZm7SvCnME2V2hNL3aJ88MGRlMua60q
 nbQY1675P2AAypIJi+jyxP9lVxnEeJ5detWOJztsWyocVDmZNyOqFQgWnN88XoV8egCKCR
 LF731RFD40cB89r5ycA4tGg1p5OuVpP17S1SBL3bzfZNuq2S76b5E856BC2HErdFw2ygGp
 280bF9YDEpEg+B+/Pns3WZf/bQ0I7ND7CkJfpDq53nuu96xkFHgYuHz5RfzBoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1612823899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=oYlVExh8VX0pz57F6MiWUgOYPKOwByipvE/Q5oPx108=;
 b=mfCp0LBMuvAQS037Wg1z0a7lWj9nJ5aw64jFNQuZxdmpZz/SQDjUzP5m2Ar12sYFCoAT8s
 2TYnfGJlJ3JpZWBw==
To: linux-fbdev@vger.kernel.org
Subject: [PATCH 0/3] video: Remove in_interrupt() usage.
Date: Mon,  8 Feb 2021 23:38:07 +0100
Message-Id: <20210208223810.388502-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Feb 2021 23:01:06 +0000
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Folks,

in the discussion about preempt count consistency across kernel
configurations:

 https://lore.kernel.org/r/20200914204209.256266093@linutronix.de/

it was concluded that the usage of in_interrupt() and related context
checks should be removed from non-core code.

In the long run, usage of 'preemptible, in_*irq etc.' should be banned from
driver code completely.

This series targets the video subsystem. The omap patches are a repost
of [0], the amba-clcd is new after I received no feedback on my analysis
[1].

[0] https://lkml.kernel.org/r/20210127172902.145335-1-bigeasy@linutronix.de
[1] https://lkml.kernel.org/r/20210127174408.ududpwfrbg3dhyxj@linutronix.de

Sebastian


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
