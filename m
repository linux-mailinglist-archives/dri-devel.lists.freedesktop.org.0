Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHrvFfgdn2lcZAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 17:06:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0945219A3B7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 17:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9FD10E78D;
	Wed, 25 Feb 2026 16:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Fq+pLAx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9144B10E78D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 16:06:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772035571; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=afUGyiD4ddUzDuG1JpjUFfxm7Jsp/t2tOtBDMHst6FM9bGfuuvpHEEpHmytGfhEtLL3A1ZEGjtlE+kp21ISHF6b8TjB4CuH6PLHSxA30nyJXQmWR0X9o0HwJrBFbZMIy3lmWLPxb+/JS0kt9UsQV8qrcG6p1sPO8kwzpTCCoLx8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1772035571;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=dIxA1J2HnLgltSTO21PhrOi6OIZ0aRFJnhegqknLjhU=; 
 b=jhtkblzVmDPyYk/5KytkRefE9dursRao2LoptI0Xrx07pH/qO5DwOz2PaTTkb5VwbLVtmB8QqCJx4T0X/Ctd0VR83TCScGfe2SKZgRZxa5z6TNOd2sSkcTdm0lezpbHSUzB7jmQkNrlcuL7vVCL3RaVy9gmyBZhfOwS2K4tLHzk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772035570; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=dIxA1J2HnLgltSTO21PhrOi6OIZ0aRFJnhegqknLjhU=;
 b=Fq+pLAx3sMvPKGFCizQODjlLV+zAHfNcEuDiVRmioqZFtKEKgVh/UsiISc3kwv+O
 iXQgLk7h6KX4aapulY/uO2NdQZfHrcZPx3bMRDRcsHVEs2BhldbsBxZNicTdilebkP5
 mXfsgVBzuYOuVDiEZdKz9cGOM6ucgblYYQ7o8dgM=
Received: by mx.zohomail.com with SMTPS id 177203556839577.23283468992611;
 Wed, 25 Feb 2026 08:06:08 -0800 (PST)
Message-ID: <26fc7474-44f4-440b-854e-ea6dcc4890d4@collabora.com>
Date: Wed, 25 Feb 2026 19:06:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] drm/virtio: Freeze and restore hooks to support
 suspend and resume
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, kraxel@redhat.com
Cc: nirmoyd@nvidia.com, vivek.kasireddy@intel.com
References: <20260107182745.229481-1-dongwon.kim@intel.com>
 <20260107182745.229481-2-dongwon.kim@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260107182745.229481-2-dongwon.kim@intel.com>
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
X-Rspamd-Queue-Id: 0945219A3B7
X-Rspamd-Action: no action

On 1/7/26 21:27, dongwon.kim@intel.com wrote:
> +#ifdef CONFIG_PM_SLEEP
> +static int virtgpu_freeze(struct virtio_device *vdev)
> +{
> +	struct drm_device *dev = vdev->priv;
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
> +	int error;
> +
> +	error = drm_mode_config_helper_suspend(dev);
> +	if (error) {
> +		DRM_ERROR("suspend error %d\n", error);

Nit: better to use DRM_DEV_ERROR everywhere to know which device
produces the error

-- 
Best regards,
Dmitry
