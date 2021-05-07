Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF5F3769BE
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 19:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13706E25B;
	Fri,  7 May 2021 17:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0DA6E0EF;
 Fri,  7 May 2021 17:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=CBcWZHqzaGgz7lsbjdL7nRqUtTSFr2Wq5t9BDXCRpfE=; b=DNoyHoiYuAGlKKpvGmvu1VsqtI
 wNZiM3SfXAiE0xS4pvYR0CjZr3OE2COsF8LL9QfPdeVw8PbKPMdQBUBKQ0CaP/lo0dEAsTlq+1teb
 gBGqQueY5FfJCzsRxrKb2eQfX6llI2Ok55eKpyjqKxYdMh4Y/G/HuiUEFJ5Cbu6nEBM2QNtubr5/H
 qo3pynSZ/LT6cOmBNnCZK6RZ/vi6oDoJQ1Pfx/JrGOEwoemOC53Jv+mekzs0PSto/jnJ0XwEmSj5w
 BvHIukLNPLe9bIz/aAeaLMOmJwg68EGNIS/H/CsXjetTOKmn6MAfB9YaIih8P5mBLdNH58gdovPTo
 eQYHe0KA==;
Received: from [2601:1c0:6280:3f0::7376]
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lf4iK-0073Xx-I5; Fri, 07 May 2021 17:56:36 +0000
Subject: Re: [PATCH v6 2/3] drm/i915/display: Restructure output format
 computation for better expandability
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Werner Sembach <wse@tuxedocomputers.com>
References: <20210506172325.1995964-1-wse@tuxedocomputers.com>
 <20210507084903.28877-1-wse@tuxedocomputers.com>
 <20210507084903.28877-3-wse@tuxedocomputers.com> <YJV+Xr59xyK2yLXT@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0d88cd48-a91f-bf0a-e298-a9d66bf0562b@infradead.org>
Date: Fri, 7 May 2021 10:56:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YJV+Xr59xyK2yLXT@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/7/21 10:52 AM, Ville Syrjälä wrote:
> On Fri, May 07, 2021 at 10:49:02AM +0200, Werner Sembach wrote:
>> Couples the decission between RGB and YCbCr420 mode and the check if the
>> port clock can archive the required frequency. Other checks and
>> configuration steps that where previously done in between can also be done
>> before or after.
>>
>> This allows for are cleaner implementation of retrying different color
>> encodings.
>>
>> A slight change in behaviour occurs with this patch: If YCbCr420 is not
>> allowed but display is YCbCr420 only it no longer fails, but just prints
>> an error and tries to fallback on RGB.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_hdmi.c | 65 ++++++++++++-----------
>>  1 file changed, 34 insertions(+), 31 deletions(-)
>>

> 
> We can't let the user spam dmesg with errors freely. So this needs
> to be a drm_dbg_kms(). Also a bit long, so going to annoyingly wrap
> always. Could maybe shorten a bit to something like:
> "YCbCr 4:2:0 mode but YCbCr 4:2:0 output not possible. Falling back to RGB."
> 
> With that sorted, and the intel_hdmi_port_clock() stuff restored,
> I believe this series is good to go.
> 
> I think you confused our CI by replying to the old patch with a whole
> new series. It can generally deal with a whole new series as a new
> thread or replies to individual patches with updated versions of
> exactly that patch, but not full series as a reply to a patch.
> So I suggest just posting the final versions as a new series. Thanks.
> 

Yeah, we try to say "don't do that," but maybe we need to say that more
strongly. See Documentation/process/submitting-patches.rst:

<<<
However, for a multi-patch series, it is generally
best to avoid using In-Reply-To: to link to older versions of the
series.  This way multiple versions of the patch don't become an
unmanageable forest of references in email clients.  If a link is
helpful, you can use the https://lkml.kernel.org/ redirector (e.g., in
the cover email text) to link to an earlier version of the patch series.
>>>


-- 
~Randy

