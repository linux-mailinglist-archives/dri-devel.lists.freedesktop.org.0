Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1423D839B6B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 22:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF5910E164;
	Tue, 23 Jan 2024 21:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BB110E164;
 Tue, 23 Jan 2024 21:48:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 91A1261F66;
 Tue, 23 Jan 2024 21:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADADC433C7;
 Tue, 23 Jan 2024 21:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706046483;
 bh=lCHfHu6EUXojzzHzheXE7xt3G/zJ41N3IKBiY+lqP0k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=FB8Yh7m8pOYpYOeAiLCyS+voeY7F7smKIjPd1R48tio2TEDLdM6AiEiEqhtBn2q4A
 vk68s1BpElRSXfqEsy0ZQVB2bgbFpAOMsuj6L+lfCPKDLHFHnZd0SOwD6SKdBHCy1q
 Tt4isjg3ca4S7YLKd3INw4nVouhbKP86dTgaeSEVG8NanW6zL8IrvCR+n5ZakDH9xG
 5rhQeuoRzar3sj6qaZkQNcGT9+tqVWcKcIoAKjxzH7dy4En63k5CCutR8hmFVuCVnB
 osZb6XsfznsRDMcPdbrjCwBC1bUZeLf6c+iq09L1FsFUNHBOv4VIrMLZZ8r4Esu8mO
 vGnoJv/BKxZtw==
Date: Tue, 23 Jan 2024 15:48:01 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v4 1/3] pm: runtime: Simplify pm_runtime_get_if_active()
 usage
Message-ID: <20240123214801.GA330312@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZbAlFKE_fZ_riRVu@kekkonen.localdomain>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 laurent.pinchart@ideasonboard.com, David Airlie <airlied@gmail.com>,
 Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-sound@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 08:44:04PM +0000, Sakari Ailus wrote:
> On Tue, Jan 23, 2024 at 11:24:23AM -0600, Bjorn Helgaas wrote:
> ...

> > - I don't know whether it's feasible, but it would be nice if the
> >   intel_pm_runtime_pm.c rework could be done in one shot instead of
> >   being split between patches 1/3 and 2/3.
> > 
> >   Maybe it could be a preliminary patch that uses the existing
> >   if_active/if_in_use interfaces, followed by the trivial if_active
> >   updates in this patch.  I think that would make the history easier
> >   to read than having the transitory pm_runtime_get_conditional() in
> >   the middle.
> 
> I think I'd merge the two patches. The second patch is fairly small, after
> all, and both deal with largely the same code.

I'm not sure which two patches you mean, but the fact that two patches
deal with largely the same code is not necessarily an argument for
merging them.  From a reviewing perspective, it's nice if a patch like
1/3, where it's largely mechanical and easy to review, is separated
from patches that make more substantive changes.

That's why I think it'd be nice if the "interesting"
intel_pm_runtime_pm.c changes were all in the same patch, and ideally,
if that patch *only* touched intel_pm_runtime_pm.c.

Bjorn
