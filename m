Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 563AC75E5C6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 01:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A57310E0A8;
	Sun, 23 Jul 2023 23:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DC010E0A8;
 Sun, 23 Jul 2023 23:54:48 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-52229d3b8c8so931659a12.2; 
 Sun, 23 Jul 2023 16:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690156487; x=1690761287;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZIT+hSMafkg++eE44gK8LEvrBC1icuncW2J+Pf4/L80=;
 b=ZO7wxRHl1bT/4i+iOouXAMTcpShANRl/Kj9440bykG3Dv7tg+xdYCRWXuFLwMyYkPh
 tkzf4xXIjhMh6Aen7KX/SIsgveiIz+vcsvch2N6khrdisapCoEMS/62azvWnmVksGDqb
 I3jJ9XF5tj+2JHikIxAu/ViZddt4EZtFGfFjC3gGwqYYF/BNiN/vZoDSRcjwkPyI7oyJ
 60tde6X9wh30Ivlthv6O2jcjQ4qthJrRiEv8Ft3MQBF9Y8JjPWePl0VbBowBAR1ahvLC
 zNFoMZQfuWAAtoO1j1gujHTpcBQzR3qNPn+6p/35g0Xdv6Zupfdm2Mcd0nGs7rLZ5Rgr
 sq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690156487; x=1690761287;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZIT+hSMafkg++eE44gK8LEvrBC1icuncW2J+Pf4/L80=;
 b=D9QDAjvSHuVkyK8nEX+n7Rr3+N7gOCorer/Gq3fSOHYrZkW+Y+YGilm/SLVZ8MRxnN
 n3j88nHw5SXDiBeJ8sjn5X3W2orsEORah0nnemwvztCEaHaNQLgagc3XKkNbS3ThFnMD
 ehcsTrDdMyMZoDUr7ajbs+6ocvb82mcbu5R1G0PSVNgV2DFVw5lYIizC4bIV5EISZhLj
 ZzNBgIv2TJxYhYKi4ukauvXVD7egmVuPVyo41McWF7IQ3BOEqI5v1n6hHB+mqLI0rVbl
 Qbmqe/zFXsHtU75dzsE5Yg//rGTgxFWQHJ89i1Hz+CyY5vSjylGcBqhldN3GdgaWSGDV
 Crvw==
X-Gm-Message-State: ABy/qLbgUXdXNRHrVQJMI6sLWE32YpsmOq20db/fTYX/h7f4Kq4ZnAS7
 osaOuDOLC/zHL/lFmBjJ54O0ygz3wEU1xWX4o4k=
X-Google-Smtp-Source: APBJJlGVH6e+Cmznbgs7azX60lZYUZNxmpCjiTEvV0Fem9YUEz3NQ0NgyP51NP4kNMRRzgXDd+APqGYJ5wmdpTo/s5U=
X-Received: by 2002:a17:906:77dd:b0:994:539d:f983 with SMTP id
 m29-20020a17090677dd00b00994539df983mr6921287ejn.23.1690156486697; Sun, 23
 Jul 2023 16:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230720001443.2380-1-dakr@redhat.com>
 <20230720001443.2380-12-dakr@redhat.com>
 <CAOFGe945tp344=g-++=EAT89t0qJHZ=3yeW-k9OTbGNJodvwAg@mail.gmail.com>
In-Reply-To: <CAOFGe945tp344=g-++=EAT89t0qJHZ=3yeW-k9OTbGNJodvwAg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 24 Jul 2023 09:54:34 +1000
Message-ID: <CAPM=9tyQQTn=+Af1kWySde75T=MLFeboTErLv3NxqtQ8pvqtzA@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next v8 11/12] drm/nouveau: implement new VM_BIND
 uAPI
To: Faith Ekstrand <faith@gfxstrand.net>
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, boris.brezillon@collabora.com,
 Danilo Krummrich <dakr@redhat.com>, bskeggs@redhat.com, tzimmermann@suse.de,
 Liam.Howlett@oracle.com, bagasdotme@gmail.com, christian.koenig@amd.com,
 jason@jlekstrand.net, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 23 Jul 2023 at 01:12, Faith Ekstrand <faith@gfxstrand.net> wrote:
