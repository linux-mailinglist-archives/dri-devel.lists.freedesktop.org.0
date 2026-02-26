Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAH/BHVJoGkuhwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:24:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703861A668E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:24:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6CB10E92B;
	Thu, 26 Feb 2026 13:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="iIeyVDLj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA77B10E027
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 13:23:59 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-4836e3288cdso5722925e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 05:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1772112238; x=1772717038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FbPaxgJ9Papd5EoEgU5/eN0jaxCZaeNgsz2Mtu/e7NU=;
 b=iIeyVDLjT+0n+zdnHfSgHwMc0RFYokKgOsLIsrurLdgziVNRmt2oVIqfyaFHfZV7om
 J+TUUStRi5YK03/qcYc67vZJEiuoMFkJlAvd2GuoVLdbhDoIFg74YZjXWjQAzmjbbjhx
 FWys32P+xppPRQKP28B6r0b8JTFnE4VXq6kJUWaNzYXWybIPoX0sOyTn+flNR8cTXvLS
 0JcqM1jq+ltnpe8nfKdkHqnEpLQ7DJJEmb0VyX+3LDQTJGdTxr83bSPbILNSZu/msNGw
 ntl66JPhmKYB/LRWPG5tbrh0gR7ABtSvd8Q+RdEaMzlKI5Scu8bIg8A9og1LY/b9eZz/
 wfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772112238; x=1772717038;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FbPaxgJ9Papd5EoEgU5/eN0jaxCZaeNgsz2Mtu/e7NU=;
 b=h9+5/8h49T7NHeJqxYigVMLSP0MZmgWaN0l1kV//bM1nb7V+fdpSHa3PCYS0RAx6FE
 fku9Sx84PYAHV3LF/8aw7ssFbJABkoWHsZSAeJL4bHTERvbw2nog29c/raYVjdLxrHaT
 QeXHIj4c0PNZMWrflnwgvASumSJTX9wJ53k43SpTeEChX7oY2maJDLKaELeEk0QoQmQz
 UlSkg3W8fKjN8zzyv681OJyj2lVdkqoYdbWz7SbeXePIEVkf+M9sX7DjeSz3uV+XXyRk
 znLvA29MtXiKIYRqcjKAG9+8hXaUD7sreAJt3kq8eCO2hovhYJSIoZQeZ4yAlFyy6Ck+
 RUkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTCd7Xg8x5Rjh3H6Nifu10QrQwk1sJ33mD2XzDgdeFVR5fpAt5+/ofLAB5zzFrfajsmeL+ipnO/UA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEMRDHLOM5HS2KKcLyDGlVtyPuzCvjrzrrI4BgKnJrNlkNlCh5
 Lq6SpDQkg645XefIaqSTEfDdDp6tnQOxNpE/b/BdKwwjMcsGqjYuaz0Jdkv0zPBrj60=
X-Gm-Gg: ATEYQzyspp5uyhzJAXIKeh43cTzljzHpBvtQsAM357cMYUZeVsfq2bg1DxWYnD57tF3
 Z7Arh7P+9CjcHZsCvbEVDUPGBa63I1EI+ILFo+JmV/tNCBQVqR1wQF4tiaVRITnXYm1P59Fkwwg
 wbQXZMcuWNYQ20H8BXHfUmHLIHbIAefo5Zh37QqJ+R0uojLmS8+2yLWh07VlhYL1IzdlSaDTgGv
 0XIYhs4103D14ivLpWTNEJr5wT3XDrzkEVqMSU43+0kyqmlCaMY+YjPMDoXiXkIGJi2jd1LQNyj
 CbTMHEDuoIgBBRinaBnqRxBPUelOodN5gA6lZ9rj7kbBRgn91qutEmonoc6Xj1Cuk8RlvX67nwF
 m8+fOQE5WrwLZ5QSwK6D1nJKvUnnMX66k6fTphpbf1N3wOIVbiod4K4VxxwOwXwztz83bvOwkVd
 +TVHr32V9voIWp1VZRdCC7xeofIWsrbF2H7s7d0I+WaNjW
