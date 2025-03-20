Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E62A6ABB7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 18:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C77F10E1F1;
	Thu, 20 Mar 2025 17:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j+jSSGLX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F8910E28B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 17:11:23 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so641674f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 10:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742490682; x=1743095482; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LszHKVAAmbCzrn3xqUVYloX7G0EimqlzgJrGy2gnmsI=;
 b=j+jSSGLXQdU0HGs84VUJKVvaWLL/gbZO4PF8SGOFLNMnB/iibY/xqbUu4wwl9EovYr
 SxYuG2d/9M6K7V68KfOeGYAblIjs9fq7yVYeaDoPwR3kVAIjXU+v0JGRZKANPmrwfSdJ
 eDZn7zLvjxxZw8YjSZZ4ENeSUrunCkqIMLD6y5Gmp0KE/mcoHEKy/jbsbRGtny9bo/kL
 o07zNrRobadRUmzJAFEUaF3zrs6AJLt+jEtvlBHHkUxR627m4LcJmJswWQhsS8F6jKSv
 qBpAzMRXc4V0PN9LlkeR+K6Ns5U7zaKREzFwaqHxCc7xfYOzott+Jl5b01sVvpQcgdr1
 8SFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742490682; x=1743095482;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LszHKVAAmbCzrn3xqUVYloX7G0EimqlzgJrGy2gnmsI=;
 b=t/dhCf2ozT6ihKQwsi5tM4W+q9IYnFYl86fziAWMlFl9LTQnIbn8mi+Jp9lHpMfeBK
 srEW79wPrNQzwbJJ9XRVCUJMBtzqbBMii/N34VkmQW3iDzQ80db6SCpgM0COgw6TCpMn
 J1L/t8xNAGubRXh4c3QRieHPr6x1qEuv0mqYn5se4hNAmjpONd534UXih1fTuU6c+EHc
 3sBT7ZXfAVqTZ3MJxLMx56eETl891RADh2A8R5Mf/sMlF3X/w1fxWanvgCAlLzoSbC4k
 Mi78vVa8T+tH1r/R+d0YJ9ZSbaXxdsdJbipf7KPoAO4gGZ2G+SMQCAgKfXE+WNHlNJal
 Wc7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx8fjsWxnrLa2VpInOoJtfdO9aLrNhbMXPOd/7Duouea4Y8E34qQKpfQL64Xo7tH5T0IYShAQgcuk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLNhDzJJtNYeMw8x+1w9iilMTT0MqO2PoAePBU/byLqYJeRl2T
 /zk836aJi4/Cgglzw3kvvWgBIh+VA1vjoRZ+iE3QueYK2cR35QOhJ3908Z4cN3M=
X-Gm-Gg: ASbGncuXf7dZXQ1n0PTvEfCRxrrRjiSNm8GJV+zVFEx8hk5Ew+5IfzRHHC1r5QuXhGy
 mCpyUsFkUdpf09p3bFtCPUEYncQ1dnbtMLMfzPMHYi8S8F3w/HekhgxobELB4/Vhu6epRiq+i5s
 ei+Ud5LXg4KboJ49vz6i8XsSBgoMBHhXE3m8+bf2OkseQjPqlF1FgB9qs6q6kSJ6cu/WJg5Q/js
 uX+YSsq+0vkK+atPFMAJR1NHHrFPqQE2FmK32Zyf1pJMZsds0j8g+CPqTsC0rDbY8KNsFEH7JZQ
 XpHUZANN2JCZ4IE8VQs5kGOm7PPhkqkJBOn31zveYZtDpby97RvZVkdkMqdLqh0=
X-Google-Smtp-Source: AGHT+IEEqmDyc13593/QHHJ/rxN/j2FUptO7R/XTlEXHlWVEHh3gZS6BqeAIdYMHPC2w1m3aWmzwvQ==
X-Received: by 2002:a5d:6c67:0:b0:391:30f0:1704 with SMTP id
 ffacd0b85a97d-3997f9008d9mr339289f8f.4.1742490682128; 
 Thu, 20 Mar 2025 10:11:22 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3f6bsm141041f8f.39.2025.03.20.10.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 10:11:21 -0700 (PDT)
