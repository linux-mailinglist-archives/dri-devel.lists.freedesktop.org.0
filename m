Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA847F27BB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 09:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE7E10E298;
	Tue, 21 Nov 2023 08:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C16610E298;
 Tue, 21 Nov 2023 08:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700556123; x=1732092123;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0MNGK9YZBkizi/IsudxxJh25bd58QtBgiGdEbXBMtCg=;
 b=SMZvJUKUh2PyZ6O9i8mbINXgk+jAnVnAiL9zaxzNWnUirpttjuHjWvFL
 KU+xZStH+HOJiQJM9tsIpJmglCLQU9LE6mEhbsUln2DfsnhfpZeeVL6Ol
 wEpcS39Vvp0fPgBCmbaf0AO5KEgcE22xf8nOzOTHlw+4WuFYpf4dimqtU
 PG7xOXCwD4wlZOZ75ELnpY8s/F+48L3QKVNK5nRXgYn7d/cjOi4Hn8Chz
 hnlojBHI3TF8zhWysAbnFHAz1RjjyrdHhjnjY4rsCk2OxSEKyDy1Sd/tw
 ODqG4QX+VLkOIOEPYtFqZfl8VX9a/+MkGSgx+Jej9b/K7gi3dEMxUkq6+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="4919763"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="4919763"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 00:42:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="770192525"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="770192525"
Received: from hasifnax-mobl1.gar.corp.intel.com (HELO [10.249.254.143])
 ([10.249.254.143])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 00:41:57 -0800
Message-ID: <a0e64d21-799f-bb0d-c2e5-d4daadc13488@linux.intel.com>
Date: Tue, 21 Nov 2023 09:41:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4] Documentation/gpu: VM_BIND locking document
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231115124937.6740-1-thomas.hellstrom@linux.intel.com>
 <20231116104851.114bdb08@collabora.com>
 <0850281b667c4b88163dab60737dbc945ad742fd.camel@linux.intel.com>
 <20231116142707.044aeec2@collabora.com>
 <656d5f890de7ba3af05616122a9bd399badd35bc.camel@linux.intel.com>
 <20231116154708.148ce241@collabora.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231116154708.148ce241@collabora.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, linux-kernel@vger.kernel.org,
 Oak Zeng <oak.zeng@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Boris

On 11/16/23 15:47, Boris Brezillon wrote:
> On Thu, 16 Nov 2023 14:53:50 +0100
> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>
>> On Thu, 2023-11-16 at 14:27 +0100, Boris Brezillon wrote:
>>> On Thu, 16 Nov 2023 12:48:45 +0100
>>> Thomas Hellström <thomas.hellstrom@linux.intel.com> wrote:
>>>    
>>>> Hi, Boris,
>>>>
>>>> Thanks for reviewing. Some comments below:
>>>>
I'm going to send out an updated version today with I think all of 
Danilo's comments and must of yours addressed. While I added more 
references to GPUVM, mainly as code examples and explanations, I've 
intentionally left out the "This is a driver lock and this is a gpvum 
lock distinction", The reason is twofold. First I think that when we get 
userptr into gpvum, gpuvm needs to be aware of most if not all locks. 
Second, since this document is an implementation guideline and gpuvm is 
an implementation it makes more sense to me to add pointers from the 
GPUVM documentation to the VM_BIND locking guideline, and that could be 
a task to be looked at after merging this together with implementing the 
userptr stuff. The most important thing at this point is that the 
document doesn't conflict in any way with the gpuvm implementation, and 
I've fixed those parts where I missed the separate lock protecting the 
GEM object's vm_bo list that you pointed out.

I strongly think this is the right way to go but if you disagree to the 
point where you're not willing to provide an ack or R-B, let me know and 
we can look at adding what's missing.

Thanks,

Thomas


