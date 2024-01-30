Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EE7842BF1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 19:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C5C11341E;
	Tue, 30 Jan 2024 18:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF16611341E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 18:39:24 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dc61fd6ba8cso3108167276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1706639904; x=1707244704;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LG5gyFtkumsLYd2rAi8MEfEgvn+yRGh3reIVJo/WaZk=;
 b=e8qJMtpCFsICOM72MmGhhnJzwEs2Wwsk60aAV6iMndbcHvd8h2lAvxvINMPtZ5DlDa
 cnuStJsY+dVKf7naDhv0VotkuiKLCNFDO5x/MN+hEu0ApDQ4iGg/Z1wq2Hopp1nXXw0j
 Pw9+dHRxJGfNxGnDhBFM8BmTK/ZH9W9fh0iTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706639904; x=1707244704;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LG5gyFtkumsLYd2rAi8MEfEgvn+yRGh3reIVJo/WaZk=;
 b=wqt/njnVmrYgcwVj03xFPXKLIHs6LqKB9YSV44aHYt54l7gu3B+vSTkkyvY0N6v80o
 vCG42S3132N5HuTSu5Dsjgw/NGOXf64UYzWf5eMDs75QEAgs5khwYP9f9y105BZQNWJn
 8uQDSRu0Gq4a1rITYy2S+zhECzpSrbWaou1b5IXNhdOX4DpoPy+ZUYONLL7sx7cm2T1U
 0nKoLu/VbyFD+GMOulA4LdmSYPJqab8ROEGmb7p1/XpIR4f2zpwA3kXXNVVtHvICXJaJ
 dWDFSNaK7RSQfgIbdomNZjRmeZ2Z3R1aoWjHvj81NhB4egFKpdRvshhKZXE8/7ndY1N6
 sVIQ==
X-Gm-Message-State: AOJu0YzaAzmomBUUDyPxwLjGoBiq4w0msvEaFYDYemVItQOmyTfsjVLE
 7kqY/byn4yh4gHACPnMhzHr4cZmfFJjpDiyxvGoGb58f7fX9z4agke0QAclPHm0D92uVYzUpwcd
 nkVknZeB54CMgPMNM8+pPQcmdMNzem+WV9J7P
X-Google-Smtp-Source: AGHT+IFno34m+jP2iGLD2By4ZRnEoI2pNruJ2J60MQLxAyDx7Afkqc+mbc3eZNZWnOh+GR+PK7PjMeUgn6h22nV6hQE=
X-Received: by 2002:a25:81cd:0:b0:dc2:19ec:77ad with SMTP id
 n13-20020a2581cd000000b00dc219ec77admr5304988ybm.21.1706639903861; Tue, 30
 Jan 2024 10:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20240112203803.6421-1-ian.forbes@broadcom.com>
 <3d7f835a-eed8-4d98-9539-68061779f285@suse.de>
 <CABQX2QMUfZMNRN-RfVhvZzkGhn4zRY-B51Ph_KYzXWmZ_8tfAQ@mail.gmail.com>
 <613cf732-fc95-4f61-b64d-772206460535@suse.de>
In-Reply-To: <613cf732-fc95-4f61-b64d-772206460535@suse.de>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 30 Jan 2024 13:38:12 -0500
Message-ID: <CABQX2QP8nLpM6e3D3qQASvbxr1DDON1dq=s+iNBcczhSJu8Ggg@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Filter modes which exceed 3/4 of graphics
 memory.
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Ian Forbes <ian.forbes@broadcom.com>, maaz.mombasawala@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 martin.krastev@broadcom.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 19, 2024 at 4:22=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 18.01.24 um 19:25 schrieb Zack Rusin:
> > On Mon, Jan 15, 2024 at 3:21=E2=80=AFAM Thomas Zimmermann <tzimmermann@=
suse.de> wrote:
> >>
> >> Hi
> >>
> >> Am 12.01.24 um 21:38 schrieb Ian Forbes:
> >>> SVGA requires surfaces to fit within graphics memory (max_mob_pages) =
which
> >>> means that modes with a final buffer size that would exceed graphics =
memory
> >>> must be pruned otherwise creation will fail.
> >>>
> >>> Additionally, device commands which use multiple graphics resources m=
ust
> >>> have all their resources fit within graphics memory for the duration =
of the
> >>> command. Thus we need a small carve out of 1/4 of graphics memory to =
ensure
> >>> commands likes surface copies to the primary framebuffer for cursor
> >>> composition or damage clips can fit within graphics memory.
> >>>
> >>> This fixes an issue where VMs with low graphics memory (< 64MiB) conf=
igured
> >>> with high resolution mode boot to a black screen because surface crea=
tion
> >>> fails.
> >>
> >> That is a long-standing problem, which we have observed with other
> >> drivers as well. On low-memory devices, TTM doesn't play well. The rea=
l
> >> fix would be to export all modes that possibly fit and sort out the
> >> invalid configurations in atomic_check. It's just a lot more work.
> >>
> >> Did you consider simply ignoring vmwgfx devices with less than 64 MiB =
of
> >> VRAM?
> >
> > Unfortunately we can't do that because on new esx servers without
> > gpu's the default is 16MB. A lot of people are still running their esx
> > boxes with 4MB, which is in general the most common problem because
> > with 4MB people still tend to like to set 1280x800 which with 32bpp fb
> > takes 4096000 bytes and with 4MB available that leaves only 96KB
> > available and we need more to also allocate things like the cursor.
> > Even if ttm did everything right technically 1280x800 @ 32bpp
> > resolution will fit in a 4MB graphics memory, but then the system will
> > not be able to have a hardware (well, virtualized) cursor. It's
> > extremely unlikely people would even be aware of this tradeoff when
> > making the decision to increase resolution.
>
> Do you allocate buffer storage directly in the provided VRAM? If so how
> do you do page flips then? You'd need for the example of 1280x800-32,
> you'd need around 8 MiB to keep front and back buffer in VRAM. I guess,
> you only support the framebuffer console (which doesn't do pageflips)?

In general, yes. Of course it's a little more convoluted because we'll
act like OpenGL runtime here (i.e. glXSwapBuffers), i.e. our driver
will fake page-flips because the only memory we'll have is a single
buffer as the actual page-flipping happens in the presentation code on
the host. So the guest is not aware of the actual presentation (it's
also why we don't have any sort of vblank signaling in vmwgfx, the
concept just doesn't exist for us). i.e. on para-virtualized drivers
the actual page-flips will be property of the presentation code that's
outside of the guest. It's definitely one those things that I wanted
to have a good solution for in a while, in particular to have a better
story behind vblank handling, but it's difficult because
"presentation" on vm's is in general difficult to define - it might be
some vnc connected host on the other continent. Having said that
that's basically a wonky VRR display so we should be able to handle
our presentation as VRR and give more control of updates to the guest,
but we haven't done it yet.

> In mgag200 and ast, I had the luxury for replacing TTM with SHMEM
> helpers, which worked around the problem easily. Maybe that's an option
> for low-memory systems?

Our current device doesn't have the ability to present out of
unspecified memory in the guest, i.e. the host, which is doing the
presentation, is not aware of how guest kernel lays out the memory so
we need to basically create a page-table for every graphics object
(VMW_PL_MOB placement in vmwgfx) so that the host can actually find
the memory it needs to read. So the shmem helpers would need something
extra for us to be able to generate those page tables for the
drm_gem_object's it deals with.

z
