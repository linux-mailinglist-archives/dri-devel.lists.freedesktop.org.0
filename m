Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AB97B040A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 14:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6392F10E4FD;
	Wed, 27 Sep 2023 12:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E35310E4FD;
 Wed, 27 Sep 2023 12:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695817651; x=1727353651;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MG8Xca4cBgFS+4R9i9HryplabpchKrxHRTPHYqdBHSA=;
 b=Ll4XY6Ln44q3OPVev+1r9Z6ojQhi+cSMo9ZHsnrKk2eL9NDu60aeUSdA
 bgV03omOePLx5KFkHttarql2+KtMC58A15cQf9ectOD9r63tzlFy3i2Xk
 RXMBYxiiJhKxvrw5Rkxz46ubn0gK2s3SrAUy9wJk8RFIIksHzd06a2Puv
 WiHxcaAT/ptHsPm4c5r2kmYBOlvjV3fG4Fzz/7FeTWG6xgVgDZmb+PfWZ
 7wC48pTUuYckOtvRIKz7yEA+MYZkVerScH/QCKH2+fB5f6vCLs4T1d27d
 kZeVn2ViFttTl2FUPasLwVhqGE705sOg9BN3xdCP3lsyztT27ZYkur3tA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="379089126"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="379089126"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:27:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="742693914"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="742693914"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.53.87])
 ([10.252.53.87])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:27:09 -0700
Message-ID: <cd42c493-a6a9-9293-6ff0-7b76eaca95b5@linux.intel.com>
Date: Wed, 27 Sep 2023 14:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915: Reset steer semaphore for media
 GT
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20230927102237.30773-1-nirmoy.das@intel.com>
 <20230927102237.30773-2-nirmoy.das@intel.com>
 <ZRQSzq8kU0TuWety@ashyti-mobl2.lan>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZRQSzq8kU0TuWety@ashyti-mobl2.lan>
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
Cc: intel-gfx@lists.freedesktop.org, matthew.d.roper@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/27/2023 1:32 PM, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Wed, Sep 27, 2023 at 12:22:36PM +0200, Nirmoy Das wrote:
>> During resime, the steer semaphore on GT1 was observed to be held. The
> resime/resume/
will fix that.
>
>> hardware team has confirmed the safety of clearing the steer semaphore
>> during driver load/resume, as no lock acquisitions can occur in this
>> process by other agents.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

I need to resend. Managed to test on new IFWI and it seems I am doing 
that on resume.


Thanks,

Nirmoy

>
> Andi
