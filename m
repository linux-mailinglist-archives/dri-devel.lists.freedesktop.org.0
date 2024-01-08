Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA92827832
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 20:11:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E841910E291;
	Mon,  8 Jan 2024 19:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0F910E132
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 19:11:14 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4T83ZB0qJ2z9wqT;
 Mon,  8 Jan 2024 19:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1704741074; bh=BcZ3KVI53mstXqau6zectZz4RnmhY47xgMYJZN+ZIaQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=infJdD5p34mA9gKPvJptIjOzdbIfe9Hujjif438x1zRpCeP2wBWmtoAcqAHAmtZRD
 9w7Xqc0zwSdpzlxCEYwJiFccWwGGOCclyO+ECrxq5anWS21fevSpvMz4Z/uAOFq2ul
 7NNQLRs3Jt4dioKbYJv71J5E6QFXSAsWijtNImf4=
X-Riseup-User-ID: 7573B3426939D883A3225FA69B0B75C911D2C11A815A2296FDD774F32314207C
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4T83Z46ZlrzFrsD;
 Mon,  8 Jan 2024 19:11:08 +0000 (UTC)
Message-ID: <2737e91a-27dd-4c43-a678-47e041c42559@riseup.net>
Date: Mon, 8 Jan 2024 16:11:05 -0300
MIME-Version: 1.0
Subject: Re: [PATCH 7/7] drm/vkms: Create KUnit tests for YUV conversions
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>
References: <20240105-vkms-yuv-v1-0-34c4cd3455e0@riseup.net>
 <20240105-vkms-yuv-v1-7-34c4cd3455e0@riseup.net>
 <5z66ivuhfrzrnuzt6lwjfm5fuozxlgqsco3qb5rfzyf6mil5ms@2svqtlcncyjj>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <5z66ivuhfrzrnuzt6lwjfm5fuozxlgqsco3qb5rfzyf6mil5ms@2svqtlcncyjj>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/01/24 07:15, Maxime Ripard wrote:
> Hi Arthur,
> 
> On Fri, Jan 05, 2024 at 01:35:08PM -0300, Arthur Grillo wrote:
>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
>> index b654b6661a20..11df990a0fa9 100644
>> --- a/drivers/gpu/drm/vkms/vkms_formats.c
>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
>> @@ -440,3 +440,7 @@ void *get_pixel_write_function(u32 format)
>>  		return NULL;
>>  	}
>>  }
>> +
>> +#ifdef CONFIG_DRM_VKMS_KUNIT_TESTS
>> +#include "tests/vkms_format_test.c"
>> +#endif
> 
> I assume this is due to testing a static function?

Yeah, you're right.

> 
> If so, the preferred way nowadays is to use EXPORT_SYMBOL_IF_KUNIT or
> EXPORT_SYMBOL_FOR_TESTS_ONLY if it's DRM/KMS only.

Oh, I didn't know about that. I think I will use EXPORT_SYMBOL_IF_KUNIT
as you can use VISIBLE_IF_KUNIT to maintain the function static if the
test is not used.

~Arthur Grillo
> 
> Maxime
