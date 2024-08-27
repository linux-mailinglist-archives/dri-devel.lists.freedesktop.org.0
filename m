Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F94E960B5C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 15:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE2210E209;
	Tue, 27 Aug 2024 13:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=derek.foreman@collabora.com header.b="CeZTG4Br";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8A610E209
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 13:09:16 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724764144; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WZd/XlpS+ElWV2DtsLs4bgrncN4GnKqcVHsbgiRpNkoRyCfeU4c0j9VFx0hqLjgTnVBpcV4qsQf2ooB2lAdeDa1FTdrEycFykeIWwhHC5IDiXgj40sfvx92CjUqm+07yWtVeV0L+p4rpzZxdT66dr8poedZEdQhqVwfYUBM1tLM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724764144;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=V9yJ4eWjavjy9uh1rImyBaNhlfJBrktya8FWA/P5u6M=; 
 b=fATijjdy/tj280ax1S6IWggyndRlOPFswcMk/8TTJrILs6uxIFbttUFvNdOUFner/bLG6ZcEgzcJrlFJnPoHpeHPc1BJ2ZxaW3YG52NXGCuSo90PjZXJzmtoDyYKau29l6sLvKrRFb57HTbwp+9+i01p3DzSq5jLgfbpesIgXMo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=derek.foreman@collabora.com;
 dmarc=pass header.from=<derek.foreman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724764144; 
 s=zohomail; d=collabora.com; i=derek.foreman@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=V9yJ4eWjavjy9uh1rImyBaNhlfJBrktya8FWA/P5u6M=;
 b=CeZTG4Brcf9GKTi3N0bglrTUsbXS2iAwM58FY/qviwOitAhvI7tyBFggASKOwzA9
 qTZbHKOKqCLpChALjwI3ayewWEWhS3jIxG1dljT+CvlKceYBaDY9gGASD2ADCzI3r6w
 o7ge1rFb33/7rW42q0NUtim6T2ESX0fbbdJ2L1i8=
Received: by mx.zohomail.com with SMTPS id 1724764143094992.452966862482;
 Tue, 27 Aug 2024 06:09:03 -0700 (PDT)
Message-ID: <1ef0fc23-db15-4f4d-8026-d8b86d6da642@collabora.com>
Date: Tue, 27 Aug 2024 08:09:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/connector: hdmi: Fix writing Dynamic Range
 Mastering infoframes
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20240826121029.491976-1-derek.foreman@collabora.com>
 <20240827-bison-of-utter-resistance-be54df@houat> <87plpuz2s6.fsf@intel.com>
Content-Language: en-US
From: Derek Foreman <derek.foreman@collabora.com>
In-Reply-To: <87plpuz2s6.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 2024-08-27 05:19, Jani Nikula wrote:
> On Tue, 27 Aug 2024, Maxime Ripard <mripard@kernel.org> wrote:
>> Hi,
>>
>> On Mon, Aug 26, 2024 at 07:10:11AM GMT, Derek Foreman wrote:
>>> The largest infoframe we create is the DRM (Dynamic Range Mastering)
>>> infoframe which is 26 bytes + a 4 byte header, for a total of 30
>>> bytes.
>>>
>>> With HDMI_MAX_INFOFRAME_SIZE set to 29 bytes, as it is now, we
>>> allocate too little space to pack a DRM infoframe in
>>> write_device_infoframe(), leading to an ENOSPC return from
>>> hdmi_infoframe_pack(), and never calling the connector's
>>> write_infoframe() vfunc.
>>>
>>> Instead of having HDMI_MAX_INFOFRAME_SIZE defined in two places,
>>> replace HDMI_MAX_INFOFRAME_SIZE with HDMI_INFOFRAME_SIZE(MAX) and make
>>> MAX the same size as the DRM infoframe.
>>>
>>> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
>>> ---
>>>   drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 +---
>>>   drivers/gpu/drm/drm_debugfs.c                   | 4 +---
>>>   include/linux/hdmi.h                            | 3 +++
>>>   3 files changed, 5 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>>> index 7854820089ec..feb7a3a75981 100644
>>> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>>> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>>> @@ -521,8 +521,6 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>>>   }
>>>   EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
>>>   
>>> -#define HDMI_MAX_INFOFRAME_SIZE		29
>>> -
>>>   static int clear_device_infoframe(struct drm_connector *connector,
>>>   				  enum hdmi_infoframe_type type)
>>>   {
>>> @@ -563,7 +561,7 @@ static int write_device_infoframe(struct drm_connector *connector,
>>>   {
>>>   	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
>>>   	struct drm_device *dev = connector->dev;
>>> -	u8 buffer[HDMI_MAX_INFOFRAME_SIZE];
>>> +	u8 buffer[HDMI_INFOFRAME_SIZE(MAX)];
>>>   	int ret;
>>>   	int len;
>>>   
>>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>>> index 6b239a24f1df..9d3e6dd68810 100644
>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>> @@ -520,8 +520,6 @@ static const struct file_operations drm_connector_fops = {
>>>   	.write = connector_write
>>>   };
>>>   
>>> -#define HDMI_MAX_INFOFRAME_SIZE		29
>>> -
>>>   static ssize_t
>>>   audio_infoframe_read(struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)
>>>   {
>>> @@ -579,7 +577,7 @@ static ssize_t _f##_read_infoframe(struct file *filp, \
>>>   	struct drm_connector *connector; \
>>>   	union hdmi_infoframe *frame; \
>>>   	struct drm_device *dev; \
>>> -	u8 buf[HDMI_MAX_INFOFRAME_SIZE]; \
>>> +	u8 buf[HDMI_INFOFRAME_SIZE(MAX)]; \
>>>   	ssize_t len = 0; \
>>>   	\
>>>   	connector = filp->private_data; \
>>> diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
>>> index 3bb87bf6bc65..3a442a59919e 100644
>>> --- a/include/linux/hdmi.h
>>> +++ b/include/linux/hdmi.h
>>> @@ -59,6 +59,9 @@ enum hdmi_infoframe_type {
>>>   #define HDMI_DRM_INFOFRAME_SIZE    26
>>>   #define HDMI_VENDOR_INFOFRAME_SIZE  4
>>>   
>>> +/* The biggest infoframe size */
>>> +#define HDMI_MAX_INFOFRAME_SIZE		HDMI_DRM_INFOFRAME_SIZE
>> Thanks for that patch, it was definitely an oversight on my part. The
>> spec defines the max size of an infoframe to be 30 bytes, so we should
>> probably use that here?

Hmm, I think the spec (I'm looking at 1.3a, which I think is the latest 
freely available version from hdmi.org?) says a maximum length of 27 
bytes, not including the 3 byte header + the checksum byte. So I think 31?

I'm seeing this in section 5.3.5 / Table 5-14.

> Defining it like this allows the use of HDMI_INFOFRAME_SIZE(MAX) which
> adds the header size. Having some macros include the header size and
> some others not would be confusing, I think.
>
> Or then the whole thing needs to be renamed.

How about:

#define HDMI_MAX_INFOFRAME_SIZE 27

Then we can use HDMI_DRM_INFOFRAME_SIZE(MAX) to get 31

Would that be ok?

Thanks,
Derek

> BR,
> Jani.
>
>> Maxime
