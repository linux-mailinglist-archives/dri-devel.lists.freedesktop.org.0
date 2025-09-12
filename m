Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 459E3B5591D
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 00:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A39A10E00E;
	Fri, 12 Sep 2025 22:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mJb7yI1D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A98510E00E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 22:25:13 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2445805aa2eso20795565ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 15:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757715913; x=1758320713; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2KLKlGBJI1d0fx9t2uSJ4mzy0rd5NfzB4VUuG4EkoD8=;
 b=mJb7yI1DzqtU939WC24chGTmhedcFIhqiFcHsK25diOr8mqVmRsCx6HU8GAcwIdOnx
 IfFzgYc+WF4edrD6FM+A3yafPwyQGpjjEtNyYAyHRL0YzabDVAfbPl7OkJpT3RrpuOiX
 NxUCVOhXIgTlZH/kOjhyFizdYXclosRF6Hyb3cCba8VcvgC7Nwd4SoAU/LtDLn53CR5b
 1Cv506GgUFdMDNAHrIqYTiTVx+A394EZYBRBzGqVYd9qLCPxjDgv/J0BwaK9Fqi77tp/
 up06fwmgth4os8b3HvW6GIkGoM/udbkkIYo78w2KsIe1OX6TEK9HpciB4emMAOsSJvG3
 vM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757715913; x=1758320713;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2KLKlGBJI1d0fx9t2uSJ4mzy0rd5NfzB4VUuG4EkoD8=;
 b=CckQcL2gRce99knPoivJ9cz3hUnAfevHIT4hHXZr0QnqLhAJ95vOs9jcHNneTVf5sO
 EjNUdV9zVkC5El99lpCFvqhJFuvyx1fLpV2MKl1/4nEVBcp4ZmrNbkS9u3DRZqUblgdl
 9g/IGPNoVeV41upFVNzNKtAjrkpuzWLyjjapa/pyZGMgyQYb8OCdx0GNq8Nayhx6M/SZ
 T3ivCgi8WejI67KywOOdi+cRPKMIIcombn5F1Nto/SEnxU46lZyssQFYTIu6XGkYiNIP
 tXS/Nlz66M9h11bHPQVuQsOK5VAy/Lh9YVLPOV8sv3oYJywnnqVdW3T5t4pBdL4y6grn
 q9XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpuAM/AKbvKiOiG76LlZyiCJY7JQzEDveZWh6etrXuAMkkMvHwv7yudOstsnA3Y1+B5KW2+mfAl+8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQtM4nBEOUz5GP2xf2dQSBmE+s5UbPfgH1CTCepqKvtYRNO9k8
 +VYpbRAHqNEYLKJLLJz8uPcipePvc5jCaQbw6gAErQM/0jxh4DN4+beX
X-Gm-Gg: ASbGnctVjoheFetjRlV5zuXuJk0t8XboL189dO+WsppMoWCVe81X86xNT5Y6uz5k+6l
 DdW19EoiMwoGXoNF/xLQIBj+QS583ZlUMOUcOQX3PIN29MQ2MuULeHHBCrGLYQgdmQwcMKtqWWI
 llWvUvZCbu3RGCppLGTw8jVwWgU0LfEK9UhefNPqEnLN++HaeSd8K5HLtEITcsop3lwmm+O8xF4
 W80WRFBIjkejuAi7W3wFZ4E6oKiSylwJDyLVBZTGiRH4Kn4M9+BdJyDpOItKmN8nrQdXPr4B1tc
 RY5MSUetlqXVaF8T0B0o1FhH6A0+bpjAqW0gPYT84FJ/uabWm2ExWHMUM5DRckjvOFRP32rwSlC
 pE1l7IUfHHeW205uwlDo3qimpySVyTZgRsKhnHPTThZh3
X-Google-Smtp-Source: AGHT+IHurQvXunsL/HJ9vmn0CKdkJYzOpZYBsq2mAMEb4zKVK5+W5oEbdRBLo7URkB3G7O+IBF1fVw==
X-Received: by 2002:a17:903:2410:b0:24c:9a51:9a33 with SMTP id
 d9443c01a7336-25d24e9df3dmr43777705ad.22.1757715912450; 
 Fri, 12 Sep 2025 15:25:12 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c3a84a5c0sm58194845ad.71.2025.09.12.15.25.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 15:25:11 -0700 (PDT)
Message-ID: <0680f2fa-e583-4b7d-a1ff-9fcd4c5a8269@gmail.com>
Date: Sat, 13 Sep 2025 05:25:06 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm: Add directive to format code in comment"
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Javier Garcia <rampxxxx@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250912130649.27623-2-bagasdotme@gmail.com>
 <e0252635-4dc4-483a-911a-fee5a36c19c3@kernel.org>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <e0252635-4dc4-483a-911a-fee5a36c19c3@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/13/25 04:27, Danilo Krummrich wrote:
> On 9/12/25 3:06 PM, Bagas Sanjaya wrote:
>> Commit 6cc44e9618f03f ("drm: Add directive to format code in comment")
>> fixes original Sphinx indentation warning as introduced in
>> 471920ce25d50b ("drm/gpuvm: Add locking helpers"), by means of using
>> code-block:: directive. It semantically conflicts with earlier
>> bb324f85f72284 ("drm/gpuvm: Wrap drm_gpuvm_sm_map_exec_lock() expected
>> usage in literal code block") that did the same using double colon
>> syntax instead. These duplicated literal code block directives causes
>> the original warnings not being fixed.
>>
>> Revert 6cc44e9618f03f to keep things rolling without these warnings.
>>
>> Fixes: 6cc44e9618f0 ("drm: Add directive to format code in comment")
>> Fixes: 471920ce25d5 ("drm/gpuvm: Add locking helpers")
>> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> 
> Need me to pick this one up? Otherwise,
> 

Of course!

-- 
An old man doll... just what I always wanted! - Clara
