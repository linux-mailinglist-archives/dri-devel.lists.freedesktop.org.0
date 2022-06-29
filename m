Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F2E56019E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 15:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC74A10E2AD;
	Wed, 29 Jun 2022 13:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F93310E2AD
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 13:44:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6D907B823B9;
 Wed, 29 Jun 2022 13:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01560C34114;
 Wed, 29 Jun 2022 13:44:10 +0000 (UTC)
Message-ID: <2b6c4772-caa9-c66d-877a-de37e87d3753@xs4all.nl>
Date: Wed, 29 Jun 2022 15:44:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/4] Add Toshiba Visconti DNN image processing accelerator
 driver
Content-Language: en-US
To: yuji2.ishikawa@toshiba.co.jp, robh+dt@kernel.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, sumit.semwal@linaro.org,
 christian.koenig@amd.com
References: <20220428131128.5053-1-yuji2.ishikawa@toshiba.co.jp>
 <b5e35985-c159-6b11-8752-d6dd29fc6a64@xs4all.nl>
 <TYAPR01MB62015F4029956F009EC03FBE92D39@TYAPR01MB6201.jpnprd01.prod.outlook.com>
 <b7b5ac18-b4d2-a801-c2ff-6b48c8b863b9@xs4all.nl>
 <TYAPR01MB62014A1EEA60CA824850179692DF9@TYAPR01MB6201.jpnprd01.prod.outlook.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <TYAPR01MB62014A1EEA60CA824850179692DF9@TYAPR01MB6201.jpnprd01.prod.outlook.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

My apologies for the late reply...

On 01/06/2022 03:40, yuji2.ishikawa@toshiba.co.jp wrote:
> Hi Hans,
> 
> Thank you for your advice.
> I prepared some description of DNN accelerator and its usage.
> 
> #### Handling memory blocks for Visconti5 accelerators
> 
> Visconti5 Image-Processing-Accelerators do not have fine grained IOMMU, as CPU have.
> Therefore, memory region to be passed to the accelerators should be physically contiguous.
> We use DMA-BUF backed by CMA (Contiguous Memory Allocator) to allocate memory regions for sharing between CPU/IPAs.
> Originally, in v4.19 based implementation, the ION allocator was used to allocate DMA-BUF instances.
> For the latest implementation, DMA-BUF HEAPS is used.
> 
> Two structure types are used to represent memory region passed to drivers.
> * struct drv_ipa_buffer_info
>   * to describe whole DMA-BUF instance
> * struct drv_ipa_addr
>   * to describe a memory region in a DMA-BUF instance
> 
> for details, see usage sample of each IPA driver
> 
> 
> #### Image Processing Accelerators overview
> 
> Visconti5 SoC has following image processing accererators
> 
> * AFFINE: 1 input image, 1 output image;                                             Affine transform, Homography transform, Polynomial lens distortion, LUT transform
> * DNN:    N input feature vector, N output feature vector;                           Deep neural network operation
> * PYRAMID 3 input image, 3 * N output image;                                         Resize grayscale/color image with N different parameters
> * DSPIF:  M input image, N output image;                                             Various opeations on images
> * HOX:    1 input image (multi ROI), 1 input dictionary1 likelihood/feature vector;  Extended Histogram of Oriented Gradient based pattern matching
> * HAMAT:  2 input feature vectors: 1 output corrdinate vector;                       Hamming distance matching for stereo vision
> * FLMAT:  3 input image, N input feature point, N output matched point;              Optical flow matching
> * SMLDB:  1 input image, N input feature point, N output feature vector;             Accelerated-KAZE feature descriptor accelerator
> * STMAT:  2 input image, 1 output disparity image;                                   Stereo disparity

It's not really easy to decide what is best. I would say that if both input and output
are images (RGB, YUV, Grayscale), then a V4L2 memory-to-memory driver is what I would
expect to see.

Where that is not the case, then a more custom approach makes sense.

In the list above I would put AFFINE, PYRAMID, DSPIF and possible STMAT in the V4L2
driver group, and the others more as custom drivers.

I think it also depends on how it is used: if a captured sensor image is
typically passed in for further processing, i.e. it is closely related to the
video ISP, then V4L2 is a reasonable choice.

A DNN driver, on the other hand, isn't using images at all, so for that something
like this driver makes sense.

Regards,

	Hans

