Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B122F74FDF7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 05:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AA110E48B;
	Wed, 12 Jul 2023 03:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAB410E48B;
 Wed, 12 Jul 2023 03:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=vhbVcfMKPrLrsHtGRck5zDkPlc+WWbTuWV1q+FmP9WE=; b=FSxLoc66Nj5DiR7dt34uSHbc7k
 LX2WRfxF0zgX/LLGETmLjNk9tVRSu3aNGUdhoAisWJHyCJnkgbxsxNL1X9KCwFmwLmfTjT0Bg7Yjs
 OSgzQZEGldVCQN8S7OkzFQMnMwgZUvhSse8wM+qPiM1xjJdb5vPYhSPB6nwcai4lvBNR+m75Ofuby
 0riHG4Pez2LrBscCC1RuAICmB/mqAYyIm8lAwY5f7CBLgbwx6pVEW4tJCfZfK39M5lmD+sdssTRFp
 QRg5TvZsLyEr1iIhtYKoDwE9kOjMYYGuLu+bCz3qjDmQqhh71vIB/RYXBiW8ygKrGtQ04xKspgdVw
 TmiekADw==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qJQn1-00GQ2y-0N; Wed, 12 Jul 2023 03:45:19 +0000
Message-ID: <58cafdc0-0209-cfdd-c8e0-2dd25d73a184@infradead.org>
Date: Tue, 11 Jul 2023 20:45:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: scripts/kernel-doc does not handle duplicate struct & function
 names (e.g., in amdgpu)
Content-Language: en-US
To: Akira Yokosawa <akiyks@gmail.com>
References: <b5ebc891-ee63-1638-0377-7b512d34b823@infradead.org>
 <0475d177-4c01-0988-0b34-3099dd703498@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <0475d177-4c01-0988-0b34-3099dd703498@gmail.com>
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
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/11/23 20:32, Akira Yokosawa wrote:
> Hi Randy,
> 
>> [just documenting this for posterity or in case someone wants to fix it.]
>>
>> In drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c, one can find both
>>
>> struct amdgpu_vm_tlb_seq_cb {...};
>>
>> and
>> static void amdgpu_vm_tlb_seq_cb(...)
>>
>> Of course C has no problem with this, but kernel-doc reports:
>>
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:833: WARNING: Duplicate C declaration, also defined at gpu/amdgpu/driver-core:115.
>>
>> And of course, if the name of one of them is changed, kernel-doc is all happy...
>> not that I am suggesting that one of them should be changed.
>>
>> I just want to make people aware of this. (or maybe people are already aware of this?)
> 
> The duplicate warning is emitted from Sphinx, not kernel-doc.
> 
> This is a bug of Sphinx >=3.1, first reported by Mauro back in September 2020 at:
> 
>     https://github.com/sphinx-doc/sphinx/issues/8241
> 
> It was closed when a local fix was presented.  Unfortunately, it was not
> merged at the time and a subsequent pull request was opened at:
> 
>     https://github.com/sphinx-doc/sphinx/pull/8313
> 
> It is not merged yet and carries a milestone of Sphinx 7.x.
> 
> Looks like we need to wait patiently.
> 
>         Thanks, Akira

Ooooh, thanks for your assistance.  Waiting.... :)

-- 
~Randy
