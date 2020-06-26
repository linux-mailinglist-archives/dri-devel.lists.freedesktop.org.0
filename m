Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF4C20B334
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 16:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E686EBFB;
	Fri, 26 Jun 2020 14:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3364B6EBFB
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 14:06:05 +0000 (UTC)
IronPort-SDR: EL2Fdlc73GQuUEL/1nde3+oVWggSZiqaKWvOJxE9Y7Dftj7XViNjYFusn6E58xCXDAfJRTgVx7
 ALQ+HyDcQIhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="143570442"
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; d="scan'208";a="143570442"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2020 07:06:04 -0700
IronPort-SDR: a03YRrCYW3qc/CtofInwNcdVlYUn2W5j+ZlrCKhYIymrXsxMYL7AtpRIhd2ASyU0cbYu2mMpl5
 OSU0zSEf4qKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,283,1589266800"; d="scan'208";a="320011601"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 26 Jun 2020 07:06:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 26 Jun 2020 17:06:00 +0300
Date: Fri, 26 Jun 2020 17:06:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Warning triggered in drm_dp_delayed_destroy_work workqueue
Message-ID: <20200626140600.GA6112@intel.com>
References: <20200625102221.GA66817@suse.de>
 <CAKMK7uECFfCTZc2wihY4ztZ0WiKR6foUEv2ScbJ79bqt6YQELQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uECFfCTZc2wihY4ztZ0WiKR6foUEv2ScbJ79bqt6YQELQ@mail.gmail.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, Luis Henriques <lhenriques@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 03:40:20PM +0200, Daniel Vetter wrote:
> Adding Lyude, she's been revamping all the lifetime refcouting in the
> dp code last few kernel releases. At a glance I don't even have an
> idea what's going wrong here ...

Already fixed by Imre I believe.

7d11507605a7 ("drm/dp_mst: Fix the DDC I2C device unregistration of an MST =
port")

> -Daniel
> =

> On Thu, Jun 25, 2020 at 12:22 PM Luis Henriques <lhenriques@suse.de> wrot=
e:
> >
> > Hi!
> >
> > I've been seeing this warning occasionally, not sure if it has been
> > reported yet.  It's not a regression as I remember seeing it in, at lea=
st,
> > 5.7.
> >
> > Anyway, here it is:
> >
> > ------------[ cut here ]------------
> > sysfs group 'power' not found for kobject 'i2c-7'
> > WARNING: CPU: 1 PID: 17996 at fs/sysfs/group.c:279 sysfs_remove_group+0=
x74/0x80
> > Modules linked in: ccm(E) dell_rbtn(E) iwlmvm(E) mei_wdt(E) mac80211(E)=
 libarc4(E) uvcvideo(E) dell_laptop(E) videobuf2_vmalloc(E) intel_rapl_>
> >  soundcore(E) intel_soc_dts_iosf(E) rng_core(E) battery(E) acpi_pad(E) =
sparse_keymap(E) acpi_thermal_rel(E) intel_pch_thermal(E) int3402_therm>
> >  sysfillrect(E) intel_lpss(E) sysimgblt(E) fb_sys_fops(E) idma64(E) scs=
i_mod(E) virt_dma(E) mfd_core(E) drm(E) fan(E) thermal(E) i2c_hid(E) hi>
> > CPU: 1 PID: 17996 Comm: kworker/1:1 Tainted: G            E     5.8.0-r=
c2+ #36
> > Hardware name: Dell Inc. Precision 5510/0N8J4R, BIOS 1.14.2 05/25/2020
> > Workqueue: events drm_dp_delayed_destroy_work [drm_kms_helper]
> > RIP: 0010:sysfs_remove_group+0x74/0x80
> > Code: ff 5b 48 89 ef 5d 41 5c e9 79 bc ff ff 48 89 ef e8 01 b8 ff ff eb=
 cc 49 8b 14 24 48 8b 33 48 c7 c7 90 ac 8b 93 e8 de b1 d4 ff <0f> 0b 5b>
> > RSP: 0000:ffffb12d40c13c38 EFLAGS: 00010282
> > RAX: 0000000000000000 RBX: ffffffff936e6a60 RCX: 0000000000000027
> > RDX: 0000000000000027 RSI: 0000000000000086 RDI: ffff8e37de097b68
> > RBP: 0000000000000000 R08: ffff8e37de097b60 R09: ffffffff93fb4624
> > R10: 0000000000000904 R11: 000000000001002c R12: ffff8e37d3081c18
> > R13: ffff8e375f1450a8 R14: 0000000000000000 R15: ffff8e375f145410
> > FS:  0000000000000000(0000) GS:ffff8e37de080000(0000) knlGS:00000000000=
00000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 0000000000000000 CR3: 00000004ab20a001 CR4: 00000000003606e0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > Call Trace:
> >  device_del+0x97/0x3f0
> >  cdev_device_del+0x15/0x30
> >  put_i2c_dev+0x7b/0x90 [i2c_dev]
> >  i2cdev_detach_adapter+0x33/0x60 [i2c_dev]
> >  notifier_call_chain+0x47/0x70
> >  blocking_notifier_call_chain+0x3d/0x60
> >  device_del+0x8f/0x3f0
> >  device_unregister+0x16/0x60
> >  i2c_del_adapter+0x247/0x300
> >  drm_dp_port_set_pdt+0x90/0x2c0 [drm_kms_helper]
> >  drm_dp_delayed_destroy_work+0x2be/0x340 [drm_kms_helper]
> >  process_one_work+0x1ae/0x370
> >  worker_thread+0x50/0x3a0
> >  ? process_one_work+0x370/0x370
> >  kthread+0x11b/0x140
> >  ? kthread_associate_blkcg+0x90/0x90
> >  ret_from_fork+0x22/0x30
> > ---[ end trace 16486ad3c2627482 ]---
> > ------------[ cut here ]------------
> >
> > Cheers,
> > --
> > Luis
> =

> =

> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
