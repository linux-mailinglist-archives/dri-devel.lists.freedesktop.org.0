Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8777229E9E0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 12:02:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA706ECA9;
	Thu, 29 Oct 2020 11:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4536ECA9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 11:02:36 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 00E2A2072D;
 Thu, 29 Oct 2020 11:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603969356;
 bh=HkZvAn5MjVZOthJYyfmXpbjUnjLgxWPIT1sDs9FNYU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RoxVHBr5/s0q8Ly0B0NSmsykQw88I3WBCRzmng+S2FJgp6T/ET8/DF/+i7OxNsVE2
 Y1MafCmeaHTwcImhbeEzzjMY7nmTSmd29izdq9kWZ45Lt0Wmw3snYgz9hSlPXndgWM
 rROr5/yoKDUFWWoX71syakVRiqSghZj2/7ahci/w=
Date: Thu, 29 Oct 2020 12:03:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
Subject: Re: [PATCH 1/1] video: fbdev: fix divide error in fbcon_switch
Message-ID: <20201029110326.GC3840801@kroah.com>
References: <20201021235758.59993-1-saeed.mirzamohammadi@oracle.com>
 <ad87c5c1-061d-8a81-7b2c-43a8687a464f@suse.de>
 <3294C797-1BBB-4410-812B-4A4BB813F002@oracle.com>
 <20201027062217.GE206502@kroah.com>
 <2DA9AE6D-93D6-4142-9FC4-EEACB92B7203@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2DA9AE6D-93D6-4142-9FC4-EEACB92B7203@oracle.com>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, gustavoars@kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, akpm@linux-foundation.org,
 rppt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjcsIDIwMjAgYXQgMTA6MTI6NDlBTSAtMDcwMCwgU2FlZWQgTWlyemFtb2hh
bW1hZGkgd3JvdGU6Cj4gSGkgR3JlZywKPiAKPiBTb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbi4gSeKA
mW0gcmVxdWVzdGluZyBzdGFibGUgbWFpbnRhaW5lcnMgdG8gY2hlcnJ5LXBpY2sgdGhpcyBwYXRj
aCBpbnRvIHN0YWJsZSA1LjQgYW5kIDUuOC4KPiBjb21taXQgY2MwNzA1N2M3Yzg4ZmI4ZWZmM2Ix
OTkxMTMxZGVkMGYwYmNmYTdlMwo+IEF1dGhvcjogU2FlZWQgTWlyemFtb2hhbW1hZGkgPHNhZWVk
Lm1pcnphbW9oYW1tYWRpQG9yYWNsZS5jb20+Cj4gRGF0ZTogICBXZWQgT2N0IDIxIDE2OjU3OjU4
IDIwMjAgLTA3MDAKPiAKPiAgICAgdmlkZW86IGZiZGV2OiBmaXggZGl2aWRlIGVycm9yIGluIGZi
Y29uX3N3aXRjaAoKSSBkbyBub3Qgc2VlIHRoYXQgY29tbWl0IGluIExpbnVzJ3MgdHJlZSwgZG8g
eW91PwoKY29uZnVzZWQsCgpncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
