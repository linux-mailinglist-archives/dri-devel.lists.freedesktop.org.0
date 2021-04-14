Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234FA35F655
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 16:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65476E893;
	Wed, 14 Apr 2021 14:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00087.outbound.protection.outlook.com [40.107.0.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746416E4A5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 14:34:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+6CHKjRKQvCZNx2f9r6Xt22a6aJ3GYrEOKZM/wn3SFYGUbaXm5+TVVeB96pqC8ODUPXU0KL2xIV3XtYzTwPmQVEfKTNTWQ4vOUgMlRLDboSAfU+0b8Ptd0TP9B/sIUsazsaDZqtgjgxkEka8Brs41Zf4aa7jq9UB5qipoUach6PqeN19sSUffQxpt0wjJSE/6inF4U4SMAoD5NaXH9PoOVlFihAIfqskxLrsUJ7C2Q1sPkGRNCDv+jKDHc0B12lSHdKdaMWPU+/o0zSwIW12g77DpTVuQRnAOehpa2moym689m4U2DMDcaMWv/j/bXD3DjPouNhPOjbFQfMizCc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dv1omI8MFqAC+wJx08YmOxdvn3qzpjZ83jgCDfIA9mw=;
 b=VFPsB00h2hw0bp3HmEpUGRq/omF5xhMcZruR6BlKQ1NTGvt99JAyTO3I1p6fWsNoJ5V3tQbZdGLQY/7MWUGwbjsI1Id+TfuyUgn48SUQhZLmyctQUhUmhGbMh3TjTliQ2cr+2cV4ZzSSYZQ5hxlqUoaaVciqS5lXqN4gPuDHj8Wu0hQWPRBFo3gwj9YZ+P9Yc589ESMPzLpuWQcscMll0FLcLVTSzw0/ubtkxiYM3bo5+fH6rn4lREj7819VK06Npr+bhLQQ1iO7+Tf/AgJl4o5nYdvVcAVhfEaA82J9U8dYlQO3aACPnrOfG/ce3n6pcob+TorZ/X8e2koYG8HEgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dv1omI8MFqAC+wJx08YmOxdvn3qzpjZ83jgCDfIA9mw=;
 b=Q+I4Dr3J07M28FPivyq8y7gzVVZwf1yo3bcMGykut3lIJ39QKQuqQ+K8A6H1fS91mZM8+bmi+cTxjJsxnifzkTtjgGpdvZZTNJBacZtZnjGjJvVs7e+Mv5Cf/nIx0SpblnVA5cCUt76UuJLMZ/YCsIkC8c0lu8EnIfh72w2oLZE=
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com (2603:10a6:803:119::15)
 by VI1PR0402MB2798.eurprd04.prod.outlook.com (2603:10a6:800:ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 14:33:58 +0000
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::e8e2:7756:13bc:2cb3]) by VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::e8e2:7756:13bc:2cb3%7]) with mapi id 15.20.3999.037; Wed, 14 Apr 2021
 14:33:58 +0000
From: Robin Gong <yibin.gong@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Shengjiu Wang
 <shengjiu.wang@gmail.com>
Subject: RE: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in probe
Thread-Topic: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in
 probe
Thread-Index: AQHWLcMcvbp0uyGgYk605EKKtgH/8aivLYuAgAF2HACAABbKAIIDgX+Q
Date: Wed, 14 Apr 2021 14:33:58 +0000
Message-ID: <VE1PR04MB66387217EDE5133FD2D8F793894E9@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <1589881301-4143-1-git-send-email-shengjiu.wang@nxp.com>
 <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
 <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
 <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
