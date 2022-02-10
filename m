Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4AB4B1F94
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 08:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECBD10EA00;
	Fri, 11 Feb 2022 07:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE0D10E28B;
 Thu, 10 Feb 2022 14:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644504045; x=1676040045;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nS+4j/D/u5fLTYX09fvI9s5Nyw6vjMl7g7+7UKFYvKc=;
 b=a1xMDF2kOOywwSeazGEHnWnmCLepNQ+gOrcwLGh/RokdnMy+af+xVhg6
 HhyAYAjsUoZ7ifymiSBeCnlBtOE6Cpppkn83A3+wnSYiwZFDgIUo/Cfuh
 zILa4ds3bT60yf43zbDJBawc4zcvCMjq3XiodsuLD5yGc9F6Hex/3Ibup
 ddiVdYPY0XDWFAKCZFWwcS8j7jNJGQkQZyOOaTWkxeCQLtvf1leEP3D9G
 8utYrIenL/HVvpPBqgPN2Hvv/4sS89N2UOYepvl+hYe1KH6SLlV9BBKvg
 0oROGEXTjS9i6XNa41z8QvAh1ssmFo9ERTGTd+dDb4dnf+Woav1sg2oYz w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="249254477"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="249254477"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 06:40:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="541630751"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.210.125])
 ([10.251.210.125])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 06:40:44 -0800
Message-ID: <1a7ae735-56eb-b95e-c50a-2d9b36bcdf29@linux.intel.com>
Date: Thu, 10 Feb 2022 15:40:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [Intel-gfx] [PATCH v2 00/15] Initial support for small BAR
 recovery
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220210121313.701004-1-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220210121313.701004-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 11 Feb 2022 07:47:51 +0000
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patches: 1, 2, 3, 5, 6, 11 are Acked-by: Nirmoy Das <nirmoy.das@intel.com>

Patches: 5,6 are Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


Sorry for partial reviews, I still need to go through more i915 code.


Regards,

Nirmoy

On 10/02/2022 13:12, Matthew Auld wrote:
> Starting from DG2 we will have resizable BAR support for device local-memory,
> but in some cases the final BAR size might still be smaller than the total
> local-memory size. In such cases only part of local-memory will be CPU
> accessible, while the remainder is only accessible via the GPU. This series adds
> the basic enablers needed to ensure that the entire local-memory range is
> usable.
>
> Needs to be applied on top of Arun' in-progress series[1].
>
> [1] https://patchwork.freedesktop.org/series/99430/
>
> v2:
>    - Various improvements and fixes as suggested by Thomas.
>
