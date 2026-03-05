Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJyNHgyuqWn+CAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 17:23:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B69215631
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 17:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5D110EC44;
	Thu,  5 Mar 2026 16:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gFLGnicT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC8410EC44
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 16:23:35 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so96621255e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 08:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772727814; x=1773332614; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xr85rovo5UV3Etw3oVSyYm7W2zGoR48MtrXiaczPwz0=;
 b=gFLGnicTJmXCtcsAURahY2c/ImbFhPKj26lwppl5cNTnG2J+4jo9RvzW4YoEfeV6Or
 TgROEEvkzKDzSmJlZDSTuBlzEyC2TxSspASAPhiIqHlsObte9+38ADkCAF8Ihwx0ZBDu
 AiK4ZbnKgyfwuMD2azRq6wZE3f2d8UdEBcZxsZeB0PaVe+9htvCDOmrzFZVgGgnBvcTx
 TWcdckjHFmpZQrWDBneOOPJK+uC6UPR5Mz3rUygn85X/XAEYVUUAcLGNkR4cepds/xsz
 y73ebBDEPNlHUjEIRkl2ee8bDoDhp+VQezD3wZcoTtLIDXOldR1vAr2g5Z9pHExMm37r
 cn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772727814; x=1773332614;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xr85rovo5UV3Etw3oVSyYm7W2zGoR48MtrXiaczPwz0=;
 b=qKaOO+VDXSGmeosTF6tFZAfA8ydH+HCjpc+BERfxWaFRO8hBsjNzumA0bXQIjMwPJw
 5lFX1ksD5obrJrxX4aA2bQkupmaN3/rEtdawRSMNixEPw4hfMpEAWCitt31TgMJyZQmf
 eijKVpRSHsnMoescFdUIJyB34uyAn114ogG9ViMFiA3VAbgdcW5KxsR5uceQ/MFEDAnJ
 si7SMJILgA0VHq7Y8oSqRpzLp/LpTU8BO0nGysUNV3tyTguoHyWRkmR74nbGLQAxE7sL
 ZSPLtDjxtA63fmq9kv7wUbnKpqvdFqTLpECPtgRMDanUViiqTu45KZarBdvfDzxGIHl0
 yitA==
X-Gm-Message-State: AOJu0YzF02LeQk0xfST+XXm4zGb9Yu40DzGoZhO7Za+xdvUuaUhgGPeh
 Bk7GNCaDmyDkABYRVdMIw1YnO7cJxpMb7PnJaxd6sXyDGZDx6NruQZ9G
X-Gm-Gg: ATEYQzwzMpZzRe0uCJ8xCNOyYAruQCN0fGnx4o/fukoYWafhxeqUgbBxCVBZ+6ikOcI
 jQDhmnt9tC9sV3SSW8aaH3CW7wGDsqUZo7Rplv9wKq+wyTUVkMcaoo1XSiCM5nVO1od+h0iwR/f
 7egdNb+bUoxxbOyTS7rjn6IqX//GCkgLermqhPDyDkR/BRyXLQ289cpPukW+VvUeNsAIhZshVH7
 3BbL/wPmOc2pPTh8DhpF7nQm80LmFaFGjx/xs0vT9CXXcjyG3iQ+Wj/mWPcwhc0MTHHoPecLXgQ
 XKd+uvotxe3al1CO2kslwYGgi76nNB5h04nTyGyMJ+DP382/E1tnsLQySF91jqnsqAK9EWT5Amp
 UYda+usVmpiPbQ6XUChHYyhjFQoO+DBNbmkISdo3FWcmVdOrtUvquSi2oZURuhw05JMLwGSkb3A
 9JPE0TxEl0ETkgvflE1vw1UeT7CTc9MwFfeAiqJ2iYORc17myGhWJGTatAoSg=
X-Received: by 2002:a05:600c:4e8b:b0:480:1d0b:2d32 with SMTP id
 5b1f17b1804b1-48519847bb7mr115427655e9.12.1772727813983; 
 Thu, 05 Mar 2026 08:23:33 -0800 (PST)
