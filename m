Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEAA625324
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 06:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1588710E009;
	Fri, 11 Nov 2022 05:39:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB07510E009;
 Fri, 11 Nov 2022 05:39:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4D6D9B823DD;
 Fri, 11 Nov 2022 05:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB31C433C1;
 Fri, 11 Nov 2022 05:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668145160;
 bh=4WyU6wZydtLH9EzoO7VQVBOwfi9ty//0BkyFJCH/dvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R/WTQakoWJj24jD4lJg8roZAlKHQqmc10FW5keNKKVc+U2nE/LR7QclD3hblVAph9
 VRtuHZG8vc2CjKAbj5VDrlEhuY9sf3ol0rIqrZLYSuEtWxhz1rMYx4vPatwgUw9xBg
 9i7DwDafpCaLPI84kU8zGfjsINWemRaxwuKFQ3xorLvCoNhle+AkxbtyXmZ7iIPrqg
 IMw856ECTDVReyoZuFg4/6EiiPDCOYgg4jnOIg1f+LHWYCGXdt2mOy16Ive/Ni0bic
 ZLPfbk4aXelwwBxJxVQKheDtFhWFYwTDysXtVbQfeGoiwFxhK3cWJ1p8aEK1IhJkHV
 HWBhzycrxjcGg==
Date: Thu, 10 Nov 2022 23:39:02 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [RFC] Approaches to deal with a struct with multiple fake
 flexible arrays members
Message-ID: <Y23f9u6wQjwj1cRL@work>
References: <Y2siZmiTD40mTYpJ@mail.google.com> <Y2xJxUnDnesWYckj@work>
 <Y2xUc9Q/+zTYbjaL@mail.google.com>
 <CADnq5_NKeqFm9ysEC78gYFL_PKzgSfXBa6v6rB+sE8aYZffqfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_NKeqFm9ysEC78gYFL_PKzgSfXBa6v6rB+sE8aYZffqfA@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
 linux-hardening@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 09, 2022 at 10:20:34PM -0500, Alex Deucher wrote:
