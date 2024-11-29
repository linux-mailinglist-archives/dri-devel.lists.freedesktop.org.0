Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891019DE7D1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 14:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF49F10E0A9;
	Fri, 29 Nov 2024 13:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Xy5OzWq5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C26710E0A9;
 Fri, 29 Nov 2024 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B9G+ISBCzGMu3zooxRuGQW3H7hCDwh/ifGOAFtaTYIo=; b=Xy5OzWq5/8D1y8X8LGfw59i+RE
 VqOuuoQs00bDh0GnRa8a+AY4gbwWPpEO5ajvQyFN3UmvIEg4eGoSKSAW07VKTWNS+Gp5IMpf0TbJD
 wfGGb0+sTPPDcb4hg19vYbCfIeifI2D55wrbuHBHqMG8xenSFBp38R8TEPYoryLJcn6FlpcqwaGFD
 m4w2bt0ybvk2YA3+AN/Csf0U2Kfwtjk3uz9DCrkCZEqzjaUIs2aPoCK0n9L/oa+6opP3gAVxrHLsK
 YsYq13Mb17gf7JQGwGmy5qxSHue91t821uY9vQEZzLJntDcg62v30MEAsOZL3ajZmcASDN4eKOvgQ
 QcryfM5Q==;
Received: from [179.118.187.88] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tH1EL-00EMsm-4G; Fri, 29 Nov 2024 14:40:21 +0100
Message-ID: <1d448e67-0c28-4e21-afdd-223495346921@igalia.com>
Date: Fri, 29 Nov 2024 10:40:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] drm: Introduce device wedged event
To: Raag Jadav <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, christian.koenig@amd.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com, lina@asahilina.net,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, airlied@gmail.com,
 simona@ffwll.ch, lucas.demarchi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <20241128153707.1294347-2-raag.jadav@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20241128153707.1294347-2-raag.jadav@intel.com>
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

Hi Raag,

Em 28/11/2024 12:37, Raag Jadav escreveu:
> Introduce device wedged event, which notifies userspace of 'wedged'
> (hanged/unusable) state of the DRM device through a uevent. This is
> useful especially in cases where the device is no longer operating as
> expected and has become unrecoverable from driver context. Purpose of
> this implementation is to provide drivers a generic way to recover with
> the help of userspace intervention without taking any drastic measures
> in the driver.
> 
> A 'wedged' device is basically a dead device that needs attention. The
> uevent is the notification that is sent to userspace along with a hint
> about what could possibly be attempted to recover the device and bring
> it back to usable state. Different drivers may have different ideas of
> a 'wedged' device depending on their hardware implementation, and hence
> the vendor agnostic nature of the event. It is up to the drivers to
> decide when they see the need for device recovery and how they want to
> recover from the available methods.
> 

Thank you for your work. Do you think you can add the optional PID 
parameter, as the PID of the app that caused the reset? For SteamOS use 
case it has been proved to be useful to kill the fault app as well. If 
the reset was caused by a kthread, no PID can be provided hence it's an 
optional parameter.
