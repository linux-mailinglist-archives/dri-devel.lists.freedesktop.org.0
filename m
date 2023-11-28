Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CC07FB31C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 08:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AAC10E447;
	Tue, 28 Nov 2023 07:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C055110E0D8;
 Tue, 28 Nov 2023 07:47:25 +0000 (UTC)
Received: from [100.124.219.30] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0531D6607295;
 Tue, 28 Nov 2023 07:47:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701157644;
 bh=420tqF6lwUD8tn3w60siOaE4UaUuha/bD8si2KKw91w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EVU0PGCrFstcXmm8wG9d6C++OUbOO+j4q0aCHlvFBNxt2QoC6T5GM6mnL/ig1r81+
 ELSKV45eopGPm1jW8OPKC+Uaa7+h/0OQliIVJeb/fHU3bSq76bqWr3lVqTUse8B3d+
 7ScrSu3v65Y7WGqyQ++YutTmQ2meq6zoNUreJzaaFWqvfq8SVRO7cgdgeRV6hwnp+y
 cvAyJ6AXGcbOYOjl9luaWt6P6wKOJeyjwy6lh3d4kT5iJPhaXj3+rmNaA+EM+uxRcV
 wOxATuJI5L4n+otb5C/2Kz5fWsNbsyhuc2DKi0QWTaUKCKWHPnzdmrEG8avNgkc9OJ
 QnQDpxE1gmhWQ==
Message-ID: <06719894-7acd-9bfb-bdf7-4aa9eba21f2f@collabora.com>
Date: Tue, 28 Nov 2023 13:17:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] PCI: qcom: Fix compile error
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 jani.nikula@linux.intel.com
References: <20231128042026.130442-1-vignesh.raman@collabora.com>
 <20231128051456.GA3088@thinkpad>
 <50a9f061-e1d3-6aca-b528-56dbb6c729d9@collabora.com>
 <20231128065104.GK3088@thinkpad>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20231128065104.GK3088@thinkpad>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 helen.koike@collabora.com, swati2.sharma@intel.com,
 david.e.box@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/11/23 12:21, Manivannan Sadhasivam wrote:
> On Tue, Nov 28, 2023 at 11:44:26AM +0530, Vignesh Raman wrote:
>> Hi Mani,
>>
>> On 28/11/23 10:44, Manivannan Sadhasivam wrote:
>>> On Tue, Nov 28, 2023 at 09:50:26AM +0530, Vignesh Raman wrote:
>>>> Commit a2458d8f618a ("PCI/ASPM: pci_enable_link_state: Add argument
>>>> to acquire bus lock") has added an argument to acquire bus lock
>>>> in pci_enable_link_state, but qcom_pcie_enable_aspm calls it
>>>> without this argument, resulting in below build error.
>>>>
>>>
>>> Where do you see this error? That patch is not even merged. Looks like you are
>>> sending the patch against some downstream tree.
>>
>> I got this error with drm-tip - git://anongit.freedesktop.org/drm-tip
>>
>> This commit is merged in drm-intel/topic/core-for-CI -
>> https://cgit.freedesktop.org/drm-intel/log/?h=topic/core-for-CI
>>
> 
> Okay. Since this patch is just for CI, please do not CC linux-pci as it causes
> confusion.

Sure, thank you.

Jani, is this fix required for topic/core-for-CI ?

Regards,
Vignesh
