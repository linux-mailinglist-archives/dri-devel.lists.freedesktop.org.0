Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC268D7DAB
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 10:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356C310E308;
	Mon,  3 Jun 2024 08:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC9A10E308
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 08:44:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EEADD60C6B;
 Mon,  3 Jun 2024 08:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6A5C2BD10;
 Mon,  3 Jun 2024 08:44:44 +0000 (UTC)
Message-ID: <75274526-66c8-4ebf-8842-d753bd4353a5@xs4all.nl>
Date: Mon, 3 Jun 2024 10:44:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] Add Chameleon v3 video support
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>, airlied@gmail.com,
 akpm@linux-foundation.org, conor+dt@kernel.org, daniel@ffwll.ch,
 dinguyen@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org, mripard@kernel.org,
 robh+dt@kernel.org, tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 chromeos-krk-upstreaming@google.com
References: <20240507155413.266057-1-panikiel@google.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240507155413.266057-1-panikiel@google.com>
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

Hi Paweł,

On 07/05/2024 17:54, Paweł Anikiel wrote:
> Google Chameleon v3 is a testing device capable of emulating multiple
> DisplayPort monitors, used for testing purposes.  It is based on an Arria
> 10 SoCFPGA.  This patchset adds V4L2 drivers for two IP blocks used in the
> device's FPGA: the Chameleon v3 video interface, and the Intel DisplayPort
> RX IP.  The former is a video capture device that takes video signal and
> writes frames into memory, which can be later processed by userspace.
> The latter is a DisplayPort receiver IP from Intel, its datasheet can
> be found at:
> https://www.intel.com/programmable/technical-pdfs/683273.pdf
> 
> The video interface driver is a regular v4l2 capture device driver, while
> the DP RX driver is a v4l2 subdevice driver. In order to avoid code
> duplication, some parts of the DisplayPort code from the DRM subsystem
> were put into headers usable by the DP RX driver.
> 
> This patchset depends on changes merged into the linux-media tree at:
> git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.10d
> 
> Here is the output of `v4l2-compliance -s` run on a Chameleon v3 for
> /dev/video0 (no attached subdevice):

This v3 series looks pretty good to me, so from a V4L2 perspective I believe
a v4 should be OK.

But I need Acked-by for the drm and bindings patches before I can
merge a v4.

Regards,

	Hans

