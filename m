Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13D29E6888
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 09:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFEB10F02F;
	Fri,  6 Dec 2024 08:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="G1yK0/3Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pv50p00im-zteg10021301.me.com (pv50p00im-zteg10021301.me.com
 [17.58.6.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6594F10E02D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 01:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1733446848;
 bh=YgEIWxk2/e/iYW5sknXjbn6nIFGLK2sO7NKKDe0RmG0=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:
 x-icloud-hme;
 b=G1yK0/3YSKhJBjyAzf3EDn2bwsIP/TQQaRq1+pHJTcb2xhFy2oJ0HZEOPVqoRVZ1E
 OCmrwAZ0Pelc2A+d5SIf+o2wTYc5YRsN5C08BDyF81reWnJwkQ8WCcrN+rg8/iFkLY
 COKgxB3az9ZDQQfgx+wkVQVP1xHK3X2EYQ6noCH1ngqsophyDhSnN2eP9f7VpeeOYq
 w4RWgmn8cNyUjoenz34MjLIeG58YJJcIhoEN0ew9sEcgFtgARBItj5vel2yJFWvOYb
 prUp0wWigkT1r8rtSAhXkqyZ2q0gfpXZjzSPoxNR8nP7Va9VvM54ECluqJtancf2m4
 2NX8HkzdAMjtw==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-zteg10021301.me.com (Postfix) with ESMTPSA id 15B785002B3;
 Fri,  6 Dec 2024 01:00:37 +0000 (UTC)
Message-ID: <8c89163d-2fac-42ef-acd3-76c0f298e8cb@icloud.com>
Date: Fri, 6 Dec 2024 09:00:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] gpio: sim: Remove gpio_sim_dev_match_fwnode()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-sound@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com,
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
 netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
 <20241205-const_dfc_done-v3-8-1611f1486b5a@quicinc.com>
 <CAMRc=Mf--vRm15N2au-zvP89obcxRuk+3OOLqFtrjgg61_LotA@mail.gmail.com>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <CAMRc=Mf--vRm15N2au-zvP89obcxRuk+3OOLqFtrjgg61_LotA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zbowhbFmvtzwQ1zQJwPzLroNMq0mmr26
X-Proofpoint-ORIG-GUID: zbowhbFmvtzwQ1zQJwPzLroNMq0mmr26
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_16,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 mlxlogscore=915 suspectscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412060007
X-Mailman-Approved-At: Fri, 06 Dec 2024 08:12:04 +0000
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

On 2024/12/6 00:24, Bartosz Golaszewski wrote:
> On Thu, Dec 5, 2024 at 1:15 AM Zijun Hu <zijun_hu@icloud.com> wrote:
>>
>> From: Zijun Hu <quic_zijuhu@quicinc.com>
>>
>> gpio_sim_dev_match_fwnode() is a simple wrapper of device_match_fwnode()
>> Remvoe the unnecessary wrapper.
>>
>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
>> ---
>>  drivers/gpio/gpio-sim.c | 7 +------
>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
>> index 370b71513bdb529112e157fa22a5451e02502a17..b1f33cbaaaa78aca324f99c45a868e7e79a9d672 100644
>> --- a/drivers/gpio/gpio-sim.c
>> +++ b/drivers/gpio/gpio-sim.c
>> @@ -413,11 +413,6 @@ static int gpio_sim_setup_sysfs(struct gpio_sim_chip *chip)
>>         return devm_add_action_or_reset(dev, gpio_sim_sysfs_remove, chip);
>>  }
>>
>> -static int gpio_sim_dev_match_fwnode(struct device *dev, const void *data)
>> -{
>> -       return device_match_fwnode(dev, data);
>> -}
>> -
>>  static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
>>  {
>>         struct gpio_sim_chip *chip;
>> @@ -503,7 +498,7 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
>>         if (ret)
>>                 return ret;
>>
>> -       chip->dev = device_find_child(dev, swnode, gpio_sim_dev_match_fwnode);
>> +       chip->dev = device_find_child(dev, swnode, device_match_fwnode);
>>         if (!chip->dev)
>>                 return -ENODEV;
>>
>>
>> --
>> 2.34.1
>>
>>
> 
> Please use get_maintainers.pl to get the complete list of addresses to Cc.

thanks for code review.
will fix it in v4.

> 
> Bartosz

