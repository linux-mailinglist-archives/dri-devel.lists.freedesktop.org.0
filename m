Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9040B87079C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11E311235B;
	Mon,  4 Mar 2024 16:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="UpIyXMpM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4E111235C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:51:50 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4TpPqT273bzDqfp;
 Mon,  4 Mar 2024 16:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709571109; bh=DJTqJrjrHlAoRJqjQnntulfFZGXjgIOpKQ2L7DkN6ME=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=UpIyXMpMAo0OZLv5zfEBQRN/shiYM+8HOOF/FFxNrylzMc9PaSpuiy/rhccn76V2C
 /bRvSM1qAYSXEaXvPd4nViOZbzME28tEGhD10NaaOlnbraMPZAcVf69S9h+Ah2TabY
 QkXWqmJZPQL2YKb7HA5Di7EtDEOVQjIzIMc196Z8=
X-Riseup-User-ID: FA1D33366E1C79C3B9466C79853F08938AD91ED24D444E2BD1C545552ECD762E
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4TpPqN2XcdzJqTr;
 Mon,  4 Mar 2024 16:51:44 +0000 (UTC)
Message-ID: <a1de0c95-cb5f-456d-8831-684b4e5573db@riseup.net>
Date: Mon, 4 Mar 2024 13:51:42 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 6/9] drm/vkms: Add YUV support
Content-Language: en-US
To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-6-aa6be2827bb7@bootlin.com>
 <20240226141916.1627bbbd.pekka.paalanen@collabora.com>
 <Zd35c_CJbhY46TjQ@localhost.localdomain>
 <b23da076-0bfb-48b2-9386-383a6dec1868@riseup.net>
 <8fc07f0f-f14d-4878-9884-2bc4b4c6f426@riseup.net>
 <20240229141238.51891cad.pekka.paalanen@collabora.com>
 <ZeXoo4DJxlzhuK4W@localhost.localdomain>
 <fde6b1d5-56c9-43d0-9ccc-87683b700734@riseup.net>
 <ZeXtWAM1XDEhxWOM@localhost.localdomain>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <ZeXtWAM1XDEhxWOM@localhost.localdomain>
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



On 04/03/24 12:48, Louis Chauvet wrote:
> [...]
> 
>>> @arthur, I will submit a v4 with this:
>>> - matrix selection in plane_atomic_update (so it's selected only once)
>>> - s64 numbers for matrix
>>> - avoiding multiple loop implementation by switching matrix columns
>>
>> This looks good to me.
>>
>>>
>>> Regarding the YUV part, I don't feel confortable adressing Pekka's 
>>> comments, would you mind doing it?
>>
>> I'm already doing that, how do you want me to send those changes? I reply to
>> your series, like a did before?
> 
> Yes, simply reply to my series, so I can rebase everything on the 
> line-by-line work.

OK, I will do that.

Best Regards,
~Arthur Grillo

> Kind regards,
> Louis Chauvet
> 
>> Best Regards,
>> ~Arthur Grillo
>>
>>>
>>> Kind regards,
>>> Louis Chauvet
>>>
>>> [...]
>>>
> 
