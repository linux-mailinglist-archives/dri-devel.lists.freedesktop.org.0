Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C5B72F921
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 11:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362B710E433;
	Wed, 14 Jun 2023 09:29:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BC110E433
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 09:29:36 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id CB7845FD5E;
 Wed, 14 Jun 2023 12:29:34 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
 s=mail; t=1686734974;
 bh=1Id3JzoivbBSxG0a9QiNV1MIm/F52SVIjgMaprUyT9g=;
 h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
 b=sSzWguiOcUdEvb6sj7EqUJZTHKnIwYsHRixCBOO3fDcjrLEJA2Ryb0qmbBc+nxdMK
 zJtiUjQ3pt+dyL1+2L+uHMpCSsjRGDkK4X4bVoYEI7bJLw8ZZmx+Iw0gv8ONLyV7ZO
 FqEkUrO8hvdQXtGcNYdRblXN+lI88jXX9p0JT4h4OFTxiYyqBTnWXm4tOlDcoz1Iq7
 3LcVznbUvgLwJ/5GOBh/8rV6s5NL+G4m5GHwLYmu73pxKnjcJgc0uRiB8poAua9q0c
 xLPpfd3u150zUjIViZcs3J7QfFoBk0lFI2+ZFuMl2kfFRw9wbZkm5AlMhreCn4AZ+I
 j5OAB+PFoHi6g==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Wed, 14 Jun 2023 12:29:33 +0300 (MSK)
Message-ID: <4f4db4e9-ead7-6cc1-a53a-29f2af9014ee@sberdevices.ru>
Date: Wed, 14 Jun 2023 12:24:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4] mtd: rawnand: macronix: OTP access for MX30LFxG18AC
Content-Language: en-US
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
To: Miquel Raynal <miquel.raynal@bootlin.com>, liao jaime
 <jaimeliao.tw@gmail.com>
References: <20230523101637.3009746-1-AVKrasnov@sberdevices.ru>
 <20230612185354.09b88e0d@xps-13>
 <CAAQoYR=aU-tpFYhfKUae=2zbvpzmP3_d4PYp_252qxSsPcVbaQ@mail.gmail.com>
 <20230614111001.6b0417d4@xps-13>
 <24dcecf2-f394-6542-eeb6-ab65ea19708a@sberdevices.ru>
In-Reply-To: <24dcecf2-f394-6542-eeb6-ab65ea19708a@sberdevices.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/06/14 04:50:00 #21499017
X-KSMG-AntiVirus-Status: Clean, skipped
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 oxffffaa@gmail.com, kernel@sberdevices.ru,
 Mason Yang <masonccyang@mxic.com.tw>, linux-media@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jaime Liao <jaimeliao@mxic.com.tw>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14.06.2023 12:22, Arseniy Krasnov wrote:
> Hello Miquel and Jaime!
> 
> On 14.06.2023 12:10, Miquel Raynal wrote:
>> Hi liao,
>>
>> jaimeliao.tw@gmail.com wrote on Wed, 14 Jun 2023 17:06:16 +0800:
>>
>>> Hi Miquel
>>>
>>>
>>>>
>>>> Hello,
>>>>
>>>> AVKrasnov@sberdevices.ru wrote on Tue, 23 May 2023 13:16:34 +0300:
>>>>  
>>>>> This adds support for OTP area access on MX30LFxG18AC chip series.  
>>>>
>>>> Jaime, any feedback on this? Will you test it?
>>>>
>>>> How are we supposed to test the OTP is locked? I see this is still an
>>>> open point.  
>>> After checking with internal, sub feature parameter are volatile register.
>>>
>>> It could be change after enter/exit OTP region or power cycle even OTP
>>>
>>> region have been locked.
>>>
>>> OTP operation mode still could be enter/exit and region is read only
>>> after OTP in protect mode.
>>>
>>> #program command could execute but no use after setting OTP region in
>>> protect mode.
>>>
>>> So that we can't check whether OTP region is locked via get feature.
>>>
>>> And we don't have region for checking status of OTP locked.
>>
>> Ah, too bad. But thanks a lot for the explanation. Arseniy, can you
>> please change your comment to explain that the bit is volatile and thus
>> there is no way to check if an otp region is locked? I would return
>> EOPNOTSUPP in this case and verify that the core cleanly handles the
>> situation.
> 
> Ok, thanks for details. @Miquel, ok, I'll change comment from "don't know..."
> to this explanation. About EOPNOTSUPP, IIUC I think it is not good way to
> suppress '_get_fact_prot_info' and '_get_user_prot_info' callbacks with this
> return code as it is the only way to know size of OTP region.
> 
> Thanks, Arseniy

