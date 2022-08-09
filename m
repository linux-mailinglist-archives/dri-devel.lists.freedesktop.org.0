Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE8A58DF9B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 21:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6FFC2460;
	Tue,  9 Aug 2022 19:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61823C2405
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 19:02:20 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id l5so3093926qtv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 12:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=89KvQ1zh0g8qX0TJw/MJDZ1wl5xMXKaw1uQzHBD5qe0=;
 b=AAz559DKCeHUYgpsWp8Kh3L31Ca2QLR5pHejqi8yHm7qTZ422IFxPckiSJ3wV65bpP
 a5+/GG3+vQ8nj85XkixWTNHQ0dcpR7lmTAgOfb+6KEKxYwQz0dNisR+sMFqcbOoHEHUc
 WSt6Y+U1yKNPgXro9pzFv03B27+Ei5VukxSP9PyCfnVgrV32CDtn8yJrpD7gDk8/VrgW
 sBcDv3o/iEOhzYFOov2SBQE7wvRJcJSkUxdyDUcydXZ9ws125i84ENt4n1U8Rm59YTlL
 cmERYBlpzsBMmmWFbDGkrBoQ0vPAmqp6ghOR5bJBRkjdH8PNgHoeuLKsU+8J/XnsRzVg
 QRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=89KvQ1zh0g8qX0TJw/MJDZ1wl5xMXKaw1uQzHBD5qe0=;
 b=IO4Rpi9UfMuvDcRC4ezRqnBO7pz4cAIdP6puNN0vDxN1AwnXk9Zvv+K7z33j7sk+XL
 3Sn9ZMC677yhubvRh0jao9XGDtCYGQ3hGSexTKDEJ1yKVx/sYjw4SRbZIYKc4bggBJZ8
 +EcJNeBljC0kRzVCzsZzOh0ja5I9HBCTEK7wymTA1pBRNNbuIx9Bfy4pSUqT7FTgJGUc
 f8h5lSaZQ9Dx3Cb+fX6CwmcGRuN9+Wv70kRtZJB/rjGIZ3j3nsR7Ql91OsqeerjV4ZN3
 0Xj7UNvWPRRSn0s9oNvVkrSWD/ESpuHNG0fRVnEJb36AfJKIB2zHZWqQMNC5LCV4XPVH
 eWMA==
X-Gm-Message-State: ACgBeo2Srpyfd6eCjCn2sH+j8F95dHjsc0eOtr9eTg4BLbKa/bPQ0sUL
 w4owFVagS0id/J86gBztXMY=
X-Google-Smtp-Source: AA6agR6kK/Y8ijWLgE0pX1C4gjrhhKtHpUi2VUGwuhFtQp7sR+kSYnfa9+7euv7QqNRJ1FXsIovdpw==
X-Received: by 2002:a05:622a:d3:b0:343:5566:94db with SMTP id
 p19-20020a05622a00d300b00343556694dbmr969829qtw.161.1660071739278; 
 Tue, 09 Aug 2022 12:02:19 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 br19-20020a05622a1e1300b0031eeecd21d6sm2702261qtb.69.2022.08.09.12.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 12:02:15 -0700 (PDT)
Message-ID: <c82f57ba-0b60-10a0-d254-da91a32a923d@gmail.com>
Date: Tue, 9 Aug 2022 12:02:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 23/33] drm/vc4: hdmi: Move HDMI reset to pm_resume
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Stefan Wahren <stefan.wahren@i2se.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20220613144800.326124-1-maxime@cerno.tech>
 <20220613144800.326124-24-maxime@cerno.tech>
 <ebd018b6-456e-fb22-b075-4da87f50b20b@gmail.com>
In-Reply-To: <ebd018b6-456e-fb22-b075-4da87f50b20b@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/4/22 16:11, Florian Fainelli wrote:
> On 6/13/22 07:47, Maxime Ripard wrote:
>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>
>> The BCM2835-37 found in the RaspberryPi 0 to 3 have a power domain
>> attached to the HDMI block, handled in Linux through runtime_pm.
>>
>> That power domain is shared with the VEC block, so even if we put our
>> runtime_pm reference in the HDMI driver it would keep being on. If the
>> VEC is disabled though, the power domain would be disabled and we would
>> lose any initialization done in our bind implementation.
>>
>> That initialization involves calling the reset function and initializing
>> the CEC registers.
>>
>> Let's move the initialization to our runtime_resume implementation so
>> that we initialize everything properly if we ever need to.
>>
>> Fixes: c86b41214362 ("drm/vc4: hdmi: Move the HSM clock enable to 
>> runtime_pm")
>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> After seeing the same warning as Stefan reported in the link below, but 
> on the Raspberry Pi 4B:
> 
> https://www.spinics.net/lists/dri-devel/msg354170.html
> 
> a separate bisection effort led me to this commit, before is fine, after 
> produces 4 warnings during boot, see attached log.
> 
> Is there a fix that we can try that would also cover the Raspberry Pi 
> 4B? Is it possible that this series precipitates the problem:
> 
> https://www.spinics.net/lists/arm-kernel/msg984638.html

Maxime, Dave, anything you would want me to try? Still seeing these 
warnings with net-next-6.0-11220-g15205c2829ca

Would be nice to see those fixes before 6.0 final, thanks!
-- 
Florian