Received: from [10.247.12.125] ([129.234.0.168])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439ae3f31dbsm38967659f8f.1.2026.03.05.08.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 08:23:33 -0800 (PST)
Message-ID: <3167d5c6-3454-4652-86c7-e9ef0ef0a517@gmail.com>
Date: Thu, 5 Mar 2026 16:23:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/3] Querying errors from drm_syncobj
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 matthew.brost@intel.com
References: <20260225124609.968505-1-yiconghui@gmail.com>
 <3491d5f9-d08e-4193-a983-45340af73745@amd.com>
 <7300ad7c-39a5-4424-b4fd-9d3f97083f06@mailbox.org>
 <d215b326-6f17-405e-b9e2-9627c17db00d@amd.com>
From: Yicong Hui <yiconghui@gmail.com>
Content-Language: en-US
In-Reply-To: <d215b326-6f17-405e-b9e2-9627c17db00d@amd.com>
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
X-Rspamd-Queue-Id: 58B69215631
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:michel.daenzer@mailbox.org,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:tvrtko.ursulin@igalia.com,m:phasta@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:matthew.brost@intel.com,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com,igalia.com,kernel.org,linux.intel.com,suse.de,intel.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 2/25/26 1:57 PM, Christian König wrote:
> On 2/25/26 14:37, Michel Dänzer wrote:
>> On 2/25/26 14:25, Christian König wrote:
>>> On 2/25/26 13:46, Yicong Hui wrote:
>>>> This patch series adds 2 new flags, DRM_SYNCOBJ_QUERY_FLAGS_ERROR and
>>>> DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR for 3 ioctl operations
>>>> DRM_IOCTL_SYNCOBJ_QUERY, DRM_IOCTL_SYNCOBJ_WAIT and
>>>> DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT to allow them to batch-request error
>>>> codes from multiple syncobjs and abort early upon error of any of them.
>>>
>>> Patch #1 looks good enough to add my rb.
>>>
>>> Patch #2 looks good as well, but I'm not familiar enough with the code and have no time to wrap my head around it to give a review.
>>>
>>> Adding a few people on CC, maybe somebody has time to take another look.
>>>
>>>>
>>>> Based on discussions from Michel Dänzer and Christian König, and a
>>>> starter task from the DRM todo documentation.
>>>>
>>>> See https://gitlab.gnome.org/GNOME/mutter/-/issues/4624 for discussions
>>>> on userspace implementation.
>>>>
>>>> I have looked into adding sub test cases into syncobj_wait.c and
>>>> syncobj_timeline.c, igt-tests for this and I think I understand the
>>>> process for writing tests and submitting them, however, these ioctls
>>>> only trigger in the case that there is an error, but I am not sure what
>>>> is the best way to artifically trigger an error from userspace in order
>>>> to test that these ioctl flags work. What's the recommended way to
>>>> approach this?
>>>
>>> When Michel agrees that this is the way to go then we either need an in-kernel selftest (see directory drivers/gpu/drm/tests/) or an userspace IGT test.
>>>
>>> Not sure what is more appropriate, maybe somebody on CC has more experience with that.
>>
>> I'd advise against landing this in the kernel before there's a corresponding display server implementation making use of it, in a mergeable state.
> 
> Yeah we clearly have the rule that this can't be pushed into the kernel without userspace code as well.
> 
>> Otherwise you might end up with the kernel having to support UAPI which no real-world user space actually uses. Been there, done that myself.
>>
>>
>> I don't have the capacity to contribute anything more than advice at this point.
> 
> Oh that is sad. Do you know anybody who could work on that?
> 
> It is a clear improvement to error handling and I don't like to keep Yicong's work only on the mailing list.
> 
> Thanks,
> Christian.
> 

Hello

Is there anything else I can do? Or will we have to just leave all of this here unmerged

I have read the emails from Tvrtko and Matthew and I'm absolutely happy to send a v4 to ameliorate these issues, but there might not be a need to do so if the series won't get merged in the end

Regardless, thank you to Christian and all the maintainers for being welcoming and all your work reviewing this patch series so far!

Thanks
Yicong
