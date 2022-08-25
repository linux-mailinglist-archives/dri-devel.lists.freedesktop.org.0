Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 130CA5A15EB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 17:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B1C10E25F;
	Thu, 25 Aug 2022 15:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABBD10E25F;
 Thu, 25 Aug 2022 15:38:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ADE03B829E4;
 Thu, 25 Aug 2022 15:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94AEEC433C1;
 Thu, 25 Aug 2022 15:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661441929;
 bh=pQ8yD0W3R5iU7lkK49zIJA2LO1vTB4E7TUZySfUSS+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bmuEm7maYWepxVZ8ZhXh5YjPHa4rJr2K32C4VfQMPmzX5cj2Y0DRDEucmK3C6GZFW
 zFwRDmdnkc6nd+2y/VpRJS+jx/hRlV5NUUkJNdYMeaYF5GpDVaMYqrG5JcIwDVpesC
 CkeEpHKTn6TZn8OeaJBO7I055Ac4d+NZ0NLk2CBVc6W//ONKeN8iqiqrReV1IliLrW
 Uygw4nXa42alMPQzEPR/WHlY91uwf0CRg3s4/c+ZnNfGOauJgaNiwlqZjXNWHsi+xp
 xF2emT9sRXPwRDnRUsD6TIWqgsAATWVH6WzWUMirhz0jAF2kpQVubEqhnIpB8IcCEu
 3MPIo01b0ZIPQ==
Date: Thu, 25 Aug 2022 08:38:46 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v1] drm/i915: fix null pointer dereference
Message-ID: <YweXhnusRr5ACYYd@dev-arch.thelio-3990X>
References: <20220201153354.11971-1-lukasz.bartosik@semihalf.com>
 <YwPoCqvQ02kUl9tP@dev-arch.thelio-3990X>
 <CAK8ByeL=1EtgBRGh9hhHofgpRqB--CQgih+tAJwFv_MchDhcSw@mail.gmail.com>
 <875yigixjp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875yigixjp.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, llvm@lists.linux.dev,
 upstream@semihalf.com, keescook@chromium.org, "Sripada,
 Radhakrishna" <radhakrishna.sripada@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Anusha Srivatsa <anusha.srivatsa@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 25, 2022 at 10:37:14AM +0300, Jani Nikula wrote:
