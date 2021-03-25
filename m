Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4C4349490
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 15:50:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21D16ED9B;
	Thu, 25 Mar 2021 14:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A186ED99;
 Thu, 25 Mar 2021 14:50:02 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id i9so2008148qka.2;
 Thu, 25 Mar 2021 07:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A01xU9scL5QHqCTcEARA+UZXhX3w6QfTLVjGvG0qhWs=;
 b=fjIpx38pKKpF7tuHHnx+6bHTa8GIAr+gRLGjKt2x69P7v8gjKVe3W9dYqxgP9vSwI9
 QihvfqnQepbko6JQmAIRW+EQAppxHtxDBVpKo/ulTx0XeTA+TsLT2XPd5R47EHfs/vL+
 RcfmGpqKXdbxR340ysSTk2TR5aaFQcoTZCnFjyd/rFWDxI9wey0GlS/SNuFSvLhs+psi
 0EVXYddJbSDWFSlhrUt5I6M67vOMO/RGQOVQ0jvf2R4mqWnxzVz/163P9EVlylTqlOyg
 RuvSoLqCSa3d1HolOz0J7uXNfTUCd96jvr8FQ9pq7Hu06fFtmIslpU2LxY/2YEkWewFc
 MUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A01xU9scL5QHqCTcEARA+UZXhX3w6QfTLVjGvG0qhWs=;
 b=VWODLZD01rr8XEEEB/tIDlH70FYLyfSbghcPQbVXWRlfvq+gE1yjg9tNyh7o2l1Syr
 k6suxxDly9Cy+f6ud5jzcuQ0uqVAD+UEj/yhAAnQlGog43SYn/+eognQJ7U0NVLPeFLo
 rNQXtWQ/03UudEqG7F3AwXzLf4Fd+i9bPWZdavXpeWolULoNxoZDZlX23yAgkLsgG29e
 BYj8DWF+op7j6JbASfMuU6zt9CA4fpeOyaGt/WUQprRjvdYrZ/X2JGQqBO6ISEEQi3j7
 inHvUGao0YhFYa6evtm4Bqup1YX9HFbjaV3Xe3CHVB0AmJfshBs9oUuR+ETBid/JTjyG
 /oaQ==
X-Gm-Message-State: AOAM5319mIh0wtA5e1hZ0kFV1BQdQXjDXTflyb2hszbNVuUpwr84uosH
 f484qSd/5buYxXGK32EcR9I=
X-Google-Smtp-Source: ABdhPJx2RAnajmw8ltd8BDZCZjs+AmRvn2izOpJq6Wnqeic5eWA8Vk7CLaR0JiE3Cx4o6fmRuVGtdA==
X-Received: by 2002:a05:620a:1369:: with SMTP id
 d9mr8566930qkl.378.1616683801356; 
 Thu, 25 Mar 2021 07:50:01 -0700 (PDT)
Received: from [192.168.0.41] (71-218-23-248.hlrn.qwest.net. [71.218.23.248])
 by smtp.gmail.com with ESMTPSA id
 y1sm4324368qki.9.2021.03.25.07.49.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 07:50:00 -0700 (PDT)
Subject: Re: [PATCH 11/11] [RFC] drm/i915/dp: fix array overflow warning
To: Arnd Bergmann <arnd@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-12-arnd@kernel.org> <87wntv3bgt.fsf@intel.com>
 <CAK8P3a0HGiPQ-k6t6roTgeUvVAMMY=fMnGV0+t48yJjz55XFAA@mail.gmail.com>
From: Martin Sebor <msebor@gmail.com>
Message-ID: <44ad545d-cc07-2e5f-9ec8-ad848f39268a@gmail.com>
Date: Thu, 25 Mar 2021 08:49:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0HGiPQ-k6t6roTgeUvVAMMY=fMnGV0+t48yJjz55XFAA@mail.gmail.com>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 Animesh Manna <animesh.manna@intel.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 Uma Shankar <uma.shankar@intel.com>, Kalle Valo <kvalo@codeaurora.org>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, ath11k@lists.infradead.org,
 Serge Hallyn <serge@hallyn.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, Ning Sun <ning.sun@intel.com>,
 Anders Larsen <al@alarsen.net>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Cgroups <cgroups@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Martin Sebor <msebor@gcc.gnu.org>, Networking <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 LSM List <linux-security-module@vger.kernel.org>, Tejun Heo <tj@kernel.org>,
 Simon Kelley <simon@thekelleys.org.uk>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/25/21 3:53 AM, Arnd Bergmann wrote:
