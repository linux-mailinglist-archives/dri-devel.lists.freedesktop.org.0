Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCE0259929
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE6D6E885;
	Tue,  1 Sep 2020 16:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28A36E852
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 11:35:40 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200901113538epoutp01b086a1eb76d94d578b0461d2c268c690~wpcY4CtKK0856808568epoutp01F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 11:35:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200901113538epoutp01b086a1eb76d94d578b0461d2c268c690~wpcY4CtKK0856808568epoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1598960138;
 bh=YqLyEyefd2EuCky1gKbGz4lUozJOx/Mj4j1disZQLO0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=BwLfTsvommtNq70lpjXaQFlHqGR3SPvl8bfVDzMXW1c0PObRutvWDL5aSWKGvstj0
 CUmr0bsDcSIsiBQY5wU6gCnM00DnFFxW6zxDaNexF6XzcWon5syo/fdUdli3f5L1xM
 LGBDHlncLun6LR2nVjyvXnN4Nws8PZqOplLk02Rw=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200901113538epcas1p4694458fd90ac4d9601b79cf99ce20b6e~wpcYgjG8Q0702007020epcas1p4F;
 Tue,  1 Sep 2020 11:35:38 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.154]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4BglPN0Ff3zMqYkb; Tue,  1 Sep
 2020 11:35:36 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 C9.D6.29173.7023E4F5; Tue,  1 Sep 2020 20:35:35 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200901113535epcas1p3a5d9ee1600e343886cabf86cdea1023b~wpcV1sezp0683206832epcas1p3I;
 Tue,  1 Sep 2020 11:35:35 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200901113535epsmtrp1b151ed8540122e28c548772ac6cfd14a~wpcV055Do0918009180epsmtrp1h;
 Tue,  1 Sep 2020 11:35:35 +0000 (GMT)
X-AuditID: b6c32a37-9b7ff700000071f5-c0-5f4e3207e4ba
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 9B.FF.08303.7023E4F5; Tue,  1 Sep 2020 20:35:35 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200901113534epsmtip1e3167e347495f932743fa656683ddfe4~wpcVmbfSe1857018570epsmtip1L;
 Tue,  1 Sep 2020 11:35:34 +0000 (GMT)
Subject: Re: [PATCH v4 03/78] drm/vc4: hvs: Boost the core clock during modeset
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Maxime Ripard <maxime@cerno.tech>, Nicolas Saenz Julienne
 <nsaenzjulienne@suse.de>, Eric Anholt <eric@anholt.net>