Message-ID: <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
Date: Thu, 20 Mar 2025 17:11:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
To: Ling Xu <quic_lxu5@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, quic_ekangupt@quicinc.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20250320091446.3647918-3-quic_lxu5@quicinc.com>
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



On 20/03/2025 09:14, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GPDSP remoteprocs. Add changes to support
> GPDSP remoteprocs.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>   drivers/misc/fastrpc.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 7b7a22c91fe4..80aa554b3042 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -28,7 +28,9 @@
>   #define SDSP_DOMAIN_ID (2)
>   #define CDSP_DOMAIN_ID (3)
>   #define CDSP1_DOMAIN_ID (4)
> -#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
> +#define GDSP0_DOMAIN_ID (5)
> +#define GDSP1_DOMAIN_ID (6)

We have already made the driver look silly here, Lets not add domain ids 
for each instance, which is not a scalable.

Domain ids are strictly for a domain not each instance.


> +#define FASTRPC_DEV_MAX		7 /* adsp, mdsp, slpi, cdsp, cdsp1, gdsp0, gdsp1 */
>   #define FASTRPC_MAX_SESSIONS	14
>   #define FASTRPC_MAX_VMIDS	16
>   #define FASTRPC_ALIGN		128
> @@ -107,7 +109,9 @@
>   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>   
>   static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
> -						"sdsp", "cdsp", "cdsp1" };
> +						"sdsp", "cdsp",
> +						"cdsp1", "gdsp0",
> +						"gdsp1" };
>   struct fastrpc_phy_page {
>   	u64 addr;		/* physical address */
>   	u64 size;		/* size of contiguous region */
> @@ -2338,6 +2342,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>   		break;
>   	case CDSP_DOMAIN_ID:
>   	case CDSP1_DOMAIN_ID:
> +	case GDSP0_DOMAIN_ID:
> +	case GDSP1_DOMAIN_ID:
>   		data->unsigned_support = true;
>   		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
>   		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);


Can you try this patch: only compile tested.

---------------------------------->cut<---------------------------------------
 From 3f8607557162e16673b26fa253d11cafdc4444cf Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 20 Mar 2025 17:07:05 +0000
Subject: [PATCH] misc: fastrpc: cleanup the domain names

Currently the domain ids are added for each instance of domain, this is
totally not scalable approch.

Clean this mess and create domain ids for only domains not its
instances.
This patch also moves the domain ids to uapi header as this is required
for FASTRPC_IOCTL_GET_DSP_INFO ioctl.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
  drivers/misc/fastrpc.c      | 45 ++++++++++++++++++++-----------------
  include/uapi/misc/fastrpc.h |  7 ++++++
  2 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7b7a22c91fe4..b3932897a437 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -23,12 +23,6 @@
  #include <uapi/misc/fastrpc.h>
  #include <linux/of_reserved_mem.h>

-#define ADSP_DOMAIN_ID (0)
-#define MDSP_DOMAIN_ID (1)
-#define SDSP_DOMAIN_ID (2)
-#define CDSP_DOMAIN_ID (3)
-#define CDSP1_DOMAIN_ID (4)
-#define FASTRPC_DEV_MAX		5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
  #define FASTRPC_MAX_SESSIONS	14
  #define FASTRPC_MAX_VMIDS	16
  #define FASTRPC_ALIGN		128
@@ -106,8 +100,6 @@

  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, 
miscdev)

