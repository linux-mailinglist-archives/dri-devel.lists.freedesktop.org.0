Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A392751C52
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7858510E634;
	Thu, 13 Jul 2023 08:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050:0:465::201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35A810E634
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:55:54 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4R1pNk6KkDz9sjB;
 Thu, 13 Jul 2023 10:55:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1689238550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rBLdbolcwleXFuyesv/FWfqTiICKNnhIqRd0Q8rKdcU=;
 b=XOQm+c/1VBvNsC38s/PLHAf65YTtaz1YNCZVHPnd7nZYzH+0rP5kTffOUR96BybzW2Iee+
 pLJvj/DDKWaB55W5zp4Yj0X9ULognwdPx9Ms4EgUWHBNoid/EYXOlVoPShlj+D5SjiTAso
 bEWneUxV+AeybxC+zD1mH+d2AyLJYYr/Bj8hH4DXvFQ7JwLYZE2qL136HZrCKdyEKZlGrc
 modOgt/igNN602g9Y12V31QbSd3Iw7c6SV+5d9ChJ/dGJMRZ3ggnPceyMSmSiq9oUrFYIS
 s2X1yuMLg2jVc3aLVmJYYMqadv1YsViEq+08cs1Rb/v4PPZNO66QTLSOl/C5Gg==
Message-ID: <59271d91-4e9b-fef7-c51f-61ee26e99f5c@mailbox.org>
Date: Thu, 13 Jul 2023 10:55:49 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
Content-Language: de-CH-frami, en-CA
To: Jocelyn Falempe <jfalempe@redhat.com>
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com> <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
 <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
 <43d12606-9c81-99f8-f13c-14338fcd7a28@suse.de>
 <f4b4ab09-5f03-af3c-0e7f-44a248678be8@redhat.com>
 <23d80964-d2d0-b688-e3cd-bf25a8135e5e@redhat.com>
 <81c57344-289d-fe41-8518-503249ea8d64@suse.de>
 <3fc768f8-9461-c4b0-b9af-555c52294c94@redhat.com>
 <2fb391e2-9f68-26f0-e005-a7f0f4324adc@loongson.cn>
 <b56afc8a-5fda-3227-3ac0-5e7b7773976b@redhat.com>
 <36e04e4c-c2ac-64cf-9503-ea43a29b66d0@mailbox.org>
 <90f7b5f9-9805-39d3-801a-babd10f1a0cf@redhat.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <90f7b5f9-9805-39d3-801a-babd10f1a0cf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: bci7fc7qjkqo5hyp951fc5zo6rm8quke
X-MBO-RS-ID: dcc1a3e11824a90bd7c
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/13/23 10:53, Jocelyn Falempe wrote:
> On 13/07/2023 10:32, Michel Dänzer wrote:
>> On 7/12/23 17:25, Jocelyn Falempe wrote:
>>> On 12/07/2023 17:05, Sui Jingfeng wrote:
>>>> On 2023/7/10 16:07, Jocelyn Falempe wrote:
>>>>
>>>>> On the other hand, are there any drawback to present a BMC connector even when the hardware doesn't have it ?
>>>>
>>>> If not properly setting up, I think you will create two encoder and two connector in the system.
>>>
>>> Yes, but I think it won't have any visible effect for the end-user.
>>
>> I'm afraid user-space display servers would waste effort producing content for a non-existing BMC (assuming its connector status is connected or unknown).
>>
>>
> I think it's already the case, as AST's DP and VGA connectors currently always report "connected" status. And they all share the same crtc, so there is only one framebuffer, that is always active.

"Single CRTC" is the piece of information I was missing. Never mind then.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

