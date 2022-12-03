Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130C26417B9
	for <lists+dri-devel@lfdr.de>; Sat,  3 Dec 2022 17:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6416F10E1CD;
	Sat,  3 Dec 2022 16:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F34D10E1CD
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Dec 2022 16:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=enw8VD3zPnXl7/R2ZunjM3J38aIylzUIoo4Sqggqufk=; b=KB938maJsa5aZfqs3S5Mw9MLTU
 m86WTmZFS//+wcmd1cs3nr/a85g9RlJr4trgcx1KDdMaMZ8eorjDNhkMmX6EhuBm0BXKz1geGAKG/
 9SlhQkU6bzMVbrkO6PoEjLajJGkUjkqzDFZxjpWNNsqxcA2iAWYYOBk1MykZOEQqaNRp6HP0mkKHU
 Ui0vzmuBwV8MiFXZXo4fs3YxXac6vDYCvOvERhPYCd74oHgC17llYO7P+rxSIfYZS3MhMsVNf8ncn
 Tm5gIKJmKTDoXw1V07Q8K3LUr6aPBlQF7dBpq327YYa5AwW4mCIwQVY8ybGFRfz4Y9zBOTHEIFtjv
 4tKlF+Tg==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=57101)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1p1VFf-0003h8-BV; Sat, 03 Dec 2022 17:20:31 +0100
Message-ID: <9d0815fb-141d-91dc-2ca3-a827bed62b3e@tronnes.org>
Date: Sat, 3 Dec 2022 17:20:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 2/3] drm/tiny: panel-mipi-dbi: Read I/O supply from DT
To: =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221201160245.2093816-1-otto.pflueger@abscue.de>
 <20221201160245.2093816-3-otto.pflueger@abscue.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221201160245.2093816-3-otto.pflueger@abscue.de>
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 01.12.2022 17.02, skrev Otto Pflüger:
> To support platforms with a separate I/O voltage supply, set the new
> io_regulator property along with the regulator property of the DBI
> device. Read the I/O supply from a new "io-supply" device tree
> property.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
