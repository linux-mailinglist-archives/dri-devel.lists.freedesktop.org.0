Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D2654B819
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 19:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91EF1127D2;
	Tue, 14 Jun 2022 17:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8351127D1;
 Tue, 14 Jun 2022 17:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=Hsz3tB2pF9zm4YWcB7TwV89cMXBPp1AL0XArYJ78aRU=; b=gIIn6VZH752F+AYXhhL393cOYh
 dCndDcyUyAnhJPYJw5prnJ707ouGtGZ21nOTITrRsZkAJohIrpaKlrDdWXFxlkRjDsTGSK4sFhKpT
 b0Nteho2MV31/Fs/NaGavt7FIpjOYprRjEHec/uNGjXf/VbsCGVL//uu2oDaWbYswv4ntr/aF8WeD
 a3CB0cq0nsUnar7b5pGE4WJXIY/kCPnfp1Or64I7mm4z/XdF/12L8zr6ou8AxnH/C11Dht2Mk/No+
 swNL1JF7SfVz1lQtcpRM+C9330LwBPiVkXoTcCMYG4JTAOX7SLWxLWRUw/VMPaND/lGpXg5DIslEa
 zqvkh33Q==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o1Aix-000NI0-G9; Tue, 14 Jun 2022 17:53:08 +0000
Message-ID: <54173da3-8513-be7e-4351-227995688632@infradead.org>
Date: Tue, 14 Jun 2022 10:53:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/amd/display: add stub for crtc_debugfs_init()
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org
References: <20220614155726.26211-1-rdunlap@infradead.org>
 <3289da9b-7b5c-e824-e55e-1648c527d7d9@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <3289da9b-7b5c-e824-e55e-1648c527d7d9@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, patches@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/14/22 10:45, Harry Wentland wrote:
> On 2022-06-14 11:57, Randy Dunlap wrote:
>> Fix build error when CONFIG_DEBUG_FS is not enabled by adding a
>> stub function for crtc_debugfs_init().
>>
>> Eliminates this build error:
>>
>> ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function ‘amdgpu_dm_crtc_late_register’:
>> ../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6599:2: error: implicit declaration of function ‘crtc_debugfs_init’; did you mean ‘amdgpu_debugfs_init’? [-Werror=implicit-function-declaration]
>>   crtc_debugfs_init(crtc);
>>   ^~~~~~~~~~~~~~~~~
>>   amdgpu_debugfs_init
>>
>> Fixes: 86bc22191892 ("drm/amd/display: Support crc on specific region")
> 
> That whole patch and the whole secure display feature depend on debugfs.
> It should never try building without CONFIG_DEBUG_FS.

Hi Harry,
Well, it's clearly possible to have this build error, so something needs
to be fixed somewhere.

> See drivers/gpu/drm/amd/display/Kconfig:
> 
>> config DRM_AMD_SECURE_DISPLAY
>>         bool "Enable secure display support"
>>         default n
>>         depends on DEBUG_FS
>>         depends on DRM_AMD_DC_DCN
>>         help
>>             Choose this option if you want to
>>             support secure display
>>
>>             This option enables the calculation
>>             of crc of specific region via debugfs.
>>             Cooperate with specific DMCU FW.
> 
> amdgpu_dm_crtc_late_register is guarded by CONIG_DRM_AMD_SECURE_DISPLAY.
> 
> Harry
> 
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Wayne Lin <Wayne.Lin@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
>> Cc: amd-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         |    2 --
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h |    6 ++++++
>>  2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -57,9 +57,7 @@
>>  #include "amdgpu_dm_irq.h"
>>  #include "dm_helpers.h"
>>  #include "amdgpu_dm_mst_types.h"
>> -#if defined(CONFIG_DEBUG_FS)
>>  #include "amdgpu_dm_debugfs.h"
>> -#endif
>>  #include "amdgpu_dm_psr.h"
>>  
>>  #include "ivsrcid/ivsrcid_vislands30.h"
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
>> @@ -31,6 +31,12 @@
>>  
>>  void connector_debugfs_init(struct amdgpu_dm_connector *connector);
>>  void dtn_debugfs_init(struct amdgpu_device *adev);
>> +
>> +#ifdef CONFIG_DEBUG_FS
>>  void crtc_debugfs_init(struct drm_crtc *crtc);
>> +#else
>> +static inline void crtc_debugfs_init(struct drm_crtc *crtc)
>> +{}
>> +#endif
>>  
>>  #endif
> 

thanks.
-- 
~Randy
