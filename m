Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 696EE7EC98A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 18:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3F810E0E0;
	Wed, 15 Nov 2023 17:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC32C10E0D2;
 Wed, 15 Nov 2023 17:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700068754; x=1731604754;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wx2SPvBGnpmVTAWmi/aj6F1855YCm7c7ct3xuZhFHrU=;
 b=GFFO4WzbwL4gGSdBiW7KtJOedV1UHtatR70wzolQ8Yp2I61WcgaNSRkX
 LvZ8BhWVGTZPdFGoskv0VETqbuVdLSLA+Miztzy/Sdi8INY+sYg4QKEQ/
 qf/mihgWaZsAK2zFwXtFCEyXIQaWK5BDclMthaYexyOotxUoPlQqHkGRw
 EVxZhypykPIisdHaWTiRh08PeVVR/X4Px0iC9fG7OuQ33fimBVXUZlZDM
 SDLXNVazweXm51u4+Qwp1VJDpLQ4MP5xiLpqR/D1bv37T/FrWBszSoxEO
 nCWQEp+5Y3JVuBlHcWrzVUiI4gVGuzp/mfMSs3GCnDkm9TjE/C1ZTzmVz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="393768723"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="393768723"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 09:19:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="794213200"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="794213200"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO [10.249.254.116])
 ([10.249.254.116])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 09:19:08 -0800
Message-ID: <3c4b2eea-6292-a82e-d862-98cf1a3e22bc@linux.intel.com>
Date: Wed, 15 Nov 2023 18:18:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4] Documentation/gpu: VM_BIND locking document
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>
References: <20231115124937.6740-1-thomas.hellstrom@linux.intel.com>
 <ZVTfmbDz1HGqt4Ef@pollux>
 <62cdf31f6dbbb3a114755affc89d22fde875c3ff.camel@linux.intel.com>
 <05cf6199-3884-4e46-90ac-0b8df7420af7@redhat.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <05cf6199-3884-4e46-90ac-0b8df7420af7@redhat.com>
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
 Oak Zeng <oak.zeng@intel.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/15/23 18:02, Danilo Krummrich wrote:
> On 11/15/23 17:04, Thomas Hellström wrote:
>> Hi, Danilo,
>>
>> On Wed, 2023-11-15 at 16:11 +0100, Danilo Krummrich wrote:
>>> On Wed, Nov 15, 2023 at 01:49:37PM +0100, Thomas Hellström wrote:
>>>> Add the first version of the VM_BIND locking document which is
>>>> intended to be part of the xe driver upstreaming agreement.
>>>>
>>>> The document describes and discuss the locking used during exec-
>>>> functions, evicton and for userptr gpu-vmas. Intention is to be
>>>> using the
>>>> same nomenclature as the drm-vm-bind-async.rst.
>>>>
>>
>> Thanks for reviewing. I'll update the document accordingly except for
>> the s/an rwsem/a rwsem/g, I think it's "an rwsem" similarly to "an r".
>
> I read it as "read-write-sem". Would you read it as "ar-double-u-sem"
> then I guess?
>
Yes. :)

/Thomas


>>
>> /Thomas
>>
>
