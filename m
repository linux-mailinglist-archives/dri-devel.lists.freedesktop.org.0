Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7DA9713B6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E62110E35E;
	Mon,  9 Sep 2024 09:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Bl3z97aA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com
 [91.218.175.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D567E10E357
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 09:31:59 +0000 (UTC)
Message-ID: <b8c5d719-5214-4e3a-84c5-b8767cd6ab7e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725874316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1FfY+P7ZZq0qErrG/rtogTk8M5gxtrNoLyw/ceH66qw=;
 b=Bl3z97aA9atJ3P5QPUdShqBtJgMZnc4lBHajMHa31vgnCtkrahWYepsyJRrALVTvajAGaH
 mepTV60NXDC5wzoMXlMDehU6z/yLF07HTKSGQLMrrd/yh/ZFKGyYE29fmfnuY2Hy2CT9z1
 b+yZtDtxDMLNKu5VGq9cbTZnsYxxOAs=
Date: Mon, 9 Sep 2024 15:01:26 +0530
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/4] drm/tidss: Add OLDI bridge support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Francesco Dolcini <francesco@dolcini.it>, max.krummenacher@toradex.com
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Randolph Sapp <rs@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
References: <20240716084248.1393666-1-a-bhatia1@ti.com>
 <20240906114311.GA32916@francesco-nb>
 <c60d518b-ace4-48a8-87e5-35de13bc426a@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <c60d518b-ace4-48a8-87e5-35de13bc426a@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thank you, Francesco and Max, for testing and reporting this!

On 09/09/24 13:45, Tomi Valkeinen wrote:
> Hi,
> 
> On 06/09/2024 14:43, Francesco Dolcini wrote:
>> +Max
>>
>> Hello Aradhya,
>>
>> On Tue, Jul 16, 2024 at 02:12:44PM +0530, Aradhya Bhatia wrote:
>>> The addition of the 2nd OLDI TX (and a 2nd DSS in AM62Px) creates a need
>>> for some major changes for a full feature experience.
>>>
>>> 1. The OF graph needs to be updated to accurately show the data flow.
>>> 2. The tidss and OLDI drivers now need to support the dual-link and the
>>>     cloned single-link OLDI video signals.
>>> 3. The drivers also need to support the case where 2 OLDI TXes are
>>>     connected to 2 different VPs - thereby creating 2 independent
>>> streams
>>>     of single-link OLDI outputs.
>>
>> Have you considered/tested the use case in which only single link is
>> used?
>> You do not mention it here and to me this is a relevant use case.
>>
>> There is a workaround for this (use option 2, cloned, even if nothing is
>> connected to the second link), but this seems not correct.

I agree. The whole idea behind the series is to be able to accurately
describe the hardware. Putting the devicetree in clone mode in order to
get the single-link mode working is far from ideal.

>>
>> We (Max in Cc here) noticed that this specific use case is broken on
>> your downstream v6.6 TI branch.

Yes, it was been brought to my attention that the single-link usecase is
not working over the downstream ti-6.6 kernel. As I have since
discovered, it's not working on this series either.

For some reason, the supplier-consumer dependency between the OLDI and
the panel devicetree nodes is not getting flagged as `FWLINK_FLAG_CYCLE`
in cases of single-link configuration.

This flag allows the panel driver to continue to probe without waiting
for the OLDI driver (panel's supplier). Absence of the flag getting set
is causing these drivers to keep deferring probe in an endless cycle.

Even with the flag, the OLDI (and tidss) cannot complete probe until the
panel driver is probed and ready. That is because the OLDI (and tidss)
need the panel to continue with the bridge-chain creation.

However, over with the dual-lvds configuration (and as Francesco has
now mentioned the clone configuration as well), the flag gets set by
default, and everything works.

This is what the debug has led to, so far.

> 
> What if you set "fw_devlink=off" kernel boot parameter?
> 

Yes! I haven't tested it, but it seems that this will bypass the
supplier check and let the panel probe continue.


Tomi, any idea, why is this issue happening only for single-link in the
first place? It seems as if having 2 ports inside the panel devicetree
lets the probe mechanism recognize the circular dependency and ignore
the supplier OLDIs?

This is the function where the difference comes down to, by the way -
__fw_devlink_relax_cycles(), per my knowledge. I am still on my way to
understand what exactly it is doing and why is it not relaxing the
single-link case.


Regards
Aradhya


