Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AF5BB5D5E
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 04:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EC210E00E;
	Fri,  3 Oct 2025 02:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="js/V9TAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C0110E00E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 02:54:56 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-3324523dfb2so1524337a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Oct 2025 19:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759460096; x=1760064896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uj+HsnSbfmp0p/fW3brW5cAZgBwxJkwcNWmslQDo1G4=;
 b=js/V9TAFbXxh4bihq6jw8IYDwQnXa+SdbDt7+ntYVYCUL85SM9ENwYfvxukh0UGa3M
 u3WM8FMDkFw9GZd0odD2H9UpDOAveQk72XR2qa2wKREW5LMw1v4whM502T6CNhcW0Z6a
 H8sGqh2Eu34Lg5DPkxSZX8RsKwdaU4pv8FtH2BnH34tpSVlHvOIe7DuWWHF/BhqFeBNg
 FlDlkqhkzPhZgvm8FN8FQp+ygenxCM1naJCMe2MJexjImnH5f7/MnqC9CxZzNJk0L6ZA
 MjyuH7V1/vDbOsjw642m99SxSl4UfuF2F8fqjhDVc8b1AdgFBCk7ViKKVDfGWMJJY5vv
 Xqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759460096; x=1760064896;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uj+HsnSbfmp0p/fW3brW5cAZgBwxJkwcNWmslQDo1G4=;
 b=UoafwonE141JLgoY3uGFOfUyKXQMY8NlegmWG1xC/M56SdjMgglUrhPpEJE/cLiRYM
 DwRzzFkrRdTDRVwLKvclpj7LftpCUGjjUR9O7WZs95m5fJIKatd2cahFUeQwygj6MiUO
 IMWo3Hlal4YJ6sk8lKDOe9G6lZpAEewZ8IoStxjngqAjNi/ue7wAzHF0r3h4wXvrn+xY
 6RU9peXPE3PTFwfheUqcBdUS8dhJL3DXCDFVH7yd2MKflin8INg+e29gEh9V8BnMeNlS
 KcQLjFRlxwOabqmSKD7Gc9Jp/lU938aUolxhdEeSgSzzBVL4YEBI4sjdf/aKXqiggEwk
 2S7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO5+2X5lkFu0CDtnvNU8xvR+L0I2ZLIe+knOEK1xI5UOpPaUhdhdFdUBc/RhDYknlMCrVlmJKerOQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvG1YFSJzQ67v3YlTeT4gs/DAqgtKvugszzSNO+/liYTSbqOwC
 yIjsBUpFZjRcdTFZ681yjyDF4misq8wBJ6P3/Ysqybcd95fZX6ZhRFAb
X-Gm-Gg: ASbGncuvlxzlGOJtfrhlaQUA+Kl+n1RuE18RRvHbN0aaJLgWalLahb6VOlDpR0BL1rk
 l64n6NkxPXLXEClHtRLiG7ruNvntMC3vdVXgQqw7AkRCe9YL7pYZFYWVp5Et1thAd+gbXrE9eyW
 OQaFVJvwfKI1iVvCqYN37xaovUfzi9ii6NdmYNoYBDFzNmSllTG/ANtTDr55hU33tPY71EpHSC7
 /eVKXRDbODInj09JXnIiZZrg513hrpPll74sjTeqH6NGCTrKKaDYbeZa4LuiWQIGmmGeUs4wQV3
 IE6J44Fo3eAmYcmymf+bNJnR1yYkvL98q3/IQY+vwvPzV7mVuNMAz5EW4AlbZl7KEuB2LGlCLTX
 3+TX421KfMNwTqvBgFzubAI2/tUBbB84bRDSlxy6gF0muhto43K9Iwuqx/A6qHioeNAz9y6ECAl
 SPe65hj6dVkyf0GujVfeB5
X-Google-Smtp-Source: AGHT+IEVKNL0o4ldDH2FRH6zfpnRFEkoscOaBC54PgbA7oSF06twsPqHvysrSkFLtlowFRvbJJ2E8w==
X-Received: by 2002:a17:90b:4b4f:b0:327:734a:ae7a with SMTP id
 98e67ed59e1d1-339c2732dbbmr1531840a91.11.1759460096299; 
 Thu, 02 Oct 2025 19:54:56 -0700 (PDT)
Received: from ?IPV6:2601:1c0:5780:9200:326a:8939:a05c:b9d5?
 ([2601:1c0:5780:9200:326a:8939:a05c:b9d5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-339c4a324ccsm516382a91.18.2025.10.02.19.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 19:54:55 -0700 (PDT)
Message-ID: <318392fd-9700-4570-bb39-31a4d08bd4a9@gmail.com>
Date: Thu, 2 Oct 2025 19:54:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/vblank: downgrade vblank wait timeout from WARN to
 debug
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: maarten.lankhorst@linux.intel.com, maxime.ripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
References: <20251002025723.9430-1-chintanlike@gmail.com>
 <aN5klZdl2MZdPSpU@intel.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <aN5klZdl2MZdPSpU@intel.com>
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



On 10/2/25 04:40, Ville Syrjälä wrote:
> On Wed, Oct 01, 2025 at 07:57:23PM -0700, Chintan Patel wrote:
>> When wait_event_timeout() in drm_wait_one_vblank() times out, the
>> current WARN can cause unnecessary kernel panics in environments
>> with panic_on_warn set (e.g. CI, fuzzing). These timeouts can happen
>> under scheduler pressure or from invalid userspace calls, so they are
>> not always a kernel bug.
> 
> "invalid userspace calls" should never reach this far.
> That would be a kernel bug.
> 
>>
>> Replace the WARN with drm_dbg_kms() messages that provide useful
>> context (last and current vblank counters) without crashing the
>> system. Developers can still enable drm.debug to diagnose genuine
>> problems.
>>
>> Reported-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
>> Tested-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
>>
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>>
>> v2:
>>   - Drop unnecessary in-code comment (suggested by Thomas Zimmermann)
>>   - Remove else branch, only log timeout case
>> ---
>>   drivers/gpu/drm/drm_vblank.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
>> index 46f59883183d..a94570668cba 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -1289,7 +1289,7 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
>>   {
>>   	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
>>   	int ret;
>> -	u64 last;
>> +	u64 last, curr;
>>   
>>   	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>>   		return;
>> @@ -1305,7 +1305,12 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
>>   				 last != drm_vblank_count(dev, pipe),
>>   				 msecs_to_jiffies(100));
>>   
>> -	drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", pipe);
>> +	curr = drm_vblank_count(dev, pipe);
>> +
>> +	if (ret == 0) {
>> +		drm_dbg_kms(dev, "WAIT_VBLANK: timeout crtc=%d, last=%llu, curr=%llu\n",
>> +			pipe, last, curr);
> 
> It should at the very least be a drm_err(). Though the backtrace can
> be useful in figuring out where the problem is coming from, so not
> too happy about this change.


Thanks Ville for the feedback.I am still learning as I am new here!

You’re right, “invalid userspace calls” was a poor choice of wording —
I’ll drop that from the commit message. The main goal is to avoid
unnecessary panics in fuzzing/CI with panic_on_warn, while still
reporting the error clearly.

I’ll update the patch to use drm_err() instead of drm_dbg_kms(), and
drop the extra drm_vblank_count() call per Thomas’ earlier comment.

Best regards,
Chintan
