Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D968204980
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 08:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899E06E93D;
	Tue, 23 Jun 2020 06:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD326E93D;
 Tue, 23 Jun 2020 06:05:38 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8204A2064B;
 Tue, 23 Jun 2020 06:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592892338;
 bh=YM37cmelNi9PFEWrjf67bskr2FP0y42ZpXHWKL8DuXE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ONxKLCpJzE1vpcZoA/h3UBpShtoDEXT7vekOYWP0QAHml3ZdEklhCEFfkvLlXT4qk
 y0fOziOXKKmH2u+Sz6XLa00YHCd7vaNS5KRewp5IA5uCAgGql/v0D0qQbvous7wCqe
 e+VwdIG9+DpmUP1t1AzBATNHJss8DYivwiq22goU=
Date: Tue, 23 Jun 2020 08:05:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v2 5/8] drm/amdgpu: Refactor sysfs removal
Message-ID: <20200623060532.GB3818201@kroah.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-6-git-send-email-andrey.grodzovsky@amd.com>
 <20200622095124.GE20149@phenom.ffwll.local>
 <20200622112139.GA3421602@kroah.com>
 <fdaebe5b-3930-66d6-4f62-3e59e515e3da@amd.com>
 <20200622164551.GA112181@kroah.com>
 <4787b2a9-e7bf-ea3c-02e9-484a4fcb4742@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4787b2a9-e7bf-ea3c-02e9-484a4fcb4742@amd.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 23, 2020 at 12:51:00AM -0400, Andrey Grodzovsky wrote:
> =

> On 6/22/20 12:45 PM, Greg KH wrote:
> > On Mon, Jun 22, 2020 at 12:07:25PM -0400, Andrey Grodzovsky wrote:
> > > On 6/22/20 7:21 AM, Greg KH wrote:
> > > > On Mon, Jun 22, 2020 at 11:51:24AM +0200, Daniel Vetter wrote:
> > > > > On Sun, Jun 21, 2020 at 02:03:05AM -0400, Andrey Grodzovsky wrote:
> > > > > > Track sysfs files in a list so they all can be removed during p=
ci remove
> > > > > > since otherwise their removal after that causes crash because p=
arent
> > > > > > folder was already removed during pci remove.
> > > > Huh?  That should not happen, do you have a backtrace of that crash?
> > > =

> > > 2 examples in the attached trace.
> > Odd, how did you trigger these?
> =

> =

> By manually triggering PCI remove from sysfs
> =

> cd /sys/bus/pci/devices/0000\:05\:00.0 && echo 1 > remove

For some reason, I didn't think that video/drm devices could handle
hot-remove like this.  The "old" PCI hotplug specification explicitly
said that video devices were not supported, has that changed?

And this whole issue is probably tied to the larger issue that Daniel
was asking me about, when it came to device lifetimes and the drm layer,
so odds are we need to fix that up first before worrying about trying to
support this crazy request, right?  :)

