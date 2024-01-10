Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22367829811
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 11:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6533E10E5CC;
	Wed, 10 Jan 2024 10:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E949B10E5CC
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 10:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704884067; x=1736420067;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7WyF+Rt63DImpYwtXu4b3Ib/mVAsMsSsUO5hVbOVgiA=;
 b=nOuqhFQgMnmH9p48wKi6ARVgzQ4gclgK99BwchIj53/9DQZKSanfL1Z3
 hNqPzc2W/GD6pOQFpjfv+uybSLhuj9QpcEGOzl3vaeymWLgr1r4Weyva/
 T13bNJHTipzuPnaXzRDzjAHVUPWQHlCLgIh66t2ZdY8uIYw5ID8FL6V2X
 +NEYKJ5QV6L83G6b17AiurzPYj1vU8/mpX3/KAeqL1YCK8+qdyKQAIFqM
 RbRGbyRA4WSQ8HV62YDWkw/fuf/yOZ+Tlzlu85q/Lmg6qo5lWDZYnOVkW
 dY2h5wqTnaX57VuJAeNSczv9Z4zgY+9+Pd0UQebwlzFKZ4VHSXq4xck/e g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="398172466"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="398172466"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 02:54:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="955326804"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="955326804"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.245.80.160])
 ([10.245.80.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 02:54:26 -0800
Message-ID: <a4a9fa2c-72ca-452a-9361-f88a364caca1@linux.intel.com>
Date: Wed, 10 Jan 2024 11:54:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] accel/ivpu: Disable buffer sharing among VPU
 contexts
Content-Language: en-US
To: Carl Vanderlip <quic_carlv@quicinc.com>, dri-devel@lists.freedesktop.org
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
 <20240105112218.351265-9-jacek.lawrynowicz@linux.intel.com>
 <343d487b-cb44-ddb7-f775-d5fd0ab1286d@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <343d487b-cb44-ddb7-f775-d5fd0ab1286d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: quic_jhugo@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05.01.2024 23:34, Carl Vanderlip wrote:
> 
> On 1/5/2024 3:22 AM, Jacek Lawrynowicz wrote:
>> Imported buffer from another VPU context will now have just reference
>> increased and there will be a single sgt fixing above problem but
>> buffers still can't be shared among VPU contexts because each context
>> have its own MMU mapping and ivpu_bo supports only single MMU mapping.
> 
> This paragraph/sentence needs rewrite. Here's my take...
> 
> "
> Buffers imported from another VPU context will now just increase reference count, leaving only a single sgt, fixing the problem above.
> Buffers still can't be shared among VPU contexts because each has its own MMU mapping and ivpu_bo only supports single MMU mappings.

Perfect, thanks!
