Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B94A19FF84A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 11:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7EC610E406;
	Thu,  2 Jan 2025 10:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dIXJVMNq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 312 seconds by postgrey-1.36 at gabe;
 Thu, 02 Jan 2025 10:37:53 UTC
Received: from smtp.smtpout.orange.fr (smtp-72.smtpout.orange.fr
 [80.12.242.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263EC10E406;
 Thu,  2 Jan 2025 10:37:53 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id TIaFtIJGgv8EoTIaIt1ist; Thu, 02 Jan 2025 11:37:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1735814271;
 bh=m/vUJhwL3JxwUo9JiXO0sjdvNVj8XBjdzWqYRllhLR0=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=dIXJVMNqq2vQdKxSShJ3XE73jU+NJYue5WSoFot2vxnAIvl/OAvSWYFIyuylv7Xn6
 9I+1v0l+Q8QXa9FUOIYVPv1lVx+nsVt5dei4EbqvImJI/XGYiXu9ynhGwRlMb+rmrI
 Q4YngEkt1472DxfR3U/twcs41hySJ7aDW6SRd95TlKI7lu11u3Y5G6fSn8+Q5rPjKw
 sloXDRXlfRIWJRqiVdYsQkfeWPt7J9MXXqsLbcifBYC1IVh++C8u62Bv2W1uBoywYC
 b3D9W/Dv7y3TCVVYlpf3GwG3759hHvsHnsKoy6R3KGfRvv9hnIQvPyjVy0Gs/S7X34
 aoSUOLWg53DkQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 02 Jan 2025 11:37:51 +0100
X-ME-IP: 90.11.132.44
Message-ID: <022418c7-f2b2-47b7-9b61-da3f4b7dffab@wanadoo.fr>
Date: Thu, 2 Jan 2025 11:37:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] mtd: intel-dg: implement region enumeration
To: Alexander Usyskin <alexander.usyskin@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tomas Winkler <tomasw@gmail.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-4-alexander.usyskin@intel.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250101153925.865703-4-alexander.usyskin@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 01/01/2025 à 16:39, Alexander Usyskin a écrit :
> In intel-dg, there is no access to the spi controller,
> the information is extracted from the descriptor region.
> 
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Co-developed-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Tomas Winkler <tomasw@gmail.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

...

> @@ -89,6 +281,13 @@ static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
>   		goto err;
>   	}
>   
> +	ret = intel_dg_nvm_init(nvm, device);
> +	if (ret < 0) {
> +		dev_err(device, "cannot initialize nvm\n");
> +		ret = -ENODEV;

Why setting to -ENODEV?

> +		goto err;
> +	}
> +
>   	dev_set_drvdata(&aux_dev->dev, nvm);
>   
>   	return 0;