> On Tue, 23 Aug 2022, Łukasz Bartosik <lb@semihalf.com> wrote:
> >>
> >> Hi all,
> >>
> >> Apologies in advance if you see this twice. I did not see the original
> >> make it to either lore.kernel.org or the freedesktop.org archives so I
> >> figured it might have been sent into the void.
> >>
> >> On Tue, Feb 01, 2022 at 04:33:54PM +0100, Lukasz Bartosik wrote:
> >> > From: Łukasz Bartosik <lb@semihalf.com>
> >> >
> >> > Asus chromebook CX550 crashes during boot on v5.17-rc1 kernel.
> >> > The root cause is null pointer defeference of bi_next
> >> > in tgl_get_bw_info() in drivers/gpu/drm/i915/display/intel_bw.c.
> >> >
> >> > BUG: kernel NULL pointer dereference, address: 000000000000002e
> >> > PGD 0 P4D 0
> >> > Oops: 0002 [#1] PREEMPT SMP NOPTI
> >> > CPU: 0 PID: 1 Comm: swapper/0 Tainted: G     U            5.17.0-rc1
> >> > Hardware name: Google Delbin/Delbin, BIOS Google_Delbin.13672.156.3 05/14/2021
> >> > RIP: 0010:tgl_get_bw_info+0x2de/0x510
> >> > ...
> >> > [    2.554467] Call Trace:
> >> > [    2.554467]  <TASK>
> >> > [    2.554467]  intel_bw_init_hw+0x14a/0x434
> >> > [    2.554467]  ? _printk+0x59/0x73
> >> > [    2.554467]  ? _dev_err+0x77/0x91
> >> > [    2.554467]  i915_driver_hw_probe+0x329/0x33e
> >> > [    2.554467]  i915_driver_probe+0x4c8/0x638
> >> > [    2.554467]  i915_pci_probe+0xf8/0x14e
> >> > [    2.554467]  ? _raw_spin_unlock_irqrestore+0x12/0x2c
> >> > [    2.554467]  pci_device_probe+0xaa/0x142
> >> > [    2.554467]  really_probe+0x13f/0x2f4
> >> > [    2.554467]  __driver_probe_device+0x9e/0xd3
> >> > [    2.554467]  driver_probe_device+0x24/0x7c
> >> > [    2.554467]  __driver_attach+0xba/0xcf
> >> > [    2.554467]  ? driver_attach+0x1f/0x1f
> >> > [    2.554467]  bus_for_each_dev+0x8c/0xc0
> >> > [    2.554467]  bus_add_driver+0x11b/0x1f7
> >> > [    2.554467]  driver_register+0x60/0xea
> >> > [    2.554467]  ? mipi_dsi_bus_init+0x16/0x16
> >> > [    2.554467]  i915_init+0x2c/0xb9
> >> > [    2.554467]  ? mipi_dsi_bus_init+0x16/0x16
> >> > [    2.554467]  do_one_initcall+0x12e/0x2b3
> >> > [    2.554467]  do_initcall_level+0xd6/0xf3
> >> > [    2.554467]  do_initcalls+0x4e/0x79
> >> > [    2.554467]  kernel_init_freeable+0xed/0x14d
> >> > [    2.554467]  ? rest_init+0xc1/0xc1
> >> > [    2.554467]  kernel_init+0x1a/0x120
> >> > [    2.554467]  ret_from_fork+0x1f/0x30
> >> > [    2.554467]  </TASK>
> >> > ...
> >> > Kernel panic - not syncing: Fatal exception
> >> >
> >> > Fixes: c64a9a7c05be ("drm/i915: Update memory bandwidth formulae")
> >> > Signed-off-by: Łukasz Bartosik <lb@semihalf.com>
> >> > ---
> >> >  drivers/gpu/drm/i915/display/intel_bw.c | 16 +++++++++-------
> >> >  1 file changed, 9 insertions(+), 7 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
> >> > index 2da4aacc956b..bd0ed68b7faa 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_bw.c
> >> > +++ b/drivers/gpu/drm/i915/display/intel_bw.c
> >> > @@ -404,15 +404,17 @@ static int tgl_get_bw_info(struct drm_i915_private *dev_priv, const struct intel
> >> >               int clpchgroup;
> >> >               int j;
> >> >
> >> > -             if (i < num_groups - 1)
> >> > -                     bi_next = &dev_priv->max_bw[i + 1];
> >> > -
> >> >               clpchgroup = (sa->deburst * qi.deinterleave / num_channels) << i;
> >> >
> >> > -             if (i < num_groups - 1 && clpchgroup < clperchgroup)
> >> > -                     bi_next->num_planes = (ipqdepth - clpchgroup) / clpchgroup + 1;
> >> > -             else
> >> > -                     bi_next->num_planes = 0;
> >> > +             if (i < num_groups - 1) {
> >> > +                     bi_next = &dev_priv->max_bw[i + 1];
> >> > +
> >> > +                     if (clpchgroup < clperchgroup)
> >> > +                             bi_next->num_planes = (ipqdepth - clpchgroup) /
> >> > +                                                    clpchgroup + 1;
> >> > +                     else
> >> > +                             bi_next->num_planes = 0;
> >> > +             }
> >> >
> >> >               bi->num_qgv_points = qi.num_points;
> >> >               bi->num_psf_gv_points = qi.num_psf_points;
> >> > --
> >> > 2.35.0.rc2.247.g8bbb082509-goog
> >> >
> >> >
> >>
> >> Was this patch ever applied or was the issue fixed in a different way?
> >> If CONFIG_INIT_STACK_ALL_ZERO is enabled (it is on by default when the
> >> compiler supports it), bi_next will be deterministically initialized to
> >> NULL, which means 'bi_next->num_planes = 0' will crash when the first if
> >> statement is not taken (i.e. 'i > num_groups - 1'). This was reported to
> >> us at [1] so it impacts real users (and I have been applying this change
> >> locally for six months). I see some discussion in this thread, was it
> >> ever resolved?
> >>
> >> [1]: https://github.com/ClangBuiltLinux/linux/issues/1626
> >>
> >> Cheers,
> >> Nathan
> >
> > The patch was not accepted by upstream. I gave up after sending two reminders
> > that the issue is still present which resulted in no upstream reaction.
> > I have been also applying that patch locally for a few months.
> > Thanks for bringing it up to upstream attention again.
> 
> Apologies for us dropping the ball here. There were objections to the
> code from Ville [1] but nobody stepped up to clean it up. I think this
> was really more about the commit being fixed c64a9a7c05be ("drm/i915:
> Update memory bandwidth formulae") than about the patch at hand.
> 
> In any case, I've gone ahead and pushed this patch to drm-intel-next
> now. With the Fixes tag it should eventually find its way to stable
> v5.17+. Thank you for the patch, review - and nagging. ;)
> 
> What still remains is cleaning up the code. But that should never have
> stalled the fix for months. Sorry again.

No worries, better late than never :) Thanks for applying the change!

Cheers,
Nathan
