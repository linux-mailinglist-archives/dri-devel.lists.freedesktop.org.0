Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBD59E856F
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 14:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0399C10E193;
	Sun,  8 Dec 2024 13:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="nsAlKyTz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pv50p00im-zteg10021301.me.com (pv50p00im-zteg10021301.me.com
 [17.58.6.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D65610E193
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 13:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1733663951;
 bh=B9Z7dZW7Hi3Js1z/RCEjU+3M/IjEGHpjDFHWBOHmqc4=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:
 x-icloud-hme;
 b=nsAlKyTzBjgFKiKK875IKrpeQ6Hv0IpX0ZWERQ6ck5xVT3yTVHF/ma0+sMayke7RA
 Mgepn7kdGl4f4KMgfy/ymh+QBWxBeS7/1xqjrAX4SI9iGKKSkpp5xcz5oH/1zd68so
 q8B21ej8wfHvQSmqknU2Qp3DQusSq/gzOdhHF5FFhfSN5Qste9Sq1vNahO5iwGakAp
 tKQIdEZWB3krUn4WgU7lFUNJY/OoKRT0xs0HLsHhvA1M3HxUyLGgZ/BUmsWP7OKH1i
 bCryHNz+PA1BYV/NsVSs5yT/qG6oSWCs9oJcX6JOBLUE0hNVJ8Fz0YBe04unhhDqh2
 KUvRd6BwJWVxw==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-zteg10021301.me.com (Postfix) with ESMTPSA id B0625500490;
 Sun,  8 Dec 2024 13:18:59 +0000 (UTC)
Message-ID: <7780942a-93cd-4508-be97-fc5e5267c389@icloud.com>
Date: Sun, 8 Dec 2024 21:18:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] driver core: Constify API device_find_child()
 then adapt for various usages
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 <20241205-const_dfc_done-v3-4-1611f1486b5a@quicinc.com>
 <20241206135209.GA133715@workstation.local>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <20241206135209.GA133715@workstation.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zq6ALpvY8lzOJgSSQvNtYt-PHDnk_XXq
X-Proofpoint-GUID: zq6ALpvY8lzOJgSSQvNtYt-PHDnk_XXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-08_04,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 mlxscore=0
 clxscore=1011 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412080111
X-Mailman-Approved-At: Sun, 08 Dec 2024 13:26:47 +0000
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

On 2024/12/6 21:52, Takashi Sakamoto wrote:
> Hi,
> 
> On Thu, Dec 05, 2024 at 08:10:13AM +0800, Zijun Hu wrote:
>> From: Zijun Hu <quic_zijuhu@quicinc.com>
>>
>> Constify the following API:
>> struct device *device_find_child(struct device *dev, void *data,
>> 		int (*match)(struct device *dev, void *data));
>> To :
>> struct device *device_find_child(struct device *dev, const void *data,
>>                                  device_match_t match);
>> typedef int (*device_match_t)(struct device *dev, const void *data);
>> with the following reasons:
>>
>> - Protect caller's match data @*data which is for comparison and lookup
>>   and the API does not actually need to modify @*data.
>>
>> - Make the API's parameters (@match)() and @data have the same type as
>>   all of other device finding APIs (bus|class|driver)_find_device().
>>
>> - All kinds of existing device match functions can be directly taken
>>   as the API's argument, they were exported by driver core.
>>
>> Constify the API and adapt for various existing usages by simply making
>> various match functions take 'const void *' as type of match data @data.
>>
>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
>> ---
>>  arch/sparc/kernel/vio.c                |  6 +++---
>>  drivers/base/core.c                    |  6 +++---
>>  drivers/block/sunvdc.c                 |  6 +++---
>>  drivers/bus/fsl-mc/dprc-driver.c       |  4 ++--
>>  drivers/cxl/core/pci.c                 |  4 ++--
>>  drivers/cxl/core/pmem.c                |  2 +-
>>  drivers/cxl/core/region.c              | 21 ++++++++++++---------
>>  drivers/firewire/core-device.c         |  4 ++--
>>  drivers/firmware/arm_scmi/bus.c        |  4 ++--
>>  drivers/firmware/efi/dev-path-parser.c |  4 ++--
>>  drivers/gpio/gpio-sim.c                |  2 +-
>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 +-
>>  drivers/hwmon/hwmon.c                  |  2 +-
>>  drivers/media/pci/mgb4/mgb4_core.c     |  4 ++--
>>  drivers/nvdimm/bus.c                   |  2 +-
>>  drivers/pwm/core.c                     |  2 +-
>>  drivers/rpmsg/rpmsg_core.c             |  4 ++--
>>  drivers/scsi/qla4xxx/ql4_os.c          |  3 ++-
>>  drivers/scsi/scsi_transport_iscsi.c    | 10 +++++-----
>>  drivers/slimbus/core.c                 |  8 ++++----
>>  drivers/thunderbolt/retimer.c          |  2 +-
>>  drivers/thunderbolt/xdomain.c          |  2 +-
>>  drivers/tty/serial/serial_core.c       |  4 ++--
>>  drivers/usb/typec/class.c              |  8 ++++----
>>  include/linux/device.h                 |  4 ++--
>>  include/scsi/scsi_transport_iscsi.h    |  4 ++--
>>  net/dsa/dsa.c                          |  2 +-
>>  tools/testing/cxl/test/cxl.c           |  2 +-
>>  28 files changed, 66 insertions(+), 62 deletions(-)
> 
> For the changes in FireWire subsystem:
> 
> Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> 

thank you for code review and previous cooperation to achieve
this goal (^^).

> 
> Thanks
> 
> Takashi Sakamoto

