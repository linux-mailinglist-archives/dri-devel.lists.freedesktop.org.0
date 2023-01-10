Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8372663E4B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 11:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E57A10E00B;
	Tue, 10 Jan 2023 10:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A629010E00B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 10:33:12 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D527685301;
 Tue, 10 Jan 2023 11:33:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1673346790;
 bh=8VlGF7IKnoCyHF1lXm8cHOznyrI8m8FnuNfh4VPBaXw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=wUQNNmv1/3AFRNZzxtTl2dcM2/tb8h7qvsyJ5+XtbebneyExpQc5q+irf0YrqHyt9
 C2Cjp3norDfBOxuuG/qa2iIzQWHlNlAYkYkgDJKXk5vmFp5OX2Brd9Wx/KbZDcvBbd
 95e4T5LfZ/UhAuLhN3G8z0vMInJRGwNsKRIAUIv1s0YeNu73V7sGvqjngL/Kt0eG2L
 hCQRvgnss3VDu85kXiCMTGWpgwlgDwWxG1SacXKRw5J5Mdu7q9Yk4c9VdWKFgF6z5D
 XJLnFEKLE+52ng3DYWrV4CMVEQ24ZTodxdTqKYMFopoJr/jr9QV2p80Yuag3CT87AJ
 E3JBadql39mZw==
Message-ID: <a7e5a79f-e12a-cb17-faa6-0b7fc9f8d73d@denx.de>
Date: Tue, 10 Jan 2023 11:33:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/mxsfb: improve clk handling for axi clk
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20200720153254.18071-1-u.kleine-koenig@pengutronix.de>
 <b404a675-a186-1253-e8ad-762461526594@redhat.com>
 <b94b0717-db66-6ce0-5277-f3ce5b1d22d2@redhat.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <b94b0717-db66-6ce0-5277-f3ce5b1d22d2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: dri-devel@lists.freedesktop.org, Shawn Guo <shawnguo@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/10/23 11:06, Javier Martinez Canillas wrote:
> On 1/10/23 10:26, Javier Martinez Canillas wrote:
>> Hello Uwe,
>>
>> On 7/20/20 17:32, Uwe Kleine-König wrote:
>>> Ignoring errors from devm_clk_get() is wrong. To handle not all platforms
>>> having an axi clk use devm_clk_get_optional() instead and do proper error
>>> handling.
>>>
>>> Also the clk API handles NULL as a dummy clk (which is also returned by
>>> devm_clk_get_optional() if there is no clk) so there is no need to check
>>> for NULL before calling clk_prepare_enable() or its counter part.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>
>> Patch looks good to me.
>>
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>>
> 
> I've pushed this to drm-misc (dri-misc-next) now. Thanks!

Thanks, I admit, I missed the patch, sorry.

It does indeed look correct.

Reviewed-by: Marek Vasut <marex@denx.de>
