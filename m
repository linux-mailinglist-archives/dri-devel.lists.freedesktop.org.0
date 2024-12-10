Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6E09EB0F3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 13:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E2010E3B6;
	Tue, 10 Dec 2024 12:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="acbzj30F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D6A10E3AB;
 Tue, 10 Dec 2024 12:37:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 98BCA5C6172;
 Tue, 10 Dec 2024 12:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AA1C4CED6;
 Tue, 10 Dec 2024 12:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1733834267;
 bh=yT+2etRjcgkDFWD03R9C8TI0zCspIsiAJ5OYsndSpFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=acbzj30FlK2EmvlLToH6QFS188H3wkR00SNtGXFoyXfo7grjKoQlB4SrcSoHAL9XJ
 9l3MKDEFHD8hdBLasqB681IDSjuNhKX5BhkWKO30ICYOu/pdrsYMLXzzwMUbU2A+VE
 8cHX00vEWt10382+pbKfofAHT8L+umujoA21BX/o=
Date: Tue, 10 Dec 2024 13:37:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Genes Lists <lists@sapience.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org, stable@vger.kernel.org,
 linux-media@vger.kernel.org, bingbu.cao@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: Linux 6.12.4 - crash dma_alloc_attrs+0x12b via ipu6
Message-ID: <2024121001-senator-raffle-a371@gregkh>
References: <2024120917-vision-outcast-85f2@gregkh>
 <c0e94be466b367f1a3cfdc3cb7b1a4f47e5953ae.camel@sapience.com>
 <Z1fqitbWlmELb5pj@kekkonen.localdomain> <87seqvzzg6.fsf@intel.com>
 <c1805642a6c5da6fef3927c70358c8cb851d2784.camel@sapience.com>
 <87bjxjzpwn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bjxjzpwn.fsf@intel.com>
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

On Tue, Dec 10, 2024 at 02:24:56PM +0200, Jani Nikula wrote:
> On Tue, 10 Dec 2024, Genes Lists <lists@sapience.com> wrote:
> > On Tue, 2024-12-10 at 10:58 +0200, Jani Nikula wrote:
> >> On Tue, 10 Dec 2024, Sakari Ailus <sakari.ailus@linux.intel.com>
> >> wrote:
> >> > Hi,
> >> > 
> >> > > ...
> >> > > FYI 6.12.4 got a crash shortly after booting in dma_alloc_attrs -
> >> > > maybe
> >> > > triggered in ipu6_probe. Crash only happened on laptop with ipu6.
> >> > > All
> >> > > other machines are running fine.
> >> > 
> >> > Have you read the dmesg further than the IPU6 related warning? The
> >> > IPU6
> >> > driver won't work (maybe not even probe?) but if the system
> >> > crashes, it
> >> > appears unlikely the IPU6 drivers would have something to do with
> >> > that.
> >> > Look for warnings on linked list corruption later, they seem to be
> >> > coming
> >> > from the i915 driver.
> >> 
> >> And the list corruption is actually happening in
> >> cpu_latency_qos_update_request(). I don't see any i915 changes in
> >> 6.12.4
> >> that could cause it.
> >> 
> >> I guess the question is, when did it work? Did 6.12.3 work?
> >> 
> >> 
> >> BR,
> >> Jani.
> >
> >
> >  - 6.12.1 worked
> >
> >  - mainline - works (but only with i915 patch set [1] otherwise there
> > are no graphics at all)
> >
> >     [1] https://patchwork.freedesktop.org/series/141911/
> >
> > - 6.12.3 - crashed (i see i915 not ipu6) and again it has       
> >     cpu_latency_qos_update_request+0x61/0xc0
> 
> Thanks for testing.
> 
> There are no changes to either i915 or kernel/power between 6.12.1 and
> 6.12.4.
> 
> There are some changes to drm core, but none that could explain this.
> 
> Maybe try the same kernels a few more times to see if it's really
> deterministic? Not that I have obvious ideas where to go from there, but
> it's a clue nonetheless.

'git bisect' would be nice to run if possible...
