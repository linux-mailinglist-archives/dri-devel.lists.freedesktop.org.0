Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C86C2062E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 14:54:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00C910E98F;
	Thu, 30 Oct 2025 13:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="e9rOttoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D9C10E98F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 13:54:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1761832466; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FzYZntJKMkc6jsJ7bjZiUbB791tiHH/p29gqyqDFzb2NwrpXKYwukBnqKR2rsUkjNTTWdR4M2DSGlYzAxjPSkAnc74hRS5hil5LV5ZmgBcnPxAy/o65ONHMqXGnggbOGKxdQrIIZz6fGQADOTBPq0KwHT7v9usm5mSUO9xwW3LE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1761832466;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=YCCgzhf13qQVgC2HQHI9hDseJtU+Xb2EjrNgBTnf72Q=; 
 b=WhKOTXGT68qMNuLsuWd/u+jpf7XXM6r9CnNWAVhNZ8DnvB/RXCT9GQonOSLH4joB274WAj0C7PHR9R55UA/l+qGITT9ypCLLNhpuB/FjenI/eze4aiA3D4EynjhslT2DaV9ebySWyJqmP4lpcrvLCjieQg4YAKt+K8+XpY9bSy0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761832466; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=YCCgzhf13qQVgC2HQHI9hDseJtU+Xb2EjrNgBTnf72Q=;
 b=e9rOttoZnV98AsHZGbq8pwV8Pzs0/LkVkfbIzSZFf7hiu7Jzhu0WtEigKkGJ1F88
 NE0nO0soNMNYNHHldpWvjt4PJqLI5i0jevtlX+3n7OelSmsHpLUGT6BMcP9MhVgbNxf
 4RwVR14YIkWNpuKvY7L8frw4EENMgsvCoSuQmmUw=
Received: by mx.zohomail.com with SMTPS id 1761832463981354.8844547118065;
 Thu, 30 Oct 2025 06:54:23 -0700 (PDT)
Message-ID: <b54f8527-5ce3-449a-ac96-6b4686d1b108@collabora.com>
Date: Thu, 30 Oct 2025 16:54:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/virtgpu: Make vblank event dependent on the
 external sync
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "airlied@redhat.com" <airlied@redhat.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>
References: <20251027095550.110562-1-tzimmermann@suse.de>
 <1e4a29e7-bf98-4193-962a-66fd251e2c72@collabora.com>
 <IA0PR11MB718584C85B844B3ED6115858F8FAA@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <IA0PR11MB718584C85B844B3ED6115858F8FAA@IA0PR11MB7185.namprd11.prod.outlook.com>
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

On 10/29/25 08:47, Kasireddy, Vivek wrote:
> I applied this patch and tested 3 different scenarios:
> 1) blob=true + imported buffers
> root@localhost:weston_upstream/weston# ./build/clients/weston-simple-egl -o &
> Using config: r8g8b8a0
> has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
> has EGL_EXT_surface_compression
> 245 frames in 5 seconds: 49.000000 fps
> 236 frames in 5 seconds: 47.200001 fps
> 279 frames in 5 seconds: 55.799999 fps
> 240 frames in 5 seconds: 48.000000 fps
> 244 frames in 5 seconds: 48.799999 fps
> 283 frames in 5 seconds: 56.599998 fps
> 274 frames in 5 seconds: 54.799999 fps
> 
> 2) blob=true
> root@localhost:/weston_upstream/weston# ./build/clients/weston-simple-egl -o &
> Using config: r8g8b8a0
> has EGL_EXT_buffer_age and EGL_EXT_swap_buffers_with_damage
> has EGL_EXT_surface_compression
> 167 frames in 5 seconds: 33.400002 fps
> 208 frames in 5 seconds: 41.599998 fps
> 203 frames in 5 seconds: 40.599998 fps
> 252 frames in 5 seconds: 50.400002 fps
> 180 frames in 5 seconds: 36.000000 fps
> 219 frames in 5 seconds: 43.799999 fps
> 176 frames in 5 seconds: 35.200001 fps
> 220 frames in 5 seconds: 44.000000 fps

Thanks for the testing.

For the second scenario I'm getting better result, it's 55-60fps for me.
Given that this is a SW rendering, curious whether that's because you're
testing on a lower end machine(?)

-- 
Best regards,
Dmitry
