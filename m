Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37654B450EF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 10:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDFF10E2C6;
	Fri,  5 Sep 2025 08:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w+TgAGwk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C7910E2C6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 08:11:00 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b042cc39551so331843066b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 01:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757059858; x=1757664658; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Zz6Rli852+E57Xb1OtusCkS/s2klQ3qQ9t0BaUg2mCo=;
 b=w+TgAGwkKY3xZYf0ad8F2LJjlh/ubnMbMCtShTH9Y5S1HnwliKSjq/0HplYaK0Sr/I
 IDKpYKBlH3fnL4Z4rAIRDRMb15hEX5J1JAI7X7LslOtEqcDZ1sv6xwb7zG414jbW+hsd
 iNhqyZr4Ou7sn8OapfDl83XD0RY1790ppQ5sI6bO1FcuUGxVrNQUwHX4tSt2jPWH5O89
 qt35sYFTrjktTmZl4tez+7MeG7/FM9flw5tMrB+JldVE52no69Rh+QVvmY9yecZtNd7j
 Teue09WSS1P44ojj5YtK5qxwiNTMJXV+aS+agA9ZdnzyL59s2s/88PugfwjhjyC5bJ8Z
 BhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757059858; x=1757664658;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Zz6Rli852+E57Xb1OtusCkS/s2klQ3qQ9t0BaUg2mCo=;
 b=w0vPCAFpFJvBzdleo8qjavc3nztkgnq6ek9ewjIi3U1SI/qUrtaAEGQmp01h6K2bIx
 1H2h1koFv8cmwusMNHdBlx7OmmVPB9PLt1qvJLLklrMR9UMzPiGa8y+3TgpRevM5RStF
 U73LSAJLuaEisBNrbUU38PXLxQe2pluFlIcNoq4BjVN1/H3EW7gGkD8qSrRcydJzay5Y
 FhvtV4PiZqBUhz0yc9wYcnYeCZ31nyj6BvYrap3xCanNy6upTRLBvHqZLyfrJwNJ1FIH
 RPYLTvmnAraS+GIwYlfJfCwqgBf0o0tI7RbRrSoO4Poaa4jCZBxeCjk6P//hu/G8uGfQ
 hWvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiuyC3+MS0gVO3gDqZtgbStBVNYwIiE8P3XqeWv+tE0SKGKY4JjYN46isfC5ZLWr03ooU7m/UVK7c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfgpcCyPhHe5dd+mag4ZLGYCpO4xV6iJ0UbBee7xx7GzNX78GH
 6c1rP/nL3cBFxcoawcBNXrZZ4b87ty+9hP1ESSqvVI9+Z4n1M+bbz9uOaFRgLBh9YTY=
X-Gm-Gg: ASbGncvnCHXEmcFOPewMvot9bwHkBA0oejujjoZp+jUHYG1Xub8lcKcA5mKj6drYduR
 IHNpBqQbjpx+Tq8YeV9i8U8/eWVzTFrSoEtR3bMrA/aqSoreQu1ojwhB80E42PvfyvIm3kv78co
 lZfXS6HpHvYpNDMx55ICXpdUVHhdVaDywVZZJvcKyks1T1oR3Bo+aFB3jDD9uLdDNGR3lHmcRa7
 6hNKO8OY6qdLiZpL6Vsiks0qx8UMf31kWT2hLgmWO1vwyr6OeKtRdGtPYJ8YgL3waxRjd036VkQ
 5w/gSfYnuGfiD/s9QFOs9jOCuUfWI0N0pIf+SaL1WMzW+aMEzszKpqIqpwgWobc2DsimzyY32xY
 yglw+2oh96ZHC6MDOQPD21kes9hHH9kogNHJslbW4sTlR
X-Google-Smtp-Source: AGHT+IF3k87mdBR0Ez9/1/dRG4I71sHxto4CLHGQRw7CwiEkLVRQz60o0+uLCZOaFI/tA/JEAuA/Tg==
X-Received: by 2002:a17:907:971e:b0:b04:4429:898a with SMTP id
 a640c23a62f3a-b0444298eccmr1681295366b.56.1757059858097; 
 Fri, 05 Sep 2025 01:10:58 -0700 (PDT)
Received: from [192.168.7.190] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff0cb2cb07sm1677476566b.16.2025.09.05.01.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 01:10:57 -0700 (PDT)
Message-ID: <d3e3b838-26fa-491e-8c4f-63a1693f2391@linaro.org>
Date: Fri, 5 Sep 2025 10:10:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 2/2] This patch adds a new DRM bridge driver for the
 Lontium LT9611C chip.
To: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: syyang <syyang@lontium.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 xmzhu@lontium.com, llzhang@lontium.com, rly@lontium.com
References: <20250903123825.1721443-1-syyang@lontium.com>
 <20250903123825.1721443-3-syyang@lontium.com>
 <24rahlm4kkob7knapdxxnjixye3khx3nv2425y4kkirat4lmam@gjey7zqsnzks>
 <CAFQXuNZUfAJe4QEDfi+-1N99xO0_z5_Omnsn_-SXr2QPtvdL_g@mail.gmail.com>
 <7cyypk5j7o5fglmibshg45iysffpdl75m6rqvv4b5zntfevhiz@zlt7ybuzkvrg>
 <CAFQXuNb+Eq6KPFvsnmGvn7KKjn4WRtMy1x4pn4ZvZoQ-_S_fYQ@mail.gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <CAFQXuNb+Eq6KPFvsnmGvn7KKjn4WRtMy1x4pn4ZvZoQ-_S_fYQ@mail.gmail.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

First, thanks for submitting a driver for this bridge, it's highly appreciated
vendors makes this effort.

On 05/09/2025 04:55, 杨孙运 wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年9月4日周四 22:39写道：
> 
>>
>> On Thu, Sep 04, 2025 at 06:48:13PM +0800, 杨孙运 wrote:
>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年9月4日周四 10:52写道：
>>>>
>>>> On Wed, Sep 03, 2025 at 05:38:25AM -0700, syyang wrote:
>>>>> The following changes are included:
>>>>>
>>>>> - Updated Kconfig and Makefile to include the new driver
>>>>> - Implementation of the bridge driver at
>>>>>    drivers/gpu/drm/bridge/lontium-lt9611c.c
>>>>
>>>> This is really not interesting, it can be seen from the patch itself.
>>>> Please read Documentation/process/submitting-patches.rst.
>>>>
>>> Sorry,  I will study submitting-patches.rst.
>>>

If you're unsure about the quality and acceptability of your patch,
please submit them as RFC.

If you have questions, you can discuss on IRC with linux developers
on OFTC #dri-devel for example.

<snip>

>>>>> +
>>>>> +static unsigned int bits_reverse(u32 in_val, u8 bits)
>>>>> +{
>>>>> +     u32 out_val = 0;
>>>>> +     u8 i;
>>>>> +
>>>>> +     for (i = 0; i < bits; i++) {
>>>>> +             if (in_val & (1 << i))
>>>>> +                     out_val |= 1 << (bits - 1 - i);
>>>>> +     }
>>>>> +
>>>>> +     return out_val;
>>>>> +}
>>>>> +
>>>>> +static unsigned int get_crc(struct crc_info type, const u8 *buf, u64 buf_len)
>>>>
>>>> Use library functions for that.
>>>>
>>>
>>> I'm not sure whether the algorithms in the llibrary functions are
>>> consistent with those designed in our chip.
>>> If either of them changes, it will cause the firmware updated to the
>>> chip to fail to run.
>>
>> CRC polynoms don't change that easily
>>
>>> I think it's safer to implement it using our own code.
>>
>> No, it's not.
>>
> If we calculate CRC_1 using the library function and then burn it
> together with the firmware into the chip, when the chip boot, it will
> use the internal hardware to calculate the firmware CRC_2.
> If CRC_1 is not equal to CRC_2, the chip will fail to boot. The
> library function will not be changed. I'm worried that the algorithm
> in our chip's hardware is different from the library function. I'll
> research it.

We very well know how checksum checking works, Linux has pretty solid
CRC library functions that can accomodate any polynomial & init values.

Please look at source/include/linux/crc8.h and use them accordingly.

If some changes would still be needed to generate the required CRC
then the library functions should be updated.

