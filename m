Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E459E2A91
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 19:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC52D10E497;
	Tue,  3 Dec 2024 18:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="V9qoUSjI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872CD10E497
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 18:15:30 +0000 (UTC)
Message-ID: <b8bde033-13a8-4726-a9ff-2fa4eff898e1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1733249727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/d6d21lYDvEFZiQrySVvNDh1sU8fuz6MdG1q72i45IU=;
 b=V9qoUSjI7EsoODFNlUsz+6kzYDm+vLmfMrzU58PdFBqKNq4K6EbSDCZpEzrvtvsDleq6X/
 lvYlX2Vpf1PANTfSnRQ7vUc/O8yBYK+NDtT0axw/iAUMFx54f/MT7ojgOI9gGpXDNfMMzs
 m62ISwNM0CUjQeFHObWvuIDyWidawdg=
Date: Tue, 3 Dec 2024 23:44:27 +0530
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/3] drm/tidss: Add OLDI bridge support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Max Krummenacher <max.oss.09@gmail.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20241124143649.686995-1-aradhya.bhatia@linux.dev>
 <8b57d6a4-6bc1-4542-abf4-8bc4a3120c25@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <8b57d6a4-6bc1-4542-abf4-8bc4a3120c25@ideasonboard.com>
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

On 03/12/24 17:42, Tomi Valkeinen wrote:
> Hi,
> 
> On 24/11/2024 16:36, Aradhya Bhatia wrote:
>> Hello all,
>>
>> This patch series add support for the dual OLDI TXes supported in Texas
>> Instruments' AM62x and AM62Px family of SoCs. The OLDI TXes support
>> single-lvds
>> lvds-clone, and dual-lvds modes. These have now been represented
>> through DRM
>> bridges within TI-DSS.
>>
>>   - Some history and hardware description for this patch series.
>>
>> This patch series is a complete re-vamp from the previously posted
>> series[1] and
>> hence, the version index has been reset to v1. The OLDI support from
>> that series
>> was dropped and only the base support for AM62x DSS was kept (and
>> eventually
>> merged)[2].
>>
>> The OLDI display that the tidss driver today supports, could not be
>> extended for
>> the newer SoCs. The OLDI display in tidss is modelled after the DSS
>> and OLDI
>> hardware in the AM65x SoC. The DSS in AM65x SoC, has two video-ports.
>> Both these
>> video-ports (VP) output DPI video signals. One of the DPI output (from
>> VP1) from
>> the DSS connects to a singular OLDI TX present inside the SoC. There
>> is no other
>> way for the DPI from VP1 to be taken out of the SoC. The other DPI output
>> however - the one from VP2 - is taken out of the SoC as is. Hence we
>> have an
>> OLDI bus output and a DPI bus output from the SoC. Since the VP1 and
>> OLDI are
>> tightly coupled, the tidss driver considers them as a single entity.
>> That is
>> why, any OLDI sink connects directly to the DSS ports in the OF graphs.
>>
>> The newer SoCs have varying DSS and OLDI integrations.
>>
>> The AM62x DSS also has 2 VPs. The 2nd VP, VP2, outputs DPI signals
>> which are
>> taken out of the SoC - similar to the AM65x above. For the VP1, there
>> are 2 OLDI
>> TXes. These OLDI TXes can only receive DPI signals from VP1, and don't
>> connect
>> to VP2 at all.
>>
>> The AM62Px SoC has 2 OLDI TXes like AM62x SoC. However, the AM62Px SoC
>> also has
>> 2 separate DSSes. The 2 OLDI TXes can now be shared between the 2 VPs
>> of the 2
>> DSSes.
>>
>> The addition of the 2nd OLDI TX (and a 2nd DSS in AM62Px) creates a
>> need for
>> some major changes for a full feature experience.
>>
>> 1. The OF graph needs to be updated to accurately show the data flow.
>> 2. The tidss and OLDI drivers now need to support the dual-link and
>> the cloned
>>     single-link OLDI video signals.
>> 3. The drivers also need to support the case where 2 OLDI TXes are
>> connected to
>>     2 different VPs - thereby creating 2 independent streams of
>> single-link OLDI
>>     outputs.
>>
>> Note that the OLDI does not have registers of its own. It is still
>> dependent on
>> the parent VP. The VP that provides the DPI video signals to the OLDI
>> TXes, also
>> gives the OLDI TXes all the config data. That is to say, the hardware
>> doesn't
>> sit on the bus directly - but does so through the DSS.
>>
>> In light of all of these hardware variations, it was decided to have a
>> separate
>> OLDI driver (unlike AM65x) but not entirely separate so as to be a
>> platform
>> device. The OLDI TXes are now being represented as DRM bridges under
>> the tidss.
>>
>> Also, since the DRM framework only really supports a linear encoder-
>> bridge
>> chain, the OLDI driver creates a DRM bridge ONLY for the primary OLDI
>> TX in
>> cases of dual-link or cloned single-link OLDI modes. That bridge then
>> attaches
> 
> How does the clone case work, then? There are two panels, what does the
> second one connect to?

