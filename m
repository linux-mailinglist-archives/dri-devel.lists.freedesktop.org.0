Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62265751D8D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7E110E662;
	Thu, 13 Jul 2023 09:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267D010E662
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:41:56 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4R1qPq4sdfz9smd;
 Thu, 13 Jul 2023 11:41:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1689241311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4nAFkiwHRDv5Scvoijrnq4nLAqvRENrI0l215YRxnvQ=;
 b=af3h7hm5qTSj70S6mHGC8cHTBkCcWf2YoRgUHuMkkgJCp/E7r2JDuxRVeCoZa26Vm1gxce
 7Bbk43pOXzxpqEwOMDAfD1Wh3jgAFjjrNLKP9+YGJokEKniLmbjNOxZvbuwiq1KP8drJlB
 QPg9yHn+cWo3iXLHr1sSHCLKw3rOyHukJ7Bwol0vTOxqUipNBIpyxArwMzdAgKQtrqA+l6
 AqGczHcQbnk2LzdfxuKVtnJKg5vzAqAl1zb/Ql2lizYPDrfs3XrX4RdAJqUR3amtD+aB5S
 J/DwPaBqKF856X9s4ZYSaGIJchUP1+ie0mdz7mw2+mspiOwxzsR7/HX3E7DUcw==
Message-ID: <0e49b998-7b0c-2681-e1a6-c24f66fe69ab@mailbox.org>
Date: Thu, 13 Jul 2023 11:41:48 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
Content-Language: de-CH-frami, en-CA
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, Sui Jingfeng
 <suijingfeng@loongson.cn>, Jani Nikula <jani.nikula@linux.intel.com>,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
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
 <9b63ee41-13db-979f-80fd-10123da741d3@suse.de>
 <42e932cc-ff40-61bb-1d63-315f78fb2da2@mailbox.org>
 <9ceee0d3-cf5f-2a10-0d1b-9f02be00058e@suse.de>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <9ceee0d3-cf5f-2a10-0d1b-9f02be00058e@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: nuumqrn5dq5dwob7igdz36xk57knaqxn
X-MBO-RS-ID: e42c9a94c05cba954c2
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

On 7/13/23 11:09, Thomas Zimmermann wrote:
> Am 13.07.23 um 10:53 schrieb Michel Dänzer:
>> On 7/13/23 10:49, Thomas Zimmermann wrote:
>>> Am 13.07.23 um 10:32 schrieb Michel Dänzer:
>>>> On 7/12/23 17:25, Jocelyn Falempe wrote:
>>>>> On 12/07/2023 17:05, Sui Jingfeng wrote:
>>>>>> On 2023/7/10 16:07, Jocelyn Falempe wrote:
>>>>>>
>>>>>>> On the other hand, are there any drawback to present a BMC connector even when the hardware doesn't have it ?
>>>>>>
>>>>>> If not properly setting up, I think you will create two encoder and two connector in the system.
>>>>>
>>>>> Yes, but I think it won't have any visible effect for the end-user.
>>>>
>>>> I'm afraid user-space display servers would waste effort producing content for a non-existing BMC (assuming its connector status is connected or unknown).
>>>
>>> Right now, the BMC output works because the VGA status is always connected. So nothing really changes.
>>
>> User-space display servers would generally produce different contents by default for the VGA & BMC connectors.
> 
> Can you elaborate? How would the output differ?

Per the other sub-thread, I didn't realize there's only a single CRTC.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

