Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250716C0691
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 00:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3100410E1C3;
	Sun, 19 Mar 2023 23:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E30B10E1C3;
 Sun, 19 Mar 2023 23:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679267998; x=1710803998;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=k5YhXb+NAZBCV+CnDfy6zOuEF+iC3mHrv3Nr1Nz9D/Y=;
 b=PynE33HcwzTAqxFRNuEk8vS5+6EXkBqk176ab00E+GKODH9Ihh2jV9dh
 rlPF4YeEdBfUpm7tiGkn+wXPiA6L0mrB6pvEyOwYHeKCjSwe/eSR43ns9
 hE1D/GRcRHC4/j4/N4eFfbKxL3MyUA8iBDcC9ni7QaUKPUQ9QaC0TpbdC
 HzlShkY8Fgm83xdf2LISMq7jz6CeYojinBl1Z5yESSN/nQRTbj4DF19Q2
 Mq7zbMI5G4xs+NmRgYpymHHUY6rxXDWv8boLiCnze492VLZ3dgdWWdU2t
 KoHHDok1+hCgjgfj75XSD9wXSUCe1rnWPGG1tTl/HRVUOhpn90PEVN79B Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="340906308"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="340906308"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2023 16:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="658158494"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="658158494"
Received: from msbunten-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.251.221.102])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2023 16:19:53 -0700
Date: Mon, 20 Mar 2023 00:19:29 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 04/10] lib/ref_tracker: remove warnings in
 case of allocation failure
Message-ID: <ZBeYgaAPBZa8jmnZ@ashyti-mobl2.lan>
References: <20230224-track_gt-v4-0-464e8ab4c9ab@intel.com>
 <20230224-track_gt-v4-4-464e8ab4c9ab@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224-track_gt-v4-4-464e8ab4c9ab@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Eric Dumazet <edumazet@google.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Mon, Mar 06, 2023 at 05:32:00PM +0100, Andrzej Hajda wrote:
> Library can handle allocation failures. To avoid allocation warnings
> __GFP_NOWARN has been added everywhere. Moreover GFP_ATOMIC has been
> replaced with GFP_NOWAIT in case of stack allocation on tracker free
> call.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