For the clone case, the devicetree will show the true connections - as
they are in the hardware.

2 endpoints from a single DSS VP devicetree port will be connected to 2
OLDIs, OLDI0 and OLDI1. The outputs of these OLDIs will be connected to
2 distinct single-link panels.

The driver and DRM side of things do not show the same picture, however.
The tidss_oldi code creates and registers a drm_bridge only for the
primary OLDI. The driver is capable of detecting the expected OLDI mode,
and if a companion OLDI is present, then the primary OLDI drm_bridge
keeps a note of that.

The clock and config resources are shared between the primary and
companion OLDI hardware. So configuring the primary OLDI takes care of
the companion too.
The only case where it is not shared is the OLDI IO bit in the Control
MMR (ctrl_mmr) region. But, since the primary OLDI drm_bridge remains
aware about the presence of companion OLDI, it makes sure to enable /
disable the comapnion OLDI IO when required.

> 
>> to the tidss's display core - which consists of a CRTC, an Encoder
>> (dummy) and a
>> bridge (dummy). On the other end, it attaches to OLDI sinks (panels or
>> other
>> bridges).
>>
>> Since the OLDI TX have a hardware dependency with the VP, the OLDI
>> configuration
>> needs to happen before that VP is enabled for streaming. VP stream
>> enable takes
>> place in tidss_crtc_atomic_enable hook. I have posted a patch allowing
>> DRM
>> bridges to get pre-enabled before the CRTC of that bridge is
>> enabled[0]. Without
>> that patch, some warnings or glitches can be seen.
>>
>> These patches have been tested on AM625 based Beagleplay[3] platform
>> with a
>> Lincolntech LCD185 dual-lvds panel. The patches with complete support
>> including
>> the expected devicetree configuration of the OLDI TXes can be found in
>> the
>> "next_oldi_v4_tests" branch of my github fork[4]. This branch also has
>> support
>> for Microtips dual-lvds panel (SK-LCD1) which is compatible with the
>> SK-AM625
>> EVM platform.
>>
>> Due to lack of hardware, I haven't been able to test single-link / cloned
>> single-link OLDI modes. I have only used a sample cloned single-link
>> DTBO and
>> booted the board with it. I didn't see any probe_deferred errors (as seen
>> previously), and the `kmsprint` utility enumerated the display details
>> fine.
>>
>> Regardless, I'd appreciate it if somebody can test it, and report back
>> if they
>> observe any issues.
>>
>> Thanks,
>> Aradhya
>>
>>
>> Additional Notes:
>>
>> * Important note about a false positive in dtbs_check *
>> Both the ports, port0 and port1, are required for the OLDI
>> functionality to
>> work. The schema suggests this condition too. Additionally, the OLDI
>> devicetree
>> node is expected to be defined in the soc.dtsi file, and kept as
>> disabled.
>> Over the current platforms (Beagleplay and SK-AM625 EVM), the OLDI
>> panel is not
>> always attached, and hence we use a DT overlay to add panel details -
>> which is
>> where we enable the OLDI nodes. The structure of files is like this -
>>
>> - soc.dtsi                  (OLDI disabled)
>> - soc-baseboard.dts         (OLDI disabled)
>> - soc-baseboard-panel.dtso  (OLDI enabled)
>>
>> During dtbs_check runs, it was observed that the check was not able to
>> rule out
>> OLDI issues even when its DT was disabled in the soc-baseboard.dts. It is
>> impractical and impossible to add OLDI ports prior to the panel
>> overlay file.
>> While the dtbs_check usually ignores checking disabled devicetree
>> nodes, it was
>> unable to do so in the OLDI's case.
> 
> While there might be something amiss with dtbs_check, what's the problem
> with adding both port nodes to the soc.dtsi? If you have no endpoints
> there, it's not connected to anything.
>

Ran dtbs_check with this. The errors are silenced indeed. I didn't
really like having empty ports in an already long DSS devicetree node,
but this way the checks remain clean. I will use this for DT patches.
Thank you! =)

> 
[...]
> 

-- 
Regards
Aradhya

