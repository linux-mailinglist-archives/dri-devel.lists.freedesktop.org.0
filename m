Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03073759AB7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 18:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C51510E0E7;
	Wed, 19 Jul 2023 16:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE53C10E0E5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 16:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id BD03444CBC;
 Wed, 19 Jul 2023 18:25:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8N7FFal-Pa9X; Wed, 19 Jul 2023 18:25:48 +0200 (CEST)
Message-ID: <8601353f-cdb0-06f5-46ff-02aa68d1f8b1@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1689783948; bh=/I97QLzN5dJ3fVHuqD9Gd9O4d5+ZUmu3jfcbPr3MtQE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=PzgdAuGlHC2QYyFq/NEGq1zX3lJYg4EAjOCZ+pDYMUhfFnhRpIUDm/2SSNCvOo34c
 PQ0q1c6swLnwrvroxCEXnm+E2khw7ds0mSfs2E5x327zrAg9A6E5Fml3d2mCwxNKBc
 ofsHILZxkv0/QoSJ5wCJnDEzGwcFmLCYvBufzl3FZYHRZP/4bad386Q4c41Q/sq0Rx
 nzrlAQ42l1naVi7F6B569SH9YP2yMLEV4EIkQMiXTj9QN9iDuvDWskBAC1FJXdtB4D
 Oke9j1tN+FK7KleDf5mny6Uz2nWM4wCtqggedcjHEUZXeONEPkB5TYIupd0ZiNUEUC
 SYEVXwFpu6zGA==
Date: Wed, 19 Jul 2023 13:24:24 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/4] drm/tests: Add test for
 drm_framebuffer_check_src_coords()
Content-Language: pt-BR, en-US
To: Maxime Ripard <mripard@kernel.org>
References: <20230718181726.3799-1-gcarlos@disroot.org>
 <20230718181726.3799-3-gcarlos@disroot.org>
 <4tsh53x6qrbgjdbx46cwiwoltcdlrd4hpuxba7kw4graqlauyr@7pkedsasswff>
From: Carlos <gcarlos@disroot.org>
In-Reply-To: <4tsh53x6qrbgjdbx46cwiwoltcdlrd4hpuxba7kw4graqlauyr@7pkedsasswff>
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
Cc: andrealmeid@igalia.com, tzimmermann@suse.de, tales.aparecida@gmail.com,
 dri-devel@lists.freedesktop.org, mairacanal@riseup.net, davidgow@google.com,
 michal.winiarski@intel.com, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime, thanks for the reviews!

On 7/19/23 04:49, Maxime Ripard wrote:
> Hi,
>
> On Tue, Jul 18, 2023 at 03:17:24PM -0300, Carlos Eduardo Gallo Filho wrote:
>> Add a parametrized test for the drm_framebuffer_check_src_coords function.
>>
>> Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
>> ---
>>   drivers/gpu/drm/tests/drm_framebuffer_test.c | 126 +++++++++++++++++++
>>   1 file changed, 126 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
>> index f759d9f3b76e..ee92120cd8e9 100644
>> --- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
>> +++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
>> @@ -9,6 +9,7 @@
>>   
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_mode.h>
>> +#include <drm/drm_framebuffer.h>
>>   #include <drm/drm_fourcc.h>
>>   #include <drm/drm_print.h>
>>   
>> @@ -366,7 +367,132 @@ static void drm_framebuffer_test_to_desc(const struct drm_framebuffer_test *t, c
>>   KUNIT_ARRAY_PARAM(drm_framebuffer_create, drm_framebuffer_create_cases,
>>   		  drm_framebuffer_test_to_desc);
>>   
>> +/* Parameters for testing drm_framebuffer_check_src_coords function */
>> +struct check_src_coords_case {
>> +	const char *name; /* Description of the parameter case */
>> +	const int expect; /* Expected returned value by the function */
>> +
>> +	/* All function args */
>> +	const uint32_t src_x;
>> +	const uint32_t src_y;
>> +	const uint32_t src_w;
>> +	const uint32_t src_h;
>> +	const struct drm_framebuffer fb;
>> +};
>> +
>> +static const struct check_src_coords_case check_src_coords_cases[] = {
>> +	/* Regular case where the source just fit in the framebuffer */
>> +	{ .name = "source inside framebuffer with normal sizes and coordinates",
>> +	  .expect = 0,
>> +	  .src_x = 500 << 16, .src_y = 700 << 16,
>> +	  .src_w = 100 << 16, .src_h = 100 << 16,
> I don't think we need to duplicate the << 16 everywhere, this can be
> added by the test function.
>
> Maxime
I thought about it, but there's some cases where we have some values 
composed
by both a shifted part and a regular one, like ".src_x = (600 << 16) + 
1". If we
left to shift everything on the test function we won't be able to have 
this kind
of values, which would compromise the test. Or if we just put off the 
regular part,
we will deal with a test that won't cover the out-of-bound cases at the 
subpixel
level.

Of course this could be implemented by adding some new members to the 
case struct,
being each src_{x,y,w,h} composed by two, where one is always shifted, 
though I
guess it would be way worse than having the shifts everywhere on the 
cases array.

I'll be happy to know about if you have some suggestion of how it can 
implemented
without throwing away the non-shifted part!

Thanks,
Carlos

