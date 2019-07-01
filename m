Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E67755B321
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 05:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FC689C61;
	Mon,  1 Jul 2019 03:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBAA89C61
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 03:30:57 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id c70so9905551qkg.7
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2019 20:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Dxvw+vEo64mSs7qQaeXr37LsyGZED36j9s3zhCp2c9I=;
 b=cr/hoesKgtNAiAvL3mXQDvEbzvhjL5TO2r+HMRsIAtmAfk2nLNhmSofeFrABOJo+vY
 yxyPk+F00h9D56SKvTQL5pSnDaCbwNJztFyoTWqdb9BgkfMqDA21tGEUv45i6AMpJn1S
 ZENfYHXzrEWyGl14ujGu4APlI9IhvDlVpdsWXWjr4/xoPL+UywU7rpfYKvk4sNEIOQSp
 N5P+g7mriggqszRZFqap8ovZVBSHL5TTUb1uQQO7BcSDzMpekR6h5nZ7FBRKm/yzxc9P
 1FciUWJ6WTAoImTrPqc9s568mZ/QzAkIg+uNsBuNeY0+VKl7OFsImxTzQikD4QvCS6+u
 aeqQ==
X-Gm-Message-State: APjAAAUmAwNHqYsCqb2nvT9eIB5Gf6vraN0F1iZ9G/eTeRARkE4UGttY
 KYDBbQCmUAVjmgRuXmpja+w=
X-Google-Smtp-Source: APXvYqzErPyW0bcupULQPsujaG4eukmTo4JV0Z8wh5UJ+KF7f7HhsWq9mQF6U3zLG8CCgcyUsMWAFQ==
X-Received: by 2002:a37:4a8a:: with SMTP id x132mr18888454qka.42.1561951856415; 
 Sun, 30 Jun 2019 20:30:56 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.22])
 by smtp.gmail.com with ESMTPSA id j6sm4319638qkf.119.2019.06.30.20.30.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 30 Jun 2019 20:30:55 -0700 (PDT)
Date: Mon, 1 Jul 2019 00:30:52 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 00/10] drm/vkms: rework crc worker
Message-ID: <20190701033052.6dfa4xn5lv3xawh3@smtp.gmail.com>
References: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
 <CADKXj+4MOQv1KZqPG=SpwsynLRBoFVdNXKt1qXZwxUFZVAYybQ@mail.gmail.com>
 <20190612144220.GO2458@phenom.ffwll.local>
 <20190618024904.nd3iuhyi4orkplu2@smtp.gmail.com>
 <20190618085647.GO12905@phenom.ffwll.local>
 <CADKXj+4dx-qzvtig-3nOi_UnKezXabxHOPaj8R4qWBnoiQtqMQ@mail.gmail.com>
 <CAKMK7uHpQOz1AUh4-yyh3CLxzY25frcVqU7e4vx8ASZkCC8puw@mail.gmail.com>
 <20190626014426.oczaig3djw72s7a7@smtp.gmail.com>
 <CAKMK7uEHCBECvwAysk-vBoO93t9S1Ygo4c0FbQqJM1dekOd+UA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEHCBECvwAysk-vBoO93t9S1Ygo4c0FbQqJM1dekOd+UA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Dxvw+vEo64mSs7qQaeXr37LsyGZED36j9s3zhCp2c9I=;
 b=ZjjDPy3nvMst2N760NEfRiJjAqzpG/d3ZbHbPzXXcTG5qFcGvT+TEAPBH2YJFzStn0
 V4ZteOWrvc+rReyJzNxtcYp2d8MABXtQyydZf3LxgmQrKwpoXfhrjdMRXQTtOBI/B5aQ
 4Si0cMVkQHN9bdZLCnFL1YUPdEay/d+JEyj1rIX0cTS7cQ2eDkIzR9GuMrX5cnwxTfOW
 YqZMxO2p8tcvSBJV5uMyUmjC4LUsRpuxHIkD49jdgoho45yDmoqumpmau1KJoQb3/pXp
 tZRZAhB0dYLImDCrKhjRWoyLUkUy4hXHxzApiloIRtD+SYRx1OK6EDWnxwImnRirm8bV
 BuRQ==
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
Content-Type: multipart/mixed; boundary="===============2032390237=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2032390237==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sii5hkcebcrfyb2s"
Content-Disposition: inline


