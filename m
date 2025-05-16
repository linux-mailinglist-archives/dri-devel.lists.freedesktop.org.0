Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1B1AB9840
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 11:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3757210E9FD;
	Fri, 16 May 2025 09:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="liq2ix2d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B4D10E9FD;
 Fri, 16 May 2025 09:01:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0CD1A5C39A3;
 Fri, 16 May 2025 08:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A48C4CEE4;
 Fri, 16 May 2025 09:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747386101;
 bh=rRJdyNOXAmuDrBUcTUaJ4uRJj/d1LuL19Qz9yJugxfU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=liq2ix2dRUN5sj+My6TL4e/gnjWXAbrbxMGtVvZ1tFTdWe936gXeqZdyZUGm5pQhn
 CLBxBeqUS3iwGH5duvrCstX6KhOE7z5MKMKyvcKs5rtRzpfUHSFz/GunCBCZ6aYhM9
 JlhYz93+llD8p75cErYv2bQ2jkeQz8KMQH0O0QaII7qk9KbGKo6f3FA7djsoYwDkZk
 JZa5NsUNiCuAAtxPS4yN0eHlbElTii4P4EFlIyb7mJNePxtWWc/lR3WYcY0bjCkAGL
 XlsFHk4BKK3W6cFg7mql4ac3zwq42m7u5Unfm1NLdYvVDemHLkBr9bHjZuYSo/zU6U
 R0gjSQC55ZZdw==
Date: Fri, 16 May 2025 11:01:35 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor
 path
Message-ID: <aCb-72KH-NrzvGXy@pollux>
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-2-robdclark@gmail.com>
 <aCWrwz2IF6VBUi4e@pollux> <aCWueFzx2QzF7LVg@pollux>
 <CAF6AEGu9MPxKnkHo45gSRxaCP+CTzqsKZjiLuy4Ne4GbrsStGA@mail.gmail.com>
 <aCYqlvp_T77LyuMa@pollux>
 <CAF6AEGsOTNedZhuBzipSQgNpG0SyVObaeq+g5U1hGUFfRYjw8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsOTNedZhuBzipSQgNpG0SyVObaeq+g5U1hGUFfRYjw8w@mail.gmail.com>
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

On Thu, May 15, 2025 at 02:57:46PM -0700, Rob Clark wrote:
> On Thu, May 15, 2025 at 10:55 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > Anyways, I don't agree with that. Even if you can tweak your driver to not run
> > into trouble with this, we can't introduce a mode that violates GOUVM's internal
> > lifetimes and subsequently fix it up with WARN_ON() or BUG_ON().
> >
> > I still don't see a real technical reason why msm can't be reworked to follow
> > those lifetime rules.
> 
> The basic issue is that (a) it would be really awkward to have two
> side-by-side VM/VMA management/tracking systems.  But in legacy mode,
> we have the opposite direction of reference holding.  (But at the same
> time, don't need/use most of the features of gpuvm.)

Ok, let's try to move this forward; I see three options (in order of descending
preference):

  1) Rework the legacy code to properly work with GPUVM.
  2) Don't use GPUVM for the legacy mode.
  .
  .
  .
  3) Get an ACK from Dave / Sima to implement those workarounds for MSM in
     GPUVM.

If you go for 3), the code introduced by those two patches should be guarded
with a flag that makes it very clear that this is a workaround specifically
for MSM legacy mode and does not give any guarantees in terms of correctness
regarding lifetimes etc., e.g. DRM_GPUVM_MSM_LEGACY_QUIRK.

- Danilo
