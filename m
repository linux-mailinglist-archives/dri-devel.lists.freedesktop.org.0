Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA7CA83C12
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 10:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6DC10E010;
	Thu, 10 Apr 2025 08:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UEyBQiwq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E707410E010
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 08:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744272467;
 bh=l8rq0lp+35FdD9JCbp/mek9kn6GH0HJjdxWV1XHPBMA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UEyBQiwqWSS4QcmTYcfYnUIyeYJ4ElAVGzcm8LMEdf/ZmpOzSnvCRTGPVoOhY0lHQ
 rnlf9ek7vTF18dVRDZuexJV6xLVkGf/qDYcvP5ME83ZiK6p87yJw2dIZ0izRvuCyyE
 9kjxRbguqf0dNabCVvroSfctBnV+eYckY7ex/qL0zDUSqtBupmek8MpUEmzNhDNFYW
 lqho1lVLsUemfU0d26BtW8tO06vldDtevTpYz/nii0gUyPDVVdPVUDEuOAv4mlFBKw
 uk0v1g5+24rzyEOON460qIZvh2argeoiV6uqflnWIUPTdFpmFaqYEy1fVPe5ViEBrn
 4FrqtwRn836TA==
Received: from [192.168.50.250] (unknown [171.76.83.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DEA6917E078A;
 Thu, 10 Apr 2025 10:07:44 +0200 (CEST)
Message-ID: <a16c70e0-9078-4a21-9fa1-ca9d33823ff2@collabora.com>
Date: Thu, 10 Apr 2025 13:37:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/ci: Add devicetree validation and KUnit tests
To: Helen Koike <koike@igalia.com>, dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org, quic_abhinavk@quicinc.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250409061543.311184-1-vignesh.raman@collabora.com>
 <ef5b7030-c38a-44b9-b0bd-28ea6adb17c2@igalia.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <ef5b7030-c38a-44b9-b0bd-28ea6adb17c2@igalia.com>
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

On 09/04/25 23:53, Helen Koike wrote:
> Hi Vignesh,
> 
> Thank you for your patch.
> 
> On 09/04/2025 03:15, Vignesh Raman wrote:
>> Add jobs to validate devicetrees and run KUnit tests.
>>
>> Pipeline link,
>> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1400550
> 
> I see the checks are in the same stage as build, does it make sense to 
> create another stage? Similar to what was proposed on kci-gitlab?
> 
> Also, I don't think it make sense for kunit to be in the build stage. 
> Maybe in software-driver? Since kunit runs on a qemu.

We can add a `test` stage for kunit and a `static-checks` stage for 
devicetree validation and check patch. What do you think?

Regards,
Vignesh

> 
> Helen
> 
>>
>> Link to v1,
>> https://lore.kernel.org/all/20250327160117.945165-1- 
>> vignesh.raman@collabora.com/
>>
>> Vignesh Raman (2):
>>    drm/ci: Add jobs to validate devicetrees
>>    drm/ci: Add jobs to run KUnit tests
>>
>>   drivers/gpu/drm/ci/check-devicetrees.yml | 43 ++++++++++++++++++++++++
>>   drivers/gpu/drm/ci/dt-binding-check.sh   | 16 +++++++++
>>   drivers/gpu/drm/ci/dtbs-check.sh         | 19 +++++++++++
>>   drivers/gpu/drm/ci/gitlab-ci.yml         |  2 ++
>>   drivers/gpu/drm/ci/kunit.sh              | 11 ++++++
>>   drivers/gpu/drm/ci/kunit.yml             | 32 ++++++++++++++++++
>>   6 files changed, 123 insertions(+)
>>   create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
>>   create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
>>   create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
>>   create mode 100755 drivers/gpu/drm/ci/kunit.sh
>>   create mode 100644 drivers/gpu/drm/ci/kunit.yml
>>
> 

