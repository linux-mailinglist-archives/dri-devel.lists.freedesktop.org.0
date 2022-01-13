Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AF648D86A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 14:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2CE10FE14;
	Thu, 13 Jan 2022 13:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B077410FE14
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642078864; x=1673614864;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=32/jYdeCU2X6mvfWD1NZQLh3feFmBCWh91f1bLsYOlw=;
 b=nZHkMM69pz4tY1uG9Cv57C7iBUttLO1pEwKjnNl2sj1k9aLj5AH9n74b
 LuXgfYOj0a1OWeSJt8ciuGeMx/IiNQUVdn7wkLr6GPXSSFiQC8BbwB/I/
 zZb6tTmC+SvBQXLbB3o8Gst5Zem25Cn29AfTWTXAlHFpiHkMwldSFRzLG
 K7HX0mXoE7MJ5ao+JMvkcqbgjtBN6iuMpByjNPh9duE1cEv/z1MPFL4be
 zg1ABJDq7cuCizXYOTabgV/voqxcR9pkZZpr6QqchqiegdvnpQh+QfeqN
 hyVzqanuz6tKaGRyT92TLgEPQGYYdPSj6ojRQCxoX0pMIhyZkXnLZdgU8 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="330349658"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="330349658"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 05:00:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="473208325"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga003.jf.intel.com with ESMTP; 13 Jan 2022 05:00:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 13 Jan 2022 05:00:47 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 13 Jan 2022 05:00:46 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2308.020;
 Thu, 13 Jan 2022 05:00:46 -0800
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>, "guangming.cao@mediatek.com"
 <guangming.cao@mediatek.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>
Subject: RE: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
Thread-Topic: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
Thread-Index: AQHYCHnKJjUnVmCmlECrXD1d8qRuLKxg6T0QgAAAbjA=
Date: Thu, 13 Jan 2022 13:00:46 +0000
Message-ID: <e657f5257cbf4955817b0bbf037de9f9@intel.com>
References: <CAO_48GF=ttKqSOm9GRoA3Mq+-RQOtRjWp449XPcz-wH=kjaTjw@mail.gmail.com>
 <20220113123406.11520-1-guangming.cao@mediatek.com>
 <4f88205c1b344aea8608960e2f85b8f4@intel.com>
In-Reply-To: <4f88205c1b344aea8608960e2f85b8f4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>,
 "libo.kang@mediatek.com" <libo.kang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "yf.wang@mediatek.com" <yf.wang@mediatek.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "lmark@codeaurora.org" <lmark@codeaurora.org>,
 "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>,
 "bo.song@mediatek.com" <bo.song@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "mingyuan.ma@mediatek.com" <mingyuan.ma@mediatek.com>,
 "labbott@redhat.com" <labbott@redhat.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "jianjiao.zeng@mediatek.com" <jianjiao.zeng@mediatek.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Ruhl, Michael J
>Sent: Thursday, January 13, 2022 7:58 AM
>To: guangming.cao@mediatek.com; sumit.semwal@linaro.org
>Cc: jianjiao.zeng@mediatek.com; lmark@codeaurora.org;
>wsd_upstream@mediatek.com; christian.koenig@amd.com; linux-
>kernel@vger.kernel.org; dri-devel@lists.freedesktop.org;
>yf.wang@mediatek.com; linaro-mm-sig@lists.linaro.org; linux-
>mediatek@lists.infradead.org; libo.kang@mediatek.com;
>benjamin.gaignard@linaro.org; bo.song@mediatek.com;
>matthias.bgg@gmail.com; labbott@redhat.com;
>mingyuan.ma@mediatek.com; linux-arm-kernel@lists.infradead.org; linux-
>media@vger.kernel.org
>Subject: RE: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
>
>
>>-----Original Message-----
>>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>>guangming.cao@mediatek.com
>>Sent: Thursday, January 13, 2022 7:34 AM
>>To: sumit.semwal@linaro.org
>>Cc: linux-arm-kernel@lists.infradead.org; mingyuan.ma@mediatek.com;
>>Guangming <Guangming.Cao@mediatek.com>;
>>wsd_upstream@mediatek.com; linux-kernel@vger.kernel.org; dri-
>>devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org;
>>yf.wang@mediatek.com; libo.kang@mediatek.com;
>>benjamin.gaignard@linaro.org; bo.song@mediatek.com;
>>matthias.bgg@gmail.com; linux-mediatek@lists.infradead.org;
>>lmark@codeaurora.org; labbott@redhat.com; christian.koenig@amd.com;
>>jianjiao.zeng@mediatek.com; linux-media@vger.kernel.org
>>Subject: [PATCH v3] dma-buf: dma-heap: Add a size check for allocation
>>
>>From: Guangming <Guangming.Cao@mediatek.com>
>>
>>Add a size check for allocation since the allocation size is
>>always less than the total DRAM size.
>>
>>Without this check, once the invalid size allocation runs on a process th=
at
>>can't be killed by OOM flow(such as "gralloc" on Android devices), it wil=
l
>>cause a kernel exception, and to make matters worse, we can't find who ar=
e
>>using
>>so many memory with "dma_buf_debug_show" since the relevant dma-buf
>>hasn't exported.
>>
>>To make OOM issue easier, maybe need dma-buf framework to dump the
>>buffer size
>>under allocating in "dma_buf_debug_show".
>>
>>Signed-off-by: Guangming <Guangming.Cao@mediatek.com>
>>Signed-off-by: jianjiao zeng <jianjiao.zeng@mediatek.com>
>>---
>>v3: 1. update patch, use right shift to replace division.
>>    2. update patch, add reason in code and commit message.
>>v2: 1. update size limitation as total_dram page size.
>>    2. update commit message
>>---
>> drivers/dma-buf/dma-heap.c | 10 ++++++++++
>> 1 file changed, 10 insertions(+)
>>
>>diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
>>index 56bf5ad01ad5..1fd382712584 100644
>>--- a/drivers/dma-buf/dma-heap.c
>>+++ b/drivers/dma-buf/dma-heap.c
>>@@ -55,6 +55,16 @@ static int dma_heap_buffer_alloc(struct dma_heap
>>*heap, size_t len,
>> 	struct dma_buf *dmabuf;
>> 	int fd;
>>
>>+	/*
>>+	 * Invalid size check. The "len" should be less than totalram.
>>+	 *
>>+	 * Without this check, once the invalid size allocation runs on a proce=
ss
>>that
>>+	 * can't be killed by OOM flow(such as "gralloc" on Android devices), i=
t
>>will
>>+	 * cause a kernel exception, and to make matters worse, we can't find
>>who are using
>>+	 * so many memory with "dma_buf_debug_show" since the relevant
>>dma-buf hasn't exported.
>>+	 */
>>+	if (len >> PAGE_SHIFT > totalram_pages())
>
>If your "heap" is from cma, is this still a valid check?

And thinking a bit further, if I create a heap from something else (say dev=
ice memory),
you will need to be able to figure out the maximum allowable check for the =
specific
heap.

Maybe the heap needs a callback for max size?

m
>M
>
>>+		return -EINVAL;
>> 	/*
>> 	 * Allocations from all heaps have to begin
>> 	 * and end on page boundaries.
>>--
>>2.17.1

