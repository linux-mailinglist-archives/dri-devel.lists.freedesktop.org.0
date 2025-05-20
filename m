Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7827ABE212
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 19:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985EA10E603;
	Tue, 20 May 2025 17:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sBfZRIzE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAA910E5E2;
 Tue, 20 May 2025 17:46:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D6B88A4EDBC;
 Tue, 20 May 2025 17:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C07C4CEE9;
 Tue, 20 May 2025 17:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747763212;
 bh=epFj9ameUkoKhotMXUPaBgkx49wIoRJSBD61YLTqtVM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sBfZRIzE4v7CL3HkV72lw/fz0AUs5vRFYf6K/RemCVLWrl4xqKVJdF3grWH16tgTV
 8Trl5e9btU7ak0JC2AbkH3G7whYXVZMJ7lcebS/oJPIU5Bt19ama76kr7mYBE+LvIh
 1oRGlipphrGNzbmuPqTso8eZUq4VLkT3GUjzgwnO8MMGYx2CuuxP0ovvpsmLwhnX31
 Z7903FKatq3Hl9Vv4ke1EfJENUWOL1jimMrsS1r3S1wEoUEwPHo68J0KjfViqk2MSy
 Ojzxq0sdIS+mYGzVJ1XCKJUvOrk3IsIPPn/U7LQCpA/Bo92B1+4VuN2+qrVQeeqhwF
 28eKIdFs5a/7w==
Date: Tue, 20 May 2025 19:46:48 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, 
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [RFC 0/2] Introduce a sysfs interface for lmem information
Message-ID: <wmejfsw4evmyg2apuo2dwlt4i44eduzhkcyqsi6x7erq7udbnn@t5pwllrdmh6u>
References: <20250519153418.44543-1-krzysztof.niemiec@intel.com>
 <174775327260.81385.8059929394366685323@jlahtine-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174775327260.81385.8059929394366685323@jlahtine-mobl>
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

Hi,

On Tue, May 20, 2025 at 06:01:12PM +0300, Joonas Lahtinen wrote:
> Quoting Krzysztof Niemiec (2025-05-19 18:34:14)
> > This series introduces a way for applications to read local memory
> > information via files in the sysfs. So far the only way to do this was
> > via i915_query ioctl. This is slightly less handy than sysfs for
> > external users. Additionally, the ioctl has a capability check which
> > limits which users of a system might use it to get information.
> > 
> > The goals of this series are:
> > 
> >         1) Introduce a simpler interface to access lmem information,
> >         2) Lift the CAP_PERFMON check on that information, OR provide
> >            the administrator with a way to optionally lift it.
> > 
> > The first patch introduces the general mechanism without protections.
> > This will effectively lift a capability check on obtaining the memory
> > information. The second patch introduces that check back inside the
> > _show() functions, but also adds a sysctl parameter allowing to override
> > the checks, if an administrator so decides.
> > 
> > I'm sending this as RFC because I have a feeling that there's no
> > consensus whether memory information exposed in the patch should be
> > protected or not. Showing it to any user is strictly speaking an info
> > leak, but the severity thereof might be considered not that high, so I'd
> > rather leave it up to discussion first.
> > 
> > If we decide for lifting the check, the first patch is sufficient.
> 
> Nack on that.
> 
> CPU memory footprint and GPU memory footprint have a very different
> nature. This was discussed to quite a length, please refer to mailing
> list archives.
> 
> > If we
> > decide against it, the second patch protects the information by default,
> > but with a way to expose it as a conscious decision of the admin. I find
> > it a decent compromise.
> 
> No need for the added complexity if we were to add a sysfs.
> 
> If a sysfs is added, it can be made root readable by default but system
> admin is free to chown or chmod the file for more relaxed access. Back
> in the original discussion time, this was omitted for lack of users.
> 
> Even now, userspace/sysadmin could already essentially use setuid helper
> process that will only report the memory statistics.
> 
> So I'm not really fully convinced this is needed at all.

yeah! What is the real use case? Who is the userspace client?

There are already ways to read out the GPU memory footprint so
that we need to know whether we need for another uAPI.

Andi

> And if it is to be added for the convenience of usersppace, it should
> probably then be considered to be a standard interface across DRM drivers
> ala fdinfo or cgroups.
> 
> Regards, Joonas
> 
> > 
> > This change has been requested in these parallel issues for i915 and Xe:
> > 
> > https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14153
> > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4861
> > 
> > Thanks
> > Krzysztof
> > 
> > Krzysztof Niemiec (2):
> >   drm/i915: Expose local memory information via sysfs
> >   drm/i915: Add protections to sysfs local memory information
> > 
> >  drivers/gpu/drm/i915/i915_sysfs.c          |   6 +
> >  drivers/gpu/drm/i915/intel_memory_region.c | 136 +++++++++++++++++++++
> >  drivers/gpu/drm/i915/intel_memory_region.h |   3 +
> >  3 files changed, 145 insertions(+)
> > 
> > -- 
> > 2.45.2
> > _
