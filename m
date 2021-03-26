Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC37934A1D8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 07:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2596EEAF;
	Fri, 26 Mar 2021 06:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net
 [194.109.24.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701FC6EEAF
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 06:31:14 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id Pfzxl3I8G43ycPg00l2ucD; Fri, 26 Mar 2021 07:31:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1616740272; bh=R1hiTxSsY33hBqt0QOv8qGBmYr+RRqH/Ddp46Jxw38A=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=Y614AKAlfwI0rAfxKL2vepoXHdNckmPBRjZ8LL+EGvI+T+/TWJRBFm3kxAN5jeHBx
 QOjy6Tb6L9nNnDnbXhCZgvO8k+PyKRhLifFrwbhzCDnVdVO9Gz0Sw+erk/AN1FtonC
 6ahHbvzaJwSLd6FGI4yTqY1v/LL4w4qPQeMQ2yCjulNamoJtSpRDKwRndlu72S8Z5y
 S055sE++vjkYPX/lFdsxQYMFc+Xx3QW82V8Uly7pwoxydefsuwpKuUO2PJQ45PLiCG
 QEtoGlzBOE/44dJd8dI2y+Egjw17XMY5BmypCaBSbLKbQwt2fPVeV6XHE/ZW8Zk4/+
 HHqtiFv3NG2og==
Subject: Re: [PATCH] drm/bridge: adv7511: fix support for large EDIDs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <904185be-19ea-a321-a227-d4e659fe1b68@xs4all.nl>
 <YF0yIDWC+7HtMBLb@pendragon.ideasonboard.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <712f7355-482c-b8e3-701b-5a19774aeb5c@xs4all.nl>
Date: Fri, 26 Mar 2021 07:31:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YF0yIDWC+7HtMBLb@pendragon.ideasonboard.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfP/ltafrvKSMFa/Iew3JApzfLmDiMf3NaSS4MRYCq1uHtQ48vNL9JrJZloqXbYNnHtzngi3aw4OgHdO2/icBB0OvOPcXWj8nPMJZkdVF9fdOlufxKZXJ
 ZWKQmSlLF/qU0QuMqAgInqnukGgzGdWDrcbg2EZlN1+FNpyMZQEUP7w2lTx1MWzDPNBxMZaFsCpfeiIyKQPH2r9DhIrKvMD+3QOQEn0mJSLMi+RNE6TsJH+J
 EurM06hJC+uOnl62i9BUkATVS89BUUD/fGQEWRQnoXJMx+Px9kBrE2k2QiUp+eHposeU52RftAHkdSNN7qQReAX7g1SgTbJ23LP4NZOOG9jXuRT38jH3vZeu
 EMcOcuGjBXJ5xOZScatqnoPwkbqiBA==
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
Cc: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
 Archit Taneja <architt@codeaurora.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/03/2021 02:00, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Wed, Mar 24, 2021 at 09:53:32AM +0100, Hans Verkuil wrote:
>> While testing support for large (> 256 bytes) EDIDs on the Renesas
>> Koelsch board I noticed that the adv7511 bridge driver only read the
>> first two blocks.
>>
>> The media V4L2 version for the adv7511 (drivers/media/i2c/adv7511-v4l2.c)
>> handled this correctly.
>>
>> Besides a simple bug when setting the segment register (it was set to the
>> block number instead of block / 2), the logic of the code was also weird.
>> In particular reading the DDC_STATUS is odd: this is unrelated to EDID
>> reading.
> 
> Bits 3:0 of DDC_STATUS report the DDC controller state, which can be
> used to wait until the DDC controller is idle (it reports, among other
> possible states, if an EDID read is in progress). Other options are
> possible of course, including waiting for ADV7511_INT0_EDID_READY as
> done in adv7511_wait_for_edid(), but I wonder if the !irq case in
> adv7511_wait_for_edid() wouldn't be better of busy-looping on the DDC
> status instead of running the interrupt handler manually. That's
> unrelated to this patch though.

The DDC status tests for other things as well, including HDCP.

I think it is pure luck that this code even worked:

        if (adv7511->current_edid_segment != block / 2) {
                unsigned int status;

                ret = regmap_read(adv7511->regmap, ADV7511_REG_DDC_STATUS,
                                  &status);
                if (ret < 0)
                        return ret;

                if (status != 2) {
                        adv7511->edid_read = false;
                        regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
                                     block);
                        ret = adv7511_wait_for_edid(adv7511, 200);
                        if (ret < 0)
                                return ret;
                }

What happens on power on is that the adv7511 starts reading the EDID.
So the DDC_STATUS is 1 (Reading EDID). This code is called, it falls
in the status != 2 block, it writes the EDID_SEGMENT with 0 (it already
is 0 after a power on), then waits for the EDID read to finish.

The only reason this works is that this code is called fast enough
after the device is powered on that it is still reading the EDID.

It fails if you want to read the next segment, since in that case the
status is 2 (IDLE) and it will never write the new segment to the
EDID_SEGMENT register.

And besides, status wasn't ANDed with 0xf either, and HDCP might
also be ongoing (should that be enabled in the future).

Regards,

	Hans
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