--sii5hkcebcrfyb2s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/26, Daniel Vetter wrote:
> On Wed, Jun 26, 2019 at 3:44 AM Rodrigo Siqueira
> <rodrigosiqueiramelo@gmail.com> wrote:
> >
> > On 06/19, Daniel Vetter wrote:
> > > On Tue, Jun 18, 2019 at 11:54 PM Rodrigo Siqueira
> > > <rodrigosiqueiramelo@gmail.com> wrote:
> > > >
> > > > On Tue, Jun 18, 2019 at 5:56 AM Daniel Vetter <daniel@ffwll.ch> wro=
te:
> > > > >
> > > > > On Mon, Jun 17, 2019 at 11:49:04PM -0300, Rodrigo Siqueira wrote:
> > > > > > On 06/12, Daniel Vetter wrote:
> > > > > > > On Wed, Jun 12, 2019 at 10:28:41AM -0300, Rodrigo Siqueira wr=
ote:
> > > > > > > > Hi Daniel,
> > > > > > > >
> > > > > > > > First of all, thank you very much for your patchset.
> > > > > > > >
> > > > > > > > I tried to make a detailed review of your series, and you c=
an see my
> > > > > > > > comments in each patch. You=E2=80=99ll notice that I asked =
many things related
> > > > > > > > to the DRM subsystem with the hope that I could learn a lit=
tle bit
> > > > > > > > more about DRM from your comments.
> > > > > > > >
> > > > > > > > Before you go through the review, I would like to start a d=
iscussion
> > > > > > > > about the vkms race conditions. First, I have to admit that=
 I did not
> > > > > > > > understand the race conditions that you described before be=
cause I
> > > > > > > > couldn=E2=80=99t reproduce them. Now, I'm suspecting that I=
 could not
> > > > > > > > experience the problem because I'm using QEMU with KVM; wit=
h this idea
> > > > > > > > in mind, I suppose that we have two scenarios for using vkm=
s in a
> > > > > > > > virtual machine:
> > > > > > > >
> > > > > > > > * Scenario 1: The user has hardware virtualization support;=
 in this
> > > > > > > > case, it is a little bit harder to experience race conditio=
ns with
> > > > > > > > vkms.
> > > > > > > >
> > > > > > > > * Scenario 2: Without hardware virtualization support, it i=
s much
> > > > > > > > easier to experience race conditions.
> > > > > > > >
> > > > > > > > With these two scenarios in mind, I conducted a bunch of ex=
periments
> > > > > > > > for trying to shed light on this issue. I did:
> > > > > > > >
> > > > > > > > 1. Enabled lockdep
> > > > > > > >
> > > > > > > > 2. Defined two different environments for testing both usin=
g QEMU with
> > > > > > > > and without kvm. See below the QEMU hardware options:
> > > > > > > >
> > > > > > > > * env_kvm: -enable-kvm -daemonize -m 1G -smp cores=3D2,cpus=
=3D2
> > > > > > > > * env_no_kvm: -daemonize -m 2G -smp cores=3D4,cpus=3D4
> > > > > > > >
> > > > > > > > 3. My test protocol: I) turn on the vm, II) clean /proc/loc=
k_stat,
> > > > > > > > III) execute kms_cursor_crc, III) save the lock_stat file, =
and IV)
> > > > > > > > turn off the vm.
> > > > > > > >
> > > > > > > > 4. From the lockdep_stat, I just highlighted the row relate=
d to vkms
> > > > > > > > and the columns holdtime-total and holdtime-avg
> > > > > > > >
> > > > > > > > I would like to highlight that the following data does not =
have any
> > > > > > > > statistical approach, and its intention is solely to assist=
 our
> > > > > > > > discussion. See below the summary of the collected data:
> > > > > > > >
> > > > > > > > Summary of the experiment results:
> > > > > > > >
> > > > > > > > +----------------+----------------+----------------+
> > > > > > > > |                |     env_kvm    |   env_no_kvm   |
> > > > > > > > +                +----------------+----------------+
> > > > > > > > | Test           | Before | After | Before | After |
> > > > > > > > +----------------+--------+-------+--------+-------+
> > > > > > > > | kms_cursor_crc |   S1   |   S2  |   M1   |   M2  |
> > > > > > > > +----------------+--------+-------+--------+-------+
> > > > > > > >
> > > > > > > > * Before: before apply this patchset
> > > > > > > > * After: after apply this patchset
> > > > > > > >
> > > > > > > > -----------------------------------------+-----------------=
-+-----------
> > > > > > > > S1: Without this patchset and with kvm   | holdtime-total |=
 holdtime-avg
