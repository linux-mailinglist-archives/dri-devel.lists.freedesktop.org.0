Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAR+HRAen2lcZAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 17:06:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358CF19A3CD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 17:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F5610E7B1;
	Wed, 25 Feb 2026 16:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="jvs7v5i/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA6010E7A8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 16:06:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772035595; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=YOJ4N5H0Uu/CKoqKQQ7t+XhWAxG7WPPh2Ze1d832IEIEoxvXpjUQg934w1tnpbMz9WojKxMlCezx795SZDAQoGJDgRW/f038fY8opmKr3Xu5y57Nl30sZt5PavHrtdRxi3FOXxsroK7CQssNpbVm4RUedO1CzFCliKNspGBV1XE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772035595;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=r75e6HS0kQfzvqvvNtA3g6zPTw+79YGKqa0Owm2FsAY=; 
 b=a933M2UZGBKOI7W9dKeu9ghhbckL14EtB28IRJU+/L2EK45+c44tf5IDcTm2TsmZQCUnPrfeMQC9lXf+WFPcBSnI/AUY/3E2erc/L2Lq1fFyEHNEy7CiddCT/kJofwGTyWvWlq7KRvaSWkQBBMj4faQmEArY5Z6WJsmwUpTP54I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772035595; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=r75e6HS0kQfzvqvvNtA3g6zPTw+79YGKqa0Owm2FsAY=;
 b=jvs7v5i/DLs+NmpRgtvHeFze3Oe/fZm4lrJ1PiVbMOdTiuPSUy3XVYONoud+xnLG
 kOIJwRFTYoXWIHU3Zom5Yb/fJLlaPXFqAktl5kqUNn2Ok3EWjjiUNH/O/0QrIknzJYt
 wL+jFdT4rvCkPXYtduG2KLL86aGTbUoSfQKKJ218=
Received: by mx.zohomail.com with SMTPS id 1772035593323656.9925774409365;
 Wed, 25 Feb 2026 08:06:33 -0800 (PST)
Message-ID: <54d6153f-9934-440e-ac00-c9e57ad7785c@collabora.com>
Date: Wed, 25 Feb 2026 19:06:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] drm/virtio: Add PM notifier to restore objects
 after hibernation
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, kraxel@redhat.com
Cc: nirmoyd@nvidia.com, vivek.kasireddy@intel.com
References: <20260107182745.229481-1-dongwon.kim@intel.com>
 <20260107182745.229481-4-dongwon.kim@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260107182745.229481-4-dongwon.kim@intel.com>
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dmitry.osipenko@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dongwon.kim@intel.com,m:airlied@redhat.com,m:kraxel@redhat.com,m:nirmoyd@nvidia.com,m:vivek.kasireddy@intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.osipenko@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: 358CF19A3CD
X-Rspamd-Action: no action

On 1/7/26 21:27, dongwon.kim@intel.com wrote:
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -261,6 +261,7 @@ struct virtio_gpu_device {
>  	bool has_resource_blob;
>  	bool has_host_visible;
>  	bool has_context_init;
> +	bool hibernation;

Nit: bool hibernated;

-- 
Best regards,
Dmitry
