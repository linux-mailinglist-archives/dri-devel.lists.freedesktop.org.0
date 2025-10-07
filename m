Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF7CBC19F9
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 16:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976EA10E69A;
	Tue,  7 Oct 2025 14:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dz8Uq/Z4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309A110E69A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 14:03:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C61041A11B1;
 Tue,  7 Oct 2025 14:03:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 981D1606C8;
 Tue,  7 Oct 2025 14:03:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A6836102F214F; 
 Tue,  7 Oct 2025 16:02:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759845790; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=WSi/XXu9M7yK9fXAosnzu7bOzMYxwvxWn1n9XpuR2TI=;
 b=dz8Uq/Z4RT1Q24psyJ+UYiqxP6P7O7iYVkn0rWcGNH1An7qnWq8bUTZI81YQ9PUZgZbugT
 6n0zCKB1oy+oP6bBEoznuSj40VWNVdNBVNEoZtKGCPtrIlwrEzy8sSnCNQf4gBkhpSvolX
 jGzLYCJfH8nyXS3JXvPj68CsekeNbY80o1UkGASYQHa2w3ANAAoFG9fLAsub05y8RgG1Iy
 GndbDWYRZpjDW4TVeFiL7E6kpqigcruvuL2RyzdJCIlNwCk/nl+3W9JtPc0sCC0QfyXFLz
 fSi2qqZ0w+jq2YkCTYcfXLkzjZ/thlagQSjJPM0OD2mUVrDHGGw4MZb24TUAlA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 16:02:47 +0200
Message-Id: <DDC59CH6JUWR.GRJ77V41K2DC@bootlin.com>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/7] drm/encoder: add mutex to protect the bridge chain
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.1
References: <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-0-78bf61580a06@bootlin.com>
 <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-1-78bf61580a06@bootlin.com>
 <2ksmq6ytj3zabxuexzjuqovalik6memy33vrba2aihfld7b7so@lhqhmaargucp>
 <DDBZS1BBBKSN.ZHCLP3O5T1HI@bootlin.com>
In-Reply-To: <DDBZS1BBBKSN.ZHCLP3O5T1HI@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Dmitry,

On Tue Oct 7, 2025 at 11:45 AM CEST, Luca Ceresoli wrote:
> Hi Dmitry,
>
> On Sat Oct 4, 2025 at 11:47 AM CEST, Dmitry Baryshkov wrote:
>
>>> @@ -319,6 +323,41 @@ static inline struct drm_encoder *drm_encoder_find=
(struct drm_device *dev,
>>>  	return mo ? obj_to_encoder(mo) : NULL;
>>>  }
>>> =20
>>> +/**
>>> + * drm_encoder_chain_lock - lock the encoder bridge chain
>>> + * @encoder: encoder whose bridge chain must be locked
>>> + *
>>> + * Locks the mutex protecting the bridge chain from concurrent access.
>>> + * To be called by code modifying ot iterating over the bridge chain t=
o
>>> + * prevent the list from changing while iterating over it.
>>> + * Call drm_encoder_chain_unlock() when done to unlock the mutex.
>>> + *
>>> + * Returns:
>>> + * Pointer to @encoder. Useful to lock the chain and then operate on t=
he
>>> + * in the same statement, e.g.:
>>> + * list_first_entry_or_null(&drm_encoder_chain_lock(encoder)->bridge_c=
hain)
>>> + */
>>> +static inline struct drm_encoder *drm_encoder_chain_lock(struct drm_en=
coder *encoder)
>>
>> What is the use case for these wrappers? I'm asking especially since
>> you almost never use the return value of the _lock() one. I think with
>> scoped_guard you can get the same kind of code without needing extra API
>> or extra wrappers.
>
> For two reasons.
>
> One is to avoid drm_encoder users to need to access internal fields
> (encapsulation, in object-oriented jargon). But if I read correctly betwe=
en
> the lines of your question, it is not worth because drm_bridge and
> drm_encoder are already interdependent?
>
> The second is that the C language spec sets tight constraints to the
> drm_for_each_bridge_in_chain_scoped(). The macro must look like:
>
>   #define drm_for_each_bridge_in_chain_scoped(encoder, bridge) \
>           for (struct drm_bridge *bridge =3D <FOO>; clause-2; clause-3)
> 	       '----------- clause-1 ----------'
>
> clause-1 must:
>
>  * declare a 'struct drm_bridge *' variable (the loop cursor)
>  * initialize it via <FOO> which thus must be a rvalue of type
>    'struct drm_bridge *' (<FOO> must be a function or a macro, as a
>    variable with the correct value is not available)
>  * use the struct drm_encoder * as its sole input
>  * lock the encoder chain mutex
>  * get a reference to the bridge (as Maxime requested)
>  * ensure the bridge reference is put and the mutex is released on break
>    and return (clause-3 can't do that)
>
> Given the above, we still need a function that locks the encoder chain
> mutex and returns the encoder (bullets 3 and 4), like
> drm_encoder_chain_lock(). I'm OK with removing drm_encoder_chain_lock() a=
nd
> replace it with an internal macro or function in drm_bridge.h though.
>
> However I'm not sure how to use scoped_guard here because it doesn't retu=
rn
> a pointer that can then be passed further. Basically we are constrained t=
o
> have a chain of function or macro calls, each eating the result of the
> inner one, with the outer one returning a bridge pointer for the loop
> cursor variable. There might be some macro magic I'm missing, in such cas=
e
> don't hesitate to mention that.

I realized I was not fully clear, sorry about that. The inability to use
scoped_guard refers to the drm_for_each_bridge_in_chain_scoped()
implementation, being a macro defining a for loop. However scoped_guard can
be used in normal locking code such as the changes in patches 3, 6 and 7.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

