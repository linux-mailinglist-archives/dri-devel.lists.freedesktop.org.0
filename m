Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72040387982
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 15:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7456EB61;
	Tue, 18 May 2021 13:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01E16EB61;
 Tue, 18 May 2021 13:06:05 +0000 (UTC)
IronPort-SDR: HeJlBocQsFeOxR44ZxnZCa47vjKqPKbT8z6fs7djiEjLqfvyfZoUe8ebekm9U8zat90j6rvJyL
 zRC/RBIC2ZfQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="198754014"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="198754014"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 06:06:05 -0700
IronPort-SDR: J3O8coO30SNUe+MOJEe/x2gRUPB21dxPslGRmw9lBMT7K9AKXtnvqmlaR94rDNIw39259tF9P9
 BNQzn5o5yJMA==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="438657089"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO [10.249.254.195])
 ([10.249.254.195])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 06:06:04 -0700
Subject: Re: [PATCH v2 04/15] drm/ttm: Export functions to initialize and
 finalize the ttm range manager standalone
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-5-thomas.hellstrom@linux.intel.com>
 <3feacf02-0854-68d4-f26b-88ed0528e9ff@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <00ada105-d0f4-f556-3eba-8503ea73c408@linux.intel.com>
Date: Tue, 18 May 2021 15:06:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <3feacf02-0854-68d4-f26b-88ed0528e9ff@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/18/21 1:51 PM, Christian König wrote:
> Am 18.05.21 um 10:26 schrieb Thomas Hellström:
>> i915 mock selftests are run without the device set up. In order to be 
>> able
>> to run the region related mock selftests, export functions in order 
>> for the
>> TTM range manager to be set up without a device to attach it to.
>
> From the code it looks good, but to be honest I don't think that this 
> makes much sense from the organizational point of view.
>
> If a self test exercises internals of TTM it should be moved into TTM 
> as well.

This particular selftest actually exercises i915 memory regions which is 
a level above TTM, but the memory regions are backed by TTM. Since they 
are mock selftests they don't have a TTM device. For the buddy allocator 
the situation would be the same, but there we have selftests that 
exercise the allocator standalone, and those would probably fit best 
into a TTM selftest infrastructure.

Although in this particular case, we could of course add a mock TTM 
device and be done. Pls let me know what you think.

/Thomas


