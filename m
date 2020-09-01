Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8F0259DCA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 20:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CCB6E893;
	Tue,  1 Sep 2020 18:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2CA6E893;
 Tue,  1 Sep 2020 18:02:04 +0000 (UTC)
IronPort-SDR: Cgz0p/P+RmoFo+NohPAE7GFuheWnJ5bdnBtHUS2k/uZj4fKtY7vUqiMbCkeYkVjuwRX8L6RDFb
 AxS0k3j9UPcg==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="144974479"
X-IronPort-AV: E=Sophos;i="5.76,379,1592895600"; d="scan'208";a="144974479"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 11:02:02 -0700
IronPort-SDR: rd1H57EaVjxrNmd8W7un0kEeyr0+w5UWt4yGUNSBinQxAjogP0ujYjBRJVLDz8gTHetWvdDYQs
 tUSqa+lOTSPw==
X-IronPort-AV: E=Sophos;i="5.76,379,1592895600"; d="scan'208";a="477294921"
Received: from kgeneral-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.251.95.121])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 11:02:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: lyude@redhat.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/dp: start using more of the extended receiver caps
In-Reply-To: <c4b9aa428ccfa90cb29845f622eba8923eeb2e38.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200901123226.4177-1-jani.nikula@intel.com>
 <c4b9aa428ccfa90cb29845f622eba8923eeb2e38.camel@redhat.com>
Date: Tue, 01 Sep 2020 21:01:57 +0300
Message-ID: <87d0354bqi.fsf@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 01 Sep 2020, Lyude Paul <lyude@redhat.com> wrote:
> On Tue, 2020-09-01 at 15:32 +0300, Jani Nikula wrote:
>> In the future, we'll be needing more of the extended receiver capability
>> field starting at DPCD address 0x2200. (Specifically, we'll need main
>> link channel coding cap for DP 2.0.) Start using it now to not miss out
>> later on.
>> 
>> Cc: Lyude Paul <lyude@redhat.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> ---
>> 
>> I guess this can be merged after the topic branch to drm-misc-next or
>> so, but I'd prefer to have this fairly early on to catch any potential
>> issues.
>> ---
>>  drivers/gpu/drm/drm_dp_helper.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
>> index 1e7c638873c8..3a3c238452df 100644
>> --- a/drivers/gpu/drm/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/drm_dp_helper.c
>> @@ -436,7 +436,7 @@ static u8 drm_dp_downstream_port_count(const u8
>> dpcd[DP_RECEIVER_CAP_SIZE])
>>  static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
>>  					  u8 dpcd[DP_RECEIVER_CAP_SIZE])
>>  {
>> -	u8 dpcd_ext[6];
>> +	u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
>
> Not 100% sure this is right? It's not clear at first glance of the 2.0 spec, but
> my assumption would be that on < DP2.0 devices that everything but those first 6
> bytes are zeroed out in the extended DPRX field. Since we memcpy() dpcd_ext
> using sizeof(dpcd_ext), we'd potentially end up zeroing out all of the DPCD caps
> that comes after those 6 bytes.

Re-reading stuff... AFAICT everything in 0x2200..0x220F should be
valid. They should match what's in 0x0000..0x000F except for 0x0000,
0x0001, and 0x0005, for backwards compatibility.

Apparently there are no such backwards compatibility concerns with the
other receiver cap fields then.

But it gives me an uneasy feeling that many places in the spec refer to
0x2200+ even though they should per spec be the same in 0x0000+.

I guess we can try without the change, and fix later if we hit issues.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
