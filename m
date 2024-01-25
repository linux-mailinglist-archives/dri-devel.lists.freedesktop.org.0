Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A2883BF11
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 11:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C7C10F88F;
	Thu, 25 Jan 2024 10:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC5510F88F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 10:39:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 84EE7CE3234;
 Thu, 25 Jan 2024 10:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E34C433F1;
 Thu, 25 Jan 2024 10:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706179108;
 bh=N1jVOSNlM0yJonXxmcq0nNV6L21AE9zFYCH/FyRsngg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jPmG+InE//r1LeUk0J19ONKWSo9DOVR9btHeiHWdm3aMkvVl5kYe1wSfLMkLgB+8k
 J6GpV7LFkvD2lQD7w6N6vZjhDybYSIGzUVjwg3EL64pXBiHDsVNWL5jX5/Vb4g3D7L
 CJr+NylKuGWziuoVs32/vABe0pbA4eqLiuyA5QEutf0P7sw7QANYRLxo0kKT28YnzV
 6sR5w7oDg7oK+gqAM2xRY5plyMojpzN5QDkXwUMn9RdIb2zIlml/qUg83kBc5ggitG
 gQOoqD3g2PWnUKvqFXaU532MdiAVFsEMkYpo11K5jJp49QqwVeROhI0J4Cyft0rzWd
 K/KI/oDQki59w==
Message-ID: <c83b757c-5cb6-4dbb-a513-754a7cda0ca5@kernel.org>
Date: Thu, 25 Jan 2024 12:38:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/habanalabs: use kcalloc() instead of kzalloc()
Content-Language: en-US
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Erick Archer <erick.archer@gmx.com>, Marco Pagani <marpagan@redhat.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <20240120151028.11092-1-erick.archer@gmx.com>
 <91e87233-3a10-43d6-b850-9cac083913e0@embeddedor.com>
From: Oded Gabbay <ogabbay@kernel.org>
In-Reply-To: <91e87233-3a10-43d6-b850-9cac083913e0@embeddedor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/01/2024 18:45, Gustavo A. R. Silva wrote:
> 
> 
> On 1/20/24 09:10, Erick Archer wrote:
>> As noted in the "Deprecated Interfaces, Language Features, Attributes,
>> and Conventions" documentation [1], size calculations (especially
>> multiplication) should not be performed in memory allocator (or similar)
>> function arguments due to the risk of them overflowing. This could lead
>> to values wrapping around and a smaller allocation being made than the
>> caller was expecting. Using those allocations could lead to linear
>> overflows of heap memory and other misbehaviors.
>>
>> So, use the purpose specific kcalloc() function instead of the argument
>> size * count in the kzalloc() function.
>>
>> Link: 
>> https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
>> Link: https://github.com/KSPP/linux/issues/162
>>
>> Signed-off-by: Erick Archer <erick.archer@gmx.com>
> 
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Thanks!
Applied to -next.
Thanks,
Oded
