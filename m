Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 385CA55DE1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 03:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E0889498;
	Wed, 26 Jun 2019 01:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911C089498
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 01:44:31 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id i125so355934qkd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 18:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JygGKRUCkHdel/HAW0y71CuVjbWyNX8vmqzKzxwDIiw=;
 b=hEhSVK/XUu0a82uXdgvVrAybFcgxnUElKNrqmchXN4ev/VaEjXR7e+VwYZH7DXr+XG
 4H93L+ta3/BEoCgs6ZmtL+LxOD8p5o9ZI/lun1s8P0YqCzAQgNoLThPsG2mCoAKR6LgE
 T1+/eICTIgqbnWf64ATADIk8kPUiGy0Uo9IzhQ0avGQ5CzFHi2i3BOk8SDhCFdvf/8rG
 OgTAhSfUPVeV9UURZoo1DFRwVMvHaz7jcxpiHdkXxZAoA6viESlXOyh9ZAAtCVjf5ndZ
 nLq7PVFfEV2Eco3FFbaj1/71xiN+BIXVzfMPSUVdf+knLIPOzufVLKV0nbFhv9Q/zAGi
 C9bA==
X-Gm-Message-State: APjAAAWUtRrN8J72HFXOTyDXHf3SSdqIITRyF+CV1YpCh7SJ7JsuhpCa
 XfZjgP89/zyVa7VuSRf1M4Y=
X-Google-Smtp-Source: APXvYqwPXPj/j4+XqGPSnvvYJLTMHLp/IBi1lkmvUzU+ZQhyA4apGYdtQnAeDMZGyvE93RMotdy2eQ==
X-Received: by 2002:ae9:ef4a:: with SMTP id d71mr1505985qkg.406.1561513470586; 
 Tue, 25 Jun 2019 18:44:30 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.146])
 by smtp.gmail.com with ESMTPSA id s35sm10104118qth.79.2019.06.25.18.44.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 18:44:29 -0700 (PDT)
Date: Tue, 25 Jun 2019 22:44:26 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 00/10] drm/vkms: rework crc worker
Message-ID: <20190626014426.oczaig3djw72s7a7@smtp.gmail.com>
References: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
 <CADKXj+4MOQv1KZqPG=SpwsynLRBoFVdNXKt1qXZwxUFZVAYybQ@mail.gmail.com>
 <20190612144220.GO2458@phenom.ffwll.local>
 <20190618024904.nd3iuhyi4orkplu2@smtp.gmail.com>
 <20190618085647.GO12905@phenom.ffwll.local>
 <CADKXj+4dx-qzvtig-3nOi_UnKezXabxHOPaj8R4qWBnoiQtqMQ@mail.gmail.com>
 <CAKMK7uHpQOz1AUh4-yyh3CLxzY25frcVqU7e4vx8ASZkCC8puw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHpQOz1AUh4-yyh3CLxzY25frcVqU7e4vx8ASZkCC8puw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JygGKRUCkHdel/HAW0y71CuVjbWyNX8vmqzKzxwDIiw=;
 b=G0kV2hF4dvV9ItziKzf17VAcPAYzyVqwmx2p1/0NDqx23iMOySzrBT0CPPYnBqSrRD
 /++HuJMt2so9MTkySSDMRFk1Me7kSTIIywm4w4REItOniROplUk2VdSMzvaAa80HkLG1
 m9s+fT9m9xnchZG5poMkv71IQaiv0OxxVnXOpzO00nE9lSW0YnPDrVG/OHLiOj59qHhQ
 F3TbvwPTiQWTD2GY661YG/KJJxm76m0SyrI1dg4aw3tfIs0Lv+DNg/IX8rhDuDCmOau0
 0kpmTPRcjohyzrsx96OP3ILxt2kzQLzs8T7Vv1i0f1Lku+qdVblomyXKWAn6jodq3DMf
 FXlQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0710604350=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0710604350==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kauzabc35ngechv4"
Content-Disposition: inline


--kauzabc35ngechv4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/19, Daniel Vetter wrote:
> On Tue, Jun 18, 2019 at 11:54 PM Rodrigo Siqueira
> <rodrigosiqueiramelo@gmail.com> wrote:
> >
> > On Tue, Jun 18, 2019 at 5:56 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Mon, Jun 17, 2019 at 11:49:04PM -0300, Rodrigo Siqueira wrote:
> > > > On 06/12, Daniel Vetter wrote:
> > > > > On Wed, Jun 12, 2019 at 10:28:41AM -0300, Rodrigo Siqueira wrote:
> > > > > > Hi Daniel,
> > > > > >
> > > > > > First of all, thank you very much for your patchset.
> > > > > >
> > > > > > I tried to make a detailed review of your series, and you can s=
ee my
> > > > > > comments in each patch. You=E2=80=99ll notice that I asked many=
 things related
