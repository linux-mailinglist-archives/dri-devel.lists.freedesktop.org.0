Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99448A3872E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 16:03:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8058710E0CE;
	Mon, 17 Feb 2025 15:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="w/vCsIdo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D7310E0CE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 15:03:35 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5452c29bacfso3529839e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 07:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739804614; x=1740409414;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=//GayiTjk2VgwOuQxZT0tXCo12hznJ8fyvNG07N/o2g=;
 b=w/vCsIdoPPe45ifxbHjKM4dN0PBGQ9jrHqlIarHrtEAMlc5LxtEa3m6W5aaEDU5MHR
 G1NbEjVFuNYPJpd8q/Dv/rStboPlEMhaERR23LbVHy6bGnkycE5oZz+7aYD7BGXpaD6K
 sDECU0MfEhoXlSXEmd73UPCCjeOAfJUtQ56PComhpqRwa/T2yDP9Rittaq1MIpnMqvw1
 KVdNUCZjPVKnA62kuBOK1tnq66QuuKYNr/BCpFYGDm4jrgcUJj3BulZlMqPhSk0EeKQM
 sbepAie4nuHow23zquNK3FtKsxBWd3hJK/K9LrwFak+MSASmbGw9zspIgwuqS10/TyYf
 lL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739804614; x=1740409414;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=//GayiTjk2VgwOuQxZT0tXCo12hznJ8fyvNG07N/o2g=;
 b=sfgGFeOS3L73LQq5LwBlHiRObeTXZgVx6Kk6KrwZTx/K0z6Sk0OFTxh1naNJqp3KnR
 Wit43BmLRoYjG3e1Pyvpplgzv+9Bnoyazfmkp80yEmhjH7vr80FYe7TZnUWI5+mp0d9/
 tCrKANqI4GvaLZD+M31BRLGmHrCJXj1WJfYQMV53IwUhYWRrbaOCCF5wipDq263f+MFv
 /2tvVsXlfsAOARFAN0309g+1sLaHu6rtDa8/2uKprZqyzHhD9MmvLmE++FUQsEmjisyb
 lbLwXJ2Y1buvN+lV4iJwzOMoNgv9WdPGCyXv2VMGJJQgWTb8NJGohwO/k8giDWxqlnne
 qxaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWepxHecu6gSM+CnxlXJqFDGoEO+RWrCfiN50+PYfOnD/vytt3f2uy1VRdNaQdM2gm4aODDJ9EJxHU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGe0z5cO8yJ2E5S5xEgxzOsd3yQs2dNHUNj1dAhkJ3t60LNcdG
 YrQh2r/q+lHupriP59KRwej5/DtkQkabfc+9+MjmqW8NFucVy3UaIHT2gD/Elvd/ksW14wsUS5i
 uKqg=
X-Gm-Gg: ASbGncuibR9tQFljMRRP6dJFLAP21coARgkc7qmwziU5zTyJ7f+MnwrFq+ke8BgyqoS
 ixpkloEld5Xbxn37d9KkVrfYjsRQ1PjW1raTPPYKDpwbh0Flmq0GWGkii31089fQnUZ6NQro7w5
 jBw8JYuFHpClFAJLUKOnTbJ7wu8FqVSR5Zka+7PNGWpLSJTVtGX82j9mrAaPyGiRkCqEEdm0KWb
 HrN6bC/WCc58g9bVyZ9nOdO69xi0MeEfZM7QKtkqR15UjMpsep5o+YDvibQG/iryh6D3p9FS5Ew
 uFkEoHSlFc42l4Fg/NRtJh5wxoex0nbAcSf+iXPKa84EZ4WoRJLYoJsNhrRwamk=
