Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB01A9A006
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 06:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4137410E3A5;
	Thu, 24 Apr 2025 04:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ohFeaUHe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C5B10E3A5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 04:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1745468384;
 bh=BaOhywJcB+VaEaUHHAOdBXwmq+NRH46jxsPOdH5NcL8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ohFeaUHeI280wynRO5WRe1N7Ozp1xltaI/qkb/t0zvx1yRDuWsWSYL0jzEVLlYh1w
 wKTxpnhND8zWQijcje35ywZ9zyx2QXhKA8s/8+rHO/JK6Z0fgN50romFVw/vXBLBoZ
 URm04otDjCPgg0nZ+cKPKe02abU/DBdVnKoq90Z+w3yU9GcQ4HnJZarN6Oeci9wLax
 0H6+i2ouZLb80PYtuzIzx2pR9SNPvkKPBq5wJ2YBDxykK8u83plFIC+jckrGszY/8i
 fUyUGOHyg+iUTxKBANp79gmlzBu0DEhElrt/so03P4R5emk3vWegwPWb8gIMct9eWO
 tt5cHZBjmIAsA==
Received: from [192.168.8.5] (unknown [137.59.78.166])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id EBE4A17E088C;
 Thu, 24 Apr 2025 06:19:36 +0200 (CEST)
Message-ID: <8da97827-314e-43d1-9675-ca176263146f@collabora.com>
Date: Thu, 24 Apr 2025 09:49:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] drm/ci: Add devicetree validation and KUnit tests
To: Helen Koike <koike@igalia.com>, dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, daniel@fooishbar.org, helen.fornazier@gmail.com,
 airlied@gmail.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, lumag@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, quic_abhinavk@quicinc.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250417030439.737924-1-vignesh.raman@collabora.com>
 <b7795d63-ca8c-4746-84aa-49793d1b6852@igalia.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <b7795d63-ca8c-4746-84aa-49793d1b6852@igalia.com>
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

On 24/04/25 00:21, Helen Koike wrote:
> Hi Vignesh,
> 
> Thanks for this version, please see my comments below.
> 
> On 17/04/2025 00:04, Vignesh Raman wrote:
>> Add jobs to validate devicetrees and run KUnit tests.
>>
>> Pipeline link,
>> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1407489
> 
> I see this message:
> 
> WARNING: Running pip as the 'root' user can result in broken permissions 
> and conflicting behaviour with the system package manager. It is 
> recommended to use a virtual environment instead: https://pip.pypa.io/ 
> warnings/venv

We should use --break-system-packages in,
pip3 install dtschema

Will fix it. Thanks.

Regards,
Vignesh

> 
> 
> It would be nice to fix this at some point.
> 
> With or without this, for the entire series:
> 
> Acked-by: Helen Koike <helen.fornazier@gmail.com>
> 
> Thanks
> Helen
> 
>>
>> Link to v1,
>> https://lore.kernel.org/all/20250327160117.945165-1- 
>> vignesh.raman@collabora.com/
>>
>> Link to v2,
>> https://lore.kernel.org/all/20250409061543.311184-1- 
>> vignesh.raman@collabora.com/
>>
>> Vignesh Raman (2):
>>    drm/ci: Add jobs to validate devicetrees
>>    drm/ci: Add jobs to run KUnit tests
>>
>>   drivers/gpu/drm/ci/check-devicetrees.yml | 44 ++++++++++++++++++++++++
>>   drivers/gpu/drm/ci/dt-binding-check.sh   | 16 +++++++++
>>   drivers/gpu/drm/ci/dtbs-check.sh         | 19 ++++++++++
>>   drivers/gpu/drm/ci/gitlab-ci.yml         |  4 +++
>>   drivers/gpu/drm/ci/kunit.sh              | 11 ++++++
>>   drivers/gpu/drm/ci/kunit.yml             | 33 ++++++++++++++++++
>>   6 files changed, 127 insertions(+)
>>   create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
>>   create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
>>   create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
>>   create mode 100755 drivers/gpu/drm/ci/kunit.sh
>>   create mode 100644 drivers/gpu/drm/ci/kunit.yml
>>
> 

