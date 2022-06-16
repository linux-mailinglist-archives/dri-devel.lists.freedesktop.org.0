Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE62054E6A9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 18:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BA51126B4;
	Thu, 16 Jun 2022 16:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B971126B4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 16:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=5MkuctBul9IJAIVhV0CXjLIPtRaSpCdpARIBoblY/Jw=; b=rDJSc0v6Ad7ykTmboi4XAAGG6s
 X9HDnVNLD4ahnoA5xIC1oj687UkhuISwDbKk6zpWBpiZxbfTj5VpCzEnEi8sM7fTDBJwEOABDBFK+
 iCGhC+QTvW/OtvMJqQ5XE67gR5w6uKSfIBnvU7vQAaUMblnYdarjpFnffWa4pbuVTx+Vpsg3xrDBh
 ZeesZ5jcACMCFBZZ6VM9kizF6ZOr42+REZOKmeCuA2fhvBo/ZurLDBWH+6hrqFk/ZgnHwPd/eqt64
 PiXhArYcuMEtyj+cvO5ntwyjtX8Y5nMMi5cRTePR7Bq2/mR9XqPt8KDMcfwYRja2/t04VbYxQoE5a
 wcbvSLaQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o1s1A-008S5Z-Lh; Thu, 16 Jun 2022 16:06:49 +0000
Message-ID: <fc19b80e-3492-4b1a-e7e8-20a6a8ee6cf5@infradead.org>
Date: Thu, 16 Jun 2022 09:06:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 04/11] drm/r128: Fix undefined behavior due to shift
 overflowing the constant
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>, LKML <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20220405151517.29753-1-bp@alien8.de>
 <20220405151517.29753-5-bp@alien8.de>
 <04ff7802-c87a-2ea2-156e-c437446bc072@infradead.org>
 <YoZAhPj0IJmE8ss8@phenom.ffwll.local>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <YoZAhPj0IJmE8ss8@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
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



On 5/19/22 06:05, Daniel Vetter wrote:
> On Mon, Apr 25, 2022 at 11:46:53AM -0700, Randy Dunlap wrote:
>>
>>
>> On 4/5/22 08:15, Borislav Petkov wrote:
>>> From: Borislav Petkov <bp@suse.de>
>>>
>>> Fix:
>>>
>>>   drivers/gpu/drm/r128/r128_cce.c: In function ‘r128_do_init_cce’:
>>>   drivers/gpu/drm/r128/r128_cce.c:417:2: error: case label does not reduce to an integer constant
>>>     case R128_PM4_64BM_64VCBM_64INDBM:
>>>     ^~~~
>>>   drivers/gpu/drm/r128/r128_cce.c:418:2: error: case label does not reduce to an integer constant
>>>     case R128_PM4_64PIO_64VCPIO_64INDPIO:
>>>     ^~~~
>>>
>>> See https://lore.kernel.org/r/YkwQ6%2BtIH8GQpuct@zn.tnic for the gory
>>> details as to why it triggers with older gccs only.
>>>
>>> Signed-off-by: Borislav Petkov <bp@suse.de>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>
>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Pushed to drm-misc-next, thanks for patch&review.
> -Daniel
> 

Hi,

Will this be merged to mainline any time soonish?

thanks.

>>
>> Thanks.
>>
>>> ---
>>>  drivers/gpu/drm/r128/r128_drv.h | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/r128/r128_drv.h b/drivers/gpu/drm/r128/r128_drv.h
>>> index 2e1bc01aa5c9..970e192b0d51 100644
>>> --- a/drivers/gpu/drm/r128/r128_drv.h
>>> +++ b/drivers/gpu/drm/r128/r128_drv.h
>>> @@ -300,8 +300,8 @@ extern long r128_compat_ioctl(struct file *filp, unsigned int cmd,
>>>  #	define R128_PM4_64PIO_128INDBM		(5  << 28)
>>>  #	define R128_PM4_64BM_128INDBM		(6  << 28)
>>>  #	define R128_PM4_64PIO_64VCBM_64INDBM	(7  << 28)
>>> -#	define R128_PM4_64BM_64VCBM_64INDBM	(8  << 28)
>>> -#	define R128_PM4_64PIO_64VCPIO_64INDPIO	(15 << 28)
>>> +#	define R128_PM4_64BM_64VCBM_64INDBM	(8U  << 28)
>>> +#	define R128_PM4_64PIO_64VCPIO_64INDPIO	(15U << 28)
>>>  #	define R128_PM4_BUFFER_CNTL_NOUPDATE	(1  << 27)
>>>  
>>>  #define R128_PM4_BUFFER_WM_CNTL		0x0708
>>
>> -- 
>> ~Randy
> 

-- 
~Randy
