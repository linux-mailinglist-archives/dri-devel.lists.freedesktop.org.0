Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A3C7F64CC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 18:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B61610E098;
	Thu, 23 Nov 2023 17:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [IPv6:2001:41d0:203:375::ba])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E9E10E098
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 17:04:50 +0000 (UTC)
Message-ID: <77c3ad35-24e4-4bf4-87a1-f48e13a6b838@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1700759088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t+oX6Z1R5D902d7QsFYgso+yPiFC9aIghMuoj3BGEfk=;
 b=jQfW6O848KtMwh90BwxowE88Yb2tw+fOohmBQXIG8fxTKGnbKn2PtIDmXCf4nr6b33NCYX
 0e5e8sXTeNgxpDwySP5U7QKWB/PF2eUQjAWP0ZZ3z3DycIHjYqF/wHRzBzo66GoB5Ot3S2
 TFre8bWupfsIEedGtc55MJAzC401+bU=
Date: Fri, 24 Nov 2023 01:04:43 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 8/8] drm/bridge: it66121: Allow link this driver as a lib
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-9-sui.jingfeng@linux.dev>
 <CAA8EJprQq3aDhzE+yKGZ2-nsuHWcptzMvApsyOi9D63PgeiZ3w@mail.gmail.com>
 <79301d04-c0cb-4740-8a6d-27a889b65daf@linux.dev>
 <CAA8EJpom5kAbDkacOdqp6BR7YPfmCSXaQfDYRVcLf9eGmi64CQ@mail.gmail.com>
 <121163c9-0d56-47ad-a12e-e67390fef2b4@linux.dev>
 <CAA8EJpowjhX=LL-9cnQL4pfCei63zNkCGW5wGOeeFxcnFpNCVA@mail.gmail.com>
 <00ba2245-0e48-4b21-bcd4-29dfb728e408@linux.dev>
 <CAA8EJpoiehS2wS3ri_DggzxeEfLY4yK7X6c+bCFKvkwSce6r+A@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <CAA8EJpoiehS2wS3ri_DggzxeEfLY4yK7X6c+bCFKvkwSce6r+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/11/23 16:08, Dmitry Baryshkov wrote:
>>> The host can not specify the
>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, it will cause a warning here. And
>>> it can not omit the flag (as otherwise the first bridge will create a
>>> connector, without consulting the second bridge).
>> The semantics of DRM_BRIDGE_ATTACH_NO_CONNECTOR flagare implement-defined,
> No, they are not. Semantics are pretty simple: do not create the
> drm_connector instance. Pass the flag to the next bridge in the chain.
>
>> for our case, I could just ignore it if their
>> don't have a signal(DT or ACPI) tell me that there are multiple bridges
>> in the chain. This depend on community's attitude.
> Ignoring a flag is a bad idea.


Can you also read the code in the bridge/lontium-lt8912.c please?
when flags == 0 is true, the lt8912 driver will just create
a drm_connector instance in the drm bridge drivers. The behavior
is similar with this patch in the perspective of spirit.

And the most important thing is that no matter what the flag the upstream
port is passed, lt8912 just always pass the DRM_BRIDGE_ATTACH_NO_CONNECTOR
flags to the next bridge. Does this count as a kind of ignore? or

This is to say that both the lt8912 and the tfp410 drm bridge drivers are
allowing create a drm_connector manually in drm bridge drivers. They didn't
being asked to move the drm_connector related code to display controller
driver. I don't know why I can't follow this way?

Do you really read the code before do comments or I failed to understand something?

