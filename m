Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9A36A5AD1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 15:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B5A10E204;
	Tue, 28 Feb 2023 14:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783B110E201
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 14:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677594657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AOI983LhYy8EgNoXSLJRTDG1qKyZkZiJAePhv79lsM4=;
 b=OQMid+ADXF974k2aFt/iTcTvzHgEkRQuTXhmkT8m6z8h5c+wEyEpAUJQ4MI2LJcJxBvDbz
 LGexXRJpXOD/V7RzPDHZsjtPFbziBq/rq37ASqPs5QjlJNDsYwNR0ZGGY9HZ7igDPTfzg6
 D40mpjsSID3OckjUXyE3H5X788Z1bbs=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-512-bJMYMkJtMDmLH5ibMFojxw-1; Tue, 28 Feb 2023 09:30:56 -0500
X-MC-Unique: bJMYMkJtMDmLH5ibMFojxw-1
Received: by mail-lj1-f198.google.com with SMTP id
 a9-20020a05651c210900b0028b97d2c493so2814862ljq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 06:30:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AOI983LhYy8EgNoXSLJRTDG1qKyZkZiJAePhv79lsM4=;
 b=VDpQjv5+C8LEW58v5yK16jLanfYshEfvnQTCl98GhJ6h2SLjV5RnqRo45EdfqgO1lR
 BUpQx7cAHkuIq6qynJlWI9eImpVZzKoukjLnG5NNtFRz4pF5D3AblsUJBWsBtpg5+K+2
 83Hg/V7fwFpkIvtaIuOoT1sXVf88nafWH0oYT3GulOBeyBzgfJKwAioLb40aDO9hU//O
 m39BSbzcdPuwnEDHPyFRMdAO+IqQdty5Iy49ENZmajZbJpBppIJYvcgs7YEXS/k0yLMe
 qW4Y5av1uzS7rNp/yw4ZacbTAbIpVhm5XOamSFNzGcrTENOHWrCdYM5wNtzLPClyIMv0
 TzVA==
X-Gm-Message-State: AO0yUKVh6EYyi1yVUEz1wL0SKHX9PMD5qVRUgAKjw0upybEQrxv7Kclc
 0d03AOB37kq6pPSqfYtdsHtdQQPfXpeEXuIZoBZlKZE9HpgrTnaAG932g10F9rL3zAIFipHZ7Z/
 Ydz8Wzm7SWrsGUaBP5v3azWD1oiXeDrnw21ppbesgSjFc84GehRUulGk=
X-Received: by 2002:ac2:51ba:0:b0:4d8:63cd:bd26 with SMTP id
 f26-20020ac251ba000000b004d863cdbd26mr786418lfk.10.1677594654033; 
 Tue, 28 Feb 2023 06:30:54 -0800 (PST)
X-Google-Smtp-Source: AK7set9Mms7cp6EjPM/dcgSqq/ZaieQfnfxbsWLtHW7s9gst64lmDdMIVikiYvTIg0eqlTDM/cr+BgCKuZr8wwZJiJw=
X-Received: by 2002:ac2:51ba:0:b0:4d8:63cd:bd26 with SMTP id
 f26-20020ac251ba000000b004d863cdbd26mr786397lfk.10.1677594653602; Tue, 28 Feb
 2023 06:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20230223113814.3010cedc@eldfell>
 <CAF6AEGuE89kuKTjjzwW1xMppcVw-M4-hcrtifed-mvsCA=cshQ@mail.gmail.com>
 <20230224112630.313d7b76@eldfell>
 <a47e2686-1e35-39a3-0f0c-6c3b9522f8ff@linux.intel.com>
 <20230224122403.6a088da1@eldfell>
 <582a9b92-d246-fce2-cf39-539d9a2db17f@linux.intel.com>
 <20230224130053.3f8939e2@eldfell>
 <c5d046d6-ab8e-2bc7-5110-dba78b91348b@linux.intel.com>
 <74e409dc-b642-779e-a755-b793c378e43a@amd.com>
 <CAF6AEGs_yzEj81yNP3KhmVP9Yo3rwTc5vntEVrm9tHw6+w1G_g@mail.gmail.com>
 <Y/0iM+ycUozaVbbC@intel.com>
 <CAF6AEGtXSEyyjELjGtPvnAN7mX+NwzngmB0PbKHsZqjTm-xYsg@mail.gmail.com>
 <CA+hFU4wtW6wNP2Y0e_iE6NhBSSfVRDxTBUk7kOUNHQPRXpSzrQ@mail.gmail.com>
 <CAF6AEGtaxbJ83sfviVWMic6Q8XoyhLvWCdtYwiSd8A4sV4ZXSQ@mail.gmail.com>
