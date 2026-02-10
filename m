Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OCRCNlpi2k1UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 18:24:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A74A11DE58
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 18:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD7810E222;
	Tue, 10 Feb 2026 17:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="hcKU/u3C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DCD10E222
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 17:24:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770744263; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bbdJgHxhb0qfTazCwFrPx9bVeGQqzGN+B2zNunthjMrq2y8QvNwu71y0OsczK3JyqRYP4aP7IblMqpm8BcA3wBwLMqZTIpGqUJH1Atzi/PL0qgRyqQs8MaXyImxQNzSIDSgQRIlvu9veK6n8v/UyMAcbEcJC59N5XwRJKCwFxAQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770744263;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2SVhTKI6jNUmvhweiBSHXKX4xnnqxteHj08x/32q7JI=; 
 b=KCmfVDX5L4h5xR4P75o8+djnOZ2GJ/VB5EN1fPXax/O3u0iQV5LqapbrcgesNSbjt6W4msCjW7duYLxD2LmCUTH5f3o+m2GRYbWYRm/BagJroLQGXLrwW5n8+miykkqdr+2qkPJ2kKi8B7ZwlmPUHIArr1+F+HX6iEJ1uVan8zA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770744263; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=2SVhTKI6jNUmvhweiBSHXKX4xnnqxteHj08x/32q7JI=;
 b=hcKU/u3Cu1sBRH53DO5YRoAp34aSpsMhvqSV5/xGYT4m2xGXAeTPDwbAnvi8CoEv
 vBPEcvSizkZTj6vBuII4JQDMw+2VbNf9jbMGn371TSVIME9aEAcDydjeVMQrtBykXuy
 swu6Td0Nd7/eyLl+7W2MOBKkHDykgNDHbGyX4Z3g=
Received: by mx.zohomail.com with SMTPS id 1770744262665417.3252309425685;
 Tue, 10 Feb 2026 09:24:22 -0800 (PST)
Message-ID: <58373d82-d238-4302-b72a-3625b153bd9e@collabora.com>
Date: Tue, 10 Feb 2026 14:24:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vkms: Fix bad matrix offset component multiplication
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nfraprado@collabora.com, pekka.paalanen@collabora.com,
 daniels@collabora.com, kernel@collabora.com
References: <20251223-vkms-composer-fix-matrix-v1-1-10a979e06209@collabora.com>
 <28d9f246-8952-4f03-94bc-60eadca78c2f@bootlin.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <28d9f246-8952-4f03-94bc-60eadca78c2f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:simona@ffwll.ch,m:melissa.srw@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:linux-kernel@vger.kernel.org,m:nfraprado@collabora.com,m:pekka.paalanen@collabora.com,m:daniels@collabora.com,m:kernel@collabora.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[ariel.dalessandro@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[bootlin.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ariel.dalessandro@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 9A74A11DE58
X-Rspamd-Action: no action

Hi Louis,

Sorry for the delay.

On 12/29/25 6:33 AM, Louis Chauvet wrote:
> 
> 
> On 12/23/25 18:26, Ariel D'Alessandro wrote:
>> Pixels values are packed as 16-bit UNORM values, so the matrix offset
>> components must be multiplied properly by the idempotent element -i.e.
>> number 1 encoded as 16-bit UNORM-.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> 
> Hi,
> 
> Thanks for this patch!
> 
> How did you catch the issue? If you have an example of failing color 
> conversion, can you add a test case in vkms_color_test?
I found it while working on this IGT tools patch series [0], this patch 
in particular [1].

I've just added the related kunit test, so I'll send it as a v2 patchset.

[0] 
https://lore.kernel.org/igt-dev/20251223-post-blend-colorops-v2-0-f40aca9795bd@collabora.com/
[1] 
https://lore.kernel.org/igt-dev/20251223-post-blend-colorops-v2-7-f40aca9795bd@collabora.com/

Regards,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

