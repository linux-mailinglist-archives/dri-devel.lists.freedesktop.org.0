Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9326149EC3F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 21:08:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA63E10E271;
	Thu, 27 Jan 2022 20:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B721310E271
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 20:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H37n2IiJ/WgviNvt6lfrTK+VrebsOsUlI63J/MadfVA=; b=hFgfr/9WwsWXOVX7rY/WGaJebz
 oh+2aQucm4MsDIpCC6MLefhrjgk+voiFtmKYskhQkboM47qHrXFPh4Fio7Z8J0QQis3jKSXPb0285
 ft5Ugw8zDZlkW0AEiNt+eJAAhsYYRqEocNkct6c6Fq8CzOSwbLhXRY4oSzLbDQ9x8slQ57TYpeC6s
 GzujohmBIisB08mrotpF+OkRXpOsw/sCDJBYIVr5SaapQEqC6iHr3EO+w+h+9Z9zP8XVmClWG7iV5
 HfN6/aRC3wAPqvE6yrrNGa/QK5fQR8kQTSktrCpGBaH0VXKBTgzP8b9WQzEouFqhmR4tg3GK95Xsm
 tmRfZC0g==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62561
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1nDB4d-0002db-Kv; Thu, 27 Jan 2022 21:08:51 +0100
Message-ID: <5bf664e4-f505-ca50-ce28-d84d6e6207a3@tronnes.org>
Date: Thu, 27 Jan 2022 21:08:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/3] drm/panel: Add MIPI DBI compatible SPI driver
To: David Lechner <david@lechnology.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com
References: <20220125175700.37408-1-noralf@tronnes.org>
 <20220125175700.37408-4-noralf@tronnes.org>
 <2ee03a80-fddb-e28c-1c29-cd88759ed849@lechnology.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <2ee03a80-fddb-e28c-1c29-cd88759ed849@lechnology.com>
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, maxime@cerno.tech,
 dri-devel@lists.freedesktop.org, dave.stevenson@raspberrypi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 27.01.2022 18.19, skrev David Lechner:
> On 1/25/22 11:57 AM, Noralf Trønnes wrote:
>> Add a driver that will work with most MIPI DBI compatible SPI panels.
>> This avoids adding a driver for every new MIPI DBI compatible controller
>> that is to be used by Linux. The 'compatible' Device Tree property with
>> a '.bin' suffix will be used to load a firmware file that contains the
>> controller configuration.
>>
>> Example (driver will load sainsmart18.bin):
>>
>> display@0 {
>>     compatible = "sainsmart18", "panel-mipi-dbi-spi";
>>     reg = <0>;
>>     reset-gpios = <&gpio 25 0>;
>>     dc-gpios = <&gpio 24 0>;
>> };
>>
> 
> ...
> 
>> +static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
>> +{
>> +    struct device *dev = &spi->dev;
>> +    struct drm_display_mode mode;
>> +    struct mipi_dbi_dev *dbidev;
>> +    const struct firmware *fw;
>> +    const char *compatible;
>> +    struct drm_device *drm;
>> +    struct property *prop;
>> +    bool fw_found = false;
>> +    struct mipi_dbi *dbi;
>> +    struct gpio_desc *dc;
>> +    char fw_name[40];
>> +    int ret;
>> +
>> +    dbidev = devm_drm_dev_alloc(dev, &panel_mipi_dbi_driver, struct
>> mipi_dbi_dev, drm);
>> +    if (IS_ERR(dbidev))
>> +        return PTR_ERR(dbidev);
>> +
>> +    dbi = &dbidev->dbi;
>> +    drm = &dbidev->drm;
>> +
>> +    of_property_for_each_string(dev->of_node, "compatible", prop,
>> compatible) {
>> +        snprintf(fw_name, sizeof(fw_name), "%s.bin", compatible);
>> +
>> +        ret = firmware_request_nowarn(&fw, fw_name, dev);
>> +        if (ret) {
>> +            drm_dbg(drm, "No config file found for compatible: '%s'
>> (error=%d)\n",
>> +                compatible, ret);
>> +            continue;
>> +        }
>> +
> 
> Should we add a directory prefix to the firmware file name to avoid the
> possibility of
> file name clashes with unrelated firmwares?

I did consider this but I think it very unlikely that there would be a
collision between the name of display/panel and some other firmware file
which usually have the product name/model in the filename. And in the
unlikelihood that there is a collision it's possible to choose another
name for the compatible.

Noralf.
