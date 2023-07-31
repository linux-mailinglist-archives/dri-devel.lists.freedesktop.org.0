Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E02769C41
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 18:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A2710E2D0;
	Mon, 31 Jul 2023 16:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902B210E2CF
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 16:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690820572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WcfUCX/xKXv9PQ7QY9LE9XlzPrBBu0nyfjw3LePVUmU=;
 b=LFnj6qi4cY5NdQ6EuWGF2HFCrH5EdRv/YdGz4Yv3Ahx8YT4hG9q6vDYf+k8twejLvABXle
 uhCaDp7qTjqFGK7svkgkOZ/BG+of6pNk7ZOSZMqo0C6Xar9AZxJckEkpIlPN5b37yVm0LS
 2IqPgTnFvtW70E/T7+U4g+7DHe6NxOA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-Bfa4QzB2MwugRUCQFV2VbA-1; Mon, 31 Jul 2023 12:22:49 -0400
X-MC-Unique: Bfa4QzB2MwugRUCQFV2VbA-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4053d10ee39so43499311cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 09:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690820569; x=1691425369;
 h=in-reply-to:from:references:to:content-language:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WcfUCX/xKXv9PQ7QY9LE9XlzPrBBu0nyfjw3LePVUmU=;
 b=W+I+G2cX2g7r8JDoGYaHLGs4ZpKVA95zWF56cidn5n9aCaVsMOoPN4aQPg6hHOZihC
 0Y18WqLvZdviNlwudk66lXKay4EwvEDy94hlBn9X0Or/hVBGZrzAtAlFXQXDY2FGz+Pe
 s1N8FMfccTEL2CiOrAM0dVyRELKipQJo8X7bpci+KL4inXjkIFFE/ru1j/kQn6F6eCCx
 6c3NhxhXfX4P2j2KXB2UdxTAP+DxfqgvfuPxoN98CvZrhZuQDwNN/SwraUfV0rTsRvyS
 W3rhKKpywxzUsyDfXai2xxTttTungb9s+uighpbOerSXzqGYqrB/c5aqK3ea9mA0/nkd
 A1Fg==
X-Gm-Message-State: ABy/qLYHZ8v4CeeyuY3iI2ugZl8ztgCR2SMPTawcYq5NWuy3zrI+XZVP
 +Tt0AZSytFHUc85j6sQ9s7AShaOi2atigCK6oYhCl6ZZGe+PLgU1VBOJKOPcUvu/hMKx36RjujH
 c4/tlkVPgK1wf2JjAU/i/ZAAv4BQQ
X-Received: by 2002:ac8:5701:0:b0:404:7246:1e30 with SMTP id
 1-20020ac85701000000b0040472461e30mr12867844qtw.57.1690820569536; 
 Mon, 31 Jul 2023 09:22:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE72JcHr7mBPeuU6Dd3nMGjeCmvoYLNSsc0w8k8CBbkNoJbx+KAHzJYCXWKYWqTrYFBLMLLZg==
X-Received: by 2002:ac8:5701:0:b0:404:7246:1e30 with SMTP id
 1-20020ac85701000000b0040472461e30mr12867801qtw.57.1690820569289; 
 Mon, 31 Jul 2023 09:22:49 -0700 (PDT)
Received: from [192.168.1.7] (024-176-180-193.res.spectrum.com.
 [24.176.180.193]) by smtp.gmail.com with ESMTPSA id
 f20-20020ac80154000000b003f9c6a311e1sm1445092qtg.47.2023.07.31.09.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 09:22:48 -0700 (PDT)
Message-ID: <a048aa87-5bac-2032-6d5e-929af5cbc8e1@redhat.com>
Date: Mon, 31 Jul 2023 09:22:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] drm/amdgpu: Remove a lot of unnecessary ternary
 operators
To: Ruan Jinjie <ruanjinjie@huawei.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 Rodrigo.Siqueira@amd.com, evan.quan@amd.com, srinivasan.shanmugam@amd.com,
 wangxiongfeng2@huawei.com, Hawking.Zhang@amd.com, James.Zhu@amd.com,
 Veerabadhran.Gopalakrishnan@amd.com, saleemkhan.jamadar@amd.com,
 le.ma@amd.com, tao.zhou1@amd.com, Jane.Jian@amd.com, Hongkun.Zhang@amd.com,
 leo.liu@amd.com, lijo.lazar@amd.com, mario.limonciello@amd.com,
 Lang.Yu@amd.com, ruijing.dong@amd.com, Suresh.Guttula@amd.com,
 David.Wu3@amd.com, sonny.jiang@amd.com, wenjing.liu@amd.com,
 Jun.Lei@amd.com, mripard@kernel.org, tzimmermann@suse.de, drv@mailo.com,
 Shiwu.Zhang@amd.com, aleksei.kodanev@bell-sw.com, ye.xingchen@zte.com.cn,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230731132610.2675314-1-ruanjinjie@huawei.com>
From: Tom Rix <trix@redhat.com>
In-Reply-To: <20230731132610.2675314-1-ruanjinjie@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="------------L6QgvMwTX0wNVrUJVV4hyKa4"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------L6QgvMwTX0wNVrUJVV4hyKa4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/23 6:26 AM, Ruan Jinjie wrote:
> Ther are many ternary operators, the true or false judgement
> of which is unnecessary in C language semantics.
>
> Signed-off-by: Ruan Jinjie<ruanjinjie@huawei.com>
> ---

snip
>   	data->registry_data.avfs_support =
> -		hwmgr->feature_mask & PP_AVFS_MASK ? true : false;
> +		hwmgr->feature_mask & PP_AVFS_MASK;
>   	data->registry_data.led_dpm_enabled = 1;

These are not equivalent, consider 0xffff & 0x1000 != 1

Tom


--------------L6QgvMwTX0wNVrUJVV4hyKa4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/31/23 6:26 AM, Ruan Jinjie wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230731132610.2675314-1-ruanjinjie@huawei.com">
      <pre class="moz-quote-pre" wrap="">Ther are many ternary operators, the true or false judgement
of which is unnecessary in C language semantics.

Signed-off-by: Ruan Jinjie <a class="moz-txt-link-rfc2396E" href="mailto:ruanjinjie@huawei.com">&lt;ruanjinjie@huawei.com&gt;</a>
---
</pre>
    </blockquote>
    <span style="white-space: pre-wrap">
</span><br>
    snip<br>
    <blockquote type="cite"
      cite="mid:20230731132610.2675314-1-ruanjinjie@huawei.com">
      <pre class="moz-quote-pre" wrap="">
 	data-&gt;registry_data.avfs_support =
-		hwmgr-&gt;feature_mask &amp; PP_AVFS_MASK ? true : false;
+		hwmgr-&gt;feature_mask &amp; PP_AVFS_MASK;
 	data-&gt;registry_data.led_dpm_enabled = 1;</pre>
    </blockquote>
    <p>These are not equivalent, consider 0xffff &amp; 0x1000 != 1<br>
    </p>
    <p>Tom</p>
    <br>
  </body>
</html>

--------------L6QgvMwTX0wNVrUJVV4hyKa4--