-static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
-						"sdsp", "cdsp", "cdsp1" };
  struct fastrpc_phy_page {
  	u64 addr;		/* physical address */
  	u64 size;		/* size of contiguous region */
@@ -1769,7 +1761,7 @@ static int fastrpc_get_dsp_info(struct 
fastrpc_user *fl, char __user *argp)
  		return  -EFAULT;

  	cap.capability = 0;
-	if (cap.domain >= FASTRPC_DEV_MAX) {
+	if (cap.domain >= FASTRPC_DOMAIN_MAX) {
  		dev_err(&fl->cctx->rpdev->dev, "Error: Invalid domain id:%d, err:%d\n",
  			cap.domain, err);
  		return -ECHRNG;
@@ -2255,6 +2247,24 @@ static int fastrpc_device_register(struct device 
*dev, struct fastrpc_channel_ct
  	return err;
  }

+static int fastrpc_get_domain_id(const char *domain)
+{
+	if (strncmp(domain, "adsp", 4) == 0) {
+		return ADSP_DOMAIN_ID;
+	} else	if (strncmp(domain, "cdsp", 4) == 0) {
+		return CDSP_DOMAIN_ID;
+	} else if (strncmp(domain, "mdsp", 4) ==0) {
+		return MDSP_DOMAIN_ID;
+	} else if (strncmp(domain, "sdsp", 4) ==0) {
+		return SDSP_DOMAIN_ID;
+	} else if (strncmp(domain, "gdsp", 4) ==0) {
+		return GDSP_DOMAIN_ID;
+	}
+
+	return -EINVAL;
+
+}
+
  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
  {
  	struct device *rdev = &rpdev->dev;
@@ -2272,15 +2282,10 @@ static int fastrpc_rpmsg_probe(struct 
rpmsg_device *rpdev)
  		return err;
  	}

-	for (i = 0; i < FASTRPC_DEV_MAX; i++) {
-		if (!strcmp(domains[i], domain)) {
-			domain_id = i;
-			break;
-		}
-	}
+	domain_id = fastrpc_get_domain_id(domain);

  	if (domain_id < 0) {
-		dev_info(rdev, "FastRPC Invalid Domain ID %d\n", domain_id);
+		dev_info(rdev, "FastRPC Domain %s not supported\n", domain);
  		return -EINVAL;
  	}

@@ -2332,19 +2337,19 @@ static int fastrpc_rpmsg_probe(struct 
rpmsg_device *rpdev)
  	case SDSP_DOMAIN_ID:
  		/* Unsigned PD offloading is only supported on CDSP and CDSP1 */
  		data->unsigned_support = false;
-		err = fastrpc_device_register(rdev, data, secure_dsp, 
domains[domain_id]);
+		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
  		if (err)
  			goto fdev_error;
  		break;
  	case CDSP_DOMAIN_ID:
-	case CDSP1_DOMAIN_ID:
+	case GDSP_DOMAIN_ID:
  		data->unsigned_support = true;
  		/* Create both device nodes so that we can allow both Signed and 
Unsigned PD */
-		err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
+		err = fastrpc_device_register(rdev, data, true, domain);
  		if (err)
  			goto fdev_error;

-		err = fastrpc_device_register(rdev, data, false, domains[domain_id]);
+		err = fastrpc_device_register(rdev, data, false, domain);
  		if (err)
  			goto populate_error;
  		break;
diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
index f33d914d8f46..89516abd258f 100644
--- a/include/uapi/misc/fastrpc.h
+++ b/include/uapi/misc/fastrpc.h
@@ -133,6 +133,13 @@ struct fastrpc_mem_unmap {
  	__s32 reserved[5];
  };

+#define ADSP_DOMAIN_ID (0)
+#define MDSP_DOMAIN_ID (1)
+#define SDSP_DOMAIN_ID (2)
+#define CDSP_DOMAIN_ID (3)
+#define GDSP_DOMAIN_ID (4)
+
+#define FASTRPC_DOMAIN_MAX	4
  struct fastrpc_ioctl_capability {
  	__u32 domain;
  	__u32 attribute_id;
-- 
2.25.1


---------------------------------->cut<---------------------------------------
