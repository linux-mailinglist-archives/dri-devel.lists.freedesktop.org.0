Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460E21DA224
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 22:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBA86E391;
	Tue, 19 May 2020 20:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BEB6E38A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 20:03:03 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec43b280001>; Tue, 19 May 2020 13:01:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 19 May 2020 13:03:03 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 19 May 2020 13:03:03 -0700
Received: from [10.2.90.179] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 May
 2020 20:03:02 +0000
Subject: Re: [PATCH] tee: convert convert get_user_pages() --> pin_user_pages()
To: LKML <linux-kernel@vger.kernel.org>
References: <20200519051850.2845561-1-jhubbard@nvidia.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <ad103c96-0b84-97cd-48eb-67f5e01e0349@nvidia.com>
Date: Tue, 19 May 2020 13:03:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519051850.2845561-1-jhubbard@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1589918504; bh=I+orG+7rEdCJPZjUgf5aOsrGlbkMUn9fDowKMSsoZ2g=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=OeA0URDdDEoYmrSyeZbmNSjYkOHX/p9wy63Apbm2XjDHgq3miJl/i0na08Vfn43RI
 YJi/E7JgJgoXCBwYik7RTdeSvY0bKSpoOinqqc+CK+NUow8VpXp3nz1wbytGFfkjN1
 /2PyM61mbRSTw5aBh2po+7pSRo9zdFS3H+0b+8b7EHERtfPNskX7FcDvsyA2sWwjHg
 jAor6efO7gcQ8b6mDVRwikI8RefZr+5pssUoEpJQ3UMBkBTqLknnxmMKSilKMNGQos
 Pj5dDsBREkofQTJtBKeQFyv7wSW2CWQi7c09i+a2cQ0twqJbn0N6hitYffyPmO4hRw
 XOflF6r7EqEXw==
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 tee-dev@lists.linaro.org, Jens Wiklander <jens.wiklander@linaro.org>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-18 22:18, John Hubbard wrote:
> This code was using get_user_pages*(), in a "Case 2" scenario
> (DMA/RDMA), using the categorization from [1]. That means that it's
> time to convert the get_user_pages*() + put_page() calls to
> pin_user_pages*() + unpin_user_pages() calls.
> 

Looks like I accidentally doubled a word on the subject line:
"convert convert". :)

I'd appreciate it a maintainer could remove one of those for
me, while applying the patch, assuming that we don't need a
v2 for other reasons.


thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
