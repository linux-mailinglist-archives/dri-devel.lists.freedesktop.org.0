Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB5D65F3F1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 19:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A983210E29C;
	Thu,  5 Jan 2023 18:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0743710E29C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 18:46:56 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 305Ikq5C115499;
 Thu, 5 Jan 2023 12:46:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1672944412;
 bh=6BdFBaPD4f7jUIg9kvMENeLbOeDSzeg006sNNeAlqNM=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=JLWsr2n3aZKgbGbiHL+tI+Sx7zWiGZD/B8EepOuxLIcYAsBd90Xu56UTL7CdHg8So
 o5WCA67aGoPObIlKe/fN/ILckd7t8OsdDQ2ChTUG7DDMTMfvUBBdKkVYrL21VBfNVm
 yP4Rzbbwz2t5HWn6iVuaOG26IWRy6K1I/RJsQF+A=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 305IkqCN017593
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 5 Jan 2023 12:46:52 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 5
 Jan 2023 12:46:52 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 5 Jan 2023 12:46:52 -0600
Received: from [10.249.32.231] (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 305Ikp3T013612;
 Thu, 5 Jan 2023 12:46:51 -0600
Message-ID: <5b068dd9-1363-f611-9f86-acc224c10621@ti.com>
Date: Thu, 5 Jan 2023 12:46:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 3/7] accel/ivpu: Add GEM buffer object management
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <oded.gabbay@gmail.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <quic_jhugo@quicinc.com>
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-4-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20221208110733.5498-4-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: andrzej.kacprowski@linux.intel.com, stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/8/22 5:07 AM, Jacek Lawrynowicz wrote:
> Adds four types of GEM-based BOs for the VPU:
>    - shmem
>    - userptr

Do you have some specific need for userptr that would not
be covered by prime import + heaps? I'm just trying to get
a feel for the typical use-cases for these.

Andrew

>    - internal
>    - prime
> 
> All types are implemented as struct ivpu_bo, based on
> struct drm_gem_object. VPU address is allocated when buffer is created
> except for imported prime buffers that allocate it in BO_INFO IOCTL due
> to missing file_priv arg in gem_prime_import callback.
> Internal buffers are pinned on creation, the rest of buffers types
> can be pinned on demand (in SUBMIT IOCTL).
> Buffer VPU address, allocated pages and mappings are relased when the
> buffer is destroyed.
> Eviction mechism is planned for future versions.
> 
> Add three new IOCTLs: BO_CREATE, BO_INFO, BO_USERPTR
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