X-Google-Smtp-Source: AGHT+IF9JYqSQ6ntE3558qRENvEigRRMYqxdMfCUuklz4yeVdCf7BoSLXDiwqfmV2TzwBrbwiuonQQ==
X-Received: by 2002:a05:6000:1f87:b0:38f:23f4:2d7a with SMTP id
 ffacd0b85a97d-38f33f43751mr9709394f8f.40.1739804602180; 
 Mon, 17 Feb 2025 07:03:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:9c3e:a06c:91d9:c06b?
 ([2a01:e0a:5ee:79d0:9c3e:a06c:91d9:c06b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b412esm12273223f8f.1.2025.02.17.07.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 07:03:21 -0800 (PST)
Message-ID: <79477810-00a9-47f1-8282-f8077ea082bb@baylibre.com>
Date: Mon, 17 Feb 2025 16:03:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "will@kernel.org" <will@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
 <20231023-display-support-v7-2-6703f3e26831@baylibre.com>
 <ab3bd050c873bb6cecc00b615b938eabc157cb49.camel@mediatek.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <ab3bd050c873bb6cecc00b615b938eabc157cb49.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi CK.

On 17/02/2025 08:56, CK Hu (胡俊光) wrote:
> On Fri, 2025-01-10 at 14:31 +0100, Alexandre Mergnat wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>> 
>> 
>> Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
>> before mtk_dsi_poweron. lanes_ready flag toggle to true during
>> mtk_dsi_lane_ready function, and the DSI module is set up during
>> mtk_dsi_poweron.
>> 
>> Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
>> nothing because lanes are considered ready. Unfortunately, when the panel
>> driver try to communicate, the DSI returns a timeout.
>> 
>> The solution found here is to put lanes_ready flag to false after the DSI
>> module setup into mtk_dsi_poweron to init the DSI lanes after the power /
>> setup of the DSI module.
> 
> I'm not clear about what happen.
> I think this DSI flow has worked for a long time.
> So only some panel has problem?

I don't know if it's related to a specific panel or not.

> 
> And another question.
> Do you mean mtk_dsi_lane_ready() do some setting to hardware, but lane is not actually ready?

The workflow should be:
... | dsi->lanes_ready = false | Power-on | setup dsi lanes | dsi->lanes_ready = true (to avoid 
re-do dsi lanes setup) | ...

I observe (print function name called + dsi->lanes_ready value):

[    9.086030] mtk_dsi_probe 0
[    9.662319] mtk_dsi_host_attach 0
[    9.662941] mtk_dsi_encoder_init
[    9.984685] mtk_dsi_poweron 0
[   10.043755] mtk_dsi_host_transfer 0
[   10.043769] mtk_dsi_lane_ready 0
[   10.055837] mtk_dsi_host_transfer 1
[   10.055853] mtk_dsi_lane_ready 1
[   10.179788] mtk_dsi_host_transfer 1
[   10.179803] mtk_dsi_lane_ready 1
[   10.179880] mtk_dsi_host_transfer 1
[   10.179885] mtk_dsi_lane_ready 1
[   10.179920] mtk_dsi_host_transfer 1
[   10.179923] mtk_dsi_lane_ready 1
[   10.179986] mtk_dsi_host_transfer 1
[   10.179993] mtk_dsi_lane_ready 1
[   10.180134] mtk_dsi_host_transfer 1
[   10.180143] mtk_dsi_lane_ready 1
[   10.180175] mtk_dsi_host_transfer 1
[   10.180178] mtk_dsi_lane_ready 1
[   10.180223] mtk_dsi_host_transfer 1
[   10.180226] mtk_dsi_lane_ready 1
[   10.180245] mtk_dsi_host_transfer 1
[   10.180248] mtk_dsi_lane_ready 1
[   10.180278] mtk_dsi_host_transfer 1
[   10.180280] mtk_dsi_lane_ready 1
[   10.180312] mtk_dsi_host_transfer 1
[   10.180314] mtk_dsi_lane_ready 1
[   10.203774] mtk_dsi_bridge_atomic_pre_enable
[   10.203787] mtk_dsi_poweron 1
[   10.203793] mtk_output_dsi_enable
[   10.203795] mtk_dsi_lane_ready 1
[   10.471517] mtk_dsi_host_transfer 1
[   10.486962] mtk_dsi_lane_ready 1
[   10.487244] mtk_dsi_host_transfer 1
[   10.503733] mtk_dsi_lane_ready 1

Here the mtk_dsi_lane_ready function:

	static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
	{
		if (!dsi->lanes_ready) {
			dsi->lanes_ready = true;
			mtk_dsi_rxtx_control(dsi);
			usleep_range(30, 100);
			mtk_dsi_reset_dphy(dsi);
			mtk_dsi_clk_ulp_mode_leave(dsi);
			mtk_dsi_lane0_ulp_mode_leave(dsi);
			mtk_dsi_clk_hs_mode(dsi, 0);
			usleep_range(1000, 3000);
			/* The reaction time after pulling up the mipi signal for dsi_rx */
		}
	}


As you can see, something call "mtk_dsi_bridge_atomic_pre_enable" then mtk_dsi_poweron is called a 
second time. This issue is probably due to the probe order (race condition).
After all, IMHO, after a poweron, the registers status should be consider as unknown (or at least HW 
default value), so, lanes setup has to be done. This solution improve the driver's robustness.


> Or mtk_dsi_lane_ready() configure the hardware and lane is is actually ready,
> but something make it not ready again, what's the thing which break lane ready?
> 
> If this is a bug fix, add Fixes tag.
> 
> Regards,
> CK
> 
>> 
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index e61b9bc68e9a..dcf0d93881b5 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -724,6 +724,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>>         mtk_dsi_config_vdo_timing(dsi);
>>         mtk_dsi_set_interrupt_enable(dsi);
>> 
>> +       dsi->lanes_ready = false;
>> +
>>         return 0;
>>  err_disable_engine_clk:
>>         clk_disable_unprepare(dsi->engine_clk);
>> 
>> --
>> 2.25.1
>> 
> 
> 
> ************* MEDIATEK Confidentiality Notice
>   ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
>   
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
> 

-- 
Regards,
Alexandre
