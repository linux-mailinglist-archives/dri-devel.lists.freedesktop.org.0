Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFB4193226
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 21:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7802B6E827;
	Wed, 25 Mar 2020 20:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFF96E827
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 20:48:32 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e7bc3920000>; Wed, 25 Mar 2020 13:48:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 25 Mar 2020 13:48:32 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 25 Mar 2020 13:48:32 -0700
Received: from [10.26.72.231] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Mar
 2020 20:48:31 +0000
Subject: Re: [PATCH 2/2] gpu: host1x: Use SMMU on Tegra124 and Tegra210
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200325201604.833898-1-thierry.reding@gmail.com>
 <20200325201604.833898-2-thierry.reding@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c359bfdb-de7e-6c82-9a78-bd0ec4449172@nvidia.com>
Date: Wed, 25 Mar 2020 20:48:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200325201604.833898-2-thierry.reding@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1585169298; bh=nBGOaR7If9Bn7YgqQ050D8eG5NPGJikL7u6AsNJzHB8=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=HYj+GP9mNAZMMCkf9YIendDldsmhH07AIr86eLhF7Lhvrqlt5XpYzES3q8GcaNfMf
 8DLmRocGS+rd9gITebUgv5WNbCBDo3bjYOZoxTjDZjHcnkIRHSQ588NDAbVlMduTGS
 /nDmp4a8HdYcrRMHevqjgG60wmviimg2pdD1+eQ0eS16gQRgvuh3fLDbzK1s5n6/8I
 1acKyb2jPQfVBUXSjuSQi3C5Q9Qpk63rZtq/Wd+JjJRhM+ACzdJPCrIwxfiWd0Hyzp
 UDSjpzF8rdonePRG6KzVc2V22jOrcH5hAce79Xltpth0PBk9/YIkOH4UvfzlFlrN11
 cArgjLnpAaeBw==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/03/2020 20:16, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra124 and Tegra210 support addressing more than 32 bits of physical
> memory. However, since their host1x does not support the wide GATHER
> opcode, they should use the SMMU if at all possible to ensure that all
> the system memory can be used for command buffers, irrespective of
> whether or not the host1x firewall is enabled.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/host1x/dev.c | 46 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 42 insertions(+), 4 deletions(-)

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
