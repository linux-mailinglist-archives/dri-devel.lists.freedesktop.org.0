Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88406E0FB1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 16:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D26110E167;
	Thu, 13 Apr 2023 14:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCFC10E167;
 Thu, 13 Apr 2023 14:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681395031; x=1712931031;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iN/wSUBRfn/KK3ga/Tp92Uhf2wOodlG12auRetLJGKU=;
 b=hw7MrBhOjCXM3bFuGy0TelvagLBUoRPvcoaA4zJU/3E7DAd274VH3yON
 piYWB51/Aq2UKRrMbwUzAw6QB3loVVVEQAw8MYzkEs02/u5KH2Jg+Z3lJ
 TPFAS4uZgk97qjLcunWjlbdE/jLM0lyZmiOdegyKaPOL/fHV+iC64Fi3b
 X9YT8TQ1IlIoapY5NecANwZLiMwD2cl90fGwyR8jvfqHBBbQVwgOQBwDJ
 svxNLWWwXq3YYJG+L956BsufKN3wOGA4+KPMPXM1GD0hagaGCv4kNw06f
 w7IPiBC2DBbsCyM7skcegJGeJS27+9Qa7opec8aR6gOlVL2nwoJUVUj6+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="332920444"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; d="scan'208";a="332920444"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 06:56:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="682959859"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; d="scan'208";a="682959859"
Received: from zbiro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.212.144])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 06:56:48 -0700
Date: Thu, 13 Apr 2023 15:56:21 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Make IRQ reset and postinstall
 multi-gt aware
Message-ID: <ZDgKBUIV9nGcfQqF@ashyti-mobl2.lan>
References: <20230413092006.931861-1-andi.shyti@linux.intel.com>
 <dc0042e0-8a4e-5c3d-922f-bd65402a154a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc0042e0-8a4e-5c3d-922f-bd65402a154a@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Paulo Zanoni <paulo.r.zanoni@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

(I forgot to CC Daniele)

On Thu, Apr 13, 2023 at 11:41:28AM +0100, Tvrtko Ursulin wrote:
> 
> On 13/04/2023 10:20, Andi Shyti wrote:
> > From: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > 
> > In multitile systems IRQ need to be reset and enabled per GT.
> > 
> > Although in MTL the GUnit misc interrupts register set are
> > available only in GT-0, we need to loop through all the GT's
> > in order to initialize the media engine which lies on a different
> > GT.
> > 
> > Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > ---
> > Hi,
> > 
> > proposing again this patch, apparently GuC needs this patch to
> > initialize the media GT.
> 
> What is the resolution for Matt's concern that this is wrong for MTL?

There are two explanations, one easy and one less easy.

The easy one: without this patch i915 doesn't boot on MTL!(*)

The second explanation is that in MTL the media engine has it's
own set of misc irq's registers and those are on a different GT
(Daniele pointed this out).

I sent this patch not to bypass any review, but to restart the
discussion as this patch was just dropped.

Thanks,
Andi


(*)
[drm] *ERROR* GT1: GUC: CT: No response for request 0x550a (fence 7)
[drm] *ERROR* GT1: GUC: CT: Sending action 0x550a failed (-ETIMEDOUT) status=0X0
[drm] *ERROR* GT1: GUC: Failed to enable usage stats: -ETIMEDOUT
[drm] *ERROR* GT1: GuC initialization failed -ETIMEDOUT
[drm] *ERROR* GT1: Enabling uc failed (-5)
[drm] *ERROR* GT1: Failed to initialize GPU, declaring it wedged!
