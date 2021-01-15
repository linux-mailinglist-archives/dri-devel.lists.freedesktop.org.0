Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AD02F7595
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 10:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CCD89EB8;
	Fri, 15 Jan 2021 09:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F60189F08;
 Fri, 15 Jan 2021 09:37:55 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1l0LYH-0007Sv-Je; Fri, 15 Jan 2021 09:37:53 +0000
Subject: Re: [PATCH][next] drm/amdgpu: Add missing BOOTUP_DEFAULT to
 profile_name[]
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20210111114638.16530-1-colin.king@canonical.com>
 <20210112100706.GF5083@kadam>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <51efd2a7-f2cf-dc28-4b86-5e89d13564ca@canonical.com>
Date: Fri, 15 Jan 2021 09:37:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112100706.GF5083@kadam>
Content-Language: en-US
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
Cc: Xiaojian Du <Xiaojian.Du@amd.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/01/2021 10:07, Dan Carpenter wrote:
> On Mon, Jan 11, 2021 at 11:46:38AM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> A recent change added a new BOOTUP_DEFAULT power profile mode
>> to the PP_SMC_POWER_PROFILE enum but omitted updating the
>> corresponding profile_name array.  Fix this by adding in the
>> missing BOOTUP_DEFAULT to profile_name[].
>>
> 
> Still not enough to prevent the array overflow.  It needs POWERSAVE as
> well.

Thanks for checking, but there is a 1-to-1 relation ship now:

enum PP_SMC_POWER_PROFILE {
        PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT = 0x0,
        PP_SMC_POWER_PROFILE_FULLSCREEN3D = 0x1,
        PP_SMC_POWER_PROFILE_POWERSAVING  = 0x2,
        PP_SMC_POWER_PROFILE_VIDEO        = 0x3,
        PP_SMC_POWER_PROFILE_VR           = 0x4,
        PP_SMC_POWER_PROFILE_COMPUTE      = 0x5,
        PP_SMC_POWER_PROFILE_CUSTOM       = 0x6,
        PP_SMC_POWER_PROFILE_COUNT,
};

vs

        static const char *profile_name[] = {
                                        "BOOTUP_DEFAULT",
                                        "3D_FULL_SCREEN",
                                        "POWER_SAVING",
                                        "VIDEO",
                                        "VR",
                                        "COMPUTE",
                                        "CUSTOM"};


unless I'm missing something because I've not had enough coffee.

Colin

> 
> regards,
> dan carpenter
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
