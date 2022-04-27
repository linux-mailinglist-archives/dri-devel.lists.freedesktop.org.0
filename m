Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45903511B92
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 17:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402B110EEB8;
	Wed, 27 Apr 2022 15:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFDC10F4E7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 15:02:22 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [80.241.60.233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4KpMRc2wt0z9sWx;
 Wed, 27 Apr 2022 17:02:20 +0200 (CEST)
Message-ID: <8ced7101-34b3-24d3-ed78-0951abce0573@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1651071738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sWh5ihS06LiSpcSmL+YdrqQ7AY3GBdO1PruiyfJmaP0=;
 b=vRBY5FOZuWqrgUzYGNA6UaC7hvkRIP9CniuQ0c1lOdxr9HMy+mZiyQWy00xsxQj7nvo/f2
 yUwwpgXFl49YTyfAr/PYyln3MHXbR//j/429HirEfq4i8al9uGsnP/zooWonlsLbMcUppa
 wxDcfNSGlgbHJgPGiJMhsl0LYPwoRk69KXHv6WfIdlRoQYsiE9NnLePO2Mlz5SqHpVO5a3
 MgYwUqx77NaG1Vyc6p0BwV4SBfnlin+Fefsa5sPJuuz6iRwXUnI5Zgtdf8ZfulUZ6GoJmS
 bdpyOGT+TnHXCxbEQRsazjcZWFjOqCAsgPEckDItwALjRq6mH9uoShAL3P98nA==
Date: Wed, 27 Apr 2022 17:02:14 +0200
MIME-Version: 1.0
Subject: Re: How should "max bpc" KMS property work?
Content-Language: en-CA
To: Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <20220427135259.5e615945@eldfell>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20220427135259.5e615945@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ybuqs7oq77wudqf9b6c4ro7qycarfows
X-MBO-RS-ID: 679f264f75adc1f9408
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-04-27 12:52, Pekka Paalanen wrote:
> On Tue, 26 Apr 2022 20:55:14 +0300
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>> On Tue, Apr 26, 2022 at 11:35:02AM +0300, Pekka Paalanen wrote:
>>>
>>> Do I lose the ability to set video modes that take too much bandwidth
>>> at uncapped driver-selected bpc while capping the bpc lower would allow
>>> me to use those video modes?
>>>
>>> Or, are drivers required to choose a lower-than-usual but highest
>>> usable bpc to make the requested video mode squeeze through the
>>> connector and link?  
>>
>> IMO drivers should implement the "reduce bpc until it fits"
>> fallback. We have that in i915, except for MST where we'd need
>> to potentially involve multiple streams in the fallback. That
>> is something we intend to remedy eventually but it's not an
>> entirely trivial thing to implement so will take some actual
>> work. ATM we just cap MST to <=8bpc to avoid users getting into
>> this situation so often.
> 
> Excellent, but judging from what Alex said, this is also not what
> amdgpu does. We have two drivers doing different things then?
> 
> So with Weston I probably have to document, that if you can't get the
> video mode you want working, try turning the 'max bpc' knob down and
> try again.
> 
> Or, I could cap 'max bpc' based on my framebuffer depth. If I have an
> electrical 8 bit FB (default in Weston), then there is not much use for
> having 'max bpc' > 8. This ignores the KMS color pipeline a bit. Does
> that make sense?

I don't think so. The output of LUTs in current HW has at least 10 bpc, regardless of the FB format.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