In-Reply-To: <CAF6AEGtaxbJ83sfviVWMic6Q8XoyhLvWCdtYwiSd8A4sV4ZXSQ@mail.gmail.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Tue, 28 Feb 2023 15:30:42 +0100
Message-ID: <CA+hFU4x0VrQwF4JJcfHNwXrCUF8kP0d=Nhy5bboy=u5pJAgekQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] dma-buf/sync_file: Support (E)POLLPRI
To: Rob Clark <robdclark@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 28, 2023 at 12:48=E2=80=AFAM Rob Clark <robdclark@gmail.com> wr=
ote:
>
> On Mon, Feb 27, 2023 at 2:44 PM Sebastian Wick
> <sebastian.wick@redhat.com> wrote:
> >
> > On Mon, Feb 27, 2023 at 11:20 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Mon, Feb 27, 2023 at 1:36 PM Rodrigo Vivi <rodrigo.vivi@intel.com>=
 wrote:
> > > >
> > > > On Fri, Feb 24, 2023 at 09:59:57AM -0800, Rob Clark wrote:
> > > > > On Fri, Feb 24, 2023 at 7:27 AM Luben Tuikov <luben.tuikov@amd.co=
m> wrote:
> > > > > >
> > > > > > On 2023-02-24 06:37, Tvrtko Ursulin wrote:
> > > > > > >
> > > > > > > On 24/02/2023 11:00, Pekka Paalanen wrote:
> > > > > > >> On Fri, 24 Feb 2023 10:50:51 +0000
> > > > > > >> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> > > > > > >>
> > > > > > >>> On 24/02/2023 10:24, Pekka Paalanen wrote:
> > > > > > >>>> On Fri, 24 Feb 2023 09:41:46 +0000
> > > > > > >>>> Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> > > > > > >>>>
> > > > > > >>>>> On 24/02/2023 09:26, Pekka Paalanen wrote:
> > > > > > >>>>>> On Thu, 23 Feb 2023 10:51:48 -0800
> > > > > > >>>>>> Rob Clark <robdclark@gmail.com> wrote:
> > > > > > >>>>>>
> > > > > > >>>>>>> On Thu, Feb 23, 2023 at 1:38 AM Pekka Paalanen <ppaalan=
en@gmail.com> wrote:
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> On Wed, 22 Feb 2023 07:37:26 -0800
> > > > > > >>>>>>>> Rob Clark <robdclark@gmail.com> wrote:
> > > > > > >>>>>>>>
> > > > > > >>>>>>>>> On Wed, Feb 22, 2023 at 1:49 AM Pekka Paalanen <ppaal=
anen@gmail.com> wrote:
> > > > > > >>>>>>
> > > > > > >>>>>> ...
> > > > > > >>>>>>
> > > > > > >>>>>>>>>> On another matter, if the application uses SET_DEADL=
INE with one
> > > > > > >>>>>>>>>> timestamp, and the compositor uses SET_DEADLINE on t=
he same thing with
> > > > > > >>>>>>>>>> another timestamp, what should happen?
> > > > > > >>>>>>>>>
> > > > > > >>>>>>>>> The expectation is that many deadline hints can be se=
t on a fence.
> > > > > > >>>>>>>>> The fence signaller should track the soonest deadline=
.
> > > > > > >>>>>>>>
> > > > > > >>>>>>>> You need to document that as UAPI, since it is observa=
ble to userspace.
> > > > > > >>>>>>>> It would be bad if drivers or subsystems would differ =
in behaviour.
> > > > > > >>>>>>>>
> > > > > > >>>>>>>
> > > > > > >>>>>>> It is in the end a hint.  It is about giving the driver=
 more
