Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 710F3571726
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 12:20:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044869425F;
	Tue, 12 Jul 2022 10:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0323E94269
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 10:20:53 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Lhxbh2QBXz9sSC;
 Tue, 12 Jul 2022 12:20:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1657621248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ue0scyE2FAa1RSsDNujYmZNnGu+V4YRFf7cCzl7/zzk=;
 b=YQXIHpjyB7kzYDpiMcYhQeEzeR0H1FLAWoiOgIrZ/lXCljWfE5HdYIWhvIUmFKAt3msmmD
 roQCy2s8jSYlQ5R5v5Tgx9PZienhWcKqlQIPamnwNi0eZnR2sNpPtbp1L9YyvIAscWHtv2
 Ly6CSF6oAVP/mb6R0pXz5G+GZDToRqXs1eWKIvie03h2UVCH1fERb6DPUvOR5qBZE7KyVw
 rVJ8Kdst1aXBW6Zehcr//kwSO41VZuzC5oMX+L4mIHmg109YkhZXL8hUkYfiWiHXLzBdeP
 iwvc8EqAAwW5VRtBCJwNeTBLEw42FYyp612jnSlCy1Qo9ifA2GNtORMH1ydZ7Q==
Message-ID: <1b2188ee-7ade-a06a-c08f-fc2c96568be5@mailbox.org>
Date: Tue, 12 Jul 2022 12:20:46 +0200
MIME-Version: 1.0
Subject: Re: [PATCH libdrm v2 04/10] util: Add missing big-endian RGB16 frame
 buffer formats
Content-Language: en-CA
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <cover.1657302103.git.geert@linux-m68k.org>
 <a89f148bf61bc20a7bb9c0e8ba030b0b770f9fe2.1657302103.git.geert@linux-m68k.org>
 <YswUwWO8GZfBZhsj@intel.com>
 <CAMuHMdVar28SbFvoS0oizNySOpwVYi42mchrvBQqtVm7S3SFww@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CAMuHMdVar28SbFvoS0oizNySOpwVYi42mchrvBQqtVm7S3SFww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 861ff1d9d82cb149f6a
X-MBO-RS-META: prn8exw79argfdicfrdu3wb5kz48cpwk
X-Rspamd-Queue-Id: 4Lhxbh2QBXz9sSC
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-07-11 14:34, Geert Uytterhoeven wrote:
> Hi Ville,
> 
> On Mon, Jul 11, 2022 at 2:17 PM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
>> On Fri, Jul 08, 2022 at 08:21:43PM +0200, Geert Uytterhoeven wrote:
>>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>> ---
>>> Any better suggestion than appending "be"?
>>>
>>> v2:
>>>   - New.
> 
>>> --- a/tests/util/format.c
>>> +++ b/tests/util/format.c
>>> @@ -76,6 +76,9 @@ static const struct util_format_info format_info[] = {
>>>       { DRM_FORMAT_BGRX5551, "BX15", MAKE_RGB_INFO(5, 1, 5, 6, 5, 11, 0, 0) },
>>>       { DRM_FORMAT_RGB565, "RG16", MAKE_RGB_INFO(5, 11, 6, 5, 5, 0, 0, 0) },
>>>       { DRM_FORMAT_BGR565, "BG16", MAKE_RGB_INFO(5, 0, 6, 5, 5, 11, 0, 0) },
>>> +     /* Big-endian RGB16 */
>>> +     { DRM_FORMAT_XRGB1555 | DRM_FORMAT_BIG_ENDIAN, "XR15be", MAKE_RGB_INFO(5, 10, 5, 5, 5, 0, 0, 0) },
>>> +     { DRM_FORMAT_RGB565 | DRM_FORMAT_BIG_ENDIAN, "RG16be", MAKE_RGB_INFO(5, 11, 6, 5, 5, 0, 0, 0) },
>>
>> How about just stripping the BE bit in util_format_info_find()
>> so we don't have to duplicate the entries in the table?
> 
> There is no need to support big-endian variants of all formats.
> E.g. big-endian [AX]RGB8888 just map to little-endian BGR[AX]8888.
> 
> XRGB1555 and RGB565 are probably the only RGB formats we care about.
> Or perhaps some of the *30 formats?

I'd say all of those, and any other formats with components straddling byte boundaries (including formats with multi-byte components).


P.S. libdrm changes are now reviewed and merged as GitLab merge requests: https://gitlab.freedesktop.org/mesa/drm/-/merge_requests

I guess CONTRIBUTING.rst could make this clearer.

-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
