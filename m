Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0878B39B181
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 06:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069C26E1F3;
	Fri,  4 Jun 2021 04:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 784 seconds by postgrey-1.36 at gabe;
 Fri, 04 Jun 2021 04:27:40 UTC
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com
 [192.185.46.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3C36E1B6
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 04:27:40 +0000 (UTC)
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id CBBC210B0A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 23:27:39 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id p1QplhQXX8ElSp1Qpl2QGz; Thu, 03 Jun 2021 23:27:39 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JdshLO/vH+7uOPFxVZD6KKIRBdDODlb7hcZCspqOfmM=; b=Z6i6UINq1eeiwZp5S2Zl843z6J
 DyhJrkStpYNwMEAtyAHyAfRRJWAqiHGwMIaGrD3EYoXGTfot1MFMwUiQp9CdhZu2TfrdEByQjwqKo
 mv4BSA79267agq+6dOVtuyczYL2xNVvqhdXc2LJs03DKD8viT5oGFqc9T5m7LKVadJJ0vw4IG0WOA
 aa90BEwDJo0PLrLe9xL3Y1rI4ufUv2vQeSDff7ucFujkZTqLCt3Rr6jTJkasqnjUGzJIUAbpbtH1K
 teymwRsAguEgX34otNc0yM3wETm2VtDbgb0KgD2f6x7m8wip4iuXKBz934jAvgsjIrmhciR5zmvgs
 7JxzQuUQ==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:34472
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <gustavo@embeddedor.com>)
 id 1lp1Ql-0017cx-ND; Thu, 03 Jun 2021 23:27:36 -0500
Subject: Re: [PATCH RESEND][next] drm/nouveau/therm: Fix fall-through warnings
 for Clang
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210305095807.GA142125@embeddedor>
 <af4363d5-982d-3168-21aa-921c65f35554@embeddedor.com>
 <b3daee1b-95da-c9d0-3214-661807d22f50@embeddedor.com>
Message-ID: <1b3cc4c5-f84c-24cb-4b6f-3bdafbaa85bb@embeddedor.com>
Date: Thu, 3 Jun 2021 23:28:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b3daee1b-95da-c9d0-3214-661807d22f50@embeddedor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lp1Ql-0017cx-ND
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:34472
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 15
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: Kees Cook <keescook@chromium.org>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

If you don't mind, I'm taking this in my -next[1] branch for v5.14.

Thanks
--
Gustavo

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/log/?h=for-next/kspp

On 6/1/21 17:58, Gustavo A. R. Silva wrote:
> Hi,
> 
> Friendly second ping: who can take this?
> 
> I can add this to my -next branch for 5.14 if you don't mind.
> 
> JFYI: We had thousands of these sorts of warnings and now we are down
> to just 23 in linux-next. This is one of those last remaining warnings.
> 
> Thanks
> --
> Gustavo
> 
> On 4/20/21 15:13, Gustavo A. R. Silva wrote:
>> Hi all,
>>
>> Friendly ping: who can take this, please?
>>
>> Thanks
>> --
>> Gustavo
>>
>> On 3/5/21 03:58, Gustavo A. R. Silva wrote:
>>> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
>>> by explicitly adding a break statement instead of letting the code fall
>>> through to the next case.
>>>
>>> Link: https://github.com/KSPP/linux/issues/115
>>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>>> ---
>>>  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c
>>> index 2b031d4eaeb6..684aff7437ee 100644
>>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c
>>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gf119.c
>>> @@ -41,6 +41,7 @@ pwm_info(struct nvkm_therm *therm, int line)
>>>  		default:
>>>  			break;
>>>  		}
>>> +		break;
>>>  	default:
>>>  		break;
>>>  	}
>>>