> > > > > > to the DRM subsystem with the hope that I could learn a little =
bit
> > > > > > more about DRM from your comments.
> > > > > >
> > > > > > Before you go through the review, I would like to start a discu=
ssion
> > > > > > about the vkms race conditions. First, I have to admit that I d=
id not
> > > > > > understand the race conditions that you described before becaus=
e I
> > > > > > couldn=E2=80=99t reproduce them. Now, I'm suspecting that I cou=
ld not
> > > > > > experience the problem because I'm using QEMU with KVM; with th=
is idea
> > > > > > in mind, I suppose that we have two scenarios for using vkms in=
 a
> > > > > > virtual machine:
> > > > > >
> > > > > > * Scenario 1: The user has hardware virtualization support; in =
this
> > > > > > case, it is a little bit harder to experience race conditions w=
ith
> > > > > > vkms.
> > > > > >
> > > > > > * Scenario 2: Without hardware virtualization support, it is mu=
ch
> > > > > > easier to experience race conditions.
> > > > > >
> > > > > > With these two scenarios in mind, I conducted a bunch of experi=
ments
> > > > > > for trying to shed light on this issue. I did:
> > > > > >
> > > > > > 1. Enabled lockdep
> > > > > >
> > > > > > 2. Defined two different environments for testing both using QE=
MU with
> > > > > > and without kvm. See below the QEMU hardware options:
> > > > > >
> > > > > > * env_kvm: -enable-kvm -daemonize -m 1G -smp cores=3D2,cpus=3D2
> > > > > > * env_no_kvm: -daemonize -m 2G -smp cores=3D4,cpus=3D4
> > > > > >
> > > > > > 3. My test protocol: I) turn on the vm, II) clean /proc/lock_st=
at,
> > > > > > III) execute kms_cursor_crc, III) save the lock_stat file, and =
IV)
> > > > > > turn off the vm.
> > > > > >
> > > > > > 4. From the lockdep_stat, I just highlighted the row related to=
 vkms
> > > > > > and the columns holdtime-total and holdtime-avg
> > > > > >
> > > > > > I would like to highlight that the following data does not have=
 any
