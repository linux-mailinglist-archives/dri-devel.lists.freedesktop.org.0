Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BDBB42050
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 15:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CB410E877;
	Wed,  3 Sep 2025 13:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qu4mmDCD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDF710E864
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 13:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756904745;
 bh=65Cy4eE/Dbap4x4XSMPP5MYg4UIWlMJAYB2KAsuUEOM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qu4mmDCDhFLO5+ELxckT0gE8rs6NIalQ//oyW76Y1Q12bEdUkmyxERmGtl3gd/5Cb
 ACWOJ8mwcL5RwYv04uIf4VWQx4M8gzjuUMg2xAu7cwent5z5hZHNyCcZJZjdXGZ6B5
 Glf7D3k2pwuXHnEPWq/avscUiPDC0ExrnhAsli3I/xv52eXqiBTCOJDcDdcT8JUmNX
 rWu6x3+kIPa0tfE1yG+4hAlLFHNeUQ5c/e8Eabcqnob+JSr+6zO9yVsUOEYVBX5vNy
 kAb06ow8nOgQFQ+kk2uAPy7wTkRZ7w+YmGZkVGNYPVt+JQRnZ+J5yXIcFCtB3jsrsc
 0Xv/mjVBORwdw==
Received: from [192.168.1.90] (unknown [82.79.138.60])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9FE5517E0FFA;
 Wed,  3 Sep 2025 15:05:44 +0200 (CEST)
Message-ID: <218de818-2063-432d-b61b-4537ea702cd6@collabora.com>
Date: Wed, 3 Sep 2025 16:05:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] drm/rockchip: inno-hdmi: Convert to drm bridge
To: Heiko Stuebner <heiko@sntech.de>, dmitry.baryshkov@oss.qualcomm.com,
 Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org, andrzej.hajda@intel.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, knaerzche@gmail.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
References: <20250903110825.776807-1-andyshrk@163.com>
 <20250903110825.776807-2-andyshrk@163.com> <5255838.1BCLMh4Saa@phil>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <5255838.1BCLMh4Saa@phil>
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

Hello Heiko,

On 9/3/25 2:59 PM, Heiko Stuebner wrote:
> Hi Andy,
> 
> Am Mittwoch, 3. September 2025, 13:07:38 Mitteleuropäische Sommerzeit schrieb Andy Yan:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> Convert it to drm bridge driver, it will be convenient for us to
>> migrate the connector part to the display driver later.
>>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> more like a general remark, this essentially conflicts with the
> big hiword-cleanup [0] that was merged today, as the inno-hdmi driver
> "lost" its separate HIWORD_UPDATE macro in favor a nicer generic one.
> 
> I'm not sure what the best way to proceed is, apart from waiting for
> 6.18-rc1.

This is actually what I also intended to ask you, as I'm in the process of
rebasing the HDMI CEC series on top of next-20250903.

Would it be possible to have an immutable branch of bitmap-for-next and get
it merged to drm-misc-next?

Regards,
Cristian
