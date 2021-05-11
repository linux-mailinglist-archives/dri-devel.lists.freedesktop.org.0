Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C757637A121
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 09:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B184B6E9E4;
	Tue, 11 May 2021 07:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DEA6E9E1;
 Tue, 11 May 2021 07:47:39 +0000 (UTC)
Received: from [192.168.1.190] (unknown [91.155.165.229])
 (Authenticated sender: martin.peres@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id DA6B15FFD6;
 Tue, 11 May 2021 09:47:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1620719256;
 bh=L/SC9UgcswCPiqwyylKjzVrzqsffsAgm9Kh+PseelWk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gDTC/pPle60F5aFILvsj9AxKC2S/HAAeVcGUzbfeN72f5Fv9ab5CULX4N9HlweJ6R
 DSLvcrcZm6wlSy/H8fJ3j/jH+aD7MUozlUZdyzVxj7EBz+DjgV8sdy0kwaGBx1+fHE
 mTFNU+v5NFzGMoFvAtpldmW+qOjAPu2ScXf/FR3Qr+NbcfJ7Z403JbBokncvU0kykX
 h0rHZSbR8Cm2bZH2BfG+WOrWD8QGYdspXCQp3WCcBpCGS+ibK3V3CuHoV2k+cAkqOt
 D8M165n2bpOrdV96fCi/DrV7ajti3wSa4Ah4sTlc3pUoGemp0ZMT0IaXUuWht5ZgaM
 IfhcqRziaHbcA==
Subject: Re: [RFC PATCH 00/97] Basic GuC submission support in the i915
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <d22437bd-8bb6-d7cb-c017-89cdc7da560d@free.fr>
 <17953669798.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <878s4mvuww.wl-ashutosh.dixit@intel.com>
From: Martin Peres <martin.peres@free.fr>
Message-ID: <fba247b5-0835-016f-2b13-ad87c97cc3c4@free.fr>
Date: Tue, 11 May 2021 10:47:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <878s4mvuww.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Matthew Brost <matthew.brost@intel.com>, tvrtko.ursulin@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jason.ekstrand@intel.com, daniele.ceraolospurio@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/05/2021 05:58, Dixit, Ashutosh wrote:
> On Sun, 09 May 2021 16:11:43 -0700, Jason Ekstrand wrote:
>>
>> Yes, landing GuC support may be the first step in removing execlist
>> support. The inevitable reality is that GPU scheduling is coming and
>> likely to be there only path in the not-too-distant future.  (See also
>> the ongoing thread with AMD about fences.) I'm not going to pass
>> judgement on whether or not this is a good thing.  I'm just reading the
>> winds and, in my view, this is where things are headed for good or ill.
>>
>> In answer to the question above, the answer to "what do we gain from
>> GuC?" may soon be, "you get to use your GPU."  We're not there yet and,
>> again, I'm not necessarily advocating for it, but that is likely where
>> things are headed.
>>
>> A firmware-based submission model isn't a bad design IMO and, aside from
>> the firmware freedom issues, I think there are actual advantages to the
>> model. Immediately, it'll unlock a few features like parallel submission
>> (more on that in a bit) and long-running compute because they're
>> implemented in GuC and the work to implement them properly in the
>> execlist scheduler is highly non-trivial.  Longer term, it may (no
>> guarantees) unlock some performance by getting the kernel out of the way.
> 
> I believe another main reason for GuC is support for HW based
> virtualization like SRIOV. The only way to support SRIOV with execlists
> would be to statically partition the GPU between VM's, any dynamic
> partitioning needs something in HW.
> 

FW-based command-submission is indeed a win for SRIOV and the current HW 
architecture.

Thanks for chiming in!
Martin
