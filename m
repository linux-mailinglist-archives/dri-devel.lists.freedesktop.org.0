Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943667EAC31
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 09:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D61A10E1DC;
	Tue, 14 Nov 2023 08:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB4010E1DC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 08:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699952160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U2eptL0/hRZAJ5UVmQrsn8paC3yYwq6Vrl06QgAw1qU=;
 b=TroA/J5Cl7hDfmi5WIhCOi9Fn42PWXCdhOgOEuzVlwQJ1/DZVLh8W9UacF1Wj+6FnN6L6E
 GXfe8I8MYoIYxJLFOSFixYhYRPIkLmv6nwB59xF3WR35MekWIVlrws8TeCKvRoeDX6Emh9
 eanlzbLgPeYAdU8Fdq67Qi5AcLlq+eE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-Oj8xmFfPNaOawU-Afs1YWQ-1; Tue, 14 Nov 2023 03:55:56 -0500
X-MC-Unique: Oj8xmFfPNaOawU-Afs1YWQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40a48806258so23585315e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 00:55:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699952155; x=1700556955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U2eptL0/hRZAJ5UVmQrsn8paC3yYwq6Vrl06QgAw1qU=;
 b=Lvat3Nkei9Oj3KZxSTEcOmn3na+aqlLE0xxpVb53Z943Q29dOdhjtcDkFt+D+Hww1y
 6Pe5xnS+nZg/Q/Fsx0IzAcRHYs9DXoQdjejKKE/wAO3gQp0Kqzg3SbcMFU0BD1QMHfPw
 3edCZieZkSjtAhEpZA3RiJVGt7oHnuviuVtopsw2BnJfcUs9YXrd/njtfbz3m16qyL0X
 oWbZXjlDiQgtJx4+IAGGOnh3XKoLKc2MukfhNGlFL9ZK7XUZBbD+3i4uosDVL75u/RDg
 Tk0to8bOg69Q7K9ljaAVmpV95yTMfUcWO1cio+Wlte+/TWCkNTh8EpW6nfN28JV+cv5g
 cITA==
X-Gm-Message-State: AOJu0YyTUr+Bmwsm9sfaBYyKHVexC5vVpcgzKmquw4DuUHW9oSQPYJ/M
 Mqq9NnHShntL9NLbWsFgsJOfiswj/Vs/HIEh6tfywQWCogVQn4X2MvNpBnjyh7assRr6s9DsbgA
 u0fsS5o/YEexvP6AtZx5SWt2U65z7
X-Received: by 2002:a05:600c:4689:b0:406:53f1:d629 with SMTP id
 p9-20020a05600c468900b0040653f1d629mr7066886wmo.5.1699952155648; 
 Tue, 14 Nov 2023 00:55:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwmxzArCE1yT7c6VWtUi4CeGvspYKMMRsTRuOyn603I9zaKES8gBzQS1aSNYvHBK4R3G7DMw==
X-Received: by 2002:a05:600c:4689:b0:406:53f1:d629 with SMTP id
 p9-20020a05600c468900b0040653f1d629mr7066871wmo.5.1699952155285; 
 Tue, 14 Nov 2023 00:55:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a1c4b07000000b003fe1fe56202sm10557897wma.33.2023.11.14.00.55.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 00:55:54 -0800 (PST)
Message-ID: <bafd23a9-81d4-4d3b-9fd3-10461cba6b89@redhat.com>
Date: Tue, 14 Nov 2023 09:55:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Incomplete stable drm/ast backport - screen freeze on boot
To: Sasha Levin <sashal@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <CABV8kRwx=92ntPW155ef=72z6gtS_NPQ9bRD=R1q_hx1p7wy=g@mail.gmail.com>
 <32a25774-440c-4de3-8836-01d46718b4f8@redhat.com>
 <9dc39636-ff41-44d7-96cb-f954008bfc9d@suse.de> <ZVJQxS6h_K73fMfQ@sashalap>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZVJQxS6h_K73fMfQ@sashalap>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: regressions@lists.linux.dev, Keno Fischer <keno@juliahub.com>,
 Greg KH <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/11/2023 17:37, Sasha Levin wrote:
> On Mon, Nov 13, 2023 at 10:49:01AM +0100, Thomas Zimmermann wrote:
>> (cc: gregkh)
>>
>> Hi Jocelyn
>>
>> Am 13.11.23 um 10:36 schrieb Jocelyn Falempe:
>>> On 13/11/2023 09:34, Keno Fischer wrote:
>>>> Greetings,
>>>>
>>>> When connected to a remote machine via the BMC KVM functionality,
>>>> I am experiencing screen freezes on boot when using 6.5 stable,
>>>> but not master.
>>>>
>>>> The BMC on the machine in question is an ASpeed AST2600.
>>>> A quick bisect shows the problematic commit to be 2fb9667
>>>> ("drm/ast: report connection status on Display Port.").
>>>> This is commit f81bb0ac upstream.
>>>>
>>>> I believe the problem is that the previous commit in the series
>>>> e329cb5 ("drm/ast: Add BMC virtual connector")
>>>> was not backported to the stable branch.
>>>> As a consequence, it appears that the more accurate DP state detection
>>>> is causing the kernel to believe that no display is connected,
>>>> even when the BMC's virtual display is in fact in use.
>>>> A cherry-pick of e329cb5 onto the stable branch resolves the issue.
>>>
>>> Yes, you're right this two patches must be backported together.
>>>
>>> I'm sorry I didn't pay enough attention, that only one of the two was 
>>> picked up for the stable branch.
>>>
>>> Is it possible to backport e329cb5 to the stable branch, or should I 
>>> push it to drm-misc-fixes ?
>>
>> I think stable, which is in cc, will pick up commit e329cb5 
>> semi-automatically now. Otherwise, maybe ping gregkh in a few days 
>> about it.
> 
> I thikn it would be more appropriate to revert 2fb9667, as e329cb5
> doesn't look like -stable material. I'll go ahead and do that.
> 
Ok, that's the best thing to do, as Thomas also found that userspace can 
be confused by the new BMC virtual connector, so it's safer to revert.

Thanks,

-- 

Jocelyn

