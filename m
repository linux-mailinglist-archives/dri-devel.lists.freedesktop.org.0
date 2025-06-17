Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E5DADD098
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 16:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E369910E5F2;
	Tue, 17 Jun 2025 14:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nBhkDjWB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C2910E727;
 Tue, 17 Jun 2025 14:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p5CNKE/MKysCW70lR/MO7TyeEBtlJwj3jdT2nsO0WMA=; b=nBhkDjWBLfpBJuZWGo5Gr/KSQW
 pA90MzdJjR84y0V0SnSWwGrLBxA2TQuGJwzf2towO4u4tt3F47DPmiVp56pE8jJWVSnOq7l7Rk0g9
 SjZYzEb7YO86zNLeOutSeytjnsAywlsuqG9bfO+wUf9u33UFTEGFZO+TW5O6tgMJZ9DBBg1ooFo+s
 223r5HY0cwpQPa3BiralF/8VzpHGjSRQxNSAKCDFADVZOE7RiOLcQYOl69w3vWSJdHEepfpz7G5rd
 kMxBYODYH+1cKo6AyHn3LJ574PrA8vSifImtxdFVNVoTOVX/RmcSQJoLkd45QEOuCAXkxEtSQqV54
 b7OpgK2Q==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uRXhf-004dZx-3T; Tue, 17 Jun 2025 16:54:23 +0200
Message-ID: <55ee0276-23c3-4853-b954-09aeccc59b7f@igalia.com>
Date: Tue, 17 Jun 2025 11:54:18 -0300
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
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <5db1dda6-0cd7-4fc7-9a22-8ed57b12ada1@amd.com>
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

Em 17/06/2025 10:07, Christian König escreveu:
> On 6/17/25 14:49, André Almeida wrote:
>> To notify userspace about which task (if any) made the device get in a
>> wedge state, make use of drm_wedge_task_info parameter, filling it with
>> the task PID and name.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Do you have commit right for drm-misc-next?
> 

I've merged the series into drm-misc-next.

Thanks!
	André