> > > > > > statistical approach, and its intention is solely to assist our
> > > > > > discussion. See below the summary of the collected data:
> > > > > >
> > > > > > Summary of the experiment results:
> > > > > >
> > > > > > +----------------+----------------+----------------+
> > > > > > |                |     env_kvm    |   env_no_kvm   |
> > > > > > +                +----------------+----------------+
> > > > > > | Test           | Before | After | Before | After |
> > > > > > +----------------+--------+-------+--------+-------+
> > > > > > | kms_cursor_crc |   S1   |   S2  |   M1   |   M2  |
> > > > > > +----------------+--------+-------+--------+-------+
> > > > > >
> > > > > > * Before: before apply this patchset
> > > > > > * After: after apply this patchset
> > > > > >
> > > > > > -----------------------------------------+------------------+--=
---------
> > > > > > S1: Without this patchset and with kvm   | holdtime-total | hol=
dtime-avg
> > > > > > -----------------------------------------+----------------+----=
---------
> > > > > > &(&vkms_out->lock)->rlock:               |  21983.52      |  6.=
21
> > > > > > (work_completion)(&vkms_state->crc_wo:   |  20.47         |  20=
=2E47
> > > > > > (wq_completion)vkms_crc_workq:           |  3999507.87    |  33=
52.48
> > > > > > &(&vkms_out->state_lock)->rlock:         |  378.47        |  0.=
30
> > > > > > (work_completion)(&vkms_state->crc_#2:   |  3999066.30    |  28=
48.34
> > > > > > -----------------------------------------+----------------+----=
---------
> > > > > > S2: With this patchset and with kvm      |                |
> > > > > > -----------------------------------------+----------------+----=
---------
> > > > > > &(&vkms_out->lock)->rlock:               |  23262.83      |  6.=
34
> > > > > > (work_completion)(&vkms_state->crc_wo:   |  8.98          |  8.=
98
> > > > > > &(&vkms_out->crc_lock)->rlock:           |  307.28        |  0.=
32
> > > > > > (wq_completion)vkms_crc_workq:           |  6567727.05    |  12=
345.35
> > > > > > (work_completion)(&vkms_state->crc_#2:   |  6567135.15    |  44=
88.81
> > > > > > -----------------------------------------+----------------+----=
---------
> > > > > > M1: Without this patchset and without kvm|                |
> > > > > > -----------------------------------------+----------------+----=
---------
> > > > > > &(&vkms_out->state_lock)->rlock:         |  4994.72       |  1.=
61
> > > > > > &(&vkms_out->lock)->rlock:               |  247190.04     |  39=
=2E39
> > > > > > (work_completion)(&vkms_state->crc_wo:   |  31.32         |  31=
=2E32
> > > > > > (wq_completion)vkms_crc_workq:           |  20991073.78   |  13=
525.18
> > > > > > (work_completion)(&vkms_state->crc_#2:   |  20988347.18   |  11=
904.90
> > > > > > -----------------------------------------+----------------+----=
---------
> > > > > > M2: With this patchset and without kvm   |                |
> > > > > > -----------------------------------------+----------------+----=
---------
> > > > > > (wq_completion)vkms_crc_workq:           |  42819161.68   |  36=
597.57
> > > > > > &(&vkms_out->lock)->rlock:               |  251257.06     |  35=
=2E80
> > > > > > (work_completion)(&vkms_state->crc_wo:   |  69.37         |  69=
=2E37
> > > > > > &(&vkms_out->crc_lock)->rlock:           |  3620.92       |  1.=
54
> > > > > > (work_completion)(&vkms_state->crc_#2:   |  42803419.59   |  24=
306.31
> > > > > >
> > > > > > First, I analyzed the scenarios with KVM (S1 and S2); more
> > > > > > specifically, I focused on these two classes:
> > > > > >
> > > > > > 1. (work_completion)(&vkms_state->crc_wo
> > > > > > 2. (work_completion)(&vkms_state->crc_#2
> > > > > >
> > > > > > After taking a look at the data, it looks like that this patchs=
et
> > > > > > greatly reduces the hold time average for crc_wo. On the other =
hand,
> > > > > > it increases the hold time average for crc_#2. I didn=E2=80=99t=
 understand
> > > > > > well the reason for the difference. Could you help me here?
> > > > >
> > > > > So there's two real locks here from our code, the ones you can se=
e as
> > > > > spinlocks:
> > > > >
> > > > > &(&vkms_out->state_lock)->rlock:         |  4994.72       |  1.61
> > > > > &(&vkms_out->lock)->rlock:               |  247190.04     |  39.39
> > > > >
> > > > > All the others are fake locks that the workqueue adds, which only=
 exist in
> > > > > lockdep. They are used to catch special kinds of deadlocks like t=
he below:
> > > > >
> > > > > thread A:
> > > > > 1. mutex_lock(mutex_A)
> > > > > 2. flush_work(work_A)
> > > > >
> > > > > thread B
> > > > > 1. running work_A:
> > > > > 2. mutex_lock(mutex_A)
> > > > >
> > > > > thread B can't continue becuase mutex_A is already held by thread=
 A.
> > > > > thread A can't continue because thread B is blocked and the work =
never
> > > > > finishes.
> > > > > -> deadlock
> > > > >
> > > > > I haven't checked which is which, but essentially what you measur=
e with
> > > > > the hold times of these fake locks is how long a work execution t=
akes on
> > > > > average.
> > > > >
> > > > > Since my patches are supposed to fix races where the worker can't=
 keep up
> > > > > with the vblank hrtimer, then the average worker will (probably) =
do more,
> > > > > so that going up is expected. I think.
> > > > >
> > > > > I'm honestly not sure what's going on here, never looking into th=
is in
> > > > > detail.
> > > > >
> > > > > > When I looked for the second set of scenarios (M1 and M2, both =
without
> > > > > > KVM), the results look much more distant; basically, this patch=
set
> > > > > > increased the hold time average. Again, could you help me under=
stand a
> > > > > > little bit better this issue?
> > > > > >
> > > > > > Finally, after these tests, I have some questions:
> > > > > >
> > > > > > 1. VKMS is a software-only driver; because of this, how about d=
efining
> > > > > > a minimal system resource for using it?
> > > > >
> > > > > No idea, in reality it's probably "if it fails too often, buy fas=
ter cpu".
> > > > > I do think we should make the code robust against a slow cpu, sin=
ce atm
> > > > > that's needed even on pretty fast machines (because our blending =
code is
> > > > > really, really slow and inefficient).
> > > > >
> > > > > > 2. During my experiments, I noticed that running tests with a V=
M that
> > > > > > uses KVM had consistent results. For example, kms_flip never fa=
ils
> > > > > > with QEMU+KVM; however, without KVM, two or three tests failed =
(one of
> > > > > > them looks random). If we use vkms for test DRM stuff, should we
> > > > > > recommend the use of KVM?
> > > > >
> > > > > What do you mean without kvm? In general running without kvm shou=
ldn't be
> > > > > slower, so I'm a bit confused ... I'm running vgem directly on the
> > > > > machine, by booting into new kernels (and controlling the machine=
 over the
> > > > > network).
> > > >
> > > > Sorry, I should have detailed my point.
> > > >
> > > > Basically, I do all my testing with vkms in QEMU VM. In that sense,=
 I
> > > > did some experiments which I enabled and disabled the KVM (i.e., fl=
ag
> > > > '-enable-kvm') to check the vkms behaviour in these two scenarios. I
> > > > noticed that the tests are consistent when I use the '-enable-kvm' =
flag,
> > > > in that context it seemed a good idea to recommend the use of KVM f=
or
> > > > those users who want to test vkms with igt. Anyway, don't worry abo=
ut
> > > > that I'll try to add more documentation for vkms in the future and =
in
> > > > that time we discuss about this again.
> > >
> > > Ah, qemu without kvm is going to use software emulation for a lot of =
the
> > > kernel stuff. That's going to be terribly slow indeed.
> > >
> > > > Anyway, from my side, I think we should merge this series. Do you w=
ant
> > > > to prepare a V2 with the fixes and maybe update the commit messages=
 by
> > > > using some of your explanations? Or, if you want, I can fix the tiny
> > > > details and merge it.
> > >
> > > I'm deeply burried in my prime cleanup/doc series right now, so will =
take
> > > a few days until I get around to this again. If you want, please go a=
head
> > > with merging.
> > >
> > > btw if you edit a patch when merging, please add a comment about that=
 to
> > > the commit message. And ime it's best to only augment the commit mess=
age
> > > and maybe delete an unused variable or so that got forgotten. For
> > > everything more better to do the edits and resubmit.
> >
> > First of all, thank you very much for all your reviews and
> > explanation. I=E2=80=99ll try the exercise that you proposed on Patch 1.
> >
> > I=E2=80=99ll merge patch [4] and [7] since they=E2=80=99re not related =
to these
> > series. For the other patches, I=E2=80=99ll merge them after I finish t=
he new
> > version of writeback series. I=E2=80=99ll ping you later.
> >

Hi,

I already sent the new version of the writeback patchset. So, how do you
want to proceed with this series? Do you prefer to send a V2 or should I
apply the patchset and make the tiny fixes?

Thanks

> > 4. https://patchwork.freedesktop.org/patch/309031/?series=3D61737&rev=
=3D1
> > 7. https://patchwork.freedesktop.org/patch/309029/?series=3D61737&rev=
=3D1$
>=20
> Can you merge them quicker? I have another 3 vkms patches here
> touching that area with some follow-up stuff ...
>=20
> > Finally, not related with this patchset, can I apply the patch
> > =E2=80=9Cdrm/drm_vblank: Change EINVAL by the correct errno=E2=80=9D [1=
] or do I need
> > more SoB? I=E2=80=99ll also apply Oleg patch (drm/vkms: add crc sources=
 list).
> >
> > 1. https://patchwork.freedesktop.org/patch/310006/?series=3D50697&rev=
=3D4
>=20
> If you want get some acks from igt maintainers (those patches landed
> now, right), but this is good enough.
> -Daniel
>=20
>=20
> > Thanks
> >
> > > Thanks, Daniel
> > >
> > > >
> > > > > -Daniel
> > > > >
> > > > > > Best Regards
> > > > > >
> > > > > > On Thu, Jun 6, 2019 at 7:28 PM Daniel Vetter <daniel.vetter@ffw=
ll.ch> wrote:
> > > > > > >
> > > > > > > Hi all,
> > > > > > >
> > > > > > > This here is the first part of a rework for the vkms crc work=
er. I think
> > > > > > > this should fix all the locking/races/use-after-free issues I=
 spotted in
> > > > > > > the code. There's more work we can do in the future as a foll=
ow-up:
> > > > > > >
> > > > > > > - directly access vkms_plane_state->base in the crc worker, w=
ith this
> > > > > > >   approach in this series here that should be safe now. Follo=
w-up patches
> > > > > > >   could switch and remove all the separate crc_data infrastru=
cture.
> > > > > > >
> > > > > > > - I think some kerneldoc for vkms structures would be nice. D=
ocumentation
> > > > > > >   the various functions is probably overkill.
> > > > > > >
> > > > > > > - Implementing a more generic blending engine, as prep for ad=
ding more
> > > > > > >   pixel formats, more planes, and more features in general.
> > > > > > >
> > > > > > > Tested with kms_pipe_crc, kms_flip and kms_cursor_crc. Seems =
to not make
> > > > > > > things worse, but I didn't do a full run.
> > > > > > >
> > > > > > > Cheers, Daniel
> > > > > > >
> > > > > > > Daniel Vetter (10):
> > > > > > >   drm/vkms: Fix crc worker races
> > > > > > >   drm/vkms: Use spin_lock_irq in process context
> > > > > > >   drm/vkms: Rename vkms_output.state_lock to crc_lock
> > > > > > >   drm/vkms: Move format arrays to vkms_plane.c
> > > > > > >   drm/vkms: Add our own commit_tail
> > > > > > >   drm/vkms: flush crc workers earlier in commit flow
> > > > > > >   drm/vkms: Dont flush crc worker when we change crc status
> > > > > > >   drm/vkms: No _irqsave within spin_lock_irq needed
> > > > > > >   drm/vkms: totally reworked crc data tracking
> > > > > > >   drm/vkms: No need for ->pages_lock in crc work anymore
> > > > > > >
> > > > > > >  drivers/gpu/drm/vkms/vkms_crc.c   | 74 +++++++++------------=
-------
> > > > > > >  drivers/gpu/drm/vkms/vkms_crtc.c  | 80 +++++++++++++++++++++=
+++++-----
> > > > > > >  drivers/gpu/drm/vkms/vkms_drv.c   | 35 ++++++++++++++
> > > > > > >  drivers/gpu/drm/vkms/vkms_drv.h   | 24 +++++-----
> > > > > > >  drivers/gpu/drm/vkms/vkms_plane.c |  8 ++++
> > > > > > >  5 files changed, 146 insertions(+), 75 deletions(-)
> > > > > > >
> > > > > > > --
> > > > > > > 2.20.1
> > > > > > >
> > > > > > > _______________________________________________
> > > > > > > dri-devel mailing list
> > > > > > > dri-devel@lists.freedesktop.org
> > > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > >
> > > > > > Rodrigo Siqueira
> > > > > > https://siqueira.tech
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > > >
> > > > --
> > > > Rodrigo Siqueira
> > > > https://siqueira.tech
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> >
> >
> >
> > --
> >
> > Rodrigo Siqueira
> > https://siqueira.tech
>=20
>=20
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch

--=20
Rodrigo Siqueira
https://siqueira.tech

--kauzabc35ngechv4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0SzfoACgkQWJzP/com
vP9YnxAAxlbysYEv6JY/XlY9aIGVI786bDUWXL5C23YQ4yEgLQ3Y/LQ+hGePwrVO
G/A0Lzd2MfYPxpbUX9dfzQJ837fU38CihO9f5M+eoCGqPWVgYY+9FuZW1Y7Dzaoa
ywgd6ZKWQMT9aA1tZWQ09SUfbUzrZs2PwSidlMET9SSen1OOEgd3UzJ35iHa7npf
TYIQ09LxbOZXL2itQiDmK4PVze8yiqgysAeON6+x7ALVBXyUCBch6TetLQm28gv8
CdbUr2C4Sh8TxQagHVwAyzeYKmkeiCW2UGlJkE71pP7jbEZsoyo1sLcgCbfM+tm2
G/74JnJ7Sbq1QP8hctu/UgWl3ftN4bg75CBAH2JWBp4uRtdwKMjyooOCP1zf6QFj
RPnownSThZvWAfrrfJyuaSavchQJmxi3yWpomq2HFl0lsmdgsYWhrClWqAB5HXPX
gYHGDCjnWrseLdA3Mtyup1ZIMJH0NerzlnJzqkjViw0JsLAoSeBTG75GnwqjGGAc
H35YcYFCCQT7w5YyLrUG9sceVhBBAqU8jRJzDBAbNS0S/fk4C3v45zY6ccn0/3vx
uipMw2pbPuxwOcv7Ned0Lm/17N28fiQDHDEQdEfdVFqdI15KaUbczY+1VEVHYd8O
y5pSqNDyZSGU84/LPv2W8AhahsXtfq9p//Vfu/FTTpkHbQt0Fvk=
=LXnt
-----END PGP SIGNATURE-----

--kauzabc35ngechv4--

--===============0710604350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0710604350==--
