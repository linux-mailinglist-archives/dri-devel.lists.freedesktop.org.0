Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF6A68F736
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 19:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8EA10E80F;
	Wed,  8 Feb 2023 18:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BA110E80F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 18:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nacU/JDi15rC6nmxvm8dzQ4UV7QDpEfhH4X1Q4wTnd4=; b=EH6/vsatYbBrxsX8BZHyyEB17F
 hg7I4XJqAzQGaCmwmsliK0ytIClRsQErvMWuXKvBT8Vqyxva9MDlz0/kYDRqw/KbnoNnUqsX88/uO
 svUSpVEIosVqrWQrSiu62oOI4709uPFqVdjPUJkPn4HZJ510Le6wGZ+5NcBJVJgP4f99No5dO3+vk
 X0ghRmGUFz1ToozkbgJ6bDSAKcpQep/CYscccK1F8A+6QwJ+yZnpFI06GXmfP4UE8pH2JVVmAbYI8
 pamn1LvYeAAM4QyBxqc+lkG/jq6WmRql0TL9te6Luq/5+utcL0rqQZ6h76uJjgHEAaZ+oAcOJcYX4
 9qrgidOA==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pPpLh-00D9og-Of; Wed, 08 Feb 2023 19:39:18 +0100
Message-ID: <dc69aab6-2030-4304-ff86-15a9f2871aa2@igalia.com>
Date: Wed, 8 Feb 2023 15:39:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/6] drm/debugfs: Introduce wrapper for debugfs list
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230131195825.677487-1-mcanal@igalia.com>
 <20230131195825.677487-2-mcanal@igalia.com>
 <Y+Pkm3ORQAipa/iD@phenom.ffwll.local>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <Y+Pkm3ORQAipa/iD@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/8/23 15:06, Daniel Vetter wrote:
> On Tue, Jan 31, 2023 at 04:58:21PM -0300, Maíra Canal wrote:
>> Introduce a struct wrapper for all the debugfs-related stuff: the list
>> of debugfs files and the mutex that protects it. This will make it
>> easier to initialize all the debugfs list in a DRM object and will
>> create a good abstraction for a possible implementation of the debugfs
>> infrastructure for KMS objects.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/drm_debugfs.c  | 18 ++++++++++++++++++
>>   drivers/gpu/drm/drm_internal.h | 12 ++++++++++++
>>   include/drm/drm_debugfs.h      | 16 ++++++++++++++++
>>   3 files changed, 46 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>> index 4f643a490dc3..8658d3929ea5 100644
>> --- a/drivers/gpu/drm/drm_debugfs.c
>> +++ b/drivers/gpu/drm/drm_debugfs.c
>> @@ -218,6 +218,24 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
>>   }
>>   EXPORT_SYMBOL(drm_debugfs_create_files);
>>   
>> +struct drm_debugfs_files *drm_debugfs_files_init(void)
>> +{
>> +	struct drm_debugfs_files *debugfs_files;
>> +
>> +	debugfs_files = kzalloc(sizeof(*debugfs_files), GFP_KERNEL);
>> +
>> +	INIT_LIST_HEAD(&debugfs_files->list);
>> +	mutex_init(&debugfs_files->mutex);
>> +
>> +	return debugfs_files;
>> +}
>> +
>> +void drm_debugfs_files_destroy(struct drm_debugfs_files *debugfs_files)
>> +{
>> +	mutex_destroy(&debugfs_files->mutex);
>> +	kfree(debugfs_files);
>> +}
>> +
>>   int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>>   		     struct dentry *root)
>>   {
>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>> index ed2103ee272c..f1c8766ed828 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -23,6 +23,7 @@
>>   
>>   #include <linux/kthread.h>
>>   
>> +#include <drm/drm_debugfs.h>
>>   #include <drm/drm_ioctl.h>
>>   #include <drm/drm_vblank.h>
>>   
>> @@ -183,6 +184,8 @@ int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
>>   
>>   /* drm_debugfs.c drm_debugfs_crc.c */
>>   #if defined(CONFIG_DEBUG_FS)
>> +struct drm_debugfs_files *drm_debugfs_files_init(void);
>> +void drm_debugfs_files_destroy(struct drm_debugfs_files *debugfs_files);
>>   int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>>   		     struct dentry *root);
>>   void drm_debugfs_cleanup(struct drm_minor *minor);
>> @@ -193,6 +196,15 @@ void drm_debugfs_crtc_add(struct drm_crtc *crtc);
>>   void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
>>   void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
>>   #else
>> +static inline struct drm_debugfs_files *drm_debugfs_files_init(void)
>> +{
>> +	return NULL;
>> +}
>> +
>> +static inline void drm_debugfs_files_destroy(struct drm_debugfs_files *debugfs_files)
>> +{
>> +}
>> +
>>   static inline int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>>   				   struct dentry *root)
>>   {
>> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
>> index 7616f457ce70..423aa3de506a 100644
>> --- a/include/drm/drm_debugfs.h
>> +++ b/include/drm/drm_debugfs.h
>> @@ -32,6 +32,8 @@
>>   #ifndef _DRM_DEBUGFS_H_
>>   #define _DRM_DEBUGFS_H_
>>   
>> +#include <linux/list.h>
>> +#include <linux/mutex.h>
>>   #include <linux/types.h>
>>   #include <linux/seq_file.h>
>>   /**
>> @@ -79,6 +81,20 @@ struct drm_info_node {
>>   	struct dentry *dent;
>>   };
>>   
>> +/**
>> + * struct drm_debugfs_files - Encapsulates the debugfs list and its mutex
>> + *
>> + * This structure represents the debugfs list of files and is encapsulated
>> + * with a mutex to protect the access of the list.
>> + */
>> +struct drm_debugfs_files {
>> +	/** @list: List of debugfs files to be created by the DRM object. */
>> +	struct list_head list;
>> +
>> +	/** @mutex: Protects &list access. */
>> +	struct mutex mutex;
> 
> I'm not seeing any use for the mutex here? Also unless you also plan to
> put like the debugfs directory pointers in this struct, I'm not sure we
> need this abstraction since it's purely internal to debugfs code (so also
> should really be in the headers where drivers could perhaps come up with
> funny ideas).

Isn't this mutex needed to guarantee race-conditions safety when adding new
files to the list, as drm_debugfs_add_file() is called by the drivers? [1]

[1] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_debugfs.c#n343

Best Regards,
- Maíra Canal

> -Daniel
> 
>> +};
>> +
>>   /**
>>    * struct drm_debugfs_info - debugfs info list entry
>>    *
>> -- 
>> 2.39.1
>>
> 
