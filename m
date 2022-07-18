Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5B95786E2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 18:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB7F12A8A8;
	Mon, 18 Jul 2022 16:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75A412A8A8;
 Mon, 18 Jul 2022 16:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658160060; x=1689696060;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C6vWqUcyXQkTAuAAqqcnVbId6I4b0LLhuzC6Emj2LTg=;
 b=X+pOoCTQRYvBlqq3ocuuR6hue3h0+yss3OQHfb2vGo89y1TTAUJGFspA
 yS/V3CPn4nP7njEM2HrJzekplS5RMquTM8+9Y9jRDkdRnwcKcvZISZ+sz
 djsKDRef/QEensow2/ZbhKfbVt35hvnMMJFVDKUpZJvn3oPGQyCts9+Hp
 KtUGh/W+Nc0ST7U9eKlvRSfS2ht+9dlx3zFbam7z0wqWoQFwMJCdnsT1i
 G4e/1+tq8iesFPsQL1OW9QpQd8ogVjoriRYvemNSr3NIMfXmD1RhdWK0f
 KUGMdQPumeiPop2I/vEtEa46Rsc/ljDxhiGZQCAznULQa/+MBKrgbVChx g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="285014673"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="285014673"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 09:00:59 -0700
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="655344616"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.249.35.85])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 09:00:56 -0700
Date: Mon, 18 Jul 2022 18:00:54 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 04/21] drm/i915/gt: Only invalidate TLBs
 exposed to user manipulation
Message-ID: <20220718180054.048929ef@maurocar-mobl2>
In-Reply-To: <72a40626-ee71-fffe-3816-933fbec92c4d@linux.intel.com>
References: <cover.1657800199.git.mchehab@kernel.org>
 <c0ab69f803cfe439f9218d0c0a930eae563dee83.1657800199.git.mchehab@kernel.org>
 <72a40626-ee71-fffe-3816-933fbec92c4d@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Thomas =?UTF-8?B?SGVsbHN0?= =?UTF-8?B?csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 stable@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Jul 2022 14:39:17 +0100
Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:

> On 14/07/2022 13:06, Mauro Carvalho Chehab wrote:
> > From: Chris Wilson <chris.p.wilson@intel.com>
> > 
> > Don't flush TLBs when the buffer is only used in the GGTT under full
> > control of the kernel, as there's no risk of concurrent access
> > and stale access from prefetch.
> > 
> > We only need to invalidate the TLB if they are accessible by the user.
> > That helps to reduce the performance regression introduced by TLB
> > invalidate logic.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")  
> 
> Do we really need or want stable and fixes on this one?
> 
> What do we think the performance improvement is, given there's very 
> little in GGTT, which is not mapped via PPGTT as well?
> 
> I think it is safe, but part of me would ideally not even want to think 
> about whether it is safe, if the performance improvement is 
> non-existent. Which I can't imagine how there would be?

Makes sense. Patch 6 actually ends removing the code doing
that, so I'll just fold this patch with patch 6, in order to
avoid adding something that will later be removed.

Regards,
Mauro
