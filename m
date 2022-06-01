Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A52153A91D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 16:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5825910E1E8;
	Wed,  1 Jun 2022 14:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF1310E0A2;
 Wed,  1 Jun 2022 14:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654093553; x=1685629553;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ok9XCk80NNrThXBexGr1H8fx2eF3kbnPs/42iX0qct4=;
 b=SG6ej8qx21OZsHr7lil3MAGDHl6sOd4Og/D63BsdYLS9AODZnOrP2cDe
 oaTJZccu94lSq5nR7lnKhHF/B+Qs2UZocVZJ/3nfSibRLi7Vd9Ptvnmza
 VrtQza2AplFds0Ki2uR6fJZ59leMF9KSrZwkCxkvLvIvDlj+ukilfQK8/
 9HOcLhp16alhiJvQ+u7yJTOnqFzhXn+VhRIFnuZhJ/t73k+WJ8h/gTWek
 4jlJcXE9bv907u56cXyGhlHwkxq4hhAl0rkYQVr58sH5OX6vL4fGOpB0S
 eQ1wg580qBD8cSGUHIlBONrEIZUkXK6OtDXJJBiYYfIUgUoYMmvw5iFis w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="274406445"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="274406445"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 07:25:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="612342020"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 01 Jun 2022 07:25:52 -0700
Received: from [10.249.151.195] (unknown [10.249.151.195])
 by linux.intel.com (Postfix) with ESMTP id D39A6580514;
 Wed,  1 Jun 2022 07:25:50 -0700 (PDT)
Message-ID: <43746609-4f60-f347-5934-6680516297dd@intel.com>
Date: Wed, 1 Jun 2022 17:25:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Intel-gfx] [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design
 document
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@intel.com
References: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
 <20220517183212.20274-2-niranjana.vishwanathapura@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20220517183212.20274-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: thomas.hellstrom@intel.com, christian.koenig@amd.com,
 chris.p.wilson@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2022 21:32, Niranjana Vishwanathapura wrote:
> +VM_BIND/UNBIND ioctl will immediately start binding/unbinding the mapping in an
> +async worker. The binding and unbinding will work like a special GPU engine.
> +The binding and unbinding operations are serialized and will wait on specified
> +input fences before the operation and will signal the output fences upon the
> +completion of the operation. Due to serialization, completion of an operation
> +will also indicate that all previous operations are also complete.

I guess we should avoid saying "will immediately start 
binding/unbinding" if there are fences involved.

And the fact that it's happening in an async worker seem to imply it's 
not immediate.


I have a question on the behavior of the bind operation when no input 
fence is provided. Let say I do :

VM_BIND (out_fence=fence1)

VM_BIND (out_fence=fence2)

VM_BIND (out_fence=fence3)


In what order are the fences going to be signaled?

In the order of VM_BIND ioctls? Or out of order?

Because you wrote "serialized I assume it's : in order


One thing I didn't realize is that because we only get one "VM_BIND" 
engine, there is a disconnect from the Vulkan specification.

In Vulkan VM_BIND operations are serialized but per engine.

So you could have something like this :

VM_BIND (engine=rcs0, in_fence=fence1, out_fence=fence2)

VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)


fence1 is not signaled

fence3 is signaled

So the second VM_BIND will proceed before the first VM_BIND.


I guess we can deal with that scenario in userspace by doing the wait 
ourselves in one thread per engines.

But then it makes the VM_BIND input fences useless.


Daniel : what do you think? Should be rework this or just deal with wait 
fences in userspace?


Sorry I noticed this late.


-Lionel


