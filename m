Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HTLK4m0emma9QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 02:14:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3F9AA893
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 02:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8E910E2FA;
	Thu, 29 Jan 2026 01:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hpzwVGm5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E99A10E2FA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 01:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769649282;
 bh=gtoH8iXkfDnDeWMhk7HbyeV4YG1OQmXsw/axrAJnNUM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hpzwVGm5nAyhlPywmD3XFVwVUogkLuoq48Zc5VZNyJhl8cZhXnwCda79We5iUXX/4
 zXCN1Z+sRzfV9twaA6swkac5NV5rkpRWG7lXF7/Ki9FAZSu+chuwxorlX7532prfeu
 VAJm1Q35aVWjUJONWd+Q6I2DqrFdA9K5w6DEuH/K5EVCBXTchz4V5smnfKoeOzMke1
 FoSmjgdXjcglOjVfAdLGRnENVLRg4aTObNzUQPrPZAv8e03rV2DuKIOe0KKudhP99P
 1AmoKo00CMkzgjAV4tnJmqa7LA5t1VbgnFdAMQPRPLfNgF3Vf9+kbWoLpTY8bSjbR/
 OE39XhQAcKF3g==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 33FCB17E01E7;
 Thu, 29 Jan 2026 02:14:42 +0100 (CET)
Message-ID: <c9f51c59-c972-420e-89da-f42ab5a843c0@collabora.com>
Date: Thu, 29 Jan 2026 03:14:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] uapi: Provide DIV_ROUND_CLOSEST()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Diederik de Haas <diederik@cknow-tech.com>
References: <20260127-rk3588-bgcolor-v5-0-b25aa8613211@collabora.com>
 <20260127-rk3588-bgcolor-v5-1-b25aa8613211@collabora.com>
 <baf075b2370a13cddd597a3d421b5f39290d87a4@intel.com>
 <aXjNyHaJDHoCPRJO@smile.fi.intel.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <aXjNyHaJDHoCPRJO@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:jani.nikula@linux.intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:robert.mader@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:nfraprado@collabora.com,m:diederik@cknow-tech.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,rock-chips.com,sntech.de,bootlin.com,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,cknow-tech.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[cristian.ciocaltea@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid,intel.com:email]
X-Rspamd-Queue-Id: 1A3F9AA893
X-Rspamd-Action: no action

Hi Andy,

On 1/27/26 4:38 PM, Andy Shevchenko wrote:
> On Tue, Jan 27, 2026 at 03:58:13PM +0200, Jani Nikula wrote:
>> On Tue, 27 Jan 2026, Cristian Ciocaltea <cristian.ciocaltea@collabora.com> wrote:
>>> Currently DIV_ROUND_CLOSEST() is only available for the kernel via
>>> include/linux/math.h.
>>>
>>> Expose it to userland as well by adding __KERNEL_DIV_ROUND_CLOSEST() as
>>> a common definition in uapi.
>>>
>>> Additionally, ensure it allows building ISO C applications by switching
>>> from the 'typeof' GNU extension to the ISO-friendly __typeof__.
>>
>> I am not convinced that it's a good idea to make the implementation of
>> kernel DIV_ROUND_CLOSEST() part of the kernel UAPI, which is what this
>> change effectively does.
>>
>> I'd at least like to get an ack from Andy Shevchenko first (Cc'd).
> 
> Thanks for Cc'ing me!
> 
> So, the history of the DIV_ROUND_UP() to appear in UAPI is a response to
> the ethtool change that missed the fact that this was a kernel internal macro.
> Giving a precedent there is no technical issues to add DIV_ROUND_CLOSEST()
> to UAPI as proposed. Main question here is: Does DRM headers in question
> (that are going to use it) really need this?
> 
> Interestingly that DRM also started using __KERNEL_DIV_ROUND_UP() in UAPI
> at some point, which kinda makes an argument for allowing the other one.
> 
> Also fun fact: this series plead for a new macro for division while ignoring
> existing (UAPI) macros for masks and bits.

Yeah, I initially planned to make use of those, but gave up after realizing the
FIELD_{PREP|GET} were not exposed. I reconsidered my position now that you
mentioned it. :-)

> 
> 0xffffU is effectively __GENMASK(15, 0). (And if you change the code, avoid
> using variables inside GENMASK() macros, it may generate an awful code, the
> GENMASK($HI, $LO) << foo is preferred over GENMASK(foo + $DELTA, foo) case.
> GENMASK(foo - 1, 0) OTOH is fine, however be always careful against overflows
> with left shifts, as BIT(foo) - 1 may not work for foo == 32, while GENMASK()
> may not work for foo == 0).

Thanks for the heads up!

> 
> So, I have no objections for either choice
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> ...
> 
> But if you go that direction, please, fix up the style.
> 
>>> +/*
>>> + * Divide positive or negative dividend by positive or negative divisor
>>> + * and round to closest integer. Result is undefined for negative
>>> + * divisors if the dividend variable type is unsigned and for negative
>>> + * dividends if the divisor variable type is unsigned.
>>> + */
>>> +#define __KERNEL_DIV_ROUND_CLOSEST(x, divisor)(		\
>>> +{							\
> 
> Use ({ on this line together...
> 
>>> +	__typeof__(x) __x = x;				\
>>> +	__typeof__(divisor) __d = divisor;		\
> 
> + blank line here.
> 
>>> +	(((__typeof__(x))-1) > 0 ||			\
>>> +	 ((__typeof__(divisor))-1) > 0 ||		\
>>> +	 (((__x) > 0) == ((__d) > 0))) ?		\
>>> +		(((__x) + ((__d) / 2)) / (__d)) :	\
>>> +		(((__x) - ((__d) / 2)) / (__d));	\
>>> +}							\
>>> +)
> 
> ...as here join }) to be a single line.
> 
> + blank line.
> 
>>>  #endif /* _UAPI_LINUX_CONST_H */


Thanks for the review! I've addressed all your comments (hopefully) in v6:

https://lore.kernel.org/all/20260129-rk3588-bgcolor-v6-0-c15f755a4055@collabora.com/

Regards,
Cristian

