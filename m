Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE656C2CC3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 09:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA08C10E6D3;
	Tue, 21 Mar 2023 08:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FA810E716;
 Tue, 21 Mar 2023 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679388194; x=1710924194;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cJdbBf+bpw+4ZJXIgzlJlPNlSnPstSFYZ4kxxJGkF7s=;
 b=n/TwQJGhQv7ka0DGvzc4Y4sIW3wU0kZ8sSUuKsUK3a6N0mYlUk+WYAd3
 a+kunWP8ALYoH+8Jy9GlTLMPipPydA8O7VBOHifI6YXb+LWxgRY1u8duY
 v6VgY/3B8muQH+rifySpLcPGmf5W13l4bAFhNN3zYDeSlz0UMYSsX+x6u
 T0D6D0Xcg2S8eKChCrC2RQKb2UIJK99sDyu9St//bsSNlw0Kfq6nV4BYq
 Fr+NF7fIUYy8XporFghkRW+x58a7U/DiXijJaziR9AjSNpMtiDGZinQoZ
 5mgh5m3SUNrStudjuTfu1VsM2DplJgP3YPGur/vPllbzqUrQ08n6eg7gz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="340428311"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="340428311"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 01:43:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="674741495"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="674741495"
Received: from scoyle-mobl.ger.corp.intel.com (HELO [10.213.210.173])
 ([10.213.210.173])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 01:43:09 -0700
Message-ID: <f72efa19-8f29-afcd-af07-d2ac89c9785d@linux.intel.com>
Date: Tue, 21 Mar 2023 08:43:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH][next] drm/i915/uapi: Replace fake flex-array with
 flexible-array member
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <ZBSu2QsUJy31kjSE@work>
 <64189999.170a0220.fa1d9.c3f5@mx.google.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <64189999.170a0220.fa1d9.c3f5@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/03/2023 17:36, Kees Cook wrote:
> On Fri, Mar 17, 2023 at 12:18:01PM -0600, Gustavo A. R. Silva wrote:
>> Zero-length arrays as fake flexible arrays are deprecated and we are
>> moving towards adopting C99 flexible-array members instead.
>>
>> Address the following warning found with GCC-13 and
>> -fstrict-flex-arrays=3 enabled:
>> drivers/gpu/drm/i915/gem/i915_gem_context.c: In function ‘set_proto_ctx_engines.isra’:
>> drivers/gpu/drm/i915/gem/i915_gem_context.c:769:41: warning: array subscript n is outside array bounds of ‘struct i915_engine_class_instance[0]’ [-Warray-bounds=]
>>    769 |                 if (copy_from_user(&ci, &user->engines[n], sizeof(ci))) {
>>        |                                         ^~~~~~~~~~~~~~~~~
>> ./include/uapi/drm/i915_drm.h:2494:43: note: while referencing ‘engines’
>>   2494 |         struct i915_engine_class_instance engines[0];
>>
>> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
>> routines on memcpy() and help us make progress towards globally
>> enabling -fstrict-flex-arrays=3 [1].
>>
>> Link: https://github.com/KSPP/linux/issues/21
>> Link: https://github.com/KSPP/linux/issues/271
>> Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [1]
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>

Flexible array member is even consistent with the rest of our uapi, 
pushed to drm-intel-gt-next, thanks!

Regards,

Tvrtko
