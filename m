Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D07753FEB9C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 11:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1DA6E4BA;
	Thu,  2 Sep 2021 09:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www.kot-begemot.co.uk (ivanoab7.miniserver.com [37.128.132.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D691C6E48D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 08:11:08 +0000 (UTC)
Received: from tun252.jain.kot-begemot.co.uk ([192.168.18.6]
 helo=jain.kot-begemot.co.uk)
 by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1mLhoJ-0003Pp-Se; Thu, 02 Sep 2021 08:11:04 +0000
Received: from madding.kot-begemot.co.uk ([192.168.3.98])
 by jain.kot-begemot.co.uk with esmtps
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1mLhoF-0000bs-23; Thu, 02 Sep 2021 09:10:59 +0100
Subject: Re: [PATCH] drm/ttm: provide default page protection for UML
To: Johannes Berg <johannes@sipsolutions.net>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 linux-um@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210902020129.25952-1-rdunlap@infradead.org>
 <9faacbc8-3346-8033-5b4d-60543eae959e@cambridgegreys.com>
 <f978cae5-7275-6780-8a17-c6e61247bce7@infradead.org>
 <0887903c-483d-49c7-0d35-f59be2f85bac@cambridgegreys.com>
 <288a2d4dbcb1e6b0fbeff6da86569aa92df09202.camel@sipsolutions.net>
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Organization: Cambridge Greys
Message-ID: <347e4cb8-a7c5-9e1b-16bc-96805442d35b@cambridgegreys.com>
Date: Thu, 2 Sep 2021 09:10:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <288a2d4dbcb1e6b0fbeff6da86569aa92df09202.camel@sipsolutions.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0
X-Spam-Score: -1.0
X-Clacks-Overhead: GNU Terry Pratchett
X-Mailman-Approved-At: Thu, 02 Sep 2021 09:55:32 +0000
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

On 02/09/2021 08:43, Johannes Berg wrote:
> On Thu, 2021-09-02 at 07:19 +0100, Anton Ivanov wrote:
>>>>
>>>> I have a question though - why all of DRM is not !UML in config. Not
>>>> like we can use them.
>>>
>>> I have no idea about that.
>>> Hopefully one of the (other) UML maintainers can answer you.
>>
>> Touche.
>>
>> We will discuss that and possibly push a patch to !UML that part of the
>> tree. IMHO it is not applicable.
> 
> As I just said on the other patch, all of this is fallout from my commit
> 68f5d3f3b654 ("um: add PCI over virtio emulation driver") which is the
> first time that you could have PCI on UML.
> 
> Without having checked, in this particular case it's probably something
> like
> 
> 	depends on PCI && X86_64
> 
> as we've seen in other drivers (idxd, ioat).
> 
> The biggest problem is probably that UML internally uses X86_64
> (arch/x86/um/Kconfig), which is ... unexpected ... since CONFIG_X86_64
> is typically considered the ARCH, and now the ARCH is actually um.
> 
> I think we can just fix that and get rid of this entire class of
> problems? Something like
> 
> https://p.sipsolutions.net/fbac19d86637e286.txt

Good idea. I suspect that DRM will not be the only thing to pop up out 
of this so we might as well fix it "at the top".

A

> 
> johannes
> 
> 
> 
> _______________________________________________
> linux-um mailing list
> linux-um@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-um
> 


-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
https://www.cambridgegreys.com/
