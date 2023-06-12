Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6352572BCCD
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 11:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609B510E1E5;
	Mon, 12 Jun 2023 09:36:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D0C10E1E5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 09:36:08 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 97BB981D65;
 Mon, 12 Jun 2023 11:36:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1686562564;
 bh=npmPTLS+n6e1lDvCz3f3orfjwxuNk2wlQDmUPptyhR4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VOsmJsdhzJ5ZdrTltg9anzFT/fmY00SBlPVC4T7GiswDNtwnI4T+COiO/ltdVMGA+
 VlaKRevhZKQp5N2lBsUqTFg9WwFPbII+0aIHqnsQqoM89M/8B7wS+fNT9DOVLf+sv9
 +gQYRxAaq11r/t3mdkd+gy0LFyy2SvqYyF6cM/QIYrP74DZvcVvs8YpW+uG41nlWe2
 ugw10HUBTA0MSiFgDhbavtKh2Mst7uWdY2sMusrSKzpL+K5q7lvia34JZdrkqVTtvI
 hzx8LSVNwuExLKysi5VVZraTgSw5TuOj+KeTkhn1pQ5FzALJYFIRJ5eHFQ8Ms5JJc0
 6ncp8xI3wHL1g==
Message-ID: <92060edb-97c2-c79e-6ae6-51caffd768ca@denx.de>
Date: Mon, 12 Jun 2023 11:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/mxsfb: Disable overlay plane in
 mxsfb_plane_overlay_atomic_disable()
Content-Language: en-US
To: Ying Liu <gnuiyl@gmail.com>
References: <20230612075530.681869-1-victor.liu@nxp.com>
 <c11788bb-9974-3fb9-7cac-db7d55cfde9e@denx.de>
 <CAOcKUNUh7itiVKgiXuL6TqEo9uFm2xSNh7k+b+0QoD-MuifaUw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAOcKUNUh7itiVKgiXuL6TqEo9uFm2xSNh7k+b+0QoD-MuifaUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Liu Ying <victor.liu@nxp.com>, shawnguo@kernel.org, s.hauer@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@pengutronix.de,
 sam@ravnborg.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/12/23 11:15, Ying Liu wrote:
> On Mon, Jun 12, 2023 at 5:06 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 6/12/23 09:55, Liu Ying wrote:
>>> When disabling overlay plane in mxsfb_plane_overlay_atomic_update(),
>>> overlay plane's framebuffer pointer is NULL.  So, dereferencing it would
>>> cause a kernel Oops(NULL pointer dereferencing).  Fix the issue by
>>> disabling overlay plane in mxsfb_plane_overlay_atomic_disable() instead.
>>>
>>> Fixes: cb285a5348e7 ("drm: mxsfb: Replace mxsfb_get_fb_paddr() with drm_fb_cma_get_gem_addr()")
>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>
>> Should this be Cc: stable too ?
> 
> Ok, will explicitly Cc: stable.  Thanks.

Add

Reviewed-by: Marek Vasut <marex@denx.de>

And also, wait a little bit for RB from others.

Thanks !
