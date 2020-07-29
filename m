Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E42A4232C69
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 09:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8836E885;
	Thu, 30 Jul 2020 07:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EC06E5AE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 17:02:55 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BH0Gj51jbz1qt3c;
 Wed, 29 Jul 2020 19:02:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BH0Gj3Df5z1qy6F;
 Wed, 29 Jul 2020 19:02:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id LgZHLijsyOCh; Wed, 29 Jul 2020 19:02:52 +0200 (CEST)
X-Auth-Info: fKZrZcAxHZDYoakWPIeNcOgfsboODDj4+uh2OA5bxto=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 29 Jul 2020 19:02:52 +0200 (CEST)
Subject: Re: [PATCH V2 2/2] drm/bridge: tc358762: Add basic driver for Toshiba
 TC358762 DSI-to-DPI bridge
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200729164554.114735-1-marex@denx.de>
 <20200729164554.114735-2-marex@denx.de>
 <20200729165604.GA1372716@ravnborg.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <3f9702f1-062e-a43c-3297-eb5baacaa81c@denx.de>
Date: Wed, 29 Jul 2020 19:02:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729165604.GA1372716@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 30 Jul 2020 07:16:49 +0000
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
Cc: Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/29/20 6:56 PM, Sam Ravnborg wrote:
[...]
>> +static int tc358762_probe(struct mipi_dsi_device *dsi)
>> +{
>> +	struct device *dev = &dsi->dev;
>> +	struct tc358762 *ctx;
>> +	int ret;
>> +
>> +	ctx = devm_kzalloc(dev, sizeof(struct tc358762), GFP_KERNEL);
>> +	if (!ctx)
>> +		return -ENOMEM;
>> +
>> +	mipi_dsi_set_drvdata(dsi, ctx);
> I cannot see why this is needed. If not used then delete it.
> With the above addressed:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Let me know if I shall apply - but we have to wait until binding is
> reviewed. And preferably one extra set of eyes on this driver.

[...]

>> +static int tc358762_remove(struct mipi_dsi_device *dsi)
>> +{
>> +	struct tc358762 *ctx = mipi_dsi_get_drvdata(dsi);
>> +
>> +	mipi_dsi_detach(dsi);
>> +	drm_bridge_remove(&ctx->bridge);

Because it's used here in the remove callback.

[...]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
