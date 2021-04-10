Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D641D35A9A6
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 02:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68F46EC6A;
	Sat, 10 Apr 2021 00:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m1561.mail.126.com (m1561.mail.126.com [220.181.15.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D856EC6A;
 Sat, 10 Apr 2021 00:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=5/lTD
 DTtvqPXapa1EVayUD87lA5OjiS04PXgFp2HWM4=; b=XWKEfU3I+wKd7eE+0vtRE
 xCey5IwiHqXgbhpQbooKsST3PaWhUW5XVOCcKwlwmi+9AgOu+h9njaOtXv3Ihha6
 YLRfHAvvcmswa/xqakTDprzGiRDkLQGbKGd61djoTqrn+krD9mrgStekQx+YibUD
 sMQ1VO1P0IB6JMTBhcFaCw=
Received: from wangyingjie55$126.com ( [106.17.213.220] ) by
 ajax-webmail-wmsvr61 (Coremail) ; Sat, 10 Apr 2021 08:43:43 +0800 (CST)
X-Originating-IP: [106.17.213.220]
Date: Sat, 10 Apr 2021 08:43:43 +0800 (CST)
From: "Yingjie Wang" <wangyingjie55@126.com>
To: "Alex Deucher" <alexdeucher@gmail.com>
Subject: Re:Re: [PATCH v1] drm/radeon: Fix a missing check bug in
 radeon_dp_mst_detect()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2021 www.mailtech.cn 126com
In-Reply-To: <CADnq5_OujJOLukc74YQwwW4pdCA-M_4Gz_pZg8Je1ep3HZBBMw@mail.gmail.com>
References: <1617765004-5308-1-git-send-email-wangyingjie55@126.com>
 <CADnq5_OujJOLukc74YQwwW4pdCA-M_4Gz_pZg8Je1ep3HZBBMw@mail.gmail.com>
MIME-Version: 1.0
Message-ID: <50fb7dba.1f7.178b93c0caa.Coremail.wangyingjie55@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: PcqowADX5jbA9HBgFpk8AQ--.52414W
X-CM-SenderInfo: 5zdqw5xlqjyxrhvvqiyswou0bp/1tbiVwlvp1pEDRCg5AACsT
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

My pleasure!
At 2021-04-09 04:17:36, "Alex Deucher" <alexdeucher@gmail.com> wrote:
>Applied.  Thanks!
>
>Alex
>
>On Wed, Apr 7, 2021 at 2:23 AM <wangyingjie55@126.com> wrote:
>>
>> From: Yingjie Wang <wangyingjie55@126.com>
>>
>> In radeon_dp_mst_detect(), We should check whether or not @connector
>> has been unregistered from userspace. If the connector is unregistered,
>> we should return disconnected status.
>>
>> Fixes: 9843ead08f18 ("drm/radeon: add DisplayPort MST support (v2)")
>> Signed-off-by: Yingjie Wang <wangyingjie55@126.com>
>> ---
>>  drivers/gpu/drm/radeon/radeon_dp_mst.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
>> index 2c32186c4acd..4e4c937c36c6 100644
>> --- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
>> +++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
>> @@ -242,6 +242,9 @@ radeon_dp_mst_detect(struct drm_connector *connector,
>>                 to_radeon_connector(connector);
>>         struct radeon_connector *master = radeon_connector->mst_port;
>>
>> +       if (drm_connector_is_unregistered(connector))
>> +               return connector_status_disconnected;
>> +
>>         return drm_dp_mst_detect_port(connector, ctx, &master->mst_mgr,
>>                                       radeon_connector->port);
>>  }
>> --
>> 2.7.4
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
