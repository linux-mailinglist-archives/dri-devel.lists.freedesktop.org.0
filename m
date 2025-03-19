Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2B2A68B5A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 12:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4C510E301;
	Wed, 19 Mar 2025 11:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BUXMV0BP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F8610E301;
 Wed, 19 Mar 2025 11:23:57 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso20576315e9.3; 
 Wed, 19 Mar 2025 04:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742383436; x=1742988236; darn=lists.freedesktop.org;
 h=in-reply-to:from:content-language:references:to:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=vA8o3ZLig4WOMxLPfsqVkYd14wxaodkHbkqzfdxOaAk=;
 b=BUXMV0BPlytngAmxSevCfplUvOYRelrS9E/sybJJ28d9Qd6ciG081Kv7erE4TwMnKt
 0FuNXAndt6+MIxPETkkptY6fFlG6IdAzU7HOX9DV2KBAJXZWM6wiBmid6OZmxWaj/Nja
 uO1NSbNHxZGpRFet9yhA4wW/tnMEuzP/noi5r4zS0j0GqTgeE0d0lvDo9gES9m79fM+h
 0byJRJKSwT3jYlOKagAASqBPYHWJzpxlJq3IT7FXDd3t2Zdv167nKTsnvIXwHgpJaBPw
 5jADNLka1PSPOemN/Xk15RiFnw8Spju2ewy2JtYFHrDKUyXLnU5g2ODdFkiqhskJWIea
 zm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742383436; x=1742988236;
 h=in-reply-to:from:content-language:references:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vA8o3ZLig4WOMxLPfsqVkYd14wxaodkHbkqzfdxOaAk=;
 b=ZtfWHjyh1zSaEVmGo6l1n72AJJHG145E/tH6YlGDoYbnEZYe2jD/FzBfcCemeJn7wA
 ii974sYar6MBOKgw0ejWuoJFpb+ZWaKV0JHSa5I+3M/l0Om3VWZ1x5LV7CZ3MTxMs9S6
 Llp3w6kwjuvsvlXWASvh90Q6eHXuONEMbXl6+oxZxyLU7oV3ln84QD+iOj2diRuoHs75
 794km0plAmMMC2hmrXYV2rWADndnkPUVpHDR2mAJS0rzvM1GRni3DxIKqGpjce0GPe5T
 obL9src9fyGfuj6FL5trMgBMOMqo5OsAm7ENSOrg7sK/NAiRFfzuK3x6Nz5a3rdzYPZV
 z5QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXWdl9snqpZeSvxxA3Y+tRK5yGKKryAPQHWbfRZB+CIMivqs6AuqZqeneNw8T0IS6KpvCcKQ7cuo6G@lists.freedesktop.org,
 AJvYcCXBi7VRNw+eXm0afyaeNfIXpMqAMxFIPewU3XP4JimfALzVyf9OxZ+4oqL4qkoYnYZPRRVROXou@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMbZCsUWjXs2S2TAMUxFW6rCuL6LD2uhgEEte0ZKwlWc5J9nMD
 QvrEdGfJ1JVEho+Nx6bF7vfBcdLwh9Wmipu80gMSRIOi2gi1BksQE1kDUqnR
X-Gm-Gg: ASbGnctwu2/bP445D44qh1lYhzh429LKyZwg6bekKNdxCeKT5gd95ZliwQ7RcMLiHDB
 K8OvkHVfQ7ud5zRQLIfqzX+TnCiUvww5rbiwHnzPKTjweRPjWXRxQ8mwcra9WEduYTMas81f//G
 8q94amhaD/HEPIQidW1ji/YThhXDM22ExeT2j7M1AvAkMdlMMhFZPQTnmVaYVj+YpAccHcnhnGX
 7ca7rx5hXneWbeTbNaUQQJQAM+k8POChody5RyekGv0VESD/A/u8Wp2Srrx9ZOBF3J/dUsQc0XW
 OAIoTVt2koRCkPmF75jIOCHfIZMq0JIKvbXUXcmBe3tIJZ8OR1DgNCSp1H8+70EyzZD1VaIDUQ=
 =