> > > > > > >>>>>>> information so that it can make better choices.  But th=
e driver is
> > > > > > >>>>>>> even free to ignore it.  So maybe "expectation" is too =
strong of a
> > > > > > >>>>>>> word.  Rather, any other behavior doesn't really make s=
ense.  But it
> > > > > > >>>>>>> could end up being dictated by how the hw and/or fw wor=
ks.
> > > > > > >>>>>>
> > > > > > >>>>>> It will stop being a hint once it has been implemented a=
nd used in the
> > > > > > >>>>>> wild long enough. The kernel userspace regression rules =
make sure of
> > > > > > >>>>>> that.
> > > > > > >>>>>
> > > > > > >>>>> Yeah, tricky and maybe a gray area in this case. I think =
we eluded
> > > > > > >>>>> elsewhere in the thread that renaming the thing might be =
an option.
> > > > > > >>>>>
> > > > > > >>>>> So maybe instead of deadline, which is a very strong word=
, use something
> > > > > > >>>>> along the lines of "present time hint", or "signalled tim=
e hint"? Maybe
> > > > > > >>>>> reads clumsy. Just throwing some ideas for a start.
> > > > > > >>>>
> > > > > > >>>> You can try, but I fear that if it ever changes behaviour =
and
> > > > > > >>>> someone notices that, it's labelled as a kernel regression=
. I don't
> > > > > > >>>> think documentation has ever been the authoritative defini=
tion of UABI
> > > > > > >>>> in Linux, it just guides drivers and userspace towards a c=
ommon
> > > > > > >>>> understanding and common usage patterns.
> > > > > > >>>>
> > > > > > >>>> So even if the UABI contract is not documented (ugh), you =
need to be
> > > > > > >>>> prepared to set the UABI contract through kernel implement=
ation.
> > > > > > >>>
> > > > > > >>> To be the devil's advocate it probably wouldn't be an ABI r=
egression but
> > > > > > >>> just an regression. Same way as what nice(2) priorities mea=
n hasn't
> > > > > > >>> always been the same over the years, I don't think there is=
 a strict
> > > > > > >>> contract.
> > > > > > >>>
> > > > > > >>> Having said that, it may be different with latency sensitiv=
e stuff such
> > > > > > >>> as UIs though since it is very observable and can be very p=
ainful to users.
> > > > > > >>>
> > > > > > >>>> If you do not document the UABI contract, then different d=
rivers are
> > > > > > >>>> likely to implement it differently, leading to differing b=
ehaviour.
> > > > > > >>>> Also userspace will invent wild ways to abuse the UABI if =
there is no
> > > > > > >>>> documentation guiding it on proper use. If userspace or en=
d users
> > > > > > >>>> observe different behaviour, that's bad even if it's not a=
 regression.
> > > > > > >>>>
> > > > > > >>>> I don't like the situation either, but it is what it is. U=
ABI stability
> > > > > > >>>> trumps everything regardless of whether it was documented =
or not.
> > > > > > >>>>
> > > > > > >>>> I bet userspace is going to use this as a "make it faster,=
 make it
> > > > > > >>>> hotter" button. I would not be surprised if someone wrote =
a LD_PRELOAD
> > > > > > >>>> library that stamps any and all fences with an expired dea=
dline to
> > > > > > >>>> just squeeze out a little more through some weird side-eff=
ect.
> > > > > > >>>>
> > > > > > >>>> Well, that's hopefully overboard in scaring, but in the en=
d, I would
> > > > > > >>>> like to see UABI documented so I can have a feeling of wha=
t it is for
> > > > > > >>>> and how it was intended to be used. That's all.
> > > > > > >>>
> > > > > > >>> We share the same concern. If you read elsewhere in these t=
hreads you
> > > > > > >>> will notice I have been calling this an "arms race". If the=
 ability to
