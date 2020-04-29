Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDF81BD6E3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 10:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1056EA82;
	Wed, 29 Apr 2020 08:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5AB6E8A0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 08:13:40 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03T8DUwW007493;
 Wed, 29 Apr 2020 03:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1588148010;
 bh=dIrVm1/0QLViLtaRRfuBbJNZneOip17ijlKOVSjVhIE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=zHFWQgW4G0g/o/UPa18cLyEWT6fX8erJvXdQ9shIsSQD3OjN6AHmJrUAPuzYjyGqq
 Cw4rEacVXvIiKujfXiS3XPO6fwVSZhK78MzlKHqqDqSiTyHwI+d5pjr2EMaL2y5ky5
 WOKW6l1eMYGIwRIlfpUZqgEHtNrrks6IacCPg9W8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03T8DUkI011810
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 29 Apr 2020 03:13:30 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 03:13:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 03:13:29 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03T8DQeH056208;
 Wed, 29 Apr 2020 03:13:27 -0500
Subject: Re: [PATCH] drm/bridge: fix stack usage warning on old gcc
To: Arnd Bergmann <arnd@arndb.de>
References: <20200428215408.4111675-1-arnd@arndb.de>
 <22ee464b-f59a-69a3-b669-f821d567fbf5@ti.com>
 <CAK8P3a2YAe0KPQYQi_PhFvaYeA_4jHM8Y0qOR8oy-A07y-zeEQ@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <cd7c03e3-baba-73fd-f432-5ccc640a6f44@ti.com>
Date: Wed, 29 Apr 2020 11:13:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2YAe0KPQYQi_PhFvaYeA_4jHM8Y0qOR8oy-A07y-zeEQ@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/04/2020 11:02, Arnd Bergmann wrote:
> On Wed, Apr 29, 2020 at 9:56 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>>> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
>>> index 1b39e8d37834..6650fe4cfc20 100644
>>> --- a/drivers/gpu/drm/bridge/tc358768.c
>>> +++ b/drivers/gpu/drm/bridge/tc358768.c
>>> @@ -178,6 +178,8 @@ static int tc358768_clear_error(struct tc358768_priv *priv)
>>>
>>>    static void tc358768_write(struct tc358768_priv *priv, u32 reg, u32 val)
>>>    {
>>> +     /* work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81715 */
>>> +     int tmpval = val;
> 
>>
>> tc358768_write is not inline. What is the inline function here? Or is tc358768_write optimized to
>> inline by the compiler?
> 
> I missed the lack of an explicit inline tag when looking at the bug. gcc
> usually decides which functions to inline on its own, so there is little
> difference in practice. Let me know if I should clarify the changelog and
> resend it.

Ok. I think this is fine.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
