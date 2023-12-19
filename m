Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590B2819479
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 00:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812C710E20C;
	Tue, 19 Dec 2023 23:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B010C10E20C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 23:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703028033; x=1734564033;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uYTsoLYZOvCUsCGVaoQxTU6za82GcPNPw7Jy1FK3eiE=;
 b=Q+PamraMa/1oIf/uY5c/QjksqS6R2NaLy54INBGaZh/0NY2pTpo9d1TR
 sftVRzQbFnp6EbWISkCu+VP3aw15ByuINqWheSon2hHAVKqQ0/0xObUJJ
 RNBlnzx7sa2A32am59Btmd3han7pyFEKDpgscM733vNZn0hfImqFgw6pq
 nGnT4aWq5Adc1Be7X7gsCaqmx1rfmrj+jui+F5cU3QcvtqmFrHdj42+8h
 s0eVV9I7J0UIHxUm9CcBJ4gbOyL0kvwZ9NP+SLvrrcFQVqJtCWvIwvQld
 QZ8KJDuglILBZPU7MVjA8xh8nrckWnUNF+MJnLk+R2S+DxUERZIHmh9I5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="380721077"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; d="scan'208";a="380721077"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 15:20:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="805055842"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; d="scan'208";a="805055842"
Received: from lveltman-mobl.ger.corp.intel.com (HELO box.shutemov.name)
 ([10.252.33.252])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 15:20:26 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
 id 5494010A43B; Wed, 20 Dec 2023 02:20:23 +0300 (+03)
Date: Wed, 20 Dec 2023 02:20:23 +0300
From: kirill.shutemov@linux.intel.com
To: Alexey Makhalov <alexey.makhalov@broadcom.com>
Subject: Re: [PATCH v3 2/6] x86/vmware: Introduce vmware_hypercall API
Message-ID: <20231219232023.u4dyuvbzbh565grk@box.shutemov.name>
References: <20231219215751.9445-1-alexey.makhalov@broadcom.com>
 <20231219215751.9445-3-alexey.makhalov@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219215751.9445-3-alexey.makhalov@broadcom.com>
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
Cc: pv-drivers@vmware.com, dave.hansen@linux.intel.com,
 dri-devel@lists.freedesktop.org, namit@vmware.com, hpa@zytor.com,
 airlied@gmail.com, timothym@vmware.com, x86@kernel.org, mingo@redhat.com,
 linux-graphics-maintainer@vmware.com, linux-input@vger.kernel.org,
 tzimmermann@suse.de, richardcochran@gmail.com, virtualization@lists.linux.dev,
 mripard@kernel.org, akaher@vmware.com, bp@alien8.de, jsipek@vmware.com,
 tglx@linutronix.de, netdev@vger.kernel.org, dmitry.torokhov@gmail.com,
 linux-kernel@vger.kernel.org, horms@kernel.org, zackr@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 19, 2023 at 01:57:47PM -0800, Alexey Makhalov wrote:
> +static inline
> +unsigned long vmware_hypercall1(unsigned long cmd, unsigned long in1)
...
> +static inline
> +unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
> +				uint32_t *out1, uint32_t *out2)
...
> +static inline
> +unsigned long vmware_hypercall4(unsigned long cmd, unsigned long in1,
> +				uint32_t *out1, uint32_t *out2,
> +				uint32_t *out3)
...
> +static inline
> +unsigned long vmware_hypercall5(unsigned long cmd, unsigned long in1,
> +				unsigned long in3, unsigned long in4,
> +				unsigned long in5, uint32_t *out2)
...
> +static inline
> +unsigned long vmware_hypercall6(unsigned long cmd, unsigned long in1,
> +				unsigned long in3, uint32_t *out2,
> +				uint32_t *out3, uint32_t *out4,
> +				uint32_t *out5)
...
> +static inline
> +unsigned long vmware_hypercall7(unsigned long cmd, unsigned long in1,
> +				unsigned long in3, unsigned long in4,
> +				unsigned long in5, uint32_t *out1,
> +				uint32_t *out2, uint32_t *out3)

Naming is weird. The number in the name doesn't help much as there seems
no system on how many of the parameters are ins and outs.

Why these combinations of ins/outs are supported?

And as an outsider, I'm curious where in2 got lost :P

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
