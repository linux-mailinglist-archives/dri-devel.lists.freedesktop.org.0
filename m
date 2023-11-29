Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 552607FD8C4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 14:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DBD10E1E3;
	Wed, 29 Nov 2023 13:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258D510E1E3;
 Wed, 29 Nov 2023 13:57:39 +0000 (UTC)
Received: from [100.124.219.30] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 167A26602F24;
 Wed, 29 Nov 2023 13:57:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701266257;
 bh=31iGTrcxd7WIvyKBpqEFtG/SQMlg+NegVAGrYlA9GJw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=InTTJNZjtOGuyuL2ci90HGO0Q5dFAFSOUwARGNA7023Be+nXJp6cX5wkGKFAVKzNi
 UbkrB8SwTLw1Um0DJgUW5h3Tv4noTXufnUHP+6YrfXQ8+RYtzRhzIO5eOTbl/fTfs0
 ZVffsJejPxILRGOzqG0fdaGTI97uh1dAgsa+EUUyx9tcs+DKVIm9bPirF8wIeXPIb5
 aJQ/HrOCIaa/1cY288puPXpoTrLrL1jFULGp77LaV79QeHfTEmIwOIWHKk6mj29yY1
 Ax+YEwgyvNfoP8mAfr9vCl6ClvoUtnznURHcoISFO+pTjAg/sf+bIwiEXR9e/IzmGl
 FKSJf8qAjrBJA==
Message-ID: <be0b4051-c36d-43cc-c952-f9b264392832@collabora.com>
Date: Wed, 29 Nov 2023 19:27:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] PCI: qcom: Fix compile error
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20231128042026.130442-1-vignesh.raman@collabora.com>
 <20231128051456.GA3088@thinkpad>
 <50a9f061-e1d3-6aca-b528-56dbb6c729d9@collabora.com>
 <20231128065104.GK3088@thinkpad>
 <06719894-7acd-9bfb-bdf7-4aa9eba21f2f@collabora.com>
 <87edga6neg.fsf@intel.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <87edga6neg.fsf@intel.com>
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
Cc: daniels@collabora.com, intel-gfx@lists.freedesktop.org,
 swati2.sharma@intel.com, helen.koike@collabora.com,
 dri-devel@lists.freedesktop.org, david.e.box@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

On 28/11/23 18:33, Jani Nikula wrote:
> On Tue, 28 Nov 2023, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> On 28/11/23 12:21, Manivannan Sadhasivam wrote:
>>> On Tue, Nov 28, 2023 at 11:44:26AM +0530, Vignesh Raman wrote:
>>>> Hi Mani,
>>>>
>>>> On 28/11/23 10:44, Manivannan Sadhasivam wrote:
>>>>> On Tue, Nov 28, 2023 at 09:50:26AM +0530, Vignesh Raman wrote:
>>>>>> Commit a2458d8f618a ("PCI/ASPM: pci_enable_link_state: Add argument
>>>>>> to acquire bus lock") has added an argument to acquire bus lock
>>>>>> in pci_enable_link_state, but qcom_pcie_enable_aspm calls it
>>>>>> without this argument, resulting in below build error.
>>>>>>
>>>>>
>>>>> Where do you see this error? That patch is not even merged. Looks like you are
>>>>> sending the patch against some downstream tree.
>>>>
>>>> I got this error with drm-tip - git://anongit.freedesktop.org/drm-tip
>>>>
>>>> This commit is merged in drm-intel/topic/core-for-CI -
>>>> https://cgit.freedesktop.org/drm-intel/log/?h=topic/core-for-CI
>>>>
>>>
>>> Okay. Since this patch is just for CI, please do not CC linux-pci as it causes
>>> confusion.
>>
>> Sure, thank you.
>>
>> Jani, is this fix required for topic/core-for-CI ?
> 
> Done. Please double check drm-tip works for you now.

It works in drm-tip. Thank you.

Regards,
Vignesh