> > > > > > >>> make yourself go faster does not required additional privil=
ege I also
> > > > > > >>> worry everyone will do it at which point it becomes pointle=
ss. So yes, I
> > > > > > >>> do share this concern about exposing any of this as an unpr=
ivileged uapi.
> > > > > > >>>
> > > > > > >>> Is it possible to limit access to only compositors in some =
sane way?
> > > > > > >>> Sounds tricky when dma-fence should be disconnected from DR=
M..
> > > > > > >>
> > > > > > >> Maybe it's not that bad in this particular case, because we =
are talking
> > > > > > >> only about boosting GPU clocks which benefits everyone (exce=
pt
> > > > > > >> battery life) and it does not penalize other programs like e=
.g.
> > > > > > >> job priorities do.
> > > > > > >
> > > > > > > Apart from efficiency that you mentioned, which does not alwa=
ys favor
> > > > > > > higher clocks, sometimes thermal budget is also shared betwee=
n CPU and
> > > > > > > GPU. So more GPU clocks can mean fewer CPU clocks. It's reall=
y hard to
> > > > > > > make optimal choices without the full coordination between bo=
th schedulers.
> > > > > > >
> > > > > > > But that is even not the main point, which is that if everyon=
e sets the
> > > > > > > immediate deadline then having the deadline API is a bit poin=
tless. For
> > > > > > > instance there is a reason negative nice needs CAP_SYS_ADMIN.
> > > > > > >
> > > > > > > However Rob has also pointed out the existence of uclamp.min =
via
> > > > > > > sched_setattr which is unprivileged and can influence frequen=
cy
> > > > > > > selection in the CPU world, so I conceded on that point. If C=
PU world
> > > > > > > has accepted it so can we I guess.
> > > > > > >
> > > > > > > So IMO we are back to whether we can agree defining it is a h=
int is good
> > > > > > > enough, be in via the name of the ioctl/flag itself or via do=
cumentation.
> > > > > > >
> > > > > > >> Drivers are not going to use the deadline for scheduling pri=
orities,
> > > > > > >> right? I don't recall seeing any mention of that.
> > > > > > >>
> > > > > > >> ...right?
> > > > > > >
> > > > > > > I wouldn't have thought it would be beneficial to preclude th=
at, or
> > > > > > > assume what drivers would do with the info to begin with.
> > > > > > >
> > > > > > > For instance in i915 we almost had a deadline based scheduler=
 which was
> > > > > > > much fairer than the current priority sorted fifo and in an i=
deal world
> > > > > > > we would either revive or re-implement that idea. In which ca=
se
> > > > > > > considering the fence deadline would naturally slot in and gi=
ve true
> > > > > > > integration with compositor deadlines (not just boost clocks =
and pray it
> > > > > > > helps).
> > > > > > How is user-space to decide whether to use ioctl(SET_DEADLINE) =
or
> > > > > > poll(POLLPRI)?
> > > > >
> > > > > Implementation of blocking gl/vk/cl APIs, like glFinish() would u=
se
> > > > > poll(POLLPRI).  It could also set an immediate deadline and then =
call
> > > > > poll() without POLLPRI.
> > > > >
> > > > > Other than compositors which do frame-pacing I expect the main us=
age
> > > > > of either of these is mesa.
> > > >
> > > > Okay, so it looks like we already agreed that having a way to bump =
frequency
> > > > from userspace is acceptable. either because there are already othe=
r ways
> > > > that you can waste power and because this already acceptable in the=
 CPU
> > > > world.
> > > >
> > > > But why we are doing this in hidden ways then?
> > > >
> > > > Why can't we have this hint per context that is getting executed?
> > > > (either with a boost-context flag or with some low/med/max or '-1' =
to '1'
> > > > value like the latency priority)?
> > > >
> > > > I don't like the waitboost because this heurisitic fails in some me=
dia cases.
> > > > I don't like the global setting because we might be alternating a t=
op-priority
> > > > with low-priority cases...
> > > >
> > > > So, why not something per context in execution?
> > > >
> > >
> > > It needs to be finer granularity than per-context, because not all
> > > waits should trigger boosting.  For example, virglrenderer ends up
> > > with a thread polling unsignaled fences to know when to signal an
> > > interrupt to the guest virtgpu.  This alone shouldn't trigger
> > > boosting.  (We also wouldn't want to completely disable boosting for
> > > virglrenderer.)  Or the usermode driver could be waiting on a fence t=
o
> > > know when to do some cleanup.
> > >
> > > That is not to say that there isn't room for per-context flags to
> > > disable/enable boosting for fences created by that context, meaning i=
t
> > > could be an AND operation for i915 if it needs to be.
> >
> > First of all, I believe that the fence deadline hint is a good idea.
> > With that being said, I also don't think it is sufficient in a lot of
> > cases.
> >
> > The one thing I was alluding to before and that Pekka mentioned as
> > well is that mutter for example has a problem where we're missing the
> > deadline consistently because the clocks don't ramp up fast enough and
> > there is a MR which is just trying to keep the GPU busy to avoid this.
>
> the dynamic double/triple buffer thing?

