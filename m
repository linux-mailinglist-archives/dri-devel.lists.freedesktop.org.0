Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CF6206C36
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 08:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF916E45D;
	Wed, 24 Jun 2020 06:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DB66E45D;
 Wed, 24 Jun 2020 06:11:54 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D4E52078A;
 Wed, 24 Jun 2020 06:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592979114;
 bh=FM2tQ6JnRDJ6MT95go3QxanMU7ENKqsXWamZTn77iMQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oaZVXDQCV0eH6RKo4otHpf4R2vf09cY258wolUgVQ3p6bBb79Q+33ZTw8GvhYp6Bc
 GhTwpdccP4md0FWDtSREbDvMxAOHmA+hH9bsIgdsdH9iGnbcYx0iwoCi4oz6lML39H
 EadDHyxFYBLhSAA/mpDr9os2kF1OZ6ECstS3ZU4Y=
Date: Wed, 24 Jun 2020 08:11:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v2 5/8] drm/amdgpu: Refactor sysfs removal
Message-ID: <20200624061153.GA933050@kroah.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-6-git-send-email-andrey.grodzovsky@amd.com>
 <20200622095124.GE20149@phenom.ffwll.local>
 <20200622112139.GA3421602@kroah.com>
 <fdaebe5b-3930-66d6-4f62-3e59e515e3da@amd.com>
 <20200622164551.GA112181@kroah.com>
 <4787b2a9-e7bf-ea3c-02e9-484a4fcb4742@amd.com>
 <20200623060532.GB3818201@kroah.com>
 <090c5a35-3088-d6d0-dcaf-5ce5542a4298@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <090c5a35-3088-d6d0-dcaf-5ce5542a4298@amd.com>
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 23, 2020 at 11:04:30PM -0400, Andrey Grodzovsky wrote:
> 
> On 6/23/20 2:05 AM, Greg KH wrote:
> > On Tue, Jun 23, 2020 at 12:51:00AM -0400, Andrey Grodzovsky wrote:
> > > On 6/22/20 12:45 PM, Greg KH wrote:
> > > > On Mon, Jun 22, 2020 at 12:07:25PM -0400, Andrey Grodzovsky wrote:
> > > > > On 6/22/20 7:21 AM, Greg KH wrote:
> > > > > > On Mon, Jun 22, 2020 at 11:51:24AM +0200, Daniel Vetter wrote:
> > > > > > > On Sun, Jun 21, 2020 at 02:03:05AM -0400, Andrey Grodzovsky wrote:
> > > > > > > > Track sysfs files in a list so they all can be removed during pci remove
> > > > > > > > since otherwise their removal after that causes crash because parent
> > > > > > > > folder was already removed during pci remove.
> > > > > > Huh?  That should not happen, do you have a backtrace of that crash?
> > > > > 2 examples in the attached trace.
> > > > Odd, how did you trigger these?
> > > 
> > > By manually triggering PCI remove from sysfs
> > > 
> > > cd /sys/bus/pci/devices/0000\:05\:00.0 && echo 1 > remove
> > For some reason, I didn't think that video/drm devices could handle
> > hot-remove like this.  The "old" PCI hotplug specification explicitly
> > said that video devices were not supported, has that changed?
> > 
> > And this whole issue is probably tied to the larger issue that Daniel
> > was asking me about, when it came to device lifetimes and the drm layer,
> > so odds are we need to fix that up first before worrying about trying to
> > support this crazy request, right?  :)
> > 
> > > > > [  925.738225 <    0.188086>] BUG: kernel NULL pointer dereference, address: 0000000000000090
> > > > > [  925.738232 <    0.000007>] #PF: supervisor read access in kernel mode
> > > > > [  925.738236 <    0.000004>] #PF: error_code(0x0000) - not-present page
> > > > > [  925.738240 <    0.000004>] PGD 0 P4D 0
> > > > > [  925.738245 <    0.000005>] Oops: 0000 [#1] SMP PTI
> > > > > [  925.738249 <    0.000004>] CPU: 7 PID: 2547 Comm: amdgpu_test Tainted: G        W  OE     5.5.0-rc7-dev-kfd+ #50
> > > > > [  925.738256 <    0.000007>] Hardware name: System manufacturer System Product Name/RAMPAGE IV FORMULA, BIOS 4804 12/30/2013
> > > > > [  925.738266 <    0.000010>] RIP: 0010:kernfs_find_ns+0x18/0x110
> > > > > [  925.738270 <    0.000004>] Code: a6 cf ff 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 66 66 66 66 90 41 57 41 56 49 89 f6 41 55 41 54 49 89 fd 55 53 49 89 d4 <0f> b7 af 90 00 00 00 8b 05 8f ee 6b 01 48 8b 5f 68 66 83 e5 20 41
> > > > > [  925.738282 <    0.000012>] RSP: 0018:ffffad6d0118fb00 EFLAGS: 00010246
> > > > > [  925.738287 <    0.000005>] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 2098a12076864b7e
> > > > > [  925.738292 <    0.000005>] RDX: 0000000000000000 RSI: ffffffffb6606b31 RDI: 0000000000000000
> > > > > [  925.738297 <    0.000005>] RBP: ffffffffb6606b31 R08: ffffffffb5379d10 R09: 0000000000000000
> > > > > [  925.738302 <    0.000005>] R10: ffffad6d0118fb38 R11: ffff9a75f64820a8 R12: 0000000000000000
> > > > > [  925.738307 <    0.000005>] R13: 0000000000000000 R14: ffffffffb6606b31 R15: ffff9a7612b06130
> > > > > [  925.738313 <    0.000006>] FS:  00007f3eca4e8700(0000) GS:ffff9a763dbc0000(0000) knlGS:0000000000000000
> > > > > [  925.738319 <    0.000006>] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > > > [  925.738323 <    0.000004>] CR2: 0000000000000090 CR3: 0000000035e5a005 CR4: 00000000000606e0
> > > > > [  925.738329 <    0.000006>] Call Trace:
> > > > > [  925.738334 <    0.000005>]  kernfs_find_and_get_ns+0x2e/0x50
> > > > > [  925.738339 <    0.000005>]  sysfs_remove_group+0x25/0x80
> > > > > [  925.738344 <    0.000005>]  sysfs_remove_groups+0x29/0x40
> > > > > [  925.738350 <    0.000006>]  free_msi_irqs+0xf5/0x190
> > > > > [  925.738354 <    0.000004>]  pci_disable_msi+0xe9/0x120
> > > > So the PCI core is trying to clean up attributes that it had registered,
> > > > which is fine.  But we can't seem to find the attributes?  Were they
> > > > already removed somewhere else?
> > > > 
> > > > that's odd.
> > > 
> > > Yes, as i pointed above i am emulating device remove from sysfs and this
> > > triggers pci device remove sequence and as part of that my specific device
> > > folder (05:00.0) is removed from the sysfs tree.
> > But why are things being removed twice?
> 
> 
> Not sure I understand what removed twice ? I remove only once per sysfs attribute.

This code path shows that the kernel is trying to remove a file that is
not present, so someone removed it already...

thanks,

gre k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
