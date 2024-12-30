Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F089FEB4C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 23:25:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DBD10E447;
	Mon, 30 Dec 2024 22:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ANOEQYIC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9804110E447;
 Mon, 30 Dec 2024 22:25:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8C9D25C5F8D;
 Mon, 30 Dec 2024 22:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74186C4CED0;
 Mon, 30 Dec 2024 22:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735597548;
 bh=seSfdDx4urL0UaGKOK2Me2hdCtSftuthkBmEb9T7lZQ=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=ANOEQYICVHhXohQQekYt8/6lY9XvBPzzYfiSUkCf0hmSmqq9CoKFIpNGQPlsHXYGE
 dS+38Y8sTewF26Z+ysMuYKDkNN9haQ9NdGhrLzp4+2CaF9xLTgMIvNAvnwZyPvUDBu
 OD9IKo2CRbmoSkA8NzERg/naoSNh9MSrCldmtyHlrjY/xuLEVk+pAHSjc8ECeclHJm
 D1+/2vNat6s+9s0CLaZy+guUl0x8CMGeJq5nkT+U8stCB9tEXNllCIngFNNiKX2mQh
 +UUTmEvHARYVCLHJTF4ke8CQabO8AKbWV0oasIpGBIkosJ6l6JqlsZpubp4sFbchsl
 DZYalSK3Vb3cA==
Date: Mon, 30 Dec 2024 16:25:47 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, devicetree@vger.kernel.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>, 
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, 
 linux-pm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Viresh Kumar <vireshk@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, David Airlie <airlied@gmail.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20241231-gpu-acd-v3-4-3ba73660e9ca@quicinc.com>
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
 <20241231-gpu-acd-v3-4-3ba73660e9ca@quicinc.com>
Message-Id: <173559754709.2660868.7488137827927170444.robh@kernel.org>
Subject: Re: [PATCH v3 4/6] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
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


On Tue, 31 Dec 2024 02:41:05 +0530, Akhil P Oommen wrote:
> Add a new schema which extends opp-v2 to support a new vendor specific
> property required for Adreno GPUs found in Qualcomm's SoCs. The new
> property called "qcom,opp-acd-level" carries a u32 value recommended
> for each opp needs to be shared to GMU during runtime.
> 
> Also, update MAINTAINERS file include the new opp-v2-qcom-adreno.yaml.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 97 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 98 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml: ignoring, error parsing file
Traceback (most recent call last):
  File "/usr/bin/yamllint", line 33, in <module>
    sys.exit(load_entry_point('yamllint==1.29.0', 'console_scripts', 'yamllint')())
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3/dist-packages/yamllint/cli.py", line 228, in run
    prob_level = show_problems(problems, file, args_format=args.format,
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3/dist-packages/yamllint/cli.py", line 113, in show_problems
    for problem in problems:
  File "/usr/lib/python3/dist-packages/yamllint/linter.py", line 200, in _run
    for problem in get_cosmetic_problems(buffer, conf, filepath):
  File "/usr/lib/python3/dist-packages/yamllint/linter.py", line 137, in get_cosmetic_problems
    for problem in rule.check(rule_conf,
  File "/usr/lib/python3/dist-packages/yamllint/rules/indentation.py", line 583, in check
    yield from _check(conf, token, prev, next, nextnext, context)
  File "/usr/lib/python3/dist-packages/yamllint/rules/indentation.py", line 344, in _check
    if expected < 0:
       ^^^^^^^^^^^^
TypeError: '<' not supported between instances of 'NoneType' and 'int'
./Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml:97:1: did not find expected key
make[2]: *** Deleting file 'Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.example.dts'
Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml:97:1: did not find expected key
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241231-gpu-acd-v3-4-3ba73660e9ca@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