Organization: Samsung Electronics
Message-ID: <6aa8ed4d-1457-ce27-f801-11a197088c56@samsung.com>
Date: Tue, 1 Sep 2020 20:48:03 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <a4f6ea62-441a-8e5b-5383-13d7f2b1a920@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJJsWRmVeSWpSXmKPExsWy7bCmri67kV+8wbaVVhZre4+yWLydu5jF
 4srX92wWBxovM1psenyN1eLyrjlsFhNvb2C3mPHjH6PFtlnL2SzW3XrNZvFo6n1GB26PpvfH
 2Dxm3T/L5nHn3Hk2j/vdx5k8Ni+p92g9+ovFY/Ppao/Pm+QCOKKybTJSE1NSixRS85LzUzLz
 0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
 pCpk5BeX2CqlFqTkFFgW6BUn5haX5qXrJefnWhkaGBiZAhUmZGc875jPUtCuXPHlfDtrA+MO
 6S5GTg4JAROJAw+2MncxcnEICexglPg1aTUbhPOJUWL7q3+sEM5nRon1P1czwrQ03O1iBrGF
 BHYxSvy5qw9R9J5R4umWF0xdjBwcwgKBEhN2K4HUsAloSex/cYMNxBYRKJdo79wPto5ZYAeT
 RMep6WAJfgFFias/HoMt4BWwk9g79RUTiM0ioCJx4NorsBpRgTCJk9taoGoEJU7OfMICYnMK
 2Ess6X0IdhCzgLjErSfzmSBseYntb+eALZMQOMMhMX3/AXaID1wkGiZMg/pGWOLV8S1QcSmJ
 l/1tUHa1xMqTR9ggmjsYJbbsv8AKkTCW2L90MtiXzAKaEut36UOEFSV2/p7LCLGYT+Ld1x5W
 kBIJAV6JjjYhiBJlicsP7jJB2JISi9s72SYwKs1C8s4sJC/MQvLCLIRlCxhZVjGKpRYU56an
 FhsWGCPH9iZGcBrWMt/BOO3tB71DjEwcjIcYJTiYlUR4Z97wjRfiTUmsrEotyo8vKs1JLT7E
 aAoM4InMUqLJ+cBMkFcSb2hqZGxsbGFiaGZqaKgkzvvwlkK8kEB6YklqdmpqQWoRTB8TB6dU
 A1MCo9JH/tZwrrXBGT91donkN5WXXvp7mH9FUpJAYYe4dTLLaY2VthdPr9WS3vR7wuutfxfO
 M3dJSjU7t7Nq/WQV9itvTwcZ3NYOj7RrdtL7ylgd4jS15Nnhkk4tX++jeVfe+8mpV87KtPra
 W5vo7jjpq/hfF/OMsiVVxS/39arM3rp9hsw8Hz+Z0OAOpd4l9dzHhTRE45acsbY5tj/uwpln
 zWYfXv7/+yRSJdWJ7bPyvnWcr8oWX/afntSiF/Jvb4XO0cMcIgt14lzijt18oqCUtkCV6YnI
 w+Tj+4978/C87BUSckhryzoou++lLf+jwzmbO3ZdqZ2hd3798tMRqWWLAyae/LJ1g/nl5ytd
 wpRYijMSDbWYi4oTAZtZubVMBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsWy7bCSnC67kV+8wYof7BZre4+yWLydu5jF
 4srX92wWBxovM1psenyN1eLyrjlsFhNvb2C3mPHjH6PFtlnL2SzW3XrNZvFo6n1GB26PpvfH
 2Dxm3T/L5nHn3Hk2j/vdx5k8Ni+p92g9+ovFY/Ppao/Pm+QCOKK4bFJSczLLUov07RK4Mp53
 zGcpaFeu+HK+nbWBcYd0FyMnh4SAiUTD3S7mLkYuDiGBHYwSq968ZYFISEpMu3gUKMEBZAtL
 HD5cDFHzllFiY8MONpC4sECgxITdSiDlbAJaEvtf3GADsUUEKiU+z9kFNpNZYAeTRNfj02Az
 hQQOMUm0HPQCsfkFFCWu/njMCGLzCthJ7J36ignEZhFQkThw7RXYIFGBMImdSx4zQdQISpyc
 +QRsDqeAvcSS3ofMIDazgLrEn3mXoGxxiVtP5jNB2PIS29/OYZ7AKDwLSfssJC2zkLTMQtKy
 gJFlFaNkakFxbnpusWGBUV5quV5xYm5xaV66XnJ+7iZGcDxqae1g3LPqg94hRiYOxkOMEhzM
 SiK8M2/4xgvxpiRWVqUW5ccXleakFh9ilOZgURLn/TprYZyQQHpiSWp2ampBahFMlomDU6qB
 acGFSb+eOGz875yw+TzjZ+GvBW9df3RN3m24ZxbLxuiL5X/mfpuRcm/nkdXc9QxfrgR5TS/e
 ytMTWRTzbpfUXfbAucelr/n+b3taF71gjrayc3bQrvsCqZFHnJ1NnszSeTqLSylF+4e72In1
 U7LW5s/qs5u9iW3JxLIdaz9bfanpDj9ZcluoYUrX3T1p4uutV2d2OC6LtftTsM8g12M1S++K
 LysU9dQ7n+xjSLq5cIKYoX7gDBXvLTKZIVY6X883+HOZfzp2LaZj2XXdoIv60tp5pt0PL2w4
 VG0kvPxixBOlgL2vO8sO1+tempSd48a8R6dDYMPqfVUNd2pqDs/s4D15dovdfIa8biflb+2X
 jJVYijMSDbWYi4oTAejn/Dk2AwAA
X-CMS-MailID: 20200901113535epcas1p3a5d9ee1600e343886cabf86cdea1023b
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200708174243epcas1p2b5646e3d45e412d1cd1286d90cb9cc37
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <CGME20200708174243epcas1p2b5646e3d45e412d1cd1286d90cb9cc37@epcas1p2.samsung.com>
 <b04341887fb1acb9ed4adc28d109f9e21f146c7d.1594230107.git-series.maxime@cerno.tech>
 <a4f6ea62-441a-8e5b-5383-13d7f2b1a920@samsung.com>
