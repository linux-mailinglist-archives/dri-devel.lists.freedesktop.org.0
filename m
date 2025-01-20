Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A531BA1684F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 09:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1388310E09A;
	Mon, 20 Jan 2025 08:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.213])
 by gabe.freedesktop.org (Postfix) with SMTP id DC82510E09A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 08:42:51 +0000 (UTC)
Received: from [172.30.20.101] (unknown [180.167.10.98])
 by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 2DFC1602549D5; 
 Mon, 20 Jan 2025 16:42:39 +0800 (CST)
Message-ID: <0bcdc44e-6921-3658-6651-28ec8330f402@nfschina.com>
Date: Mon, 20 Jan 2025 16:42:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] drm/panthor: avoid garbage value in
 panthor_ioctl_dev_query()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: boris.brezillon@collabora.com, steven.price@arm.com, liviu.dudau@arm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, mary.guillemard@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <01bf1bd2-2764-41a1-85aa-962f1197387f@stanley.mountain>
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

On 2025/1/20 15:21, Dan Carpenter wrote:
> On Sun, Jan 19, 2025 at 10:58:29AM +0800, Su Hui wrote:
>> 'priorities_info' is uninitialized, and the uninitialized value is copied
>> to user object when calling PANTHOR_UOBJ_SET(). Using memset to initialize
>> 'priorities_info' to avoid this garbage value problem.
>>
>> Fixes: f70000ef2352 ("drm/panthor: Add DEV_QUERY_GROUP_PRIORITIES_INFO dev query")
>> Signed-off-by: Su Hui <suhui@nfschina.com>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> How did you find this bug?
Clang found this bug, run command like this:
scan-build  --use-cc=clang    make CC=clang 
drivers/gpu/drm/panthor/panthor_drv.o

There will be some warnings, one is this:
drivers/gpu/drm/panthor/panthor_drv.c:807:22: warning: The left 
expression of the compound
assignment is an uninitialized value. The computed value will also be 
garbage [core.uninitialized.Assign]
   807 |                         arg->allowed_mask |= BIT(prio);
       |                         ~~~~~~~~~~~~~~~~~ ^


regards,
su hui
