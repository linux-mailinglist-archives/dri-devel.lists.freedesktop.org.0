Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6811C99F652
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 20:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E7710E0FD;
	Tue, 15 Oct 2024 18:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="nGjlF9Cd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF95510E0FD
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 18:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1729018474; x=1729623274; i=deller@gmx.de;
 bh=91lKyLXYNbffBLJOzGVYrJfP7I4FaiD9ad6tG5KIXl4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=nGjlF9CdtAG0c98YK/ciOgKpebINerQcE3LXXTTea8ZejCdSyl/1Bv4CvxYs+xPM
 cwaj0jR1/ci4SMrMa9d6lknUwm5FMmEg3K7MiDlRR2yTdZ9282mynazKMh598tviQ
 tj6pdL0SiFVFiaQ6nUTAcXfTwb+blIAxv7DY5EgzRPaFrFO3Wmb7OY+eI5xzXuUp3
 mGA8Jlr7QTBuDn8Cz7qE+F/dvCMIlBsJXF48Rccq26CB6Db+Bo5Vdyq+5hgzVB0sm
 C1O0cPfyELC0IdMiC/cc+4DKb/Ts6iGEvvVCbZGr2vA3tAMOvZgVWlVHaLNJ9crx/
 D3iPwIRAADAgXAkF2Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPog5-1tMYfZ2qN1-00I7Hx; Tue, 15
 Oct 2024 20:54:34 +0200
Message-ID: <5225783c-dd8f-40fd-b2de-03950303cf69@gmx.de>
Date: Tue, 15 Oct 2024 20:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/9] of: property: add
 of_graph_get_next_port/port_endpoint()
To: Rob Herring <robh@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
 <20241015154912.GA1152221-robh@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241015154912.GA1152221-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GJiBUxtzYl2oqmHV1d9isoAr9PnsJlZ8OkBgA62GkofDv5+Ijl/
 xilD91oGq42yO3+wq5saZ8tKGwOdDI/qUjLyk4C7kreQ+AND1b82W8c7o6tp6AyeT0T6KW6
 nKJNfyrpFHZnAEepEaqXM5z88v7T+EtGBnHq7nVAR6o6q8unsPkLYsxBrL6pBNo0skxIt0P
 uZWGFU82Nu+R41bpoCcdg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:keeA0EklhAU=;h2mjlKCsFABIuU2aK1/aBwRZbxC
 IC28uf6WtuK7YC0U+ZszY34hB8rIT4BQAWq9wkS9KSnBf26hSyRFMtApi2BcSx6dAZe/FBKIN
 2zjCBrMtetsVBhjpOMXtWvIbHAbMTNp1vJdheeTylcK4a2XphAqNJz6441x0Umxf31nWtwtu+
 4zs8ckYo0h6GPnMi1h0fFjQgXgcxqrCPA+HpNJ/+Ir0OixR1WosWBDWV+mI0Fiw+CaIeFPqy8
 MJNQDdpaMx0oeGEmxmhvCKkiW77nK5u/q2trXFE/isjJ52iyi4QqudGKDUv3V9894BYoAoRHC
 K7iDQl9SLBfJeo97fm+uYxO9MxztGkpzupied7+QzS6TwdHdpWqTLnNIxz2iE/0hxu2T3UPOx
 F7I8qbq7jf6e3RnhzA8UXMjFRJB2nUawchKLM2DAoUapYZz+JLo40Eh/cVR0PKODKLZMOssfG
 jf/NzXXlv9BiLXE6k+FoTEQouWOqZ99KXW6saKhRFGQCwfItw8ev4uKzSdarEEEkhXuQYX6y4
 RMq0RmIOEgKxDfrowwL7eKUgP3rAUhyOYkuQjnqrCmw1ulXeXa9HmbqVQl5YpucYwEdcj9JHC
 fe9fCKdAL7sAtoNvNn4z3G4RWbUMxnTq+PdtDG2owMHgEUtsas5ljAj2cHw6GtJFryExs5JU8
 NDmDCkCL+LYiTGcevmpFHxH1a5MSNDb+gLqTMRzzY5UxPVuFbX2ShgcC7hl52QKtb3umaFNCD
 i458Qzp4dj/236ItE8T5kBKTRVtiSj5hL2kS7V9XeZo5iKwtGUi3nghyyozdOd6ZShSRkMQ+Q
 iM6mlWHl2NpA7GcgrdaQprdA==
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

On 10/15/24 17:49, Rob Herring wrote:
> On Wed, Oct 09, 2024 at 01:44:30AM +0000, Kuninori Morimoto wrote:
>>
>> Hi Rob, Saravana, Tomi, Laurent, Sakari, Mark
>>
>> This is v7 patch-set
>>
>> Current Of-graph has "endpoint base" for loop, but doesn't have
>> "port base" loop. "endpoint base" loop only is not enough.
>> This patch-set add new "port base" for loop, and use it.
>>
>> v6 -> v7
>> 	- based on latest linus/master branch
>> 	- remove "ports" base functions
>> 	- use "port" base function on "endpoint" function ([3/9])
>> 	- tidyup [1/9] explanation
>>
>> v5 -> v6
>> 	- based on latest linus/master branch
>> 	- [9/9]: fixed compile warrning
>>
>> v4 -> v5
>> 	- tidyup comments
>> 	- [8/9]: parent NULL check was removed
>> 	- [9/9]: use for_each_of_graph_port()
>>
>> v3 -> v4
>> 	- new for_each loop includes __free()
>> 	 - comment indicates to use return_ptr() or no_free_ptr() if
>> 	   it need to continue to use node
>> 	 - each driver based on it
>> 	- care "prev" leak on of_graph_get_next_ports()
>> 	- of_graph_get_next_port_endpoint() indicates WARN() if port
>> 	  has non-endpoint node
>> 	- tidyup each git-log
>>
>> v2 -> v3
>> 	- return NULL if it it doesn't have ports / port
>> 	- add visible comment on of_graph_get_next_ports()
>>
>> v1 -> v2
>> 	- add each Reviewed-by / Acked-by
>> 	- tidyup/update Kernel Docs
>> 	- use prev as parameter
>> 	- update git-log explanation
>> 	- remove extra changes
>>
>> Kuninori Morimoto (9):
>>    of: property: add of_graph_get_next_port()
>>    of: property: add of_graph_get_next_port_endpoint()
>>    of: property: use new of_graph functions
>>    ASoC: test-component: use new of_graph functions
>>    ASoC: audio-graph-card: use new of_graph functions
>>    ASoC: audio-graph-card2: use new of_graph functions
>>    gpu: drm: omapdrm: use new of_graph functions
>>    fbdev: omapfb: use new of_graph functions
>>    media: xilinx-tpg: use new of_graph functions
>
> The DT parts look fine to me now. I see Mark acked this so he's not
> expecting to take it. I can take it,

Speaking for fbdev, I'd be happy if you take them.

> but need acks on the fbdev and media patches.

I just sent Ack for fbdev/drm.

Helge
