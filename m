Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D121AB308
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 23:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A966EA8A;
	Wed, 15 Apr 2020 21:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63B96EA8A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 21:10:14 +0000 (UTC)
IronPort-SDR: OnEaj0HZwv+eY9mfwDkegF7BY/64M00ZK41iuoz2naA1p2C3J7Vp/Bun/nThG2EGl7cUWLWwzE
 tuJU4jQaylxA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 14:10:14 -0700
IronPort-SDR: 2OGrKVz6wMKDQmQgg2RPyMcP3S1F+0LLC1Hk3QPuyMbOhK8ZrJYjGKhUun2X9E2DhnEfJtYLF4
 Lf0/dYmMzjMQ==
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="427574602"
Received: from ssolodk-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.48.37])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 14:10:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rajat Jain <rajatja@google.com>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: RFC: Drm-connector properties managed by another driver / privacy
 screen support
In-Reply-To: <CACK8Z6HZe0iiyYUR57LvQVJjZCt+dbK9Vc9Tr+Ch8fUuh0h-gw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <87tv1k4vl6.fsf@intel.com> <d47ba6ef-efd0-9f28-1ae4-b971b95a8f8b@redhat.com>
 <CACK8Z6HZe0iiyYUR57LvQVJjZCt+dbK9Vc9Tr+Ch8fUuh0h-gw@mail.gmail.com>
Date: Thu, 16 Apr 2020 00:10:06 +0300
Message-ID: <87pnc84frl.fsf@intel.com>
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
Cc: , Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Christian Kellner <ckellner@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Nitin Joshi1 <njoshi1@lenovo.com>, Mark Pearson <mpearson@lenovo.com>,
 Benjamin Berg <bberg@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Apr 2020, Rajat Jain <rajatja@google.com> wrote:
> Hello,
>
> On Wed, Apr 15, 2020 at 8:40 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 4/15/20 5:28 PM, Jani Nikula wrote:
>> > On Wed, 15 Apr 2020, Hans de Goede <hdegoede@redhat.com> wrote:
>> >> ii. Currently the "privacy-screen" property added by Rajat's
>> >> patch-set is an enum with 2 possible values:
>> >> "Enabled"
>> >> "Disabled"
>> >>
>> >> We could add a third value "Not Available", which would be the
>> >> default and then for internal panels always add the property
>> >> so that we avoid the problem that detecting if the laptop has
>> >> an internal privacy screen needs to be done before the connector
>> >> is registered. Then we can add some hooks which allow an
>> >> lcdshadow-driver to register itself against a connector later
>> >> (which is non trivial wrt probe order, but lets ignore that for now).
>> >
>> > I regret dropping the ball on Rajat's series (sorry!).
>> >
>> > I do think having the connector property for this is the way to go.
>>
>> I 100% agree.
>>
>> > Even
>> > if we couldn't necessarily figure out all the details on the kernel
>> > internal connections, can we settle on the property though, so we could
>> > move forward with Rajat's series?
>
> Thanks, it would be great!.
>
>>
>> Yes please, this will also allow us to move forward with userspace
>> support even if for testing that we do some hacks for the kernel's
>> internal connections for now.
>>
>> > Moreover, do we actually need two properties, one which could indicate
>> > userspace's desire for the property, and another that tells the hardware
>> > state?
>>
>> No I do not think so. I would expect there to just be one property,
>> I guess that if the state is (partly) firmware controlled then there
>> might be a race, but we will need a notification mechanism (*) for
>> firmware triggered state changes anyways, so shortly after loosing
>> the race userspace will process the notification and it will know
>> about it.
>
> I agree with Hans here that I think it would be better if we could do
> it with one property.
>
>  * I can imagine demand for laptops that have a "hardware kill switch"
> for privacy screen (just like there are for camera etc today). So I
> think in future we may have to deal with this case anyway. In such
> devices it's the hardware (as opposite to firmware) that will change
> the state. The HW will likely provide an interrupt to the software to
> notify of the change. This is all imaginative at this point though.
>
> * I think having 2 properties might be a confusing UAPI. Also, we have
> existing properties like link-status that can be changed by both the
> user and the hardware.

I think the consensus is that all properties that get changed by both
userspace and the kernel are mistakes, and the way to handle it is to
have two properties.

BR,
Jani.


>
> Thanks,
>
> Rajat
>
>>
>> One thing which might be useful is a way to signal that the property
>> is read-only in case we ever hit hw where that is the case.
>>
>> > I'd so very much like to have no in-kernel/in-firmware shortcuts
>> > to enable/disable the privacy screen, and instead have any hardware
>> > buttons just be events that the userspace could react to. However I
>> > don't think that'll be the case unfortunately.
>>
>> In my experience with keyboard-backlight support, we will (unfortunately)
>> see a mix and in some case we will get a notification that the firmware
>> has adjusted the state, rather then just getting a keypress and
>> dealing with that ourselves.  In some cases we may even be able to
>> choose, so the fw will deal with it by default but we can ask it
>> to just send a key-press.  But I do believe that we can *not* expect
>> that we will always just get a keypress for userspace to deal with.
>>
>> Regards,
>>
>> Hans
>>
>>
>> *) Some udev event I guess, I sorta assume there already is a
>> notification mechanism for property change notifications ?
>>
>>

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
