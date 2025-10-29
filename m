Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB9DC1DB1F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 00:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CAA10E86B;
	Wed, 29 Oct 2025 23:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WFoqw0hb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B127D10E86B;
 Wed, 29 Oct 2025 23:36:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C7B0060399;
 Wed, 29 Oct 2025 23:36:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5698DC4CEF7;
 Wed, 29 Oct 2025 23:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761781005;
 bh=fck7k1hPIVSb2U+bkvJUWFyiCUlbqbEKQyXu7S1GQKs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=WFoqw0hbFjfO+zHfIvL1ke04rVtmZjvjhEv5NObP4J9cUv46oC12R9ZEMyr7v01XD
 EzBI5499NdCXyBgJp7jTZH/S+xMa8o456/DTfP6wQCNwj3rJWkXbPqm26xYzatA69F
 P7RsllrwYUV0Xc/k34LaS0VjxcdFULf1yXaquJEzjNyoK5Rlrb0PKMXjcMpP/mXtTz
 1vYj0kXvlv9csZ7saZZ4ldfrFjnIDCBOkXl4Y/xF8B2B9sO5HKEyfDJ9gUUSqhkTgx
 ebBKBstVgcXNPReUsDeA+LNssBzMZuInZvsHcBQmJ+OsxRfhA8kgYn0721O4YAZpVD
 p8rN6TYYmEqNg==
Date: Wed, 29 Oct 2025 18:36:44 -0500
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
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] PCI: Prevent resource tree corruption when BAR
 resize fails
Message-ID: <20251029233644.GA1604285@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028173551.22578-2-ilpo.jarvinen@linux.intel.com>
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

On Tue, Oct 28, 2025 at 07:35:43PM +0200, Ilpo Järvinen wrote:
> pbus_reassign_bridge_resources() saves bridge windows into the saved
> list before attempting to adjust resource assignments to perform a BAR
> resize operation. If resource adjustments cannot be completed fully,
> rollback is attempted by restoring the resource from the saved list.

> Fixes: 8bb705e3e79d ("PCI: Add pci_resize_resource() for resizing BARs")
> Reported-by: Simon Richter <Simon.Richter@hogyros.de>
> Reported-by: Alex Bennée <alex.bennee@linaro.org>

If these reports were public, can we include lore URLs for them?

Same question for [PATCH 5/9] PCI: Fix restoring BARs on BAR resize
rollback path.

I put these all on pci/resource for build testing.  I assume we'll
tweak these based on testing reports and sorting out the pci/rebar
conflicts.

Bjorn