> 
> see [0] Fig 7.2.1 for block diagram (of prototype chip)
> 
> 
> #### DNN accelerator overview
> 
> DNN accelerator is a proprietary CNN/DCNN processing accelerator developed by Toshiba.
> Visconti5 SoC has 2 instances of DNN acclerator hardware.
> Users convert existing Caffe/ONNX models to Visconti compatible models with an offline tool.
> A converted model "Configuration Binary" includes:
>   * instruction sequence for given network
>   * weight/bias information
>   * DMA configuration from/to global memory (for input/output feature)
> 
> DNN acccelerator can handle either 1 plane or multiple ROIs at a single call.
> 
> see [0] Fig 7.2.2 for block diagram of DNN accelerator
> 
> CNN: Convolutional Neural Network
> DCNN: Deep Convolutional Neural Network
> 
> 
> #### Input / Output
> 
> Input image or feature: base type is either of FP16, FP32, INT8, UINT8, INT16
> Output feature vector:  base type is either of FP16, FP32, INT8, UINT8, INT16
> 
> Input, Output, Weight, Bias can be placed on global memory and loaded/stored with DMA within DNN accelerator.
> These data on global memory can be specified as either of:
>   * single address to point single data block
>   * list of address to point multiple data blocks (i.e. ROIs)
> 
> DNN acclerator driver accepts an instance of "struct drv_dnn_descriptor" which includes addresses of input/output features and a configuration binary.
> 
> 
> #### Descriptor Builder at userland
> 
> Following APIs are provided to build a descriptor instance at userland.
> 
> /* defined in drv_dnn_util.h */
> int32_t drv_DNN_config_descript_init(struct drv_dnn_descriptor *desc, struct drv_ipa_buffer_info *buffer, int32_t buffer_num);
> int32_t drv_DNN_config_exec_configuration(struct drv_dnn_descriptor *desc, const void *configuration_binary,
>                                           struct drv_ipa_addr configuration_binary_addr, struct drv_ipa_addr *src_list,
>                                           struct drv_ipa_addr *dst_list, int32_t list_num, struct drv_ipa_addr temporary_addr,
>                                           int32_t temporary_size);
> int32_t drv_DNN_config_descript_finalize(struct drv_dnn_descriptor *desc);
> 
> struct drv_dnn_descriptor is defined in drivers/soc/visconti/uapi/dnn.h.
> I think this header should be placed anywhere else to be collected on "make headers_install" action of kernel building.
> 
> 
> #### Usage sample (without error handlers)
> 
>     #include <linux/dma-heap.h>
>     #include "drv_ipa.h"
>     #include "drv_dnn.h"
>     #include "drv_dnn_util.h" 
> 
>     int allocate_buffer(int fd_heap, int size) 
>     {
>         struct dma_heap_allocation_data heap_data_in={0};
>         int ret;
> 
>         heap_data_in.len = ROUNDUP_POW2(size);
>         heap_data_in.fd_flags = O_RDWR | O_CLOEXEC;
> 
>         ret = ioctl(fd_heap, DMA_HEAP_IOCTL_ALLOC, &heap_data_in);
>         if (ret <0)
>             return -1;
>         else
>             return heap_data_in.fd;
>     }
> 
>     void dnn_sample(int fd_dnn, int fd_conf, int fd_src, int fd_dst, int fd_temp)
>     {
>         int32_t ret;
>         struct drv_ipa_buffer_info bufinfo[4] = {
>             {.fd=fd_conf, .coherent=true, .direction=DRV_IPA_DIR_TO_DEVICE},
>             {.fd=fd_src,  .coherent=true, .direction=DRV_IPA_DIR_TO_DEVICE},
>             {.fd=fd_dst,  .coherent=true, .direction=DRV_IPA_DIR_FROM_DEVICE},
>             {.fd=fd_temp, .coherent=true, .direction=DRV_IPA_DIR_FROM_DEVICE},
>         };
>         struct drv_ipa_addr conf_addr = {.buffer_index=0, .offset=0};
>         struct drv_ipa_addr src_addr  = {.buffer_index=1, .offset=0};
>         struct drv_ipa_addr dst_addr  = {.buffer_index=2, .offset=0};
>         struct drv_ipa_addr temp_addr = {.buffer_index=3, .offset=0};
>         struct drv_dnn_descriptor desc;
> 
>         struct drv_ipa_addr src_list[] = {src_addr};
>         struct drv_ipa_addr dst_list[] = {dst_addr};
> 
>         uint8_t *config = (uint8_t*)mmap(NULL, DNN_CONF_BIN_SIZE, PROT_READ, MAP_SHARED, fd_conf, 0);
> 
>         drv_DNN_config_descript_init(&desc, bufinfo, 4);
>         drv_DNN_config_exec_configuration(&desc, config, conf_addr, src_list, dst_list, 1, temp_addr, TEMP_BUF_SIZE);
>         drv_DNN_config_descript_finalize(&desc);
> 
>         ioctl(fd_dnn, IOC_IPA_START, &desc);
> 
>         {
>             struct pollfd fds[] = {.fd=fd_dnn, .events=POLL_IN, .revents=0};
>             poll(fds, 1, 1000);
>         }
>     }
> 
>     void sample()
>     {
>         int fd_dnn, fd_heap, fd_conf, fd_src, fd_dst, fd_temp;
> 
>         fd_dnn = open("/dev/dnn0", O_RDWR);
>         fd_heap = open("/dev/dma_heap/linux,cma", O_RDWR);
>         fd_conf = allocate_buffer(fd_heap, DNN_CONF_BIN_ALLOC_SIZE);
>         fd_src  = allocate_buffer(fd_heap, INPUT_IMG_ALLOC_SIZE);
>         fd_dst  = allocate_buffer(fd_heap, OUTPUT_IMG_ALLOC_SIZE);
>         fd_temp = allocate_buffer(fd_heap, TEMP_BUF_ALLOC_SIZE);
> 
>         /* fill in input image and configuration here */
> 
>         dnn_sample(fd_dnn, fd_conf, fd_src, fd_dst, fd_temp);
> 
>         ...
>     };
> 
> 
> #### Reference
> 
> * [0] https://toshiba.semicon-storage.com/content/dam/toshiba-ss-v2/master/en/company/technical-review/pdf/technical-review-18_e.pdf
>   * Fig 7.2.1 shows the whole architecture of prototype chip
>   * Fig 7.2.2 shows the architecture of DNN accelerator
> 
> 
> Regards,
> Yuji
> 
>> -----Original Message-----
>> From: Hans Verkuil <hverkuil@xs4all.nl>
>> Sent: Friday, May 20, 2022 7:03 PM
>> To: ishikawa yuji(石川 悠司 ○ＲＤＣ□ＡＩＴＣ○ＥＡ開)
>> <yuji2.ishikawa@toshiba.co.jp>; robh+dt@kernel.org; iwamatsu nobuhiro(岩松
>> 信洋 □ＳＷＣ◯ＡＣＴ) <nobuhiro1.iwamatsu@toshiba.co.jp>;
>> sumit.semwal@linaro.org; christian.koenig@amd.com
>> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
>> linux-media@vger.kernel.org; dri-devel@lists.freedesktop.org;
>> linaro-mm-sig@lists.linaro.org
>> Subject: Re: [PATCH 0/4] Add Toshiba Visconti DNN image processing
>> accelerator driver
>>
>> Hi Yuji,
>>
>> On 5/20/22 11:48, yuji2.ishikawa@toshiba.co.jp wrote:
>>> Hi Hans,
>>>
>>> Thank you for your comment.
>>> I agree that this submission lacks documents sharing basic idea of the
>> accelerators; what do they accept and what do they yield.
>>> Where can I put a new document? Can I put it as a comment in a source? Can
>> I add a file under Documentation/misc-devices directory?
>>
>> Start with explaining it by replying to this mail. Without knowing anything about
>> the hardware, it is difficult to say what the best place is. Usually it is either the
>> public API header, or somewhere in Documentation.
>>
>> The first step is to have a better understanding of the Visconti image hardware
>> and to see what the best subsystem would be to support that hardware.
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>> Thanks,
>>> Yuji Ishikawa
>>>
>>>> -----Original Message-----
>>>> From: Hans Verkuil <hverkuil@xs4all.nl>
>>>> Sent: Thursday, May 12, 2022 8:15 PM
>>>> To: ishikawa yuji(石川 悠司 ○ＲＤＣ□ＡＩＴＣ○ＥＡ開)
>>>> <yuji2.ishikawa@toshiba.co.jp>; Rob Herring <robh+dt@kernel.org>;
>>>> iwamatsu nobuhiro(岩松 信洋 □ＳＷＣ◯ＡＣＴ)
>>>> <nobuhiro1.iwamatsu@toshiba.co.jp>; Sumit Semwal
>>>> <sumit.semwal@linaro.org>; Christian König
>> <christian.koenig@amd.com>
>>>> Cc: linux-arm-kernel@lists.infradead.org;
>>>> linux-kernel@vger.kernel.org; linux-media@vger.kernel.org;
>>>> dri-devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org
>>>> Subject: Re: [PATCH 0/4] Add Toshiba Visconti DNN image processing
>>>> accelerator driver
>>>>
>>>> Hi Yuji,
>>>>
>>>> On 4/28/22 15:11, Yuji Ishikawa wrote:
>>>>> This series is the DNN image processing accelerator driver for
>>>>> Toshiba's ARM
>>>> SoC, Visconti[0].
>>>>> This provides DT binding documentation, device driver, MAINTAINER
>> files.
>>>>>
>>>>> The second patch "soc: visconti: Add Toshiba Visconti image
>>>>> processing
>>>> accelerator common source"
>>>>> and the fourth patch "MAINTAINERS: ..." are the same as the ones in
>>>>> the
>>>> preceding post for affine driver.
>>>>
>>>> There appears to be no documentation whatsoever, unless I am missing
>>>> something.
>>>>
>>>> How is the uAPI supposed to be used? What does it do? What formats
>>>> does it accept or produce?
>>>>
>>>> If this processes images, then (as Laurent mentioned) this is more
>>>> suitable as a
>>>> V4L2 mem2mem driver.
>>>>
>>>> See
>>>> https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/dev-
>>>> me
>>>> m2mem.html
>>>> and the many drivers in drivers/media that use it (git grep
>> v4l2-mem2mem.h).
>>>>
>>>> But without any explanation whatsoever I have no idea what does or
>>>> does not make sense.
>>>>
>>>> Regards,
>>>>
>>>> 	Hans
>>>>
>>>>>
>>>>> Best regards,
>>>>> Yuji
>>>>>
>>>>> [0]:
>>>>>
>>>>
>> https://toshiba.semicon-storage.com/ap-en/semiconductor/product/image
>>>> -
>>>>> recognition-processors-visconti.html
>>>>>
>>>>> Yuji Ishikawa (4):
>>>>>   dt-bindings: soc: visconti: Add Toshiba Visconti DNN image processing
>>>>>     accelerator bindings
>>>>>   soc: visconti: Add Toshiba Visconti image processing accelerator
>>>>>     common source
>>>>>   soc: visconti: Add Toshiba Visconti DNN image processing accelerator
>>>>>   MAINTAINERS: Add entries for Toshiba Visconti DNN image processing
>>>>>     accelerator
>>>>>
>>>>>  .../soc/visconti/toshiba,visconti-dnn.yaml    |  54 ++
>>>>>  MAINTAINERS                                   |   2 +
>>>>>  drivers/soc/Kconfig                           |   1 +
>>>>>  drivers/soc/Makefile                          |   1 +
>>>>>  drivers/soc/visconti/Kconfig                  |   7 +
>>>>>  drivers/soc/visconti/Makefile                 |   8 +
>>>>>  drivers/soc/visconti/dnn/Makefile             |   6 +
>>>>>  drivers/soc/visconti/dnn/dnn.c                | 533
>>>> ++++++++++++++++++
>>>>>  drivers/soc/visconti/dnn/hwd_dnn.c            | 183 ++++++
>>>>>  drivers/soc/visconti/dnn/hwd_dnn.h            |  68 +++
>>>>>  drivers/soc/visconti/dnn/hwd_dnn_reg.h        | 228 ++++++++
>>>>>  drivers/soc/visconti/ipa_common.c             |  55 ++
>>>>>  drivers/soc/visconti/ipa_common.h             |  18 +
>>>>>  drivers/soc/visconti/uapi/dnn.h               |  77 +++
>>>>>  drivers/soc/visconti/uapi/ipa.h               |  88 +++
>>>>>  15 files changed, 1329 insertions(+)  create mode 100644
>>>>> Documentation/devicetree/bindings/soc/visconti/toshiba,visconti-dnn.
>>>>> ya ml  create mode 100644 drivers/soc/visconti/Kconfig  create mode
>>>>> 100644 drivers/soc/visconti/Makefile  create mode 100644
>>>>> drivers/soc/visconti/dnn/Makefile  create mode 100644
>>>>> drivers/soc/visconti/dnn/dnn.c  create mode 100644
>>>>> drivers/soc/visconti/dnn/hwd_dnn.c
>>>>>  create mode 100644 drivers/soc/visconti/dnn/hwd_dnn.h
>>>>>  create mode 100644 drivers/soc/visconti/dnn/hwd_dnn_reg.h
>>>>>  create mode 100644 drivers/soc/visconti/ipa_common.c  create mode
>>>>> 100644 drivers/soc/visconti/ipa_common.h  create mode 100644
>>>>> drivers/soc/visconti/uapi/dnn.h  create mode 100644
>>>>> drivers/soc/visconti/uapi/ipa.h
>>>>>

