Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7933973FF7C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 17:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F9E10E2FB;
	Tue, 27 Jun 2023 15:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D51E10E2FB;
 Tue, 27 Jun 2023 15:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687879021; x=1719415021;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=IspLzGECW/QKzWuYYlBR6tnuNoLlogiPn6vepbTXATk=;
 b=SDTlyO9AUdzXqP0Ninrjyt13+q1ruLYq36l9Z4pfMjwd/nqXuRGXUE73
 se3DWhS9PfUMcDXxTDfo0pCguOQQqOD3RanGTCsIrmQuXmI3Md7iuiDhO
 T9T5et583XSx2upB3YSLvqZcfr2+D0m3Rk18I2/peeLnmHClf39TttsyX
 4Oz6bT7gAr66H/MCpCrr6I3+xaA0OaARHQFl8WyJo5zswaLTSFEuztfXx
 1XAzRkZFRz6IgsmP+lzaN/ysvkUWNIB8mVW7QRJeHiCQVOxJB7bcuRhXm
 zL5DfNOcK5iC1ipWiHEl5HYUV8GoqiWqadKdJkyKO6secBr+QfRaj+aF/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="361636398"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="361636398"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 08:16:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="861156108"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="861156108"
Received: from jwerner6-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.48])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 08:16:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v8 1/2] drm/i915: preparation for using PAT index
In-Reply-To: <ZJr6aRb8SrLug7SQ@ashyti-mobl2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230509165200.1740-1-fei.yang@intel.com>
 <20230509165200.1740-2-fei.yang@intel.com> <874jmtt4pb.fsf@intel.com>
 <b22c7111-0587-19b5-d912-9d07b81d2bb0@linux.intel.com>
 <ZJr6aRb8SrLug7SQ@ashyti-mobl2.lan>
Date: Tue, 27 Jun 2023 18:16:37 +0300
Message-ID: <871qhxszoq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: fei.yang@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Jun 2023, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> Tvrtko wrote:
>> I'd simply suggest having a local static const table for the mock device. It
>> should be trivial once i915->__info becomes a pointer so in that series I
>> guess.

That's a great idea, thanks!

> Fei... do you have bandwidth to look into this or do you want me
> to try Tvrtko's suggestion out?

https://patchwork.freedesktop.org/patch/msgid/b0db62045a96a3fd4cf123685da88cc777f9b485.1687878757.git.jani.nikula@intel.com


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
