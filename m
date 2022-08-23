Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABE859DABE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 12:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83D911B2CB;
	Tue, 23 Aug 2022 10:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 331D911A320
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 10:42:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60F04113E;
 Tue, 23 Aug 2022 03:42:44 -0700 (PDT)
Received: from [10.57.15.51] (unknown [10.57.15.51])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58A543F70D;
 Tue, 23 Aug 2022 03:42:39 -0700 (PDT)
Message-ID: <bbff1b5b-020c-7f61-1530-20fb0d6a1ef9@arm.com>
Date: Tue, 23 Aug 2022 11:42:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/panfrost: Update io-pgtable API
Content-Language: en-GB
To: Alyssa Rosenzweig <alyssa@collabora.com>
References: <daef7f8c134d989c55636a5790d8c0fcaca1bae3.1661205687.git.robin.murphy@arm.com>
 <YwRAnbNdx9nbGLom@maud>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <YwRAnbNdx9nbGLom@maud>
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
Cc: tomeu.vizoso@collabora.com, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-08-23 03:51, Alyssa Rosenzweig wrote:
>> -static size_t get_pgsize(u64 addr, size_t size)
>> +static size_t get_pgsize(u64 addr, size_t size, size_t *count)
>>   {
>> -	if (addr & (SZ_2M - 1) || size < SZ_2M)
>> -		return SZ_4K;
>> +	size_t blk_offset = -addr % SZ_2M;
> 
> addr is unsigned. if this is correct, it's magic.

Eh, it's just well-defined unsigned integer overflow. Take "SZ_2M - 
(addr % SZ_2M)", realise the first term can be anything that's zero 
modulo SZ_2M, including zero, then also that the operations can be done 
in either order to give the same result, and there you go.

Cheers,
Robin.
