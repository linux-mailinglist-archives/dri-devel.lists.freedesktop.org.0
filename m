Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FC84281F5
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 16:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D986E084;
	Sun, 10 Oct 2021 14:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F966E084
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 14:38:31 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E9CFD83578;
 Sun, 10 Oct 2021 16:38:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1633876708;
 bh=1Bk/7tk5XgLAhKIZ3BvTSIzA5xRZuPnnbEWg5RgsFOk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XB/nRdeDYGnaMRUcW0TH7PRpWi8q3g/xbLu48MBrR11fY100HbZlfj6AphiYPeAG1
 CfNmYUzDsMjKgOc3+oWBrR/OZtdJNDSCdWHCQKyDaJKQ8DsREMpleTIiUrkSiyRGO3
 rI+hqyHtWrVawbcS3xMc8hf8xZ6iIxQpBI/6hVyUqsNI4NirGbWVpl/eY57e/NGbOT
 NJ0fn/U9NuPh1DCHYGQUtfaT+P1ZVmrjsESP3jbPfgOKmlT8qftBp5d1496Q4Taxek
 BfbUTVzeF9mo6N0u4Ejs4TczJY9S/g5dzY69LI0sstjEA0f3Ic97HoipvGOzUJnUuz
 PWMI5V/1jVuxg==
Subject: Re: [PATCH v5 2/2] drm/bridge: lvds-codec: Add support for LVDS data
 mapping select
To: Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
References: <20211009224152.427219-1-marex@denx.de>
 <20211009224152.427219-2-marex@denx.de> <YWKhVrqwANLHoc8H@ravnborg.org>
 <YWK/it9fu4yojFH5@pendragon.ideasonboard.com> <YWLcNkO72dk8Hnx7@ravnborg.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <39d42e3c-d9a5-f16f-9ccd-ba42899db4c1@denx.de>
Date: Sun, 10 Oct 2021 16:38:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWLcNkO72dk8Hnx7@ravnborg.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/21 2:27 PM, Sam Ravnborg wrote:

Hi,

[...]

>>>> +		if (!bus_node) {
>>>> +			dev_dbg(dev, "bus DT node not found\n");
>>>> +			return -ENXIO;
>>>> +		}
>>>> +
>>>> +		ret = of_property_read_string(bus_node, "data-mapping",
>>>> +					      &mapping);
>>>> +		of_node_put(bus_node);
>>>> +		if (ret < 0) {
>>>> +			dev_err(dev, "missing 'data-mapping' DT property\n");
>>>> +		} else {
>>>
>>> It would be nice with a helper for the below code if we need this a third
>>> time.
>>
>> Where would you store it ?
> drm_connector.c seems to be a good place.
> Or maybe a static inline in drm_connector.h.

Sorry, this patch has been dragging on for over half a year, another 
patch which depends on this has been dragging on for over a year, so I 
don't feel particularly motivated to prolong that further by starting a 
subsystem patch discussion here now. If someone wants to make this code 
more generic, that can surely be a subsequent patch?
