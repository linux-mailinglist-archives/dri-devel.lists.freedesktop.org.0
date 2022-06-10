Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A34A546BB3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 19:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE1610E275;
	Fri, 10 Jun 2022 17:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98E010E275;
 Fri, 10 Jun 2022 17:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654882507; x=1686418507;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=d43e5TC+bc7iNjWBFu/zkReW9HV7lSnhJrhEHqSgkKk=;
 b=VkpfocaGtvpF2HDivyDr1BLWUoa3vdEEYF8YuiSq4zcTapNn4WLV/jmn
 4SAf3oItpCb4xVTVRCFu12OiCkIwwtwxFSMBDGF3Ci1DtVDUkY65FBIEN
 V4Le2QvlrTqUi0SwC13CIhqRggoesV78A2oIbeAl2E/CzAv2uY4FSjhUe
 snY3rzV8XNSrHFSfa7OSUoMr4wTi12qm3u8qvA2yI1gnNHcF3SEkIvXty
 UPFEy5GRCHSvPJZUrZIHo1/Gq26tWt0xhHErSGe6TwH1D6v/1zI+oNwka
 LDOnAZbJ631yiLh1w7jrUp58hkyaxENfCru0qmp/o1BwsXkbhJXho8tuo w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="341751743"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="341751743"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 10:35:07 -0700
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="671947302"
Received: from lmgloor-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.11.231])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 10:35:06 -0700
Date: Fri, 10 Jun 2022 10:35:06 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH] iosys-map: Add word-sized reads
Message-ID: <20220610173506.rbyajhgebmp6qdwz@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220609232020.2292649-1-lucas.demarchi@intel.com>
 <4faac373-1a30-e1a0-0c33-e10e8fc6184c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4faac373-1a30-e1a0-0c33-e10e8fc6184c@amd.com>
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 10, 2022 at 09:20:18AM +0200, Christian König wrote:
>Am 10.06.22 um 01:20 schrieb Lucas De Marchi:
>>Instead of always falling back to memcpy_fromio() for any size, prefer
>>using read{b,w,l}(). When reading struct members it's common to read
>>individual integer variables individually. Going through memcpy_fromio()
>>for each of them poses a high penalty.
>>
>>Employ a similar trick as __seqprop() by using _Generic() to generate
>>only the specific call based on a type-compatible variable.
>>
>>For a pariticular i915 workload producing GPU context switches,
>>__get_engine_usage_record() is particularly hot since the engine usage
>>is read from device local memory with dgfx, possibly multiple times
>>since it's racy. Test execution time for this test shows a ~12.5%
>>improvement with DG2:
>>
>>Before:
>>	nrepeats = 1000; min = 7.63243e+06; max = 1.01817e+07;
>>	median = 9.52548e+06; var = 526149;
>>After:
>>	nrepeats = 1000; min = 7.03402e+06; max = 8.8832e+06;
>>	median = 8.33955e+06; var = 333113;
>>
>>Other things attempted that didn't prove very useful:
>>1) Change the _Generic() on x86 to just dereference the memory address
>>2) Change __get_engine_usage_record() to do just 1 read per loop,
>>    comparing with the previous value read
>>3) Change __get_engine_usage_record() to access the fields directly as it
>>    was before the conversion to iosys-map
>>
>>(3) did gave a small improvement (~3%), but doesn't seem to scale well
>>to other similar cases in the driver.
>>
>>Additional test by Chris Wilson using gem_create from igt with some
>>changes to track object creation time. This happens to accidentaly
>>stress this code path:
>>
>>	Pre iosys_map conversion of engine busyness:
>>	lmem0: Creating    262144 4KiB objects took 59274.2ms
>>
>>	Unpatched:
>>	lmem0: Creating    262144 4KiB objects took 108830.2ms
>>
>>	With readl (this patch):
>>	lmem0: Creating    262144 4KiB objects took 61348.6ms
>>
>>	s/readl/READ_ONCE/
>>	lmem0: Creating    262144 4KiB objects took 61333.2ms
>>
>>So we do take a little bit more time than before the conversion, but
>>that is due to other factors: bringing the READ_ONCE back would be as
>>good as just doing this conversion.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>
>>If this is acceptable we should probably add the write counterpart, too.
>>Sending here only the read for now since this fixes the issue we are
>>seeing and to gather feedback.
>
>As far as I can see looks sane to me, but the kernel test robot tears 
>the patch apart.
>
>Probably just a typo somewhere in the 32bit handling.

oh, yeah... after cleaning it up I renamed s/__iosys_map_u64_case/__iosys_map_rd_io_u64_case/
to prepare for adding the write case and forgot the other side of the
ifdef.


>
>Apart from that looks good to me.

thanks
Lucas De Marchi

>
>Regards,
>Christian.
>
>>
>>  include/linux/iosys-map.h | 26 ++++++++++++++++++++++----
>>  1 file changed, 22 insertions(+), 4 deletions(-)
>>
>>diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
>>index e69a002d5aa4..4ae3e459419e 100644
>>--- a/include/linux/iosys-map.h
>>+++ b/include/linux/iosys-map.h
>>@@ -333,6 +333,20 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>>  		memset(dst->vaddr + offset, value, len);
>>  }
>>+#ifdef CONFIG_64BIT
>>+#define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)			\
>>+	u64: val_ = readq(vaddr_iomem_),
>>+#else
>>+#define __iosys_map_u64_case(val_, vaddr_iomem_)
>>+#endif
>>+
>>+#define __iosys_map_rd_io(val__, vaddr_iomem__, type__) _Generic(val__,	\
>>+	u8: val__ = readb(vaddr_iomem__),				\
>>+	u16: val__ = readw(vaddr_iomem__),				\
>>+	u32: val__ = readl(vaddr_iomem__),				\
>>+	__iosys_map_rd_io_u64_case(val__, vaddr_iomem__)		\
>>+	default: memcpy_fromio(&(val__), vaddr_iomem__, sizeof(val__)))
>>+
>>  /**
>>   * iosys_map_rd - Read a C-type value from the iosys_map
>>   *
>>@@ -346,10 +360,14 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
>>   * Returns:
>>   * The value read from the mapping.
>>   */
>>-#define iosys_map_rd(map__, offset__, type__) ({			\
>>-	type__ val;							\
>>-	iosys_map_memcpy_from(&val, map__, offset__, sizeof(val));	\
>>-	val;								\
>>+#define iosys_map_rd(map__, offset__, type__) ({				\
>>+	type__ val;								\
>>+	if ((map__)->is_iomem) {						\
>>+		__iosys_map_rd_io(val, (map__)->vaddr_iomem + offset__, type__);\
>>+	} else {								\
>>+		memcpy(&val, (map__)->vaddr + offset__, sizeof(val));		\
>>+	}									\
>>+	val;									\
>>  })
>>  /**
>
