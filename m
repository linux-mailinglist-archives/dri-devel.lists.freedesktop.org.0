Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF80C68BADA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 11:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7443510E37E;
	Mon,  6 Feb 2023 10:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103E510E175
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 10:58:31 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F300C7FE;
 Mon,  6 Feb 2023 11:58:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1675681108;
 bh=zoIMDWM7LoINFvyuwq3msMMQv8f9FV9gmc4+56s2czY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=owJSnbMD50UvE1/FVYON3b0CKen7jBK1sNC5p4PYVkXhqtKVTH6sMjC+fHluo0Aw8
 QCq7zViTb08kheQGcs6chLZbklOegr9gO8/sefL28DkqQ2UXrfP93j/RCg9k3ehxdw
 i+k7TlSD5eXqalI3SyEgAnGKuLksQEh+8h5IiGXk=
Message-ID: <12ba1f03-d6dd-c9c5-abf0-e9298dc22f28@ideasonboard.com>
Date: Mon, 6 Feb 2023 12:58:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 3/6] drm/tidss: Add support for AM625 DSS
To: Aradhya Bhatia <a-bhatia1@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230125113529.13952-1-a-bhatia1@ti.com>
 <20230125113529.13952-4-a-bhatia1@ti.com>
 <ab6f52bb-a3f5-afda-c037-f009153a0bb6@ideasonboard.com>
 <1662a593-8a5d-9214-8a3e-ef2699a35265@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <1662a593-8a5d-9214-8a3e-ef2699a35265@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/02/2023 16:31, Aradhya Bhatia wrote:
> 
> 
> On 03-Feb-23 21:03, Tomi Valkeinen wrote:
>> On 25/01/2023 13:35, Aradhya Bhatia wrote:
>>> Add support for the DSS controller on TI's new AM625 SoC in the tidss
>>> driver.
>>>
>>> The first video port (VP0) in am625-dss can output OLDI signals through
>>> 2 OLDI TXes. A 3rd output port has been added with "DISPC_PORT_OLDI" bus
>>> type.
>>
>> Not a big thing here as you add support for a new SoC, but the ordering
>> of the patches is not optimal. Here you add the AM625 DSS support, but
>> then you continue actually adding the DSS support (well, mainly OLDI) in
>> the following patches.
>>
>> I think patch 6 could be before this patch. Parts of patch 4 could also
>> be before this patch. The AM65X renames from patch 5 could be before
>> this patch.
> 
> I can move whole of Patch 6 and even of Patch 4 before this one. I have
> mentioned 'AM625-DSS' in a couple comments which I can make generic,
> and the rest everything is SoC-agnostic.
> 
> I haven't tried this, but my concern is if we break patch 5 into 2
> separate patches,
> 
> i. AM65X rename plus SoC based switch case, and
> ii. Addition of AM625 SoC case
> 
> then I might have to overwrite some changes implemented during (i) in
> (ii). I don't suppose that would be okay, would it?

I'm not sure I follow here. Wouldn't (i) be a valid patch in its own? 
Nothing wrong in expanding that later (even if you end up changing a lot 
of it).

That said, I don't think this is a very important topic. There are only 
a few commits in the history that might be problematic. A simple fix 
would be to add all the features first, and only last add the compatible 
string for am625.

Or do all the changes for am625 in a single patch, and try to implement 
all the generic restructuring work before that.

Here we do have to change the vp-to-output mapping management, so maybe 
the second option won't be simple enough, and it's better to do the 
am625 changes in pieces, as in the first option.

So, it's really up to you. Just wanted to raise this possible issue so 
that you are aware of it and can do any easy fixes (if there are such).

> Also, is it important to keep the compatible-addition patches of
> DT-binding and driver next to each other in the series? Or should
> the DT-binding patches should be the first ones? Just curious! =)

I believe the convention is to have the DT-binding changes before you 
add the compatible string to the driver (if I recall right checkpatch or 
some other checking tool complains if you add a driver for a compatible 
that doesn't have a DT binding). Generic restructurings could be before 
the DT patch, of course, but usually I like to keep the DT binding 
changes at the very beginning of the series.

  Tomi

