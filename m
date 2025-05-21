Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA56ABF90B
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 17:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F4D18B111;
	Wed, 21 May 2025 15:18:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UiV707An";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F16318B0F6;
 Wed, 21 May 2025 15:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CvdYKerDHmNMlOHDfBEif1LCoHW5CK6Ve9E47JRA324=; b=UiV707Anfw4FxyUfIIfSuvfglL
 JSMS9Aus6VK/4DKu9DCBDGzY77I7IpWQTY6mr4faSyyCl46m+5E6rzj4twy8m2pdKy3KsQPvK0QX/
 p/BJWyplWiHjbCHgg2Hby8t4x5qCkbx2hmPVgc5V8v9lv7K4Fe6RBuVuKYMuEshjyjO+t0wXm6oJB
 9zOscoSKevURZBW+VVIR0iLPH1UTLVdLAf5PFPI9B9xuREOHo5I1zM1xMB0nUsDoFx1La2rcu8yq9
 WumBS8h76eo8tetfe9WEVz+MuSwKB2E4I2krFOPI6SnJJVguGCXGEL6lLV8AxjJejMpHFf/3TkxKk
 TpeeXeYg==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uHlCg-00BGaE-Qz; Wed, 21 May 2025 17:17:59 +0200
Message-ID: <39acb89b-c376-4e12-aa86-2b78e8842334@igalia.com>
Date: Wed, 21 May 2025 12:17:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm: Create a task info option for wedge events
To: Raag Jadav <raag.jadav@intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20250520163243.328746-1-andrealmeid@igalia.com>
 <20250520163243.328746-2-andrealmeid@igalia.com>
 <aC2Yq89IL5tx8MY3@black.fi.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <aC2Yq89IL5tx8MY3@black.fi.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em 21/05/2025 06:11, Raag Jadav escreveu:
> On Tue, May 20, 2025 at 01:32:41PM -0300, André Almeida wrote:
>> When a device get wedged, it might be caused by a guilty application.
>> For userspace, knowing which task was the cause can be useful for some
>> situations, like for implementing a policy, logs or for giving a chance
>> for the compositor to let the user know what task caused the problem.
>> This is an optional argument, when the task info is not available, the
>> PID and TASK string won't appear in the event string.
>>
>> Sometimes just the PID isn't enough giving that the task might be already
>> dead by the time userspace will try to check what was this PID's name,
>> so to make the life easier also notify what's the task's name in the user
>> event.
> 
> ...
> 
>> -int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
>> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
>> +			 struct drm_wedge_task_info *info)
>>   {
>>   	const char *recovery = NULL;
>>   	unsigned int len, opt;
>> -	/* Event string length up to 28+ characters with available methods */
>> -	char event_string[32];
>> -	char *envp[] = { event_string, NULL };
>> +	char event_string[WEDGE_STR_LEN], pid_string[PID_LEN] = "", comm_string[TASK_COMM_LEN] = "";
>> +	char *envp[] = { event_string, NULL, NULL, NULL };
>>   
>>   	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
>>   
>> @@ -582,6 +586,13 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
>>   	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
>>   		 "but recovered through reset" : "needs recovery");
>>   
>> +	if (info && ((info->comm && info->comm[0] != '\0'))) {
> 
> Thanks for adding this. Should we check if pid > 0?
> 

Ack, added this for the v6.

> Also, I was wondering what if the driver only has info on one of the
> given members? Should we allow it to be flagged independently?

I think we can allow it, but for now I would say that we can wait for a 
driver that works like that to settle that.

> 
>> +		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
>> +		snprintf(comm_string, sizeof(comm_string), "TASK=%s", info->comm);
>> +		envp[1] = pid_string;
>> +		envp[2] = comm_string;
>> +	}
>> +
>>   	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
>>   }
>>   EXPORT_SYMBOL(drm_dev_wedged_event);
> 
> ...
> 
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index e2f894f1b90a..c13fe85210f2 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -30,6 +30,14 @@ struct pci_controller;
>>   #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>>   #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>>   
>> +/**
>> + * struct drm_wedge_task_info - information about the guilty app of a wedge dev
> 
> s/app/task, missed an instance ;)
> 
>> + */
>> +struct drm_wedge_task_info {
>> +	pid_t pid;
>> +	char *comm;
>> +};
> 
> Raag
> _______________________________________________
> Kernel-dev mailing list -- kernel-dev@igalia.com
> To unsubscribe send an email to kernel-dev-leave@igalia.com

