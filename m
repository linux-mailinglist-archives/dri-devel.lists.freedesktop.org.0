Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDNYFkP8nmm+YAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:42:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B9219846B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B1610E8D7;
	Wed, 25 Feb 2026 13:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lGAjlCkI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A74010E8D0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 13:42:24 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id
 4fb4d7f45d1cf-65c5a7785b4so10167836a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 05:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772026943; x=1772631743; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZJfmcZ4qFbylZDu+uvn8Ui6nkXp001OEAlMyyRd9wXQ=;
 b=lGAjlCkIJPoJilV31sX+j+4+scAn49iVTvor3DatudVx1RLr/JDENsofZRcZxoygHz
 wS1K5F8bJ9N1JRs/l2PdEQIevYTUSt1rBL8G+T9y/E6rQVyUXmrPPgdGRtogwX3ccJfV
 ITT2bfLbW7qFY7udjQXAVHQV0vcGCi4w1tc+7R5GW0Or6jw/9uPxV6IKosqxIXWVzDZW
 DnViWK1dnr/qkw6mOMOAvHjJO5GRMmiAUDmLTI0Jzp1LQdxB8U2RwO4ylkrQEeRmZh0w
 TITNEi3sEQwKfbL3Ks8qEd+RQQik26ocT0A9QyYgumEo0FmS+oc06jgjfK/Bd4D5eYJ5
 elbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772026943; x=1772631743;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZJfmcZ4qFbylZDu+uvn8Ui6nkXp001OEAlMyyRd9wXQ=;
 b=Fd+RiJprR/H/EUIkGOT9cYuvxoo0JN7AArDr6jkyyTsdT/SSZpGpZOUk9CQHqqR+9D
 WTYYau0yTogj+1hzPHfF4tQS96z5mSMZrSwGoiDQY6T8JIoRuTOo1Ur6q8TgLlOpXFk9
 DtDRkXdF3IcQFNNt5joPs2g/F6UPRm3AFI+IiUb+UK5mQL2MCK1k9OmEazoJ4haZRg1o
 O0iH6MX5huygoRl17rwJq952g41lmP2ivsTndYmsNF6Xltd98Z3Hi4PUhBfpUYtw0XBI
 +klL8/lz70AS5AhbcL9IAjnOvzAaVcKzW9edN5BiWkjEFQU4XbITZZLPdb4z6A5wLZv2
 dtIQ==
X-Gm-Message-State: AOJu0Yy8INEaT2/eA68DsUfI/QIPGPymTOfmZtHS/v/cXo1UvGjulYOa
 pnAwn8U+8rgW3v3kVEbfWyI3VkHq3v0ceFuERtsaa5AaBoLhu0B14O1Z5G1o69lN7hU=
X-Gm-Gg: ATEYQzyoz7BkRltjqzC9seBFVFJaTLsOh5fox3drdYl7meudiQjrVCUHM8+x1LTZ2aa
 DNLx0SJymXzZVipdAXSqFglkr5tPolzxM/AuxLbOzN1LDg8LZIpezOSuEENusk/NpYznjfAhJtg
 6pFiJ70MLh0RqrQHIAbbU6DDgidQehss8d5RRQb0L7W9nYUinz9HFUmE9TtcFLcXlij9oYahJ+7
 OE9cKtN1+OzgNgMAzzmm1yUSYqVFI/fxgHdrbkcIOTRWHu6wvLl0rxXR4srRPvDYjt2Ns1ehleS
 FC4FkebpcfuTiutBUCUIpv5P50uSQfMPFAY/YAHRQlbwUzC8yQrpSUmKpTs5tF7QftER8CUV24z
 BcrvVxMuDB+hImzJ3EJijWea2ZuRqMBfunMjUGTI1y6TYaeuP+4RmZvvJBe8y3KxDpAr/UQcTmZ
 4lP2Axk9NIPkzkxelinzhNlZ3QXQhidUB1gSjXfzf7cq0qrxwJaoskkqcDLcy71BIz
X-Received: by 2002:a05:6402:51cc:b0:658:b76f:da7c with SMTP id
 4fb4d7f45d1cf-65ea4ed5a89mr10428013a12.13.1772026942535; 
 Wed, 25 Feb 2026 05:42:22 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65eaba13806sm4384331a12.19.2026.02.25.05.42.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 05:42:22 -0800 (PST)
Message-ID: <172a9083-8cd6-428f-bd3d-d831e610b37b@linaro.org>
Date: Wed, 25 Feb 2026 13:42:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/18] accel/qda: Introduce Qualcomm DSP Accelerator
 driver
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <vU2QyEVqOu-D3eGp7BZFICUeauxL32bwWzeidOAijoeVaJTk8KcRVsaQQD4MdFQEcaQTZ5RkzRsz9-Lhl1qsqg==@protonmail.internalid>
 <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B4B9219846B
X-Rspamd-Action: no action

On 23/02/2026 19:08, Ekansh Gupta wrote:
> User-space staging branch
> ============
> https://github.com/qualcomm/fastrpc/tree/accel/staging

What would be really nice to see would be mesa integration allowing 
convergence of the xDSP/xPU accelerator space around something like a 
standard.

See: 
https://blog.tomeuvizoso.net/2025/07/rockchip-npu-update-6-we-are-in-mainline.html

---
bod