X-Received: by 2002:a05:600c:1e8f:b0:47e:e051:79ee with SMTP id
 5b1f17b1804b1-483c33c28f9mr46239545e9.3.1772112237874; 
 Thu, 26 Feb 2026 05:23:57 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd68826asm228997005e9.0.2026.02.26.05.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 05:23:57 -0800 (PST)
Message-ID: <6e9ae259-3830-4d1d-bedc-fbd58c5bae35@ursulin.net>
Date: Thu, 26 Feb 2026 13:23:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tests: Mark slow tests as slow
To: phasta@kernel.org, Maxime Ripard <mripard@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthew Auld <matthew.auld@intel.com>,
 Arun Pravin <arunpravin.paneerselvam@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20260224110310.1854608-1-mripard@kernel.org>
 <1c76b8d6-9394-4017-a18f-95ecc2c08175@ursulin.net>
 <20260226-certain-tuscan-caribou-ba4c5e@penduick>
 <e343e45b-6328-4a38-ad31-1487e273f12a@ursulin.net>
 <595ce86b8a91f18ab8c73295a4a89c8f9353a794.camel@mailbox.org>
 <1d6a5850-117c-4586-aeae-9f22a96aefab@ursulin.net>
 <142389ed41fd83f94419ceecca9aa55f131494be.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <142389ed41fd83f94419ceecca9aa55f131494be.camel@mailbox.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:mripard@kernel.org,m:matthew.brost@intel.com,m:dakr@kernel.org,m:christian.koenig@amd.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:simona.vetter@ffwll.ch,m:airlied@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[ursulin.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,amd.com,linux.intel.com,suse.de,ffwll.ch,gmail.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ursulin.net:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 703861A668E
X-Rspamd-Action: no action


On 26/02/2026 13:17, Philipp Stanner wrote:
> On Thu, 2026-02-26 at 13:02 +0000, Tvrtko Ursulin wrote:
>>
>> On 26/02/2026 12:48, Philipp Stanner wrote:
>>> On Thu, 2026-02-26 at 12:42 +0000, Tvrtko Ursulin wrote:
>>>>
>>>> On 26/02/2026 10:56, Maxime Ripard wrote:
>>>>
>>>>
>>>
>>> […]
>>>
>>>>>>>      	{}
>>>>>>>      };
>>>>>>>      static struct kunit_suite drm_sched_priority = {
>>>>>>>      	.name = "drm_sched_basic_priority_tests",
>>>>>>> @@ -544,11 +544,11 @@ static void drm_sched_test_credits(struct kunit *test)
>>>>>>>      	drm_mock_sched_entity_free(entity);
>>>>>>>      	drm_mock_sched_fini(sched);
>>>>>>>      }
>>>>>>>      static struct kunit_case drm_sched_credits_tests[] = {
>>>>>>> -	KUNIT_CASE(drm_sched_test_credits),
>>>>>>> +	KUNIT_CASE_SLOW(drm_sched_test_credits),
>>>>>>
>>>>>> Same really.
>>>>>>
>>>>>> Anyway, the scheduler parts LGTM and I can follow up trying to optimise
>>>>>> these two later.
>>>>>>
>>>>>> For the scheduler:
>>>>>>
>>>>>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>
>>>>> Thanks!
>>>>
>>>> I have a patch already which makes those (and one more) test cases
>>>> faster, but I will wait sending it until you merge this one.
>>>
>>> And why would we want to flag a test as slow just to immediately
>>> afterwards make it faster?
>>>
>>> Would it not be wiser to drop Maxime's change?
>>
>> Just so he doesn't have to respin, or that we don't end up merging my
>> patch on top of the test already marked as slow. I am okay either way.
> 
>  From my POV Maxime can decide that.
> 
> But if your speed-up patches go in after, they should probably remove
> the marker again, shouldn't they?

Yes, that's why I said I was sitting on the patch.

Regards,

Tvrtko

