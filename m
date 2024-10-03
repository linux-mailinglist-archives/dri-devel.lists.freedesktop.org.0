Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBC898F603
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 20:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CC510E8DD;
	Thu,  3 Oct 2024 18:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="L/kKNvS+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58C510E8DD
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 18:28:07 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AE46F88B2D;
 Thu,  3 Oct 2024 20:28:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727980086;
 bh=ax+YSfah25tyK/JjghkM5D3PN+FaQ2LN7+9fpgbGOp4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L/kKNvS+4yCK56luGT+lyUPbt8ghACjmSn8WmyyBeD/LikXk1ZtQ0L4jLLH4m5Fl+
 q+z1GViYqHhpg9bIEnOxow66wUfAFaXoKngolI18tIbkbn5vSMuBXysdSDWjRcm6eC
 +pGBUyCgjoCzlXwzkdv4tcbVbRqdvC4Z1oDIgFaEIHm5g2kGL/GnRPO5Fkr4GRt87K
 RXjEmrxi3I/kj3h2OLheR6Uc7HtIlqxeStHT76Vo5rYLGPf8ReHRlBdlC65bkJswT8
 ZkyNtVgEZ+oamxlQwh6BZm5wJKA1/ljXc4h2xXjx28AczgIuD3MYu2mP1ljnYf/hiD
 ktZ5p28RnV2gg==
Message-ID: <0da39b8f-4cca-438f-9a39-40da7c34c895@denx.de>
Date: Thu, 3 Oct 2024 16:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
 <85a5a42667e5867bc45da31baf045d4c9557f5f1.camel@ndufresne.ca>
 <6b45e30c-b215-4f7a-91a4-fde05d78f737@denx.de>
 <b1c5fb155c77355ef2889b6e054a5c0696481ebd.camel@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <b1c5fb155c77355ef2889b6e054a5c0696481ebd.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/26/24 1:16 PM, Philipp Zabel wrote:
> On Mi, 2024-09-25 at 22:45 +0200, Marek Vasut wrote:
> [...]
>>> The driver is not taking ownership of prev_buf, only curr_buf is guaranteed to
>>> exist until v4l2_m2m_job_finish() is called. Usespace could streamoff, allocate
>>> new buffers, and then an old freed buffer may endup being used.
>>
>> So, what should I do about this ? Is there some way to ref the buffer to
>> keep it around ?
> 
> Have a look how other deinterlacers with temporal filtering do it.
> sunxi/sun8i-di or ti/vpe look like candidates.
I don't see exactly what those drivers are doing differently to protect 
the prev buffer during deinterlacing . Can you be more specific ?
