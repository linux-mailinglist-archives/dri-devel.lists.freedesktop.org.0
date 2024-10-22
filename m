Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD4E9A9AF1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 09:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B91A10E5F1;
	Tue, 22 Oct 2024 07:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QVDptM+8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE3310E5EE;
 Tue, 22 Oct 2024 07:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729581978;
 bh=XXQtPBrZ9W84M1N+XoRyccWWIHR6QnK+jlUEKQ5ZI60=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QVDptM+8fv9NCuIO6hY9PfOZT7AfeRldt9dyQd7CqnwieJIg7+gYW7/RB4+gicVCd
 wL1fF6Dxv2CQtkb/atzcLWQYNQgqmMUpnhwkL/wUBVpChUK29PdGsgnnqHNPQAyYtV
 TwbcMc2jVYevMQFKVc8ee7aP5ohHmtoSZMitj87hXKn1DGuwKzDsZlQSF+jhGI2toq
 kL/nVBjUOhDfkPueMKFW8cU4D421EM3U2M2IzthMKvXd+yaeearUHRM700YBKU57aj
 DgA2cgwFib6ZqQdpR0t3NI5oTFOcJUg/NMI4OCPXcB0BzF2cGXZ1O/gASEoUut/ZYx
 oM7Mz8BbG+c6w==
Received: from [192.168.50.250] (unknown [171.76.81.24])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B69B317E10D2;
 Tue, 22 Oct 2024 09:26:15 +0200 (CEST)
Message-ID: <0cd1d4af-ee47-468a-be70-ee2c30948eb8@collabora.com>
Date: Tue, 22 Oct 2024 12:55:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drm/ci: refactor software-driver stage jobs
To: Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20241004133126.2436930-1-vignesh.raman@collabora.com>
 <20241004133126.2436930-2-vignesh.raman@collabora.com>
 <CAPj87rPGD8Pu_CSPXfRtsS_w8UYVJGR9CoLx7RAT69EUKefs3A@mail.gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rPGD8Pu_CSPXfRtsS_w8UYVJGR9CoLx7RAT69EUKefs3A@mail.gmail.com>
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

Hi Daniel,

On 07/10/24 22:07, Daniel Stone wrote:
> Hi Vignesh,
> 
> On Fri, 4 Oct 2024 at 09:31, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> +.software-driver:
>> +  stage: software-driver
>> +  extends:
>> +    - .test-gl
>> +    - .test-rules
>> +  timeout: "1h30m"
>> +  tags:
>> +    - kvm
>> +  script:
>> +    - ln -sf $CI_PROJECT_DIR/install /install
>> +    - mv install/bzImage /lava-files/bzImage
>> +    - mkdir -p /lib/modules
>> +    - mkdir -p $CI_PROJECT_DIR/results
>> +    - ln -sf $CI_PROJECT_DIR/results /results
>> +    - install/crosvm-runner.sh install/igt_runner.sh
> 
> Instead of inlining this here, can we please move towards reusing more
> of .gitlab-ci/common/init-stage[12].sh? If those files need to be
> modified then that's totally fine, but I'd rather have something more
> predictable, and fewer random pieces of shell in each job section.

Sure. I will look into init-stage[12].sh and see if we can reuse it. Thanks.

Regards,
Vignesh
