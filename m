Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963307EE22D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 15:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAB310E28C;
	Thu, 16 Nov 2023 14:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B95710E28C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 14:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700143341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ify9Vvsur2tjiWibc1WjaPX2nLUPCNROFWZ7Gxf23VI=;
 b=FqlTQ1Es8lIKB67XWyEprqmI2WWWCr3bE9otNmM86tJ4ZXmupNgZMW0xOjGCu3qSEvDSrW
 uVEls0mRbM7TWwAG/lvLBTXviErjXWSqwHwmDmD4igel19q0ei/1KRYtYydwhbw1so1b2G
 xPkBR+ZaomW7+4tO2p297spLM9+rq5Q=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-ZCQgKTWYPM2Eaa3PzetfSQ-1; Thu, 16 Nov 2023 09:02:20 -0500
X-MC-Unique: ZCQgKTWYPM2Eaa3PzetfSQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9c7f0a33afbso60113566b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 06:02:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700143339; x=1700748139;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ify9Vvsur2tjiWibc1WjaPX2nLUPCNROFWZ7Gxf23VI=;
 b=k++yX6j5WD9AHag1sIDAN3cJ2ZZI2CXXxhTGnJRJBXfTiy3NHA93nGJuUPkeVDEatr
 hWLrR5Ccn88yD6EhhzZF1kQVZWJb7RdWVB/CdUL3OUuXpQ8JW17UTFwuU0wdJvtUex3s
 xDlW3AEyEcvHjiJ309fAHy4s+UZqN6gbczNjybwTYpdrYHnkppeCPylNZjGQWzPQdNtF
 C/T+tsPgJRO64HyW73mMLy0/RWYdP8PM1Abm2OTF0KqqHidPdEjobCU9cqmB4krGQlW9
 HHyUtJdZx4Yc5QkVJDHTZP0zHRbirrp6176MyEHzDe7t8sJyT3dyqt1+dWvqhzHVz8W5
 t3zg==
X-Gm-Message-State: AOJu0Ywld1Stbmgt2nudC0wUVhH1OJxIc8HyoU029rvVGKnxDvu/TZQL
 CG5eAEIti9HRgexQA6Ly8Nx3AUIa+xTvfsxnsRevIxz/rwZreZOA0o3kOQNS9nfRiSjtbWp578X
 hm/VbmrlNy0I2VO1iPUqQTtQQ5aSC
X-Received: by 2002:a17:906:e20c:b0:9e0:4910:1665 with SMTP id
 gf12-20020a170906e20c00b009e049101665mr10183260ejb.29.1700143339107; 
 Thu, 16 Nov 2023 06:02:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4pGsJb2OCA8cUb6M3QJESft2ul7MzFcR4nU6hjfBuLpwW0QUNLAHidXjV+1Rf6jlYCJQBRQ==
X-Received: by 2002:a17:906:e20c:b0:9e0:4910:1665 with SMTP id
 gf12-20020a170906e20c00b009e049101665mr10183242ejb.29.1700143338774; 
 Thu, 16 Nov 2023 06:02:18 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009bf7a4d591csm8606474ejb.11.2023.11.16.06.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 06:02:18 -0800 (PST)
Message-ID: <c129fa94-6456-4746-9477-737a0fb61f96@redhat.com>
Date: Thu, 16 Nov 2023 15:02:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] Documentation/gpu: VM_BIND locking document
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20231115124937.6740-1-thomas.hellstrom@linux.intel.com>
 <20231116104851.114bdb08@collabora.com>
 <0850281b667c4b88163dab60737dbc945ad742fd.camel@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <0850281b667c4b88163dab60737dbc945ad742fd.camel@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
 Oak Zeng <oak.zeng@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/16/23 12:48, Thomas Hellström wrote:

<snip>

>>> +Locks used and locking orders
>>> +=============================
>>> +
>>> +One of the benefits of VM_BIND is that local GEM objects share the
>>> gpu_vm's
>>> +dma_resv object and hence the dma_resv lock. So even with a huge
>>> +number of local GEM objects, only one lock is needed to make the
>>> exec
>>> +sequence atomic.
>>> +
>>> +The following locks and locking orders are used:
>>> +
>>> +* The ``gpu_vm->lock`` (optionally an rwsem). Protects how the
>>> gpu_vm is
>>> +  partitioned into gpu_vmas. It can also protect the gpu_vm's list
>>> of
>>> +  userptr gpu_vmas. With a CPU mm analogy this would correspond to
>>> the
>>> +  mmap_lock.
>>
>> I don't see any drm_gpuvm::lock field in Danilo's latest patchset,
>> so,
>> unless I missed one version, and this lock is actually provided by
>> drm_gpuvm, I would mention this is a driver-specific lock. This
>> comment
>> applies to all the locks you describe here actually (mention which
>> ones
>> are provided by drm_gpuvm, and which ones are driver-specific).
> 
> These will be needed also by gpuvm when implementing userptr vmas, so I
> can mention that drm_gpuvm is currently lacking a userptr
> implementation, so "the locks described below are to be considered
> driver-specific for now"

Since Xe already implements userptr support, are you guys maybe interested
in extending drm_gpuvm accordingly? :-)

