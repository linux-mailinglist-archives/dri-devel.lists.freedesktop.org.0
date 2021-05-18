Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D80E3387DE1
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 18:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED22D6EC3D;
	Tue, 18 May 2021 16:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4078D6EC3D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 16:49:04 +0000 (UTC)
IronPort-SDR: 9fVLS0e8YX1tmX4Ci3r/a/z+bX/2fe6FY+OjF5533SevNhKH79hcVe100SCUgsEle9dZNR43X8
 Sga4xXyY8HFg==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="188170644"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="188170644"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 09:49:03 -0700
IronPort-SDR: juxMIJjxygUOaqjT2bUrWcTGvpmwwDtd9QETLyMpEpfFWhGYH84RrAIFru7O3EP9SEYwnOiU/Q
 rvnfYgrPpY4g==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; d="scan'208";a="439522017"
Received: from cbackhau-mobl.ger.corp.intel.com (HELO [10.252.37.121])
 ([10.252.37.121])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 09:49:02 -0700
Subject: Re: [PATCH v2 13/15] drm/ttm: Add BO and offset arguments for
 vm_access and vm_fault ttm handlers.
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210518145543.1042429-1-thomas.hellstrom@linux.intel.com>
 <9e465ab2-4272-4a41-2ebf-4b34d4724f77@amd.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <b5483666-4bb6-d297-ff39-8fdad19ce4ef@linux.intel.com>
Date: Tue, 18 May 2021 18:49:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <9e465ab2-4272-4a41-2ebf-4b34d4724f77@amd.com>
Content-Type: text/plain; charset=utf-8
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 18-05-2021 om 17:07 schreef Christian König:
> Am 18.05.21 um 16:55 schrieb Thomas Hellström:
>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>
>> This allows other drivers that may not setup the vma in the same way
>> to use the ttm bo helpers.
>
> Uff can you please explain why exactly you need that?
>
> Providing the BO is not much of a problem, but having the BO at different VMA offsets is really a no-go with TTM. 

i915 has its own mmap allocation handling to handle caching modes, and wouldn't use TTM's vma handling. But we do want to use the ttm fault handlers, which only need mmap_base + bo to work correctly.

~Maarten

