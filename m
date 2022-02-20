Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FBD4BCC2A
	for <lists+dri-devel@lfdr.de>; Sun, 20 Feb 2022 05:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C5D10E14D;
	Sun, 20 Feb 2022 04:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D19710E144;
 Sun, 20 Feb 2022 04:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645331304; x=1676867304;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=l+EmiiMIOR0USYv8YGyxgTzcWOgHATrl7GtHHEr4F50=;
 b=cd9JYNwgnXv0KrhfplSGjChQcE+yq9r2cykn1isSU9h9EuzSQ3w8m/4Y
 /fOMSiHanzdECedoCnoAIeO0+q/9ZcDqxLoxy/zYZmiZcfilQ0NmL+JDJ
 5XGONsyAjh2LVnpa6JvXNTnngQ5ma7fzx+i4TOP4egAAbSFCb6TXwT2qm
 T9c2aRjwb1Y3wg2t92tuePI/yVC8cndY/Jwvf42gq7Niip8W4RjnYFgEM
 PDQFw31yByjWlrhpCDJxowEp4osvle6I1nDqvXLgg6Kgep3Yog5RyTL+o
 pNNBf9Lcqj9j52riGitHiHGa8apvy+45TGazRncukQCXcZQsb2DgXJzkI g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10263"; a="314606209"
X-IronPort-AV: E=Sophos;i="5.88,382,1635231600"; d="scan'208";a="314606209"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2022 20:28:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,382,1635231600"; d="scan'208";a="490081953"
Received: from penglin1-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.88.150])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2022 20:28:22 -0800
Date: Sat, 19 Feb 2022 20:28:26 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 02/16] iosys-map: Add a few more helpers
Message-ID: <20220220042826.ftqf2l7tuegoktoc@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220216174147.3073235-1-lucas.demarchi@intel.com>
 <20220216174147.3073235-3-lucas.demarchi@intel.com>
 <06e6035e-bbba-f158-63b7-7d10327b7a80@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06e6035e-bbba-f158-63b7-7d10327b7a80@suse.de>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Matt Atwood <matthew.s.atwood@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 09:42:08AM +0100, Thomas Zimmermann wrote:
>Hi
>
>Am 16.02.22 um 18:41 schrieb Lucas De Marchi:
>>First the simplest ones:
>>
>>	- iosys_map_memset(): when abstracting system and I/O memory,
>>	  just like the memcpy() use case, memset() also has dedicated
>>	  functions to be called for using IO memory.
>>	- iosys_map_memcpy_from(): we may need to copy data from I/O
>>	  memory, not only to.
>>
>>In certain situations it's useful to be able to read or write to an
>>offset that is calculated by having the memory layout given by a struct
>>declaration. Usually we are going to read/write a u8, u16, u32 or u64.
>>
>>As a pre-requisite for the implementation, add iosys_map_memcpy_from()
>>to be the equivalent of iosys_map_memcpy_to(), but in the other
>>direction. Then add 2 pairs of macros:
>>
>>	- iosys_map_rd() / iosys_map_wr()
>>	- iosys_map_rd_field() / iosys_map_wr_field()
>>
>>The first pair takes the C-type and offset to read/write. The second
>>pair uses a struct describing the layout of the mapping in order to
>>calculate the offset and size being read/written.
>>
>>We could use readb, readw, readl, readq and the write* counterparts,
>>however due to alignment issues this may not work on all architectures.
>>If alignment needs to be checked to call the right function, it's not
>>possible to decide at compile-time which function to call: so just leave
>>the decision to the memcpy function that will do exactly that.
>>
>>Finally, in order to use the above macros with a map derived from
>>another, add another initializer: IOSYS_MAP_INIT_OFFSET().
>>
>>v2:
>>   - Rework IOSYS_MAP_INIT_OFFSET() so it doesn't rely on aliasing rules
>>     within the union
>>   - Add offset to both iosys_map_rd_field() and iosys_map_wr_field() to
>>     allow the struct itself to be at an offset from the mapping
>>   - Add documentation to iosys_map_rd_field() with example and expected
>>     memory layout
>>v3:
>>   - Drop kernel.h include as it's not needed anymore
>>
>>Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>Cc: Christian König <christian.koenig@amd.com>
>>Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>>Cc: dri-devel@lists.freedesktop.org
>>Cc: linux-kernel@vger.kernel.org
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>>Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
>
>Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks. I applied the first 2 patches to drm-intel-next.

The rest can't be applied as there are conflicts between drm-intel-next
and drm-intel-gt-next. I should have merged the rename to
drm-intel-gt-next since the guc patches need to be applied there.
I guess the rest will have to wait some tree propagation.


Lucas De Marchi
