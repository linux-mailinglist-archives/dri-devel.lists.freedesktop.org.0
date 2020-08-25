Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB75E2514A7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 10:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D384C6E88D;
	Tue, 25 Aug 2020 08:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920286E88D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 08:54:09 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f44d1a20000>; Tue, 25 Aug 2020 01:53:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 25 Aug 2020 01:54:08 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 25 Aug 2020 01:54:08 -0700
Received: from [10.2.53.36] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Aug
 2020 08:54:08 +0000
Subject: Re: [PATCH v3] tee: convert convert get_user_pages() -->
 pin_user_pages()
To: Jens Wiklander <jens.wiklander@linaro.org>
References: <CAHUa44FrxidzSUOM_JchOTa5pF6P+j8uZJA5DpKfGLWaS6tCcw@mail.gmail.com>
 <20200824211125.1867329-1-jhubbard@nvidia.com>
 <20200825083204.GA2068961@jade>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <1f111bb4-6e93-93d5-66ff-b9d4d456140f@nvidia.com>
Date: Tue, 25 Aug 2020 01:54:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825083204.GA2068961@jade>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1598345634; bh=MtrTtR7W0MYZILUrm95xWM9cnaEcReiy2mPIlaOwxxc=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=l4uR4VK0PiJo5w0LLlk1qyx38HDxhUpGAbiDVLTQSDSZvzqgAuWEGYdtIsFkXSxdz
 yRBUk/5DowXI23mfcBla6xZ9Vp6nBnk/JXDMZwa+y2CCi89SiTVFBx+dvvw6fcBIuO
 H5hho5wMVNMq6Sa5S9drrs9yGhynhzZ8LpRvW737V/8kPSs94U23VsQ8108MhFi96v
 s5Q21rxNTTFMA5jV0uh4MouuV/6NNF3/XK2egERx81KLcb787KwisqLdKs0QJXFEqm
 p6W7UwmAvkrKgMW08nzZITEfncUx95cC0WalvQ7atCLVmsMYh2iVzbISbsTCGd4Dcv
 j9bg78W4DcbHA==
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tee-dev@lists.linaro.org, soc@kernel.org,
 arm@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/25/20 1:32 AM, Jens Wiklander wrote:
> On Mon, Aug 24, 2020 at 02:11:25PM -0700, John Hubbard wrote:
...
>> OK, one more try, this time actually handling the _USER_MAPPED vs.
>> _KERNEL_MAPPED pages!
>>
>> thanks,
>> John Hubbard
>> NVIDIA
> 
> Looks good and it works too! :-) I've tested it on my Hikey board with
> the OP-TEE test suite.
> I'm picking this up.
> 

Great! I see that I have, once again, somehow doubled up on the subject line:
"tee: convert convert ...". This particular typo just seems to stick to me. :)

If you get a chance to fix that up by changing it to just a single "convert"
I'd appreciate it.

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
