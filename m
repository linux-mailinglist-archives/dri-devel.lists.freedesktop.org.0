Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6079771250B
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 12:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4EA10E1C1;
	Fri, 26 May 2023 10:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C5F10E1C1;
 Fri, 26 May 2023 10:48:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 13AA864F2F;
 Fri, 26 May 2023 10:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E29FC4339B;
 Fri, 26 May 2023 10:48:45 +0000 (UTC)
Message-ID: <73a9a58e-ca66-5f58-d8e5-2c1b33cec643@xs4all.nl>
Date: Fri, 26 May 2023 12:48:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] drm/msm: add hdmi cec support
Content-Language: en-US
To: Arnaud Vrac <avrac@freebox.fr>
References: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
 <20230418-msm8998-hdmi-cec-v1-2-176479fb2fce@freebox.fr>
 <85a999b2-ae13-2ab7-6706-477b9d302efa@xs4all.nl>
 <CAG9NU68nCE8MQHMrbt2XSqXwgwvBq=rwDP64Om5rckcupD_daw@mail.gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAG9NU68nCE8MQHMrbt2XSqXwgwvBq=rwDP64Om5rckcupD_daw@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnaud,

My apologies for the long delay in replying, it's been very, very busy lately.
I hope I'll be able to be more responsive going forward.

