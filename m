Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4993EEECD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 16:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BE26E037;
	Tue, 17 Aug 2021 14:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 91024 seconds by postgrey-1.36 at gabe;
 Tue, 17 Aug 2021 14:54:29 UTC
Received: from h1954565.stratoserver.net (sebastianwick.net [85.214.192.246])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7007E6E037
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 14:54:29 +0000 (UTC)
Received: from mail.sebastianwick.net (sebastianwick.net
 [IPv6:2a01:238:4226:4f00:79f5:2d39:beca:3cf1])
 by h1954565.stratoserver.net (Postfix) with ESMTPSA id 744AF164FE0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 16:54:28 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 17 Aug 2021 16:54:28 +0200
From: sebastian@sebastianwick.net
To: dri-devel@lists.freedesktop.org
Subject: Re: New uAPI for color management proposal and feedback request v2
In-Reply-To: <e452775c-5b95-bbfd-e818-f1480f556336@tuxedocomputers.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <b280979d123642bd48cc52a6cd5423b7@sebastianwick.net>
X-Sender: sebastian@sebastianwick.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Greetings,
> 
> Original proposal: 
> https://www.mail-archive.com/amd-gfx@lists.freedesktop.org/msg62387.html
> 
> Abstract: Add "preferred color format", "active color format", "active 
> bpc", and "active Broadcast RGB" drm properties,
> to control color information send to the monitor.
> 
> It seems that the "preferred-" properties is not what is actually the 
> most useful for the userspace devs.
> 
> Preferable (Note: with only a sample size of 2 people) would be a 
> "force color format" property. If the color format is
> not available for the current Monitor and GPU combo. the TEST_ONLY 
> check should fail and the property should not be setable.
> 
> This however opens another problem: When a Monitor is disconnected and 
> a new one is connected, the drm properties do not
> get resetted. So if the old monitor did allow to set for example 
> ycbcr420, but the new monitor does not support this
> color format at all, it will stay permanently black until the drm 
> property is set to a correct value by hand. This is
> not an expected behavior imho.

User space is aware of output changes and already has to set properties 
such
that the new output will light up. So IMO what you describe is expected
behavior. What makes this still a bit hary is when you switch from user 
space
which set the property to user space which is not aware of the property 
but
this is a more general problem that already exists for all new 
properties. The
solution here is a reset mechanism for user space. More context:
https://oftc.irclog.whitequark.org/dri-devel/2021-06-16#1623837713-1623842163;

> So a discussion questions: Does it make sense that connector properties 
> are keep for different Monitors?
> 
> If no: On connecting a new Monitor all atomic drm properties should be 
> reset to a default value.
> 
> I have an idea how this could be implemented (correct me if i'm wrong): 
> When an atomic property is attached it get
> assigned an inital value. But if I understood the docu correctly, this 
> value is ignored because atomic properties use
> the getter and setter methods when their values are read or written. My 
> implementation suggestion would be to iterate
> over all attached atomic properties once a new monitor is connected and 
> reset them to this initial value, which should
> be unchanged since initialization? This assumes that besides the 
> initial value being unused it's still a sane default
> for all drivers.
> 
> Kind Regards,
> 
> Werner Sembach
