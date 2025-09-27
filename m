Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFB8BA5F43
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 14:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0990610E1A2;
	Sat, 27 Sep 2025 12:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="ejSxJN//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649E410E1A7
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 12:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1758977341; x=1759582141; i=markus.elfring@web.de;
 bh=87/zf4TpCFHQQD1/92ZIRgUFLZFNJ1HpOYFg0a/pAIo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ejSxJN//QBlIfOs8TecRxsfmnBrHdkuVVYcfncf07mWx4zExCgsV6AfpbiWzpqmb
 9czhAwztiwqTnRKbXnTMy9JdGEf2Nynd5ufQtvEocU2vJm3o6ZXCAT74mKXKsOCCf
 KMSMjPYMTkjDcJQorRyBeHdEXRoqovGX8zztl9dJZ2XqcNbB7bU7/93Axj9rdlVDY
 3xbvGSGOit4nAxd3Tgb7CwXahuTZ1GJyr3D4MSqdo2P5dtRcIyjNFkrLsOc9PRFOl
 dBl/dN64orFOZ7c0qjtb44mhCvCATfFJvaKpJYLnBL3g+TpImMuAfEfehb0ARSms9
 7xHwlTUm/VUpwPNDPg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.221]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnX1L-1uac611IxR-00ePZI; Sat, 27
 Sep 2025 14:43:20 +0200
Message-ID: <f0b0a007-599b-428b-bea6-5eafc567d757@web.de>
Date: Sat, 27 Sep 2025 14:43:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: make24@iscas.ac.cn, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250927094741.9257-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] drm/tegra: dc: fix reference leak in tegra_dc_couple()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250927094741.9257-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ocAKYcb1yjBwr7/isPr/RbWCbM5s1oflK85ldKkHNuTjbFghT+5
 M6ZxPS29hc83FgVTCGzn/dR03X+XB6KdB5TtKM1PX1Ua4H8Ac4wvkmEr9bqSHFgah0DOEzZ
 3+0WBeNSpz7XmElxq8JuutUSBzCeCf+WxdgJZGdPgrWbVhwocoWV7tiWT31ioZM+R3TUHfz
 ZAj9+R6JBga9o/2StczDQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UHzl5zfjph4=;XGSpOtAQ0m5/Uth7o9clB/iLQdh
 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
 wrMBkKIEV/
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

> driver_find_device() calls get_device() to increment the reference
> count once a matching device is found, but there is no put_device() to
> balance the reference count. To avoid reference count leakage, add
> put_device() to decrease the reference count.

How do you think about to increase the application of scope-based resource management?
https://elixir.bootlin.com/linux/v6.17-rc7/source/include/linux/device.h#L1180

Regards,
Markus
