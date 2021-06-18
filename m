Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507C83AC2E2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 07:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091AC6E857;
	Fri, 18 Jun 2021 05:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC626E857
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 05:40:49 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 43E6780563;
 Fri, 18 Jun 2021 07:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623994846;
 bh=uNXPIXPD8fqjMp54pQS8vQeSgs5ZSHX/0gwovObOC0E=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=soYQdyUYvzgSM4U5r9XFh4FEnd1GrO9vEHbdox17WFLfCvG82LXhiN5WEd579t8fw
 6U7DAWBWP4GITzRSBvB0gdoTYr55vQQGRu4HK5JVBUxQdFk+jEvsvbzjbCb0ewTnza
 Ks+m7VgZwyJ0Kc+gmf5D/znMnrrN+5255RJ83pHASG3ziL8hy40mss7ZDbt1h+4fDl
 QHZMI21mwoEvOc74PN5LLxj4OhboQrEpiBccE4XRtwQIlscdmR2MQH2FFYaY9gNqa0
 zZ9YLScdE0W98E+ts0qxZiINVmf4U1IWCBDVuDhl0PNlntPFFpNRfWoSfsRDf15Gy5
 KEyNmO+45tUsQ==
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Fix null pointer dereference in
 remove callback
To: Jonathan Liu <net147@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210617111925.162120-1-net147@gmail.com>
 <YMtYoaSIIRhb85fh@pendragon.ideasonboard.com>
 <CANwerB0J9xKj3kjYPjzfeDvKV8JXPcDtoZaLMzkudCBz8=ZnVw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <d708823a-3b28-2541-da06-86eb41484aaa@denx.de>
Date: Fri, 18 Jun 2021 07:40:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANwerB0J9xKj3kjYPjzfeDvKV8JXPcDtoZaLMzkudCBz8=ZnVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/18/21 5:06 AM, Jonathan Liu wrote:
> Hi Marek,

Hi,

>> Hi Jonathan,
>>
>> Thank you for the patch.
>>
>> On Thu, Jun 17, 2021 at 09:19:25PM +1000, Jonathan Liu wrote:
>>> If attach has not been called, unloading the driver can result in a null
>>> pointer dereference in mipi_dsi_detach as ctx->dsi has not been assigned
>>> yet.
>>
>> Shouldn't this be done in a brige .detach() operation instead ?
>>
> 
> Could you please take a look?
> I don't have a working setup to test moving the code to detach.

I just replied to your other email regarding bringing the chip up, so 
please bring your setup up first, then test this patch again, and then 
let's revisit this topic.