> > > > > > > > -----------------------------------------+----------------+=
-------------
> > > > > > > > &(&vkms_out->lock)->rlock:               |  21983.52      |=
  6.21
> > > > > > > > (work_completion)(&vkms_state->crc_wo:   |  20.47         |=
  20.47
> > > > > > > > (wq_completion)vkms_crc_workq:           |  3999507.87    |=
  3352.48
> > > > > > > > &(&vkms_out->state_lock)->rlock:         |  378.47        |=
  0.30
> > > > > > > > (work_completion)(&vkms_state->crc_#2:   |  3999066.30    |=
  2848.34
> > > > > > > > -----------------------------------------+----------------+=
-------------
> > > > > > > > S2: With this patchset and with kvm      |                |
> > > > > > > > -----------------------------------------+----------------+=
-------------
> > > > > > > > &(&vkms_out->lock)->rlock:               |  23262.83      |=
  6.34
> > > > > > > > (work_completion)(&vkms_state->crc_wo:   |  8.98          |=
  8.98
> > > > > > > > &(&vkms_out->crc_lock)->rlock:           |  307.28        |=
  0.32
> > > > > > > > (wq_completion)vkms_crc_workq:           |  6567727.05    |=
  12345.35
> > > > > > > > (work_completion)(&vkms_state->crc_#2:   |  6567135.15    |=
  4488.81
> > > > > > > > -----------------------------------------+----------------+=
-------------
> > > > > > > > M1: Without this patchset and without kvm|                |
> > > > > > > > -----------------------------------------+----------------+=
-------------
> > > > > > > > &(&vkms_out->state_lock)->rlock:         |  4994.72       |=
  1.61
> > > > > > > > &(&vkms_out->lock)->rlock:               |  247190.04     |=
  39.39
> > > > > > > > (work_completion)(&vkms_state->crc_wo:   |  31.32         |=
  31.32
> > > > > > > > (wq_completion)vkms_crc_workq:           |  20991073.78   |=
  13525.18
> > > > > > > > (work_completion)(&vkms_state->crc_#2:   |  20988347.18   |=
  11904.90
> > > > > > > > -----------------------------------------+----------------+=
-------------
> > > > > > > > M2: With this patchset and without kvm   |                |
> > > > > > > > -----------------------------------------+----------------+=
-------------
> > > > > > > > (wq_completion)vkms_crc_workq:           |  42819161.68   |=
  36597.57
> > > > > > > > &(&vkms_out->lock)->rlock:               |  251257.06     |=
  35.80
> > > > > > > > (work_completion)(&vkms_state->crc_wo:   |  69.37         |=
  69.37
> > > > > > > > &(&vkms_out->crc_lock)->rlock:           |  3620.92       |=
  1.54
> > > > > > > > (work_completion)(&vkms_state->crc_#2:   |  42803419.59   |=
  24306.31
> > > > > > > >
> > > > > > > > First, I analyzed the scenarios with KVM (S1 and S2); more
> > > > > > > > specifically, I focused on these two classes:
> > > > > > > >
> > > > > > > > 1. (work_completion)(&vkms_state->crc_wo
> > > > > > > > 2. (work_completion)(&vkms_state->crc_#2
> > > > > > > >
> > > > > > > > After taking a look at the data, it looks like that this pa=
tchset
> > > > > > > > greatly reduces the hold time average for crc_wo. On the ot=
her hand,
> > > > > > > > it increases the hold time average for crc_#2. I didn=E2=80=
=99t understand
> > > > > > > > well the reason for the difference. Could you help me here?
> > > > > > >
> > > > > > > So there's two real locks here from our code, the ones you ca=
n see as
> > > > > > > spinlocks:
> > > > > > >
> > > > > > > &(&vkms_out->state_lock)->rlock:         |  4994.72       |  =
1.61
> > > > > > > &(&vkms_out->lock)->rlock:               |  247190.04     |  =
39.39
> > > > > > >
> > > > > > > All the others are fake locks that the workqueue adds, which =
only exist in
> > > > > > > lockdep. They are used to catch special kinds of deadlocks li=
ke the below:
> > > > > > >
> > > > > > > thread A:
> > > > > > > 1. mutex_lock(mutex_A)
> > > > > > > 2. flush_work(work_A)
> > > > > > >
> > > > > > > thread B
> > > > > > > 1. running work_A:
> > > > > > > 2. mutex_lock(mutex_A)
> > > > > > >
> > > > > > > thread B can't continue becuase mutex_A is already held by th=
read A.
> > > > > > > thread A can't continue because thread B is blocked and the w=
ork never
> > > > > > > finishes.
> > > > > > > -> deadlock
> > > > > > >
> > > > > > > I haven't checked which is which, but essentially what you me=
asure with
> > > > > > > the hold times of these fake locks is how long a work executi=
on takes on
> > > > > > > average.
> > > > > > >
> > > > > > > Since my patches are supposed to fix races where the worker c=
an't keep up
> > > > > > > with the vblank hrtimer, then the average worker will (probab=
ly) do more,
> > > > > > > so that going up is expected. I think.
> > > > > > >
> > > > > > > I'm honestly not sure what's going on here, never looking int=
o this in
> > > > > > > detail.
> > > > > > >
> > > > > > > > When I looked for the second set of scenarios (M1 and M2, b=
oth without
> > > > > > > > KVM), the results look much more distant; basically, this p=
atchset
> > > > > > > > increased the hold time average. Again, could you help me u=
nderstand a
> > > > > > > > little bit better this issue?
> > > > > > > >
> > > > > > > > Finally, after these tests, I have some questions:
> > > > > > > >
> > > > > > > > 1. VKMS is a software-only driver; because of this, how abo=
ut defining
> > > > > > > > a minimal system resource for using it?
> > > > > > >
> > > > > > > No idea, in reality it's probably "if it fails too often, buy=
 faster cpu".
> > > > > > > I do think we should make the code robust against a slow cpu,=
 since atm
> > > > > > > that's needed even on pretty fast machines (because our blend=
ing code is
> > > > > > > really, really slow and inefficient).
> > > > > > >
> > > > > > > > 2. During my experiments, I noticed that running tests with=
 a VM that
> > > > > > > > uses KVM had consistent results. For example, kms_flip neve=
r fails
> > > > > > > > with QEMU+KVM; however, without KVM, two or three tests fai=
led (one of
> > > > > > > > them looks random). If we use vkms for test DRM stuff, shou=
ld we
> > > > > > > > recommend the use of KVM?
> > > > > > >
> > > > > > > What do you mean without kvm? In general running without kvm =
shouldn't be
> > > > > > > slower, so I'm a bit confused ... I'm running vgem directly o=
n the
> > > > > > > machine, by booting into new kernels (and controlling the mac=
hine over the
> > > > > > > network).
> > > > > >
> > > > > > Sorry, I should have detailed my point.
> > > > > >
> > > > > > Basically, I do all my testing with vkms in QEMU VM. In that se=
nse, I
> > > > > > did some experiments which I enabled and disabled the KVM (i.e.=
, flag
> > > > > > '-enable-kvm') to check the vkms behaviour in these two scenari=
os. I
> > > > > > noticed that the tests are consistent when I use the '-enable-k=
vm' flag,
> > > > > > in that context it seemed a good idea to recommend the use of K=
VM for
> > > > > > those users who want to test vkms with igt. Anyway, don't worry=
 about
> > > > > > that I'll try to add more documentation for vkms in the future =
and in
> > > > > > that time we discuss about this again.
> > > > >
> > > > > Ah, qemu without kvm is going to use software emulation for a lot=
 of the
> > > > > kernel stuff. That's going to be terribly slow indeed.
> > > > >
> > > > > > Anyway, from my side, I think we should merge this series. Do y=
ou want
> > > > > > to prepare a V2 with the fixes and maybe update the commit mess=
ages by
> > > > > > using some of your explanations? Or, if you want, I can fix the=
 tiny
> > > > > > details and merge it.
> > > > >
> > > > > I'm deeply burried in my prime cleanup/doc series right now, so w=
ill take
> > > > > a few days until I get around to this again. If you want, please =
go ahead
> > > > > with merging.
> > > > >
> > > > > btw if you edit a patch when merging, please add a comment about =
that to
> > > > > the commit message. And ime it's best to only augment the commit =
message
> > > > > and maybe delete an unused variable or so that got forgotten. For
> > > > > everything more better to do the edits and resubmit.
> > > >
> > > > First of all, thank you very much for all your reviews and
> > > > explanation. I=E2=80=99ll try the exercise that you proposed on Pat=
ch 1.
> > > >
> > > > I=E2=80=99ll merge patch [4] and [7] since they=E2=80=99re not rela=
ted to these
> > > > series. For the other patches, I=E2=80=99ll merge them after I fini=
sh the new
> > > > version of writeback series. I=E2=80=99ll ping you later.
> > > >
> >
> > Hi,
> >
> > I already sent the new version of the writeback patchset. So, how do you
> > want to proceed with this series? Do you prefer to send a V2 or should I
> > apply the patchset and make the tiny fixes?
>=20
> I don't have r-b tags from you (usually if it's just nits then you can
> do "r-b with those tiny details addressed"), so I can't merge. I
> thought you wanted to merge them, which I've been waiting for you to
> do ... so that's why they're stuck right now. Just decide and we move
> them, up to you really.
> -Daniel

Hi Daniel,

I think that I forgot to tell you that I already applied this series.

If you have time, could you take a look in the following two series
built on top of this patchset?

1. Writeback: https://patchwork.freedesktop.org/series/61738/
2. Configfs: https://patchwork.freedesktop.org/series/63010/

Thanks
=20
> >
> > Thanks
> >
> > > > 4. https://patchwork.freedesktop.org/patch/309031/?series=3D61737&r=
ev=3D1
> > > > 7. https://patchwork.freedesktop.org/patch/309029/?series=3D61737&r=
ev=3D1$
> > >
> > > Can you merge them quicker? I have another 3 vkms patches here
> > > touching that area with some follow-up stuff ...
> > >
> > > > Finally, not related with this patchset, can I apply the patch
> > > > =E2=80=9Cdrm/drm_vblank: Change EINVAL by the correct errno=E2=80=
=9D [1] or do I need
> > > > more SoB? I=E2=80=99ll also apply Oleg patch (drm/vkms: add crc sou=
rces list).
> > > >
> > > > 1. https://patchwork.freedesktop.org/patch/310006/?series=3D50697&r=
ev=3D4
> > >
> > > If you want get some acks from igt maintainers (those patches landed
> > > now, right), but this is good enough.
> > > -Daniel
> > >
> > >
> > > > Thanks
> > > >
> > > > > Thanks, Daniel
> > > > >
> > > > > >
> > > > > > > -Daniel
> > > > > > >
> > > > > > > > Best Regards
> > > > > > > >
> > > > > > > > On Thu, Jun 6, 2019 at 7:28 PM Daniel Vetter <daniel.vetter=
@ffwll.ch> wrote:
> > > > > > > > >
> > > > > > > > > Hi all,
> > > > > > > > >
> > > > > > > > > This here is the first part of a rework for the vkms crc =
worker. I think
> > > > > > > > > this should fix all the locking/races/use-after-free issu=
es I spotted in
> > > > > > > > > the code. There's more work we can do in the future as a =
follow-up:
> > > > > > > > >
> > > > > > > > > - directly access vkms_plane_state->base in the crc worke=
r, with this
> > > > > > > > >   approach in this series here that should be safe now. F=
ollow-up patches
> > > > > > > > >   could switch and remove all the separate crc_data infra=
structure.
> > > > > > > > >
> > > > > > > > > - I think some kerneldoc for vkms structures would be nic=
e. Documentation
> > > > > > > > >   the various functions is probably overkill.
> > > > > > > > >
> > > > > > > > > - Implementing a more generic blending engine, as prep fo=
r adding more
> > > > > > > > >   pixel formats, more planes, and more features in genera=
l.
> > > > > > > > >
> > > > > > > > > Tested with kms_pipe_crc, kms_flip and kms_cursor_crc. Se=
ems to not make
> > > > > > > > > things worse, but I didn't do a full run.
> > > > > > > > >
> > > > > > > > > Cheers, Daniel
> > > > > > > > >
> > > > > > > > > Daniel Vetter (10):
> > > > > > > > >   drm/vkms: Fix crc worker races
> > > > > > > > >   drm/vkms: Use spin_lock_irq in process context
> > > > > > > > >   drm/vkms: Rename vkms_output.state_lock to crc_lock
> > > > > > > > >   drm/vkms: Move format arrays to vkms_plane.c
> > > > > > > > >   drm/vkms: Add our own commit_tail
> > > > > > > > >   drm/vkms: flush crc workers earlier in commit flow
> > > > > > > > >   drm/vkms: Dont flush crc worker when we change crc stat=
us
> > > > > > > > >   drm/vkms: No _irqsave within spin_lock_irq needed
> > > > > > > > >   drm/vkms: totally reworked crc data tracking
> > > > > > > > >   drm/vkms: No need for ->pages_lock in crc work anymore
> > > > > > > > >
> > > > > > > > >  drivers/gpu/drm/vkms/vkms_crc.c   | 74 +++++++++--------=
-----------
> > > > > > > > >  drivers/gpu/drm/vkms/vkms_crtc.c  | 80 +++++++++++++++++=
+++++++++-----
> > > > > > > > >  drivers/gpu/drm/vkms/vkms_drv.c   | 35 ++++++++++++++
> > > > > > > > >  drivers/gpu/drm/vkms/vkms_drv.h   | 24 +++++-----
> > > > > > > > >  drivers/gpu/drm/vkms/vkms_plane.c |  8 ++++
> > > > > > > > >  5 files changed, 146 insertions(+), 75 deletions(-)
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > 2.20.1
> > > > > > > > >
> > > > > > > > > _______________________________________________
> > > > > > > > > dri-devel mailing list
> > > > > > > > > dri-devel@lists.freedesktop.org
> > > > > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > --
> > > > > > > >
> > > > > > > > Rodrigo Siqueira
> > > > > > > > https://siqueira.tech
> > > > > > >
> > > > > > > --
> > > > > > > Daniel Vetter
> > > > > > > Software Engineer, Intel Corporation
> > > > > > > http://blog.ffwll.ch
> > > > > >
> > > > > > --
> > > > > > Rodrigo Siqueira
> > > > > > https://siqueira.tech
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > > >
> > > >
> > > >
> > > > --
> > > >
> > > > Rodrigo Siqueira
> > > > https://siqueira.tech
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> >
> > --
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

--sii5hkcebcrfyb2s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0ZfmsACgkQWJzP/com
vP9LNQ/+ILTqyBkl3a5gdXb0ecPrTDYkQkdnfzXr09zmCMTNW/kkAPugj29yziRE
51/RGic+0yGrIx96HBGKt0pEn/Gn20udkIJzrB/FdWFmm0XW/t8yIwu7PL8eX4qA
MhgP+oeQnLGy72hktuJsD5UpRJebT2P4pprJ+NpB4mCzBuL/0A3x9T+frpNUsECJ
z7gE7b7YkA16axwvja4kLQVYqrZIVvnfzKK08hXGoLQDF5bEO8IhqXxGcW1rKHBZ
FXQSCOX5+ksa1gkYKxtqehqNVNoEBKnqGfukX7GFtOEKSP4AA8ap/5AVEx2Z0HcX
fpCfGUPkhEweVhl7Z3H89Qmrh/anpP2+vqIhqfqMQvEPUPoFltNo6k31e795qodz
XYgbUURwjlrBYrR+C1Vjz86LU0k4czzNB3nhIaPzyIc2MCTETki/839I26xaNrTs
0XaqGc8ojM4QFptMvsW88LsEwioiKFbDlWB8ZFyhfuEj++MhpBk2+wYUT4KJi5ea
j8+G9wPL/bfnSdtAWa+8kKa6ycpEUqAgqQhy+a8NzpIViVF5bXvb4ngPZtvWIH8+
lYa+Nyp73Z10ME7+8SiABnhDvLTVtIUnHnH9Kgj66peNWn/FsFF9HXFK0LomlBzL
P7UuEtza8xqK0a3885uNXMMiFwLKBa3/IkEnyMsBzemBu0onhd8=
=RH8Y
-----END PGP SIGNATURE-----

--sii5hkcebcrfyb2s--

--===============2032390237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2032390237==--