> On Thu, Mar 25, 2021 at 9:05 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>> Clearly something is wrong here, but I can't quite figure out what.
>>> Changing the array size to 16 bytes avoids the warning, but is
>>> probably the wrong solution here.
>>
>> Ugh. drm_dp_channel_eq_ok() does not actually require more than
>> DP_LINK_STATUS_SIZE - 2 elements in the link_status. It's some other
>> related functions that do, and in most cases it's convenient to read all
>> those DP_LINK_STATUS_SIZE bytes.
>>
>> However, here the case is slightly different for DP MST, and the change
>> causes reserved DPCD addresses to be read. Not sure it matters, but
>> really I think the problem is what drm_dp_channel_eq_ok() advertizes.
>>
>> I also don't like the array notation with sizes in function parameters
>> in general, because I think it's misleading. Would gcc-11 warn if a
>> function actually accesses the memory out of bounds of the size?
> 
> Yes, that is the point of the warning. Using an explicit length in an
> array argument type tells gcc that the function will never access
> beyond the end of that bound, and that passing a short array
> is a bug.
> 
> I don't know if this /only/ means triggering a warning, or if gcc
> is also able to make optimizations after classifying this as undefined
> behavior that it would not make for an unspecified length.

GCC uses the array parameter notation as a hint for warnings but
it doesn't optimize on this basis and never will be able to because
code that accesses more elements from the array isn't invalid.
Adding static to the bound, as in void f (int[static N]) does
imply that the function won't access more than N elements and
C intends for optimizers to rely on it, although GCC doesn't yet.

The warning for the array notation is a more portable alternative
to explicitly annotating functions with attribute access, and to
-Wvla-parameter for VLA parameters.  The latter seem to be used
relatively rarely, sometimes deliberately because of the bad rap
of VLA objects, even though VLA parameters don't suffer from
the same problems.

Martin

> 
>> Anyway. I don't think we're going to get rid of the array notation
>> anytime soon, if ever, no matter how much I dislike it, so I think the
>> right fix would be to at least state the correct required size in
>> drm_dp_channel_eq_ok().
> 
> Ok. Just to confirm: Changing the declaration to an unspecified length
> avoids the warnings, as does the patch below:
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index eedbb48815b7..6ebeec3d88a7 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -46,12 +46,12 @@
>    */
> 
>   /* Helpers for DP link training */
> -static u8 dp_link_status(const u8 link_status[DP_LINK_STATUS_SIZE], int r)
> +static u8 dp_link_status(const u8 link_status[DP_LINK_STATUS_SIZE - 2], int r)
>   {
>          return link_status[r - DP_LANE0_1_STATUS];
>   }
> 
> -static u8 dp_get_lane_status(const u8 link_status[DP_LINK_STATUS_SIZE],
> +static u8 dp_get_lane_status(const u8 link_status[DP_LINK_STATUS_SIZE - 2],
>                               int lane)
>   {
>          int i = DP_LANE0_1_STATUS + (lane >> 1);
> @@ -61,7 +61,7 @@ static u8 dp_get_lane_status(const u8
> link_status[DP_LINK_STATUS_SIZE],
>          return (l >> s) & 0xf;
>   }
> 
> -bool drm_dp_channel_eq_ok(const u8 link_status[DP_LINK_STATUS_SIZE],
> +bool drm_dp_channel_eq_ok(const u8 link_status[DP_LINK_STATUS_SIZE - 2],
>                            int lane_count)
>   {
>          u8 lane_align;
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index edffd1dcca3e..160f7fd127b1 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1456,7 +1456,7 @@ enum drm_dp_phy {
> 
>   #define DP_LINK_CONSTANT_N_VALUE 0x8000
>   #define DP_LINK_STATUS_SIZE       6
> -bool drm_dp_channel_eq_ok(const u8 link_status[DP_LINK_STATUS_SIZE],
> +bool drm_dp_channel_eq_ok(const u8 link_status[DP_LINK_STATUS_SIZE - 2],
>                            int lane_count);
>   bool drm_dp_clock_recovery_ok(const u8 link_status[DP_LINK_STATUS_SIZE],
>                                int lane_count);
> 
> 
> This obviously needs a good explanation in the code and the changelog text,
> which I don't have, but if the above is what you had in mind, please take that
> and add Reported-by/Tested-by: Arnd Bergmann <arnd@arndb.de>.
> 
>         Arnd
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
