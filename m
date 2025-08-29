Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1665B3B353
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 08:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EC810EB47;
	Fri, 29 Aug 2025 06:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ljMQi516";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0B810EB47
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 06:26:27 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-323267bc2eeso1322164a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 23:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756448787; x=1757053587; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FcWNphyv+aV6VigruYXsycpBhyL4rRdrU3NDODM9P5A=;
 b=ljMQi516JYBrdkhOEJECm+OO9kwBDxKfW8wQziLThuL18NDgPk6YD9Z/XGpuzIUeFa
 wFf6tjNIT2rVzdfeqYa6BkkrOjA10nnN+/2Yr++7tBECg214tneYjD26oJgicu/dLTio
 BGYRI5iuY2mi3vBXubWT+NytN5liks884i1cJj3Ondn5V/1ZKQ+SLJ0MgRpXCkJOZdkD
 uQWFeD9kSaUCpN3OiVvfjmeBWVq9r1HAYVyjaGvT4PIWHQUgekHpvU/6Oz7X6/mHGXtI
 HjAozgsVsIkjTowwFbgA72nanlvMSWM5Y7jVUMWHuGqDfTa9+P1HM7ZG3tf0PNHlQf6v
 9keA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756448787; x=1757053587;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FcWNphyv+aV6VigruYXsycpBhyL4rRdrU3NDODM9P5A=;
 b=ZAEd54awryZ5UuMKLL1jkNOPQfcLmPaztgyTUunC0m0mCTNAnx0EERRkQOf6emhLB2
 ggFMQzTqoF4JDFlJWZmGn+FLMmz5ssS3zPbvfkLHkdh9H2/nWclqCGxBh7GJuI++ef+s
 vXJ4FFZJ48W8lhmCgumzdQKrY4uhKDG0VVhX56xxgWTytUeU7Bhc+IqCsgY8PjVqkw9y
 kg03f9e8dl6jEtEC6oQk2DkxlyyvE4eaQjlMqV+s1ZnF98zBY80n3c15g6muT1TaTObo
 JPKevAiDCJQAZ2uhR8lYQLYRxQgFuyVaH9H2YCySKdTyXinjmjBbfq3uXx3KGtRwxVz3
 mcTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ1nL+h8SXjMWCYOI5/H6rUb5vgsNfbC6fTuqHzjBJsB/mlmKUIgq3xaU05/fVwGRSkG+/FYqiDAI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqnWHb+Xi+/VqD5nLFIYB9QLpLcNSQjCemx4hGs8amCYK4hxyg
 A7RVdRCcwoJOpYdJ4YCJGMM6yz9ecvxM66d537xVRA9ZsNgvopm151xh/M8w2qmDNx0=
X-Gm-Gg: ASbGncv1p0kmp+DB34epx3aNdJi65lWWio/MIoaZza+6hwCpw2kUKTzkXRgCserrtXQ
 aacj7sGrxH8MyOrALEOflbrf507xoPuErIDh1Ox8JxEjg6YWliUdpOkEQe4mBNm7t7hO077Cy05
 FaaIm33WYF36KFIogPscKPKe6oIzcw039DunWbZD/Aa9pY5tfH3/yUfPyOI55AEt3SvJUOFBAHs
 DWL+hqjlZptCnXFte+rlJS2VgTdVqXaEBPbBHcNCJHILJk35JMUk0OcfaZJksSvHv7qa5ujnReR
 0nzyvARFWf44cKGA692Ta+EyerTGkrcEuNO282p0k7mCsHGiqZC5+bpbBAg1gdaaU15o2455F+C
 vr/D9jKm4PR4aeFwU+7uNBOSi
X-Google-Smtp-Source: AGHT+IFHYb22k9tJefksk8Ol8WzLcbkUpFNWBPL7w5JQ2Y92t38N6cXrTs0utCYM4huh3xQWCdkxbA==
X-Received: by 2002:a17:90b:57ce:b0:31f:210e:e34a with SMTP id
 98e67ed59e1d1-32515eacfddmr32147827a91.8.1756448787009; 
 Thu, 28 Aug 2025 23:26:27 -0700 (PDT)
Received: from localhost ([122.172.87.165]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3276fcd4bd6sm6984417a91.15.2025.08.28.23.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 23:26:26 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:56:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Markus Mayer <mmayer@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 zhenglifeng <zhenglifeng1@huawei.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Zhang Rui <rui.zhang@intel.com>,
 Len Brown <lenb@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Beata Michalska <beata.michalska@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Sumit Gupta <sumitg@nvidia.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
 x86@kernel.org, kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/18] cpufreq: brcmstb-avs-cpufreq: Use
 __free(put_cpufreq_policy) for policy reference
Message-ID: <20250829062624.jalqqsigs7hanf7i@vireshk-i7>
References: <20250827023202.10310-1-zhangzihuan@kylinos.cn>
 <20250827023202.10310-5-zhangzihuan@kylinos.cn>
 <20250829055944.ragfnh62q2cuew3e@vireshk-i7>
 <4bd55a08-62bb-46c4-bfb6-a3375ce37e79@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bd55a08-62bb-46c4-bfb6-a3375ce37e79@kylinos.cn>
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

On 29-08-25, 14:16, Zihuan Zhang wrote:
> Thanks for applying the patch!
> 
> I’ve been thinking further — instead of using __free directly, maybe we
> could introduce a small macro wrapper around it to make the release scope
> more controllable and consistent.
> 
> Link:
> https://lore.kernel.org/all/6174bcc8-30f5-479b-bac6-f42eb1232b4d@kylinos.cn/
> 
> Do you think this would be a better approach, or should we just stick with
> the current use of __free?

Lets keep it simple for now and use __free directly. And keep this
similar with other parts of the kernel.

-- 
viresh