> 
> ```
> v4l2-compliance 1.27.0-5204, 32 bits, 32-bit time_t
> v4l2-compliance SHA: dd049328e528 2024-04-29 13:40:09
> 
> Compliance test for chv3-video device /dev/video0:
> 
> Driver Info:
> 	Driver name      : chv3-video
> 	Card type        : Chameleon v3 video
> 	Bus info         : platform:c0060500.video
> 	Driver version   : 6.9.0
> 	Capabilities     : 0x84200001
> 		Video Capture
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04200001
> 		Video Capture
> 		Streaming
> 		Extended Pix Format
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 1 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
> 	test VIDIOC_DV_TIMINGS_CAP: OK
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 2 Private Controls: 0
> 
> Format ioctls (Input 0):
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 	test TIME32/64: OK
> 
> Test input 0:
> 
> Streaming ioctls:
> 	test read/write: OK (Not Supported)
> 	test blocking wait: OK
> 	test MMAP (no poll): OK
> 	test MMAP (select): OK
> 	test MMAP (epoll): OK
> 	test USERPTR (no poll): OK (Not Supported)
> 	test USERPTR (select): OK (Not Supported)
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for chv3-video device /dev/video0: 55, Succeeded: 55, Failed: 0, Warnings: 0
> ```
> 
> Here is the output of `v4l2-compliance -s` run on a Chameleon v3 for
> /dev/video4 (attached subdevice):
> 
> ```
> v4l2-compliance 1.27.0-5204, 32 bits, 32-bit time_t
> v4l2-compliance SHA: dd049328e528 2024-04-29 13:40:09
> 
> Compliance test for chv3-video device /dev/video4:
> 
> Driver Info:
> 	Driver name      : chv3-video
> 	Card type        : Chameleon v3 video
> 	Bus info         : platform:c0060600.video
> 	Driver version   : 6.9.0
> 	Capabilities     : 0x84200001
> 		Video Capture
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x04200001
> 		Video Capture
> 		Streaming
> 		Extended Pix Format
> 
> Required ioctls:
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video4 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 1 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
> 	test VIDIOC_DV_TIMINGS_CAP: OK
> 	test VIDIOC_G/S_EDID: OK
> 
> Control ioctls (Input 0):
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> 	test VIDIOC_QUERYCTRL: OK
> 	test VIDIOC_G/S_CTRL: OK
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 2 Private Controls: 0
> 
> Format ioctls (Input 0):
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_REMOVE_BUFS: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 	test TIME32/64: OK
> 
> Test input 0:
> 
> Streaming ioctls:
> 	test read/write: OK (Not Supported)
> 	test blocking wait: OK
> 	test MMAP (no poll): OK
> 	test MMAP (select): OK
> 	test MMAP (epoll): OK
> 	test USERPTR (no poll): OK (Not Supported)
> 	test USERPTR (select): OK (Not Supported)
> 	test DMABUF: Cannot test, specify --expbuf-device
> 
> Total for chv3-video device /dev/video4: 55, Succeeded: 55, Failed: 0, Warnings: 0
> ```
> 
> v3 changes:
>   - Send v4l2-subdev API changes as a separate patchset
>   - Drop chameleonv3/ directory
>   - Change capture device name from "framebuffer" to "video interface"
>   - Set sensible min and max dv timing caps
>   - Set pixelclock to htotal * vtotal * 24Hz (we can't detect the actual value)
>   - Remove enum_framesizes
>   - Use v4l2_match_dv_timings()
>   - Add V4L2_CID_DV_RX_POWER_PRESENT control
>   - Use V4L2_DV_BT_CEA_1920X1080P60 as default timing
>   - Use vb2_video_unregister_device()
>   - Move subdev pad initialization to probe
>   - Change subdev entity function to MEDIA_ENT_F_DV_DECODER
>   - Drop dprx 'port' property and always use 'ports' instead
>   - Remove legacy-format property and use multiple compats
>   - Cleanup notifier only in non-fallback mode
>   - Cleanup subdev entity using media_entity_cleanup()
>   - Increase HPD pulse length to 500ms (see comment in dprx_set_edid())
>   - Pull HPD low before updating EDID
>   - Add a DisplayPort media bus type
>   - Move receiver properties to port endpoint (data-lanes, link-frequencies)
> 
> v2 changes:
>   - Add missing includes in dt binding examples
>   - Add version number to intel,dprx compatible
>   - Use generic node names in dts
>   - Add and document IP configuration parameters
>   - Remove IRQ registers from intel-dprx (they're not a part of the IP)
>   - Remove no-endpoint property and check for "port" node instead
> 
> Paweł Anikiel (10):
>   media: Add Chameleon v3 video interface driver
>   drm/dp_mst: Move DRM-independent structures to separate header
>   lib: Move DisplayPort CRC functions to common lib
>   drm/display: Add mask definitions for DP_PAYLOAD_ALLOCATE_* registers
>   media: dt-bindings: video-interfaces: Support DisplayPort MST
>   media: v4l2-mediabus: Add support for DisplayPort media bus
>   media: intel: Add Displayport RX IP driver
>   media: dt-bindings: Add Chameleon v3 video interface
>   media: dt-bindings: Add Intel Displayport RX IP
>   ARM: dts: chameleonv3: Add video device nodes
> 
>  .../bindings/media/google,chv3-video.yaml     |   64 +
>  .../devicetree/bindings/media/intel,dprx.yaml |  172 ++
>  .../bindings/media/video-interfaces.yaml      |    7 +
>  .../socfpga/socfpga_arria10_chameleonv3.dts   |  194 ++
>  drivers/gpu/drm/display/Kconfig               |    1 +
>  drivers/gpu/drm/display/drm_dp_mst_topology.c |   76 +-
>  drivers/media/platform/Kconfig                |    1 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/google/Kconfig         |   13 +
>  drivers/media/platform/google/Makefile        |    3 +
>  drivers/media/platform/google/chv3-video.c    |  891 +++++++
>  drivers/media/platform/intel/Kconfig          |   12 +
>  drivers/media/platform/intel/Makefile         |    1 +
>  drivers/media/platform/intel/intel-dprx.c     | 2283 +++++++++++++++++
>  drivers/media/v4l2-core/v4l2-fwnode.c         |   38 +
>  include/drm/display/drm_dp.h                  |    9 +-
>  include/drm/display/drm_dp_mst.h              |  238 ++
>  include/drm/display/drm_dp_mst_helper.h       |  232 +-
>  include/dt-bindings/media/video-interfaces.h  |    2 +
>  include/linux/crc-dp.h                        |   10 +
>  include/media/v4l2-fwnode.h                   |    5 +
>  include/media/v4l2-mediabus.h                 |   17 +
>  lib/Kconfig                                   |    8 +
>  lib/Makefile                                  |    1 +
>  lib/crc-dp.c                                  |   78 +
>  25 files changed, 4053 insertions(+), 304 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/google,chv3-video.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.yaml
>  create mode 100644 drivers/media/platform/google/Kconfig
>  create mode 100644 drivers/media/platform/google/Makefile
>  create mode 100644 drivers/media/platform/google/chv3-video.c
>  create mode 100644 drivers/media/platform/intel/intel-dprx.c
>  create mode 100644 include/drm/display/drm_dp_mst.h
>  create mode 100644 include/linux/crc-dp.h
>  create mode 100644 lib/crc-dp.c
> 

