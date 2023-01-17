Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3728466E0C8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 15:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7FC10E465;
	Tue, 17 Jan 2023 14:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E0F10E465;
 Tue, 17 Jan 2023 14:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3QfDwCtLh51/HmBdOrDTNlWrG1REaIyXbumFMViGP8A=; b=Vsiak0fKVLFW0eLysEgmVX2ugr
 fyKWMAEY468AP7Ecbyl5MvBbyq3qHSXqEzjQpwX79VNMBJkgkZeDe0VJaalpKx26gFKyqUKSycuIm
 bXxUQlHni5/s8PXvd4MkAEDImneeT17K3ybPMsPTwNS+dsFvzrjBHc79NHjgZP5hfjNKKLCQiHQUi
 l8dOquZ82RxdJcq5//HxphsKPltsUXkWOHkfrCCRpBgDpjaSSq6dNy1Ezz5yKh19g+s5uqTOP6QQV
 7JNYcOBnmkQwIfCrcRDRuDOkew11Y6i5PXi7SGsNWzJFpl3Zp0s8v44FMVcVoR15Ry8zrLCNB+UyC
 Darvyk0w==;
Received: from [187.56.70.205] (helo=[192.168.1.60])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pHn1i-00AgHC-G0; Tue, 17 Jan 2023 15:33:26 +0100
Message-ID: <16d17ee0-bda7-af95-b148-df5ce649336f@igalia.com>
Date: Tue, 17 Jan 2023 11:33:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] drm/amdgpu/vcn: Add parameter to force (en/dis)abling
 indirect SRAM mode
Content-Language: en-US
To: "Limonciello, Mario" <mario.limonciello@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, "Liu, Leo" <Leo.Liu@amd.com>
References: <20230116212004.860968-1-gpiccoli@igalia.com>
 <20230116212004.860968-3-gpiccoli@igalia.com>
 <CADnq5_Oh5Vdygo12evQKxw3w-ipRoQMvSNFHGcKtBNbSmtW7GQ@mail.gmail.com>
 <DM8PR12MB53991481A19B6AC8BA7A4E0AE5C19@DM8PR12MB5399.namprd12.prod.outlook.com>
 <b8a7253e-6902-e143-1bf2-ff107f25fd2b@igalia.com>
 <CADnq5_NJ7Kjoi7d+8bL2KNY3Leg8Jy7QL5reDS_dyEt7MUB0wA@mail.gmail.com>
 <a6680b24-372f-673c-4b3c-1fd3c309f242@igalia.com>
 <968afa8d-d402-311f-cf14-fd2dd27bf385@amd.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <968afa8d-d402-311f-cf14-fd2dd27bf385@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jiang,
 Sonny" <Sonny.Jiang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Pierre-Loup Griffais <pgriffais@valvesoftware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/01/2023 23:33, Limonciello, Mario wrote:
> [...]
> 
> For debugging these type of problems, I think an effective debugging 
> tactic would have been to mask the IP block (amdgpu.ip_block_mask).

Thank you, it worked indeed - nice suggestion!

Though I see two problems with that: first, I'm not sure what's the
impact in the GPU functioning when I disable some IP block.

Second, the parameter is a bit hard to figure - we need to clear a bit
for the IP block we want to disable, and the doc suggest to read on
dmesg to get this information (it seems it changes depending on the HW
model), but I couldn't parse the proper bit from dmesg. Needed to
instrument the kernel to find the proper bit heh

The second part is easy to improve (we can just show this bit in
dmesg!), I might do that instead of proposing this parameter, which
seems didn't raise much excitement after all heheh

Finally, I'm still curious on why Deck was working fine with the
indirect SRAM mode disabled (by mistake) in many kernels - was it in
practice the same as disabling the VCN IP block?

Thanks,


Guilherme

