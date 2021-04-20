Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2458A36581E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 13:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55586E7F5;
	Tue, 20 Apr 2021 11:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22B06E7F5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 11:52:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B4A6613BC;
 Tue, 20 Apr 2021 11:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618919561;
 bh=lLkO2/PkO+bhgVGsPzjcfwOkNWdX1bKmFUUP9AKrk3g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OipHbKnYeUn8mSFmquef9HjnEZLVmvx3TNs9yqZmXi/SpT1FKUrAdlQDDYigznhJj
 82nhesndHJF+I20ktltRDKvCXARhYYPIpIYpY31f3h6pweHK0ir4a6oURBE7vMYN9A
 R9J6cM0KhDGrMM5puM23cu3KM3UhVYwW8eOCEa0OV61xJlnxzLDdouFYS/2nyqZvsv
 Enx8/783XySF4OuGqyNx3qDEmd8LsGlHdYXwxdmqGXW+6Prnxbwg43XSHLGAM6lgE3
 SagaZuH8fdcfl9LsMSAa+MNp3kPAp3dhJdKDDwseXH9rzot0FSjdkfukjRQpSKdHnY
 Tap2Mp7Xn3XFA==
Date: Tue, 20 Apr 2021 14:52:26 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Peter.Enderborg@sony.com
Subject: Re: [PATCH v5] dma-buf: Add DmaBufTotal counter in meminfo
Message-ID: <YH7AeqqNyNnY0Zi3@kernel.org>
References: <20210417163835.25064-1-peter.enderborg@sony.com>
 <YH6Xv00ddYfMA3Lg@phenom.ffwll.local>
 <176e7e71-59b7-b288-9483-10e0f42a7a3f@sony.com>
 <YH6h16hviixphaHV@kernel.org>
 <b57a33a3-a5ed-c122-e5b9-c7e7c4dae35f@sony.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b57a33a3-a5ed-c122-e5b9-c7e7c4dae35f@sony.com>
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
Cc: mhocko@suse.com, neilb@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, adobriyan@gmail.com,
 linaro-mm-sig@lists.linaro.org, shakeelb@google.com, willy@infradead.org,
 samitolvanen@google.com, songmuchun@bytedance.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 christian.koenig@amd.com, guro@fb.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 10:45:21AM +0000, Peter.Enderborg@sony.com wrote:
> On 4/20/21 11:41 AM, Mike Rapoport wrote:
> > Hello Peter,
> >
> > On Tue, Apr 20, 2021 at 09:26:00AM +0000, Peter.Enderborg@sony.com wrot=
e:
> >> On 4/20/21 10:58 AM, Daniel Vetter wrote:
> >>> On Sat, Apr 17, 2021 at 06:38:35PM +0200, Peter Enderborg wrote:
> >>>> This adds a total used dma-buf memory. Details
> >>>> can be found in debugfs, however it is not for everyone
> >>>> and not always available. dma-buf are indirect allocated by
> >>>> userspace. So with this value we can monitor and detect
> >>>> userspace applications that have problems.
> >>>>
> >>>> Signed-off-by: Peter Enderborg <peter.enderborg@sony.com>
> >>> So there have been tons of discussions around how to track dma-buf and
> >>> why, and I really need to understand the use-cass here first I think.=
 proc
> >>> uapi is as much forever as anything else, and depending what you're d=
oing
> >>> this doesn't make any sense at all:
> >>>
> >>> - on most linux systems dma-buf are only instantiated for shared buff=
er.
> >>>   So there this gives you a fairly meaningless number and not anything
> >>>   reflecting gpu memory usage at all.
> >>>
> >>> - on Android all buffers are allocated through dma-buf afaik. But the=
re
> >>>   we've recently had some discussions about how exactly we should tra=
ck
> >>>   all this, and the conclusion was that most of this should be solved=
 by
> >>>   cgroups long term. So if this is for Android, then I don't think ad=
ding
> >>>   random quick stop-gaps to upstream is a good idea (because it's a p=
retty
> >>>   long list of patches that have come up on this).
> >>>
> >>> So what is this for?
> >> For the overview. dma-buf today only have debugfs for info. Debugfs
> >> is not allowed by google to use in andoid. So this aggregate the infor=
mation
> >> so we can get information on what going on on the system.=A0
> >  =

> > Can you send an example debugfs output to see what data are we talking
> > about?
> =

> Sure. This is on a idle system. Im not sure why you need it.The problem i=
s partly that debugfs is
> not accessable on a commercial device.

I wanted to see what kind of information is there, but I didn't think it's
that long :)
 =

> Dma-buf Objects:
> size=A0=A0=A0 =A0=A0=A0 flags=A0=A0 =A0=A0=A0 mode=A0=A0=A0 =A0=A0=A0 cou=
nt=A0=A0 =A0=A0=A0 exp_name=A0=A0=A0 =A0=A0=A0 buf name=A0=A0=A0 ino=A0=A0=
=A0=A0
> 00032768=A0=A0=A0 00000002=A0=A0=A0 00080007=A0=A0=A0 00000002=A0=A0=A0 i=
on-system-1006-allocator-servi=A0=A0=A0 dmabuf17728=A0=A0=A0 07400825=A0=A0=
=A0 dmabuf17728
> =A0=A0=A0 Attached Devices:
> Total 0 devices attached
> =

> 11083776=A0=A0=A0 00000002=A0=A0=A0 00080007=A0=A0=A0 00000003=A0=A0=A0 i=
on-system-1006-allocator-servi=A0=A0=A0 dmabuf17727=A0=A0=A0 07400824=A0=A0=
=A0 dmabuf17727
> =A0=A0=A0 Attached Devices:
> =A0=A0=A0 ae00000.qcom,mdss_mdp:qcom,smmu_sde_unsec_cb
> Total 1 devices attached
> =

> 00032768=A0=A0=A0 00000002=A0=A0=A0 00080007=A0=A0=A0 00000002=A0=A0=A0 i=
on-system-1006-allocator-servi=A0=A0=A0 dmabuf17726=A0=A0=A0 07400823=A0=A0=
=A0 dmabuf17726
> =A0=A0=A0 Attached Devices:
> Total 0 devices attached
> =

> 11083776=A0=A0=A0 00000002=A0=A0=A0 00080007=A0=A0=A0 00000002=A0=A0=A0 i=
on-system-1006-allocator-servi=A0=A0=A0 dmabuf17725=A0=A0=A0 07400822=A0=A0=
=A0 dmabuf17725
> =A0=A0=A0 Attached Devices:
> =A0=A0=A0 ae00000.qcom,mdss_mdp:qcom,smmu_sde_unsec_cb
> Total 1 devices attached

...

> Total 654 objects, 744144896 bytes
 =

Isn't the size from the first column also available in fdinfo?

Is there anything that prevents monitoring those?

-- =

Sincerely yours,
Mike.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
