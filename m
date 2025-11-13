Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B1BC5A09D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 22:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9605310E947;
	Thu, 13 Nov 2025 21:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QznaqxTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA90210E1FB;
 Thu, 13 Nov 2025 21:02:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 987A4446B1;
 Thu, 13 Nov 2025 21:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4783EC2BC87;
 Thu, 13 Nov 2025 21:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763067776;
 bh=XCYM0PneB34dkgpd6HhddZ4DMk4Wy8BVlu694U3Kv0Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=QznaqxTrVF703q5hHIzrRmdgY0vvHnkqScL9EikZSt9aUswzTtKYeHNyxsjApN+nk
 LsHIMNcCDMzDiqpEDxhWZ3SIgliY3izOazQBD5Q91bUiJRXVnwm5YIOvfKegmzkpgf
 3J2UtCp6HaFjHHpX96rGcezc1GOSoEMSon59+jxz1MR0Y8HejVjzL4F6ne3FXRWbC8
 GL5Bb3KRnsScrv8kKx6fqKoCjoW7GMT8yhEbnGdZ154mS8okDPLSAA9yoxMyMYoYKf
 4kW4O0+KFTSGT7XIR2mohWJIAjhZ60NmIES0hoUUHBFbOxH9ORwk+BPjSNG7UUXPl+
 /9+eOQz9kOKkw==
Date: Thu, 13 Nov 2025 15:02:54 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Simon Richter <Simon.Richter@hogyros.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/9] PCI/IOV: Adjust ->barsz[] when changing BAR size
Message-ID: <20251113210254.GA2314858@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe9bd3af-51f6-c1af-9cdc-c78aee7aaef9@linux.intel.com>
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

On Thu, Nov 13, 2025 at 06:35:26PM +0200, Ilpo Järvinen wrote:
> On Thu, 13 Nov 2025, Bjorn Helgaas wrote:
> 
> > On Tue, Oct 28, 2025 at 07:35:44PM +0200, Ilpo Järvinen wrote:
> > > pci_rebar_set_size() adjusts BAR size for both normal and IOV BARs. The
> > > struct pci_srvio keeps a cached copy of BAR size in unit of
> > > resource_size_t in ->barsz[] ...

> > I'm not sure what "unit of resource_size_t" adds here, maybe could be
> > removed to just say this?
> > 
> >   struct pci_srvio keeps a cached copy of BAR size in ->barsz[] ...
> 
> Seems okay with me. I just had it there to differentiate from "BAR size" 
> which happens to often be the format directly compatible with field in the 
> capability.

Ah, I see now, "size" used to be in bytes, but now it's the encoded
size.
