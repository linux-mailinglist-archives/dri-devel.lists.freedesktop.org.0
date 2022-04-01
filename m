Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEA54EE5A5
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 03:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A06310E3D5;
	Fri,  1 Apr 2022 01:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF8110E3D2
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 01:22:28 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A3ECE83ACE;
 Fri,  1 Apr 2022 03:22:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648776146;
 bh=yaml4ahKYPk02MuOU5kh0YRFPUUGjF77bT2P/r7MAd8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dc0k9FsQ/lNOsCGjbQZ6Hz17+ZnsO8n4sC187GzhfUgc+ZyJ3mWNTgBBoV/5zg+D4
 IT3rknMP+DWH5b0pBuX+VWE2Gkw7X+Z8w9+GqfbEpCKTbU1EPCPTP9Mo32dieQes+C
 BGBMvKydQaOhhyVr+9sCVExObSGQJOi9HyTOR35JCTXN9pn8hETsLvRSk8EzHJiSy6
 ysPucWWQyRzH5tpK7b26fIS9WFyAUatpGXgsmg7Vu+F8U2jUoqwpsFaUZv3Uj9tKPg
 xE+bIU0b6E6f0ziHjRDC/s+3Q68HSakvzfJ8EDwAyg50FkPH6dnKsYxm1LowJCeqgp
 fkXEWoM2X4N5Q==
Message-ID: <b3dcf3fe-63a0-fbef-a3c4-f42e8cd395fe@denx.de>
Date: Fri, 1 Apr 2022 03:22:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: display: bridge: Drop requirement on input
 port for DSI devices
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Maxime Ripard <maxime@cerno.tech>
References: <20220323154823.839469-1-maxime@cerno.tech>
 <YkY+1IZtQ8oSi7wR@robh.at.kernel.org>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <YkY+1IZtQ8oSi7wR@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/1/22 01:52, Rob Herring wrote:
> On Wed, 23 Mar 2022 16:48:23 +0100, Maxime Ripard wrote:
>> MIPI-DSI devices, if they are controlled through the bus itself, have to
>> be described as a child node of the controller they are attached to.
>>
>> Thus, there's no requirement on the controller having an OF-Graph output
>> port to model the data stream: it's assumed that it would go from the
>> parent to the child.
>>
>> However, some bridges controlled through the DSI bus still require an
>> input OF-Graph port, thus requiring a controller with an OF-Graph output
>> port. This prevents those bridges from being used with the controllers
>> that do not have one without any particular reason to.
>>
>> Let's drop that requirement.
>>
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>> ---
>>   .../devicetree/bindings/display/bridge/chipone,icn6211.yaml      | 1 -
>>   .../devicetree/bindings/display/bridge/toshiba,tc358762.yaml     | 1 -
>>   2 files changed, 2 deletions(-)
>>
> 
> I tend to agree with port@0 not being needed and really like
> consistency.

The consistent thing to do would be to always use port@0 and OF graph, no ?
