Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA6D9E4F16
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 09:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B1410EDCD;
	Thu,  5 Dec 2024 08:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="NvUB+1Qn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pv50p00im-tydg10011801.me.com (pv50p00im-tydg10011801.me.com
 [17.58.6.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C38D10E364
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 00:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1733358727;
 bh=cXKPzq1F5TX5/uxkKzMSB1NXoT3FhOuw3zI5BP+SzJo=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:
 x-icloud-hme;
 b=NvUB+1QnWMYICgzWlemCLtbKtw0Tm9UBfjUIS4wXxNaGs9onuC2hnMzT/iYvnz07/
 HOJi6i+ZJu7u9TFjWv6p091BQybVr1dy2GK+s4Y1dBRyb01zFxvkpYzmKIcdYc+f+h
 EPlThxGXJ2V2jWHZoWnqU8CzaC/gBYpkJxrTxi6CAYmoJiqC5cfkokKhTuJPqzI01y
 SPAxLX9iaP6k8j/wWV+9x5JN+dMn3a4RipO7xV6ggbD4vgGWQxJbKf7T9HWef6iKb9
 MWAynZUufAflnI+7Qdg6sA6wGLflOnhzBW2AQHEIridePBX3xOYMQYs1ZNBMu+9K4s
 KuvLdIcO+3S3w==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id 1971880021D;
 Thu,  5 Dec 2024 00:32:00 +0000 (UTC)
Message-ID: <18dd5368-d583-44f3-8dd4-74c669ef3bf9@icloud.com>
Date: Thu, 5 Dec 2024 08:31:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] driver core: Constify API device_find_child()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
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
 linux-scsi@vger.kernel.org, open-iscsi@googlegroups.com,
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
 netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RvRSqKy8ZqOUE5anLWfZCokK2N1USz-Y
X-Proofpoint-ORIG-GUID: RvRSqKy8ZqOUE5anLWfZCokK2N1USz-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_19,2024-12-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=919 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412050001
X-Mailman-Approved-At: Thu, 05 Dec 2024 08:01:58 +0000
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

On 2024/12/5 08:10, Zijun Hu wrote:
> This patch series is to constify the following API:

This patch series is based on the lasted mainline commit
Commit: feffde684ac2 ("Merge tag 'for-6.13-rc1-tag' of
git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux")
to avoid potential conflict as much as possible.

> struct device *device_find_child(struct device *dev, void *data,
> 		int (*match)(struct device *dev, void *data));
> To :
> struct device *device_find_child(struct device *dev, const void *data,
> 				 device_match_t match);
> typedef int (*device_match_t)(struct device *dev, const void *data);
> 
> Why to constify the API?
> 
> - Protect caller's match data @*data which is for comparison and lookup
>   and the API does not actually need to modify @*data.
> 
> - Make the API's parameters (@match)() and @data have the same type as
>   all of other device finding APIs (bus|class|driver)_find_device().
> 
> - All kinds of existing device matching functions can be directly taken
>   as the API's argument, they were exported by driver core.
> 
> What to do?
> 
> - Patches [1/11, 3/11] prepare for constifying the API.
> 
> - Patch 4/11 constifies the API and adapt for its various subsystem usages.
> 
> - Remaining do cleanup for several usages with benefits brought above.

