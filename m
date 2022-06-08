Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB50B543BE4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 21:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8122E113075;
	Wed,  8 Jun 2022 19:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E8A11306E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 19:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yeiHW5EcLA7eqe7J1MPMCRK8sfCMfurY+HyBM1CQA2g=; b=a1yaq32urq7t04nH3n0QyXBvCN
 D51rzXl8Al5tGQntxatY+oWoluSnrG8LyjSHvIDqkHkRXKfvBnQ4sb5WqdmUsqibWC3edYzV3hgya
 jjXXLi7Dy/Z76fjiDter5nkCMNkZCoARIw50FUvn2qH9aL4SXV4vQu96/V/v1jpdpRsTjnxHMEwey
 6SeeRG85DUk7IS38i59Ezo/Sfc3UIFVw3+JYNtiuf4DhM2A4ZKWK4hgbi97wI7IJKjXqubA9BftDU
 b1eKY+0CqrUbb0AjYTx4S4r/VLmJxQ+tPZfyzrMYlZqgdcXkUL+ikDb7N7df2ff3L72eXYbGbju9v
 onsMJ2OA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10]) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1nz0uH-00CMkN-RA; Wed, 08 Jun 2022 21:59:53 +0300
Message-ID: <8f813d4c-f379-a6d5-1efe-8b20e3572a83@kapsi.fi>
Date: Wed, 8 Jun 2022 21:59:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v1 00/13] Host1x support on Tegra234
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, digetx@gmail.com
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
 <930f3721-ab1e-4bab-de1e-eaf83982e3ea@collabora.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <930f3721-ab1e-4bab-de1e-eaf83982e3ea@collabora.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/3/22 12:38, Dmitry Osipenko wrote:
> On 5/16/22 13:02, cyndis@kapsi.fi wrote:
>> Hi all,
>>
>> This series adds support for Host1x and VIC on the recently released
>> Tegra234 (Orin) SoC. It's split into the following parts:
>>
>> * Device tree binding updates
>> * Cleanup in host1x driver
>> * Add programming of new registers and old registers that now need to
>>    be programmed to a non-reset value
>> * Tegra234 device data and headers
>> * Rewrite of the job opcode sequence, and related patches to
>>    support MLOCKs on Tegra186+.
>>
>> The rewrite of the job opcode sequence brings Tegra186, Tegra194 and
>> Tegra234 support to a 'full-featured' status that is necessary to
>> support all host1x features in the future. This should not have any
>> impact on older SoCs.
>>
>> This series should be applied on top of the Host1x context isolation
>> series.
>>
>> Tested on Jetson AGX Xavier and Jetson AGX Orin.
> 
> The code looks okay at a quick glance. Please rebase the patches on top
> of latest -next. Perhaps won't hurt to merge all the related patchsets
> into a single series for 5.20.
> 

Thanks!

Yeah, I'll rebase and resend the context isolation series and this next 
week.

Mikko
