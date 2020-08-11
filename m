Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C112425D5
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 09:05:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6939A6E8B9;
	Wed, 12 Aug 2020 07:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E683F6E850
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 21:21:26 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f330bc90000>; Tue, 11 Aug 2020 14:21:13 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 11 Aug 2020 14:21:26 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 11 Aug 2020 14:21:26 -0700
Received: from [172.20.40.66] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 11 Aug
 2020 21:21:25 +0000
Subject: Re: [PATCH v3] platform/x86: Add new vga-switcheroo gmux driver for
 ACPI-driven muxes
To: Lukas Wunner <lukas@wunner.de>
References: <0850ac9a-3d60-053d-1d70-5f20ce621b24@nvidia.com>
 <20200729210557.9195-1-ddadap@nvidia.com>
 <20200810083757.2jbwebbvocqe5rle@wunner.de>
 <c7b1b098-a0ef-6e78-92c1-32da9b4ea3f3@nvidia.com>
 <20200811034301.nlhue4xgfv4p3utr@wunner.de>
From: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <c7dcb052-0ccf-dae3-49dd-1518f5ab182e@nvidia.com>
Date: Tue, 11 Aug 2020 16:22:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200811034301.nlhue4xgfv4p3utr@wunner.de>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1597180873; bh=R2i9R+envwB1tq+uKoKa3kcK4HJWK1Npmh4i7DeM6e0=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=FayKKNJP9hXS6Z8PTFlWtbm0Fs7Hm30fTZ9PmJNRroiWPH7fdMpF5pScO0iL2+j4y
 z0Gbe9MCB9/krKw7/A++bd9F8KfvECzA3L0hiCFU2CuuXf58b7zif96wrxh0VhxWF/
 FyX7+76b2pNcO7lgSdLeUniKcg1fepGlcgWFA8fdCygvLV9qe8aLeS9o5ZL/YnGaCU
 2nqEYjF8yFQm0fvFilXE8wQSyRwSXRyOvoEAWrWB2XFuy0ULEsu4+Y+JVYm+7j+7zf
 wpXmJscyulFPYo9SuXq4fmshuPeT0WiQCc6e6umTFNA/d9ub6aC3XJxpjr6iPbMQgC
 aolV9yVO6l+tg==
X-Mailman-Approved-At: Wed, 12 Aug 2020 07:05:21 +0000
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
Cc: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 pobrn@protonmail.com, peter@lekensteyn.nl, dvhart@infradead.org,
 andy@infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/10/20 10:43 PM, Lukas Wunner wrote:
> On Mon, Aug 10, 2020 at 01:44:58PM -0500, Daniel Dadap wrote:
>
>> Would it be clearer to write it out as something like 0 << 4 & 1 << 0 for
>> MUX_STATE_SET_IGPU and 1 << 4 & 1 << 0 for MUX_STATE_SET_DGPU?
> BIT(4) | BIT(0) might be clearer, but that gives you an unsigned long
> and I'm not sure if gcc accepts that as an enum (=int) initializer.


Ah yes, I forgot the BIT() macro. And it does seem to work just fine for 
initializing enum values, and there does seem to be precedent in other 
code in the kernel for doing so. And of course I meant | instead of & 
earlier. :)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
