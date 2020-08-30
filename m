Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 609DE257634
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 11:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E424789C28;
	Mon, 31 Aug 2020 09:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889B889AC6
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 22:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1598828157; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ed/EF0gPQmZhJFSMnr0/oT1EzF7WA3QTt0WC2jzwuE=;
 b=d1g8VLkvpKLDDxYfkUArJw9BAE9k2usXcMWxipgKQPolROWfUNZkjWBPRsWnVsrVkmt8Q8
 g/s9Fjivv/XHOIb/BeFS4yTSilcrfnbjX3WU7QOd5YHpzoThGptK80uJHoIE7UJuJc670Y
 WapRJk40NAJtnNwSD8j6WkEm8KyYHgE=
Date: Mon, 31 Aug 2020 00:55:46 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/2] drm/ingenic: Fix leak of device_node pointer
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <YOFWFQ.M1IUN63RB1ZA1@crapouillou.net>
In-Reply-To: <20200829210727.GE796939@ravnborg.org>
References: <20200827114404.36748-1-paul@crapouillou.net>
 <20200829210727.GE796939@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 31 Aug 2020 09:12:27 +0000
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
Cc: David Airlie <airlied@linux.ie>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Le sam. 29 ao=FBt 2020 =E0 23:07, Sam Ravnborg <sam@ravnborg.org> a =

=E9crit :
> On Thu, Aug 27, 2020 at 01:44:03PM +0200, Paul Cercueil wrote:
>>  of_graph_get_remote_node() requires of_node_put() to be called on =

>> the
>>  device_node pointer when it's no more in use.
>> =

>>  Fixes: fc1acf317b01 ("drm/ingenic: Add support for the IPU")
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thanks. Both patches pushed to drm-misc-fixes.

Cheers,
-Paul

>>  ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 1 +
>>   1 file changed, 1 insertion(+)
>> =

>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =

>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index ada990a7f911..c1bcb93aed2d 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -978,6 +978,7 @@ static int ingenic_drm_probe(struct =

>> platform_device *pdev)
>>   	}
>> =

>>   	drm_of_component_match_add(dev, &match, compare_of, np);
>>  +	of_node_put(np);
>> =

>>   	return component_master_add_with_match(dev, &ingenic_master_ops, =

>> match);
>>   }
>>  --
>>  2.28.0


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
