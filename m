Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35769E6886
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 09:12:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8C110F01B;
	Fri,  6 Dec 2024 08:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="kb+PAfJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pv50p00im-zteg10021301.me.com (pv50p00im-zteg10021301.me.com
 [17.58.6.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1DC10E02D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 00:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1733446598;
 bh=gD/eV8FniOqkvsbchGLbTggCmSZ3+Zy4ZNoHJzav1qY=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:
 x-icloud-hme;
 b=kb+PAfJgaCYIQRvFMLki16gYica5tRz/08+GznpmNX7VeO+OH27EOPjbOCq88Bq5G
 C85X8m08IvDSJIBUkQpWDkm/U+UPvjMndrTjwaHPdxebzthJxcCvzNq1UluTMsOJE0
 f/0ApVaydU3tkF/jonXQ6he1D/A1oPkgLYw3/ROwGhr2XOvjy8TJ9vq91JoxTwmWUc
 ba2JcPh21U8etDOzQaiUpPg1qZtmIP7MChQkfEtsT7WmDEkJB7EJJI67OyQh+q5UI+
 YN2aWgZIZGmaIvEcoooWNySYWbIvD/XfFw0E7Ta1fRv2r40AtsA3NMQGWCkVFfGaKX
 jqpQZGpB+nUgg==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-zteg10021301.me.com (Postfix) with ESMTPSA id 86E9E5001C0;
 Fri,  6 Dec 2024 00:56:29 +0000 (UTC)
Message-ID: <288fe563-bd3b-4075-bcf6-5fc4782a6cb9@icloud.com>
Date: Fri, 6 Dec 2024 08:56:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] libnvdimm: Simplify nd_namespace_store()
 implementation
To: Alison Schofield <alison.schofield@intel.com>
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
 <20241205-const_dfc_done-v3-1-1611f1486b5a@quicinc.com>
 <Z1I3lSpcnIIbc7S1@aschofie-mobl2.lan>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <Z1I3lSpcnIIbc7S1@aschofie-mobl2.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: m6MvnGCh7TgcaO5x_qBwHR0pa2QT6zvQ
X-Proofpoint-GUID: m6MvnGCh7TgcaO5x_qBwHR0pa2QT6zvQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_16,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

On 2024/12/6 07:30, Alison Schofield wrote:
> On Thu, Dec 05, 2024 at 08:10:10AM +0800, Zijun Hu wrote:
>> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> Hi Zihun,
> 
> Similar to my comment on Patch 10/11, this commit msg can be
> explicit:
> 
> libnvdimm: Replace namespace_match() w device_find_child_by_name()
> 
>>
>> Simplify nd_namespace_store() implementation by  device_find_child_by_name()
>                                                   ^using 
> 

thank you Alison for code review.

will send v4 with your suggestions.
(^^)

> Otherwise you can add:
> Reviewed-by: Alison Schofield <alison.schofield@intel.com>
> 
>>
>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
>> ---
>>  drivers/nvdimm/claim.c | 9 +--------
>>  1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/drivers/nvdimm/claim.c b/drivers/nvdimm/claim.c
>> index 030dbde6b0882050c90fb8db106ec15b1baef7ca..9e84ab411564f9d5e7ceb687c6491562564552e3 100644
>> --- a/drivers/nvdimm/claim.c
>> +++ b/drivers/nvdimm/claim.c
>> @@ -67,13 +67,6 @@ bool nd_attach_ndns(struct device *dev, struct nd_namespace_common *attach,
>>  	return claimed;
>>  }
>>  
>> -static int namespace_match(struct device *dev, void *data)
>> -{
>> -	char *name = data;
>> -
>> -	return strcmp(name, dev_name(dev)) == 0;
>> -}
>> -
>>  static bool is_idle(struct device *dev, struct nd_namespace_common *ndns)
>>  {
>>  	struct nd_region *nd_region = to_nd_region(dev->parent);
>> @@ -168,7 +161,7 @@ ssize_t nd_namespace_store(struct device *dev,
>>  		goto out;
>>  	}
>>  
>> -	found = device_find_child(dev->parent, name, namespace_match);
>> +	found = device_find_child_by_name(dev->parent, name);
>>  	if (!found) {
>>  		dev_dbg(dev, "'%s' not found under %s\n", name,
>>  				dev_name(dev->parent));
>>
>> -- 
>> 2.34.1
>>
>>

