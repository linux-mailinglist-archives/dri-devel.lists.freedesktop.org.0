Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9596DD829
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 12:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A058610E175;
	Tue, 11 Apr 2023 10:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id C09FF10E175
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 10:44:37 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:53314.233135370
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 8596310013E;
 Tue, 11 Apr 2023 18:44:33 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 34c062daeef4482cada5c101c1f03811 for emil.l.velikov@gmail.com; 
 Tue, 11 Apr 2023 18:44:35 CST
X-Transaction-ID: 34c062daeef4482cada5c101c1f03811
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <d46621fc-94d1-8c33-76e9-00825763719b@189.cn>
Date: Tue, 11 Apr 2023 18:44:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v10 2/2] drm: add kms driver for loongson display
 controller
Content-Language: en-US
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20230403171304.2157326-1-suijingfeng@loongson.cn>
 <20230403171304.2157326-3-suijingfeng@loongson.cn>
 <CACvgo53h+X26wngVmxpn3oVb9kbJezTHx61p3rZDR7sw1AQrWQ@mail.gmail.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <CACvgo53h+X26wngVmxpn3oVb9kbJezTHx61p3rZDR7sw1AQrWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: nathan@kernel.org, loongson-kernel@lists.loongnix.cn,
 Thomas Zimmermann <tzimmermann@suse.de>, Li Yi <liyi@loongson.cn>,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/4/4 22:10, Emil Velikov wrote:
>> +static const struct dev_pm_ops lsdc_pm_ops = {
>> +       .suspend = lsdc_pm_suspend,
>> +       .resume = lsdc_pm_resume,
>> +       .freeze = lsdc_pm_freeze,
>> +       .thaw = lsdc_pm_thaw,
>> +       .poweroff = lsdc_pm_freeze,
>> +       .restore = lsdc_pm_resume,
>> +};
>> +
> The above section (and functions) should probably be wrapped in a
> CONFIG_PM_SLEEP block.
>
I agree with you.

I see imx-drm has this guard, but it's for embedded platform.

But I also see drm/ast and drm/radeon also didn't add this.

Maybe S3/S4 support is mandatory for PC platform?

Coding this way to force the kernel to enable PM_SLEEP option, otherwise 
there a pile of driver won't get compiled.

At lease drm/ast and drm/radeon is usable on LoongArch/Mips/X86-64 platform.


