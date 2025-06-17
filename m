Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEBBADD010
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 16:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE43410E70E;
	Tue, 17 Jun 2025 14:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="guK+8hum";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F2510E18F;
 Tue, 17 Jun 2025 14:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8eHJgER+R9kCEbZ1L3X7vCzptyp1NrKUg6DntB/MAXQ=; b=guK+8hum7ftX7NWo0v1A9Olhcl
 In/Q4ehx8mgJVGTwOWlqldsRPcgAkjfFaKZ+fF6Y//y+E0iaheLKwJWun7RzevFBNSeuLMqfq2D3Y
 cKtTPBq6J/jzcFAqMwSwefENE4S83b3r6cwg5weJT9xQCFD+D5q/ixn92ehtGEzEp0q3wtpC+rCk3
 T1Vxf74wkgPXl3892YyYMwBgDgHyFL9+dnyTZLbKViYR5JlQzlxdCHVeohptTZGIy201ogTJxSorz
 9iAACx5DWMXG8Z+WEFDWGkb40Lr7Brqr/9c4N3u37V3fMy/wjFXTqixdXRCOzw9Yl/K1Wuy98d/kC
 Kl5g6tmQ==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uRXRx-004dC5-5G; Tue, 17 Jun 2025 16:38:09 +0200
Message-ID: <7d82dbc2-b902-498b-a70d-8be49c1be87a@igalia.com>
Date: Tue, 17 Jun 2025 11:38:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] drm/amdgpu: Make use of drm_wedge_task_info
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: jani.nikula@linux.intel.com, Raag Jadav <raag.jadav@intel.com>,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 simona@ffwll.ch, linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, siqueira@igalia.com, airlied@gmail.com
References: <20250617124949.2151549-1-andrealmeid@igalia.com>
 <20250617124949.2151549-7-andrealmeid@igalia.com>
 <5db1dda6-0cd7-4fc7-9a22-8ed57b12ada1@amd.com>
 <63b4fb79-8132-4c05-bcac-3238366899d9@igalia.com>
Content-Language: en-US
In-Reply-To: <63b4fb79-8132-4c05-bcac-3238366899d9@igalia.com>
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

Em 17/06/2025 10:22, André Almeida escreveu:
> Em 17/06/2025 10:07, Christian König escreveu:
>> On 6/17/25 14:49, André Almeida wrote:
>>> To notify userspace about which task (if any) made the device get in a
>>> wedge state, make use of drm_wedge_task_info parameter, filling it with
>>> the task PID and name.
>>>
>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Do you have commit right for drm-misc-next?
>>
> 
> Thanks for the reviews!
> 
> I do have access, but if you don't mind, can you push this one?
> 

Never mind, I can push this one myself :)