> 
>>> I'll check it.
>>>
>>>>> +{
>>>>> +     u8 width = type.width;
>>>>> +     u32 poly = type.poly;
>>>>> +     u32 crc = type.crc_init;
>>>>> +     u32 xorout = type.xor_out;
>>>>> +     bool refin = type.refin;
>>>>> +     bool refout = type.refout;
>>>>> +     u8 n;
>>>>> +     u32 bits;
>>>>> +     u32 data;
>>>>> +     u8 i;
>>>>> +
>>>>> +     n = (width < 8) ? 0 : (width - 8);
>>>>> +     crc = (width < 8) ? (crc << (8 - width)) : crc;
>>>>> +     bits = (width < 8) ? 0x80 : (1 << (width - 1));
>>>>> +     poly = (width < 8) ? (poly << (8 - width)) : poly;
>>>>> +     while (buf_len--) {
>>>>> +             data = *(buf++);
>>>>> +             if (refin)
>>>>> +                     data = bits_reverse(data, 8);
>>>>> +             crc ^= (data << n);
>>>>> +             for (i = 0; i < 8; i++) {
>>>>> +                     if (crc & bits)
>>>>> +                             crc = (crc << 1) ^ poly;
>>>>> +                     else
>>>>> +                             crc = crc << 1;
>>>>> +             }
>>>>> +     }
>>>>> +     crc = (width < 8) ? (crc >> (8 - width)) : crc;
>>>>> +     if (refout)
>>>>> +             crc = bits_reverse(crc, width);
>>>>> +     crc ^= xorout;
>>>>> +
>>>>> +     return (crc & ((2 << (width - 1)) - 1));
>>>>> +}
>>>>> +
>>>>> +static u8 calculate_crc(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     struct crc_info type = {
>>>>> +             .width = 8,
>>>>> +             .poly = 0x31,
>>>>> +             .crc_init = 0,
>>>>> +             .xor_out = 0,
>>>>> +             .refout = false,
>>>>> +             .refin = false,
>>>>> +     };
>>>>> +     const u8 *upgrade_data;
>>>>> +     u64 len;
>>>>> +     u64 crc_size = FW_SIZE - 1;
>>>>> +     u8 default_val = 0xFF;
>>>>> +
>>>>> +     if (!lt9611c->fw || !lt9611c->fw->data || lt9611c->fw->size == 0) {
>>>>> +             dev_err(lt9611c->dev, "firmware data not available for CRC\n");
>>>>> +             return 0;
>>>>> +     }
>>>>> +
>>>>> +     upgrade_data = lt9611c->fw->data;
>>>>> +     len = lt9611c->fw->size;
>>>>> +
>>>>> +     type.crc_init = get_crc(type, upgrade_data, len);
>>>>> +
>>>>> +     crc_size -= len;
>>>>> +     while (crc_size--)
>>>>> +             type.crc_init = get_crc(type, &default_val, 1);
>>>>> +
>>>>> +     return type.crc_init;
>>>>> +}
>>>>> +
>>>>> +static int i2c_write_byte(struct lt9611c *lt9611c, u8 reg, u8 val)
>>>>> +{
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     int ret = 0;
>>>>> +
>>>>> +     ret = regmap_write(lt9611c->regmap, reg, val);
>>>>> +     if (ret < 0) {
>>>>> +             dev_err(dev,
>>>>> +                     "regmap_write error: i2c addr=0x%02x, reg addr=0x%02x, error=%d",
>>>>> +                     lt9611c->client->addr, reg, ret);
>>>>> +     }
>>>>> +
>>>>> +     return ret;
>>>>> +}
>>>>> +
>>>>> +static int i2c_read_byte(struct lt9611c *lt9611c, u8 reg, u8 *val)
>>>>
>>>> Drop these two wrappers, they provide no extra functionality.
>>>>
>>>
>>> I will consider fixing this issue. thanks.

Please avoid dead code and useless wrappers, and make debug code as minimal
as possible and print only when strictly needed, and consider using _dbg
prints.