Yes

> > It would be much better if the kernel could make sure the clocks are
> > all ramped up when we start submitting work. In the compositor we
> > actually have a lot of information that *should* influence clocks. We
> > know when we're going to start submitting work and when the deadline
> > for that work is beforehand. We know which windows are visible, and
> > which one should have the highest priority.
>
> This sounds like something orthogonal.. something for cgroups?  Ie.
> android moves visible/foreground apps to a different cgroup to given
> them higher priority.  Tvrtko had a patchset to add drm cgroup
> support..

For the priority stuff, yes, probably. The visibility information on
the other hand could be used to determine if we want to ramp up the
GPU in the first place.

> > We know when there are
> > input events which actually matter.
>
> This I see input as a different boost source for the driver.  (Ie. one
> boost signal is missing fence deadlines, another is input events,
> etc.)
>
> We end up using downstream input-handlers on the kernel side for this.
> Partially for the freq boost (but mostly not, UI interactive workloads
> like touchscreen scrolling don't generally need high GPU freqs, they
> are more memory bandwidth limited if they are limited by anything)..
> really the reason here is to get a head-start on the ~2ms that it
> takes to power up the GPU if it is suspended.

Right, but one of my main points I want to make here is that we could
get the head-start not only in response to input events but also for
the GPU work the compositor submits and in the future also to GPU work
that clients commit. Except that we don't have a way to tell the
kernel about it.

> But this is not quite perfect, since for example some keys should be
> handled on key-down but others on key-up.
>
> But again, this is something different from fence deadlines.  I'm
> interested in proposals because we do need something for this.  But I
> think it is something is orthogonal to this series.  For input, we
> want the kernel to know long before userspace is ready to submit
> rendering.

We can do that in the compositor! Input events are really not
something you should care about in the kernel. Input itself is also
not the only indication of incoming animated content. Some network
packets arriving could equally well result in the same situation.

> > We know when the deadline for
> > client work is.
> >
> > In the future we also want to make sure clients know beforehand when
> > they should start their work and when the deadline is but that's all
> > very much WIP in both wayland and vulkan.
> >
> > There are two issues:
> >
> > 1. The compositor has no way to communicate any of that information to
> > the kernel.
> > 2. The only connection to client work the compositor has is a fence to
> > the last bit of work that must be done before the deadline after a
> > wl_surface.commit.
>
> If the client isn't using multiple GPUs, a single fence should be
> sufficient.  And even if it is, well we still have all the dependency
> information on the kernel side.  Ie. drm/sched knows what fences it is
> waiting on if it is waiting to schedule the work associated with the
> last fence.  It would otherwise require drm/sched to be a bit more
> tricky than it is so far in this series.
>
> But I think the normal dual-gpu case, the app is only dealing with a sing=
le GPU?

We generally don't know which GPU a client uses though. We know which
one we're using and tell the client that the buffer should be
compatible with it but that's the extent of information we have, until
we get a fence but that fence usually gets to the compositor pretty
late. Way too late for the compositor to tell the kernel to ramp up
the GPU and still have an impact.

It also seems like we're moving away from tracking execution
dependencies with fences when we're switching to user mode fences.

> > So in both cases a fence is just not the right primitive for us. We
> > need to be able to provide per-context/queue information for work that
> > will happen in the future and we need a way to refer to a
> > context/queue generically and over IPC to boost the clocks of the
> > device that a client is actually using and maybe even give priority.
> >
> > But like I said, having a per-fence deadline is probably still a good
> > idea and doesn't conflict with any of the more coarse information.
>
> Yeah, I think the thing is you need multiple things, and this is only
> one of them ;-)
>
> BR,
> -R
>

