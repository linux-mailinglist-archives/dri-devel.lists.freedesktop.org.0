Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DEF167ADF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 11:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF836EF30;
	Fri, 21 Feb 2020 10:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F026EF30;
 Fri, 21 Feb 2020 10:35:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 02:35:12 -0800
X-IronPort-AV: E=Sophos;i="5.70,467,1574150400"; d="scan'208";a="229811346"
Received: from jmiler-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.38.187])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 02:35:07 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, akpm@linux-foundation.org,
 broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au,
 linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] mmotm 2020-02-19-19-51 uploaded (gpu/drm/i915/ +
 HDRTEST)
In-Reply-To: <d8112767-4089-4c58-d7d3-2ce03139858a@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200220035155.PempH%akpm@linux-foundation.org>
 <d8112767-4089-4c58-d7d3-2ce03139858a@infradead.org>
Date: Fri, 21 Feb 2020 12:35:13 +0200
Message-ID: <874kvkz0ri.fsf@intel.com>
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

On Thu, 20 Feb 2020, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 2/19/20 7:51 PM, akpm@linux-foundation.org wrote:
>> The mm-of-the-moment snapshot 2020-02-19-19-51 has been uploaded to
>> 
>>    http://www.ozlabs.org/~akpm/mmotm/
>> 
>> mmotm-readme.txt says
>> 
>> README for mm-of-the-moment:
>> 
>> http://www.ozlabs.org/~akpm/mmotm/
>> 
>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>> more than once a week.
>> 
>
> on x86_64:
> when GCOV is set/enabled:
>
>   HDRTEST drivers/gpu/drm/i915/display/intel_frontbuffer.h
> /dev/null:1:0: error: cannot open /dev/null.gcno
>   HDRTEST drivers/gpu/drm/i915/display/intel_ddi.h
> /dev/null:1:0: error: cannot open /dev/null.gcno
> make[5]: *** [../drivers/gpu/drm/i915/Makefile:307: drivers/gpu/drm/i915/display/intel_ddi.hdrtest] Error 1
> make[5]: *** Waiting for unfinished jobs....
> make[5]: *** [../drivers/gpu/drm/i915/Makefile:307: drivers/gpu/drm/i915/display/intel_frontbuffer.hdrtest] Error 1
>
>
> Full randconfig file is attached.

We're trying to hide that from the general population, only to be used
by our developers and CI, with e.g. "depends on !COMPILE_TEST". Can't
hide from randconfig it seems.

Does the below patch help?

BR,
Jani.


diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index b314d44ded5e..bc28c31c4f78 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -301,7 +301,7 @@ extra-$(CONFIG_DRM_I915_WERROR) += \
 		$(shell cd $(srctree)/$(src) && find * -name '*.h')))
 
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
-      cmd_hdrtest = $(CC) $(c_flags) -S -o /dev/null -x c /dev/null -include $<; touch $@
+      cmd_hdrtest = $(CC) $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $<; touch $@
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
 	$(call if_changed_dep,hdrtest)


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
