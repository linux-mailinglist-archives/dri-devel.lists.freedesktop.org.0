Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5A46F912B
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 12:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A4110E242;
	Sat,  6 May 2023 10:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276CE10E07F;
 Fri,  5 May 2023 18:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1683311985; bh=zsnURW15P7s6GnabIXy44PA73DsAlQFOM8SIQz/L23I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fL3l6Vq/JlKVU4Chwac0HCvWuRVVD4nJXwhltR7412E5RmFk3bNjMxfKEMmCdEVQl
 ssByfC2sH+JiBO+07ZhJxmgvwcPpXljtpdizIE7am1E4abRwfE3dLxB/8jEArhh+tj
 09MkSRRyxMbmdOyWITtwxSIDv754EhEw+F+fbwq0=
Received: from [192.168.9.172] (unknown [101.228.138.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 3D04E60106;
 Sat,  6 May 2023 02:39:45 +0800 (CST)
Message-ID: <fcdd2774-f8ab-9e5d-6274-d9d326cb6fbb@xen0n.name>
Date: Sat, 6 May 2023 02:39:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH V2] drm/amdgpu/display: Enable DC_FP for LoongArch
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
References: <20230505113233.3813801-1-chenhuacai@loongson.cn>
 <c4146636-2321-b271-b480-b8693169c119@amd.com>
 <70129238-a589-1d70-a7f2-50a35b4ee897@xen0n.name>
 <CADnq5_N+G5M6OkT-exM_Bot7OXPopVax5hyLERoTRb70ns8v0w@mail.gmail.com>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <CADnq5_N+G5M6OkT-exM_Bot7OXPopVax5hyLERoTRb70ns8v0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 May 2023 10:33:25 +0000
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
Cc: Pan@freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 amd-gfx@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xuefeng Li <lixuefeng@loongson.cn>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/6/23 02:00, Alex Deucher wrote:
> On Fri, May 5, 2023 at 1:57 PM WANG Xuerui <kernel@xen0n.name> wrote:
>> <snip>
>> On a side note, I had to modprobe amdgpu with runpm=0, otherwise my
>> dmesg gets flooded with PSP getting resumed every 8~10 seconds or so. I
>> currently have none of the connectors plugged in. I didn't notice any
>> similar reports on the Internet so I don't know if it's due to platform
>> quirks or not.
> That might just be part of the normal suspend/resume process.  If it
> happens at regular intervals, it sounds like something is waking the
> GPU at a regular interval.  We should probably remove that message to
> avoid it being too chatty, but you may want to check what is waking it
> so much as doing so sort of negates the value of runtime power
> management.

Ah. This is extremely helpful as I'm immediately able to confirm it's 
node_exporter trying to access the hwmon readings (I have a monitoring 
infra for all my devboxes). Every sufficiently spaced read from say 
temp1_input wakes up the GPU. Not many people have their boxes working 
like this I guess... but at least we could probably reduce the log spam 
a bit if it's not feasible to get GPU metrics while avoiding to resume 
it? (Currently it's 25 lines per resume, mostly SMU resume logs and ring 
info.)

And of course this is not a big deal, I can always work around it 
locally. Thanks for the hint again.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

