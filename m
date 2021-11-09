Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D41144AFA5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 15:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0A289C6A;
	Tue,  9 Nov 2021 14:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E36489C6A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 14:39:05 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id o18so44844802lfu.13
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 06:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=jyBJ2upKfJG7Kux4hCZeboSUewwZJRYpFMsj9SS8i9o=;
 b=ir5ZDcmf7V95JKIIyYhgBklVQc51+WQK0AbUSVRDTddSpZDY7m/Sdbo9aPJ5NYWLf+
 I/o4DyC5wZ6xRt6JKdXdtjf4Hm0fOaqxmKfhws9a2RMAIq1+/0aSn2cB3dZy+UVn5ox6
 cpX9RnQPtJlHN1f9wDaRfjiL5jdg32z40OqHS5yVyiz0pDXDZSx9pYNl7548NroN1cni
 Ix6R4pk2i8q8ZSsli6vqOG9FqiDZvPAs1El8MCGqtNAsmG0mFJX5vcJlqPCsfAxQl+rm
 Gu06YXzR1SA/wdJKMK2OcAjPyYKHwprgEbRczrWdgmC7vvGjTsHBywepZDQac7hAusbu
 wvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jyBJ2upKfJG7Kux4hCZeboSUewwZJRYpFMsj9SS8i9o=;
 b=boEQ+m1M5x3POXaDGNBSvqE6JweLRPc0iRuKTlnQUVGj50thCv9Cr2xu3KdakjiND1
 qF6Vq7wZrA/GtXwhoa0xzk0FYYXWkHSAPHy6XxOWP2TYbMXiMSCdDIm3PyYA+nG/cB5D
 jY4+q26mzsw26ojZiihBJKX0LeLvZVmej8P/qKl7XC2fJAcr03TV0YGhZxUeZH0kZoRk
 4lYc693uZQ/OMurtRSHuYmBaSe6qCZBP1rDTQolIenvrcuAyEfWVgofdZVDr85Oi8e15
 PhZR+qfkNoNfc08R//43s1ynpvUcY+XRgIqUIQV8pCBs/6E3zkwXWqbd/9b4ycQ1IbvM
 CX6A==
X-Gm-Message-State: AOAM53287mmN8Iax17Qeee2IQSwIZfEfIByD7w+UY2poCxU+R3e57SEn
 xovDzlkQkfIfhpZ022qfRss=
X-Google-Smtp-Source: ABdhPJznlfY8+zh/8oMdgnpOTLoYcyynyD4lHaDCdiihjw2hT3YhH1pFxJnm3shxUvURStovH+KaCA==
X-Received: by 2002:a05:6512:152a:: with SMTP id
 bq42mr7278741lfb.109.1636468743544; 
 Tue, 09 Nov 2021 06:39:03 -0800 (PST)
Received: from [192.168.2.145] (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.googlemail.com with ESMTPSA id i18sm2154335lfv.147.2021.11.09.06.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 06:39:03 -0800 (PST)
Subject: Re: [PATCH v1 2/2] drm/tegra: Use drm_dp_aux_register_ddc/chardev()
 helpers
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Thomas Graichen
 <thomas.graichen@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211107230821.13511-1-digetx@gmail.com>
 <20211107230821.13511-2-digetx@gmail.com>
 <YYk/jfcceun/Qleq@phenom.ffwll.local>
 <0a2c02ae-3fe1-e384-28d3-13e13801d675@gmail.com>
 <YYo9IXjevmstSREu@phenom.ffwll.local>
 <857a48ae-9ff4-89fe-11ce-5f1573763941@gmail.com>
 <efdc184a-5aa3-1141-7d74-23d29da41f2d@gmail.com>
 <71fcbc09-5b60-ee76-49b2-94adc965eda5@gmail.com>
Message-ID: <49ffd29b-eb64-e0ca-410c-44074673d740@gmail.com>
Date: Tue, 9 Nov 2021 17:39:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <71fcbc09-5b60-ee76-49b2-94adc965eda5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

09.11.2021 17:17, Dmitry Osipenko пишет:
> 09.11.2021 17:08, Dmitry Osipenko пишет:
>>> +static void host1x_drm_dev_deinit(struct host1x_device *dev)
>>> +{
>>> +	struct drm_device *drm = dev_get_drvdata(&dev->dev);
>> And platform_unregister_drivers() should be moved here.
>>
> 
> Nah, that should cause deadlock. This ad-hoc is too lame.

Actually, there is no problem here as I see now. The host1x driver
populates DT nodes after host1x_register() [1], meaning that Host1x DRM
will be always inited first.

[1]
https://elixir.bootlin.com/linux/v5.15/source/drivers/gpu/host1x/dev.c#L475

Still I'm not a fan of the ad-hoc solution.

> Another solution is to defer probing of DP AUX driver while
> tegra_drm_device() returns NULL, but it's icky.
> 
> Reverting the original DP AUX DDC registration order is the best option
> so far, IMO.
> 
