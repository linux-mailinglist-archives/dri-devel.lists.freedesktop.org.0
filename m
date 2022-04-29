Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB995156BE
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 23:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1960410FAC4;
	Fri, 29 Apr 2022 21:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F53E10FAC4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 21:21:57 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B6D1483C5E;
 Fri, 29 Apr 2022 23:21:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651267315;
 bh=d7QGIUWtabMQ8mr/wqIBGKKjIjQBYuO+QeYfvFF0Nys=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j6zCSBseIEUaEfYGaq0QWHaEse/h7TGEc23XEyyIoObVu4mHzWTTHZjrKY7VB/9BN
 LhMRWdFafn/v5873YGcwPNr5GYuqlNFglP4G53MaXN/mcOOvclizgYDgZSo4FscAfa
 pIN0nPGuhvZuwBoe30SICxCD2+dqkcVr0qfc/MMqkV4MpqAucZMdTrRsciKb4L0pxI
 kOUT2/E8ycgYh95qp/MnR0zZkGEKvSGnRIs9x6XXmQPAGS6M7VvMecd62tnvVns7P+
 BCG4RrV+2cF/GqomFUZBWq6gDAJgsKhaLb0BzZwBQy+npSYy48fi21j0g0Lex07XQd
 ubn14+wUjZhvQ==
Message-ID: <e17c8c20-1c85-60f9-ed75-ac5d18f197db@denx.de>
Date: Fri, 29 Apr 2022 23:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] drm: mxsfb: Implement LCDIF scanout CRC32 support
Content-Language: en-US
To: Stefan Agner <stefan@agner.ch>
References: <20220411203531.774958-1-marex@denx.de>
 <efa4cf7bc24ed9b217f1bbaff9b652d4@agner.ch>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <efa4cf7bc24ed9b217f1bbaff9b652d4@agner.ch>
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Robby Cai <robby.cai@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/29/22 16:08, Stefan Agner wrote:
> On 2022-04-11 22:35, Marek Vasut wrote:
>> The LCDIF controller as present in i.MX28/i.MX6SX/i.MX8M Mini/Nano has
>> CRC_STAT register, which contains CRC32 of the frame as it was clocked
>> out of the DPI interface of the LCDIF. This is most likely meant as a
>> functional safety feature.
>>
>> Unfortunately, there is zero documentation on how the CRC32 is calculated,
>> there is no documentation of the polynomial, the init value, nor on which
>> data is the checksum applied.
>>
>> By applying brute-force on 8 pixel / 2 line frame, which is the minimum
>> size LCDIF would work with, it turns out the polynomial is CRC32_POLY_LE
>> 0xedb88320 , init value is 0xffffffff , the input data are bitrev32()
>> of the entire frame and the resulting CRC has to be also bitrev32()ed.
>>
>> Doing this calculation in kernel for each frame is unrealistic due to the
>> CPU demand, so attach the CRC collected from hardware to a frame instead.
>> The DRM subsystem already has an interface for this purpose and the CRC
>> can be accessed e.g. via debugfs:
>> "
>> $ echo auto > /sys/kernel/debug/dri/1/crtc-0/crc/control
>> $ cat /sys/kernel/debug/dri/1/crtc-0/crc/data
>> 0x0000408c 0xa4e5cdd8
>> 0x0000408d 0x72f537b4
>> "
>> The per-frame CRC can be used by userspace e.g. during automated testing,
>> to verify that whatever buffer was sent to be scanned out was actually
>> scanned out of the LCDIF correctly.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Robby Cai <robby.cai@nxp.com>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Stefan Agner <stefan@agner.ch>
>> ---
>> V2: Check crtc for non-NULL before dereferencing it in mxsfb_crtc_set_crc_source
>> ---
>>   drivers/gpu/drm/mxsfb/mxsfb_drv.c  | 15 +++++++-
>>   drivers/gpu/drm/mxsfb/mxsfb_drv.h  |  3 ++
>>   drivers/gpu/drm/mxsfb/mxsfb_kms.c  | 61 ++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/mxsfb/mxsfb_regs.h |  1 +
>>   4 files changed, 75 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> index 94cafff7f68d5..ccf4107476ecc 100644
>> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> @@ -9,6 +9,7 @@
>>    */
>>   
>>   #include <linux/clk.h>
>> +#include <linux/crc32.h>
> 
> Doesn't look like this is used?

Doh, testing remnant, dropped, thanks.
