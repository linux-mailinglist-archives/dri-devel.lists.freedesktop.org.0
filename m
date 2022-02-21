Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754874BDB51
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 18:36:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B3910E55E;
	Mon, 21 Feb 2022 17:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F30010E55E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 17:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PkpUpGJ5fnZavlDzdbOdq/17AO+V95dcZa/mE2WXAVg=; b=NY4d56ipV+ocFh5z0mNXf4EUne
 0cybsnz+sCoMyNGGmrBQAF3IztUaD4VTsdgx3LQjBi4E4Kx6kty0oDhd81IngYd5FWuvuDAL4+kgu
 R9SntmnlQl8dPHbaAW/Hs56NWT/CI6btDP3MeORUQEe3u4D/L3eFkQ/SeNsvg9ienk5G+9X7nyq3n
 mNGMmY0u90eqfUddJbp7AVkc74mGY372hpeAo3GbU4sjBvd4jmCnC2XsfqUlpz/0QHcI9szjyxG8v
 QpIJ6gyG8M9cC0eSIZRxljwFXf0fMFGHXnzqnoy7vI0ZngkKYanPfVYSr3DwcFwJGC69NqWoCJy1S
 P7D0XKBQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1nMCbW-0002UU-8v; Mon, 21 Feb 2022 19:36:06 +0200
Message-ID: <6be67fc4-3343-123e-5dc3-d45f51f42624@kapsi.fi>
Date: Mon, 21 Feb 2022 19:36:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v3 8/9] drm/tegra: vic: Implement get_streamid_offset
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-9-mperttunen@nvidia.com>
 <71e94ac3-20fc-6f41-270f-fe246740e7e0@arm.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <71e94ac3-20fc-6f41-270f-fe246740e7e0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/21/22 19:27, Robin Murphy wrote:
> On 2022-02-18 11:39, Mikko Perttunen via iommu wrote:
>> Implement the get_streamid_offset required for supporting context
>> isolation. Since old firmware cannot support context isolation
>> without hacks that we don't want to implement, check the firmware
>> binary to see if context isolation should be enabled.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>>   drivers/gpu/drm/tegra/vic.c | 38 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
>> index 1e342fa3d27b..2863ee5e0e67 100644
>> --- a/drivers/gpu/drm/tegra/vic.c
>> +++ b/drivers/gpu/drm/tegra/vic.c
>> @@ -38,6 +38,8 @@ struct vic {
>>       struct clk *clk;
>>       struct reset_control *rst;
>> +    bool can_use_context;
>> +
>>       /* Platform configuration */
>>       const struct vic_config *config;
>>   };
>> @@ -229,6 +231,7 @@ static int vic_load_firmware(struct vic *vic)
>>   {
>>       struct host1x_client *client = &vic->client.base;
>>       struct tegra_drm *tegra = vic->client.drm;
>> +    u32 fce_bin_data_offset;
>>       dma_addr_t iova;
>>       size_t size;
>>       void *virt;
>> @@ -277,6 +280,25 @@ static int vic_load_firmware(struct vic *vic)
>>           vic->falcon.firmware.phys = phys;
>>       }
>> +    /*
>> +     * Check if firmware is new enough to not require mapping firmware
>> +     * to data buffer domains.
>> +     */
>> +    fce_bin_data_offset = *(u32 *)(virt + VIC_UCODE_FCE_DATA_OFFSET);
>> +
>> +    if (!vic->config->supports_sid) {
>> +        vic->can_use_context = false;
>> +    } else if (fce_bin_data_offset != 0x0 && fce_bin_data_offset != 
>> 0xa5a5a5a5) {
>> +        /*
>> +         * Firmware will access FCE through STREAMID0, so context
>> +         * isolation cannot be used.
>> +         */
>> +        vic->can_use_context = false;
>> +        dev_warn_once(vic->dev, "context isolation disabled due to 
>> old firmware\n");
>> +    } else {
>> +        vic->can_use_context = true;
>> +    }
>> +
>>       return 0;
>>   cleanup:
>> @@ -358,10 +380,26 @@ static void vic_close_channel(struct 
>> tegra_drm_context *context)
>>       host1x_channel_put(context->channel);
>>   }
>> +static int vic_get_streamid_offset(struct tegra_drm_client *client)
>> +{
>> +    struct vic *vic = to_vic(client);
>> +    int err;
>> +
>> +    err = vic_load_firmware(vic);
>> +    if (err < 0)
>> +        return err;
>> +
>> +    if (vic->can_use_context)
>> +        return 0x30;
>> +    else
>> +        return -ENOTSUPP;
>> +}
>> +
>>   static const struct tegra_drm_client_ops vic_ops = {
>>       .open_channel = vic_open_channel,
>>       .close_channel = vic_close_channel,
>>       .submit = tegra_drm_submit,
>> +    .get_streamid_offset = vic_get_streamid_offset,
> 
> The patch order seems off here, since the .get_streamid_offset member 
> isn't defined yet.
> 
> Robin.

Indeed, will fix.

Thanks,
Mikko

> 
>>   };
>>   #define NVIDIA_TEGRA_124_VIC_FIRMWARE "nvidia/tegra124/vic03_ucode.bin"