> On Wed, Nov 9, 2022 at 8:31 PM Paulo Miguel Almeida
> <paulo.miguel.almeida.rodenas@gmail.com> wrote:
> >
> > On Wed, Nov 09, 2022 at 06:45:57PM -0600, Gustavo A. R. Silva wrote:
> > > On Wed, Nov 09, 2022 at 04:45:42PM +1300, Paulo Miguel Almeida wrote:
> > >
> > > Adding Alex, Christian and DRM lists to the thread.
> >
> > Thanks so much for your reply Gustavo
> > Yep, that's a good idea.
> >
> > >
> > > > struct _ATOM_INIT_REG_BLOCK {
> > > >     USHORT                     usRegIndexTblSize;    /*     0     2 */
> > > >     USHORT                     usRegDataBlkSize;     /*     2     2 */
> > > >     ATOM_INIT_REG_INDEX_FORMAT asRegIndexBuf[1];     /*     4     3 */
> > > >     ATOM_MEMORY_SETTING_DATA_BLOCK asRegDataBuf[1];  /*     7     8 */
> > >
> > > I didn't find evidence that asRegDataBuf is used anywhere in the
> > > codebase[1].
> > > ...
> > > <snip>
> > > ...
> > > As I pointed out above, I don't see asRegDataBuf[] being used in the
> > > codebase (of course it may describe firmware memory layout). Instead,
> > > there is this jump to a block of data past asRegIndexBuf[]:
> > >
> > > drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1444:
> > > 1444: ATOM_MEMORY_SETTING_DATA_BLOCK *reg_data =
> > > 1445:         (ATOM_MEMORY_SETTING_DATA_BLOCK *)
> > > 1446:         ((u8 *)reg_block + (2 * sizeof(u16)) +
> > > 1447:                  le16_to_cpu(reg_block->usRegIndexTblSize));
> > >
> > > So, it seems the one relevant array, from the kernel side, is
> > > asRegIndexBuf[]. I wonder if we really need asRegDataBuf[] in that
> > > structure... or if we could try modifying that struct and only have
> > > asRegIndexBuf[] as last member? and then we can transform it into a
> > > flex-array member.
> >
> > I saw that one too. That would be the way it's currently accessing
> > asRegDataBuf member as the existing struct would make asRegDataBuf[0] point
> > to some index within the asRegIndexBuf member (as you probably got it too)
> >
> > you are right... asRegDataBuff isn't used from a static analysis
> > point of view but removing it make the code a bit cryptic, right?
> >
> > That's pickle, ay? :-)
> >
> > >
> > > If for any strong reasong we cannot remove asRegDataBuf[] then I think we
> > > could give it a try and use DECLARE_FLEX_ARRAY() to declare both arrays
> > > in the structure.
> > >
> >
> > Out of curiosity, why both rather than just asRegIndexBuf?

Because if I understand the code and Alex's reply below correctly, both
arrays are being used to describe data of variable size, and both arrays
need to stay. The situation is that it'd be _strange_ to transform just
one of them into a flex-array member and not the other, and at the same
time a flex-array member may only appear as the last member of a
struct, and it's not _great_ to have more than one flex-array member
in a struct --in fact, we can't.

DECLARE_FLEX_ARRAY() was originally designed to have flex-array members
in unions. This is, we can declare multiple flex-array members as long as
they all share the same address. Unfortunately, this is not the case with
asRegIndexBuf[] and asRegDataBuf[], and I don't see[1] DECLARE_FLEX_ARRAY()
working in this case. So, nope, we cannot use it to declare both arrays
and we also cannot have a flex-array in the middle of a struct, so we
cannot use it to declare asRegIndexBuf[] alone. :/

On the other hand, I fail to see how the current state of the code is
problematic for things like -fstrict-flex-arrays, right now. asRegDataBuf[]
is not being used for anything in the kernel, and asRegIndexBuf[] is
correctly being accessed through it's only valid index zero, after which
is decays into a pointer[2].

That struct is definitely not great (I don't love it), but we might try
to explore other cases while we determine how and if we ultimately need
to modify it.

I'll open an issue for this in the bug tracker, so we keep an eye on it.
:)

> >
> > > But first, of course, Alex, Christian, it'd be really great if we can
> > > have your input and feedback. :)
> 
> This header describes the layout of memory stored in the ROM on the
> GPU.  It's shared between vbios and driver so some parts aren't
> necessarily directly used by the driver.  As for what to do about it,
> I'm not sure.  This structure stores a set of register offsets
> (asRegIndexBuf) and data values (asRegDataBuf) for specific operations
> (e.g., walk this structure and program register X with value Y.  For a
> little background on atombios, it's a set of data and command tables
> stored in the vbios ROM image.  The driver has an interpreter for the
> command tables (see atom.c) so it can parse the command tables to
> initialize the asic to a usable state.  The various programming
> sequences vary depending on the components the AIB/OEM uses for the
> board (different vram vendors, different clock/voltage settings,
> etc.).  The legacy VGA/VBE and the GOP driver and the OS driver can
> use these tables, so this allows us to initialize any GPU in a generic
> way on any architecture even if the platform firmware doesn't post the
> card.  For the most part the driver doesn't have to deal with these
> particular tables directly, other than for some very specific cases
> where the driver needs to grab some elements from the tables to
> populate the power management controller for GPU memory reclocking
> parameters.  However, the command tables as interpreted by the parser
> very often will directly parse these tables.  So you might have a
> command table that the driver executes to initialize some part of the
> GPU which ultimately fetches the table from the ROM image and walks it
> programming registers based on the offset and values in that table.
> So if you were debugging something that involves the atombios parser
> and walking through one of the command tables, you may be confused if
> the data tables don't match what header says.  So ideally, we'd keep
> both arrays.

Thanks a lot for the input, Alex.
--
Gustavo

[1] https://godbolt.org/z/sxa7K9Erd
[2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c#L1448
