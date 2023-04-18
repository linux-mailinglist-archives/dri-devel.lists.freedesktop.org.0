Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95D46E5C59
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 10:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF23210E121;
	Tue, 18 Apr 2023 08:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E9E10E703
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:42:43 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4edc114c716so1596789e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 01:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681807361; x=1684399361;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZP3AuFdp9sJnd/O9xcelaM7FQ5mQWFrmOkCIZBKH8Y=;
 b=BZOTCcYRi2KQXa/OMkwpGHEb8mS9p5qTpd1Oslp3AhCVA8nYtOZzm1Bxmpw6xYPmC/
 WhCym8+zvTQPCzLqv1J9SsMOzVQ+JYuYpWKyAFt0MDrgOm5J4N53d7Kvqx77y77J+Mb+
 qUPVKjrFwgtcBqp50Dx33Fqr6r31DF4MrpxEwcreeusNt5mji3HqghhjwjE/Xp2AJQYL
 9Xqlr0fDmodytwpIGwRlMqwdvtRiLZviyfkYcvTW1nEi1RdrSwVBzFQUNWwwdZys8ytc
 dVlsSGgZG/kKwk30fPkKkvpEh4gP+eRZ2AcHJ1Z5J0nPKeaxitQBuoaYMgyPBqEcgBcX
 MHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681807361; x=1684399361;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vZP3AuFdp9sJnd/O9xcelaM7FQ5mQWFrmOkCIZBKH8Y=;
 b=fjppRtLTq0bh3hmKtReQuC1IEegGpaOoKEvRjLFoZaiQtdqtQ2JpQTIS1AVYtWIXpW
 u5meznYPujT2fziP7gRBk1PMrNtdLZu8XscB7OK/wHg67WHvLFTRjuW2m/6OSLIW0VIm
 lkAq/az9vws+USUtqaMaqhDTiZwsMUerfehwUJFnmlrb5X6dX0cKxa+EAWibbBihIG+S
 j5N0N6srCOSamNniihy9sl4CdUsvBcmIfOm9//OMDVc4mVGOpdD99CPzfIKBFvRr9+Qz
 jXCxZV+z80nNB93cljbXLpyxZLqD2uHDKWM2Na8QdxsCvczFRc5ocoYZJlKQpUVrjEQY
 kMLg==
X-Gm-Message-State: AAQBX9coX4GruV9+qucAzJAkq4tmSRLLzUKoeq4/BAPgHslXhSqZhFs/
 LFyoeR3/zKIy6m+cSbL40D9/BT1wUxY=
X-Google-Smtp-Source: AKy350a+xZVvLTmP6/Y5+OGaMEfqTgQkdT3vuvtTRZnDkbwP8XdO40ROnyHEweOAjchfMRz0Jyg+Sw==
X-Received: by 2002:ac2:53b3:0:b0:4e8:a0a3:e242 with SMTP id
 j19-20020ac253b3000000b004e8a0a3e242mr2196845lfh.7.1681807360756; 
 Tue, 18 Apr 2023 01:42:40 -0700 (PDT)
Received: from [192.168.1.103] ([31.173.80.61])
 by smtp.gmail.com with ESMTPSA id
 s9-20020ac25fa9000000b004ec83bc3e2dsm2295419lfe.42.2023.04.18.01.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 01:42:40 -0700 (PDT)
Subject: Re: [PATCH 2/2] ata: libata-core: Apply ATI NCQ horkage to ASPEED as
 well
To: Patrick McLean <chutzpah@gentoo.org>, linux-kernel@vger.kernel.org
References: <20230418011720.3900090-1-chutzpah@gentoo.org>
 <20230418011720.3900090-3-chutzpah@gentoo.org>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <e71d0891-371e-d267-879d-47b736bb12c9@gmail.com>
Date: Tue, 18 Apr 2023 11:42:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20230418011720.3900090-3-chutzpah@gentoo.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-ide@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

On 4/18/23 4:17 AM, Patrick McLean wrote:

> We have some machines with ASPEED SATA controllers, and are seeing the same NCQ
> issues that ATI controllers (I am not sure if it's a rebranded ATI controller,
> or they both have some faulty implementation). This NCQ breakage is consistent
> across a few different types of drives.
> 
> Instead of maintaining a list of drives that are broken with ASPEED controllers
> as well as ATI, let's just treat ASPEED controllers like ATI ones, and disable
> NCQ on drives that have ATA_HORKAGE_NO_NCQ_ON_ATI set on them.
> 
> We have been running this patch on several machines for over a week now without
> reproducing an issue that was happening almost daily before.
> 
> Signed-off-by: Patrick McLean <chutzpah@gentoo.org>
> ---
>  drivers/ata/libata-core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
> index 14c17c3bda4e..051492e8e9f9 100644
> --- a/drivers/ata/libata-core.c
> +++ b/drivers/ata/libata-core.c
> @@ -2219,7 +2219,8 @@ static int ata_dev_config_ncq(struct ata_device *dev,
>  	}
>  
>  	if (dev->horkage & ATA_HORKAGE_NO_NCQ_ON_ATI &&
> -	    ata_dev_check_adapter(dev, PCI_VENDOR_ID_ATI)) {
> +	    (ata_dev_check_adapter(dev, PCI_VENDOR_ID_ATI) ||
> +		ata_dev_check_adapter(dev, PCI_VENDOR_ID_ASPEED))) {

   Please align the start of this line with the start of the above
line, so that it doesn't needlessly blend with the below line.

>  		snprintf(desc, desc_sz, "NCQ (not used)");
>  		return 0;
>  	}

MBR, Sergey