X-Google-Smtp-Source: AGHT+IF/pIGLRLLFxCz0BPL+ZnMOMwuPy3+45oV9Co/RUjar493GWh7fAGrTW8XmkTKkRYk/FlSupQ==
X-Received: by 2002:a05:600c:5107:b0:43c:f597:d584 with SMTP id
 5b1f17b1804b1-43d43899ffcmr21387435e9.29.1742383435778; 
 Wed, 19 Mar 2025 04:23:55 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f556a4sm15924075e9.22.2025.03.19.04.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 04:23:55 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------WFALB1e7gBmVlHU7xpbTHiQd"
Message-ID: <48f07793-0fd4-4cdd-8568-3bd2ff63bb6a@gmail.com>
Date: Wed, 19 Mar 2025 12:23:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: add drm_sched_prealloc_dependency_slots
To: phasta@kernel.org, tvrtko.ursulin@igalia.com,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20250318120313.19099-1-christian.koenig@amd.com>
 <20250318120313.19099-2-christian.koenig@amd.com>
 <769f6c5788eff9459414b8ce0b056989e29773af.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <769f6c5788eff9459414b8ce0b056989e29773af.camel@mailbox.org>
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

This is a multi-part message in MIME format.
--------------WFALB1e7gBmVlHU7xpbTHiQd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

>> + *
>> + * Return:
>> + * 0 on success, or an error on failing to expand the array.
>> + */
>> +int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job
>> *job,
>> +					    unsigned int num_deps)
>> +{
>> +	struct dma_fence *fence;
>> +	u32 id = 0;
>> +	int ret;
>> +
>> +	while (num_deps--) {
>> +		fence = dma_fence_get_stub();
>> +		ret = xa_alloc(&job->dependencies, &id, fence,
>> xa_limit_32b,
>> +			       GFP_KERNEL);
> So this would fill the xarr with already signaled fences which then
> later will be replaced with unsignaled fences?

Yes, exactly that's the idea.

> Help me out here: would it also work to add NULL instead of that stub-
> fence?

Good question, idk. That's an implementation detail of the xarray.

Tvrtko also correctly pointed out that it is most likely a bad idea to use dma_fence_is_signaled() in the critical code path.

I will try to dig through the xarray behavior up and update the patch if possible.

Thanks,
Christian.

--------------WFALB1e7gBmVlHU7xpbTHiQd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
cite="mid:769f6c5788eff9459414b8ce0b056989e29773af.camel@mailbox.org">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+ *
+ * Return:
+ * 0 on success, or an error on failing to expand the array.
+ */
+int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job
*job,
+					    unsigned int num_deps)
+{
+	struct dma_fence *fence;
+	u32 id = 0;
+	int ret;
+
+	while (num_deps--) {
+		fence = dma_fence_get_stub();
+		ret = xa_alloc(&amp;job-&gt;dependencies, &amp;id, fence,
xa_limit_32b,
+			       GFP_KERNEL);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
So this would fill the xarr with already signaled fences which then
later will be replaced with unsignaled fences?</pre>
    </blockquote>
    <br>
    Yes, exactly that's the idea.<br>
    <br>
    <blockquote type="cite"
cite="mid:769f6c5788eff9459414b8ce0b056989e29773af.camel@mailbox.org">
      <pre class="moz-quote-pre" wrap="">Help me out here: would it also work to add NULL instead of that stub-
fence?</pre>
    </blockquote>
    <br>
    Good question, idk. That's an implementation detail of the xarray.<br>
    <br>
    Tvrtko also correctly pointed out that it is most likely a bad idea
    to use dma_fence_is_signaled() in the critical code path.<br>
    <br>
    I will try to dig through the xarray behavior up and update the
    patch if possible.<br>
    <br>
    Thanks,<br>
    Christian.<br>
    <br>
  </body>
</html>

--------------WFALB1e7gBmVlHU7xpbTHiQd--
