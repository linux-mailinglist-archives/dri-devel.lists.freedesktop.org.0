Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB7F777768
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 13:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F401410E508;
	Thu, 10 Aug 2023 11:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A47210E506;
 Thu, 10 Aug 2023 11:42:29 +0000 (UTC)
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 10 Aug
 2023 14:42:26 +0300
Received: from [192.168.211.130] (10.0.253.138) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 10 Aug
 2023 14:42:25 +0300
Message-ID: <8a547455-1f5b-f3bf-3fcc-553760940deb@fintech.ru>
Date: Thu, 10 Aug 2023 04:42:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] video/hdmi: convert *_infoframe_init() functions to void
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <20230808180245.7474-1-n.zhandarovich@fintech.ru>
 <ibwl2bpz5bs72co4ivkvjcc35lv5mqyuvj2hbr3p54hliujklm@uje662ldqfdw>
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
In-Reply-To: <ibwl2bpz5bs72co4ivkvjcc35lv5mqyuvj2hbr3p54hliujklm@uje662ldqfdw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
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
Cc: linux-fbdev@vger.kernel.org, lvc-project@linuxtesting.org,
 Emma Anholt <emma@anholt.net>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org, Thierry
 Reding <thierry.reding@gmail.com>, Helge Deller <deller@gmx.de>,
 amd-gfx@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>, Alain
 Volmat <alain.volmat@foss.st.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On 8/10/23 01:13, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Aug 08, 2023 at 11:02:45AM -0700, Nikita Zhandarovich wrote:
>> Four hdmi_*_infoframe_init() functions that initialize different
>> types of hdmi infoframes only return the default 0 value, contrary to
>> their descriptions. Yet these functions are still unnecessarily checked
>> against possible errors in case of failure.
>>
>> Remove redundant error checks in calls to following functions:
>> - hdmi_spd_infoframe_init
>> - hdmi_audio_infoframe_init
>> - hdmi_vendor_infoframe_init
>> - hdmi_drm_infoframe_init
>> Also, convert these functions to 'void' and fix their descriptions.
> 
> I'm not sure what value it actually adds. None of them return any
> errors, but very well might if we started to be a bit serious about it.
> 
> Since the error handling is already there, then I'd rather leave it
> there.

There is definitely no particular urgency to this change.

Since these functions don't perform anything complex and aren't updated
regularly, my main goal was to remove unnecessary (at the moment) checks
and fix up their somewhat misleading descriptions. Cleaning up, in other
words. But I understand your point of view.

If you don't think this patch is warranted at this point, I totally
understand.

> 
>> Fixes: 2c676f378edb ("[media] hdmi: added unpack and logging functions for InfoFrames")
> 
> I'm confused about that part. What does it fix exactly?
> 
> Maxime

I added the 'Fixes:' tag mostly as a requirement for patch's
description. Once again, it doesn't "fix" anything broken as much as it
cleans up stuff.

Best regards,
Nikita





