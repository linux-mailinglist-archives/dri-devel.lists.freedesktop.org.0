Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF669138CA
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 09:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C6D10E0D1;
	Sun, 23 Jun 2024 07:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="VWLZcSHM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE8F10E0D1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 07:38:34 +0000 (UTC)
X-Envelope-To: dmitry.torokhov@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1719128312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BRlsITvJYcKMBok/iafTN5u8ne4v1dcaQ2SV21o/R3A=;
 b=VWLZcSHMLGoB8HOi/YlFgC3WDCCBIt9JYICtk7dwDdbI29kYc8h9vRSHMByuMdtayoWhOw
 WxsneO7SHuZc3WbZ0ADBBBhpbaFWUq4LKLsgFGscEYfW2vtAwidZJ8QZJBNuA7b6niwxvu
 VvuMQGcx+H5EmfTA+uSW0LEGkR/+tiU=
X-Envelope-To: andriy.shevchenko@linux.intel.com
X-Envelope-To: linux-acpi@vger.kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: djrscally@gmail.com
X-Envelope-To: heikki.krogerus@linux.intel.com
X-Envelope-To: sakari.ailus@linux.intel.com
X-Envelope-To: gregkh@linuxfoundation.org
X-Envelope-To: rafael@kernel.org
X-Envelope-To: dmitry.baryshkov@linaro.org
Message-ID: <ee4e8724-4a19-4814-9b7e-9eb6eb0ac6a3@linux.dev>
Date: Sun, 23 Jun 2024 15:38:23 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v3] software node: Implement device_get_match_data fwnode
 callback
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240427203650.582989-1-sui.jingfeng@linux.dev>
 <ZnXbaubPVAUdDIu0@google.com>
 <7b5305b6-78b0-4add-9e70-271159cfad95@linux.dev>
 <Zncl_O-NjMRZYGeA@google.com>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <Zncl_O-NjMRZYGeA@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,

On 6/23/24 03:29, Dmitry Torokhov wrote:
>> In case of non-OF match (which
>>> includes the case where you use software nodes) the match data is coming
>>> from matching spi_device_id entry in the driver.
>>
>> We don't care about much how it is probed now, rather, after the driver
>> probed by a non-OF way, how does the additional devices properties
>> can be get?
>>
>>
>> Say:
>>
>> 1) "device_property_read_u32(dev, "rotation", &rotation);" and
>> 2) "!device_property_read_string(dev, "pervasive,thermal-zone",
>> &thermal_zone))"
>>
>>
>> For those spi/i2c/platform devices, what we argues are that
>> those drivers really should just depend on "OF" before we have
>> a reliable fwnode API backend to redirect to.
> They are working fine without such restriction now, 


You still *NOT* answer where the additional devices properties[1][2]
can be acquire.

[1] device_property_read_u32(dev, "rotation", &rotation)

[2] device_property_read_string(dev, "pervasive,thermal-zone", 
&thermal_zone))


> so I see absolutely no reason imposing this restriction.

The reason is rigorous.

You are acclaiming that works by hardcode or by ignoring the flaws
is fine, then all driver are working fine by *your* standard.

Your personal standard has nothing to do with this patch.

>> Where the additional device_property_read_xxxx() calls redirect to?
>>
>> What if users want to invoke more device_property_read_xxxx() function?
> They are being directed to first the primary FW node instance, which may
> be either OF, ACPI, or SW node, and then, if property is not present
> there, to the secondary FW node, which can be either again.


What I'm asking is, on the non-OF and no-ACPI cases, where's those
device_property_read_xxx() calls can be directed to?

> At no point ->device_get_match_data() callback in involved in this
> process.
> 

The patch is written for people who need it, not for people who don't.

It will be involved if the device is associated with software node.
Its for fwnode API user to get a consistent experience, that is
to get a matching data without introduce extra/duplicated match
mechanism.

The patch is focus on fixing the undefined behavior, is discussing
the correct way to consolidate the fwnode API. Its not going to
discuss how does the those *old" and/or how does those non-fwnode
systems works.

Its NOT discussing how does the driver itself can be probed, a driver
can be probed multiple way and is another question. Being probed and
extract matching data can two different thing and is perfectly valid.

Your problem is that you are not fully understand what other people
does before you rush into the discussion. You are putting restrictions
onto other people, while leaving the problem itself there unsolved.

Its not a place to express your personal value or you personal status,
such as, you are "ready" or "not ready" for something. Or persuading
somebody should get used to what or teaching people to talks with a
whatever tone like a God.

None of those junk words are technical, I can not see constructive
ideas.

Thanks.
