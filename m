Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C400255786A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB2C10E36D;
	Thu, 23 Jun 2022 11:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD5010E36D;
 Thu, 23 Jun 2022 11:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655982463; x=1687518463;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=psEJ+vJmelq51ss3ng/bRO3PFKsQrysX325BnCxiWyU=;
 b=XeazfvLOTFqA9JJstho5+tEtmUuMAZfqaPxIBKbLJ6+cnyKmO0SJDdZd
 7MCxRDnhFh8aZmixMu5RWWNONkOj4wU8b65IZzW64gCsk10k5JXt3BnvJ
 5WcekYVw3tp0msPscz4CMfKdYpk97hsBmZBwe16iDQjZ0dmyYq8fPrVY0
 hXaOjNr8oqtGQTENCfxDNlmLK0bz7HkzLzCcqhfx8zI4v1CbOHCYjKv7w
 kjxXgujAOiZUntR4+jkNtYn5K0Wge7nSPNHObjvOAtfvFQ/wumzKZgGqB
 Xp+UBF6bH0jg/eWIc5ENqa+9njSpGyM17KEdGZzNVFNt1yOGHetK9BvDu A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="263723595"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="263723595"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 04:07:43 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="644687438"
Received: from hazegrou-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.216.121])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 04:07:37 -0700
Date: Thu, 23 Jun 2022 13:07:35 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 2/6] drm/i915/gt: Invalidate TLB of the OA unit at TLB
 invalidations
Message-ID: <YrRJd2oBgpcVJ/M4@intel.intel>
References: <cover.1655306128.git.mchehab@kernel.org>
 <653bf9815d562f02c7247c6b66b85b243f3172e7.1655306128.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <653bf9815d562f02c7247c6b66b85b243f3172e7.1655306128.git.mchehab@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Fei Yang <fei.yang@intel.com>, Chris Wilson <chris.p.wilson@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>,
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, mauro.chehab@linux.intel.com,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

On Wed, Jun 15, 2022 at 04:27:36PM +0100, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> On gen12 HW, ensure that the TLB of the OA unit is also invalidated
> as just invalidating the TLB of an engine is not enough.
> 
> Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: stable@vger.kernel.org
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
