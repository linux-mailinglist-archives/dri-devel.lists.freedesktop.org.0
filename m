Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB54C4BD97D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 12:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4856010E19E;
	Mon, 21 Feb 2022 11:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B5210E19E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 11:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1NO9ODjqcIpFwr4c+SwXrmtjZPwEE+Ho+Rm0iiAPZyk=; b=ltlJ6oqpzZfDZZpM5E7jwuYZYf
 LKiDxa/KysRWN/yC3XV7t7SitKMQav4x0qO1o2l8kSprsgH6uINegAmPkius7bdHj7KdhmZDFs1Oy
 vhgS4ZQPTX4aIo5snwtlgLJDeK8HIKg1HSmupKaUjCEsJnY6Ycmqua69rHfV3DpT+wfDZfEE5UT4u
 2Ldu99oOnoZGcCuZf4pL/Pq3NYuFJQcjGdOASfTw1Fa1c6LpnWdZRAhzYQFrybMVRcvlskFF47ka3
 0BC3ydM6R61myM7Hl9uU8MA6hAmv9Rd2ssw1DibR7BjdRnKyC8vQ5oKyrwzjroyUYsO/ta3aQEWCk
 6Lw+KhBA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1nM77D-0004LU-51; Mon, 21 Feb 2022 13:44:27 +0200
Message-ID: <5d1b6e82-2c9d-8388-697f-0d7305a1206f@kapsi.fi>
Date: Mon, 21 Feb 2022 13:44:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v3 8/9] drm/tegra: vic: Implement get_streamid_offset
Content-Language: en-US
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 robin.murphy@arm.com
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-9-mperttunen@nvidia.com>
 <b1df816b-6838-c435-1a23-5029144e4cfe@gmail.com>
 <7f4e4c47-59f1-1def-36bf-a2ded912f76d@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <7f4e4c47-59f1-1def-36bf-a2ded912f76d@gmail.com>
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

On 2/19/22 20:54, Dmitry Osipenko wrote:
> 19.02.2022 21:49, Dmitry Osipenko пишет:
>> 18.02.2022 14:39, Mikko Perttunen пишет:
>>> +static int vic_get_streamid_offset(struct tegra_drm_client *client)
>>> +{
>>> +	struct vic *vic = to_vic(client);
>>> +	int err;
>>> +
>>> +	err = vic_load_firmware(vic);
>>
>> You can't invoke vic_load_firmware() while RPM is suspended. Either
>> replace this with RPM get/put or do something else.

Why not, I'm not seeing any HW accesses in vic_load_firmware? Although 
it looks like it might race with the vic_load_firmware call in 
vic_runtime_resume which probably needs to be fixed.

>>
>>> +	if (err < 0)
>>> +		return err;
>>> +
>>> +	if (vic->can_use_context)
>>> +		return 0x30;
>>> +	else
>>> +		return -ENOTSUPP;
>>
>> If (!vic->can_use_context)
>> 	return -ENOTSUPP;
>>
>> return 0x30;
> 
> and s/ENOTSUPP/EOPNOTSUPP/

Ok.

Mikko
