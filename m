Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D97E962AD4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 16:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDBD10E55A;
	Wed, 28 Aug 2024 14:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B1910E55A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 14:52:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BD135A415D3;
 Wed, 28 Aug 2024 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD67C98EEB;
 Wed, 28 Aug 2024 14:14:34 +0000 (UTC)
Message-ID: <83b8be7b-a2c5-42f8-a42b-93dfc528a414@xs4all.nl>
Date: Wed, 28 Aug 2024 16:14:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 0/6] drm/omap: hdmi: improve hdmi4 CEC, add CEC for hdmi5
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Andreas Kemnade <andreas@kemnade.info>
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
 <43F64377-8394-448F-A6F0-4DA11DB9AEF5@goldelico.com>
 <3c36b0cd-7b43-4a63-a832-1d8d14a4512a@ideasonboard.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <3c36b0cd-7b43-4a63-a832-1d8d14a4512a@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 28/08/2024 15:57, Tomi Valkeinen wrote:
> Hi,
> 
> On 25/08/2024 23:31, H. Nikolaus Schaller wrote:
>> Hi,
>> CEC features are useful to e.g. control HDMI monitor standby.
>>
>> But I wonder what happened to this series?
>>
>> I could find some reviewed-by: and acked-by: in [1] but it wasn't merged upstream
>> for unidentifiable reasons.
>>
>> We apparently had merged this series some years ago into our LetuxOS distro kernel
>> and now we found it to be broken (NULL dereference) at least for omap5uevm
>> (and likely Pyra Handheld) after rebasing to v6.11-rc (it was already broken
>> since v6.9-rc1). Fixes were not difficult, but it would be better if it were
>> part of upstream.
> 
> There was a v3:
> 
> 20210428132545.1205162-1-hverkuil-cisco@xs4all.nl
> 
> I see there was a concern from Laurent in:
> 
> YLjMZiX71mcQNQdO@pendragon.ideasonboard.com
> 
> And we need an ack from the bridge maintainers for the drm_bridge parts. But the series is three years old, so I think someone would have to rebase on top of mainline and re-test and re-send first.

I never really followed up with this. I still have the hardware, it is primarily
time. And also that for me this is quite low priority since I don't use omap5.

If someone wants to refresh this series and post it, then I would have no problem
with it.

Regards,

	Hans

> 
>  Tomi
> 
>> BR and thanks,
>> Nikolaus
>>
>> [1] https://lore.kernel.org/r/all/20210302162403.983585-4-hverkuil-cisco@xs4all.nl/T/
>>
>>> Am 02.03.2021 um 17:23 schrieb Hans Verkuil <hverkuil-cisco@xs4all.nl>:
>>>
>>> This series improves the drm_bridge support for CEC by introducing two
>>> new bridge ops in the first patch, and using those in the second patch.
>>>
>>> This makes it possible to call cec_s_conn_info() and set
>>> CEC_CAP_CONNECTOR_INFO for the CEC adapter, so userspace can associate
>>> the CEC adapter with the corresponding DRM connector.
>>>
>>> The third patch simplifies CEC physical address handling by using the
>>> cec_s_phys_addr_from_edid helper function that didn't exist when this
>>> code was originally written.
>>>
>>> The fourth patch adds the cec clock to ti,omap5-dss.txt.
>>>
>>> The fifth patch the missing cec clock to the dra7 and omap5 device tree,
>>> and the last patch adds CEC support to the OMAP5 driver.
>>>
>>> Tested with a Pandaboard and a Beagle X15 board.
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>> Changes since v1:
>>>
>>> - as per suggestion from Laurent, changed cec_init/exit to
>>>   connector_attach/_detach which are just called for all
>>>   bridges. The DRM_BRIDGE_OP_CEC was dropped.
>>>
>>> - added patch to add the cec clock to ti,omap5-dss.txt
>>>
>>> - swapped the order of the last two patches
>>>
>>> - incorporated Tomi's suggestions for the hdmi5 CEC support.
>>>
>>> Hans Verkuil (6):
>>>   drm: drm_bridge: add connector_attach/detach bridge ops
>>>   drm/omapdrm/dss/hdmi4: switch to the connector bridge ops
>>>   drm/omapdrm/dss/hdmi4: simplify CEC Phys Addr handling
>>>   dt-bindings: display: ti: ti,omap5-dss.txt: add cec clock
>>>   dra7.dtsi/omap5.dtsi: add cec clock
>>>   drm/omapdrm/dss/hdmi5: add CEC support
>>>
>>> .../bindings/display/ti/ti,omap5-dss.txt      |   4 +-
>>> arch/arm/boot/dts/dra7.dtsi                   |   5 +-
>>> arch/arm/boot/dts/omap5.dtsi                  |   5 +-
>>> drivers/gpu/drm/drm_bridge_connector.c        |   9 +
>>> drivers/gpu/drm/omapdrm/Kconfig               |   8 +
>>> drivers/gpu/drm/omapdrm/Makefile              |   1 +
>>> drivers/gpu/drm/omapdrm/dss/hdmi.h            |   1 +
>>> drivers/gpu/drm/omapdrm/dss/hdmi4.c           |  40 ++--
>>> drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c       |  13 +-
>>> drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h       |  12 +-
>>> drivers/gpu/drm/omapdrm/dss/hdmi5.c           |  63 +++++-
>>> drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c       | 209 ++++++++++++++++++
>>> drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h       |  42 ++++
>>> drivers/gpu/drm/omapdrm/dss/hdmi5_core.c      |  35 ++-
>>> drivers/gpu/drm/omapdrm/dss/hdmi5_core.h      |  33 ++-
>>> include/drm/drm_bridge.h                      |  27 +++
>>> 16 files changed, 453 insertions(+), 54 deletions(-)
>>> create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c
>>> create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h
>>>
>>> -- 
>>> 2.30.1
>>>
>>
> 