> > > [  925.738225 <    0.188086>] BUG: kernel NULL pointer dereference, a=
ddress: 0000000000000090
> > > [  925.738232 <    0.000007>] #PF: supervisor read access in kernel m=
ode
> > > [  925.738236 <    0.000004>] #PF: error_code(0x0000) - not-present p=
age
> > > [  925.738240 <    0.000004>] PGD 0 P4D 0
> > > [  925.738245 <    0.000005>] Oops: 0000 [#1] SMP PTI
> > > [  925.738249 <    0.000004>] CPU: 7 PID: 2547 Comm: amdgpu_test Tain=
ted: G        W  OE     5.5.0-rc7-dev-kfd+ #50
> > > [  925.738256 <    0.000007>] Hardware name: System manufacturer Syst=
em Product Name/RAMPAGE IV FORMULA, BIOS 4804 12/30/2013
> > > [  925.738266 <    0.000010>] RIP: 0010:kernfs_find_ns+0x18/0x110
> > > [  925.738270 <    0.000004>] Code: a6 cf ff 0f 1f 44 00 00 66 2e 0f =
1f 84 00 00 00 00 00 66 66 66 66 90 41 57 41 56 49 89 f6 41 55 41 54 49 89 =
fd 55 53 49 89 d4 <0f> b7 af 90 00 00 00 8b 05 8f ee 6b 01 48 8b 5f 68 66 8=
3 e5 20 41
> > > [  925.738282 <    0.000012>] RSP: 0018:ffffad6d0118fb00 EFLAGS: 0001=
0246
> > > [  925.738287 <    0.000005>] RAX: 0000000000000000 RBX: 000000000000=
0000 RCX: 2098a12076864b7e
> > > [  925.738292 <    0.000005>] RDX: 0000000000000000 RSI: ffffffffb660=
6b31 RDI: 0000000000000000
> > > [  925.738297 <    0.000005>] RBP: ffffffffb6606b31 R08: ffffffffb537=
9d10 R09: 0000000000000000
> > > [  925.738302 <    0.000005>] R10: ffffad6d0118fb38 R11: ffff9a75f648=
20a8 R12: 0000000000000000
> > > [  925.738307 <    0.000005>] R13: 0000000000000000 R14: ffffffffb660=
6b31 R15: ffff9a7612b06130
> > > [  925.738313 <    0.000006>] FS:  00007f3eca4e8700(0000) GS:ffff9a76=
3dbc0000(0000) knlGS:0000000000000000
> > > [  925.738319 <    0.000006>] CS:  0010 DS: 0000 ES: 0000 CR0: 000000=
0080050033
> > > [  925.738323 <    0.000004>] CR2: 0000000000000090 CR3: 0000000035e5=
a005 CR4: 00000000000606e0
> > > [  925.738329 <    0.000006>] Call Trace:
> > > [  925.738334 <    0.000005>]  kernfs_find_and_get_ns+0x2e/0x50
> > > [  925.738339 <    0.000005>]  sysfs_remove_group+0x25/0x80
> > > [  925.738344 <    0.000005>]  sysfs_remove_groups+0x29/0x40
> > > [  925.738350 <    0.000006>]  free_msi_irqs+0xf5/0x190
> > > [  925.738354 <    0.000004>]  pci_disable_msi+0xe9/0x120
> > So the PCI core is trying to clean up attributes that it had registered,
> > which is fine.  But we can't seem to find the attributes?  Were they
> > already removed somewhere else?
> > =

> > that's odd.
> =

> =

> Yes, as i pointed above i am emulating device remove from sysfs and this
> triggers pci device remove sequence and as part of that my specific device
> folder (05:00.0) is removed from the sysfs tree.

But why are things being removed twice?

> > > [  925.738406 <    0.000052>]  amdgpu_irq_fini+0xe3/0xf0 [amdgpu]
> > > [  925.738453 <    0.000047>]  tonga_ih_sw_fini+0xe/0x30 [amdgpu]
> > > [  925.738490 <    0.000037>]  amdgpu_device_fini_late+0x14b/0x440 [a=
mdgpu]
> > > [  925.738529 <    0.000039>]  amdgpu_driver_release_kms+0x16/0x40 [a=
mdgpu]
> > > [  925.738548 <    0.000019>]  drm_dev_put+0x5b/0x80 [drm]
> > > [  925.738558 <    0.000010>]  drm_release+0xc6/0xd0 [drm]
> > > [  925.738563 <    0.000005>]  __fput+0xc6/0x260
> > > [  925.738568 <    0.000005>]  task_work_run+0x79/0xb0
> > > [  925.738573 <    0.000005>]  do_exit+0x3d0/0xc60
> > > [  925.738578 <    0.000005>]  do_group_exit+0x47/0xb0
> > > [  925.738583 <    0.000005>]  get_signal+0x18b/0xc30
> > > [  925.738589 <    0.000006>]  do_signal+0x36/0x6a0
> > > [  925.738593 <    0.000004>]  ? force_sig_info_to_task+0xbc/0xd0
> > > [  925.738597 <    0.000004>]  ? signal_wake_up_state+0x15/0x30
> > > [  925.738603 <    0.000006>]  exit_to_usermode_loop+0x6f/0xc0
> > > [  925.738608 <    0.000005>]  prepare_exit_to_usermode+0xc7/0x110
> > > [  925.738613 <    0.000005>]  ret_from_intr+0x25/0x35
> > > [  925.738617 <    0.000004>] RIP: 0033:0x417369
> > > [  925.738621 <    0.000004>] Code: Bad RIP value.
> > > [  925.738625 <    0.000004>] RSP: 002b:00007ffdd6bf0900 EFLAGS: 0001=
0246
> > > [  925.738629 <    0.000004>] RAX: 00007f3eca509000 RBX: 000000000000=
001e RCX: 00007f3ec95ba260
> > > [  925.738634 <    0.000005>] RDX: 00007f3ec9889790 RSI: 000000000000=
000a RDI: 0000000000000000
> > > [  925.738639 <    0.000005>] RBP: 00007ffdd6bf0990 R08: 00007f3ec988=
9780 R09: 00007f3eca4e8700
> > > [  925.738645 <    0.000006>] R10: 000000000000035c R11: 000000000000=
0246 R12: 00000000021c6170
> > > [  925.738650 <    0.000005>] R13: 00007ffdd6bf0c00 R14: 000000000000=
0000 R15: 0000000000000000
> > > =

> > > =

> > > =

> > > =

> > > [   40.880899 <    0.000004>] BUG: kernel NULL pointer dereference, a=
ddress: 0000000000000090
> > > [   40.880906 <    0.000007>] #PF: supervisor read access in kernel m=
ode
> > > [   40.880910 <    0.000004>] #PF: error_code(0x0000) - not-present p=
age
> > > [   40.880915 <    0.000005>] PGD 0 P4D 0
> > > [   40.880920 <    0.000005>] Oops: 0000 [#1] SMP PTI
> > > [   40.880924 <    0.000004>] CPU: 1 PID: 2526 Comm: amdgpu_test Tain=
ted: G        W  OE     5.5.0-rc7-dev-kfd+ #50
> > > [   40.880932 <    0.000008>] Hardware name: System manufacturer Syst=
em Product Name/RAMPAGE IV FORMULA, BIOS 4804 12/30/2013
> > > [   40.880941 <    0.000009>] RIP: 0010:kernfs_find_ns+0x18/0x110
> > > [   40.880945 <    0.000004>] Code: a6 cf ff 0f 1f 44 00 00 66 2e 0f =
1f 84 00 00 00 00 00 66 66 66 66 90 41 57 41 56 49 89 f6 41 55 41 54 49 89 =
fd 55 53 49 89 d4 <0f> b7 af 90 00 00 00 8b 05 8f ee 6b 01 48 8b 5f 68 66 8=
3 e5 20 41
> > > [   40.880957 <    0.000012>] RSP: 0018:ffffaf3380467ba8 EFLAGS: 0001=
0246
> > > [   40.880963 <    0.000006>] RAX: 0000000000000000 RBX: 000000000000=
0000 RCX: 2098a12076864b7e
> > > [   40.880968 <    0.000005>] RDX: 0000000000000000 RSI: ffffffffc067=
8cfc RDI: 0000000000000000
> > > [   40.880973 <    0.000005>] RBP: ffffffffc0678cfc R08: ffffffffaa37=
9d10 R09: 0000000000000000
> > > [   40.880979 <    0.000006>] R10: ffffaf3380467be0 R11: ffff93547615=
d128 R12: 0000000000000000
> > > [   40.880984 <    0.000005>] R13: 0000000000000000 R14: ffffffffc067=
8cfc R15: ffff93549be86130
> > > [   40.880990 <    0.000006>] FS:  00007fd9ecb10700(0000) GS:ffff9354=
bd840000(0000) knlGS:0000000000000000
> > > [   40.880996 <    0.000006>] CS:  0010 DS: 0000 ES: 0000 CR0: 000000=
0080050033
> > > [   40.881001 <    0.000005>] CR2: 0000000000000090 CR3: 000000007286=
6001 CR4: 00000000000606e0
> > > [   40.881006 <    0.000005>] Call Trace:
> > > [   40.881011 <    0.000005>]  kernfs_find_and_get_ns+0x2e/0x50
> > > [   40.881016 <    0.000005>]  sysfs_remove_group+0x25/0x80
> > > [   40.881055 <    0.000039>]  amdgpu_device_fini_late+0x3eb/0x440 [a=
mdgpu]
> > > [   40.881095 <    0.000040>]  amdgpu_driver_release_kms+0x16/0x40 [a=
mdgpu]
> > Here is this is your driver doing the same thing, removing attributes it
> > created.  But again they are not there.
> > =

> > So something went through and wiped the tree clean, which if I'm reading
> > this correctly, your patch would not solve as you would try to also
> > remove attributes that were already removed, right?
> =

> =

> I don't think so, the stack here is from a later stage (after pci remove)
> where the last user process holding a reference to the device file decides
> to die and thus triggering drm_dev_release sequence after drm dev refcount
> dropped to zero. And this why my patch helps, i am expediting all amdgpu
> sysfs attributes removal to the pci remove stage when the device folder is
> still present in the sysfs hierarchy. At least this is my=A0 understandin=
g to
> why it helped. I admit i am not an expert on sysfs internals.

Ok, yeah, I think this is back to the drm lifecycle issues mentioned
above.

{sigh}, I'll get to that once I deal with the -rc1/-rc2 merge fallout,
that will take me a week or so, sorry...

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