>
> On Wed, Jul 19, 2023 at 7:15=E2=80=AFPM Danilo Krummrich <dakr@redhat.com=
> wrote:
>>
>> This commit provides the implementation for the new uapi motivated by th=
e
>> Vulkan API. It allows user mode drivers (UMDs) to:
>>
>> 1) Initialize a GPU virtual address (VA) space via the new
>>    DRM_IOCTL_NOUVEAU_VM_INIT ioctl for UMDs to specify the portion of VA
>>    space managed by the kernel and userspace, respectively.
>>
>> 2) Allocate and free a VA space region as well as bind and unbind memory
>>    to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
>>    UMDs can request the named operations to be processed either
>>    synchronously or asynchronously. It supports DRM syncobjs
>>    (incl. timelines) as synchronization mechanism. The management of the
>>    GPU VA mappings is implemented with the DRM GPU VA manager.
>>
>> 3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl. The
>>    execution happens asynchronously. It supports DRM syncobj (incl.
>>    timelines) as synchronization mechanism. DRM GEM object locking is
>>    handled with drm_exec.
>>
>> Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, use the DRM
>> GPU scheduler for the asynchronous paths.
>
>
> IDK where the best place to talk about this is but this seems as good as =
any.
>
> I've been looking into why the Vulkan CTS runs about 2x slower for me on =
the new UAPI and I created a little benchmark to facilitate testing:
>
> https://gitlab.freedesktop.org/mesa/crucible/-/merge_requests/141
>
> The test, roughly, does the following:
>  1. Allocates and binds 1000 BOs
>  2. Constructs a pushbuf that executes a no-op compute shader.
>  3. Does a single EXEC/wait combo to warm up the kernel
>  4. Loops 10,000 times, doing SYNCOBJ_RESET (fast), EXEC, and then SYNCOB=
J_WAIT and times the loop
>
> Of course, there's a bit of userspace driver overhead but that's negledga=
ble.
>
> If you drop the top patch which allocates 1k buffers, the submit time on =
the old uAPI is 54 us/exec vs. 66 us/exec on the new UAPI. This includes th=
e time to do a SYNCOBJ_RESET (fast), EXEC, and SYNCOBJ_WAIT. The Intel driv=
er, by comparison, is 33us/exec so it's not syncobj overhead. This is a bit=
 concerning (you'd think the new thing would be faster) but what really has=
 me concerned is the 1k buffer case.
>
> If you include the top patch in the crucible MR, it allocates 1000 BOs an=
d VM_BINDs them. All the binding is done before the warmup EXEC. Suddenly, =
the submit time jumps to 257 us/exec with the new UAPI. The old UAPI is muc=
h worse (1134 us/exec) but that's not the point. Once we've done the first =
EXEC and created our VM bindings, the cost per EXEC shouldn't change at all=
 based on the number of BOs bound.  Part of the point of VM_BIND is to get =
all that binding logic and BO walking off the EXEC path.
>
> Normally, I wouldn't be too worried about a little performance problem li=
ke this. This is the first implementation and we can improve it later. I ge=
t that. However, I suspect the solution to this problem involves more UAPI =
and I want to make sure we have it all before we call this all done and dus=
ted and land it.
>
> The way AMD solves this problem as well as the new Xe driver for Intel is=
 to have a concept of internal vs. external BOs. Basically, there's an INTE=
RNAL bit specified somewhere in BO creation that has a few userspace implic=
ations:
>  1. In the Xe world where VMs are objects, INTERNAL BOs are assigned a VM=
 on creation and can never be bound to any other VM.
>  2. Any attempt to export an INTERNAL BO via prime or a similar mechanism=
 will fail with -EINVAL (I think?).

Okay I've done a first pass at implementing this,

https://gitlab.freedesktop.org/nouvelles/kernel/-/commit/005a0005ff80ec85f3=
e9a314cae0576b7441076c

Danilo we should probably pick that up for the next iteration. with
corresponding mesa work it gets the latency for me from 180us down to
70us.

Dave.
