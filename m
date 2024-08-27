Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93581960740
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 12:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E364410E036;
	Tue, 27 Aug 2024 10:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C/a1NhNF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A2010E036
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 10:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724753971; x=1756289971;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8VKWLLbeZAeYH+2rnrrPq/vMikEhE+rvH7FhoQsRhkY=;
 b=C/a1NhNF2HWiiEASlKHHmOJFMM4b40gsdwH6TcfX8cAJ5T4tplbrMLWH
 mWfmPVZHAaW+rblFOXnU4AGVC2XTN/UK/eWbLFp30AR+pHPeov4jtFFoa
 OuDxygX7YKcmJeq2qivtkoGEMF7YJnhtI4Hb/nCb/N1Jn/klbpTplZorr
 uazjBhl3M4Orl5H+ud5gP3BSMKj9R+mrVPcX91tLxjnos6ok9Hl0s4x3u
 8/nJ60Ji/eMWFUDeH4ClGZoE2A7CnGBHE6VolnICb+C/Slxmp7bcK62rY
 sgZO89QjqmAMvuKp52i8lP5CUPEXh4FvSIFAaueA4+GvHSpY9gkkAWFC/ g==;
X-CSE-ConnectionGUID: FxvTi6AsRsaeW4TWPIPOGQ==
X-CSE-MsgGUID: 0yxplqjORKGrKhn+tFcGhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="34631731"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="34631731"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 03:19:27 -0700
X-CSE-ConnectionGUID: HFnlm7USSi6nBjUHXXu6Yg==
X-CSE-MsgGUID: NAKLiQg1SPm6t77F5PTCjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="62877187"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.226])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 03:19:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>, Derek Foreman
 <derek.foreman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3] drm/connector: hdmi: Fix writing Dynamic Range
 Mastering infoframes
In-Reply-To: <20240827-bison-of-utter-resistance-be54df@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240826121029.491976-1-derek.foreman@collabora.com>
 <20240827-bison-of-utter-resistance-be54df@houat>
Date: Tue, 27 Aug 2024 13:19:21 +0300
Message-ID: <87plpuz2s6.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Aug 2024, Maxime Ripard <mripard@kernel.org> wrote:
> Hi,
>
> On Mon, Aug 26, 2024 at 07:10:11AM GMT, Derek Foreman wrote:
>> The largest infoframe we create is the DRM (Dynamic Range Mastering)
>> infoframe which is 26 bytes + a 4 byte header, for a total of 30
>> bytes.
>> 
>> With HDMI_MAX_INFOFRAME_SIZE set to 29 bytes, as it is now, we
>> allocate too little space to pack a DRM infoframe in
>> write_device_infoframe(), leading to an ENOSPC return from
>> hdmi_infoframe_pack(), and never calling the connector's
>> write_infoframe() vfunc.
>> 
>> Instead of having HDMI_MAX_INFOFRAME_SIZE defined in two places,
>> replace HDMI_MAX_INFOFRAME_SIZE with HDMI_INFOFRAME_SIZE(MAX) and make
>> MAX the same size as the DRM infoframe.
>> 
>> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
>> ---
>>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 +---
>>  drivers/gpu/drm/drm_debugfs.c                   | 4 +---
>>  include/linux/hdmi.h                            | 3 +++
>>  3 files changed, 5 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> index 7854820089ec..feb7a3a75981 100644
>> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> @@ -521,8 +521,6 @@ int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
>>  }
>>  EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
>>  
>> -#define HDMI_MAX_INFOFRAME_SIZE		29
>> -
>>  static int clear_device_infoframe(struct drm_connector *connector,
>>  				  enum hdmi_infoframe_type type)
>>  {
>> @@ -563,7 +561,7 @@ static int write_device_infoframe(struct drm_connector *connector,
>>  {
>>  	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
>>  	struct drm_device *dev = connector->dev;
>> -	u8 buffer[HDMI_MAX_INFOFRAME_SIZE];
>> +	u8 buffer[HDMI_INFOFRAME_SIZE(MAX)];
>>  	int ret;
>>  	int len;
>>  
>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>> index 6b239a24f1df..9d3e6dd68810 100644
>> --- a/drivers/gpu/drm/drm_debugfs.c
>> +++ b/drivers/gpu/drm/drm_debugfs.c
>> @@ -520,8 +520,6 @@ static const struct file_operations drm_connector_fops = {
>>  	.write = connector_write
>>  };
>>  
>> -#define HDMI_MAX_INFOFRAME_SIZE		29
>> -
>>  static ssize_t
>>  audio_infoframe_read(struct file *filp, char __user *ubuf, size_t count, loff_t *ppos)
>>  {
>> @@ -579,7 +577,7 @@ static ssize_t _f##_read_infoframe(struct file *filp, \
>>  	struct drm_connector *connector; \
>>  	union hdmi_infoframe *frame; \
>>  	struct drm_device *dev; \
>> -	u8 buf[HDMI_MAX_INFOFRAME_SIZE]; \
>> +	u8 buf[HDMI_INFOFRAME_SIZE(MAX)]; \
>>  	ssize_t len = 0; \
>>  	\
>>  	connector = filp->private_data; \
>> diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
>> index 3bb87bf6bc65..3a442a59919e 100644
>> --- a/include/linux/hdmi.h
>> +++ b/include/linux/hdmi.h
>> @@ -59,6 +59,9 @@ enum hdmi_infoframe_type {
>>  #define HDMI_DRM_INFOFRAME_SIZE    26
>>  #define HDMI_VENDOR_INFOFRAME_SIZE  4
>>  
>> +/* The biggest infoframe size */
>> +#define HDMI_MAX_INFOFRAME_SIZE		HDMI_DRM_INFOFRAME_SIZE
>
> Thanks for that patch, it was definitely an oversight on my part. The
> spec defines the max size of an infoframe to be 30 bytes, so we should
> probably use that here?

Defining it like this allows the use of HDMI_INFOFRAME_SIZE(MAX) which
adds the header size. Having some macros include the header size and
some others not would be confusing, I think.

Or then the whole thing needs to be renamed.

BR,
Jani.

>
> Maxime

-- 
Jani Nikula, Intel
