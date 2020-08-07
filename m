Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9259D2402AD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A8289C51;
	Mon, 10 Aug 2020 07:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8C76E139;
 Fri,  7 Aug 2020 16:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=S8JHbHVUKOnsDJ6vyDw0HBSI86uZiFi5itw14Bq3gQU=; b=jOD2ZI+n0+FgJNGycqX64zKdGD
 4/o/iIp+buCL8ZsTq/dYT8ZX74PeRaHP6hBP81XbZUifMux8OnSCQfaQVrm39N5NQrK6yZwlMxBCg
 NVr0dwLLvZmb5NBI4j+0nMIPLKe5ZCSs/8iOWOj/HqN3ssOP9EimnDK0TI6TxKJJ4izGK92drhUF2
 Ym5tlRsy9nNUxy56Zhg3vFijErdRX9ObeRw2KSOEZYdBMTg9JMugJXgmnnQ6SiCc5Jp6Feb8ICndg
 JaTSsg2+dw7MzWTiI1Zivi2/El06E6dbX9ZiDkbTp7C4DYk6/MUYyYgJs2gWzqUjB+NuCqc5E5p5i
 +7tqXNDw==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k457g-0002hE-0j; Fri, 07 Aug 2020 16:21:36 +0000
Subject: Re: [PATCH v9 2/5] drm/msm/dp: add displayPort driver support
To: Guenter Roeck <groeck@google.com>
References: <20200807071718.17937-1-tanmay@codeaurora.org>
 <20200807071718.17937-3-tanmay@codeaurora.org>
 <b0e8415f-53e6-575d-5774-5f4f7adca982@infradead.org>
 <CABXOdTf6be2-O_aBakamNFswt+Xk0urJ7_x9hgwuuFO6=NDeew@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ab0a3659-b4c4-e7a9-f010-9ace4dae84a7@infradead.org>
Date: Fri, 7 Aug 2020 09:21:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CABXOdTf6be2-O_aBakamNFswt+Xk0urJ7_x9hgwuuFO6=NDeew@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:58 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 abhinavk@codeaurora.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, khsieh@codeaurora.org,
 Sean Paul <seanpaul@chromium.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Guenter Roeck <groeck@chromium.org>, Vara Reddy <varar@codeaurora.org>,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/7/20 9:09 AM, Guenter Roeck wrote:
> On Fri, Aug 7, 2020 at 8:37 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 8/7/20 12:17 AM, Tanmay Shah wrote:
>>> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
>>> index 6deaa7d01654..ea3c4d094d09 100644
>>> --- a/drivers/gpu/drm/msm/Kconfig
>>> +++ b/drivers/gpu/drm/msm/Kconfig
>>> @@ -57,6 +57,14 @@ config DRM_MSM_HDMI_HDCP
>>>       help
>>>         Choose this option to enable HDCP state machine
>>>
>>> +config DRM_MSM_DP
>>> +     bool "Enable DP support in MSM DRM driver"
>>
>>         bool "Enabled DisplayPort support in MSM DRM driver"
>>
> Why "Enabled" ? This would be quite unusual for a Kconfig entry.

Sorry, my typo.
Just "Enable", like it was earlier.

> Guenter
> 
>>> +     depends on DRM_MSM
>>> +     help
>>> +       Compile in support for DP driver in msm drm driver. DP external
>>
>>                                               MSM DRM
>>
>> Also:
>> I can't find anywhere in drivers/gpu/drm/msm/ that explains what MSM means.
>> What does it mean?
>>
>>> +       display support is enabled through this config option. It can
>>> +       be primary or secondary display on device.
>>> +
>>>  config DRM_MSM_DSI
>>>       bool "Enable DSI support in MSM DRM driver"
>>>       depends on DRM_MSM


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
