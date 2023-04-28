Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBFF6F18BB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 15:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22DB10ED43;
	Fri, 28 Apr 2023 13:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949E110ED40;
 Fri, 28 Apr 2023 13:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682686987; x=1714222987;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hYK1XSLoRGsBKCo9w+lFLE47lpEyIhbguL7HZvkfN5s=;
 b=YP/sLzxY2DPNtKFaoB0adgMKEbR41TRZVQbEcNtrLu0dgnyE+cDIhstU
 0P/W5hHFXlHYKgKSyDlX+6ps73F5YxX5O+MYQPzsn7tRDWLs2QGNBL02U
 X3d31P2Li0ZE3J3ZMlhxGqwTmHPb6mEqlU05CMQCMtk4lX5S8KjSFRiMl
 eN1RN2Un5zVuqLlRlLjGEzcNe0KRSAnZJTkFczYcGNC4sDOfN3U9w72nA
 fh3VYsP2cd/CxIbOGL7XxJSZg11KxCIvmGUbTjiBLNmJOEgrig1YtCkb1
 x+hrFGmwASONedTGLS+hsscjxM/fgrt0I5RU96cFQWREuG4o0MN9YL7qA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="350650511"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="350650511"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 06:03:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="764276437"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="764276437"
Received: from kdobkakr-mobl1.ger.corp.intel.com (HELO [10.249.254.45])
 ([10.249.254.45])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 06:03:03 -0700
Message-ID: <60bb9e25-062c-a893-d5cc-1c6f1362703c@linux.intel.com>
Date: Fri, 28 Apr 2023 15:03:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH] dma-buf/dma-fence: Use a successful read_trylock()
 annotation for dma_fence_begin_signalling()
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20230428125233.228353-1-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230428125233.228353-1-thomas.hellstrom@linux.intel.com>
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
Cc: linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/28/23 14:52, Thomas Hellström wrote:
> Condsider the following call sequence:
>
> /* Upper layer */
> dma_fence_begin_signalling();
> lock(tainted_shared_lock);
> /* Driver callback */
> dma_fence_begin_signalling();
> ...

The "Upper layer" here currently being the drm scheduler and "Driver 
callback" being an xe scheduler callback.

While opt-in annotating the drm scheduler would achieve the same result, 
I think this patch should be considered anyway, as I don't think we will 
miss any true lockdep violations as a result of it.

/Thomas


