Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E42D5750AD
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 16:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286EB10F2C6;
	Thu, 14 Jul 2022 14:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4772410F2C6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 14:23:41 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-232.nat.spd-mgts.ru
 [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A6AD76601A3F;
 Thu, 14 Jul 2022 15:23:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657808619;
 bh=C9VLKUurDe58HrZqhM0aPD6VGh/A29qN7rcwvWQV/HU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Qzg0i2ttNNypfFQcymKJHqgoKRP7AA52ZfEr3r/2Uxi6gRBYgOC94+5D/JbchEAWD
 OihyZBxtPbFByuNM5544hyt4W6ESA124yVAwY0rX5MbSYxhNul4Y4Uh1NfiElxM/oi
 Lr9K40trURiThyT0TG5R7V7xMu5rSJFkNuK/3mPNf9+Us9HKi19kZO+34BnCSvykpm
 GwFp83kuhOVFb5LcICCDb0L++Tq2Oppo6VZ+774bJ97fJ7m7B9ZtdY+736vn6UPVV8
 xYIMGh8oBtzTlJfqN5e6r3hFC71StHtPTs5PLahOjHtiaB2G9vAtRYaKlp/wyzx/zc
 yUFTLEu2PFI+Q==
Message-ID: <73fde0e0-11d2-a627-0bf9-84ee7d3b5fcc@collabora.com>
Date: Thu, 14 Jul 2022 17:23:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
 <a78343c8-2a6d-b223-4219-6b6b0a4fcb1f@arm.com>
 <CAK4VdL2hCEoshWZbCh5mkHuS6wYMiPFR3v4MWTnrEKM9zyv6Mw@mail.gmail.com>
 <ef88ec2c-77b5-fa0d-49d1-fdd2451713b7@collabora.com>
 <573fae0d-c9ab-98b0-c6f1-5b0d4e52dd01@amd.com>
 <a33ab7b9-738f-db91-f6ba-78a9641365e8@amd.com>
 <b05f9861-1966-72f5-132b-aebb4b6e0c6b@collabora.com>
 <107fe968-8311-0511-cc31-22feb994a6d7@collabora.com>
 <3e07a8d0-2cbc-8f3e-8f9f-5b73fb82028b@amd.com>
 <CADnq5_MMmeWkiMxjYfrG7pip8BEkbkRc8ADUDLEi++kRF76sqg@mail.gmail.com>
 <bff42c98-045d-2e5a-2cf9-eb563425375e@collabora.com>
 <6e0c7590-6ffb-162b-a98d-0a39333453f6@collabora.com>
 <4ca27cee-eda0-0a65-f972-c69cc3b3e53e@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <4ca27cee-eda0-0a65-f972-c69cc3b3e53e@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/14/22 17:14, Andrey Grodzovsky wrote:
> 
> On 2022-07-14 05:57, Dmitry Osipenko wrote:
>> On 7/12/22 11:56, Dmitry Osipenko wrote:
>>> On 7/6/22 18:46, Alex Deucher wrote:
>>>> On Wed, Jul 6, 2022 at 9:49 AM Andrey Grodzovsky
>>>> <andrey.grodzovsky@amd.com> wrote:
>>>>> On 2022-07-06 03:07, Dmitry Osipenko wrote:
>>>>>
>>>>>> Hello Andrey,
>>>>>>
>>>>>> On 5/17/22 17:48, Dmitry Osipenko wrote:
>>>>>>> On 5/17/22 17:13, Andrey Grodzovsky wrote:
>>>>>>>> Done.
>>>>>>>>
>>>>>>>> Andrey
>>>>>>> Awesome, thank you!
>>>>>>>
>>>>>> Given that this drm-scheduler issue needs to be fixed in the
>>>>>> 5.19-RC and
>>>>>> earlier, shouldn't it be in the drm-fixes and not in drm-next?
>>>>>
>>>>> I pushed it into drm-misc from where it got into drm-next. I don't
>>>>> have
>>>>> permission for drm-fixes.
>>>> The -fixes branch of drm-misc.
>>> Now I don't see the scheduler bugfix neither in the -fixes branch nor in
>>> the -next and today Dave sent out 5.19-rc7 pull request without the
>>> scheduler fix. Could anyone please check what is going on with the DRM
>>> patches? Thanks!
>>>
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Ffreedesktop%2Fdrm-misc%2Fcommits%2Fdrm-misc-fixes&amp;data=05%7C01%7Candrey.grodzovsky%40amd.com%7C68b627b8482a4fd28a5608da657f4375%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637933894551324163%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=CDdLG%2F7SqCudEnjhBSsXqq15mfhlHlS3xAdAfB%2Bh%2F1s%3D&amp;reserved=0
>>>
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Flog%2F%3Fh%3Ddrm-misc-fixes&amp;data=05%7C01%7Candrey.grodzovsky%40amd.com%7C68b627b8482a4fd28a5608da657f4375%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637933894551324163%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=4Vz40j6F%2FzHYckXEyPEunj9DRSoTXikhNxZDXeocTss%3D&amp;reserved=0
>>>
>> The patch is in the drm-misc-next-fixes, so it wasn't moved to the
>> drm-misc-fixes.
>>
>> Andrey, don't you have access to drm-misc-fixes? Or you meant
>> drm-fixes=drm-misc-fixes?
> 
> 
> I have only accesses to drm-misc-next to which I pushed this patch.

Thank you for the clarification. IIUC, the drm-misc-next-fixes should
become drm-misc-fixes, but perhaps it was late for the 5.19-rc6 for this
patch.

-- 
Best regards,
Dmitry
