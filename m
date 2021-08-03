Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F783DE9C6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 11:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E58C6E4F9;
	Tue,  3 Aug 2021 09:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09BC06E48D;
 Tue,  3 Aug 2021 09:38:22 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 2E4CEC800B5;
 Tue,  3 Aug 2021 11:38:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id j5zpKJ9d8Toa; Tue,  3 Aug 2021 11:38:19 +0200 (CEST)
Received: from [192.168.178.30] (host-212-18-30-247.customer.m-online.net
 [212.18.30.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 64657C80073;
 Tue,  3 Aug 2021 11:38:19 +0200 (CEST)
From: Werner Sembach <wse@tuxedocomputers.com>
Subject: New uAPI for color management proposal and feedback request v2
To: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Message-ID: <e452775c-5b95-bbfd-e818-f1480f556336@tuxedocomputers.com>
Date: Tue, 3 Aug 2021 11:38:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Greetings,

Original proposal: https://www.mail-archive.com/amd-gfx@lists.freedesktop.org/msg62387.html

Abstract: Add "preferred color format", "active color format", "active bpc", and "active Broadcast RGB" drm properties,
to control color information send to the monitor.

It seems that the "preferred-" properties is not what is actually the most useful for the userspace devs.

Preferable (Note: with only a sample size of 2 people) would be a "force color format" property. If the color format is
not available for the current Monitor and GPU combo. the TEST_ONLY check should fail and the property should not be setable.

This however opens another problem: When a Monitor is disconnected and a new one is connected, the drm properties do not
get resetted. So if the old monitor did allow to set for example ycbcr420, but the new monitor does not support this
color format at all, it will stay permanently black until the drm property is set to a correct value by hand. This is
not an expected behavior imho.

So a discussion questions: Does it make sense that connector properties are keep for different Monitors?

If no: On connecting a new Monitor all atomic drm properties should be reset to a default value.

I have an idea how this could be implemented (correct me if i'm wrong): When an atomic property is attached it get
assigned an inital value. But if I understood the docu correctly, this value is ignored because atomic properties use
the getter and setter methods when their values are read or written. My implementation suggestion would be to iterate
over all attached atomic properties once a new monitor is connected and reset them to this initial value, which should
be unchanged since initialization? This assumes that besides the initial value being unused it's still a sane default
for all drivers.

Kind Regards,

Werner Sembach

