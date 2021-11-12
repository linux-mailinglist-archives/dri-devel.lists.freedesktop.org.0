Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C2744E4B8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 11:37:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6598D6E917;
	Fri, 12 Nov 2021 10:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B926E917
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 10:37:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="319319817"
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="319319817"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 02:37:09 -0800
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="504838590"
Received: from sbacanu-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.217.145])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 02:37:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
In-Reply-To: <20211112122239.26b3787c@eldfell>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211108140648.795268-1-javierm@redhat.com>
 <a8d93a19-c7e6-f651-a1cb-9e2742383c73@suse.de>
 <20211112105641.25a4e1a7@eldfell>
 <CAFOAJEd6wNDF93Z1Y6-62pnRzth9Fg4+56+jqCe2qmHk-adR1w@mail.gmail.com>
 <f215e009-94af-fdb5-9ab9-ec5806a0c526@suse.de>
 <20211112122239.26b3787c@eldfell>
Date: Fri, 12 Nov 2021 12:37:03 +0200
Message-ID: <877ddd4q40.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Nov 2021, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> On Fri, 12 Nov 2021 11:09:13 +0100
> Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
>> Hi
>> 
>> Am 12.11.21 um 10:39 schrieb Javier Martinez Canillas:
>> > Hello Pekka,
>> > 
>> > On 11/12/21 09:56, Pekka Paalanen wrote:
>> > 
>> > [snip]
>> >   
>> >>
>> >> Hi,
>> >>
>> >> these ideas make sense to me, so FWIW,
>> >>
>> >> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>> >>  
>> > 
>> > Thanks.
>> >   
>> >> There is one nitpick I'd like to ask about:
>> >>
>> >> +bool drm_get_modeset(void)
>> >> +{
>> >> +     return !drm_nomodeset;
>> >> +}
>> >> +EXPORT_SYMBOL(drm_get_modeset);
>> >>
>> >> Doesn't "get" have a special meaning in the kernel land, like "take a
>> >> strong reference on an object and return it"?  
>> > 
>> > That's a very good point.
>> >   
>> >> As this is just returning bool without changing anything, the usual
>> >> word to use is "is". Since this function is also used at most once per
>> >> driver, which is rarely, it could have a long and descriptive name.
>> >>
>> >> For example:
>> >>
>> >> bool drm_is_modeset_driver_allowed(void);  
>> 
>> I'd nominate
>> 
>>    bool drm_native_drivers_enabled()
>> 
>> This is what HW-specific drivers want to query in their init/probing 
>> code. The actual semantics of this decision is hidden from the driver. 
>> It's also easier to read than the other name IMHO
>
> Ok, but what is a "native driver"? Or a "non-native driver"?
> Is that established kernel terminology?

FWIW, it doesn't mean anything to me.

drm_modeset_enabled()?

*sigh* I worked so hard not to participate in this bikeshed. ;)


BR,
Jani.


>
> I'd think a non-native driver is something that e.g. ndiswrapper is
> loading. Is simpledrm like ndiswrapper in a sense? IIRC, simpledrm is
> the driver that would not consult this function, right?
>
>
> Thanks,
> pq
>
>> 
>> Best regards
>> Thomas
>> 
>> >>  
>> > 
>> > Yeah, naming is hard. Jani also mentioned that he didn't like this
>> > function name, so I don't mind to re-spin the series only for that.
>> >   
>> >> - "drm" is the namespace
>> >> - "is" implies it is a read-only boolean inspection
>> >> - "modeset" is the feature being checked
>> >> - "driver" implies it is supposed gate driver loading or
>> >>    initialization, rather than modesets after drivers have loaded
>> >> - "allowed" says it is asking about general policy rather than what a
>> >>    driver does
>> >>  
>> > 
>> > I believe that name is more verbose than needed. But don't have a
>> > strong opinion and could use it if others agree.
>> >   
>> >> Just a bikeshed, I'll leave it to actual kernel devs to say if this
>> >> would be more appropriate or worth it.
>> >>  
>> > 
>> > I think is worth it and better to do it now before the patches land, but
>> > we could wait for others to chime in.
>> > 
>> > Best regards,
>> > --
>> > Javier Martinez Canillas
>> > Linux Engineering
>> > Red Hat
>> >   
>> 
>

-- 
Jani Nikula, Intel Open Source Graphics Center
