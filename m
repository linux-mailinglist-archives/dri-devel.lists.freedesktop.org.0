Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6793A9FEE6E
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 10:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0217110E056;
	Tue, 31 Dec 2024 09:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bx0A/eBx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E990E10E056;
 Tue, 31 Dec 2024 09:40:08 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-aaeec07b705so862629666b.2; 
 Tue, 31 Dec 2024 01:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735637947; x=1736242747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZVx0iAxczoYNQmuh8tjxytzVFHWiAqHa6/iluToV3MA=;
 b=Bx0A/eBxNliOZrRYldg5yM2PbLMcJoLBC6ltJXrJzFXyHPLjJsuidGHW+O2pQTZyzO
 aBRIvhYjqPGPWd76nDBRRrUMnZchRIBh6i1QFDdB2bKqWJqhM+JIJF9/xcD4Iy27Ybjp
 etKFKVReW24cw2qg+co8fXKjpOAQ26KUwCSvQSYOkYQD/qpuZY0rr3pPVz+cHLYoJ0Uk
 W7MuqEX/84tkAWJyf1YBLtr9IvGooAVaWQvll/2EvhPZltnAICpqza7waZsMfyGvhkQg
 /RxKhzFshO4cLYQcMZz6wRaPBJIIojMZBKqmgmQ1iI2fcyM5GuDFAXd+2/G0LnaWAT+M
 8Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735637947; x=1736242747;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZVx0iAxczoYNQmuh8tjxytzVFHWiAqHa6/iluToV3MA=;
 b=gfzatJDoOd3A25QsmskcziaBXz57QEK4dSnBsIDBwFVbpFiPssAes28Fkl4+5t/r5d
 LMMhyZyU19v7GQNKosYzuXaEQk/N/a4GK6+U+50TwuWOMWYx8khNGG8yLjbbDuB1tuHk
 1lOfSAk6eRDhc1tVeY5rk6TxTbZDkZx/UTA1tc559dOa7drxIrslBwrKu7suVEla/1TU
 6QOc4kBrmBxOdTUHEVzP9BjIhZ4n4rObAEDxsjVm3p5fugglP+wh+YdagE6ldYvl4FxP
 jlMEMcKkzOPEEb683vlcq+o2NkT3Ax5vvP4bCI6p2w8busrPY2pzflfKb3pLL1o/748J
 2QIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3D0cO3woOZhnGPfS+W/jIukRFExRs+OW5ycC56PioFcmO0BhLhB5VShWhWXc4hwTtV+2taVLcKyg=@lists.freedesktop.org,
 AJvYcCVz5FCwhf2NPSdAK8RAgB0MT+XWpcJ8j4X4/0bgQSMFanQxYB9NeAlupjrVmmQYUTqfJJPwXOlRfyit@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqeCxVgdnPHIXoHYcYAvQ3YxIa80T7d8RXJg+S5rjnsof8RVnl
 EHwKtTII589TUZWYfbTZ3IQRl3huk+eZSX4zRFcHe3Ih9Q7ufZif
X-Gm-Gg: ASbGncsmqvrECED++ft+FjSsyT92wOTWOY5m4eIeaIUDRT2Sc0mLRkREI4ar4XO+oIH
 kG7ME0GoVrCQ15Q/or2VlJRL4dzWs3rsTGLVv2Nhcbfb5XBMZV6c7gMQzisvkGsccp122vrMdOI
 32NdR6EynnmcN3bWEWieU4F8lfmN5ixJrYYhc5HHqeT7n4ANNAMc7Tr2L4q0ml/SQzn/Vw1WKHX
 SYJ6hXfYFZBrBLjqStqxlmp9mWXnNkltAWv134adME60iwED0GC2x+fw6MzG4n322DXDh7IRkHL
 Grd7pXiGtUqaxATGAAUSe3M=
X-Google-Smtp-Source: AGHT+IHGbNFRD+VBQZRBeNgOAkjlfuRj4Aqm80agk2I8s6fM/A6uCsM+IQL8Y9Wk5QEVzZaPQtaLGg==
X-Received: by 2002:a17:907:9715:b0:aac:619:e914 with SMTP id
 a640c23a62f3a-aac2ad88fcfmr3819378766b.16.1735637946926; 
 Tue, 31 Dec 2024 01:39:06 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae4338sm1542679266b.86.2024.12.31.01.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Dec 2024 01:39:06 -0800 (PST)
Message-ID: <a0fc7b6c-e68d-42a7-aff4-a11c88495f67@gmail.com>
Date: Tue, 31 Dec 2024 10:39:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Conor Dooley <conor+dt@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, devicetree@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 linux-pm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Rob Clark <robdclark@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>, David Airlie <airlied@gmail.com>
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
 <20241231-gpu-acd-v3-4-3ba73660e9ca@quicinc.com>
 <173559754709.2660868.7488137827927170444.robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <173559754709.2660868.7488137827927170444.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
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

On 30.12.2024 11:25 PM, Rob Herring (Arm) wrote:
> 
> On Tue, 31 Dec 2024 02:41:05 +0530, Akhil P Oommen wrote:
>> Add a new schema which extends opp-v2 to support a new vendor specific
>> property required for Adreno GPUs found in Qualcomm's SoCs. The new
>> property called "qcom,opp-acd-level" carries a u32 value recommended
>> for each opp needs to be shared to GMU during runtime.
>>
>> Also, update MAINTAINERS file include the new opp-v2-qcom-adreno.yaml.
>>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 97 ++++++++++++++++++++++
>>  MAINTAINERS                                        |  1 +
>>  2 files changed, 98 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml: ignoring, error parsing file
> Traceback (most recent call last):
>   File "/usr/bin/yamllint", line 33, in <module>
>     sys.exit(load_entry_point('yamllint==1.29.0', 'console_scripts', 'yamllint')())
>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/lib/python3/dist-packages/yamllint/cli.py", line 228, in run
>     prob_level = show_problems(problems, file, args_format=args.format,

You need to shift the closing '}':

diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
index b7874f43aaf6..46fbffaf0a61 100644
--- a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
@@ -93,5 +93,4 @@ examples:
             opp-peak-kBps = <2136719>;
             /* Intentionally left out qcom,opp-acd-level property here */
         };
-
-};
+    };


Konrad
