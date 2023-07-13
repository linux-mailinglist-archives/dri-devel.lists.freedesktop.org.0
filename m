Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE71751C4B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DC710E633;
	Thu, 13 Jul 2023 08:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B70010E633
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:53:53 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4R1pLP16HMz9spF;
 Thu, 13 Jul 2023 10:53:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1689238429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b89UTOgwd4QDwJlpO7LyCh/xoarXAnW/JBd+tCODdiw=;
 b=LYqaUnECW84YpLBfr6jODifkS2Ifrm1LH3Ro95pz94KV5u97sXWl+tCivpypfTEPinbF5/
 rnAj5u58h1prmg1nP0mcsi6uMFHMbJHHwuTYWxfezGncx6lsH862fvAyh0w/93T4HsR/9p
 k70AT9AbuoKDAHKfIH94JFxZoVlqM8R3G8Fptta7oQcN1+yy8dFOPoZcaQdY9Px9X6HoC2
 VzXQUo1oqfk9Dj29YE4kpf9BkF/7PxYeifkUDUjHcdydGtO5qRDP2J71M2z8rLBflut91Y
 os0Lsaq6BuISrmoyvKqpN9QpbZ1WxurQG8ql985XaYSJ3lyMT+9WZ16bqfgUXQ==
Message-ID: <42e932cc-ff40-61bb-1d63-315f78fb2da2@mailbox.org>
Date: Thu, 13 Jul 2023 10:53:44 +0200
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
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <9b63ee41-13db-979f-80fd-10123da741d3@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4fscr49zu1pnyj8q196hfs97pekoamsi
X-MBO-RS-ID: d2fd980abc8fc7a31fd
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

On 7/13/23 10:49, Thomas Zimmermann wrote:
> Am 13.07.23 um 10:32 schrieb Michel Dänzer:
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
> 
> Right now, the BMC output works because the VGA status is always connected. So nothing really changes.

User-space display servers would generally produce different contents by default for the VGA & BMC connectors.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

