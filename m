Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE59166501
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 18:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC006EDEA;
	Thu, 20 Feb 2020 17:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6616EDE7;
 Thu, 20 Feb 2020 17:36:20 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43C992071E;
 Thu, 20 Feb 2020 17:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582220179;
 bh=jExt8zvCnhq4nFkDrelFYPJX4O9YBfHtIRXodwOMU3s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tgrdWxtdEFjf0cEtDH+b/WTPMQh/HuCjY2inNVVEdq3JhfiCB6pUjaEOmxrOIlP9I
 9rj6vkB9GFOgFTuHtxmY0+Dvg0wdsBAKr/J0KNPnSFVcpp74eEU1v5DcwhoZlG7sEk
 90oIMGs9Tt53R+FlMcAWz8kjBwWUUowcwfiBf170=
Date: Thu, 20 Feb 2020 12:36:18 -0500
From: Sasha Levin <sashal@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH AUTOSEL 5.5 408/542] drm/amdgpu: add the lost mutex_init
 back
Message-ID: <20200220173618.GI1734@sasha-vm>
References: <20200214154854.6746-1-sashal@kernel.org>
 <20200214154854.6746-408-sashal@kernel.org>
 <CADnq5_MMLNtb=3LLHsYnXtONQf4NWNgV226w2=OFk3JpCRj3sA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_MMLNtb=3LLHsYnXtONQf4NWNgV226w2=OFk3JpCRj3sA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Feifei Xu <Feifei.Xu@amd.com>, xinhui pan <xinhui.pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, "for 3.8" <stable@vger.kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 11:22:27AM -0500, Alex Deucher wrote:
>On Fri, Feb 14, 2020 at 10:57 AM Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
>>
>> [ Upstream commit bd0522112332663e386df1b8642052463ea9b3b9 ]
>>
>> Initialize notifier_lock.
>>
>> Bug: https://gitlab.freedesktop.org/drm/amd/issues/1016
>> Reviewed-by: Feifei Xu <Feifei.Xu@amd.com>
>> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_device.c
>> index 332b9c24a2cd0..a2f788ad7e1c6 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2797,6 +2797,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>         mutex_init(&adev->notifier_lock);
>>         mutex_init(&adev->virt.dpm_mutex);
>>         mutex_init(&adev->psp.mutex);
>> +       mutex_init(&adev->notifier_lock);
>>
>
>This patch is not relevant here.  The same mutex is already
>initialized 3 lines above.

Now dropped, thank you.

-- =

Thanks,
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
