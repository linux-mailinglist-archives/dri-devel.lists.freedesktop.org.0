Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF61252B8E2
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 13:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E023210E07A;
	Wed, 18 May 2022 11:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEDA89DD3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 11:34:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 552F960C94;
 Wed, 18 May 2022 11:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CA7C385A5;
 Wed, 18 May 2022 11:34:15 +0000 (UTC)
Message-ID: <31992c67-400e-8e14-38c2-4655995886f5@xs4all.nl>
Date: Wed, 18 May 2022 13:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v6, 6/7] media: mediatek: vcodec: prevent kernel crash
 when scp ipi timeout
Content-Language: en-US
To: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20220513092526.9670-1-yunfei.dong@mediatek.com>
 <20220513092526.9670-7-yunfei.dong@mediatek.com>
 <ea9a04fb-368d-daca-96ae-9366253a5e91@xs4all.nl>
 <f26d5225fc8c499226c297ed86feb5ee20e8f3d3.camel@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <f26d5225fc8c499226c297ed86feb5ee20e8f3d3.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/18/22 13:29, yunfei.dong@mediatek.com wrote:
> Dear Hans,
> 
> Thanks for your review.
> On Wed, 2022-05-18 at 11:37 +0200, Hans Verkuil wrote:
>> Hi Yunfei,
>>
>> On 5/13/22 11:25, Yunfei Dong wrote:
>>> When SCP timeout during playing video, kernel crashes with
>>> following
>>> message. It's caused by accessing NULL pointer in
>>> vpu_dec_ipi_handler.
>>> This patch doesn't solve the root cause of NULL pointer, but merely
>>> prevent kernel crashed when encounter the NULL pointer.
>>
>> Is the root cause being addressed as well? Where is the root cause?
>> Is it
>> in this driver or in the scp (i.e. the remoteproc) driver?
>>
>> I need a bit more information to decide whether this series is ready
>> to
>> be merged for 5.20 or not.
>>
>> Regards,
>>
>> 	Hans
>>
> Vpu will be NUll when scp(micro processor) is hang or crash. Need to
> keep kernel works well , so add this patch.

OK, I think this should be stated in the commit log, and also in the code
(see below).

> 
> Best Regards,
> Yunfei Dong

<snip>

>>> diff --git a/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
>>> b/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
>>> index 35f4d5583084..1041dd663e76 100644
>>> --- a/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
>>> +++ b/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
>>> @@ -91,6 +91,11 @@ static void vpu_dec_ipi_handler(void *data,
>>> unsigned int len, void *priv)
>>>  	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
>>>  					(unsigned long)msg-
>>>> ap_inst_addr;
>>>  
>>> +	if (!vpu) {
>>> +		mtk_v4l2_err("ap_inst_addr is NULL");

E.g., either add a comment here or perhaps change the error message to:

"ap_inst_addr is NULL, did the SCP hang?"

Or something along those lines.

Shouldn't there be a \n at the end of this message as well? Or does
mtk_v4l2_err add that?

Regards,

	Hans

>>> +		return;
>>> +	}
>>> +
>>>  	mtk_vcodec_debug(vpu, "+ id=%X", msg->msg_id);
>>>  
>>>  	vpu->failure = msg->status;
> 
