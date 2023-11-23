Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485197F65C5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 18:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC7E10E305;
	Thu, 23 Nov 2023 17:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com
 [95.215.58.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7C310E320
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 17:52:36 +0000 (UTC)
Message-ID: <10c4ae94-525f-4ac1-9d59-80bb4f7d362e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1700761953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xOb7IjDCHemslGdU76yEhf/PgAy4hmseLlpzuv6m1Uk=;
 b=rvDAMlYFJTRFccWgNKvskgLlDUt2EAgJ4/69cFY/PQwIb4RbG+p4JSMlgU56VNnRzt7Ej/
 XGTJwyXbrBl07dUi7GAgFTfAovsKn7cIWeKdVhlgQVsEFKFnEjGl2fuWQSpgeGHofR1A+m
 PZ13xFlJRMw+z7THsKTVSDQc9Bh/pyY=
Date: Fri, 24 Nov 2023 01:52:26 +0800
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
>> I'm agree with the idea that drm bridges drivers involved toward to a direction
>> that support more complex design, but I think we should also leave a way for the
>> most frequent use case. Make it straight-forward as a canonical design.
> Not having anything connector-related in the drm_bridge driver is a
> canonical design.

What you said is just for the more complex uses case. I can't agree, sorry.

By choosing the word "canonical design", I means that the most frequently used
cases in practice are the canonical design, 95+% motherboards I have seen has
only one *onboard* display bridges chip. For my driver, I abstract the internal
(inside of the chip) encoder as drm_encoder and abstract the external TX chip as
drm_bridge, this design still works very well.


Originally, I means that this is a concept of the hardware design.
You are wrong even through in the software design context, the
transparent simple drm bridge drivers(simple-bridge.c) also *allow*
to create drm connector manually. I don't think I need to emulate
more example, please read the code by youself.

Canonical or not canonical is not a question to argue, if other programmers
are allowed to do such kind of abstraction, I should also allowed too. Thanks.


