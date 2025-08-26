Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC7FB355EC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 09:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E5110E5E8;
	Tue, 26 Aug 2025 07:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H7r3mxGB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DEC10E5D5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 06:11:05 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-7200073283aso793557b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 23:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756188664; x=1756793464; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s9iquqj/s7zSXGxOGmSMkXZ1B9Lfhdll8knK3f/rRm0=;
 b=H7r3mxGBiFL1vgMDOgXUlrFSvBDhuQM+SlNDKDOmiKoEJ8uwEeJMKj3iITwtcfcEVN
 8WW0mdrMia/MMJzZysHnicDD2WkqksvvXejomoN/rmjfrjXh9wKdi/gSzPCRWKzGPU+k
 O7gM4GSCHPbbBB+VDeOL9Cqc3AccOPVciJ/MwAdy5UYcCqOsCHm/8sAP6D64b01/+6Ui
 nyWyz+tdYKX2L4k3zOMye3gMsuq+1uVqK4CB+UJ9JsJnLhxRMGS2EjbWXXINp8xWN7Lc
 ujcbnc3v0T5Bei5SiOaOLAcjw0vN8vg+f7leYGME+MmsmjAxbVLdb9gB3uL0V4pPQvyn
 qdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756188664; x=1756793464;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s9iquqj/s7zSXGxOGmSMkXZ1B9Lfhdll8knK3f/rRm0=;
 b=h4EtTMOXMBPX+KdTs4nvPoC+ygUeQRtYdSWX6dDawMx8DLwwHT1kjBzE6y9N4vQulP
 s/eXm/dZYx5yTsUBC9zBvpkrqSQLA7+ytu/TXF6OuEDCl+wOKqm1Cs0Jkjew9tE2/Osa
 wuof3IxLtNVJksksW7rEsBbNLS1oYq6F4ZU6r8wZhZ6dl7sEkETWeNrRE2W2eZSUfZ0Y
 HzAtUEUbciU1YvWLjtF3UN4aDAb4X70s37xYApca6fRIafT0StJ/txne8gcR8m/FSFLJ
 8Rh5ZSIWW9JGY7hZMLPHfSoL686OUjqUK8div2XvVN/ro+tv5nrR7AV8chExYTDukkDL
 lLNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7f91cHeXs4/tWRei9lAJqggV8DC6g8HvF0ldUk87HD9xtNRe/+ZX0pyjBuackMCs7JaAcVN0aEOU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4H5CtxNTxnBuRykXrUoX7WDM0Z55Xo6C6olLiFFfHFTxIlHiY
 JQ7OB/u5qKxAYHqX0ZWMvFizk48YS6VUqKyW8E5wa4kvOwDPSVawyhnG
X-Gm-Gg: ASbGncvX2macnyuj2nc+6dI5xUVIHoiHlEBlixitmx97yabl63WrrEKOfb1BOOO1vuJ
 fCUGtcsxcX6jPf0PcgNdvPMg5o00e8cdYfaq84ITQcemfazPBAuEmj3+wqtvXhZlSVdqkJMpuJX
 o3mcUFZXer2cUVLUgylWZ9TxJpdvnnacipV1L9DZyeWnb7U1a1fapG4peV3PXsbOH9gRN61fiUa
 XTRcRlJzeijhi4m8l5sPeacVt/8swIBVNHT/84DY+aQgIgMo90NdcjmQ6XtO73lX7ZlGNmfAU/4
 EV1FjDoYK9X1CnCFUsiyNufeS/ATEUPEWjB+7LeJWFVz2VSNfo+nVQdbhjCR1q0G5fRkvZfAFun
 JiYxOvWWcnM+wjuPE84bdYDw04CBJQTKrX6q38QVxNMoW/+5Vb4xUhLFePSh1PVS0cQVyJx8vmA
 ==
X-Google-Smtp-Source: AGHT+IHuvIqFraNiN8NR0puxYSwhWot5sAD6I0n0YNnJu73K5zGvZcL2epC6OzOx08JfXiCYh9caNg==
X-Received: by 2002:a05:690c:9b09:b0:71c:f7f:d4fa with SMTP id
 00721157ae682-71fdc418f41mr95400447b3.6.1756188663469; 
 Mon, 25 Aug 2025 23:11:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:6470:8880:b0a4:b89:bd73:d8f8?
 ([2600:1700:6470:8880:b0a4:b89:bd73:d8f8])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-71ff1883f42sm22700717b3.45.2025.08.25.23.11.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 23:11:03 -0700 (PDT)
Message-ID: <bce4e6c2-df52-4923-bb51-919271c2dc0f@gmail.com>
Date: Mon, 25 Aug 2025 23:11:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update Min Ma's email for AMD XDNA driver
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, jacek.lawrynowicz@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
References: <96e9e5b9-d7f2-4527-baf2-f7519ffbb612@gmail.com>
 <09906ca7-62c7-2ca7-5436-662a6c4b19f5@amd.com>
Content-Language: en-US
From: Min Ma <mamin506@gmail.com>
In-Reply-To: <09906ca7-62c7-2ca7-5436-662a6c4b19f5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Aug 2025 07:42:42 +0000
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

I recently left AMD and would like to continue participating in
the review and maintenance of the XDNA driver using my personal email 
address.
This commit updates my contact information accordingly.

Signed-off-by: Min Ma <mamin506@gmail.com>
---
  MAINTAINERS | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10850512c118..6eefa494000c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1231,7 +1231,7 @@ F:        drivers/spi/spi-amd.c
  F:	drivers/spi/spi-amd.h

  AMD XDNA DRIVER
-M:	Min Ma <min.ma@amd.com>
+M:	Min Ma <mamin506@gmail.com>
  M:	Lizhi Hou <lizhi.hou@amd.com>
  L:	dri-devel@lists.freedesktop.org
  S:	Supported
-- 
2.43.0

On 8/22/2025 9:42 AM, Lizhi Hou wrote:
> Hi Min,
> 
> Please fix the patch and make sure checkpatch is passed. I can not apply 
> it.
> 
> Applying: MAINTAINERS: Update Min Ma's email for AMD XDNA driver
> error: corrupt patch at line 10
> error: could not build fake ancestor
> 
> Lizhi
Hi Lizhi,
It turns out the 'tab' was expanded to 'spaces' when I copy the output 
of `git format-patch` to my email. A new patch is attached on above. >
> On 7/22/25 23:38, Min Ma wrote:
>> I recently left AMD and would like to continue participating in
>> the review and maintenance of the XDNA driver using my personal email 
>> address.
>> This commit updates my contact information accordingly.
>>
>> Signed-off-by: Min Ma <mamin506@gmail.com>
>> ---
>>  MAINTAINERS | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 10850512c118..6eefa494000c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1231,7 +1231,7 @@ F:        drivers/spi/spi-amd.c
>>  F:     drivers/spi/spi-amd.h
>>
>>  AMD XDNA DRIVER
>> -M:     Min Ma <min.ma@amd.com>
>> +M:     Min Ma <mamin506@gmail.com>
>>  M:     Lizhi Hou <lizhi.hou@amd.com>
>>  L: dri-devel@lists.freedesktop.org
>>  S:     Supported
>> -- 
>> 2.43.0
>>

