Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FC447E0BB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 10:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78CD10E2AA;
	Thu, 23 Dec 2021 09:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9647B10E2AA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 09:11:24 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso2884235wme.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 01:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=E8oqCDxQAAUPB0dz/BCO4AOd3xZwCZLLVDd5QYYb2Ac=;
 b=IJrbSDmmwV9i4FGK8bAvQzi/bUWaAq1ASy2S7tx2Y4uYryn+dpBxqtzA6SSwkCRRP8
 5ktTkCtisSYvT/BZka6GG5eIUm71FfT90T90YRjMrWFgU3LJdm8Ga+KYEts+wQTbgpiO
 5RvIIB4yopIAO1U9auSTRhb1DsdKb08hz0DHKSEV9xBqC+g+JU1n5rzAkGCQVFNlTTTg
 8scnFPCWkrlXLY3SfFL/40lyUeETvLtlKAGUuML9bFUd6E1uppKaL3p15EFdF3Hj4i2a
 drBmmIkw0xBXVYO/8WMLmI3w4vEi2d7HcclVDcoBIuAhi/B/MQJt0t7NPi+mU698k2f7
 RvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=E8oqCDxQAAUPB0dz/BCO4AOd3xZwCZLLVDd5QYYb2Ac=;
 b=a1GFHyX3Nt/4g1N7Wd5FFRxe2MuVBCqiWPiIjWSJMBq9gj1nwWjCT9Dr6cG56A+Gs7
 Oq3eFEG3eXfN46m07IXFvqUaPYBgqVlW81zutWvzyyNEPuRX6AvGB71HkjLTSW8OiyJH
 Pwjtu27vyTCSoRVo4hYmR43q+FABgk/OKmtIrYVVYFy4xlOKiC/001oSHNepUrssOuVK
 ZrxlMtqDPNzVbFX7OoJYZaGmq3s2gwd/83F6pNSplUbS8QbhCjJ+/N2cfZUQ5QjPDrKN
 SogDxjURJPcml4bQtMz5iS8YV0Nq/tTDQiZ/B3mbfcDr2Ivfm+pQanaG6vclOJWybcU5
 NJcg==
X-Gm-Message-State: AOAM532nG/n8RMbRRA3fmKa2KsFRR3ytVjbYFwmovhNXyb9UtcD04wre
 4JXDNGA1pmzbZr6DnF5Nhc8dTxTYN8s=
X-Google-Smtp-Source: ABdhPJzGl/qU+hk5aBABASio9ZLh9n+ZQxW0Tjdu/bqiIhAdRejLvEY9REe3X/CnyCl9Z/6ZNjrVbA==
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr1118161wmj.76.1640250683229; 
 Thu, 23 Dec 2021 01:11:23 -0800 (PST)
Received: from [192.168.178.21] (p57b0bff8.dip0.t-ipconnect.de.
 [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id k13sm4280339wri.6.2021.12.23.01.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 01:11:22 -0800 (PST)
Subject: Re: completely rework the dma_resv semantic
To: Daniel Vetter <daniel@ffwll.ch>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <e8c7284f-e18e-0dcc-f0a2-3a1ad6222fd4@gmail.com>
 <YcOkB0Jlc5KsHnEN@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c63e62cc-e48e-2e81-571c-498e4d16fd21@gmail.com>
Date: Thu, 23 Dec 2021 10:11:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcOkB0Jlc5KsHnEN@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.12.21 um 23:17 schrieb Daniel Vetter:
> On Fri, Dec 17, 2021 at 03:39:52PM +0100, Christian König wrote:
>> Hi Daniel,
>>
>> looks like this is going nowhere and you don't seem to have time to review.
>>
>> What can we do?
> cc more people, you didn't cc any of the driver folks :-)

Well I've CCed more people and lists and the first round of the patches. 
Just wanted to get some more comments from you first before widening the 
audience.

> Also I did find some review before I disappeared, back on 10th Jan.

Good, then I have at least something todo for the first week on January.

Happy holidays,
Christian.

>
> Cheers, Daniel
>
>> Thanks,
>> Christian.
>>
>> Am 07.12.21 um 13:33 schrieb Christian König:
>>> Hi Daniel,
>>>
>>> just a gentle ping that you wanted to take a look at this.
>>>
>>> Not much changed compared to the last version, only a minor bugfix in
>>> the dma_resv_get_singleton error handling.
>>>
>>> Regards,
>>> Christian.
>>>
>>>

