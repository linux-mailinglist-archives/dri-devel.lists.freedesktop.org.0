Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B8CC58BB4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FF510E8C4;
	Thu, 13 Nov 2025 16:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P2rK0EFS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C85810E8C0;
 Thu, 13 Nov 2025 16:29:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DC07143D56;
 Thu, 13 Nov 2025 16:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1191C4CEF7;
 Thu, 13 Nov 2025 16:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763051373;
 bh=o4PnkyZUx4AYVVRBtOx+l6lCbnmaN+rai8Qixxl6L+s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=P2rK0EFSKs/CQAHyYHeYXKw/qINMyPHZ1K73aZD2yWYVFoz4BSYjwNoo+Hhexm9b3
 1ZjdcJEBSe/cCF70DrUF7hKQ+CEIrcpB8wn6+VZm8IuaQrj3KXz5HSceHT376Phscl
 BGBAg18oeiF76IPtS3qMaKyX4tRZD+jIo704XV8JmP7PAM0ocjBdsqkkRbO9mCCKk7
 awZkLY/AvaEm263KeN2vRJsnljGPH+StvtePJkcPlRegrnBEjhpf+OGF2sIRD6UfJh
 qeTQpCkXQLsNQVUkf7xPrfoyfdGVXQlYIYiJ6hjGQ8PGjxauXTR6m6IthInv/seNtS
 8ZpaBcj2EXzCw==
Date: Thu, 13 Nov 2025 10:29:32 -0600
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
Subject: Re: [PATCH 2/9] PCI/IOV: Adjust ->barsz[] when changing BAR size
Message-ID: <20251113162932.GA2285446@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028173551.22578-3-ilpo.jarvinen@linux.intel.com>
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

On Tue, Oct 28, 2025 at 07:35:44PM +0200, Ilpo Järvinen wrote:
> pci_rebar_set_size() adjusts BAR size for both normal and IOV BARs. The
> struct pci_srvio keeps a cached copy of BAR size in unit of
> resource_size_t in ->barsz[] ...

Nit: s/pci_srvio/pci/sriov/  (fixed locally, FYI in case you post a v2)

I'm not sure what "unit of resource_size_t" adds here, maybe could be
removed to just say this?

  struct pci_srvio keeps a cached copy of BAR size in ->barsz[] ...
