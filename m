Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C64B42AFCA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 00:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB5C6E039;
	Tue, 12 Oct 2021 22:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0506E039
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 22:45:21 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D834B834CC;
 Wed, 13 Oct 2021 00:45:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1634078720;
 bh=5JhRpAyo5ahpIkiQDdUIIv1/zHJcT2K4mO72jvVGhIk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LX6Ck2MOOFqybBr5J11EwCVJQ/8czXmAkqPdMHgTYYujcIQA/0ZYihC/KwZB7QjcT
 aInixqySUtY0h0k+DU21PRabZ5nmoE11w25jnPXiLADFnOAR0HhcG7mwYJJ88173fW
 Mgt3KQZeTqHL8jEWXh+iva5zn3FOZmiE9G59iPp/cFyCfrPyHg/dctsAv1BZBQhkeY
 20B8+ON14IS5WnXtvyYyqUioJP0dOp4MK9mARTi+RNz9iDBd9HleGxY4beTdeEPbCh
 SxR1ZWX7FHpPm++g5xQtGdFNDsmDRQlkj9DpI/CoBajTCvbuVR1kWzlt7HV4OS8uu9
 EAra3VQI74gog==
Subject: Re: [PATCH v2] drm: of: Add drm_of_lvds_get_data_mapping
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20211011112133.5313-1-marex@denx.de>
 <YWXqi6IbRaK/0FrM@ravnborg.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <7c4ca661-cfec-e87e-2a10-a8971d468987@denx.de>
Date: Wed, 13 Oct 2021 00:45:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWXqi6IbRaK/0FrM@ravnborg.org>
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

On 10/12/21 10:05 PM, Sam Ravnborg wrote:

[...]

>> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
>> index 37c34146eea8..a9217bc18e8f 100644
>> --- a/drivers/gpu/drm/drm_of.c
>> +++ b/drivers/gpu/drm/drm_of.c
>> @@ -402,3 +402,36 @@ int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
>>   		DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS;
>>   }
>>   EXPORT_SYMBOL_GPL(drm_of_lvds_get_dual_link_pixel_order);
>> +
>> +/**
>> + * drm_of_lvds_get_data_mapping - Get LVDS data mapping
>> + * @port: DT port node of the LVDS source or sink
>> + *
>> + * Convert DT "data-mapping" property string value into media bus format value.
>> + *
>> + * Return:
>> + * MEDIA_BUS_FMT_RGB666_1X7X3_SPWG - data-mapping is "jeida-18"
>> + * MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA - data-mapping is "jeida-24"
>> + * MEDIA_BUS_FMT_RGB888_1X7X4_SPWG - data-mapping is "vesa-24"
>> + * -EINVAL - the "data-mapping" property is unsupported
>> + * -ENODEV - the "data-mapping" property is missing
>> + */
> I tried to look at the output of this - it looks bad.
> 
> See the chapter "Return values" here: https://docs.kernel.org/doc-guide/kernel-doc.html
> Sorry for not catching this during the first review.

Should be fixed in V3.
