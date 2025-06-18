Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F74ADECBB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 14:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054EE10E1DD;
	Wed, 18 Jun 2025 12:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fheX8NLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FC310E815;
 Wed, 18 Jun 2025 12:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=llImzjIbhjZJrpdOHyErF1aaIt3Spa/yRg33TxcGabE=; b=fheX8NLdVkqkIqxe97nkmLdrFM
 lbcNCNW+ClOA5yZo3mKOr60il84d7TwCZm7Tluk+9xQ0029jpCSZ92MxM92PmQIUu4QpBZOYW8UZ6
 AS5/gjcWMmUVY2qToLuyGgDwNm9N5lNexQhHIlfzx5Os+rC+LqMhu+m6e/NCxVBQcMTu42vR8ds4l
 R3cLO5pvkCmQ7xjTkidRLakqbPneVuLdpT9q/BRzj902dmn3KXGlObf143mv9OPhrR5v43fJ1KW7F
 bZcQsOBfgSaipj45CqazW1cpkQLYI4uHL/IPAbW1RJmCe66gWk8BhayTie9k1f9dYpuAMzwx38iHH
 dw0Jxf2g==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uRs4Y-00543t-61; Wed, 18 Jun 2025 14:39:22 +0200
Message-ID: <c62c2994-19e3-4599-9ac9-d49c37845011@igalia.com>
Date: Wed, 18 Jun 2025 09:39:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] drm/amdgpu: Make use of drm_wedge_task_info
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, siqueira@igalia.com,
 airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20250617124949.2151549-1-andrealmeid@igalia.com>
 <20250617124949.2151549-7-andrealmeid@igalia.com>
 <5db1dda6-0cd7-4fc7-9a22-8ed57b12ada1@amd.com>
 <63b4fb79-8132-4c05-bcac-3238366899d9@igalia.com>
 <a0f508fd-3277-4839-a4b6-e6bc56546f6c@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <a0f508fd-3277-4839-a4b6-e6bc56546f6c@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

Em 18/06/2025 04:29, Christian König escreveu:
> On 6/17/25 15:22, André Almeida wrote:
>> Em 17/06/2025 10:07, Christian König escreveu:
>>> On 6/17/25 14:49, André Almeida wrote:
>>>> To notify userspace about which task (if any) made the device get in a
>>>> wedge state, make use of drm_wedge_task_info parameter, filling it with
>>>> the task PID and name.
>>>>
>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>
>>> Do you have commit right for drm-misc-next?
>>>
>>
>> Thanks for the reviews!
>>
>> I do have access, but if you don't mind, can you push this one?
> 
> Sure, but give me till the end of today.
> 

It was already merged, no worries!

