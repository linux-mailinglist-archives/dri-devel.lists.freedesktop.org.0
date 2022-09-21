Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEBB5E536A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 20:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D73B10E6FC;
	Wed, 21 Sep 2022 18:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7539E10E6FC
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 18:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XZ1oa7f8EL3olAkXpUq8dW6B30sw0XpQKvefKi5aaM4=; b=FtpDSyDp6BrAV8xD8zjEeyd6nD
 fbf1Uj1izetdtCD4r1p/cvgRIU3pjunlGn7/IoFt1BqUAtF4mkIQYnhpYGa0qF0595jRc3I4xu7wQ
 W3kCehoTQN6aPWIPhbpyLur0JquxPIUIJ8EJgeNeoxjF86S/OPB82beDFkqNjasmJlGW3lVFkeNpW
 c8kM8FWtqYBuUEfZBYFnBBJvsvm/+GcKbJXErlfE5pazEy0UJT9yklA1WtJqomkfk8AbW+Qj4BduK
 rZHm2xUCU7iDMkt9Rrqn3skfgYZHOcJFaj9PG9q4N/cbM9YooMl3O9gUJ31D9gk9jDOQ/fkfG/yTh
 ZDEks7gA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10]) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1ob4rV-00AChg-3L; Wed, 21 Sep 2022 21:54:21 +0300
Message-ID: <a0ff28e6-47f2-63d5-47f5-a9376deec47a@kapsi.fi>
Date: Wed, 21 Sep 2022 21:54:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v3 1/8] memory: tegra: Add API for retrieving carveout
 bounds
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20220920081203.3237744-1-cyndis@kapsi.fi>
 <20220920081203.3237744-2-cyndis@kapsi.fi>
 <8cb14446-01ec-255a-5bf6-e16098628f60@linaro.org>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <8cb14446-01ec-255a-5bf6-e16098628f60@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/21/22 21:37, Krzysztof Kozlowski wrote:
> On 20/09/2022 10:11, Mikko Perttunen wrote:
>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> On Tegra234 NVDEC firmware is loaded from a secure carveout, where it
>> has been loaded by a bootloader. When booting NVDEC, we need to tell it
>> the address of this firmware, which we can determine by checking the
>> starting address of the carveout. As such, add an MC API to query the
>> bounds of carveouts, and add related information on Tegra234.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> Best regards,
> Krzysztof
> 

Thanks!

Mikko