>>>
>>>>> +{
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     int ret = 0;
>>>>> +     unsigned int tmp;
>>>>> +
>>>>> +     if (!val)
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     ret = regmap_read(lt9611c->regmap, reg, &tmp);
>>>>> +     if (ret < 0) {
>>>>> +             dev_err(dev,
>>>>> +                     "regmap_read error: i2c addr=0x%02x, reg addr=0x%02x, error=%d",
>>>>> +                     lt9611c->client->addr, reg, ret);
>>>>> +
>>>>> +             return ret;
>>>>> +     }
>>>>> +
>>>>> +     *val = (u8)tmp;
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static int i2c_read_write_flow(struct lt9611c *lt9611c, u8 *params,
>>>>> +                            unsigned int param_count, u8 *return_buffer,
>>>>> +                            unsigned int return_count)
>>>>> +{
>>>>> +     int count, i;
>>>>> +     u8 temp;
>>>>> +
>>>>> +     i2c_write_byte(lt9611c, 0xFF, 0xE0);
>>>>> +     i2c_write_byte(lt9611c, 0xDE, 0x01);
>>>>
>>>> - lowercase all hex values
>>>
>>> i will fix , thanks.
>>>
>>>> - use paged writes as implemented for LT9611 and LT9611UXC
>>>>
>>> Don't understand.
>>
>> Use 16-bit addressing as done by those two drivers. This way 0xff
>> becomes a page switch.
>>
> i will research it.

Regmap supports page switching internally, check out how the other lontium drivers are designed.

> 
>>>
>>>>> +
>>>>> +     count = 0;
>>>>> +     do {
>>>>> +             i2c_read_byte(lt9611c, 0xAE, &temp);
>>>>> +             usleep_range(1000, 2000);
>>>>> +             count++;
>>>>> +     } while (count < 100 && temp != 0x01);
>>>>> +
>>>>> +     if (temp != 0x01)
>>>>> +             return -1;
>>>>> +
>>>>> +     for (i = 0; i < param_count; i++) {
>>>>> +             if (i > 0xDD - 0xB0)
>>>>> +                     break;
>>>>> +
>>>>> +             i2c_write_byte(lt9611c, 0xB0 + i, params[i]);
>>>>> +     }
>>>>> +
>>>>> +     i2c_write_byte(lt9611c, 0xDE, 0x02);
>>>>> +
>>>>> +     count = 0;
>>>>> +     do {
>>>>> +             i2c_read_byte(lt9611c, 0xAE, &temp);
>>>>> +             usleep_range(1000, 2000);
>>>>> +             count++;
>>>>> +     } while (count < 100 && temp != 0x02);
>>>>> +
>>>>> +     if (temp != 0x02)
>>>>> +             return -2;
>>>>> +
>>>>> +     for (i = 0; i < return_count; i++)
>>>>> +             i2c_read_byte(lt9611c, 0x85 + i, &return_buffer[i]);
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_prepare_firmware_data(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     int ret;
>>>>> +
>>>>> +     /* ensure filesystem ready */
>>>>> +     msleep(3000);
>>>>
>>>> No. If the firmware is necessary and it's not ready, return
>>>> -EPROBE_DEFER.
>>>>
>>> The firmware is unnecessary . This part of the code is for customers
>>> who need to upgrade the chip firmware.
>>>
>>> Due to the different designs of the platform, the firmware used by
>>> each customer may be different.
>>
>> Well... That's a very bad way to go. We have had this issue with
>> LT9611UXC at one of my previous jobs. Our customers have had various
>> kinds of issues because of the wrong firmware.
>>
>> Please provide some reference, which works in a DSI-to-HDMI case and
>> make it _tunable_ rather than requiring to replace the firmware
>> completely.
>>
> i will research it.
> Yes, you worked together with my colleagues to handle the issue of
> LT9611UXC. (At that time, you used dmitry.baryshkov@linaro.org)
> 
>>>
>>> Therefore, when they need to update the firmware, they only need to
>>> compile the firmware into the /lib/firmware directory during the
>>> compilation
>>> process, and then burn the image into the platform.
>>>
>>> Once reboot platform, the firmware upgrade can be automatically completed.
>>
>> The firmware upgrade must be triggered by user, unless the FW is
>> completely empty.
>>
> Is it necessary for the authorities to insist on doing so?

If by authorities you mean the DRM Bridge Maintainers, then since I'm one
of the maintainers yes I insist you follow this scheme.

But as Dmitry said, if the bridge can work nominally without a firmware upgrade
then it's simpler to add the firmware update in a second time.

> 
>>>
>>> When there is no need to upgrade the firmware, this part of the code
>>> will not affect the operation of the driver.
>>>
>>>>> +     ret = request_firmware(&lt9611c->fw, FW_FILE, dev);
>>>>> +     if (ret) {
>>>>> +             dev_err(dev, "failed load file '%s', error type %d\n", FW_FILE, ret);
>>>>> +             return ret;
>>>>> +     }
>>>>> +
>>>>> +     if (lt9611c->fw->size > FW_SIZE - 1) {
>>>>> +             dev_err(dev, "firmware too large (%zu > %d)\n", lt9611c->fw->size, FW_SIZE - 1);
>>>>> +             lt9611c->fw = NULL;
>>>>> +             return -EINVAL;
>>>>> +     }
>>>>> +
>>>>> +     dev_info(dev, "firmware size: %zu bytes\n", lt9611c->fw->size);
>>>>> +
>>>>> +     lt9611c->fw_crc = calculate_crc(lt9611c);
>>>>> +
>>>>> +     dev_info(dev, "LT9611C.bin crc: 0x%02X\n", lt9611c->fw_crc);
>>>>
>>>> No spamming with the unnecessary info. If you want, print the version
>>>> of the firmware.
>>>>
>>> i will fix, thanks
>>>
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static void lt9611c_config_parameters(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     i2c_write_byte(lt9611c, 0xFF, 0xE0);
>>>>> +     i2c_write_byte(lt9611c, 0xEE, 0x01);
>>>>> +     //fifo_rst_n
>>>>> +     i2c_write_byte(lt9611c, 0xFF, 0xE1);
>>>>> +     i2c_write_byte(lt9611c, 0x03, 0x3F);
>>>>> +     i2c_write_byte(lt9611c, 0x03, 0xFF);
>>>>> +
>>>>> +     i2c_write_byte(lt9611c, 0xFF, 0xE0);
>>>>> +     i2c_write_byte(lt9611c, 0x5E, 0xC1);
>>>>> +     i2c_write_byte(lt9611c, 0x58, 0x00);
>>>>> +     i2c_write_byte(lt9611c, 0x59, 0x50);
>>>>> +     i2c_write_byte(lt9611c, 0x5A, 0x10);
>>>>> +     i2c_write_byte(lt9611c, 0x5A, 0x00);
>>>>> +     i2c_write_byte(lt9611c, 0x58, 0x21);
>>>>> +}
>>>>> +
>>>>> +static void lt9611c_flash_to_fifo(struct lt9611c *lt9611c, u64 addr)
>>>>> +{
>>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
>>>>> +     i2c_write_byte(lt9611c, 0x5e, 0x5f);
>>>>> +     i2c_write_byte(lt9611c, 0x5a, 0x20);
>>>>> +     i2c_write_byte(lt9611c, 0x5a, 0x00);
>>>>> +     i2c_write_byte(lt9611c, 0x5b, ((addr & 0xFF0000) >> 16));
>>>>> +     i2c_write_byte(lt9611c, 0x5c, ((addr & 0xFF00) >> 8));
>>>>> +     i2c_write_byte(lt9611c, 0x5d, (addr & 0xFF));
>>>>> +     i2c_write_byte(lt9611c, 0x5a, 0x10);
>>>>> +     i2c_write_byte(lt9611c, 0x5a, 0x00);
>>>>> +}
>>>>> +
>>>>> +static void lt9611c_wren(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
>>>>> +     i2c_write_byte(lt9611c, 0x5a, 0x04);
>>>>> +     i2c_write_byte(lt9611c, 0x5a, 0x00);
>>>>> +}
>>>>> +
>>>>> +static void lt9611c_wrdi(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     i2c_write_byte(lt9611c, 0xFF, 0xE0);
>>>>> +     i2c_write_byte(lt9611c, 0x5A, 0x08);
>>>>> +     i2c_write_byte(lt9611c, 0x5A, 0x00);
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_upgrade_judgment(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     int ret;
>>>>> +     u8 flash_crc;
>>>>> +
>>>>> +     if (!lt9611c)
>>>>> +             return -EINVAL;
>>>>
>>>> How can it be NULL here?
>>>>
>>> i will fix, thanks
>>>
>>>>> +
>>>>> +     lt9611c_config_parameters(lt9611c);
>>>>> +     lt9611c_flash_to_fifo(lt9611c, FW_SIZE - 1);
>>>>> +     i2c_write_byte(lt9611c, 0x58, 0x21);
>>>>> +
>>>>> +     ret = i2c_read_byte(lt9611c, 0x5f, &flash_crc);
>>>>> +     if (ret < 0) {
>>>>> +             dev_err(dev, "failed to read flash crc\n");
>>>>> +             return ret;
>>>>> +     }
>>>>> +
>>>>> +     dev_info(dev, "flash firmware crc=0x%02X, expected crc=0x%02X",
>>>>> +              flash_crc, lt9611c->fw_crc);
>>>>
>>>> dev_dbg()
>>>>
>>> i will fix, thanks
>>>
>>>>> +
>>>>> +     lt9611c_wrdi(lt9611c);
>>>>> +
>>>>> +     return (flash_crc == lt9611c->fw_crc) ? NOT_UPGRADE : UPGRADE;
>>>>> +}
>>>>> +
>>>>> +static int read_flash_reg_status(struct lt9611c *lt9611c, u8 *status)
>>>>> +{
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     int ret;
>>>>> +
>>>>> +     //fifo_rst_n
>>>>> +     i2c_write_byte(lt9611c, 0xFF, 0xE1);
>>>>> +     i2c_write_byte(lt9611c, 0x03, 0x3F);
>>>>> +     i2c_write_byte(lt9611c, 0x03, 0xFF);
>>>>> +
>>>>> +     i2c_write_byte(lt9611c, 0xFF, 0xE0);
>>>>> +     i2c_write_byte(lt9611c, 0x5e, 0x40);
>>>>> +     i2c_write_byte(lt9611c, 0x56, 0x05);
>>>>> +     i2c_write_byte(lt9611c, 0x55, 0x25);
>>>>> +     i2c_write_byte(lt9611c, 0x55, 0x01);
>>>>> +     i2c_write_byte(lt9611c, 0x58, 0x21);
>>>>> +
>>>>> +     ret = i2c_read_byte(lt9611c, 0x5f, status);
>>>>> +     if (ret < 0)
>>>>> +             dev_err(dev, "failed to read flash register status\n");
>>>>> +
>>>>> +     return ret;
>>>>> +}
>>>>> +
>>>>> +static void lt9611c_block_erase(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     u32 i = 0;
>>>>> +     u8 flash_status = 0;
>>>>> +     u8 block_num = 0x00;
>>>>> +     u32 flash_addr = 0x00;
>>>>> +
>>>>> +     for (block_num = 0; block_num < 2; block_num++) {
>>>>> +             flash_addr = (block_num * 0x008000);
>>>>> +             i2c_write_byte(lt9611c, 0xFF, 0xE0);
>>>>> +             i2c_write_byte(lt9611c, 0xEE, 0x01);
>>>>> +             i2c_write_byte(lt9611c, 0x5A, 0x04);
>>>>> +             i2c_write_byte(lt9611c, 0x5A, 0x00);
>>>>> +             i2c_write_byte(lt9611c, 0x5B, flash_addr >> 16);
>>>>> +             i2c_write_byte(lt9611c, 0x5C, flash_addr >> 8);
>>>>> +             i2c_write_byte(lt9611c, 0x5D, flash_addr);
>>>>> +             i2c_write_byte(lt9611c, 0x5A, 0x01);
>>>>> +             i2c_write_byte(lt9611c, 0x5A, 0x00);
>>>>> +             msleep(100);
>>>>> +             i = 0;
>>>>> +             while (1) {
>>>>> +                     read_flash_reg_status(lt9611c, &flash_status);
>>>>> +                     if ((flash_status & 0x01) == 0)
>>>>> +                             break;
>>>>> +
>>>>> +                     if (i > 50)
>>>>> +                             break;
>>>>> +
>>>>> +                     i++;
>>>>> +                     msleep(50);
>>>>> +             }
>>>>> +     }
>>>>> +
>>>>> +     dev_info(dev, "erase flash done.\n");
>>>>> +}
>>>>> +
>>>>> +static void lt9611c_crc_to_sram(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
>>>>> +     i2c_write_byte(lt9611c, 0x51, 0x00);
>>>>> +     i2c_write_byte(lt9611c, 0x55, 0xc0);
>>>>> +     i2c_write_byte(lt9611c, 0x55, 0x80);
>>>>> +     i2c_write_byte(lt9611c, 0x5e, 0xc0);
>>>>> +     i2c_write_byte(lt9611c, 0x58, 0x21);
>>>>> +}
>>>>> +
>>>>> +static void lt9611c_data_to_sram(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
>>>>> +     i2c_write_byte(lt9611c, 0x51, 0xff);
>>>>> +     i2c_write_byte(lt9611c, 0x55, 0x80);
>>>>> +     i2c_write_byte(lt9611c, 0x5e, 0xc0);
>>>>> +     i2c_write_byte(lt9611c, 0x58, 0x21);
>>>>> +}
>>>>> +
>>>>> +static void lt9611c_sram_to_flash(struct lt9611c *lt9611c, u64 addr)
>>>>> +{
>>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
>>>>> +     i2c_write_byte(lt9611c, 0x5b, ((addr & 0xFF0000) >> 16));
>>>>> +     i2c_write_byte(lt9611c, 0x5c, ((addr & 0xFF00) >> 8));
>>>>> +     i2c_write_byte(lt9611c, 0x5d, (addr & 0xFF));
>>>>> +     i2c_write_byte(lt9611c, 0x5A, 0x30);
>>>>> +     i2c_write_byte(lt9611c, 0x5A, 0x00);
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_write_data(struct lt9611c *lt9611c, u64 addr)
>>>>> +{
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     int ret;
>>>>> +     int page = 0, num = 0, i = 0;
>>>>> +     const u8 *data;
>>>>> +     u64 size, index;
>>>>> +     u8 value;
>>>>> +
>>>>> +     data = lt9611c->fw->data;
>>>>> +     size = lt9611c->fw->size;
>>>>> +
>>>>> +     page = (size + LT_PAGE_SIZE - 1) / LT_PAGE_SIZE;
>>>>> +
>>>>> +     if (page * LT_PAGE_SIZE > 64 * 1024) {
>>>>> +             dev_err(dev, "firmware size out of range\n");
>>>>> +             return -EINVAL;
>>>>> +     }
>>>>> +
>>>>> +     dev_info(dev, "%u pages, total size %llu byte\n", page, size);
>>>>
>>>>
>>>> dev_dbg()
>>>>
>>> i will fix, thanks
>>>
>>>>> +
>>>>> +     for (num = 0; num < page; num++) {
>>>>> +             lt9611c_data_to_sram(lt9611c);
>>>>> +
>>>>> +             for (i = 0; i < LT_PAGE_SIZE; i++) {
>>>>> +                     index = num * LT_PAGE_SIZE + i;
>>>>> +                     value = (index < size) ? data[index] : 0xFF;
>>>>> +
>>>>> +                     ret = i2c_write_byte(lt9611c, 0x59, value);
>>>>> +                     if (ret < 0) {
>>>>> +                             dev_err(dev, "write error at page %u, index %u\n", num, i);
>>>>> +                             return ret;
>>>>> +                     }
>>>>> +             }
>>>>> +
>>>>> +             lt9611c_wren(lt9611c);
>>>>> +             lt9611c_sram_to_flash(lt9611c, addr);
>>>>> +
>>>>> +             addr += LT_PAGE_SIZE;
>>>>> +     }
>>>>> +
>>>>> +     lt9611c_wrdi(lt9611c);
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_write_crc(struct lt9611c *lt9611c, u64 addr)
>>>>> +{
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     int ret;
>>>>> +     u8 crc;
>>>>> +
>>>>> +     crc = lt9611c->fw_crc;
>>>>> +     lt9611c_crc_to_sram(lt9611c);
>>>>> +     ret = i2c_write_byte(lt9611c, 0x59, crc);
>>>>> +     if (ret < 0) {
>>>>> +             dev_err(dev, "failed to write CRC\n");
>>>>> +             return -1;
>>>>> +     }
>>>>> +
>>>>> +     lt9611c_wren(lt9611c);
>>>>> +     lt9611c_sram_to_flash(lt9611c, addr);
>>>>> +     lt9611c_wrdi(lt9611c);
>>>>> +
>>>>> +     dev_info(dev, "CRC 0x%02X written to flash at addr 0x%llX\n", crc, addr);
>>>>
>>>> dev_dbg
>>>>
>>> i will fix, thanks
>>>
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_firmware_upgrade(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     int ret;
>>>>> +
>>>>> +     dev_info(dev, "starting firmware upgrade, size: %zu bytes\n", lt9611c->fw->size);
>>>>
>>>> dev_dbg
>>>>
>>> i will fix, thanks
>>>
>>>>> +
>>>>> +     lt9611c_config_parameters(lt9611c);
>>>>> +     lt9611c_block_erase(lt9611c);
>>>>> +
>>>>> +     ret = lt9611c_write_data(lt9611c, 0);
>>>>> +     if (ret < 0) {
>>>>> +             dev_err(dev, "Failed to write firmware data\n");
>>>>> +             return ret;
>>>>> +     }
>>>>> +
>>>>> +     ret = lt9611c_write_crc(lt9611c, FW_SIZE - 1);
>>>>> +     if (ret < 0) {
>>>>> +             dev_err(dev, "Failed to write firmware CRC\n");
>>>>> +             return ret;
>>>>> +     }
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_upgrade_result(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     u8 crc_result;
>>>>> +
>>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
>>>>> +     i2c_write_byte(lt9611c, 0xee, 0x01);
>>>>> +     i2c_read_byte(lt9611c, 0x21, &crc_result);
>>>>> +
>>>>> +     if (crc_result == lt9611c->fw_crc) {
>>>>> +             dev_info(dev, "LT9611C firmware upgrade success, CRC=0x%02X\n", crc_result);
>>>>
>>>> dev_dbg
>>>>
>>> i will fix, thanks
>>>
>>>>> +             return 0;
>>>>> +     }
>>>>> +
>>>>> +     dev_err(dev, "LT9611C firmware upgrade failed, expected CRC=0x%02X, read CRC=0x%02X\n",
>>>>> +             lt9611c->fw_crc, crc_result);
>>>>> +     return -EIO;
>>>>> +}
>>>>> +
>>>>> +static struct lt9611c *bridge_to_lt9611c(struct drm_bridge *bridge)
>>>>> +{
>>>>> +     return container_of(bridge, struct lt9611c, bridge);
>>>>> +}
>>>>> +
>>>>> +static void lt9611c_lock(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     mutex_lock(&lt9611c->ocm_lock);
>>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
>>>>> +     i2c_write_byte(lt9611c, 0xee, 0x01);
>>>>> +}
>>>>> +
>>>>> +static void lt9611c_unlock(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
>>>>> +     i2c_write_byte(lt9611c, 0xee, 0x00);
>>>>> +     mutex_unlock(&lt9611c->ocm_lock);
>>>>> +}
>>>>> +
>>>>> +static irqreturn_t lt9611c_irq_thread_handler(int irq, void *dev_id)
>>>>> +{
>>>>> +     struct lt9611c *lt9611c = dev_id;
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     int ret;
>>>>> +     u8 irq_status;
>>>>> +     u8 cmd[5] = {0x52, 0x48, 0x31, 0x3a, 0x00};
>>>>> +     u8 data[5];
>>>>> +
>>>>> +     mutex_lock(&lt9611c->ocm_lock);
>>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
>>>>> +     i2c_read_byte(lt9611c, 0x84, &irq_status);
>>>>> +
>>>>> +     if (!(irq_status & BIT(0))) {
>>>>> +             mutex_unlock(&lt9611c->ocm_lock);
>>>>> +             return IRQ_HANDLED;
>>>>> +     }
>>>>> +     dev_info(dev, "HPD interrupt triggered.\n");
>>>>
>>>> Nice joke. dev_dbg().
>>>>
>>> i will fix, thanks
>>>
>>>>> +
>>>>> +     i2c_write_byte(lt9611c, 0xdf, irq_status & BIT(0));
>>>>> +     usleep_range(10000, 12000);
>>>>
>>>> Why?
>>>>
>>> Our chip design specification requires that this be done when clearing
>>> the interrupt.
>>
>> Add a comment.
>>
> i will add comment, thks
> 
>>>
>>>>> +     i2c_write_byte(lt9611c, 0xdf, irq_status & (~BIT(0)));
>>>>> +
>>>>> +     ret = i2c_read_write_flow(lt9611c, cmd, 5, data, 5);
>>>>> +     if (ret) {
>>>>> +             dev_err(dev, "failed to read HPD status\n");
>>>>> +     } else {
>>>>> +             lt9611c->hdmi_connected = (data[4] == 0x02);
>>>>> +             dev_info(dev, "HDMI %s\n", lt9611c->hdmi_connected ? "connected" : "disconnected");
>>>>
>>>> dev_dbg()
>>>>
>>> i will fix, thanks
>>>
>>>>> +     }
>>>>> +
>>>>> +     lt9611c->audio_status = lt9611c->hdmi_connected ?
>>>>> +                     connector_status_connected :
>>>>> +                     connector_status_disconnected;
>>>>
>>>> What is it being used for? Why do you need separate status for audio?
>>>>
>>> Used to update the connection status of the audio.
>>> The separate status indicators make it clearer for the readers.
>>>
>>>>> +
>>>>> +     schedule_work(&lt9611c->work);
>>>>> +
>>>>> +     mutex_unlock(&lt9611c->ocm_lock);
>>>>> +
>>>>> +     return IRQ_HANDLED;
>>>>> +}
>>>>> +
>>>>> +static void lt9611c_hpd_work(struct work_struct *work)
>>>>> +{
>>>>> +     struct lt9611c *lt9611c = container_of(work, struct lt9611c, work);
>>>>> +     bool connected;
>>>>> +
>>>>> +     mutex_lock(&lt9611c->ocm_lock);
>>>>> +     connected = lt9611c->hdmi_connected;
>>>>> +     mutex_unlock(&lt9611c->ocm_lock);
>>>>> +
>>>>> +     drm_bridge_hpd_notify(&lt9611c->bridge,
>>>>> +                           connected ?
>>>>> +                      connector_status_connected :
>>>>> +                      connector_status_disconnected);
>>>>
>>>> Incorrect indentation.
>>>>
>>> ?   The checkpatch.pl did not detect it.
>>
>> use --strict.
>>
> i will , thks
> 
>>>
>>>>> +
>>>>> +     lt9611c_audio_update_connector_status(lt9611c);
>>>>> +}
>>>>> +
>>>>> +static void lt9611c_reset(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
>>>>> +     msleep(20);
>>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
>>>>> +     msleep(20);
>>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
>>>>> +     msleep(400);
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_regulator_init(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     int ret;
>>>>> +
>>>>> +     lt9611c->supplies[0].supply = "vcc";
>>>>> +     lt9611c->supplies[1].supply = "vdd";
>>>>> +
>>>>> +     ret = devm_regulator_bulk_get(dev, 2, lt9611c->supplies);
>>>>> +
>>>>> +     return ret;
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_regulator_enable(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     int ret;
>>>>> +
>>>>> +     ret = regulator_enable(lt9611c->supplies[0].consumer);
>>>>> +     if (ret < 0)
>>>>> +             return ret;
>>>>> +
>>>>> +     usleep_range(5000, 10000);
>>>>> +
>>>>> +     ret = regulator_enable(lt9611c->supplies[1].consumer);
>>>>> +     if (ret < 0) {
>>>>> +             regulator_disable(lt9611c->supplies[0].consumer);
>>>>> +             return ret;
>>>>> +     }
>>>>> +
>>>>> +     return ret;
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_regulator_disable(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     int ret;
>>>>> +
>>>>> +     ret = regulator_disable(lt9611c->supplies[0].consumer);
>>>>> +     if (ret < 0)
>>>>> +             return ret;
>>>>> +
>>>>> +     usleep_range(5000, 10000);
>>>>> +
>>>>> +     ret = regulator_disable(lt9611c->supplies[1].consumer);
>>>>> +     if (ret < 0)
>>>>> +             return ret;
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static struct mipi_dsi_device *lt9611c_attach_dsi(struct lt9611c *lt9611c,
>>>>> +                                               struct device_node *dsi_node)
>>>>> +{
>>>>> +     const struct mipi_dsi_device_info info = { "lt9611c", 0, NULL };
>>>>> +     struct mipi_dsi_device *dsi;
>>>>> +     struct mipi_dsi_host *host;
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     int ret;
>>>>> +
>>>>> +     host = of_find_mipi_dsi_host_by_node(dsi_node);
>>>>> +     if (!host)
>>>>> +             return ERR_PTR(dev_err_probe(dev, -EPROBE_DEFER, "failed to find dsi host\n"));
>>>>> +
>>>>> +     dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
>>>>> +     if (IS_ERR(dsi)) {
>>>>> +             dev_err(dev, "failed to create dsi device\n");
>>>>> +             return dsi;
>>>>> +     }
>>>>> +
>>>>> +     dsi->lanes = 4;
>>>>> +     dsi->format = MIPI_DSI_FMT_RGB888;
>>>>> +     dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
>>>>> +                      MIPI_DSI_MODE_VIDEO_HSE;
>>>>> +
>>>>> +     ret = devm_mipi_dsi_attach(dev, dsi);
>>>>> +     if (ret < 0) {
>>>>> +             dev_err(dev, "failed to attach dsi to host\n");
>>>>> +             return ERR_PTR(ret);
>>>>> +     }
>>>>> +
>>>>> +     return dsi;
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_bridge_attach(struct drm_bridge *bridge,
>>>>> +                              struct drm_encoder *encoder,
>>>>> +                              enum drm_bridge_attach_flags flags)
>>>>> +{
>>>>> +     struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
>>>>> +
>>>>> +     return drm_bridge_attach(encoder, lt9611c->next_bridge,
>>>>> +                              bridge, flags);
>>>>> +}
>>>>> +
>>>>> +static enum drm_mode_status lt9611c_bridge_mode_valid(struct drm_bridge *bridge,
>>>>> +                                                   const struct drm_display_info *info,
>>>>> +                      const struct drm_display_mode *mode)
>>>>> +{
>>>>> +     u32 pixclk;
>>>>> +
>>>>> +     pixclk = (mode->htotal * mode->vtotal * drm_mode_vrefresh(mode)) / 1000000;
>>>>> +
>>>>> +     if (pixclk >= 25 && pixclk <= 340)
>>>>
>>>> Use .hdmi_tmds_char_rate_valid() for that.
>>>>
>>> I will check and test, thanks
>>>
>>>>> +             return MODE_OK;
>>>>> +     else
>>>>> +             return MODE_BAD;
>>>>> +}
>>>>> +
>>>>> +static void lt9611c_bridge_mode_set(struct drm_bridge *bridge,
>>>>> +                                 const struct drm_display_mode *mode,
>>>>> +                              const struct drm_display_mode *adj_mode)
>>>>
>>>> - Wrong indentation
>>> will fix, thanks
>>>
>>>> - mode_set callback is deprecated and should not be used for new
>>>>    drivers.
>>>>
>>> I found that kernel 6.17 is still in use mode_set callback.
>>
>> Check the documentation in drm_bridge_funcs.
>>
> i will research.
> 
>>>
>>>>> +{
>>>>> +     struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     int ret;
>>>>> +     u32 h_total, hactive, hsync_len, hfront_porch, hback_porch;
>>>>> +     u32 v_total, vactive, vsync_len, vfront_porch, vback_porch;
>>>>> +     u8 video_timing_set_cmd[26] = {0x57, 0x4D, 0x33, 0x3A};
>>>>> +     u8 return_timing_set_param[3];
>>>>> +     u8 framerate;
>>>>> +     u8 vic = 0x00;
>>>>> +
>>>>
>>>>> +     hsync_len = mode->hsync_end - mode->hsync_start;
>>>>> +     hfront_porch = mode->hsync_start - mode->hdisplay;
>>>>> +     hback_porch = mode->htotal - mode->hsync_end;
>>>>> +
>>>>> +     v_total = mode->vtotal;
>>>>> +     vactive = mode->vdisplay;
>>>>> +     vsync_len = mode->vsync_end - mode->vsync_start;
>>>>> +     vfront_porch = mode->vsync_start - mode->vdisplay;
>>>>> +     vback_porch = mode->vtotal - mode->vsync_end;
>>>>> +     framerate = drm_mode_vrefresh(mode);
>>>>> +     vic = drm_match_cea_mode(mode);
>>>>> +
>>>>> +     dev_info(dev, "Out video info:\n");
>>>>> +     dev_info(dev,
>>>>> +              "h_total=%d, hactive=%d, hsync_len=%d, hfront_porch=%d, hback_porch=%d\n",
>>>>> +     h_total, hactive, hsync_len, hfront_porch, hback_porch);
>>>>> +     dev_info(dev,
>>>>> +              "v_total=%d, vactive=%d, vsync_len=%d, vfront_porch=%d, vback_porch=%d\n",
>>>>> +     v_total, vactive, vsync_len, vfront_porch, vback_porch);
>>>>
>>>>
>>>> Fix indentation
>>> The indentation issue was not detected by checkpatch.pl.
>>
>> The indentation issue is detected by the brain and eye.
>>
> sorry, i will research.
> 
>>>
>>>> Use dev_dbg / drm_dbg_kms() all over the driver. Your code is too
>>>> spammy.
>>>>
>>> i will fix, thanks
>>>
>>>>> +
>>>>> +     dev_info(dev, "framerate=%d\n", framerate);
>>>>> +     dev_info(dev, "vic = 0x%02X\n", vic);
>>>>> +
>>>>> +     video_timing_set_cmd[4] = (h_total >> 8) & 0xFF;
>>>>> +     video_timing_set_cmd[5] = h_total & 0xFF;
>>>>> +     video_timing_set_cmd[6] = (hactive >> 8) & 0xFF;
>>>>> +     video_timing_set_cmd[7] = hactive & 0xFF;
>>>>> +     video_timing_set_cmd[8] = (hfront_porch >> 8) & 0xFF;
>>>>> +     video_timing_set_cmd[9] = hfront_porch & 0xFF;
>>>>> +     video_timing_set_cmd[10] = (hsync_len >> 8) & 0xFF;
>>>>> +     video_timing_set_cmd[11] = hsync_len & 0xFF;
>>>>> +     video_timing_set_cmd[12] = (hback_porch >> 8) & 0xFF;
>>>>> +     video_timing_set_cmd[13] = hback_porch & 0xFF;
>>>>> +     video_timing_set_cmd[14] = (v_total >> 8) & 0xFF;
>>>>> +     video_timing_set_cmd[15] = v_total & 0xFF;
>>>>> +     video_timing_set_cmd[16] = (vactive >> 8) & 0xFF;
>>>>> +     video_timing_set_cmd[17] = vactive & 0xFF;
>>>>> +     video_timing_set_cmd[18] = (vfront_porch >> 8) & 0xFF;
>>>>> +     video_timing_set_cmd[19] = vfront_porch & 0xFF;
>>>>> +     video_timing_set_cmd[20] = (vsync_len >> 8) & 0xFF;
>>>>> +     video_timing_set_cmd[21] = vsync_len & 0xFF;
>>>>> +     video_timing_set_cmd[22] = (vback_porch >> 8) & 0xFF;
>>>>> +     video_timing_set_cmd[23] = vback_porch & 0xFF;
>>>>> +     video_timing_set_cmd[24] = framerate;
>>>>> +     video_timing_set_cmd[25] = vic;
>>>>> +
>>>>> +     mutex_lock(&lt9611c->ocm_lock);
>>>>> +     ret = i2c_read_write_flow(lt9611c, video_timing_set_cmd, 26, return_timing_set_param, 3);
>>>>> +     if (ret)
>>>>> +             dev_err(dev, "video set failed\n");
>>>>> +     mutex_unlock(&lt9611c->ocm_lock);
>>>>> +}
>>>>> +
>>>>> +static enum drm_connector_status lt9611c_bridge_detect(struct drm_bridge *bridge,
>>>>> +                                                    struct drm_connector *connector)
>>>>> +{
>>>>> +     struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     int ret;
>>>>> +     bool connected = false;
>>>>> +     u8 cmd[5] = {0x52, 0x48, 0x31, 0x3a, 0x00};
>>>>> +     u8 data[5];
>>>>> +
>>>>> +     mutex_lock(&lt9611c->ocm_lock);
>>>>> +     ret = i2c_read_write_flow(lt9611c, cmd, 5, data, 5);
>>>>> +     if (ret) {
>>>>> +             dev_err(dev, "Failed to read HPD status, cannot determine HDMI connection (err=%d)\n",
>>>>> +                     ret);
>>>>> +     } else {
>>>>> +             connected = (data[4] == 0x02);
>>>>> +     }
>>>>
>>>> THere is no need to put single-line statements in brackets. Drop those.
>>>>
>>> yes, i will fix, thks
>>>
>>>>> +
>>>>> +     lt9611c->hdmi_connected = connected;
>>>>> +
>>>>> +     if (lt9611c->hdmi_connected)
>>>>> +             lt9611c->audio_status = connector_status_connected;
>>>>> +     else
>>>>> +             lt9611c->audio_status = connector_status_disconnected;
>>>>> +
>>>>> +     mutex_unlock(&lt9611c->ocm_lock);
>>>>> +
>>>>> +     return connected ? connector_status_connected :
>>>>> +                             connector_status_disconnected;
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_read_edid(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     int ret, i, bytes_to_copy, offset = 0;
>>>>> +     u8 packets_num;
>>>>> +     u8 read_edid_data_cmd[5] = {0x52, 0x48, 0x33, 0x3A, 0x00};
>>>>> +     u8 return_edid_data[37];
>>>>> +     u8 read_edid_byte_num_cmd[5] = {0x52, 0x48, 0x32, 0x3A, 0x00};
>>>>> +     u8 return_edid_byte_num[6];
>>>>> +
>>>>> +     ret = i2c_read_write_flow(lt9611c, read_edid_byte_num_cmd, 5, return_edid_byte_num, 6);
>>>>> +     if (ret) {
>>>>> +             dev_err(dev, "Failed to read EDID byte number\n");
>>>>> +             lt9611c->edid_valid = false;
>>>>> +             return ret;
>>>>> +     }
>>>>> +
>>>>> +     lt9611c->edid_len = (return_edid_byte_num[4] << 8) | return_edid_byte_num[5];
>>>>> +
>>>>> +     if (!lt9611c->edid_buf || lt9611c->edid_len > (lt9611c->edid_valid ?
>>>>> +                             lt9611c->edid_len : 0)) {
>>>>> +             kfree(lt9611c->edid_buf);
>>>>> +             lt9611c->edid_buf = kzalloc(lt9611c->edid_len, GFP_KERNEL);
>>>>> +             if (!lt9611c->edid_buf) {
>>>>> +                     dev_err(dev, "Failed to allocate EDID buffer\n");
>>>>> +                     lt9611c->edid_len = 0;
>>>>> +                     lt9611c->edid_valid = false;
>>>>> +                     return -ENOMEM;
>>>>> +             }
>>>>> +     }
>>>>> +
>>>>> +     packets_num = (lt9611c->edid_len % 32) ? (lt9611c->edid_len / 32 + 1) :
>>>>> +             (lt9611c->edid_len / 32);
>>>>> +     for (i = 0; i < packets_num; i++) {
>>>>> +             read_edid_data_cmd[4] = (u8)i;
>>>>> +             ret = i2c_read_write_flow(lt9611c, read_edid_data_cmd, 5, return_edid_data, 37);
>>>>> +             if (ret) {
>>>>> +                     dev_err(dev, "Failed to read EDID packet %d\n", i);
>>>>> +                     lt9611c->edid_valid = false;
>>>>> +                     return -EIO;
>>>>> +             }
>>>>> +             offset = i * 32;
>>>>> +             bytes_to_copy = min(32, lt9611c->edid_len - offset);
>>>>> +             memcpy(lt9611c->edid_buf + offset, &return_edid_data[5], bytes_to_copy);
>>>>
>>>> Don't store EDID in the long-term structures. Read it on demand.
>>>>
>>> I will think about this issue.
>>>
>>>>> +             }
>>>>> +
>>>>> +     lt9611c->edid_valid = true;
>>>>> +
>>>>> +     return ret;
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
>>>>> +{
>>>>> +     struct lt9611c *lt9611c = data;
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     unsigned int total_blocks;
>>>>> +     int ret;
>>>>> +
>>>>> +     if (len > 128)
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     guard(mutex)(&lt9611c->ocm_lock);
>>>>> +     if (block == 0 || !lt9611c->edid_valid) {
>>>>> +             ret = lt9611c_read_edid(lt9611c);
>>>>> +             if (ret) {
>>>>> +                     dev_err(dev, "EDID read failed\n");
>>>>> +                     return ret;
>>>>> +             }
>>>>> +     }
>>>>> +
>>>>> +     total_blocks = lt9611c->edid_len / 128;
>>>>> +     if (!total_blocks) {
>>>>> +             dev_err(dev, "No valid EDID blocks\n");
>>>>> +             return -EIO;
>>>>> +     }
>>>>> +
>>>>> +     if (block >= total_blocks) {
>>>>> +             dev_err(dev,  "Requested block %u exceeds total blocks %u\n",
>>>>> +                     block, total_blocks);
>>>>> +             return -EINVAL;
>>>>> +     }
>>>>> +
>>>>> +     memcpy(buf, lt9611c->edid_buf + block * 128, len);
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static const struct drm_edid *lt9611c_bridge_edid_read(struct drm_bridge *bridge,
>>>>> +                                                    struct drm_connector *connector)
>>>>> +{
>>>>> +     struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
>>>>> +
>>>>> +     usleep_range(10000, 20000);
>>>>
>>>> Why?
>>>>
>>> Delay for a while to ensure that EDID is ready.
>>
>> Your other chip had interrupt status to note that EDID is ready. I hope
>> you have that one too. Blindly calling usleep_range() is a bad idea.
>>
> Different chips have different logic. i will research it.
> 
>>>
>>>>> +     return drm_edid_read_custom(connector, lt9611c_get_edid_block, lt9611c);
>>>>> +}
>>>>> +
>>>>> +static const struct drm_bridge_funcs lt9611c_bridge_funcs = {
>>>>> +     .attach = lt9611c_bridge_attach,
>>>>> +     .mode_valid = lt9611c_bridge_mode_valid,
>>>>> +     .mode_set = lt9611c_bridge_mode_set,
>>>>> +     .detect = lt9611c_bridge_detect,
>>>>> +     .edid_read = lt9611c_bridge_edid_read,
>>>>> +};
>>>>> +
>>>>> +static int lt9611c_parse_dt(struct device *dev,
>>>>> +                         struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     lt9611c->dsi0_node = of_graph_get_remote_node(dev->of_node, 0, -1);
>>>>> +     if (!lt9611c->dsi0_node) {
>>>>> +             dev_err(dev, "failed to get remote node for primary dsi\n");
>>>>> +             return -ENODEV;
>>>>> +     }
>>>>> +
>>>>> +     lt9611c->dsi1_node = of_graph_get_remote_node(dev->of_node, 1, -1);
>>>>> +
>>>>> +     return drm_of_find_panel_or_bridge(dev->of_node, 2, -1, NULL, &lt9611c->next_bridge);
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_gpio_init(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +
>>>>> +     lt9611c->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>>>>> +     if (IS_ERR(lt9611c->reset_gpio)) {
>>>>> +             dev_err(dev, "failed to acquire reset gpio\n");
>>>>> +             return PTR_ERR(lt9611c->reset_gpio);
>>>>> +     }
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static void lt9611c_read_version(struct lt9611c *lt9611c, u64 *version)
>>>>> +{
>>>>> +     u8 val;
>>>>> +     u64 ver = 0;
>>>>> +
>>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
>>>>> +     i2c_write_byte(lt9611c, 0xee, 0x01);
>>>>> +
>>>>> +     i2c_read_byte(lt9611c, 0x80, &val);
>>>>> +     ver = val;
>>>>> +
>>>>> +     i2c_read_byte(lt9611c, 0x81, &val);
>>>>> +     ver = (ver << 8) | val;
>>>>> +
>>>>> +     *version = ver;
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_read_chipid(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     u8 val = 0;
>>>>> +
>>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe0);
>>>>> +     i2c_write_byte(lt9611c, 0xee, 0x01);
>>>>> +     i2c_write_byte(lt9611c, 0xff, 0xe1);
>>>>> +
>>>>> +     i2c_read_byte(lt9611c, 0x00, &val);
>>>>> +     if (val != 0x23)
>>>>> +             return -ENODEV;
>>>>> +
>>>>> +     i2c_read_byte(lt9611c, 0x01, &val);
>>>>> +     if (val != 0x06)
>>>>> +             return -ENODEV;
>>>>> +
>>>>> +     dev_info(dev, "ChipId = 0x2306\n");
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_hdmi_hw_params(struct device *dev, void *data,
>>>>> +                               struct hdmi_codec_daifmt *fmt,
>>>>> +                              struct hdmi_codec_params *hparms)
>>>>> +{
>>>>> +     struct lt9611c *lt9611c = dev_get_drvdata(dev);
>>>>> +
>>>>> +      dev_info(lt9611c->dev, "SOC sample_rate: %d, sample_width: %d, fmt: %d\n",
>>>>> +               hparms->sample_rate, hparms->sample_width, fmt->fmt);
>>>>> +
>>>>> +     switch (hparms->sample_rate) {
>>>>> +     case 32000:
>>>>> +     case 44100:
>>>>> +     case 48000:
>>>>> +     case 88200:
>>>>> +     case 96000:
>>>>> +     case 176400:
>>>>> +     case 192000:
>>>>> +             break;
>>>>> +     default:
>>>>> +             return -EINVAL;
>>>>> +     }
>>>>> +
>>>>> +     switch (hparms->sample_width) {
>>>>> +     case 16:
>>>>> +     case 18:
>>>>> +     case 20:
>>>>> +     case 24:
>>>>> +             break;
>>>>> +     default:
>>>>> +             return -EINVAL;
>>>>> +     }
>>>>> +
>>>>> +     switch (fmt->fmt) {
>>>>> +     case HDMI_I2S:
>>>>> +     case HDMI_SPDIF:
>>>>> +             break;
>>>>> +     default:
>>>>> +             return -EINVAL;
>>>>> +     }
>>>>
>>>> Does that add anything on top of the limitations of hdmi-codec.c?
>>>>
>>> The parameters supported in the hdmi-codec.c may not be supported by
>>> my chip. Therefore, we can exclude the parameters that are not
>>> supported by the chip.
>>
>> Are they?
>>
> The firmware handles all parameter adaptation autonomously. This code
> merely needs to expose the chip's capabilities to hdmi-codec.c.
> 
>>>
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static void lt9611c_audio_shutdown(struct device *dev, void *data)
>>>>> +{
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_audio_startup(struct device *dev, void *data)
>>>>> +{
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static void lt9611c_audio_update_connector_status(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     enum drm_connector_status status;
>>>>> +
>>>>> +     status = lt9611c->audio_status;
>>>>> +     if (lt9611c->plugged_cb && lt9611c->codec_dev)
>>>>> +             lt9611c->plugged_cb(lt9611c->codec_dev,
>>>>> +                              status == connector_status_connected);
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_hdmi_audio_hook_plugged_cb(struct device *dev,
>>>>> +                                           void *data,
>>>>> +                                      hdmi_codec_plugged_cb fn,
>>>>> +                                      struct device *codec_dev)
>>>>> +{
>>>>> +     struct lt9611c *lt9611c = data;
>>>>> +
>>>>> +     lt9611c->plugged_cb = fn;
>>>>> +     lt9611c->codec_dev = codec_dev;
>>>>> +     lt9611c_audio_update_connector_status(lt9611c);
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static const struct hdmi_codec_ops lt9611c_codec_ops = {
>>>>> +     .hw_params      = lt9611c_hdmi_hw_params,
>>>>> +     .audio_shutdown = lt9611c_audio_shutdown,
>>>>> +     .audio_startup = lt9611c_audio_startup,
>>>>> +     .hook_plugged_cb = lt9611c_hdmi_audio_hook_plugged_cb,
>>>>> +};
>>>>
>>>> No, we have HDMI audio helpers for that. Drop this and use the helpers
>>>> instead.
>>>>
>>> ？？？ I don't understand.
>>
>> See <drm/display/drm_hdmi_audio_helper.h> and
>> https://lore.kernel.org/dri-devel/20250803-lt9611uxc-hdmi-v1-2-cb9ce1793acf@oss.qualcomm.com/
>>
> i will research, thks.
> Could you please share the latest driver file for lt9611uxc.c that you
> have written? (to this email: syyang@lontium.com)

https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/bridge/lontium-lt9611uxc.c

> 
>>>
>>>>> +
>>>>> +static int lt9611c_audio_init(struct device *dev, struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     struct hdmi_codec_pdata codec_data = {
>>>>> +             .ops = &lt9611c_codec_ops,
>>>>> +             .max_i2s_channels = 2,
>>>>> +             .i2s = 1,
>>>>> +             .data = lt9611c,
>>>>> +     };
>>>>> +
>>>>> +     lt9611c->audio_pdev =
>>>>> +             platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
>>>>> +                                           PLATFORM_DEVID_AUTO,
>>>>> +                                      &codec_data, sizeof(codec_data));
>>>>> +
>>>>> +     return PTR_ERR_OR_ZERO(lt9611c->audio_pdev);
>>>>> +}
>>>>> +
>>>>> +static void lt9611c_audio_exit(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     if (lt9611c->audio_pdev) {
>>>>> +             platform_device_unregister(lt9611c->audio_pdev);
>>>>> +             lt9611c->audio_pdev = NULL;
>>>>> +     }
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_firmware_update_store(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     int ret;
>>>>> +
>>>>> +     lt9611c_lock(lt9611c);
>>>>> +     ret = lt9611c_prepare_firmware_data(lt9611c);
>>>>> +     if (ret < 0) {
>>>>> +             dev_err(dev, "Failed prepare firmware data: %d\n", ret);
>>>>> +             goto out;
>>>>> +     }
>>>>> +
>>>>> +     ret = lt9611c_firmware_upgrade(lt9611c);
>>>>> +     if (ret < 0) {
>>>>> +             dev_err(dev, "upgrade failure\n");
>>>>> +             goto out;
>>>>> +     }
>>>>> +     lt9611c_reset(lt9611c);
>>>>> +     ret = lt9611c_upgrade_result(lt9611c);
>>>>> +     if (ret < 0)
>>>>> +             goto out;
>>>>> +
>>>>> +out:
>>>>> +     lt9611c_unlock(lt9611c);
>>>>> +     lt9611c_reset(lt9611c);
>>>>> +     if (lt9611c->fw) {
>>>>> +             release_firmware(lt9611c->fw);
>>>>> +             lt9611c->fw = NULL;
>>>>> +     }
>>>>> +
>>>>> +     return ret;
>>>>> +}
>>>>> +
>>>>> +static ssize_t lt9611c_firmware_store(struct device *dev, struct device_attribute *attr,
>>>>> +                                   const char *buf, size_t len)
>>>>> +{
>>>>> +     struct lt9611c *lt9611c = dev_get_drvdata(dev);
>>>>> +     int ret;
>>>>> +
>>>>> +     ret = lt9611c_firmware_update_store(lt9611c);
>>>>
>>>> Inline
>>>>
>>> i will fix,  thks
>>>
>>>>> +     if (ret < 0)
>>>>> +             return ret;
>>>>> +     return len;
>>>>> +}
>>>>> +
>>>>> +static ssize_t lt9611c_firmware_show(struct device *dev, struct device_attribute *attr, char *buf)
>>>>> +{
>>>>> +     struct lt9611c *lt9611c = dev_get_drvdata(dev);
>>>>> +
>>>>> +     return sysfs_emit(buf, "0x%04llx\n", lt9611c->fw_version);
>>>>> +}
>>>>> +
>>>>> +static DEVICE_ATTR_RW(lt9611c_firmware);
>>>>> +
>>>>> +static struct attribute *lt9611c_attrs[] = {
>>>>> +     &dev_attr_lt9611c_firmware.attr,
>>>>> +     NULL,
>>>>> +};
>>>>> +
>>>>> +static const struct attribute_group lt9611c_attr_group = {
>>>>> +     .attrs = lt9611c_attrs,
>>>>> +};
>>>>> +
>>>>> +static const struct attribute_group *lt9611c_attr_groups[] = {
>>>>> +     &lt9611c_attr_group,
>>>>> +     NULL,
>>>>> +};
>>>>> +
>>>>> +static void lt9611c_cleanup_resources(struct lt9611c *lt9611c)
>>>>> +{
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +
>>>>> +     if (lt9611c->work_inited) {
>>>>> +             cancel_work_sync(&lt9611c->work);
>>>>> +             lt9611c->work_inited = false;
>>>>> +             dev_err(dev, "work cancelled\n");
>>>>
>>>> Why???
>>>>
>>> ?? I don't understand.
>>
>> Why do you need to be so spammy?
>>
> i will fix, thks
> 
>>>
>>>>> +     }
>>>>> +
>>>>> +     if (lt9611c->bridge_added) {
>>>>> +             drm_bridge_remove(&lt9611c->bridge);
>>>>> +             lt9611c->bridge_added = false;
>>>>> +             dev_err(dev, "DRM bridge removed\n");
>>>>> +     }
>>>>> +
>>>>> +     if (lt9611c->regulators_enabled) {
>>>>> +             regulator_bulk_disable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
>>>>> +             lt9611c->regulators_enabled = false;
>>>>> +             dev_err(dev, "regulators disabled\n");
>>>>> +     }
>>>>> +
>>>>> +     if (lt9611c->audio_pdev)
>>>>> +             lt9611c_audio_exit(lt9611c);
>>>>> +
>>>>> +     if (lt9611c->fw) {
>>>>
>>>> You definitely don't need firmware when the bridge is up and running.
>>>>
>>> The previous text has already described the working logic of the firmware.
>>
>> It's another topic: you are storing the firmware in memory while the
>> driver is bound. It's not necessary. You can release it after updating
>> it on the chip.
>>
> I understand what you mean.
> Based on the above conversation, your intention is that when the
> customer needs to upgrade the firmware, they should modify the
> comparison conditions of the version, then compile and burn the
> kernel, and then perform the firmware upgrade, just like the LT9611UXC
> driver. Instead of loading the firmware every time.
> My design intention is to avoid the need for recompiling the driver
> when upgrading. Instead, a file named "LT9611C.bin" can be directly
> sent to the "/lib/firmware" directory via scp. Then you can either
> perform a reboot for the upgrade or execute the command manually for
> the upgrade.
> Perhaps you are suggesting that we could follow the design approach of
> the LT9611UXC driver?

Yes no need to rebuild, just use sysfs to trigger an update.

> 
>>>
>>>>> +             release_firmware(lt9611c->fw);
>>>>> +             lt9611c->fw = NULL;
>>>>> +             dev_err(dev, "firmware released\n");
>>>>> +     }
>>>>> +
>>>>> +     if (lt9611c->dsi0_node) {
>>>>> +             of_node_put(lt9611c->dsi0_node);
>>>>> +             lt9611c->dsi0_node = NULL;
>>>>> +             dev_err(dev, "dsi0 node released\n");
>>>>> +     }
>>>>> +
>>>>> +     if (lt9611c->dsi1_node) {
>>>>> +             of_node_put(lt9611c->dsi1_node);
>>>>> +             lt9611c->dsi1_node = NULL;
>>>>> +             dev_err(dev, "dsi1 node released\n");
>>>>> +     }
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_main(void *data)
>>>>> +{
>>>>> +     struct lt9611c *lt9611c = data;
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +     struct i2c_client *client = lt9611c->client;
>>>>> +     int ret;
>>>>> +
>>>>> +     lt9611c->work_inited = false;
>>>>> +     lt9611c->bridge_added = false;
>>>>> +     lt9611c->regulators_enabled = false;
>>>>> +
>>>>> +     ret = lt9611c_parse_dt(dev, lt9611c);
>>>>> +     if (ret) {
>>>>> +             dev_err(dev, "failed to parse device tree\n");
>>>>> +             return ret;
>>>>> +     }
>>>>> +
>>>>> +     ret = lt9611c_gpio_init(lt9611c);
>>>>> +     if (ret < 0)
>>>>> +             goto err_cleanup;
>>>>> +
>>>>> +     ret = lt9611c_regulator_init(lt9611c);
>>>>> +     if (ret < 0)
>>>>> +             goto err_cleanup;
>>>>> +
>>>>> +     ret = lt9611c_regulator_enable(lt9611c);
>>>>> +     if (ret)
>>>>> +             goto err_cleanup;
>>>>> +
>>>>> +     lt9611c->regulators_enabled = true;
>>>>> +
>>>>> +     lt9611c_reset(lt9611c);
>>>>> +
>>>>> +     ret = lt9611c_read_chipid(lt9611c);
>>>>> +     if (ret < 0) {
>>>>> +             dev_err(dev, "failed to read chip id.\n");
>>>>> +             goto err_cleanup;
>>>>> +     }
>>>>> +
>>>>> +     lt9611c_lock(lt9611c);
>>>>> +     lt9611c_read_version(lt9611c, &lt9611c->fw_version);
>>>>> +
>>>>> +     ret = lt9611c_prepare_firmware_data(lt9611c);
>>>>> +     if (ret == 0 && lt9611c_upgrade_judgment(lt9611c) == UPGRADE) {
>>>>> +             dev_info(dev, "firmware upgrade needed\n");
>>>>> +
>>>>> +             ret = lt9611c_firmware_upgrade(lt9611c);
>>>>> +             if (ret < 0) {
>>>>> +                     dev_err(dev, "firmware upgrade failed\n");
>>>>> +                     lt9611c_unlock(lt9611c);
>>>>> +                     goto err_cleanup;
>>>>> +             }
>>>>> +
>>>>> +             lt9611c_reset(lt9611c);
>>>>> +             ret = lt9611c_upgrade_result(lt9611c);
>>>>> +             if (ret < 0) {
>>>>> +                     lt9611c_unlock(lt9611c);
>>>>> +                     goto err_cleanup;
>>>>> +             }
>>>>> +
>>>>> +             lt9611c_read_version(lt9611c, &lt9611c->fw_version);
>>>>> +             lt9611c_unlock(lt9611c);
>>>>> +
>>>>> +     } else {
>>>>> +             dev_info(dev, "skip firmware upgrade, using chip internal firmware\n");
>>>>> +             lt9611c_unlock(lt9611c);
>>>>> +     }
>>>>> +
>>>>> +     if (lt9611c->fw) {
>>>>> +             release_firmware(lt9611c->fw);
>>>>> +             lt9611c->fw = NULL;
>>>>> +     }
>>>>> +     dev_info(dev, "current version:0x%04llx", lt9611c->fw_version);
>>>>> +
>>>>> +     INIT_WORK(&lt9611c->work, lt9611c_hpd_work);
>>>>> +     lt9611c->work_inited = true;
>>>>> +
>>>>> +     if (!client->irq) {
>>>>> +             dev_err(dev, "failed to get INTP IRQ\n");
>>>>> +             ret = -ENODEV;
>>>>> +             goto err_cleanup;
>>>>> +     }
>>>>> +
>>>>> +     ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
>>>>> +                                     lt9611c_irq_thread_handler,
>>>>> +                                     IRQF_TRIGGER_HIGH | IRQF_ONESHOT |
>>>>> +                                     IRQF_NO_AUTOEN,
>>>>> +                                     "lt9611c", lt9611c);
>>>>> +     if (ret) {
>>>>> +             dev_err(dev, "failed to request irq\n");
>>>>> +             goto err_cleanup;
>>>>> +     }
>>>>> +
>>>>> +     lt9611c->bridge.funcs = &lt9611c_bridge_funcs;
>>>>> +     lt9611c->bridge.of_node = lt9611c->client->dev.of_node;
>>>>> +     lt9611c->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
>>>>> +     lt9611c->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>>>>> +
>>>>> +     drm_bridge_add(&lt9611c->bridge);
>>>>> +     lt9611c->bridge_added = true;
>>>>
>>>> No unnecessary flags, please. Implement proper cleanup path, unwinding
>>>> resources one by one.
>>>>
>>> I will consider this issue. thks
>>>
>>>>> +
>>>>> +     /* Attach primary DSI */
>>>>> +     lt9611c->dsi0 = lt9611c_attach_dsi(lt9611c, lt9611c->dsi0_node);
>>>>> +     if (IS_ERR(lt9611c->dsi0)) {
>>>>> +             ret = PTR_ERR(lt9611c->dsi0);
>>>>> +             dev_err(dev, "Failed to attach primary DSI, error=%d\n", ret);
>>>>> +             goto err_cleanup;
>>>>> +     }
>>>>> +
>>>>> +     /* Attach secondary DSI, if specified */
>>>>> +     if (lt9611c->dsi1_node) {
>>>>> +             lt9611c->dsi1 = lt9611c_attach_dsi(lt9611c, lt9611c->dsi1_node);
>>>>> +             if (IS_ERR(lt9611c->dsi1)) {
>>>>> +                     ret = PTR_ERR(lt9611c->dsi1);
>>>>> +                     dev_err(dev, "Failed to attach secondary DSI, error=%d\n", ret);
>>>>> +                     goto err_cleanup;
>>>>> +             }
>>>>> +     }
>>>>> +
>>>>> +     lt9611c->audio_status = connector_status_disconnected;
>>>>> +
>>>>> +     ret = lt9611c_audio_init(dev, lt9611c);
>>>>> +     if (ret < 0) {
>>>>> +             dev_err(dev, "audio init failed\n");
>>>>> +             goto err_cleanup;
>>>>> +     }
>>>>> +
>>>>> +     lt9611c_reset(lt9611c);
>>>>> +     enable_irq(lt9611c->client->irq);
>>>>> +
>>>>> +     return 0;
>>>>> +
>>>>> +err_cleanup:
>>>>> +     lt9611c_cleanup_resources(lt9611c);
>>>>> +     return ret;
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_probe(struct i2c_client *client)
>>>>> +{
>>>>> +     struct lt9611c *lt9611c;
>>>>> +     struct device *dev = &client->dev;
>>>>> +
>>>>> +     if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
>>>>> +             dev_err(dev, "device doesn't support I2C\n");
>>>>> +             return -ENODEV;
>>>>> +     }
>>>>> +
>>>>> +     lt9611c = devm_kzalloc(dev, sizeof(*lt9611c), GFP_KERNEL);
>>>>
>>>> devm_drm_bridge_alloc()
>>>>
>>> i will fix, thks
>>>
>>>>> +     if (!lt9611c)
>>>>> +             return -ENOMEM;
>>>>> +
>>>>> +     lt9611c->dev = dev;
>>>>> +     lt9611c->client = client;
>>>>> +     mutex_init(&lt9611c->ocm_lock);
>>>>> +
>>>>> +     lt9611c->regmap = devm_regmap_init_i2c(client, &lt9611c_regmap_config);
>>>>> +     if (IS_ERR(lt9611c->regmap)) {
>>>>> +             dev_err(dev, "regmap i2c init failed\n");
>>>>> +             return PTR_ERR(lt9611c->regmap);
>>>>> +     }
>>>>> +
>>>>> +     i2c_set_clientdata(client, lt9611c);
>>>>> +
>>>>> +     lt9611c->kthread = kthread_run(lt9611c_main, lt9611c, "lt9611c");
>>>>
>>>> Why do you need extra kthread for that???
> 
> Upgrading the firmware takes time. execute it sequentially in the
> probe function, it will block the system boot.
> Using the kthread method will not block the system boot.

Just follow the drivers/gpu/drm/bridge/lontium-lt9611uxc.c way to do this.

> 
>>>>
>>>>> +     if (IS_ERR(lt9611c->kthread)) {
>>>>> +             dev_err(dev, "Failed to create kernel thread\n");
>>>>> +             return PTR_ERR(lt9611c->kthread);
>>>>> +     }
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static void lt9611c_remove(struct i2c_client *client)
>>>>> +{
>>>>> +     struct lt9611c *lt9611c = i2c_get_clientdata(client);
>>>>> +     struct device *dev = lt9611c->dev;
>>>>> +
>>>>> +     kfree(lt9611c->edid_buf);
>>>>> +     disable_irq(client->irq);
>>>>> +     lt9611c_cleanup_resources(lt9611c);
>>>>> +     mutex_destroy(&lt9611c->ocm_lock);
>>>>> +     dev_info(dev, "remove driver\n");
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_bridge_suspend(struct device *dev)
>>>>> +{
>>>>> +     struct lt9611c *lt9611c = dev_get_drvdata(dev);
>>>>> +     int ret;
>>>>> +
>>>>> +     dev_info(lt9611c->dev, "suspend\n");
>>>>> +     disable_irq(lt9611c->client->irq);
>>>>> +     ret = lt9611c_regulator_disable(lt9611c);
>>>>> +     gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
>>>>> +
>>>>> +     return ret;
>>>>> +}
>>>>> +
>>>>> +static int lt9611c_bridge_resume(struct device *dev)
>>>>> +{
>>>>> +     struct lt9611c *lt9611c = dev_get_drvdata(dev);
>>>>> +     int ret;
>>>>> +
>>>>> +     ret = lt9611c_regulator_enable(lt9611c);
>>>>> +     lt9611c_reset(lt9611c);
>>>>> +     enable_irq(lt9611c->client->irq);
>>>>> +     dev_info(lt9611c->dev, "resume\n");
>>>>> +
>>>>> +     return ret;
>>>>> +}
>>>>> +
>>>>> +static const struct dev_pm_ops lt9611c_bridge_pm_ops = {
>>>>> +     SET_SYSTEM_SLEEP_PM_OPS(lt9611c_bridge_suspend,
>>>>> +                             lt9611c_bridge_resume)
>>>>> +};
>>>>> +
>>>>> +static struct i2c_device_id lt9611c_id[] = {
>>>>> +     { "lontium,lt9611c", 0 },
>>>>> +     { /* sentinel */ }
>>>>> +};
>>>>> +
>>>>> +static const struct of_device_id lt9611c_match_table[] = {
>>>>> +     { .compatible = "lontium,lt9611c" },
>>>>
>>>> Your schema also had lt9611uxd
>>>>
>>> i will fix, thks
>>>
>>>>> +     { /* sentinel */ }
>>>>> +};
>>>>> +MODULE_DEVICE_TABLE(of, lt9611c_match_table);
>>>>> +
>>>>> +static struct i2c_driver lt9611c_driver = {
>>>>> +     .driver = {
>>>>> +             .name = "lt9611c",
>>>>> +             .of_match_table = lt9611c_match_table,
>>>>> +             .pm = &lt9611c_bridge_pm_ops,
>>>>> +             .dev_groups = lt9611c_attr_groups,
>>>>> +     },
>>>>> +     .probe = lt9611c_probe,
>>>>> +     .remove = lt9611c_remove,
>>>>> +     .id_table = lt9611c_id,
>>>>> +};
>>>>> +module_i2c_driver(lt9611c_driver);
>>>>> +
>>>>> +MODULE_AUTHOR("syyang <syyang@lontium.com>");
>>>>> +MODULE_LICENSE("GPL v2");
>>>>> +
>>>>> +MODULE_FIRMWARE(FW_FILE);
>>>>> --
>>>>> 2.25.1
>>>>>
>>>>
>>>> --
>>>> With best wishes
>>>> Dmitry
>>>
>>> Dmitry, thank you very much
>>
>> --
>> With best wishes
>> Dmitry

