Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF05C90BC55
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 22:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B234F10E4ED;
	Mon, 17 Jun 2024 20:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="PE92LGv2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E277D10E4ED
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 20:48:53 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-35f1c567ae4so3706283f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 13:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1718657332; x=1719262132;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=4Prxca8WsXgeUFt4L2M3lgOG9HB9DoX/SrgkfE/LHB8=;
 b=PE92LGv2mhQV+cEqEy18zeiGFYB7D24UxC6fwfbJdo1aRfRt7M4xCZP4V6LdvUFcmh
 nCiysILSAaZFNkum6JxJ8VKgEuiLOPZI88dB5w2cOODIw1KpaWMRwBgXQkex6ejgYZSJ
 WLdPKPiXyIqOwZP8+DXc0roSvEF3qlAkjh/g4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718657332; x=1719262132;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Prxca8WsXgeUFt4L2M3lgOG9HB9DoX/SrgkfE/LHB8=;
 b=pxGBmwYnERXt5NLsml35vx1TDe/Q3P71EuIOeQhsrDippeWHR749J4ttwKGzFZ7l22
 NMCEktzyvzv4lRZkuiufRE3vHCypZWHXIRnNBfrNmLSO3+jrRhrclDyNx/F2nSYH83vu
 gV3fAaVVH4FuNWkjD1PiVMdiPsNtOxITXm6OSg7Xp73EwsyIzzHXXoSciEkrMBuuPeAs
 TKa+THnlVB5M+qP0csU1+Vi6tvFGMEYZ0okqnnLl1Gsy1vXCyC0ADemqgcPmyXQTsJYN
 KrTvUCISBj1NisixSAs58rYVNtmkuky9W3JokEHyHZKa3a757wiLb/4qBhlHVnnaoN3x
 49cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2uMdv54LT08rUFw2gochuuNC/kWida8rahkopkez1z6QmtHkkD5BXzrpOrrX2kYUqgfjoSKdTiemZ/KTnsNyxUV6TK9HZb6tFS7OAeWHN
X-Gm-Message-State: AOJu0YwijkNFh/JnqKWzuiMfEPQGMXVSoZfpjM9h9Qm5hSuQzNYaSZyx
 Ql05LMmNVsSh73DdwEofZU7wlz0B2KqjfaQMqmxf3nIdjsnrMddyjT17BEaMgA==
X-Google-Smtp-Source: AGHT+IHEU62suYWnRXwKdzpdAXSz5KBYd2epiiTyciPo+/4BqNzGad5ovJJPFBopMPwoL4rztkfXKQ==
X-Received: by 2002:a5d:4b83:0:b0:360:7557:3239 with SMTP id
 ffacd0b85a97d-3607a763270mr7051286f8f.20.1718657332016; 
 Mon, 17 Jun 2024 13:48:52 -0700 (PDT)
Received: from [10.66.192.68] ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56db62e5sm547701466b.84.2024.06.17.13.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 13:48:51 -0700 (PDT)
Message-ID: <19e8a6dd-b0d4-4e88-9ad2-e38787a5aee8@broadcom.com>
Date: Mon, 17 Jun 2024 13:48:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iio: dac: Fix dependencies of AD9739A
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 lkp@intel.com, zack.rusin@broadcom.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, linux-iio@vger.kernel.org,
 jic23@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 dragos.bogdan@analog.com, anshulusr@gmail.com, andrea.collamati@gmail.com,
 oe-kbuild-all@lists.linux.dev, x86@kernel.org
References: <202406152104.FxakP1MB-lkp@intel.com>
 <20240616012511.198243-1-alexey.makhalov@broadcom.com>
 <20240616012511.198243-2-alexey.makhalov@broadcom.com>
 <20240617090428.GBZm_8HMQ9XJe_VQga@fat_crate.local>
Content-Language: en-US
From: Alexey Makhalov <alexey.makhalov@broadcom.com>
Autocrypt: addr=alexey.makhalov@broadcom.com; keydata=
 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 EuY0
In-Reply-To: <20240617090428.GBZm_8HMQ9XJe_VQga@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/17/24 2:04 AM, Borislav Petkov wrote:
> On Sat, Jun 15, 2024 at 06:25:11PM -0700, Alexey Makhalov wrote:
>> 0-DAY CI Kernel Test automation reported an issue:
>>
>>     ld: drivers/base/regmap/regmap-spi.o: in function `regmap_spi_read':
>>     regmap-spi.c:(.text+0xf): undefined reference to `spi_write_then_read'
>>     ld: drivers/base/regmap/regmap-spi.o: in function `regmap_spi_gather_write':
>>     regmap-spi.c:(.text+0x2b4): undefined reference to `spi_sync'
>>     ld: drivers/base/regmap/regmap-spi.o: in function `spi_sync_transfer.constprop.0':
>>     regmap-spi.c:(.text+0x337): undefined reference to `spi_sync'
>>     ld: drivers/base/regmap/regmap-spi.o: in function `regmap_spi_async_write':
>>     regmap-spi.c:(.text+0x445): undefined reference to `spi_async'
>>     ld: drivers/iio/dac/ad9739a.o: in function `ad9739a_driver_init':
>>     ad9739a.c:(.init.text+0x10): undefined reference to `__spi_register_driver'
>>
>> Kconfig warnings: (for reference only)
>>     WARNING: unmet direct dependencies detected for REGMAP_SPI
>>     Depends on [n]: SPI [=n]
>>     Selected by [y]:
>>     - AD9739A [=y] && IIO [=y] && (SPI [=n] || COMPILE_TEST [=y])
>>
>> The issue is caused by CONFIG_AD9739A=y when CONFIG_SPI is not set.
>>
>> Add explicit dependency on SPI and conditional selection of REGMAP_SPI.
>>
>> Fixes: e77603d5468b ("iio: dac: support the ad9739a RF DAC")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202406152104.FxakP1MB-lkp@intel.com/
>> Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
>> ---
>>   drivers/iio/dac/Kconfig | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
>> index 3c2bf620f00f..d095f4d26e49 100644
>> --- a/drivers/iio/dac/Kconfig
>> +++ b/drivers/iio/dac/Kconfig
>> @@ -133,8 +133,8 @@ config AD5624R_SPI
>>   
>>   config AD9739A
>>   	tristate "Analog Devices AD9739A RF DAC spi driver"
>> -	depends on SPI || COMPILE_TEST
>> -	select REGMAP_SPI
>> +	depends on SPI
>> +	select REGMAP_SPI if SPI_MASTER
>>   	select IIO_BACKEND
>>   	help
>>   	  Say yes here to build support for Analog Devices AD9739A Digital-to
>> -- 
> 
> FWIW, I appreciate it you fixing other breakages. However, there's a patch for
> that already, on its way:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?h=fixes-togreg&id=75183e461ce033605c3e85518a9f3d4e4ef848a3
> 
> Don't get discouraged, though, when fixing something that is not in our
> immediate area of interest!
> 
> :-)
> 
> Thx.
> 

Lesson learned and noted for next time to address only related/new 
warnings and errors. Thanks!
