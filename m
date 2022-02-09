Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B5E4AEA7A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 07:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D39910E2E4;
	Wed,  9 Feb 2022 06:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC5E10E2E4;
 Wed,  9 Feb 2022 06:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644388994; x=1675924994;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zlXbUZz2vYoVlpMq7pYN1eHaPofiuIFPWABuJTqRbIw=;
 b=HIUFe8zzzKbvUGf45gvki5l/bqjNZqukZ43ID2+NL4ITeiOldF8+Ve10
 NGHX6uVbppyiBaEtRzLLVGLotlreH63PIj+MuGFhOABehhUZMflRpECOu
 ssK3G3RKhDU5cZsbHkvuA0eq4OaD8IadKMbUFNUtEeqO9DQqbcePcgIGT
 Jls3TIM8sYJouga6D9+3d6E0hOYWd01dADr+Y4wKEHCxS1qfjswHmqxk4
 fi/beDLIBSbtcWpnZWzq0g2ER1ixkIZm0CUDg1GMoZZgziNgrNgVtF8C5
 Of4Xec50gulRKDh/cIuQD/1JO5njY/8mzIqBsgFUFoP4FldWukNsN76d1 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="273670243"
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; d="scan'208";a="273670243"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 22:43:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; d="scan'208";a="540964099"
Received: from ymtarple-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.231.100])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 22:43:13 -0800
Date: Tue, 8 Feb 2022 22:43:13 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 02/18] iosys-map: Add a few more helpers
Message-ID: <20220209064313.ithagwtjztcf4jfb@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220208104524.2516209-1-lucas.demarchi@intel.com>
 <20220208104524.2516209-3-lucas.demarchi@intel.com>
 <863e61f9-2888-11a2-271b-a443f4681987@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <863e61f9-2888-11a2-271b-a443f4681987@suse.de>
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
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 09, 2022 at 07:23:04AM +0100, Thomas Zimmermann wrote:
>Hi
>
>Am 08.02.22 um 11:45 schrieb Lucas De Marchi:
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
>>
>>Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>Cc: Christian König <christian.koenig@amd.com>
>>Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>>Cc: dri-devel@lists.freedesktop.org
>>Cc: linux-kernel@vger.kernel.org
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  include/linux/iosys-map.h | 202 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 202 insertions(+)
>>
>>diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
>>index edd730b1e899..c6b223534b21 100644
>>--- a/include/linux/iosys-map.h
>>+++ b/include/linux/iosys-map.h
>>@@ -6,6 +6,7 @@
>>  #ifndef __IOSYS_MAP_H__
>>  #define __IOSYS_MAP_H__
>>+#include <linux/kernel.h>
>>  #include <linux/io.h>
>>  #include <linux/string.h>
>
>Alphabetically sorted, please.
>
>What requires kernel.h? Can this be reduced to another include 
>statement? Maybe stddef.h for offsetof() ?

Humn... I believe it was something in the previous implementation that
is not there anymore. Because this builds fine without the include now
and I don't think it is something being included by the headers already
here.  So this additional include can just be removed.

Lucas De Marchi
