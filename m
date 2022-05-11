Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 337755234F9
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 16:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D1710E355;
	Wed, 11 May 2022 14:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD7210E387;
 Wed, 11 May 2022 14:03:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tomeu) with ESMTPSA id AD82D1F44B18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652277835;
 bh=xSx6F4evAwybIJWHucSyu4yeLye8vq75JCHZIdqYZLc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PZRkH+oixPRVh+pYjowNCZTDelUzKF3qOWvUeoCKcl+R+yRYSLUiw86TAttDtHvtj
 aM3wRuQHjK+N2z8ccCa+OzyBd4vzxOXfHjk6wC3gEYE0znuN7z2naYQGCpVRnx3FZv
 RezU+yx8jb6R9Nlxw2qkKL4yLlkTvWyJoqumfgg1ZdH3ULMILWwu/A3ztlaya8Fnck
 NJ68c3VQXX+HhpwqO4vN2dKCieebX6W5YlWxFbo7qkU23zLXvbnaYlf3qN4CCrOdrL
 jZAcmazA5wX/sTMF9hbbSmBlWh8jmqiCo8A8HUeWYo3CcATm5aaKb0nnrokSVGJ0vc
 1tHH9dCFybI7g==
Subject: Re: [RFC v3] drm/msm: Add initial ci/ subdirectory
To: Rob Clark <robdclark@gmail.com>
References: <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <20220511061533.56881-1-tomeu.vizoso@collabora.com>
 <CAF6AEGts6cKOrmRruo8uSXSW=Kq58VZxdPuS13Q7jVajbvga-g@mail.gmail.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <3e4198de-a0be-aa76-c5ea-fd07d47704ee@collabora.com>
Date: Wed, 11 May 2022 16:03:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGts6cKOrmRruo8uSXSW=Kq58VZxdPuS13Q7jVajbvga-g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-doc@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/11/22 3:20 PM, Rob Clark wrote:
> On Tue, May 10, 2022 at 11:15 PM Tomeu Vizoso
> <tomeu.vizoso@collabora.com> wrote:
>>
>> And use it to store expectations about what the drm/msm driver is
>> supposed to pass in the IGT test suite.
>>
>> Also include a configuration file that points to the out-of-tree CI
>> scripts.
>>
>> By storing the test expectations along the code we can make sure both
>> stay in sync with each other, and so we can know when a code change
>> breaks those expectations.
>>
>> This will allow all contributors to drm/msm to reuse the infrastructure
>> already in gitlab.freedesktop.org to test the driver on several
>> generations of the hardware.
>>
>> v2:
>>    - Fix names of result expectation files to match SoC
>>    - Don't execute tests that are going to skip on all boards
>>
>> v3:
>>    - Remove tracking of dmesg output during test execution
>>
>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>> ---
>>   Documentation/gpu/msm_automated_testing.rst   |  70 +++++++++
>>   drivers/gpu/drm/msm/ci/gitlab-ci.yml          |  11 ++
>>   drivers/gpu/drm/msm/ci/msm.testlist           | 144 ++++++++++++++++++
>>   .../gpu/drm/msm/ci/msm_apq8016_results.txt    | 141 +++++++++++++++++
>>   .../gpu/drm/msm/ci/msm_apq8096_results.txt    | 141 +++++++++++++++++
>>   drivers/gpu/drm/msm/ci/msm_sc7180_results.txt | 142 +++++++++++++++++
>>   drivers/gpu/drm/msm/ci/msm_sdm845_results.txt | 142 +++++++++++++++++
>>   7 files changed, 791 insertions(+)
>>   create mode 100644 Documentation/gpu/msm_automated_testing.rst
>>   create mode 100644 drivers/gpu/drm/msm/ci/gitlab-ci.yml
>>   create mode 100644 drivers/gpu/drm/msm/ci/msm.testlist
>>   create mode 100644 drivers/gpu/drm/msm/ci/msm_apq8016_results.txt
>>   create mode 100644 drivers/gpu/drm/msm/ci/msm_apq8096_results.txt
>>   create mode 100644 drivers/gpu/drm/msm/ci/msm_sc7180_results.txt
>>   create mode 100644 drivers/gpu/drm/msm/ci/msm_sdm845_results.txt
>>
> 
> [snip]
> 
>> diff --git a/drivers/gpu/drm/msm/ci/gitlab-ci.yml b/drivers/gpu/drm/msm/ci/gitlab-ci.yml
>> new file mode 100644
>> index 000000000000..9b7caa7fcab2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/ci/gitlab-ci.yml
>> @@ -0,0 +1,11 @@
>> +variables:
>> +  # Change this to use your fork of drm-ci
>> +  DRM_CI_PROJECT_PATH: &drm-ci-project-path gfx-ci/drm-ci
>> +  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha msm
> 
> btw, shouldn't we list an exact commit sha (or tag) for drm-ci, or am
> I overlooking something?  We want to be able to uprev the drm-ci
> version (and therefore igt version) in sync with any necessary updates
> to the expectations

You are right, that was me being lazy and using a branch name to not 
have to update this every time.

But this should better be a commit sha or tag. Will do it on v4.

Cheers,

Tomeu
