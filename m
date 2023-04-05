Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FCB6D7EFA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 16:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B993810E98D;
	Wed,  5 Apr 2023 14:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47B410E98D;
 Wed,  5 Apr 2023 14:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680704182; x=1712240182;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=P2RqPac9TO0CaODUD6qKdkCCEU6OfG21RarkLTKjyUs=;
 b=W8AvfdDR5dHgYrDDLq0GhnVBH5i8mjdbUHknt8yhTEV+OFCoPniz2wpH
 9nOGwSAgxMFdeV3VVdZYjki6Gqoosdm5wByVz91ZX6sjLz6i0dQ6hCAHh
 j47zFzg0DZm4Les6Z9Q4970F+2BTtKLRzW2Cp3ZLtXJkGQoASY9jpz81B
 Hb3x9toT/3hA1qMqz4n/IRaHuYuK/LUnw+MLgLJ9tgGtRzcvvsnW9A/N6
 pdF9vt76CzDzCGjBbBJMm8lrumH8qgEIS23eGGBO/be2w7vVCqld8XgDW
 /DKO8FY3zqlAvXICrqVxifPD2wthVvznK0mHdfelOv2kiWQZ3pYKrPn8j w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="345042334"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="345042334"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 07:16:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="664052961"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="664052961"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.30.7])
 ([10.213.30.7])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 07:16:16 -0700
Message-ID: <50dce146-f7b0-89ff-34f6-d0ddbda4c158@intel.com>
Date: Wed, 5 Apr 2023 16:16:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/gt: Hold a wakeref for the active
 VM
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230330-hold_wakeref_for_active_vm-v2-1-724d201499c2@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230330-hold_wakeref_for_active_vm-v2-1-724d201499c2@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31.03.2023 16:16, Andrzej Hajda wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> There may be a disconnect between the GT used by the engine and the GT
> used for the VM, requiring us to hold a wakeref on both while the GPU is
> active with this request.
> 
> v2: added explanation to __queue_and_release_pm
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> [ahajda: removed not-yet-upstremed wakeref tracking bits]
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>


Queued.

Regards
Andrzej