X-Mailman-Approved-At: Tue, 01 Sep 2020 16:37:23 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/1/20 8:21 PM, Chanwoo Choi wrote:
> Hi Maxime,
> 
> On 7/9/20 2:41 AM, Maxime Ripard wrote:
>> In order to prevent timeouts and stalls in the pipeline, the core clock
>> needs to be maxed at 500MHz during a modeset on the BCM2711.
>>
>> Reviewed-by: Eric Anholt <eric@anholt.net>
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>> ---
>>  drivers/gpu/drm/vc4/vc4_drv.h |  2 ++
>>  drivers/gpu/drm/vc4/vc4_hvs.c |  9 +++++++++
>>  drivers/gpu/drm/vc4/vc4_kms.c |  9 +++++++++
>>  3 files changed, 20 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
>> index e4cde1f9224b..6358f6ca8d56 100644
>> --- a/drivers/gpu/drm/vc4/vc4_drv.h
>> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
>> @@ -320,6 +320,8 @@ struct vc4_hvs {
>>  	void __iomem *regs;
>>  	u32 __iomem *dlist;
>>  
>> +	struct clk *core_clk;
>> +
>>  	/* Memory manager for CRTCs to allocate space in the display
>>  	 * list.  Units are dwords.
>>  	 */
>> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
>> index 836d8799d79e..091fdf4908aa 100644
>> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
>> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
>> @@ -19,6 +19,7 @@
>>   * each CRTC.
>>   */
>>  
>> +#include <linux/clk.h>
>>  #include <linux/component.h>
>>  #include <linux/platform_device.h>
>>  
>> @@ -540,6 +541,14 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>>  	hvs->regset.regs = hvs_regs;
>>  	hvs->regset.nregs = ARRAY_SIZE(hvs_regs);
>>  
>> +	if (hvs->hvs5) {
>> +		hvs->core_clk = devm_clk_get(&pdev->dev, NULL);
>> +		if (IS_ERR(hvs->core_clk)) {
>> +			dev_err(&pdev->dev, "Couldn't get core clock\n");
>> +			return PTR_ERR(hvs->core_clk);
>> +		}
>> +	}
>> +
>>  	if (!hvs->hvs5)
>>  		hvs->dlist = hvs->regs + SCALER_DLIST_START;
>>  	else
>> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
>> index 08318e69061b..210cc2408087 100644
>> --- a/drivers/gpu/drm/vc4/vc4_kms.c
>> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
>> @@ -11,6 +11,8 @@
>>   * crtc, HDMI encoder).
>>   */
>>  
>> +#include <linux/clk.h>
>> +
>>  #include <drm/drm_atomic.h>
>>  #include <drm/drm_atomic_helper.h>
>>  #include <drm/drm_crtc.h>
>> @@ -149,6 +151,7 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
>>  {
>>  	struct drm_device *dev = state->dev;
>>  	struct vc4_dev *vc4 = to_vc4_dev(dev);
>> +	struct vc4_hvs *hvs = vc4->hvs;
>>  	struct vc4_crtc *vc4_crtc;
>>  	int i;
>>  
>> @@ -160,6 +163,9 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
>>  		vc4_hvs_mask_underrun(dev, vc4_crtc->channel);
>>  	}
>>  
>> +	if (vc4->hvs->hvs5)
>> +		clk_set_min_rate(hvs->core_clk, 500000000);
>> +
>>  	drm_atomic_helper_wait_for_fences(dev, state, false);
>>  
>>  	drm_atomic_helper_wait_for_dependencies(state);
>> @@ -182,6 +188,9 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
>>  
>>  	drm_atomic_helper_commit_cleanup_done(state);
>>  
>> +	if (vc4->hvs->hvs5)
>> +		clk_set_min_rate(hvs->core_clk, 0);
>> +
>>  	drm_atomic_state_put(state);
>>  
>>  	up(&vc4->async_modeset);
>>
> 
> This patch doesn't control the enable/disable of core_clk.
> So, I think that it need to handle the clock as following:
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 4ef88c0b51ab..355d67fd8beb 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -588,6 +588,12 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>                         dev_err(&pdev->dev, "Couldn't get core clock\n");
>                         return PTR_ERR(hvs->core_clk);
>                 }
> +
> +               ret = clk_prepare_enable(hvs->core_clk);
> +               if (ret) {
> +                       dev_err(&pdev->dev, "Couldn't enable core clock\n");
> +                       return ret;
> +               }
>         }
>  
>         if (!hvs->hvs5)
> @@ -681,6 +687,8 @@ static void vc4_hvs_unbind(struct device *dev, struct device *master,
>         drm_mm_takedown(&vc4->hvs->dlist_mm);
>         drm_mm_takedown(&vc4->hvs->lbm_mm);
>  
> +       clk_prepare_enable(vc4->hvs->core_clk);

I'm sorry. Change to clk_disable_unprepare(vc4->hvs->core_clk);

> +
>         vc4->hvs = NULL;
>  }
> 
> 
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
