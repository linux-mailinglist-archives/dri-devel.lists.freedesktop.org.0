Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB0B9FBDA5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 13:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD9310E16D;
	Tue, 24 Dec 2024 12:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="EG3/2JQq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pv50p00im-ztdg10012001.me.com (pv50p00im-ztdg10012001.me.com
 [17.58.6.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B2C10E16D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 12:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1735044950;
 bh=qcfWDpvVWNhEetxodKQbf9RhUrYXCg1pOSV/TOgjh8E=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:
 x-icloud-hme;
 b=EG3/2JQqEx9JwRea3li9dBqaxu0my5/071veaECaERiiL2HaxnutzGeLfRCkdliQ+
 l940chB1rDnqfX/zgUAMjMfCU9KCfBl50dd3AYHL+BCjR/LpEszClrwiiaaocUKdO0
 Dl2mV4JdKdh/0YgEJ9BJeUrYbnqeEK32HyBu1kdqSpd48WyUj+xOOrG2TPE3uWXjqg
 r0ghBcmj98blLsL7LbynIl9mcuoDXs3AWmbkxfj5bUUIay9lmZdqN/eU6kd0SaVrTM
 GRnywuJAX30KYKqxhMDjwHXII0rz8Gc6kAVu3/J0Bdy+37cstoObgEcm810pSSyaY/
 iCj0P90MAhf9w==
Received: from [192.168.1.25] (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-ztdg10012001.me.com (Postfix) with ESMTPSA id 7FC60A027E;
 Tue, 24 Dec 2024 12:55:41 +0000 (UTC)
Message-ID: <16a5d190-29b0-46f5-9845-a1d875211729@icloud.com>
Date: Tue, 24 Dec 2024 20:55:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/11] driver core: Simplify API
 device_find_child_by_name() implementation
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-sound@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org,
 Zijun Hu <quic_zijuhu@quicinc.com>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
 <20241211-const_dfc_done-v4-5-583cc60329df@quicinc.com>
 <20241223203935.00003de0@huawei.com>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <20241223203935.00003de0@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TfHq9KcTAjJLJHGN7Cnpr8airBeAqUiz
X-Proofpoint-GUID: TfHq9KcTAjJLJHGN7Cnpr8airBeAqUiz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-24_05,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 malwarescore=0 mlxlogscore=846 phishscore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412240112
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

On 2024/12/24 04:39, Jonathan Cameron wrote:
> There is a subtle difference.  In theory old code could dereference a NULL
> if parent->p == NULL, now it can't.  Sounds at most like a harmless change but
> maybe you should mention it.
> 

i did not correct parameter checking for device_find_child_by_name() in
below commit

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/base/core.c?id=903c44939abc02e2f3d6f2ad65fa090f7e5df5b6

since this commit will come finally, actually, this commit is the
original motivation of this whole patch series.

> Otherwise LGTM
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

