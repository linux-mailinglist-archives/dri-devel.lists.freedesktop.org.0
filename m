Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB123DB4E1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 10:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E07F89DA3;
	Fri, 30 Jul 2021 08:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE1AA89DA3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 08:06:50 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so13237509pjh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 01:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zm9ze6NcDMmKTtzUJRmbUQg85ybXUDcN1daZdih1WjE=;
 b=onZBHEQbJavX+A5KRaetjgjzUwDmd3WCx9N9tbq25vGwq8nGrSKPYOUZvsmHEyOmWZ
 M+OOTZh5N2bVPdOJKKUW0J6lyGyB/gqr98pG3kRWp6HVtXZtkS3klXocUCX+WCWIt8oD
 +6eXSNqMZPOHcBKpetSx0mhW+ZpAp4LEt9PFIRVm/NHWfWJXAsy73etXU6K85KQHqWLb
 JaycqPhwfCq4En3t7KTHKtpBJWWDjmhnH8ugeLZwoW4SCKMBPDZWv3g69zS2Txoyi3z0
 /ajIPha64CrownvM58gbSPAOQ7kcQVbDTAw8K5AVvnznWduE+XeeQTiQbAed6jWcke8j
 jweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zm9ze6NcDMmKTtzUJRmbUQg85ybXUDcN1daZdih1WjE=;
 b=meFdOTHJXD0hywyv0GKroB9VkvPMw/x5ZU8gG7hKvUytRlemJrsyOf4tydhdMpxWfZ
 aTF/8bpcUE/0u/3IoGfz3q5cIkQFZDZEghiBUcAERx6AOwtGLp4ijp0V6g+OfYjRiJ6W
 WVVrbtn+9m/99S1osqRFLaqxRw0YNAkM5KVSDAn2/Bwci3pdKRdv2x6V8/4vS4PzYKm6
 q7XADkeTskd++sE4I+K2dwxeVF4bpjRRy18cH9NHzLQvCkj1jNde8XLvikpRbbg3OeFf
 bNNMCQeXsueFsf/cxtZYssHrNolKMS6tAqZhmSqsxknveXYX6fMiGoumjiIHMY6YcWDQ
 VqSw==
X-Gm-Message-State: AOAM532qzjZ1W5Do7goncOpc9qXn4pr7FxXyadzbavQ1Dr1b4NnMs6IH
 nHCSdab029/JMzc2Wu0vda4=
X-Google-Smtp-Source: ABdhPJyjRArgqkf3xuf3FtJ1loWdS7BbIoDktTv4OVnTPGAPLzlWFDLZqp+Y+Y7pidu7lZiihP0LDQ==
X-Received: by 2002:a63:5506:: with SMTP id j6mr1211210pgb.19.1627632410498;
 Fri, 30 Jul 2021 01:06:50 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id e8sm1295050pfm.218.2021.07.30.01.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 01:06:49 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm: add lockdep assert to
 drm_is_current_master_locked
To: Boqun Feng <boqun.feng@gmail.com>
References: <20210730041515.1430237-1-desmondcheongzx@gmail.com>
 <20210730041515.1430237-3-desmondcheongzx@gmail.com>
 <YQOXTW8kSHdNjhiY@boqun-archlinux>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <35518f4b-5e4a-b284-1f86-5cba64941211@gmail.com>
Date: Fri, 30 Jul 2021 16:06:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQOXTW8kSHdNjhiY@boqun-archlinux>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
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
Cc: tzimmermann@suse.de, airlied@linux.ie, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com,
 dri-devel@lists.freedesktop.org, skhan@linuxfoundation.org, longman@redhat.com,
 will@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/7/21 2:08 pm, Boqun Feng wrote:
> On Fri, Jul 30, 2021 at 12:15:15PM +0800, Desmond Cheong Zhi Xi wrote:
>> In drm_is_current_master_locked, accessing drm_file.master should be
>> protected by either drm_file.master_lookup_lock or
>> drm_device.master_mutex. This was previously awkward to assert with
>> lockdep.
>>
>> Following patch ("locking/lockdep: Provide lockdep_assert{,_once}()
>> helpers"), this assertion is now convenient so we add it in.
>>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> ---
>>   drivers/gpu/drm/drm_auth.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>> index 9c24b8cc8e36..6f4d7ff23c80 100644
>> --- a/drivers/gpu/drm/drm_auth.c
>> +++ b/drivers/gpu/drm/drm_auth.c
>> @@ -63,9 +63,9 @@
>>   
>>   static bool drm_is_current_master_locked(struct drm_file *fpriv)
>>   {
>> -	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
>> -	 * should be held here.
>> -	 */
>> +	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
>> +			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
>> +
> 
> I think it's better to also add the lockdep_assert() of & (i.e. both
> held) in the updater side, and have comments pointing to each other.
> 
> Is it convenient to do in this patchset? If the updater side doesn't
> need to put the lockdep_assert() (maybe the lock acquire code and the
> update code are in the same function), it's still better to add some

Thanks for the feedback, Boqun.

Yeah, I think the updater side maybe doesn't need new lockdep_assert()
because what currently happens is either

	lockdep_assert_held_once(&dev->master_mutex);
	/* 6 lines of prep */
	spin_lock(&fpriv->master_lookup_lock);
	fpriv->master = new_value;
or
	mutex_lock(&dev->master_mutex);
	/* 3 lines of checks */
		spin_lock(&file_priv->master_lookup_lock);
		file_priv->master = new_value;

> comments like:
> 
> 	/*
> 	 * To update drm_file.master, both drm_file.master_lookup_lock
> 	 * and drm_device.master_mutex are needed, therefore holding
> 	 * either of them is safe and enough for the read side.
> 	 */
> 
> Just feel it's better to explain the lock design either in the
> lockdep_assert() or comments.
> 

But clarifying the lock design in the documentation sounds like a really
good idea.

Probably a good place for this would be in the kerneldoc where we also
explain the lifetime rules and usage of the pointer outside drm_auth.c:

diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 726cfe0ff5f5..a3acb7ac3550 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -233,6 +233,10 @@ struct drm_file {
  	 * this only matches &drm_device.master if the master is the currently
  	 * active one.
  	 *
+	 * To update @master, both &drm_device.master_mutex and
+	 * @master_lookup_lock need to be held, therefore holding either of
+	 * them is safe and enough for the read side.
+	 *
  	 * When dereferencing this pointer, either hold struct
  	 * &drm_device.master_mutex for the duration of the pointer's use, or
  	 * use drm_file_get_master() if struct &drm_device.master_mutex is not

Best wishes,
Desmond

> Regards,
> Boqun
> 
>>   	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
>>   }
>>   
>> -- 
>> 2.25.1
>>

