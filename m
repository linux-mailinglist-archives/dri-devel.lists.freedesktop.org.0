Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD328830407
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 11:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4E910E104;
	Wed, 17 Jan 2024 10:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD78110E104
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 10:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705489103;
 bh=/7lI1B2ezdJpZing7eGVqikWQmFS6qFYXxnwlupy290=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=tMgwAN0XVR4clizkCEDnib7CoFsCa0hRMJsErRaVWDzYjzOc+/kEVeArCbv4OAkss
 rpyyvEjyWbQ5q58V+e3HDrUPMAEkws77pSqguHFBDQveJf1dSibyrnCo59m3br4vcf
 7beOB9K/TZmZ/TC9vg3/ObJJLIC7uujE4Rg9LGOz3TUcDF3zfm+iUq19+MqwxEBdWZ
 oLAqi4Z4U/tKm4Mfnny72PK7fsdzOhqzZlFxfGG0FH/ORgLOAdcz3xYiWkwut99mwI
 sxf+GwNw8OwGDAXsh5Sua/04RN8TS6Ojh7Ezb8MgD6GO1Td9kkHR/CPk7C21yRtRC0
 94/E4NOFiPHJg==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4285F3782021;
 Wed, 17 Jan 2024 10:58:17 +0000 (UTC)
Message-ID: <7f123e16-54d7-e25e-63ae-cf6efc31d136@collabora.com>
Date: Wed, 17 Jan 2024 16:28:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 0/8] drm/ci: Add support for GPU and display testing
To: Daniel Stone <daniel@fooishbar.org>,
 Helen Koike <helen.koike@collabora.com>, Dave Airlie <airlied@gmail.com>,
 Sima Vetter <daniel@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Emma Anholt <emma@anholt.net>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 David Heidelberg <david.heidelberg@collabora.com>,
 Rob Clark <robdclark@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20231220121110.1441160-1-vignesh.raman@collabora.com>
 <CAPj87rOMPioOK0r74vcnVkXusm6Nah6KNUWyxYgpVLdkMNtW2g@mail.gmail.com>
 <ad7cbd59-5264-96e8-5e9b-aafde8028e41@collabora.com>
 <CAPj87rPRRfJmxTev50YqxBizyvzCUhCiymoV_bdqsZ-zvcREfA@mail.gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rPRRfJmxTev50YqxBizyvzCUhCiymoV_bdqsZ-zvcREfA@mail.gmail.com>
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

Hi Daniel,

On 11/01/24 23:41, Daniel Stone wrote:
> Hi Vignesh,
> 
> On Wed, 10 Jan 2024 at 10:47, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> On 09/01/24 19:08, Daniel Stone wrote:
>>> A better sequencing would be something like:
>>>     1. add ANX7625 config
>>>     2. refactor _existing_ MTK display jobs to use YAML includes, change
>>> the existing job name, and rename the existing xfail set, remove
>>> IGT_FORCE_DRIVER from the script since it's now set by the job
>>>     3. add MTK Panfrost+PVR GPU jobs with new xfails, add xfail entry to
>>> MAINTAINERS
>>>     4+5: same as 2+3 but for Amlogic
>>>     6+7: same as 2+3 but for Rockchip
>>>
>>> Then the separate rename/update xfail commits just disappear, as does
>>> the removal of IGT_FORCE_DRIVER, because it's just done incrementally
>>> as part of the commits which change the related functionality. It's
>>> extremely important that every change can work standalone, instead of
>>> introducing intermediate breakage which is only fixed in later commits
>>> in the series.
>>
>> Thank you for reviewing the patches. I agree, will follow this sequence
>> and send a v2 version.
> 
> Alongside Rob's patch to add msm-specific tests to the runlist, we'd
> need to add the Panfrost-specific tests. Whilst we're here, we might
> as well add the vc4/v3d/etnaviv/lima tests so they can use it in
> future.
> 
> Panfrost should also skip kms_.* tests - since it's not a KMS driver,
> it can't run the KMS tests, so there's no point in trying.

I will add these tests and update skips file. Sorry missed this before 
sending v2. I'm rechecking the xfails for the v2 series and will send
v3 with these changes. Thanks.

Regards,
Vignesh
