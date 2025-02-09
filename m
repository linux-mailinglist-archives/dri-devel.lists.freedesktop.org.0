Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C019A2DF8D
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 18:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438F310E35D;
	Sun,  9 Feb 2025 17:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="GnXtRe1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E424510E35D
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 17:45:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739123152; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QRVZARD4Xn0gAylrgRziKJZCUF4jTlSLd4ISrqA/5bHXfNvH/Jho4qFfOSausUAx6TNQbwD/HuBD6uD396puSWxOBQD2uBE23DCYab1zE9kpveCUd0QK6OblolxXKD9YTXscLk7AJrYhlQaD5YEGQeuHKkdKLc/teU/2ma/7Gt4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739123152;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=sMvxahQ2lpemsrXSgpmVU3a/pNZjtoV+jv3a/vD6pOg=; 
 b=cfMifyhsRlEPoGpNnesz8xlnX8FsFAKgKTDZuiWqokMD5OXVBJJrtbwUee4cOt9CLhz5IKKk6Xv99v6bZCh8dOzTXXY9iUf0Fgh3oAv2LFXdXUg/Y4sfJa8TMvDD29wuM35N1QMxvlobww6mwFt4K0pqHFP9NohW/3QQZfPWiTg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739123152; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=sMvxahQ2lpemsrXSgpmVU3a/pNZjtoV+jv3a/vD6pOg=;
 b=GnXtRe1Irtp4pTOTShnpYoMq/MhsqyMrY8Ox6VBTNyn8zqgQ3KdY6Ndr4JiOILv6
 Yg3QhQSiUJpys3PkGicgI6URXx1pKS1O5QN1pUX/wbGCmaXMfCY1qNtGdRrXYPsMIje
 MV/az+zFvoQ0T50DEz5EB73ofwh4GBy+fXFLzOqU=
Received: by mx.zohomail.com with SMTPS id 1739123148892503.83942186941647;
 Sun, 9 Feb 2025 09:45:48 -0800 (PST)
Message-ID: <d8a453e9-c8ce-4a7d-8fb9-08a13c44d7f3@collabora.com>
Date: Sun, 9 Feb 2025 20:45:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] drm/virtio: Add drm_panic support
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 daniel@ffwll.ch, jfalempe@redhat.com
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250206104300.416014-1-ryasuoka@redhat.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250206104300.416014-1-ryasuoka@redhat.com>
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

On 2/6/25 13:42, Ryosuke Yasuoka wrote:
> Virtio gpu supports the drm_panic module, which displays a message to
> the screen when a kernel panic occurs. It is supported where it has
> vmapped shmem BO.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> ---

Applied to misc-next, thanks!

I've tested v7 with a different capsets, works well. For a non-VT FB the
vmap indeed will be needed. Looking forward to the atomic vmap support.
The rough idea of the atomic vmap helper is to make vmap code paths fail
whenever hitting path that needs to sleep. Likely will be easy to implement.

-- 
Best regards,
Dmitry
