Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6923C5A08B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 22:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D117710E944;
	Thu, 13 Nov 2025 21:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bTpdnjky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E9910E93F;
 Thu, 13 Nov 2025 21:01:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8A79B440C4;
 Thu, 13 Nov 2025 21:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496EDC4CEFB;
 Thu, 13 Nov 2025 21:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763067673;
 bh=D3kautNBX7VHVPxLlPAzlmTDnxHyydHklCkRChinAyQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=bTpdnjky/7MCB/iFzjyK5M0y5opSt/cCYv4pnRkBE5UmQv9ww8SxC6wRdatRUKoZ4
 3wxv6DBOILB5LDPnVp80+6TbkEuEKHzwLP/u/l20D3iMRM3huZYvNJPsLwW+kPbSdl
 PE0pbkUlDTDoLNx+3whvnslxuYur0X9iONuYXad64Ye4hNogw6MjU4gDu4rbfTDjGR
 aYZY3glOwqDGUi3h2PkIxgQGibPMCcehySTzPaDTwLaDQPwoaZI5JWV14G0rPRIBwX
 vcYycL4RHepuBRnELvOyIG/TNeGLd7eBO06oIsyzE5TqxbjU9EZybRzrPqcieQ7Zko
 pDBc36To+lo1w==
Date: Thu, 13 Nov 2025 15:01:12 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Simon Richter <Simon.Richter@hogyros.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/11] PCI: Fix restoring BARs on BAR resize rollback
 path
Message-ID: <20251113210112.GA2314791@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba725a72-7863-3dd2-6ba2-ff2259229bbe@linux.intel.com>
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

On Thu, Nov 13, 2025 at 06:46:07PM +0200, Ilpo Järvinen wrote:
> On Thu, 13 Nov 2025, Ilpo Järvinen wrote:

> > -int __must_check pci_resize_resource(struct pci_dev *dev, int i, int size);
> > +int __must_check pci_resize_resource(struct pci_dev *dev, int i, int size,
> > +				     int exlucde_bars);
> 
> It seems I managed to mistype this in the prototype, please let me know if 
> you want me to send v3 addressing this and the other comments.

Fixed this one, thanks.