In-Reply-To: <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 497adc52-b3df-43a9-191f-08d8ff5256e6
x-ms-traffictypediagnostic: VI1PR0402MB2798:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB2798F6A1C1253DC2146EC8E4894E9@VI1PR0402MB2798.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uMO1G+peqKkueAq0cp071OQI3D/LibFl2yQaECJAPijjzXzdlvijPaL6YFdbLy9xbrdcr+4SmNwzNDGNCEfFWiYfg9szaRzxxd5SVKtFwKPGyuGxnLFx1XYsuTn+4KY25mIWEMsUFLKGOo0ALCnxA/k1k4Ubne2TvokBDRo26oKNodBM1+ilyZeUWN9GjlrRPYyt6rn4eKmTFe4kNlM4t2e+p2/qLl0HN+eWKQlRn+UvUUqTRLblbCNuiBNH4pnY1umTs4QZORIbeuc6wsvZ2tHjY00g16TP3x2l2DruGDQ/ASJ2WZXT2PUlqo5XBaIXPOP+g4y4R9j+EbZUivMFOmJTVQsqgV9Dzwjiv8CwFnpZriqOu30XKGt6dIRG2QI98Q0jbaLdbwm8ytAo+sqNiIeuXtyjAuUM3wCqEmGIgM4SeMKi3Gp9eiRaQuXgXm8Qe5OqBNq4UnvMG6blybvr60LLzbA8wOlwMwoKDs1W4HmaFg9C5pmGYPVO25F1PKA/69iKk4U3dy4Dbia0PjS1hhs559zNt47R8zpumLYlHzABB1cxksODsj5/K6cMThQ5SgclJxEvpgUBuERlYY1ZtdLT5A0OheM51qCVt7YMfECuUTcPgFRmJf/bjxXmg+bXGR1x1pAZIiHqIzZSmJgxx+2KiVb8kgDQu1H5gt6GAHs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6638.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(2906002)(478600001)(110136005)(38100700002)(7696005)(54906003)(5660300002)(8936002)(30864003)(122000001)(33656002)(86362001)(316002)(6506007)(66476007)(66556008)(186003)(7416002)(52536014)(83380400001)(8676002)(66946007)(53546011)(26005)(55016002)(76116006)(66446008)(4326008)(9686003)(64756008)(71200400001)(6606295002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?UWRvTUNTMGxnaUxuRjFtVTR4cHR6ekhQaTJ1aHVXQzRYUzFBREdDaHB1OTIr?=
 =?utf-8?B?VE1RUHlETGs2K3JjUnRvRk96eUhqcG11cXZvbzMzdE5xUkh0dHR6NlJUc29l?=
 =?utf-8?B?Y1dvcTlRanoyMXFWclFyQ0hVVGYxZVhyQng0WEpsMEFyZ1FlTjE3ZldUZlgv?=
 =?utf-8?B?VkU5ak1ZK0dkU0YrZTB2cmhJUVEyTXhlRmJrMjdKTTU5QVJtS09MU0JJUWFM?=
 =?utf-8?B?MjRkMDFPc2k1YkR4cEVBNzRoTTVSRXk1U0o3SGZUVGJmN0J0YkpYU3R6eVFJ?=
 =?utf-8?B?QnBQQTNNL1pnSHNQVVVKRUlpYjRCcUFqbS9YNngyS3l1Y1lHZ0tkM0I2Nml2?=
 =?utf-8?B?VTNaTHYrVlArVXN4SG9kRHZHTzlJeGtpUXEvbGJaSXpyRis1RklTYi9VaTc0?=
 =?utf-8?B?bVg5MEFzN1RsY3RtODBJbHJDSWxWT3NzbGNuRjVoa0hUMFhCdGF0ZEMxK1V4?=
 =?utf-8?B?MmNDdFR1YWxyNUZFdHkvNlZJSHdzSm1WTHY2bk5YeTR2NnJncHdBeUlqK0s0?=
 =?utf-8?B?MzU1OFFBMEo2NnpqdEhtTkVlNFVBWmwydlFTMDhkZzMyNmFhTG5SdSsyK0Iw?=
 =?utf-8?B?Qk1PUFVZUEh2RHhKTmtUbzFkSi8zRHJpdkVtWnYrVU1RRzcyZk9wNndWaEla?=
 =?utf-8?B?MS9OdEFQbjNheXUyUmpqdU5LNnhXd0o0TlNKMkU3Nm9oMlZZMjBVMWRpU1Rm?=
 =?utf-8?B?Qmd0bzRjTldtcTlQdXdmd1RqV01nRUJIN3lmWkl1MVZ1VVU2TWZxdnBWL1Rt?=
 =?utf-8?B?bUNRcnc1d25vM3RQNm5yaXRBTGpHMStZTHUzUEJSVlRDbUhFcnkyT2RPQ2xi?=
 =?utf-8?B?NlRzbThta1VZeHdjQ3BJQkREcVd4QzVIcndZQlROaWFyY3BaR0trQ1NMV0U4?=
 =?utf-8?B?OXA3T0JPOUtBTTFKOVFoK1pMOFpmdG5rclplSkduaUU1R0hMV05WNXpwRGx5?=
 =?utf-8?B?YkhGMG9oa3c2VjROS0xDYlhtQVZENnZjcS8wK0Q0L2dhc3Fja2dyZjZ2eHc0?=
 =?utf-8?B?WnJWaWFsbWNUdDhvaHU5Nzd1ZVQ5ZkQ5aTkzNUp3aUxPNXloaGZibWNmTG1J?=
 =?utf-8?B?QkFhdG9CNDRhem1IWVp0UEttKy9PYXk4YktieXNobWlFNS80OGhaRVpSN1VN?=
 =?utf-8?B?bzYwK1doRHhlT1NjbkkvL1pCdDlNOGQ0dzlwZWZQVXZsTTg0czUyR0RWUlhS?=
 =?utf-8?B?c3JjY2I1QmxDZjExbFFMbzhndnlFM285Qlp2UFQxVzZlNDhrM21CR0JUa2xh?=
 =?utf-8?B?cHlVWkowc2VzUXlEb0xBbjRLQWFzSmNFMUhkREY5T3dmNGlsekRicmdoK3VG?=
 =?utf-8?B?dForWFA3MDN6bFdoMU1wRU1hTlVmSkRhR0JTTWZGYlV1c3p2cU5XbGRibDY5?=
 =?utf-8?B?ZXQ2OVE4emRpUzQ4ZHJ6Nm5BMC8vYUM4WnBZNDRSKzlCT0VIMGV6aERGcGhu?=
 =?utf-8?B?UkdUWTB1U3QyY2JraEtEZGE4T3VNSjBQK3RaNjlXYjhFbXI5ME9TWHJYb1l3?=
 =?utf-8?B?QnFZM3pMWmd2Tk5tTHNGWjZMZmdnNHBiOFJZcjVjRGtqcGpObTRFTjRyTDUw?=
 =?utf-8?B?MVRjT3hsT3NUTCtGNUNPSEgzb1UrQUhmb2laNUViVEtyc1RwT0xQb3pKemlS?=
 =?utf-8?B?Uyt5dGZpY2pqYWVhemFRRktJNzg2NDZTb2JTVm8rT0pBTi9hZUJ6dTJTOSsz?=
 =?utf-8?B?bko5UDV5YzVOU1FtVDZWUGlQbWJ1UmlHcEEwTUJzcVpZekhiQk5aV0ovQ0Z2?=
 =?utf-8?Q?V2Eln5l87F27IkFzKYkOES1AgO/BRhaXqZjVjQ9?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6638.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 497adc52-b3df-43a9-191f-08d8ff5256e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2021 14:33:58.2487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PjPaATlq1VB1OAmSaXz6iBzi2Vp4NAlzgWiQQJCRlHgwufSKqaFoqR7K8bOVCxIGiXC8L+cX3WLd8Q8/Gwi0VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2798
X-Mailman-Approved-At: Wed, 14 Apr 2021 14:42:49 +0000
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "perex@perex.cz" <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020/05/20 17:43 Lucas Stach <l.stach@pengutronix.de> wrote:
> Am Mittwoch, den 20.05.2020, 16:20 +0800 schrieb Shengjiu Wang:
> > Hi
> >
> > On Tue, May 19, 2020 at 6:04 PM Lucas Stach <l.stach@pengutronix.de>
> wrote:
> > > Am Dienstag, den 19.05.2020, 17:41 +0800 schrieb Shengjiu Wang:
> > > > There are two requirements that we need to move the request of dma
> > > > channel from probe to open.
> > >
> > > How do you handle -EPROBE_DEFER return code from the channel request
> > > if you don't do it in probe?
> >
> > I use the dma_request_slave_channel or dma_request_channel instead of
> > dmaengine_pcm_request_chan_of. so there should be not -EPROBE_DEFER
> > return code.
> 
> This is a pretty weak argument. The dmaengine device might probe after you
> try to get the channel. Using a function to request the channel that doesn't
> allow you to handle probe deferral is IMHO a bug and should be fixed, instead
> of building even more assumptions on top of it.
> 
> > > > - When dma device binds with power-domains, the power will be
> > > > enabled when we request dma channel. If the request of dma channel
> > > > happen on probe, then the power-domains will be always enabled
> > > > after kernel boot up,  which is not good for power saving,  so we
> > > > need to move the request of dma channel to .open();
> > >
> > > This is certainly something which could be fixed in the dmaengine
> > > driver.
> >
> > Dma driver always call the pm_runtime_get_sync in
> > device_alloc_chan_resources, the device_alloc_chan_resources is called
> > when channel is requested. so power is enabled on channel request.
> 
> So why can't you fix the dmaengine driver to do that RPM call at a later time
> when the channel is actually going to be used? This will allow further power
> savings with other slave devices than the audio PCM.
Hi Lucas,
  Thanks for your suggestion. I have tried to implement runtime autosuspend in
fsl-edma driver on i.mx8qm/qxp with delay time (2 sec) for this feature as below
(or you can refer to drivers/dma/qcom/hidma.c), and pm_runtime_get_sync/
pm_runtime_put_autosuspend in all dmaengine driver interface like
device_alloc_chan_resources/device_prep_slave_sg/device_prep_dma_cyclic/
device_tx_status...


                pm_runtime_use_autosuspend(fsl_chan->dev);
                pm_runtime_set_autosuspend_delay(fsl_chan->dev, 2000);

That could resolve this audio case since the autosuspend could suspend runtime after
2 seconds if there is no further dma transfer but only channel request(device_alloc_chan_resources).
But unfortunately, it cause another issue. As you know, on our i.mx8qm/qxp, 
power domain done by scfw (drivers/firmware/imx/scu-pd.c) over mailbox:
 imx_sc_pd_power()->imx_scu_call_rpc()-> imx_scu_ipc_write()->mbox_send_message()
which means have to 'waits for completion', meanwhile, some driver like tty will call dmaengine
interfaces in non-atomic case as below, 

static int uart_write(struct tty_struct *tty, const unsigned char *buf, int count)
{
   .......
	    port = uart_port_lock(state, flags);
   ......
        __uart_start(tty);  //call start_tx()->dmaengine_prep_slave_sg...
        uart_port_unlock(port, flags);
        return ret;
}

Thus dma runtime resume may happen in that timing window and cause kernel alarm. 
I'm not sure whether there are similar limitations on other driver subsystem. But for me,
It looks like the only way to resolve the contradiction between tty and scu-pd (hardware
limitation on i.mx8qm/qxp) is to give up autosuspend and keep pm_runtime_get_sync
only in device_alloc_chan_resources because request channel is a safe non-atomic phase. 
Do you have any idea? Thanks in advance. 
  

> 
> > > > - With FE-BE case, if the dma channel is requested in probe, then
> > > > there will be below issue, which is caused by that the dma channel
> > > > will be requested duplicately
> > >
> > > Why is this requested a second time? Is this just some missing
> > > cleanup on a deferred probe path?
> >
> > Not relate with deferred probe.  With DMA1->ASRC->DMA2->ESAI case, the
> > DMA1->ASRC->DMA2 is in FE,  ESAI is in BE.  When ESAI drvier probe,
> > DMA3 channel is created with ESAI's "dma:tx" (DMA3 channel
> > is not used in this FE-BE case).    When FE-BE startup, DMA2
> > channel is created, it needs the ESAI's "dma:tx", so below warning
> > comes out.
> >
> > > Regards,
> > > Lucas
> > >
> > > > [  638.906268] sysfs: cannot create duplicate filename
> '/devices/soc0/soc/2000000.bus/2000000.spba-bus/2024000.esai/dma:tx'
> > > > [  638.919061] CPU: 1 PID: 673 Comm: aplay Not tainted
> > > > 5.7.0-rc1-12956-gfc64b2585593 #287 [  638.927113] Hardware name:
> > > > Freescale i.MX6 Quad/DualLite (Device Tree) [  638.933690]
> > > > [<c0110dd8>] (unwind_backtrace) from [<c010b8ec>]
> > > > (show_stack+0x10/0x14) [  638.941464] [<c010b8ec>] (show_stack)
> > > > from [<c0557fc0>] (dump_stack+0xe4/0x118) [  638.948808]
> > > > [<c0557fc0>] (dump_stack) from [<c032aeb4>]
> > > > (sysfs_warn_dup+0x50/0x64) [  638.956406] [<c032aeb4>]
> > > > (sysfs_warn_dup) from [<c032b1a8>]
> > > > (sysfs_do_create_link_sd+0xc8/0xd4)
> > > > [  638.965134] [<c032b1a8>] (sysfs_do_create_link_sd) from
> > > > [<c05dc668>] (dma_request_chan+0xb0/0x210) [  638.974120]
> > > > [<c05dc668>] (dma_request_chan) from [<c05dc7d0>]
> > > > (dma_request_slave_channel+0x8/0x14)
> > > > [  638.983111] [<c05dc7d0>] (dma_request_slave_channel) from
> > > > [<c09d5548>] (fsl_asrc_dma_hw_params+0x1e0/0x438)
> > > > [  638.992881] [<c09d5548>] (fsl_asrc_dma_hw_params) from
> > > > [<c09c1654>] (soc_pcm_hw_params+0x4a0/0x6a8) [  639.001952]
> > > > [<c09c1654>] (soc_pcm_hw_params) from [<c09c39d4>]
> > > > (dpcm_fe_dai_hw_params+0x70/0xe4) [  639.010765] [<c09c39d4>]
> > > > (dpcm_fe_dai_hw_params) from [<c099b274>]
> > > > (snd_pcm_hw_params+0x158/0x418) [  639.019750] [<c099b274>]
> > > > (snd_pcm_hw_params) from [<c099c5a0>]
> (snd_pcm_ioctl+0x734/0x183c) [  639.028129] [<c099c5a0>] (snd_pcm_ioctl)
> from [<c029ff94>] (ksys_ioctl+0x2ac/0xb98) [  639.035812] [<c029ff94>]
> (ksys_ioctl) from [<c0100080>] (ret_fast_syscall+0x0/0x28) [  639.043490]
> Exception stack(0xec529fa8 to 0xec529ff0)
> > > > [  639.048565] 9fa0:                   bee84650 01321870
> 00000004 c25c4111 bee84650 0002000f
> > > > [  639.056766] 9fc0: bee84650 01321870 01321820 00000036
> 00001f40
> > > > 00000000 0002c2f8 00000003 [  639.064964] 9fe0: b6f483fc bee8451c
> > > > b6ee2655 b6e1dcf8 [  639.070339] fsl-esai-dai 2024000.esai: Cannot
> > > > create DMA dma:tx symlink
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  sound/soc/fsl/imx-pcm-dma.c | 173
> > > > +++++++++++++++++++++++++++++++++---
> > > >  1 file changed, 159 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/sound/soc/fsl/imx-pcm-dma.c
> > > > b/sound/soc/fsl/imx-pcm-dma.c index 04a9bc749016..dae53b384df4
> > > > 100644
> > > > --- a/sound/soc/fsl/imx-pcm-dma.c
> > > > +++ b/sound/soc/fsl/imx-pcm-dma.c
> > > > @@ -11,6 +11,7 @@
> > > >  #include <linux/dmaengine.h>
> > > >  #include <linux/types.h>
> > > >  #include <linux/module.h>
> > > > +#include <linux/dma-mapping.h>
> > > >
> > > >  #include <sound/core.h>
> > > >  #include <sound/pcm.h>
> > > > @@ -29,24 +30,168 @@ static bool filter(struct dma_chan *chan, void
> *param)
> > > >       return true;
> > > >  }
> > > >
> > > > -static const struct snd_dmaengine_pcm_config
> imx_dmaengine_pcm_config = {
> > > > -     .prepare_slave_config =
> snd_dmaengine_pcm_prepare_slave_config,
> > > > -     .compat_filter_fn = filter,
> > > > -};
> > > > +static int imx_pcm_hw_params(struct snd_soc_component
> *component,
> > > > +                          struct snd_pcm_substream *substream,
> > > > +                          struct snd_pcm_hw_params *params) {
> > > > +     struct snd_pcm_runtime *runtime = substream->runtime;
> > > > +     struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > > > +     struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > > > +     struct snd_dmaengine_dai_dma_data *dma_data;
> > > > +     struct dma_slave_config config;
> > > > +     struct dma_chan *chan;
> > > > +     int ret = 0;
> > > >
> > > > -int imx_pcm_dma_init(struct platform_device *pdev, size_t size)
> > > > +     snd_pcm_set_runtime_buffer(substream,
> &substream->dma_buffer);
> > > > +     runtime->dma_bytes = params_buffer_bytes(params);
> > > > +
> > > > +     chan = snd_dmaengine_pcm_get_chan(substream);
> > > > +     if (!chan)
> > > > +             return -EINVAL;
> > > > +
> > > > +     ret = snd_hwparams_to_dma_slave_config(substream, params,
> &config);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     dma_data = snd_soc_dai_get_dma_data(cpu_dai, substream);
> > > > +     if (!dma_data)
> > > > +             return -EINVAL;
> > > > +
> > > > +     snd_dmaengine_pcm_set_config_from_dai_data(substream,
> > > > +                                                dma_data,
> > > > +                                                &config);
> > > > +     return dmaengine_slave_config(chan, &config); }
> > > > +
> > > > +static int imx_pcm_hw_free(struct snd_soc_component *component,
> > > > +                        struct snd_pcm_substream *substream)
> > > >  {
> > > > -     struct snd_dmaengine_pcm_config *config;
> > > > +     snd_pcm_set_runtime_buffer(substream, NULL);
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static snd_pcm_uframes_t imx_pcm_pointer(struct snd_soc_component
> *component,
> > > > +                                      struct snd_pcm_substream
> > > > +*substream) {
> > > > +     return snd_dmaengine_pcm_pointer(substream);
> > > > +}
> > > > +
> > > > +static int imx_pcm_trigger(struct snd_soc_component *component,
> > > > +                        struct snd_pcm_substream *substream, int
> > > > +cmd) {
> > > > +     return snd_dmaengine_pcm_trigger(substream, cmd); }
> > > > +
> > > > +static int imx_pcm_open(struct snd_soc_component *component,
> > > > +                     struct snd_pcm_substream *substream) {
> > > > +     struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > > > +     bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
> > > > +     struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > > > +     struct snd_dmaengine_dai_dma_data *dma_data;
> > > > +     struct device *dev = component->dev;
> > > > +     struct snd_pcm_hardware hw;
> > > > +     struct dma_chan *chan;
> > > > +     int ret;
> > > > +
> > > > +     ret = snd_pcm_hw_constraint_integer(substream->runtime,
> > > > +
> SNDRV_PCM_HW_PARAM_PERIODS);
> > > > +     if (ret < 0) {
> > > > +             dev_err(dev, "failed to set pcm hw params periods\n");
> > > > +             return ret;
> > > > +     }
> > > > +
> > > > +     dma_data = snd_soc_dai_get_dma_data(cpu_dai, substream);
> > > > +     if (!dma_data)
> > > > +             return -EINVAL;
> > > > +
> > > > +     chan = dma_request_slave_channel(cpu_dai->dev, tx ? "tx" : "rx");
> > > > +     if (!chan) {
> > > > +             /* Try to request channel using compat_filter_fn */
> > > > +             chan = snd_dmaengine_pcm_request_channel(filter,
> > > > +
> dma_data->filter_data);
> > > > +             if (!chan)
> > > > +                     return -ENXIO;
> > > > +     }
> > > >
> > > > -     config = devm_kzalloc(&pdev->dev,
> > > > -                     sizeof(struct snd_dmaengine_pcm_config),
> GFP_KERNEL);
> > > > -     if (!config)
> > > > -             return -ENOMEM;
> > > > -     *config = imx_dmaengine_pcm_config;
> > > > +     ret = snd_dmaengine_pcm_open(substream, chan);
> > > > +     if (ret)
> > > > +             goto pcm_open_fail;
> > > >
> > > > -     return devm_snd_dmaengine_pcm_register(&pdev->dev,
> > > > -             config,
> > > > -             SND_DMAENGINE_PCM_FLAG_COMPAT);
> > > > +     memset(&hw, 0, sizeof(hw));
> > > > +     hw.info = SNDRV_PCM_INFO_MMAP |
> SNDRV_PCM_INFO_MMAP_VALID |
> > > > +                     SNDRV_PCM_INFO_INTERLEAVED;
> > > > +     hw.periods_min = 2;
> > > > +     hw.periods_max = UINT_MAX;
> > > > +     hw.period_bytes_min = 256;
> > > > +     hw.period_bytes_max =
> dma_get_max_seg_size(chan->device->dev);
> > > > +     hw.buffer_bytes_max = IMX_DEFAULT_DMABUF_SIZE;
> > > > +     hw.fifo_size = dma_data->fifo_size;
> > > > +
> > > > +     /* Refine the hw according to caps of DMA. */
> > > > +     ret = snd_dmaengine_pcm_refine_runtime_hwparams(substream,
> > > > +
> dma_data,
> > > > +                                                     &hw,
> > > > +                                                     chan);
> > > > +     if (ret < 0)
> > > > +             goto refine_runtime_hwparams_fail;
> > > > +
> > > > +     snd_soc_set_runtime_hwparams(substream, &hw);
> > > > +
> > > > +     /* Support allocate memory from IRAM */
> > > > +     ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_IRAM,
> > > > +                               chan->device->dev,
> > > > +                               hw.buffer_bytes_max,
> > > > +                               &substream->dma_buffer);
> > > > +     if (ret < 0)
> > > > +             goto alloc_pagas_fail;
> > > > +
> > > > +     return 0;
> > > > +
> > > > +alloc_pagas_fail:
> > > > +refine_runtime_hwparams_fail:
> > > > +     snd_dmaengine_pcm_close(substream);
> > > > +pcm_open_fail:
> > > > +     dma_release_channel(chan);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +
> > > > +static int imx_pcm_close(struct snd_soc_component *component,
> > > > +                      struct snd_pcm_substream *substream) {
> > > > +     if (substream) {
> > > > +             snd_dma_free_pages(&substream->dma_buffer);
> > > > +             substream->dma_buffer.area = NULL;
> > > > +             substream->dma_buffer.addr = 0;
> > > > +     }
> > > > +
> > > > +     return snd_dmaengine_pcm_close_release_chan(substream);
> > > > +}
> > > > +
> > > > +static int imx_pcm_new(struct snd_soc_component *component,
> > > > +                    struct snd_soc_pcm_runtime *rtd) {
> > > > +     struct snd_card *card = rtd->card->snd_card;
> > > > +
> > > > +     return dma_coerce_mask_and_coherent(card->dev,
> > > > +DMA_BIT_MASK(32)); }
> > > > +
> > > > +static const struct snd_soc_component_driver imx_pcm_component = {
> > > > +     .name           = "imx-pcm-dma",
> > > > +     .pcm_construct  = imx_pcm_new,
> > > > +     .open           = imx_pcm_open,
> > > > +     .close          = imx_pcm_close,
> > > > +     .hw_params      = imx_pcm_hw_params,
> > > > +     .hw_free        = imx_pcm_hw_free,
> > > > +     .trigger        = imx_pcm_trigger,
> > > > +     .pointer        = imx_pcm_pointer,
> > > > +};
> > > > +
> > > > +int imx_pcm_dma_init(struct platform_device *pdev, size_t size) {
> > > > +     return devm_snd_soc_register_component(&pdev->dev,
> > > > +
> &imx_pcm_component,
> > > > +NULL, 0);
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(imx_pcm_dma_init);
> > > >

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
