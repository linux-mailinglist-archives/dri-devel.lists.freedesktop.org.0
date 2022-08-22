Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B2859B9FD
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 09:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2759E8DB25;
	Mon, 22 Aug 2022 07:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431729778A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 07:05:41 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e20so11498424wri.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 00:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=Dxb7f9akNNn7a66rEoznohCFnfLWwpi1a1nTawEG7MA=;
 b=q0PQNE8ehCL4Xj1+5UlxixcbdxeFAygScb5xCxvcHHrAe7e1Oa6TwoJhwYSlGGp0qV
 c7N2a4C4zhYy/LBGkT2u+xtQyg4WfO+kPEL9bPPNSPhgUY+Xdb1PEmI2oIkQfgvObQng
 bcZFFOdIZEwK2BHcc0SmFVr9EYndokSJeiXq7YNKX54Ewx4ORCX5iOzqpfzmzx4K2QZM
 2tdxHE6IWncjhVqRKFODcHdUdnxGdFs5QwUZWjS7DmtmMKxXVp1Vhv9NT3jsUBoTrvf1
 U4t3K8bfCwn56AlvhqQQxX7GE11ZxWw98hR9zFAKNtOlALxq3Gj7D7TGuiYBUyan0kVd
 XHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=Dxb7f9akNNn7a66rEoznohCFnfLWwpi1a1nTawEG7MA=;
 b=efN3+ZRtuC3phBjrR4wuPFK42w799OlPVdCF9hTyPMgAS+mst907tvCuZ2zsBosPpS
 ljKoCNGBx9yH3PPydu0JuxPrk1VfjomvQ9Q+12i5/+w+syvK+5EHhJtYpgYulPwzGPYx
 wDAF+XoC5thmnG4mI3kgzVLT7fRl7lPd3c/CDwsJ74bjW4ChJgUe4VydTznGJ3ZBJ8IQ
 Q948L77V9dHSwKqEjmqQNtd3F5FTW4zuQra2F4heA3MreXZF/Hwhm9r7zzRVvn2kCrEY
 DdktDqYLh11wXqlW+4rB22kDCNwFVUXx6m7OBDZmGxdB78nIlWLv4jdgk/QMY/HHl93M
 vOoA==
X-Gm-Message-State: ACgBeo3hGMIfDYx7ooPHzQAaGWArx6ZB5kXOJ/2/yJINzr/8NscfN0eC
 Bc4Iy4Kx/ea+lan/xmmaNcgx50evTeMILKo/NAVRJMMH
X-Google-Smtp-Source: AA6agR7GmIyRIPICLxInhL5Ov7LP7/E0zYHF2DLwDWrsUdTPu02ATRMg3HNTsXNsm896RFPLTETIr/bdS4pathbQoJA=
X-Received: by 2002:adf:e68f:0:b0:225:337c:f710 with SMTP id
 r15-20020adfe68f000000b00225337cf710mr8516892wrm.555.1661151939252; Mon, 22
 Aug 2022 00:05:39 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 22 Aug 2022 17:05:27 +1000
Message-ID: <CAPM=9tzo4n7xKnU+2=gesdLqDJUQ7kBAVCQND6yu5_CTiKo7Cg@mail.gmail.com>
Subject: vm binding interfaces and parallel with mmap
To: dri-devel <dri-devel@lists.freedesktop.org>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, 
 Jason Ekstrand <jason@jlekstrand.net>, Matthew Brost <matthew.brost@intel.com>,
 Ben Skeggs <skeggsb@gmail.com>, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

I've just been looking at the vm bind type interfaces and wanted to at
least document how we think the unmapping API should work. I know I've
talked on irc before about this, but wanted to solidify things a bit
more around what is required vs what is a nice to have.

My main concerns/thoughts are around the unbind interfaces and how
close to munmap they should be.

I think the mapping operation is mostly consistent
MAP(bo handle, offset into bo, range, VM offset, VM flags)
which puts the range inside to bo at the offset in the current VM
(maybe take an optional vm_id).

now the simplest unmap I can see if one that parallel munmap
UNMAP(vmaddr, range);

But it begs the question on then how much the kernel needs to deal
with here, if we support random vmaddr,range then we really need to be
able to do everything munmap does for CPU VMA, which means splitting
ranges, joining ranges etc.

like
MAP(1, 0, 0x8000, 0xc0000)
UNMAP(0xc1000, 0x1000)
should that be possible?

Do we have any API usage (across Vulkan/CL/CUDA/ROCm etc) that
requires this sort of control, or should we be fine with only
unmapping objects exactly like how they were mapped in the first
place, and not have any splitting/joining?

Dave.
