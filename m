Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80674BF38D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 09:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B291110F4B7;
	Tue, 22 Feb 2022 08:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A547210F4BD
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 08:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zfYHUsgUj9bMp9XYzGWc9eCMGjpGs1SMSVRvMazWtpo=; b=QHyYx+SEEBJQcikLDxVb11HMI/
 2DeGvHzOW+RxzucK9R5fB+ys4CS7odv616RThf4BocUwCSEmx+Lgo8ekre1mE+DOGH5lndthE7cuF
 LJgPVhqRqWgWCAwG2TShhc4y5cDEJ63yjNi8IHNyaSJLrMcgUDNYKl7HJyGUK2qTaSkzVh4tyafcG
 tX4n0/urq6mUwVFF5eL9hyy7tytH9AsCsf4Fic8G6mLH/0FQc9k8/jPHwKQCHQ+f9xZty259++SHc
 THiCCaySgOh3OTTdIV5o2RXnNsbn/dhsifKpI422xSjAbDXK5+DFwC3r7RAsQ7fYFLz9LiuepQ1Sf
 AEBNkh5g==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1nMQVk-0003Nm-2i; Tue, 22 Feb 2022 10:27:04 +0200
Message-ID: <30033f5b-3fd1-22c7-896b-af034a4041df@kapsi.fi>
Date: Tue, 22 Feb 2022 10:27:03 +0200
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
 <5d1b6e82-2c9d-8388-697f-0d7305a1206f@kapsi.fi>
 <ee648994-b296-2ac4-a676-ddcac463a428@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <ee648994-b296-2ac4-a676-ddcac463a428@gmail.com>
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

On 2/21/22 22:10, Dmitry Osipenko wrote:
> 21.02.2022 14:44, Mikko Perttunen пишет:
>> On 2/19/22 20:54, Dmitry Osipenko wrote:
>>> 19.02.2022 21:49, Dmitry Osipenko пишет:
>>>> 18.02.2022 14:39, Mikko Perttunen пишет:
>>>>> +static int vic_get_streamid_offset(struct tegra_drm_client *client)
>>>>> +{
>>>>> +    struct vic *vic = to_vic(client);
>>>>> +    int err;
>>>>> +
>>>>> +    err = vic_load_firmware(vic);
>>>>
>>>> You can't invoke vic_load_firmware() while RPM is suspended. Either
>>>> replace this with RPM get/put or do something else.
>>
>> Why not, I'm not seeing any HW accesses in vic_load_firmware? Although
>> it looks like it might race with the vic_load_firmware call in
>> vic_runtime_resume which probably needs to be fixed.
> 
> It was not clear from the function's name that h/w is untouched, I read
> "load" as "upload" and then looked at vic_runtime_resume(). I'd rename
> vic_load_firmware() to vic_prepare_firmware_image().
> 
> And yes, technically lock is needed.

Yep, I'll consider renaming it.

Mikko
