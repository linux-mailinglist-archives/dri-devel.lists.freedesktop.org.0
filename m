Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E14F64E883A
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 16:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA90610E459;
	Sun, 27 Mar 2022 14:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1362 seconds by postgrey-1.36 at gabe;
 Sun, 27 Mar 2022 14:45:12 UTC
Received: from gateway31.websitewelcome.com (gateway31.websitewelcome.com
 [192.185.143.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B941910E459
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 14:45:12 +0000 (UTC)
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway31.websitewelcome.com (Postfix) with ESMTP id A09999AE02
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 09:22:29 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
 by cmsmtp with SMTP
 id YTmnna9qP9AGSYTmnnP1h1; Sun, 27 Mar 2022 09:22:29 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G/veNDzCNS5/sUVFJGizo3guRLL8pkQ0CB/O7gGvVxs=; b=EmL8qGcra7Wt23Kn0RbrN6quHi
 J9CWPtYJEhIPgJRb0guYbe+vH7gLtxbxdq5KxZR1SEeb/j1WKvTUVEa/0ifN69o8yjv+4QVKhKcps
 1aNwkwqofgKirE16tEjtE6h4A4XcLxRQhWKRJmArD9fE8Ts0ZAtSZBn9dFiU3k5B4mbLK0q3vEkA1
 iIBgjiYyJ0aOC/aHbDTZY3Q4DUWDMbQi56BtouuRTeEJm9dkf/8UXQwGb2zZaer7PPJUmotpipCWk
 Et5tlgfFS1ipzFrDJyH1XwWC9NXuEjV/5GYgihu8DzqTBPXj6HFRbBoozuLZy4+8Kb+TkLBeJcMSS
 whTuAXMQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:54514)
 by bh-25.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@roeck-us.net>)
 id 1nYTmm-001lFq-Md; Sun, 27 Mar 2022 14:22:28 +0000
Message-ID: <10cdb7dc-c210-8439-dacc-4338d3070f7f@roeck-us.net>
Date: Sun, 27 Mar 2022 07:22:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] device: fix missing check on list iterator
Content-Language: en-US
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
References: <80429172-37c6-c9ce-4df7-259bb90338a8@roeck-us.net>
 <20220327065950.7886-1-xiam0nd.tong@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220327065950.7886-1-xiam0nd.tong@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nYTmm-001lFq-Md
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 [108.223.40.66]:54514
X-Source-Auth: linux@roeck-us.net
X-Email-Count: 6
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
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
Cc: kherbst@redhat.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/26/22 23:59, Xiaomeng Tong wrote:
> On Sat, 26 Mar 2022 22:38:05 -0700, Guenter Roeck <linux@roeck-us.net> wrote:
>>> @@ -103,11 +103,16 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl, void *data, u32 size)
>>>    		return -EINVAL;
>>>    
>>>    	if (args->v0.state != NVIF_CONTROL_PSTATE_ATTR_V0_STATE_CURRENT) {
>>> -		list_for_each_entry(pstate, &clk->states, head) {
>>> -			if (i++ == args->v0.state)
>>> +		list_for_each_entry(iter, &clk->states, head) {
>>> +			if (i++ == args->v0.state) {
>>> +				pstate = iter;
>>
>> Is iter and the assignment really necessary ? Unless I am missing something,
>> list_for_each_entry() always assigns pos (pstate/iter), even if the list is
>> empty. If nothing is found, pstate would be NULL at the end, so
> 
> the pstate will not be NULL at the end! so the assignment is necessary!
> #define list_for_each_entry(pos, head, member)                          \
>      for (pos = __container_of((head)->next, pos, member);               \
>           &pos->member != (head);                                        \
>           pos = __container_of(pos->member.next, pos, member))
> 


Uuh, yes, you are correct. Sorry for the noise.

Guenter

