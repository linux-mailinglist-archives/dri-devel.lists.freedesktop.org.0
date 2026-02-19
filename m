Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2O8PIzVWlmnrdwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 01:15:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0F715B179
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 01:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7448B10E05F;
	Thu, 19 Feb 2026 00:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CpmX59K2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEBF10E156
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 00:15:45 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-483770e0b25so4256285e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 16:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771460144; x=1772064944; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zNieJSbrQ0dDCtKYRq0xz3ZibHVrsIB5qtqcWz6+XsM=;
 b=CpmX59K2m73/gZXYzaDQTaCIJiwUnTRTs6yH3TZL59Lp//+lGTT2JHTLCbcB7uCcL/
 EkeVmLlFNt/yPzGO5enoyImtvRw+dANv9XLjK0K9+UckcGJDiAq0bdSt00DSGIp5jEfi
 HPOGBfRZR6XJZ+/9rcih/43rDtxYHybVa4f/1m7157TfjiXLFKnwkbMWsdJR5lM9PxR8
 g6IQLHUFMfI4SpGcsKNzGbMowLg48CkMVcDxYcwZPg9rycNl31SCuidC4Dij+P++25Az
 ur7rCxkyxyLRF0wui6XLcQW74O7eJj+vx13EDWYRizlXYspK1Jjttnjskl+KzHlkmysH
 shTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771460144; x=1772064944;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zNieJSbrQ0dDCtKYRq0xz3ZibHVrsIB5qtqcWz6+XsM=;
 b=oo94aZv40L/c2oLIRpqzr6gXCnShsCFKQj50f35b8cHk17UMUKRbXxaZUNh6JHTc1d
 XvQtFMrV1RyyIJMy1w8+O02dctewA2LKyUldEfFYSV/TSXVbvhr0TJt9420gCbTWdqw6
 XX5r4SFTPZk1Y1q769wHKJdRL/MHmKYl5FCVQ1390TQp427BIch9GHTiprTHlpPVmBZP
 IqAapMZsjXEYey/7v5ud0fW3ASUxTMplCc7JHGQXBg6uG3wHNndw51Q+P91SM5ZPuiAc
 4M6RgbMKwzqbkXbNPiCJ/+o0farzdSmhcFmj/Hrail11FzJBSKIxTv/YGRaIuguHAhxg
 cxbQ==
X-Gm-Message-State: AOJu0YwDxssg8vlxgkpnCTx2V9xmkWn4jhlip8Jole3KWGDEvxAQ1VJE
 Ys/I86ldjw5oykyt4R07fhIUtKhuO7ISgeCaBh4zv/RCCemaubtulhj/LKeXnw==
X-Gm-Gg: AZuq6aLPBtuB4i6cNj17UY13fi/jbaOuHxxHAmg6yfzBI6zF4mR6fSMrW+nYdyGom8F
 oz3kBcQqe9UbNXOwSCnWImRBRxlO0Av6FO9dethKHX7WfLlCu0REbxCmLuqwREQAcQrnTxb49Np
 pfF6nlQWS2mOOgrNGdK/+4QNrSb/ZTFJt5I+w0+6GSszOYB8y8Rzuh2KrvCqb6H0YBfmj1UhYXT
 I17wJZ+aRZYD4IJRk0WNFu7PofTmVZ13NOwnOphBCJQUsp4x0nAycmJVJOl8SEe7+t+eQmtr/ea
 a4qwL7cewa3zcD13U41hKCeYyd516TGJXXQFyJ4zlpc0Yx768OwReTjxJmGKIblk1vjPB2EWYcx
 Vq3tsATm8Xcgdfgc5FCvCdL4NCJDvkr/7LXZx4yffWFNEtFgaK0CRJc9TrjpMM3wzbMW7+Ox6ZM
 J8X1W4b1V1kaGW5FEDHmGyJKJOwo/Z58nTE2/xkAgUZiqoR1yvnACdlvypbuw=
X-Received: by 2002:a05:600c:1da1:b0:480:25ae:9993 with SMTP id
 5b1f17b1804b1-48371085c9dmr323883855e9.20.1771460143632; 
 Wed, 18 Feb 2026 16:15:43 -0800 (PST)
Received: from [10.247.12.125] ([129.234.0.168])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839ea2b0fesm4515335e9.4.2026.02.18.16.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 16:15:43 -0800 (PST)
Message-ID: <96e42cb2-c5eb-4f2b-bb52-faea1c91c6c9@gmail.com>
Date: Thu, 19 Feb 2026 00:15:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/2] drm/syncobj: Add DRM_IOCTL_SYNCOBJ_QUERY_ERROR
 to query fence error status
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 wayland-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
References: <20260213120836.81283-1-yiconghui@gmail.com>
 <20260213120836.81283-2-yiconghui@gmail.com>
 <f1100dad-b9ff-4ba2-987c-4d5cb4c1122c@amd.com>
 <bc491356-6db4-4466-ab0f-2f2a47f4da77@mailbox.org>
 <0e7c3ee9-54b1-4ecc-b960-6e2fda6ab3ae@amd.com>
 <e750ca62-8a2e-47e2-b154-c7cdaf5e270e@mailbox.org>
Content-Language: en-US
From: Yicong Hui <yiconghui@gmail.com>
In-Reply-To: <e750ca62-8a2e-47e2-b154-c7cdaf5e270e@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:wayland-devel@lists.freedesktop.org,m:mesa-dev@lists.freedesktop.org,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yiconghui@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EC0F715B179
X-Rspamd-Action: no action

> Instead add some additional flag to DRM_SYNCOBJ_WAIT_FLAGS_* so that the IOCTL aborts the wait and returns an error as soon as it sees any fence with an error.

> Another DRM_SYNCOBJ_QUERY_FLAGS_* is potentially also useful to query the error on a number of drm_syncobjs at the same time.

> Using a new DRM_SYNCOBJ_QUERY_FLAGS_ERROR on all signaled syncobj as separate way to query if there was an error should work for you in the meantime?

> @Yicong any more questions or do you got the idea?

So to confirm, I should implement a flag DRM_SYNCOBJ_WAIT_FLAGS_ERROR which would make the DRM_IOCTL_SYNCOBJ_WAIT ioctl just wait until any fence returns an error, then return the error code of that syncobj/fence's first error, and then return 0 if everything completes without any errors?

and add flag DRM_SYNCOBJ_QUERY_FLAGS_ERROR which would make the DRM_IOCTL_SYNCOBJ_QUERY ioctl fill out the points array with the error codes of each syncobj instead of the latest timeline point? Should it leave the entry as 0 for syncobjs with no error or leave it as it would be without the flag? And if it has multiple fences with errors it should just return the latest error right?

> Good point, poll() has a POLLERR flag for that but I have no idea if eventfd supports that in any way. So potentially doable as well but a bit more work.
Okay, that sounds like somewhere I could potentially implement similar functionality for poll() in a follow-up patch later in the future

Thank you!
- Yicong
  
