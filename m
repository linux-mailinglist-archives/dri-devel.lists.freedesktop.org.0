Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382D94C608A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 02:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CAD10E1CB;
	Mon, 28 Feb 2022 01:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAB810E1CB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 01:01:59 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2E517838FD;
 Mon, 28 Feb 2022 02:01:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646010118;
 bh=c0m+q88sKAxtVxEpS2U+uXN/U0f1AeOxQLwgym4juXQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=p8RiIv+sQiSrZYi77Zjwf2CFSBd2Z46IkFoUTY25gyao0wo3cC8MN5QTwMCkn7bkH
 mCFHVXBi8wRjOQEP5vNouuRyy+AJ72IUBsXalcLdikgw5kwAXdujvqx+bNIZqcsmhO
 +eRB4SP2bVO/QYcxvFhpAgf5CpiPahkC4cybh74Kr3g0m4ThZ8FLALFJ7D0me18Ep1
 JcZaPYSM1BbDaTmOY7TxqPUdtfZoK83n0HEhuR5ivCDox4X3wJ7IWBvFaocGIbNkNd
 HTEhkB0MRf3i1Fh7F40CMaRprFALQbivuVkoW9VIMOfx6IVHhjdxuoFqnOv+VieRz7
 99xnUKSWWe0mA==
Message-ID: <1ccd5cad-4751-ca89-3c26-bbefb651ee30@denx.de>
Date: Mon, 28 Feb 2022 02:01:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] drm/panel: simple: Fix Innolux G070Y2-L01 BPP settings
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220220040718.532866-1-marex@denx.de>
 <YhHI8OjUfKb2lDng@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YhHI8OjUfKb2lDng@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Christoph Fritz <chf.fritz@googlemail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/20/22 05:52, Laurent Pinchart wrote:
> Hi Marek,
> 
> Thank you for the patch.
> 
> On Sun, Feb 20, 2022 at 05:07:18AM +0100, Marek Vasut wrote:
>> The Innolux G070Y2-L01 supports two modes of operation:
>> 1) FRC=Low/NC ... MEDIA_BUS_FMT_RGB666_1X7X3_SPWG ... BPP=6
>> 2) FRC=High ..... MEDIA_BUS_FMT_RGB888_1X7X4_SPWG ... BPP=8
>>
>> Currently the panel description mixes both, BPP from 1) and bus
>> format from 2), which triggers a warning at panel-simple.c:615.
>>
>> Pick the later, set bpp=8, fix the warning.
>>
>> Fixes: a5d2ade627dca ("drm/panel: simple: Add support for Innolux G070Y2-L01")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Christoph Fritz <chf.fritz@googlemail.com>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Maxime Ripard <maxime@cerno.tech>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied to drm-misc-next-fixes
