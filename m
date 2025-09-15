Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0CCB57FE9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 17:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B5110E4E8;
	Mon, 15 Sep 2025 15:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ixit.cz header.i=@ixit.cz header.b="HZ2HqCl8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1427310E4E8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 15:06:55 +0000 (UTC)
Received: from [10.0.0.200] (unknown [10.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id D8E9C5340DBB;
 Mon, 15 Sep 2025 17:06:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1757948811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XDN9Q6vcMrSkRqRQsxwlV3nZ1v/ELqmVYPjIhrEdl/U=;
 b=HZ2HqCl84MhhUQGou4TAtDCUHx2CiYntHiBRfeRDVUw0TLTI41T8YrSpMF6iPwz1yJC4cT
 V+C3uOWFkYsQVCpr+6844k+wSjlaafTV5vPGbaCMAl02I6wmQ8dO8RmXTqvRLxk7MRURE+
 QRiwf7/WvrDCw1lz9RVlks3NNYBRr5c=
Message-ID: <4a718ca8-cc40-4642-9f88-b654a90045cf@ixit.cz>
Date: Mon, 15 Sep 2025 17:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] drm: panel: nt36672a: Add support for novatek
 nt35596s panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Molly Sophia <mollysophia379@gmail.com>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>
References: <20250913-nt35596s-v6-0-b5deb05e04af@ixit.cz>
 <20250913-nt35596s-v6-2-b5deb05e04af@ixit.cz>
 <xi65tabv4sgblzmw52wxci5wsrdahshvos5we5wko4kfcfyozp@y3vw5gt3elwv>
 <ad1764a3-12b3-4c30-9b79-313d9c1d37eb@ixit.cz>
 <a5zz3piadpmi4atnnafa5bfz32da4nioob7xsmqtyhgpjpqz5c@zzoa72rgwaet>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <a5zz3piadpmi4atnnafa5bfz32da4nioob7xsmqtyhgpjpqz5c@zzoa72rgwaet>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 15/09/2025 13:11, Dmitry Baryshkov wrote:
> On Mon, Sep 15, 2025 at 12:11:49PM +0200, David Heidelberg wrote:
>> On 15/09/2025 03:29, Dmitry Baryshkov wrote:
>>> On Sat, Sep 13, 2025 at 09:19:48PM +0200, David Heidelberg via B4 Relay wrote:
>>>> From: Molly Sophia <mollysophia379@gmail.com>
>>>>
>>>> Novatek NT35596s is a generic DSI IC that drives command and video mode
>>>> panels.
>>>> Currently add support for the LCD panel from JDI connected with this IC,
>>>> as found on Xiaomi Mi Mix 2S phones.
>>>
>>> Why are you adding it to the existing driver rather than adding a new
>>> one?
>>
>> Hello, originally it started as a standalone driver (see v2 patchset), but
>> got merged due to similarities.
> 
> I'm not sure, you had to get rid of the two command sets. On the other
> hand, adding a new module will add a lot of boilerplate. Let's keep it
> as is. Please add some notes to the commit message.

Ok, I found out in the meantime that Alexey is working on refactoring 
nt36672a, so we’ll coordinate. I’ll likely need to rebase this changeset 
on top of the refactored nt36672a, or possibly move it into a separate 
driver.

See https://github.com/sdm660-mainline/linux/pull/114/commits

> 
>>
>> v2 patchset:
>> https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg404290.html
>>
>> If it's desired, I can switch it back to the standalone driver.
>>
>>>
>>>>
>>>> Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
>>>> Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
>>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>>> ---
>>>>    drivers/gpu/drm/panel/Kconfig                  |   7 +-
>>>>    drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 225 ++++++++++++++++++++++++-
>>>>    2 files changed, 222 insertions(+), 10 deletions(-)
>>>>
>>>>    MODULE_AUTHOR("Sumit Semwal <sumit.semwal@linaro.org>");
>>>> -MODULE_DESCRIPTION("NOVATEK NT36672A based MIPI-DSI LCD panel driver");
>>>> +MODULE_AUTHOR("Molly Sophia <mollysophia379@gmail.com>");
>>>
>>> ??
>>
>> What's wrong with it?
> 
> I thought that the module can have only one MODULE_AUTHOR declaration, I
> was wrong. This is fine.

Yeah, it's not usual to have more than one.

> 
>>
>> David
>>
>>>
>>>> +MODULE_DESCRIPTION("NOVATEK NT36672A/NT35596S based MIPI-DSI LCD panel driver");
>>>>    MODULE_LICENSE("GPL");
>>>>
>>>> -- 
>>>> 2.51.0
>>>>
>>>>
>>>
>>
>> -- 
>> David Heidelberg
>>
> 

-- 
David Heidelberg