Ahh sorry, there is '_lock_user_prot_reg', it will return EOPNOTSUPP. Now I see:)

Thanks, Arseniy

> 
>>
>> Thanks,
>> Miquèl
>>
>>>
>>>>  
>>>>>
>>>>> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
>>>>> ---
>>>>>   v1 -> v2:
>>>>>   * Add slab.h include due to kernel test robot error.
>>>>>   v2 -> v3:
>>>>>   * Use 'uint64_t' as input argument for 'do_div()' instead
>>>>>     of 'unsigned long' due to kernel test robot error.
>>>>>   v3 -> v4:
>>>>>   * Use 'dev_err()' instead of 'WARN()'.
>>>>>   * Call 'match_string()' before checking 'supports_set_get_features'
>>>>>     in 'macronix_nand_setup_otp().
>>>>>   * Use 'u8' instead of 'uint8_t' as ./checkpatch.pl wants.
>>>>>
>>>>>  drivers/mtd/nand/raw/nand_macronix.c | 216 +++++++++++++++++++++++++++
>>>>>  1 file changed, 216 insertions(+)
>>>>>
>>>>> diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
>>>>> index 1472f925f386..be1ffa93bebb 100644
>>>>> --- a/drivers/mtd/nand/raw/nand_macronix.c
>>>>> +++ b/drivers/mtd/nand/raw/nand_macronix.c
>>>>> @@ -6,6 +6,7 @@
>>>>>   * Author: Boris Brezillon <boris.brezillon@free-electrons.com>
>>>>>   */
>>>>>
>>>>> +#include <linux/slab.h>
>>>>>  #include "linux/delay.h"
>>>>>  #include "internals.h"
>>>>>
>>>>> @@ -31,6 +32,20 @@
>>>>>
>>>>>  #define MXIC_CMD_POWER_DOWN 0xB9
>>>>>
>>>>> +#define ONFI_FEATURE_ADDR_30LFXG18AC_OTP     0x90
>>>>> +#define MACRONIX_30LFXG18AC_OTP_START_PAGE   0
>>>>> +#define MACRONIX_30LFXG18AC_OTP_PAGES                30
>>>>> +#define MACRONIX_30LFXG18AC_OTP_PAGE_SIZE    2112
>>>>> +#define MACRONIX_30LFXG18AC_OTP_START_BYTE   \
>>>>> +     (MACRONIX_30LFXG18AC_OTP_START_PAGE *   \
>>>>> +      MACRONIX_30LFXG18AC_OTP_PAGE_SIZE)
>>>>> +#define MACRONIX_30LFXG18AC_OTP_SIZE_BYTES   \
>>>>> +     (MACRONIX_30LFXG18AC_OTP_PAGES *        \
>>>>> +      MACRONIX_30LFXG18AC_OTP_PAGE_SIZE)
>>>>> +
>>>>> +#define MACRONIX_30LFXG18AC_OTP_EN           BIT(0)
>>>>> +#define MACRONIX_30LFXG18AC_OTP_LOCKED               BIT(1)
>>>>> +
>>>>>  struct nand_onfi_vendor_macronix {
>>>>>       u8 reserved;
>>>>>       u8 reliability_func;
>>>>> @@ -316,6 +331,206 @@ static void macronix_nand_deep_power_down_support(struct nand_chip *chip)
>>>>>       chip->ops.resume = mxic_nand_resume;
>>>>>  }
>>>>>
>>>>> +static int macronix_30lfxg18ac_get_otp_info(struct mtd_info *mtd, size_t len,
>>>>> +                                         size_t *retlen,
>>>>> +                                         struct otp_info *buf)
>>>>> +{
>>>>> +     if (len < sizeof(*buf))
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     /* Don't know how to check that OTP is locked. */
>>>>> +     buf->locked = 0;
>>>>> +     buf->start = MACRONIX_30LFXG18AC_OTP_START_BYTE;
>>>>> +     buf->length = MACRONIX_30LFXG18AC_OTP_SIZE_BYTES;
>>>>> +
>>>>> +     *retlen = sizeof(*buf);
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static int macronix_30lfxg18ac_otp_enable(struct nand_chip *nand)
>>>>> +{
>>>>> +     u8 feature_buf[ONFI_SUBFEATURE_PARAM_LEN] = { 0 };
>>>>> +
>>>>> +     feature_buf[0] = MACRONIX_30LFXG18AC_OTP_EN;
>>>>> +     return nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
>>>>> +                              feature_buf);
>>>>> +}
>>>>> +
>>>>> +static int macronix_30lfxg18ac_otp_disable(struct nand_chip *nand)
>>>>> +{
>>>>> +     u8 feature_buf[ONFI_SUBFEATURE_PARAM_LEN] = { 0 };
>>>>> +
>>>>> +     return nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
>>>>> +                              feature_buf);
>>>>> +}
>>>>> +
>>>>> +static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
>>>>> +                                     loff_t offs_in_flash,
>>>>> +                                     size_t len, size_t *retlen,
>>>>> +                                     u_char *buf, bool write)
>>>>> +{
>>>>> +     struct nand_chip *nand;
>>>>> +     size_t bytes_handled;
>>>>> +     off_t offs_in_page;
>>>>> +     void *dma_buf;
>>>>> +     u64 page;
>>>>> +     int ret;
>>>>> +
>>>>> +     /* 'nand_prog/read_page_op()' may use 'buf' as DMA buffer,
>>>>> +      * so allocate properly aligned memory for it. This is
>>>>> +      * needed because cross page accesses may lead to unaligned
>>>>> +      * buffer address for DMA.
>>>>> +      */
>>>>> +     dma_buf = kmalloc(MACRONIX_30LFXG18AC_OTP_PAGE_SIZE, GFP_KERNEL);
>>>>> +     if (!dma_buf)
>>>>> +             return -ENOMEM;
>>>>> +
>>>>> +     nand = mtd_to_nand(mtd);
>>>>> +     nand_select_target(nand, 0);
>>>>> +
>>>>> +     ret = macronix_30lfxg18ac_otp_enable(nand);
>>>>> +     if (ret)
>>>>> +             goto out_otp;
>>>>> +
>>>>> +     page = offs_in_flash;
>>>>> +     /* 'page' will be result of division. */
>>>>> +     offs_in_page = do_div(page, MACRONIX_30LFXG18AC_OTP_PAGE_SIZE);
>>>>> +     bytes_handled = 0;
>>>>> +
>>>>> +     while (bytes_handled < len &&
>>>>> +            page < MACRONIX_30LFXG18AC_OTP_PAGES) {
>>>>> +             size_t bytes_to_handle;
>>>>> +
>>>>> +             bytes_to_handle = min_t(size_t, len - bytes_handled,
>>>>> +                                     MACRONIX_30LFXG18AC_OTP_PAGE_SIZE -
>>>>> +                                     offs_in_page);
>>>>> +
>>>>> +             if (write) {
>>>>> +                     memcpy(dma_buf, &buf[bytes_handled], bytes_to_handle);
>>>>> +                     ret = nand_prog_page_op(nand, page, offs_in_page,
>>>>> +                                             dma_buf, bytes_to_handle);
>>>>> +             } else {
>>>>> +                     ret = nand_read_page_op(nand, page, offs_in_page,
>>>>> +                                             dma_buf, bytes_to_handle);
>>>>> +                     if (!ret)
>>>>> +                             memcpy(&buf[bytes_handled], dma_buf,
>>>>> +                                    bytes_to_handle);
>>>>> +             }
>>>>> +             if (ret)
>>>>> +                     goto out_otp;
>>>>> +
>>>>> +             bytes_handled += bytes_to_handle;
>>>>> +             offs_in_page = 0;
>>>>> +             page++;
>>>>> +     }
>>>>> +
>>>>> +     *retlen = bytes_handled;
>>>>> +
>>>>> +out_otp:
>>>>> +     if (ret)
>>>>> +             dev_err(&mtd->dev, "failed to perform OTP IO: %i\n", ret);
>>>>> +
>>>>> +     ret = macronix_30lfxg18ac_otp_disable(nand);
>>>>> +     if (ret)
>>>>> +             dev_err(&mtd->dev, "failed to leave OTP mode after %s\n",
>>>>> +                     write ? "write" : "read");
>>>>> +
>>>>> +     nand_deselect_target(nand);
>>>>> +     kfree(dma_buf);
>>>>> +
>>>>> +     return ret;
>>>>> +}
>>>>> +
>>>>> +static int macronix_30lfxg18ac_write_otp(struct mtd_info *mtd, loff_t to,
>>>>> +                                      size_t len, size_t *rlen,
>>>>> +                                      const u_char *buf)
>>>>> +{
>>>>> +     return __macronix_30lfxg18ac_rw_otp(mtd, to, len, rlen, (u_char *)buf,
>>>>> +                                         true);
>>>>> +}
>>>>> +
>>>>> +static int macronix_30lfxg18ac_read_otp(struct mtd_info *mtd, loff_t from,
>>>>> +                                     size_t len, size_t *rlen,
>>>>> +                                     u_char *buf)
>>>>> +{
>>>>> +     return __macronix_30lfxg18ac_rw_otp(mtd, from, len, rlen, buf, false);
>>>>> +}
>>>>> +
>>>>> +static int macronix_30lfxg18ac_lock_otp(struct mtd_info *mtd, loff_t from,
>>>>> +                                     size_t len)
>>>>> +{
>>>>> +     u8 feature_buf[ONFI_SUBFEATURE_PARAM_LEN] = { 0 };
>>>>> +     struct nand_chip *nand;
>>>>> +     int ret;
>>>>> +
>>>>> +     if (from != MACRONIX_30LFXG18AC_OTP_START_BYTE ||
>>>>> +         len != MACRONIX_30LFXG18AC_OTP_SIZE_BYTES)
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     dev_dbg(&mtd->dev, "locking OTP\n");
>>>>> +
>>>>> +     nand = mtd_to_nand(mtd);
>>>>> +     nand_select_target(nand, 0);
>>>>> +
>>>>> +     feature_buf[0] = MACRONIX_30LFXG18AC_OTP_EN |
>>>>> +                      MACRONIX_30LFXG18AC_OTP_LOCKED;
>>>>> +     ret = nand_set_features(nand, ONFI_FEATURE_ADDR_30LFXG18AC_OTP,
>>>>> +                             feature_buf);
>>>>> +     if (ret) {
>>>>> +             dev_err(&mtd->dev,
>>>>> +                     "failed to lock OTP (set features): %i\n", ret);
>>>>> +             nand_deselect_target(nand);
>>>>> +             return ret;
>>>>> +     }
>>>>> +
>>>>> +     /* Do dummy page prog with zero address. */
>>>>> +     feature_buf[0] = 0;
>>>>> +     ret = nand_prog_page_op(nand, 0, 0, feature_buf, 1);
>>>>> +     if (ret)
>>>>> +             dev_err(&mtd->dev,
>>>>> +                     "failed to lock OTP (page prog): %i\n", ret);
>>>>> +
>>>>> +     ret = macronix_30lfxg18ac_otp_disable(nand);
>>>>> +     if (ret)
>>>>> +             dev_err(&mtd->dev, "failed to leave OTP mode after lock\n");
>>>>> +
>>>>> +     nand_deselect_target(nand);
>>>>> +
>>>>> +     return ret;
>>>>> +}
>>>>> +
>>>>> +static void macronix_nand_setup_otp(struct nand_chip *chip)
>>>>> +{
>>>>> +     static const char * const supported_otp_models[] = {
>>>>> +             "MX30LF1G18AC",
>>>>> +             "MX30LF2G18AC",
>>>>> +             "MX30LF4G18AC",
>>>>> +     };
>>>>> +     struct mtd_info *mtd;
>>>>> +
>>>>> +     if (match_string(supported_otp_models,
>>>>> +                      ARRAY_SIZE(supported_otp_models),
>>>>> +                      chip->parameters.model) < 0)
>>>>> +             return;
>>>>> +
>>>>> +     if (!chip->parameters.supports_set_get_features)
>>>>> +             return;
>>>>> +
>>>>> +     bitmap_set(chip->parameters.get_feature_list,
>>>>> +                ONFI_FEATURE_ADDR_30LFXG18AC_OTP, 1);
>>>>> +     bitmap_set(chip->parameters.set_feature_list,
>>>>> +                ONFI_FEATURE_ADDR_30LFXG18AC_OTP, 1);
>>>>> +
>>>>> +     mtd = nand_to_mtd(chip);
>>>>> +     mtd->_get_fact_prot_info = macronix_30lfxg18ac_get_otp_info;
>>>>> +     mtd->_read_fact_prot_reg = macronix_30lfxg18ac_read_otp;
>>>>> +     mtd->_get_user_prot_info = macronix_30lfxg18ac_get_otp_info;
>>>>> +     mtd->_read_user_prot_reg = macronix_30lfxg18ac_read_otp;
>>>>> +     mtd->_write_user_prot_reg = macronix_30lfxg18ac_write_otp;
>>>>> +     mtd->_lock_user_prot_reg = macronix_30lfxg18ac_lock_otp;
>>>>> +}
>>>>> +
>>>>>  static int macronix_nand_init(struct nand_chip *chip)
>>>>>  {
>>>>>       if (nand_is_slc(chip))
>>>>> @@ -325,6 +540,7 @@ static int macronix_nand_init(struct nand_chip *chip)
>>>>>       macronix_nand_onfi_init(chip);
>>>>>       macronix_nand_block_protection_support(chip);
>>>>>       macronix_nand_deep_power_down_support(chip);
>>>>> +     macronix_nand_setup_otp(chip);
>>>>>
>>>>>       return 0;
>>>>>  }  
>>>>
>>>>
>>>> Thanks,
>>>> Miquèl  
>>>
>>> Thanks
>>> Jaime
>>
>>
