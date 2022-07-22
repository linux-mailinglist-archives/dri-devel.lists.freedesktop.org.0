Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 613B257E143
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 14:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BF790CDC;
	Fri, 22 Jul 2022 12:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A591F908CD;
 Fri, 22 Jul 2022 12:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658491648; x=1690027648;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7csoj11Ngte1VsV9j1GfxOWnYiT9h3Gecw0LVntMgDk=;
 b=mb3+C2IqsNWuRPn4vI7jYCGCjcYmZtyW3jtLMKA9qYd5YBtdwD3ltQPC
 P3DHdyjimB9VNMPpJMfv852D4UB5qfOphez5zfZZWhrEQVESyV9pOa1/y
 gOEdTZ2JaEJ9dVdoPoCB20mQgRapXQ4gwE9KaIzw6IRO2vLW8M2LmV/zE
 eburlZkIcp9Z6wUwUW9mmTUQLNXUpUbAGXufDWSCfd8gqOdF8D7USuakd
 Ol6eQgfNH2fNhPhGTJiidZ9YdiXXjFSb8Nsm9fp+JED1L+ytke/svgcRj
 mK9++c14UBdzVU0sxWDZ00of2d1Wdu7WhNB1xUsczhBJLyTh+k2h470hQ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="288055103"
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="288055103"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 05:07:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="657191932"
Received: from dstoll-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.44.132])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 05:07:22 -0700
Date: Fri, 22 Jul 2022 14:07:22 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 08/21] drm/i915/gt: Move TLB invalidation to its own
 file
Message-ID: <YtqS+kfQDgFIPfmB@alfio.lan>
References: <cover.1657800199.git.mchehab@kernel.org>
 <d9cbb37b472084a6a05f6fc8c2e802b122de08e8.1657800199.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9cbb37b472084a6a05f6fc8c2e802b122de08e8.1657800199.git.mchehab@kernel.org>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Fei Yang <fei.yang@intel.com>, Chris Wilson <chris.p.wilson@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Casey Bowman <casey.g.bowman@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

On Thu, Jul 14, 2022 at 01:06:13PM +0100, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Prepare for supporting more TLB invalidation scenarios by moving
> the current MMIO invalidation to its own file.
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Just a copy paste, I checked line by line and it looked all
correct:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
