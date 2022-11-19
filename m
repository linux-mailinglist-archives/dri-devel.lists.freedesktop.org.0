Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB40630EEF
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 14:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C89C10E077;
	Sat, 19 Nov 2022 13:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp23.cstnet.cn [159.226.251.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 83F0410E077;
 Sat, 19 Nov 2022 13:17:02 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.138.125])
 by APP-03 (Coremail) with SMTP id rQCowACXn5dD13hjEbIYAA--.22946S2;
 Sat, 19 Nov 2022 21:16:51 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: contact@emersion.fr
Subject: [PATCH] drm/amd/display: rewrite the check for mods
Date: Sat, 19 Nov 2022 21:16:50 +0800
Message-Id: <20221119131650.21525-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowACXn5dD13hjEbIYAA--.22946S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur1fCrW7JF1UZrykKFWxJFb_yoWkKwb_WF
 1kC3WDuw1DuF1Fvrs5G343CwsIyF4kJr1IgFs3tw4Dtwn8WrZ5Xr92v3s3Ga1xur4ftrsr
 GF1qv343Xw1DujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbV8FF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7MxkIecxEwVAFwVW5GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
 x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
 DU0xZFpf9x0JU3uc_UUUUU=
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
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
Cc: Jiasheng Jiang <jiasheng@iscas.ac.cn>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 Jerry.Zuo@amd.com, aurabindo.pillai@amd.com, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Nov 2022 15:56:09 +0800, Simon Ser wrote:
>> @@ -638,11 +638,14 @@ static int get_plane_modifiers(struct amdgpu_device *adev, unsigned int plane_ty
>>  		return 0;
>>  
>>  	*mods = kmalloc(capacity * sizeof(uint64_t), GFP_KERNEL);
>> +	if (!*mods)
>> +		return -ENOMEM;
>> +
>>  
>>  	if (plane_type == DRM_PLANE_TYPE_CURSOR) {
>>  		add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_LINEAR);
>>  		add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_INVALID);
>> -		return *mods ? 0 : -ENOMEM;
>> +		return 0;
>>  	}
>>  
>>  	switch (adev->family) {
>> @@ -671,9 +674,6 @@ static int get_plane_modifiers(struct amdgpu_device *adev, unsigned int plane_ty
>>  	/* INVALID marks the end of the list. */
>>  	add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_INVALID);
>>  
>> -	if (!*mods)
>> -		return -ENOMEM;
>> -
>>  	return 0;
>>  }
 
> This breaks the "size" out-parameter.

No, it will not change the value of the "size".
The "size" can only be modified by add_modifier().
However, when the "*mods" is NULL, add_modifier() will return immediately,
without the execution of "*size += 1;".
Therefore, when the "*mods" is NULL, the rest of the function is useless,
which should be better to skip.

Jiang

