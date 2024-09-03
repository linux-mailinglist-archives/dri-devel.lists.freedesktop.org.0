Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F67B96995A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 11:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626A110E44E;
	Tue,  3 Sep 2024 09:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="jc8bRgxV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED4710E44E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 09:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1725356414; x=1725961214; i=markus.elfring@web.de;
 bh=lbfwtFUUUQEa7RKRIipVXPdfzZzi/w41he9XMp87RSQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=jc8bRgxVnO+hRbFNONQ+Gle2zPRAJaZ9E8VnhO7onTUGt4tLtGsfJyTFIAosRW9K
 fsTdyGxPyCr8GvNSc9l0D03NNbyswvNWS2NZW4g/PVwXI4nM8Gx5pfXJLwZHibSoS
 9GbKGFbqeb+VP0J4mFArOgRQ0HZQpwYJlagx94JHFxJ1aCIkP12hba3fAiekMQ1S9
 QTWUf5OvehfchQp1UXq6wcifvKvxHNVY0nNw8mNmg0QcWpmYNHiGgaaIjpGjWHpIy
 h5APyOfrrDiUFSdUEfFL1hHj4WLRfRyLGK91hB+pQUvKrCPbHO6xseEtFkrpqcgd6
 fEmrqbYVhSdS0TuFkg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MOlwj-1sQ9hZ2WGF-00TKth; Tue, 03
 Sep 2024 11:40:14 +0200
Message-ID: <95f07e5b-72c4-442c-b58e-25c407389243@web.de>
Date: Tue, 3 Sep 2024 11:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] drm/imagination: Use memdup_user() helper
To: Matt Coster <Matt.Coster@imgtec.com>, dri-devel@lists.freedesktop.org
Cc: Donald Robson <donald.robson@imgtec.com>,
 Frank Binns <Frank.Binns@imgtec.com>, Sarah Walker
 <sarah.walker@imgtec.com>, Christophe Jaillet
 <christophe.jaillet@wanadoo.fr>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <ea4ec650-d858-42c2-ab59-e17824069ba9@imgtec.com>
 <8d30da7f-7a12-4052-b846-66fad0ccb392@web.de>
 <cc1a5b72-2349-4b7b-b233-1a1b90556d71@imgtec.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <cc1a5b72-2349-4b7b-b233-1a1b90556d71@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kYjjDNcb9SSj1h4+Mz2o8aEKK3JGWzSQezmAzIKDl/cfDfCGTxz
 LAFz8WsXStLaZvw/ztZym00sDpprLKz1uWa4rc0OPsggwoz1gsDPSgRtgxBLidOIfB21nWy
 MY+g4UEtQ20YdrGGl6WvnIm7USeyWhDgMgb0Pq34Rwpf4URatP60t+zQAkJQvW2/a8vzw/G
 Qfh9Hd0z8RV2sWM7WDFlQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1qJKy6keiWE=;k7cqz0hdvaJNcoGxY21u3lX3xbU
 P6XdqaqU9vFKc7GBsi3OVIVLT0jzihjQmJwRZgJp1xzU8slXnwCrFJAqFijQSUQgQdmGFuHTR
 8s2KCX8C8FkcY4LhUr1O0nU7Yb9apQyFTHG9EqLhBdfmoVoA5n5fjgd2QO2OiwSePysIr8nOh
 droIHvmyl89Q7BhyV7F7/HvexeIp4L+eML7TR/3VTehPr3IFR0w7yw4kfEGRNW1f+P4C+A094
 xVPZFi8j3O2dl1Y8cxxAE6HTTSFERZ6+ASs+YlPMuJTpToSEHet54KCepebKTlxDGG6FH/cIf
 X8fkeNageXI7Q/PEKyLbYOIqD6GY3TQNMsxnCHJ0g7E7RILTyW52p1sFySrEaT7cvHyO1cWq+
 HDaUSaYZr9tD+RxLg2Y1qYAjIHzQPKWL6RzyK70MkWaSPVObohpL+FITn6C0zKNq1BKfubXXZ
 pi7N278AS0iqRuo1tlv4ekT8CjTABOBepGTiGIIJFA9o2lrSAEJPW/BfgJd0SIdd6n4CSh0W1
 CWzdwYCROyykDQ7g4mmrajtHqLddCxVnZrOYH5p7GT4no/dDai/2tHGujbPi4l5ZU+28AZ/X9
 6+5Y1jSVuFNI93Wwabb4oHEby/Y6oic5iV4ilZ8NuG1JZWcYIMWrwtoCYM4IJ0n2gFhtWwQCX
 VKEJpCFP+qx06ZZqgUNyVlcNtiJF+3w62QM+vd7sOJC+SJvpQ2MrVQ/SLCPiPC1PeS50w09rS
 gKK/B6v9AB+rKPbPRHF7mAZ8VQKVlPwlfJLzBKXZiMctyTwOBvxIfNeVauH7p8ZHUql58hh6v
 tzsSV3AcIB6Z2tqDssQsKRjw==
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

>>>> Switching to memdup_user(), which combines kmalloc() and copy_from_us=
er(),
>>>> and it can simplfy code.

By the way:
Would it have been nicer to avoid a typo anyhow in such a change descripti=
on?


>>> Applied, thanks!
>>>
>>> [1/1] drm/imagination: Use memdup_user() helper
>>>       commit: 2872a57c7ad427d428c6d12e95e55b32bdc8e3b8
>>
>> Do you find any previous contributions still similarly interesting?
>>
>> Example:
>> [PATCH] drm/imagination: Use memdup_user() rather than duplicating its =
implementation
>> https://lore.kernel.org/r/c07221ed-8eaf-490e-9672-033b1cfe7b6e@web.de
>> https://lkml.org/lkml/2024/1/28/438
>
> Hi Markus,
>
> I apologise for missing your earlier email.

How could this happen?


> In general, we'll happily accept cleanup patches.
>
> If you feel like your patch has gone ignored in future,

It seems that some of my development ideas occasionally trigger special co=
mmunication challenges.


> please feel free to ping me directly either by email or on IRC at MTCost=
er.

Will the attention really grow accordingly?

Regards,
Markus
