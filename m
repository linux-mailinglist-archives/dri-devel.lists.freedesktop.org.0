Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1647B11D26
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 13:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9854F10E9D1;
	Fri, 25 Jul 2025 11:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yi57Ji+x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E86910E9D1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 11:08:28 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ae0df0bb8fbso13040266b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 04:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753441706; x=1754046506; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Uw5xYz9ljVloUXuYhdtWs7nMIXFU+Uc/d7Zb4IlFZdg=;
 b=yi57Ji+xdI+giIpZNqPdXBdUh/po6xE/VC17fAt/Xo6oc8L96R4N8j4+ogKr9sVsXg
 1oHPuwRspnrVExmMgGmHZS/HB1VJeNI094F3FqU2U0e46roIKJcvBqD2eY0bd177fGon
 uLrfL064vtai5EGhj3Wd4wgYRqqGmCCpBxAG8dDyyvz2rc/utZHfw8fxXz0OY7gC+AHR
 EAKYfy/YKWlg8ThEou75dnbPga7fGPt0H8PDRu+Q6xYWjfhVdCdrY5JxB4LA2eubtUXS
 k66py4DT6fTHh9aeOVX1ZfJk0W7xbZEcMGcATB0b4KOGXeQJlUJyFDZE3bJ/li3Urw9P
 ZFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753441706; x=1754046506;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uw5xYz9ljVloUXuYhdtWs7nMIXFU+Uc/d7Zb4IlFZdg=;
 b=XXJ6KL9DvlLVGwIvf/eUz/ji+kg1jhg0jlS5KpfYP+edCdjwR9aEm+0z4h2Lb7rO9M
 SqOvWEiWfF+oNGrpznhfyvIc+yHaf6Uinh4LkXgZeydyDoxknbjM45z5HG6I3ReTFujt
 Xslm7pfwJa+Ct9wcJrelfjUCPzrZWiB2hykNuy/ny+KurJnf6kHpgJjh89juoTjnQ1aM
 Oi7H+D2WNvS072lyQjj2qrHuuhNuMT8buwwnPZPiOCT/XbWCsNr5IFcMUmRoExpS7S4d
 CwV2GVrbn7vYVJdeEHIWps4x4MDAoRuQHKqPKAK8M+I6jefgRki7iEaiqA4NPu2KTlye
 DTbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMjXmoudHGZZcgv0lJt/kXckIRCSfiYRVu6EH5uaNN5LNa3kyvnosoV5kQ5Yh4Z1Ig1U8VP0yXxTA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeGHWOAghT4YDMoWha9aD3eAb4opKhqB/q/ar3XajEA8FYztCV
 6+F6eVqAd8/VzpLZYCqhK5r+M+7RwL5vG0HNEdhKENPkwJZBcdZLlaQIAXwAfZg9WzU=
X-Gm-Gg: ASbGncsPtORCY+HBbCrYw7yyJ7A3hxXN3uk/+5NoqwhPenHKX5KAQcxJVNuA9S+gSbZ
 H+SGk7ChrPoopm5+yHKBpeIDI1NH0S9Xklx6YBczR6UUclQ+jueDh0FCKFIH5M01TnWgVkGmfdq
 k0GfmZEc/d+FeVeL70oFvM/eQ82bvkU83sEcTv8n8eGpZKKQSYAuWh1HAArUevfqJSiXJGZUu0c
 mFlxyxRVJbCVQ1MuNXOEQtv4a2kDnukUx3egerMYL94a+BhF57zeAvhW6p3B6N3uhGh6kaO4+dM
 L59IoEx5j3XFLWNMIO8nYdtEMkx6w4FhmR30mLIBoMDv/z+Ea/F/Lz2nZNYkbwWDl7BXiYGAz9n
 iTcio+RB1/BaRO+yQ9nSTWgOV61KcnbLqAYnlvRhSXBVRG4KbSgT4
X-Google-Smtp-Source: AGHT+IGPX2ebFd1G1UY4hjy4nK32/r3TZiGosjelo1wUHJ7aU9RYrlPYLD6uyjWm58/GD1RzAlB50w==
X-Received: by 2002:a17:906:b894:b0:af6:32b3:2674 with SMTP id
 a640c23a62f3a-af632b331e2mr3687066b.0.1753441706435; 
 Fri, 25 Jul 2025 04:08:26 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.203.90])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af47f44eaf5sm253765966b.80.2025.07.25.04.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 04:08:25 -0700 (PDT)
Message-ID: <4d79c8dd-c5fb-442c-ac65-37e7176b0cdd@linaro.org>
Date: Fri, 25 Jul 2025 13:08:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
To: Matt Coster <Matt.Coster@imgtec.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <Frank.Binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Drew Fustini <fustini@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250724-apr_14_for_sending-v8-0-0714bef83c59@samsung.com>
 <CGME20250724141911eucas1p17071ea620f183faff7ca00cad25cf824@eucas1p1.samsung.com>
 <20250724-apr_14_for_sending-v8-2-0714bef83c59@samsung.com>
 <20250725-gainful-saluki-of-mathematics-3c0dd0@kuoka>
 <4461a785-b593-429e-b436-44cd2f1c96eb@imgtec.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <4461a785-b593-429e-b436-44cd2f1c96eb@imgtec.com>
Content-Type: text/plain; charset=UTF-8
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

On 25/07/2025 11:00, Matt Coster wrote:
> On 25/07/2025 07:59, Krzysztof Kozlowski wrote:
>> On Thu, Jul 24, 2025 at 04:18:59PM +0200, Michal Wilczynski wrote:
>>> Update the img,powervr-rogue.yaml to include the T-HEAD TH1520 SoC's
>>> specific GPU compatible string.
>>>
>>> The thead,th1520-gpu compatible, along with its full chain
>>> img,img-bxm-4-64, and img,img-rogue, is added to the
>>> list of recognized GPU types.
>>>
>>> While the BXM-4-64 GPU IP is designed with two distinct power domains,
>>> the TH1520 SoC integrates it with only a single, unified power gate that
>>> is controllable by the kernel.
>>>
>>> To model this reality correctly while keeping the binding accurate for
>>> other devices, add conditional constraints to the `allOf` section:
>>>  - An if block for thead,th1520-gpu enforces a maximum of one
>>>    power domain and disallows the power-domain-names property.
>>
>> Why?
>>
>> This solves nothing, because you did not change the meaning of power
>> domain entry.
> 
> Hi Krzysztof,
> 
> Just to clarify, is this an issue that can be resolved by documenting
> the semantics of ">=1 power domains with names" vs "1 unnamed power
> domain" in the binding file? Or are you suggesting an alternative method
> of encoding this information in devicetree?

Currently, through power-domain names, the first entry in power domains
is the 'a' domain. We usually prefer this to be explicit - listing items
- but here, probably due to obviousness of names A and B, it did not happen.

Disallowing power-domain names does magically change existing binding.

I think you should list the power-domains items explicitly for each
variant (see any of my other standard examples how this is done, e.g.
clock controllers).


Best regards,
Krzysztof