On 21/04/2023 18:58, Arnaud Vrac wrote:
> Le ven. 21 avr. 2023 à 15:27, Hans Verkuil <hverkuil-cisco@xs4all.nl> a écrit :
>>
>> Hi Arnaud,
>>
>> Some review comments below...
> 
> Hi Hans,
> 
> For context, I first based my work on the fbdev driver from Qualcomm a
> few years ago, on our own CEC framework which does not implement any
> CEC protocol logic (as android does). At the time I verified that the
> messages were matching the electrical and protocol spec, using manual
> tests and a QD882EA analyzer. I also passed HDMI and CEC certs.
> 
> I simply ported this work more recently to a newer kernel and the
> media-cec framework, also checking the port that Qualcomm did later
> on.
> 
>> On 4/18/23 20:10, Arnaud Vrac wrote:
>>> Some Qualcomm SoCs that support HDMI also support CEC, including MSM8996
>>> and MSM8998. The hardware block can handle a single CEC logical address
>>> and broadcast messages.
>>>
>>> Port the CEC driver from downstream msm-4.4 kernel. It has been tested
>>> on MSM8998 and passes the cec-compliance tool tests.
>>
>> Just to verify: did you run the cec-compliance --test-adapter test? That's
>> the important one to verify your own driver.
> 
> Yes, and I also ran the cec-compliance -r 0 with a pulse8 emulating a
> tv on the bus. Here's the result of cec-compliance --test-adapter:
> 
> Find remote devices:
>         Polling: OK
> 
> CEC API:
>         CEC_ADAP_G_CAPS: OK
>         Invalid ioctls: OK
>         CEC_DQEVENT: OK
>         CEC_ADAP_G/S_PHYS_ADDR: OK
>         CEC_ADAP_G/S_LOG_ADDRS: OK
>         CEC_TRANSMIT: OK
>         CEC_RECEIVE: OK
>         CEC_TRANSMIT/RECEIVE (non-blocking): OK (Presumed)
>         CEC_G/S_MODE: OK
>         warn: cec-test-adapter.cpp(1189): Too many transmits (3)
> without receives
>                 SFTs for repeating messages (>= 7): 7: 38, 8: 2
>                 SFTs for newly transmitted messages (>= 5): 6: 2, 7: 17
>                 SFTs for newly transmitted remote messages (>= 5): 6: 20
>         CEC_EVENT_LOST_MSGS: OK
> 
> Network topology:
> [...]
> 
> Total for hdmi_msm device /dev/cec0: 11, Succeeded: 11, Failed: 0, Warnings: 1
> 
>>
>>>
>>> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
>>> ---
>>>  drivers/gpu/drm/msm/Kconfig         |   8 ++
>>>  drivers/gpu/drm/msm/Makefile        |   1 +
>>>  drivers/gpu/drm/msm/hdmi/hdmi.c     |  15 ++
>>>  drivers/gpu/drm/msm/hdmi/hdmi.h     |  18 +++
>>>  drivers/gpu/drm/msm/hdmi/hdmi_cec.c | 280 ++++++++++++++++++++++++++++++++++++
>>>  5 files changed, 322 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
>>> index 85f5ab1d552c4..2a02c74207935 100644
>>> --- a/drivers/gpu/drm/msm/Kconfig
>>> +++ b/drivers/gpu/drm/msm/Kconfig
>>> @@ -165,3 +165,11 @@ config DRM_MSM_HDMI_HDCP
>>>       default y
>>>       help
>>>         Choose this option to enable HDCP state machine
>>> +
>>> +config DRM_MSM_HDMI_CEC
>>> +     bool "Enable HDMI CEC support in MSM DRM driver"
>>> +     depends on DRM_MSM && DRM_MSM_HDMI
>>> +     select CEC_CORE
>>> +     default y
>>> +     help
>>> +       Choose this option to enable CEC support
>>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>>> index 7274c41228ed9..0237a2f219ac2 100644
>>> --- a/drivers/gpu/drm/msm/Makefile
>>> +++ b/drivers/gpu/drm/msm/Makefile
>>> @@ -131,6 +131,7 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>>>
>>>  msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
>>>
>>> +msm-$(CONFIG_DRM_MSM_HDMI_CEC) += hdmi/hdmi_cec.o
>>>  msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
>>>
>>>  msm-$(CONFIG_DRM_MSM_DSI) += dsi/dsi.o \
>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
>>> index 3132105a2a433..1dde3890e25c0 100644
>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
>>> @@ -11,6 +11,8 @@
>>>  #include <drm/drm_bridge_connector.h>
>>>  #include <drm/drm_of.h>
>>>
>>> +#include <media/cec.h>
>>> +
>>>  #include <sound/hdmi-codec.h>
>>>  #include "hdmi.h"
>>>
>>> @@ -53,6 +55,9 @@ static irqreturn_t msm_hdmi_irq(int irq, void *dev_id)
>>>       if (hdmi->hdcp_ctrl)
>>>               msm_hdmi_hdcp_irq(hdmi->hdcp_ctrl);
>>>
>>> +     /* Process CEC: */
>>> +     msm_hdmi_cec_irq(hdmi);
>>> +
>>>       /* TODO audio.. */
>>>
>>>       return IRQ_HANDLED;
>>> @@ -66,6 +71,8 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
>>>        */
>>>       if (hdmi->workq)
>>>               destroy_workqueue(hdmi->workq);
>>> +
>>> +     msm_hdmi_cec_exit(hdmi);
>>>       msm_hdmi_hdcp_destroy(hdmi);
>>>
>>>       if (hdmi->i2c)
>>> @@ -139,6 +146,8 @@ static int msm_hdmi_init(struct hdmi *hdmi)
>>>               hdmi->hdcp_ctrl = NULL;
>>>       }
>>>
>>> +     msm_hdmi_cec_init(hdmi);
>>> +
>>>       return 0;
>>>
>>>  fail:
>>> @@ -198,6 +207,12 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>>
>>>       drm_connector_attach_encoder(hdmi->connector, hdmi->encoder);
>>>
>>> +     if (hdmi->cec_adap) {
>>> +             struct cec_connector_info conn_info;
>>> +             cec_fill_conn_info_from_drm(&conn_info, hdmi->connector);
>>> +             cec_s_conn_info(hdmi->cec_adap, &conn_info);
>>> +     }
>>> +
>>>       ret = devm_request_irq(dev->dev, hdmi->irq,
>>>                       msm_hdmi_irq, IRQF_TRIGGER_HIGH,
>>>                       "hdmi_isr", hdmi);
>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
>>> index e8dbee50637fa..c639bd87f4b8f 100644
>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
>>> @@ -29,6 +29,7 @@ struct hdmi_audio {
>>>  };
>>>
>>>  struct hdmi_hdcp_ctrl;
>>> +struct cec_adapter;
>>>
>>>  struct hdmi {
>>>       struct drm_device *dev;
>>> @@ -73,6 +74,7 @@ struct hdmi {
>>>       struct workqueue_struct *workq;
>>>
>>>       struct hdmi_hdcp_ctrl *hdcp_ctrl;
>>> +     struct cec_adapter *cec_adap;
>>>
>>>       /*
>>>       * spinlock to protect registers shared by different execution
>>> @@ -261,4 +263,20 @@ static inline void msm_hdmi_hdcp_off(struct hdmi_hdcp_ctrl *hdcp_ctrl) {}
>>>  static inline void msm_hdmi_hdcp_irq(struct hdmi_hdcp_ctrl *hdcp_ctrl) {}
>>>  #endif
>>>
>>> +/*
>>> + * cec
>>> + */
>>> +#ifdef CONFIG_DRM_MSM_HDMI_CEC
>>> +int msm_hdmi_cec_init(struct hdmi *hdmi);
>>> +void msm_hdmi_cec_exit(struct hdmi *hdmi);
>>> +void msm_hdmi_cec_irq(struct hdmi *hdmi);
>>> +#else
>>> +static inline int msm_hdmi_cec_init(struct hdmi *hdmi)
>>> +{
>>> +     return -ENXIO;
>>> +}
>>> +static inline void msm_hdmi_cec_exit(struct hdmi *hdmi) {}
>>> +static inline void msm_hdmi_cec_irq(struct hdmi *hdmi) {}
>>> +#endif
>>> +
>>>  #endif /* __HDMI_CONNECTOR_H__ */
>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_cec.c b/drivers/gpu/drm/msm/hdmi/hdmi_cec.c
>>> new file mode 100644
>>> index 0000000000000..51326e493e5da
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_cec.c
>>> @@ -0,0 +1,280 @@
>>> +#include <linux/iopoll.h>
>>> +#include <media/cec.h>
>>> +
>>> +#include "hdmi.h"
>>> +
>>> +#define HDMI_CEC_INT_MASK ( \
>>> +     HDMI_CEC_INT_TX_DONE_MASK | \
>>> +     HDMI_CEC_INT_TX_ERROR_MASK | \
>>> +     HDMI_CEC_INT_RX_DONE_MASK)
>>> +
>>> +struct hdmi_cec_ctrl {
>>> +     struct hdmi *hdmi;
>>> +     struct work_struct work;
>>> +     spinlock_t lock;
>>> +     u32 irq_status;
>>> +     u32 tx_status;
>>> +     u32 tx_retransmits;
>>> +};
>>> +
>>> +static int msm_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
>>> +{
>>> +     struct hdmi_cec_ctrl *cec_ctrl = adap->priv;
>>> +     struct hdmi *hdmi = cec_ctrl->hdmi;
>>> +
>>> +     if (enable) {
>>> +             /* timer frequency, 19.2Mhz * 0.05ms / 1000ms = 960 */
>>> +             hdmi_write(hdmi, REG_HDMI_CEC_REFTIMER,
>>> +                        HDMI_CEC_REFTIMER_REFTIMER(960) |
>>> +                        HDMI_CEC_REFTIMER_ENABLE);
>>> +
>>> +             /* read and write timings */
>>> +             hdmi_write(hdmi, REG_HDMI_CEC_RD_RANGE, 0x30AB9888);
>>> +             hdmi_write(hdmi, REG_HDMI_CEC_WR_RANGE, 0x888AA888);
>>> +             hdmi_write(hdmi, REG_HDMI_CEC_RD_START_RANGE, 0x88888888);
>>> +             hdmi_write(hdmi, REG_HDMI_CEC_RD_TOTAL_RANGE, 0x99);
>>> +
>>> +             /* start bit low pulse duration, 3.7ms */
>>> +             hdmi_write(hdmi, REG_HDMI_CEC_RD_ERR_RESP_LO, 74);
>>> +
>>> +             /* signal free time, 7 * 2.4ms */
>>> +             hdmi_write(hdmi, REG_HDMI_CEC_TIME,
>>> +                        HDMI_CEC_TIME_SIGNAL_FREE_TIME(7 * 48) |
>>> +                        HDMI_CEC_TIME_ENABLE);
>>
>> The Signal Free Time changes depending on the situation (3, 5 or 7 bit
>> periods). Does the hardware take care of that, or do you need to update
>> this register in the transmit op as well?
> 
> In case of retries, which are handled by the hardware, I'm not sure if
> the hardware will use the period set in this register or 3. I believe
> it should be 3 otherwise we would have problems when probing addresses
> on a busy bus.
> 
> Otherwise for new message transmissions, the register value is used
> with caveats.
> 
> I've just tried to use set the register value during transmit using
> the signal_free_time parameter, and am getting wrong results. To
> emphasize the problem I set signal_free_time to 3 instead of 5 and 8
> instead of 7, and am getting the following in cec-compliance:
> 
>                 SFTs for repeating messages (>= 7): 3: 10, 4: 6, 8: 14, 9: 6
>                 SFTs for newly transmitted messages (>= 5): 7: 6, 8: 8
> 
> If I instead set signal_free_time to 3 just after receiving a message
> and 8 just after sending, I get better results:
> 
>                 SFTs for repeating messages (>= 7): 8: 26, 9: 10
>                 SFTs for newly transmitted messages (>= 5): 2: 7, 3: 12
> 
> But it's not clear to me why the change is not effective immediatly in
> the first test, so I'm not confortable changing the fixed value of 7
> periods.

See my comment below in the transmit function.

> 
>>
>>> +
>>> +             hdmi_write(hdmi, REG_HDMI_CEC_COMPL_CTL, 0xF);
>>> +             hdmi_write(hdmi, REG_HDMI_CEC_WR_CHECK_CONFIG, 0x4);
>>> +             hdmi_write(hdmi, REG_HDMI_CEC_RD_FILTER, BIT(0) | (0x7FF << 4));
>>> +
>>> +             hdmi_write(hdmi, REG_HDMI_CEC_INT, HDMI_CEC_INT_MASK);
>>> +             hdmi_write(hdmi, REG_HDMI_CEC_CTRL, HDMI_CEC_CTRL_ENABLE);
>>> +     } else {
>>> +             hdmi_write(hdmi, REG_HDMI_CEC_INT, 0);
>>> +             hdmi_write(hdmi, REG_HDMI_CEC_CTRL, 0);
>>> +             cancel_work_sync(&cec_ctrl->work);
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int msm_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 logical_addr)
>>> +{
>>> +     struct hdmi_cec_ctrl *cec_ctrl = adap->priv;
>>> +     struct hdmi *hdmi = cec_ctrl->hdmi;
>>> +
>>> +     hdmi_write(hdmi, REG_HDMI_CEC_ADDR, logical_addr & 0xF);
>>
>> So to disable the logical address you set this to 0xf, right? Since
>> CEC_LOG_ADDR_INVALID is 0xff.
> 
> Right.
> 
>>
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int msm_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
>>> +                                   u32 signal_free_time, struct cec_msg *msg)
>>
>> Note that the SFT is passed in as an argument for those hardware devices
>> that do not keep track of it themselves.

What happens if you update the REG_HDMI_CEC_TIME here based on the
signal_free_time argument? Does that improve the cec-compliance results?

>>
>>> +{
>>> +     struct hdmi_cec_ctrl *cec_ctrl = adap->priv;
>>> +     struct hdmi *hdmi = cec_ctrl->hdmi;
>>> +     u8 retransmits;
>>> +     u32 broadcast;
>>> +     u32 status;
>>> +     int i;
>>> +
>>> +     /* toggle cec in order to flush out bad hw state, if any */
>>> +     hdmi_write(hdmi, REG_HDMI_CEC_CTRL, 0);
>>> +     hdmi_write(hdmi, REG_HDMI_CEC_CTRL, HDMI_CEC_CTRL_ENABLE);
>>> +
>>> +     /* flush register writes */
>>> +     wmb();
>>> +
>>> +     retransmits = attempts ? (attempts - 1) : 0;

attempts is guaranteed to be non-zero, so you can just set this to attempts - 1.

>>> +     hdmi_write(hdmi, REG_HDMI_CEC_RETRANSMIT,
>>> +                HDMI_CEC_RETRANSMIT_ENABLE |
>>> +                HDMI_CEC_RETRANSMIT_COUNT(retransmits));
>>> +
>>> +     broadcast = cec_msg_is_broadcast(msg) ? HDMI_CEC_WR_DATA_BROADCAST : 0;
>>> +     for (i = 0; i < msg->len; i++) {
>>> +             hdmi_write(hdmi, REG_HDMI_CEC_WR_DATA,
>>> +                        HDMI_CEC_WR_DATA_DATA(msg->msg[i]) | broadcast);
>>> +     }
>>> +
>>> +     /* check line status */
>>> +     if (read_poll_timeout(hdmi_read, status, !(status & HDMI_CEC_STATUS_BUSY),
>>> +                           5, 1000, false, hdmi, REG_HDMI_CEC_STATUS)) {
>>> +             pr_err("CEC line is busy. Retry failed\n");
>>
>> This doesn't look right. Normally it is the CEC hardware that will wait for the
>> bus to become free, and then it will start the transmit. That is not something
>> you should have to do in the driver. And this waits for just 1 ms, right? That's
>> much too short if a message is currently being received.
>>
>> Is there documentation of the CEC hardware available somewhere? Or can you
>> explain a bit about it?
> 
> I'm not sure why this code is here, it's a check that was done in the
> original Qualcomm driver using a busy loop with a schedule():
> 
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/drivers/media/platform/msm/sde/cec/sde_hdmi_cec.c#L174
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/drivers/video/fbdev/msm/mdss_hdmi_cec.c#L109
> 
> In practice I don't think I've seen the status being busy, but I
> ported the check in case it's still useful. Maybe an hw engineer from
> Qualcomm can chime in.

I think this code should be dropped.

Normally the transmitter in the hardware will have to wait for the bus to
be free (that's what the Signal Free Time is all about). If the hardware
cannot do that, then the driver needs to be modified so that it can return
here, but kick off a worker thread or something that waits for the bus to
become free. But that is hard to get right.

So in either case this code doesn't belong here, adap_transmit is meant to
be fast.

One option is to create a CEC debugger where you can see what is going
on. See "4.7. Making a CEC debugger" here:

https://linuxtv.org/downloads/v4l-dvb-apis-new/admin-guide/cec.html

You need a way to hook up the CEC pin of an HDMI cable to a GPIO. I
suggest an HDMI breakout board that you can buy. Then you can use that
in combination with the cec-gpio driver to do low-level testing and see
the exact behavior of the CEC transmitter.

While I use a RPi 4B for that, it should work fine with other SoCs.

I can help with instruction on how to use such a setup, if needed.

> 
>>
>>> +             return -EBUSY;
>>> +     }
>>> +
>>> +     cec_ctrl->tx_retransmits = retransmits;
>>> +
>>> +     /* start transmission */
>>> +     hdmi_write(hdmi, REG_HDMI_CEC_CTRL,
>>> +                HDMI_CEC_CTRL_ENABLE |
>>> +                HDMI_CEC_CTRL_SEND_TRIGGER |
>>> +                HDMI_CEC_CTRL_FRAME_SIZE(msg->len) |
>>> +                HDMI_CEC_CTRL_LINE_OE);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static void msm_hdmi_cec_adap_free(struct cec_adapter *adap)
>>> +{
>>> +     struct hdmi_cec_ctrl *cec_ctrl = adap->priv;
>>> +
>>> +     cec_ctrl->hdmi->cec_adap = NULL;
>>> +     kfree(cec_ctrl);
>>> +}
>>> +
>>> +static const struct cec_adap_ops msm_hdmi_cec_adap_ops = {
>>> +     .adap_enable = msm_hdmi_cec_adap_enable,
>>> +     .adap_log_addr = msm_hdmi_cec_adap_log_addr,
>>> +     .adap_transmit = msm_hdmi_cec_adap_transmit,
>>> +     .adap_free = msm_hdmi_cec_adap_free,
>>> +};
>>> +
>>> +#define CEC_IRQ_FRAME_WR_DONE 0x01
>>> +#define CEC_IRQ_FRAME_RD_DONE 0x02
>>> +
>>> +static void msm_hdmi_cec_handle_rx_done(struct hdmi_cec_ctrl *cec_ctrl)
>>> +{
>>> +     struct hdmi *hdmi = cec_ctrl->hdmi;
>>> +     struct cec_msg msg = {};
>>> +     u32 data;
>>> +     int i;
>>> +
>>> +     data = hdmi_read(hdmi, REG_HDMI_CEC_RD_DATA);
>>> +     msg.len = (data & 0x1f00) >> 8;
>>> +     if (msg.len < 1 || msg.len > CEC_MAX_MSG_SIZE)
>>> +             return;
>>> +
>>> +     msg.msg[0] = data & 0xff;
>>> +     for (i = 1; i < msg.len; i++)
>>> +             msg.msg[i] = hdmi_read(hdmi, REG_HDMI_CEC_RD_DATA) & 0xff;
>>> +
>>> +     cec_received_msg(hdmi->cec_adap, &msg);
>>> +}
>>> +
>>> +static void msm_hdmi_cec_handle_tx_done(struct hdmi_cec_ctrl *cec_ctrl)
>>> +{
>>> +     struct hdmi *hdmi = cec_ctrl->hdmi;
>>> +     u32 tx_status;
>>> +
>>> +     tx_status = (cec_ctrl->tx_status & HDMI_CEC_STATUS_TX_STATUS__MASK) >>
>>> +             HDMI_CEC_STATUS_TX_STATUS__SHIFT;
>>> +
>>> +     switch (tx_status) {
>>> +     case 0:
>>> +             cec_transmit_done(hdmi->cec_adap,
>>> +                               CEC_TX_STATUS_OK, 0, 0, 0, 0);
>>> +             break;
>>> +     case 1:
>>> +             cec_transmit_done(hdmi->cec_adap,
>>> +                               CEC_TX_STATUS_NACK, 0, 1, 0, 0);
>>
>> It's not clear to me who does the retransmits. There are two possibilities:
>> the hardware takes care of that, and so you just get the final result
>> and you OR this status with CEC_TX_STATUS_MAX_RETRIES to indicate that
>> the CEC framework shouldn't attempt to retry.
>>
>> Or the hardware just does a single transmit, and in that case you never
>> supply the CEC_TX_STATUS_MAX_RETRIES and just leave it up to the framework
>> to reissue a transmit.
> 
> After fiddling with the registers, my understanding is the following:
> 
> When arbitration loss happens, the hardware returns the ARB_LOSS
> status without retrying afterwards, and I don't think the hardware
> reports the number of NACKs that were attempted before the arbitration
> loss. So in this case I believe it makes sense to only report the
> arbitration loss to the framework.
> 
> The hardware will otherwise retry up to the number of retransmits
> indicated in the REG_HDMI_CEC_RETRANSMIT register set during transmit
> and return either OK or MAX_RETRIES (=NACK). I haven't seen the NACK
> status (case 1) in practice, even if I disable retransmits in the
> dedicated register.

I wonder if case 1 is actually a catch-all ERROR condition or possibly
it is returned in case of a Low Drive. It's hard to test without proper
test equipment (the cec-gpio driver can inject such error conditions).

If a normal NACK situation results in case 3, then I would suggest
returning CEC_TX_STATUS_ERROR for case 1, with a comment that this is
a guess only. Unless you are able to confirm it based on cec-gpio tests
or documentation.

> 
>>
>> So here you do no supply MAX_RETRIES...
> 
> I chose to handle case 1 as a single NACK answer, if it could still
> happen for some reason.
> 
>>
>>> +             break;
>>> +     case 2:
>>> +             cec_transmit_done(hdmi->cec_adap,
>>> +                               CEC_TX_STATUS_ARB_LOST, 1, 0, 0, 0);
>>
>> ... and also not here...
> 
> See explanation above.

So this needs to be documented: the HW doesn't do retransmits for ARB LOST,
but it does for NACK.

> 
>>
>>> +             break;
>>> +     case 3:
>>> +             cec_transmit_done(hdmi->cec_adap,
>>> +                               CEC_TX_STATUS_MAX_RETRIES |
>>> +                               CEC_TX_STATUS_NACK,
>>> +                               0, cec_ctrl->tx_retransmits + 1, 0, 0);
>>
>> ...but here you do.
> 
> See explanation above.
> 
>>
>>> +             break;
>>> +     default:
>>> +             cec_transmit_done(hdmi->cec_adap,
>>> +                               CEC_TX_STATUS_ERROR, 0, 0, 0, 1);
>>> +             break;
>>> +     }
>>> +}
>>> +
>>> +static void msm_hdmi_cec_work(struct work_struct *work)
>>> +{
>>> +     struct hdmi_cec_ctrl *cec_ctrl =
>>> +             container_of(work, struct hdmi_cec_ctrl, work);
>>> +     unsigned long flags;
>>> +
>>> +     spin_lock_irqsave(&cec_ctrl->lock, flags);
> 
> Just a note for myself, I need to avoid calling the cec framework
> functions with the spinlock taken.
> 
>>> +
>>> +     if (cec_ctrl->irq_status & CEC_IRQ_FRAME_WR_DONE)
>>> +             msm_hdmi_cec_handle_tx_done(cec_ctrl);
>>> +
>>> +     if (cec_ctrl->irq_status & CEC_IRQ_FRAME_RD_DONE)
>>> +             msm_hdmi_cec_handle_rx_done(cec_ctrl);
>>> +
>>> +     cec_ctrl->irq_status = 0;
>>> +     cec_ctrl->tx_status = 0;
>>> +
>>> +     spin_unlock_irqrestore(&cec_ctrl->lock, flags);
>>> +}
>>> +
>>> +void msm_hdmi_cec_irq(struct hdmi *hdmi)
>>> +{
>>> +     struct hdmi_cec_ctrl *cec_ctrl;
>>> +     unsigned long flags;
>>> +     u32 int_status;
>>> +
>>> +     if (!hdmi->cec_adap)
>>> +             return;
>>> +
>>> +     cec_ctrl = hdmi->cec_adap->priv;
>>> +
>>> +     int_status = hdmi_read(hdmi, REG_HDMI_CEC_INT);
>>> +     if (!(int_status & HDMI_CEC_INT_MASK))
>>> +             return;
>>> +
>>> +     spin_lock_irqsave(&cec_ctrl->lock, flags);
>>> +
>>> +     if (int_status & (HDMI_CEC_INT_TX_DONE | HDMI_CEC_INT_TX_ERROR)) {
>>> +             cec_ctrl->tx_status = hdmi_read(hdmi, REG_HDMI_CEC_STATUS);
>>> +             cec_ctrl->irq_status |= CEC_IRQ_FRAME_WR_DONE;
>>> +     }
>>> +
>>> +     if (int_status & HDMI_CEC_INT_RX_DONE)
>>> +             cec_ctrl->irq_status |= CEC_IRQ_FRAME_RD_DONE;
>>> +
>>> +     spin_unlock_irqrestore(&cec_ctrl->lock, flags);
>>> +
>>> +     hdmi_write(hdmi, REG_HDMI_CEC_INT, int_status);
>>> +     queue_work(hdmi->workq, &cec_ctrl->work);
>>> +}
>>> +
>>> +int msm_hdmi_cec_init(struct hdmi *hdmi)
>>> +{
>>> +     struct platform_device *pdev = hdmi->pdev;
>>> +     struct hdmi_cec_ctrl *cec_ctrl;
>>> +     struct cec_adapter *cec_adap;
>>> +     int ret;
>>> +
>>> +     cec_ctrl = kzalloc(sizeof (*cec_ctrl), GFP_KERNEL);
>>> +     if (!cec_ctrl)
>>> +             return -ENOMEM;
>>> +
>>> +     cec_ctrl->hdmi = hdmi;
>>> +     INIT_WORK(&cec_ctrl->work, msm_hdmi_cec_work);
>>> +
>>> +     cec_adap = cec_allocate_adapter(&msm_hdmi_cec_adap_ops,
>>> +                                     cec_ctrl, "msm",
>>> +                                     CEC_CAP_DEFAULTS |
>>> +                                     CEC_CAP_CONNECTOR_INFO, 1);
>>> +     ret = PTR_ERR_OR_ZERO(cec_adap);
>>> +     if (ret < 0) {
>>> +             kfree(cec_ctrl);
>>> +             return ret;
>>> +     }
>>> +
>>> +     /* Set the logical address to Unregistered */
>>> +     hdmi_write(hdmi, REG_HDMI_CEC_ADDR, 0xf);
>>> +
>>> +     ret = cec_register_adapter(cec_adap, &pdev->dev);
>>> +     if (ret < 0) {
>>> +             cec_delete_adapter(cec_adap);
>>> +             return ret;
>>> +     }
>>> +
>>> +     hdmi->cec_adap = cec_adap;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +void msm_hdmi_cec_exit(struct hdmi *hdmi)
>>> +{
>>> +     cec_unregister_adapter(hdmi->cec_adap);
>>> +}
>>>
>>
>> Final question: is this CEC device able to transmit messages when the hotplug detect
>> pin is low? Some displays pull the HPD low when in Standby, but it is still possible
>> to wake them up with a <Image View On> message. It is important to check that.
>>
>> If this is really not possible, then the CEC_CAP_NEEDS_HPD should be set.
> 
> Yes, messages can be sent with HPD low, as long as the HDMI PLL is up.

Nice!

Regards,

	Hans
