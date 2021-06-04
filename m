Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C3239B19C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 06:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693CF6E221;
	Fri,  4 Jun 2021 04:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1229 seconds by postgrey-1.36 at gabe;
 Fri, 04 Jun 2021 04:48:30 UTC
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com
 [192.185.146.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AF16E221
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 04:48:30 +0000 (UTC)
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
 by gateway30.websitewelcome.com (Postfix) with ESMTP id 426C15907
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 23:27:59 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id p1R9ldLYZMGeEp1R9lWISu; Thu, 03 Jun 2021 23:27:59 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tmKbVxD5QRNxYgvET2f9iyU8zdJK3B5xkoywFvU0nbk=; b=hZL3R8CSFrFaOxPOz5slqALI+k
 roRKk+v9sPJQ9gnFQc9uOepXmRAWoulACY5m+961nuL24ylRa+zDiI3aV6Hpvz7W2qTmAWuoZ6c6w
 XwVgMuhufVFdLPr/FCjiMVUUDl79AYrZLli1NuXUM0HJstNLNGNh9zhaMUutfKij2R3ooRKgwSAYE
 yYpqaoTzBL2/lOTqJQScSplI927IYPVYpJr1cZYGINYW7l4GfK5t7hoPVQxv9itrNbnQF/NSIfjCO
 qIXDhBOP/yWNUlnbHLIc/QwnqJ6XY9zv0PzEI60ulZ8ymInArz/9XP9457v2SXq2sWFYCEeuy44Wq
 2/JgdJIg==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:34478
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <gustavo@embeddedor.com>)
 id 1lp1R5-00182o-6d; Thu, 03 Jun 2021 23:27:55 -0500
Subject: Re: [PATCH RESEND][next] drm/nouveau/clk: Fix fall-through warnings
 for Clang
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210305095609.GA141907@embeddedor>
 <b42a6c20-e70d-c56a-795a-072ecc772bf2@embeddedor.com>
 <2aaf5382-3907-ac2a-ebff-a33b308aaf7d@embeddedor.com>
Message-ID: <f6834e09-c329-8546-19c1-d58adbf0f36a@embeddedor.com>
Date: Thu, 3 Jun 2021 23:28:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2aaf5382-3907-ac2a-ebff-a33b308aaf7d@embeddedor.com>
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
X-Exim-ID: 1lp1R5-00182o-6d
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:34478
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 24
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

On 6/1/21 17:57, Gustavo A. R. Silva wrote:
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
>> On 3/5/21 03:56, Gustavo A. R. Silva wrote:
>>> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
>>> by explicitly adding a break statement instead of letting the code fall
>>> through to the next case.
>>>
>>> Link: https://github.com/KSPP/linux/issues/115
>>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>>> ---
>>>  drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c
>>> index 83067763c0ec..e1d31c62f9ec 100644
>>> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c
>>> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c
>>> @@ -313,6 +313,7 @@ nv50_clk_read(struct nvkm_clk *base, enum nv_clk_src src)
>>>  		default:
>>>  			break;
>>>  		}
>>> +		break;
>>>  	default:
>>>  		break;
>>>  	}
>>>
