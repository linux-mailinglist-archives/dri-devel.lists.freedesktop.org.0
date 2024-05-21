Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBFA8CA85D
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 09:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6DB10E09C;
	Tue, 21 May 2024 07:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qm0vO6hS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4200910E09C;
 Tue, 21 May 2024 07:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716275137;
 bh=nS/Dr2W3vGanwW9ifFd+bOFrHEwvBrs3b1sW5lLV82U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qm0vO6hSCRlLszYJes6vtZsP0qVLDOWOlMVSXIEkovjNeL4Dq+Cc+8MXdXP7o9Ngt
 dEgAlzV+KObOGcAdS/6I44aVkdi+dzENzBC+C8438w5ZDIY3qhWEdam1o+AodVwzjv
 LXMakGJRGQchKxC8P/1xweTSAiUSv5m/wIebY9OQ7ZoehiIA9kMjvWzZlPc043uEtL
 I9WPKXT+MUL2ESyAvmJo630D/7kottF1JQB7ihruCKvj6sjbQnA/ZmNcTgV2aj4M44
 yBEOL1WXeyBsLFdR4/W1aZOQopqDRLXK/J8L1Xq3XC3FW2nsXiT1XtAj/HU/gghFaX
 X7t22RCH7dZsQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E0B0A378202E;
 Tue, 21 May 2024 07:05:33 +0000 (UTC)
Message-ID: <9ab7eb04-d4c6-4a79-87cb-2d21e4bfa9c4@collabora.com>
Date: Tue, 21 May 2024 12:35:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/ci: generate testlist from build
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dmitry.baryshkov@linaro.org, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-3-vignesh.raman@collabora.com>
 <c7e0a8b1-5be6-460b-b489-2ab5a8248d32@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <c7e0a8b1-5be6-460b-b489-2ab5a8248d32@collabora.com>
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

Hi Helen,

On 21/05/24 01:54, Helen Koike wrote:
> 
> 
> On 17/05/2024 06:24, Vignesh Raman wrote:
>> Stop vendoring the testlist into the kernel. Instead, use the
>> testlist from the IGT build to ensure we do not miss renamed
>> or newly added tests.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Fix testlist generation for arm and arm64 builds.
>>
>> ---
>>   drivers/gpu/drm/ci/build-igt.sh  |   34 +
>>   drivers/gpu/drm/ci/igt_runner.sh |    9 +-
>>   drivers/gpu/drm/ci/testlist.txt  | 2761 ------------------------------
>>   3 files changed, 39 insertions(+), 2765 deletions(-)
>>   delete mode 100644 drivers/gpu/drm/ci/testlist.txt
>>
>> diff --git a/drivers/gpu/drm/ci/build-igt.sh 
>> b/drivers/gpu/drm/ci/build-igt.sh
>> index 7859554756c4..e62244728613 100644
>> --- a/drivers/gpu/drm/ci/build-igt.sh
>> +++ b/drivers/gpu/drm/ci/build-igt.sh
>> @@ -3,6 +3,30 @@
>>   set -ex
>> +function generate_testlist {
>> +    set +x
>> +    while read -r line; do
>> +        if [ "$line" = "TESTLIST" ] || [ "$line" = "END TESTLIST" ]; 
>> then
>> +            continue
>> +        fi
>> +
>> +        tests=$(echo "$line" | tr ' ' '\n')
>> +
>> +        for test in $tests; do
>> +            output=$(/igt/libexec/igt-gpu-tools/"$test" 
>> --list-subtests || true)
>> +
>> +            if [ -z "$output" ]; then
>> +                echo "$test"
>> +            else
>> +                echo "$output" | while read -r subtest; do
>> +                    echo "$test@$subtest"
>> +                done
>> +            fi
>> +        done
>> +    done < /igt/libexec/igt-gpu-tools/test-list.txt > 
>> /igt/libexec/igt-gpu-tools/testlist.txt
> 
> Just a nit, could you rename the file to ci-testlist.txt ? Since 
> test-list.txt and testlist.txt can be easily confused.

Sure, will rename it. I missed to add the generating testlist print also.

Regards,
Vignesh

> 
> Regards,
> Helen
> 
