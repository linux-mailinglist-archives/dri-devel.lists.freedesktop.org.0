Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B46D996153
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 09:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCB910E0BE;
	Wed,  9 Oct 2024 07:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="owGCEpb4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7404110E0BE
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 07:46:29 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42cae6bb895so66581085e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 00:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728459988; x=1729064788; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=EfnEfZLH3vBeArY9d7gO91paVq+VcoGrCt+B/868dIE=;
 b=owGCEpb4LpIA/4XMPd4RlWqDa/R5sQ9q8Ua4Bx6R2JGN5LIF8803t1kAA2Ti5RIdtb
 60abZEGe0dqFrJHk6wr61lUsVdjPuF6mpKhFnC97J/Wrjd+WfxQYg15Fugj53YwGyZu9
 yti/FrKV9bUQMAPcJDwgOsGWhJigNIFZ3DxfajdmFvaREMmxM2thyKq036Lg3T/MTBT1
 9RTApspAzHyDYJxvB5d0w9XPFHClurvcoUJ5YBVrljcD7URrfzWB1wu0veZhRvRZ1wyI
 QRmKNITZfgU2phUp5mYgwcLrsjPmOU9YMsgkJxO7FvuFFLFw/TwINs6+yLevXO1M36Sy
 BSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728459988; x=1729064788;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EfnEfZLH3vBeArY9d7gO91paVq+VcoGrCt+B/868dIE=;
 b=p/FusUZJG2FdgqKsbkgXjKbG+MG2XNYPHvcjaL7UZehQbNy6ZzDp833b1xfpTChR/B
 b1mBSq+KHvNRblQs7tOTo676PdTo4IESyLaypBvZQs5POX9v0vC7quhvFGSQfi1ZtDM8
 PjXzwFnQ4kCSyGasinSd0GEzJkBiB26tdXAY4KZFWz2drcPZAlBv/nXZ+uW5W7KcuMWG
 ff4llpgIeD7aVhuzvcXy/eITs47m5AOsjxEt+31QVAp0vnUK0fHyA43jR7uaqg82PmTi
 aRB9DV2txyiWalIaWxI2lHeAj87NHe4MNtT33RYbKU22PPSDW0xK/QWtkc0uZLgetSe8
 SQwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViCbm1Usfbm3AxOxcxE5Ec2r+KUsYau5MpS5mLRwXezVNZZxhutUBO8o6oa/eYGR+sKtEB3Kppvxc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzb6DD6rSGbN0YtsXhUsE/fNFvgan4EtCLrpW7/UZ4rLsR1nbM0
 Lu2YhbZU6O7pXZUOEaYlGbHzSn/FAk3td9VkdBi8dWXyIzBSXq640FIbPaaMwcc=
X-Google-Smtp-Source: AGHT+IHwSgPx0bawG5Tx5hZK7jYeRqKEAp9SysxfOyurKYdGg3AbYEEXcBxQ4uLxarirWBznw0VvvQ==
X-Received: by 2002:a05:600c:b8a:b0:42c:b1a4:c3ef with SMTP id
 5b1f17b1804b1-430d70b463dmr9928105e9.33.1728459987691; 
 Wed, 09 Oct 2024 00:46:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:767b:a30:4bcb:fcaf?
 ([2a01:e0a:982:cbb0:767b:a30:4bcb:fcaf])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-430ccf51770sm11634485e9.22.2024.10.09.00.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 00:46:27 -0700 (PDT)
Message-ID: <98f7cb26-7ea5-4dc4-86d1-ccbbb6ac53b4@linaro.org>
Date: Wed, 9 Oct 2024 09:46:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 16/22] drm/msm/dpu: Configure CWB in writeback encoder
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 quic_abhinavk@quicinc.com, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-16-7849f900e863@quicinc.com>
 <b9e50652-4556-4eed-a013-8e417eccdb69@linaro.org>
 <866ef212-a00e-48c4-9cf1-d1d4ee78d0ae@quicinc.com>
 <a58abb00-f941-48e0-b2a0-3c401e5220a7@linaro.org>
 <4e0ccd07-fdd1-4e92-bda7-ea6ec9d54c80@linaro.org>
 <d88264f3-29ed-449b-9971-501ce7e1da99@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <d88264f3-29ed-449b-9971-501ce7e1da99@quicinc.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/10/2024 14:25, Jessica Zhang wrote:
> 
> 
> On 10/8/2024 1:00 AM, Neil Armstrong wrote:
>> Hi,
>>
>> On 01/10/2024 09:37, neil.armstrong@linaro.org wrote:
>>> Hi,
>>>
>>> On 30/09/2024 21:19, Jessica Zhang wrote:
>>>>
>>>>
>>>> On 9/30/2024 7:17 AM, neil.armstrong@linaro.org wrote:
>>>>> On 25/09/2024 00:59, Jessica Zhang wrote:
>>
>> <snip>
>>
>>>>>
>>>>> When running igt-test on QRD8650, I get:
>>>>> # IGT_FRAME_DUMP_PATH=$PWD FRAME_PNG_FILE_NAME=pwet /usr/libexec/ igt- gpu-tools/kms_writeback -d
>>>>
>>>> Hi Neil,
>>>>
>>>> Thanks for reporting this. Unfortunately, I'm not able to recreate this on the MTP8650.
>>>>

<snip>

Thanks for the fix, Indeed it fixes the crash, but the igt test tries to use the Disconnected and fails:
Starting subtest: dump-valid-clones
(kms_writeback:521) igt_kms-CRITICAL: Test assertion failure function kmstest_dumb_create, file /usr/src/debug/igt-gpu-tools/1.28/lib/igt_kms.c:1301:
(kms_writeback:521) igt_kms-CRITICAL: Failed assertion: igt_ioctl((fd), ((((2U|1U) << (((0+8)+8)+14)) | ((('d')) << (0+8)) | (((0xB2)) << 0) | ((((sizeof(struct drm_mode_create_dumb)))) << ((0+8)+8)))), (&create)) == 0
(kms_writeback:521) igt_kms-CRITICAL: Last errno: 22, Invalid argument
(kms_writeback:521) igt_kms-CRITICAL: error: -1 != 0
Stack trace:
   #0 [igt_nsec_elapsed+0x500]
Subtest dump-valid-clones failed.
**** DEBUG ****
(kms_writeback:521) DEBUG: Test requirement passed: !(!data.dump_check || data.list_modes)
(kms_writeback:521) DEBUG: Test requirement passed: !(!(data.supported_colors & XRGB8888))
(kms_writeback:521) DEBUG: Test requirement passed: fb_id > 0
(kms_writeback:521) igt_kms-DEBUG: display: DSI-1: set_pipe(A)
(kms_writeback:521) igt_kms-DEBUG: display: DSI-1: Selecting pipe A
(kms_writeback:521) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=1080, height=2400, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_writeback:521) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=3, pitch=4352)
(kms_writeback:521) ioctl_wrappers-DEBUG: Test requirement passed: igt_has_fb_modifiers(fd)
(kms_writeback:521) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=1080, height=2400, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_writeback:521) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=4, pitch=4352)
(kms_writeback:521) ioctl_wrappers-DEBUG: Test requirement passed: igt_has_fb_modifiers(fd)
(kms_writeback:521) DEBUG: Test requirement passed: fb_id > 0
(kms_writeback:521) igt_kms-DEBUG: display: A.0: plane_set_fb(110)
(kms_writeback:521) igt_kms-DEBUG: display: A.0: plane_set_size (1080x2400)
(kms_writeback:521) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
(kms_writeback:521) igt_kms-DEBUG: display: A.0: fb_set_size(1080x2400)
(kms_writeback:521) igt_kms-DEBUG: display: Writeback-1: output_set_writeback_fb(112)
(kms_writeback:521) igt_kms-DEBUG: display: commit {
(kms_writeback:521) igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x6d/109
(kms_writeback:521) igt_kms-DEBUG: Pipe A: Setting property "ACTIVE" to 0x1/1
(kms_writeback:521) igt_kms-DEBUG: display:     populating plane data: A.0, fb 110
(kms_writeback:521) igt_kms-DEBUG: plane A.0: Setting property "SRC_X" to 0x0/0
(kms_writeback:521) igt_kms-DEBUG: plane A.0: Setting property "SRC_Y" to 0x0/0
(kms_writeback:521) igt_kms-DEBUG: plane A.0: Setting property "SRC_W" to 0x4380000/70778880
(kms_writeback:521) igt_kms-DEBUG: plane A.0: Setting property "SRC_H" to 0x9600000/157286400
(kms_writeback:521) igt_kms-DEBUG: plane A.0: Setting property "CRTC_W" to 0x438/1080
(kms_writeback:521) igt_kms-DEBUG: plane A.0: Setting property "CRTC_H" to 0x960/2400
(kms_writeback:521) igt_kms-DEBUG: plane A.0: Setting property "FB_ID" to 0x6e/110
(kms_writeback:521) igt_kms-DEBUG: plane A.0: Setting property "CRTC_ID" to 0x67/103
(kms_writeback:521) igt_kms-DEBUG: display:     DSI-1: preparing atomic, pipe: A
(kms_writeback:521) igt_kms-DEBUG: DSI-1: Setting property "CRTC_ID" to 0x67/103
(kms_writeback:521) igt_kms-DEBUG: display:     Writeback-1: preparing atomic, pipe: A
(kms_writeback:521) igt_kms-DEBUG: Writeback-1: Setting property "WRITEBACK_FB_ID" to 0x70/112
(kms_writeback:521) igt_kms-DEBUG: Writeback-1: Setting property "WRITEBACK_OUT_FENCE_PTR" to 0x3a4958f8/977885432
(kms_writeback:521) igt_kms-DEBUG: display: }
(kms_writeback:521) igt_fb-DEBUG: Test requirement passed: cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
(kms_writeback:521) igt_kms-DEBUG: display: DSI-1: set_pipe(None)
(kms_writeback:521) igt_kms-DEBUG: display: DSI-1: Selecting pipe None
(kms_writeback:521) igt_kms-DEBUG: display: commit {
(kms_writeback:521) igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x6b/107
(kms_writeback:521) igt_kms-DEBUG: display:     DSI-1: preparing atomic, pipe: None
(kms_writeback:521) igt_kms-DEBUG: DSI-1: Setting property "CRTC_ID" to 0x0/0
(kms_writeback:521) igt_kms-DEBUG: display: }
(kms_writeback:521) igt_kms-DEBUG: display: DP-1: set_pipe(A)
(kms_writeback:521) igt_kms-DEBUG: display: DP-1: Selecting pipe A
(kms_writeback:521) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=0, height=0, format=XR24(0x34325258), modifier=0x0, size=0)
(kms_writeback:521) igt_kms-CRITICAL: Test assertion failure function kmstest_dumb_create, file /usr/src/debug/igt-gpu-tools/1.28/lib/igt_kms.c:1301:
(kms_writeback:521) igt_kms-CRITICAL: Failed assertion: igt_ioctl((fd), ((((2U|1U) << (((0+8)+8)+14)) | ((('d')) << (0+8)) | (((0xB2)) << 0) | ((((sizeof(struct drm_mode_create_dumb)))) << ((0+8)+8)))), (&create)) == 0
(kms_writeback:521) igt_kms-CRITICAL: Last errno: 22, Invalid argument
(kms_writeback:521) igt_kms-CRITICAL: error: -1 != 0
(kms_writeback:521) igt_core-INFO: Stack trace:
(kms_writeback:521) igt_core-INFO:   #0 [igt_nsec_elapsed+0x500]
****  END  ****

I'll try with an enabled DP connector.

Neil

> 
> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>> Thanks,
>> Neil
>>
>>>
>>> Neil
>>>
>>>>
>>>> Also, can you share the IGT debug logs?
>>>>
>>>> FWIW, I haven't had the chance to test with DP yet so that might be why you're hitting this issue and I'm not.
>>>>
>>>> Thanks,
>>>>
>>>> Jessica Zhang
>>>>
>>>>> [ 2566.668998] Console: switching to colour dummy device 80x25
>>>>> IGT-Version: 1.29-1.28 (aarch64) (Linux: 6.12.0-rc1-00022- ge581f752bf79 aarch64)
>>>>> [ 2566.674859] [IGT] kms_writeback: executing
>>>>> Using IGT_SRANDOM=1709057323 for randomisation
>>>>> Opened device: /dev/dri/card0
>>>>> [ 2566.741375] [IGT] kms_writeback: starting subtest dump-writeback
>>>>> Starting subtest: dump-writeback
>>>>> Subtest dump-writeback: SUCCESS (0.305s)[ 2567.053189] [IGT] kms_writeback: finished subtest dump-writeback, SUCCESS
>>>>>
>>>>> [ 2567.064505] [IGT] kms_writeback: starting subtest dump-valid-clones
>>>>> Starting subtest: dump-valid-clones
>>>>> [ 2567.762793] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
>>>>> [ 2567.771919] Mem abort info:
>>>>> [ 2567.774888]   ESR = 0x0000000096000006
>>>>> [ 2567.778831]   EC = 0x25: DABT (current EL), IL = 32 bits
>>>>> [ 2567.784371]   SET = 0, FnV = 0
>>>>> [ 2567.787601]   EA = 0, S1PTW = 0
>>>>> [ 2567.790942]   FSC = 0x06: level 2 translation fault
>>>>> [ 2567.796044] Data abort info:
>>>>> [ 2567.799083]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
>>>>> [ 2567.804793]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>>>>> [ 2567.810057]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>>>>> [ 2567.815600] user pgtable: 4k pages, 48-bit VAs, pgdp=00000008d60cf000
>>>>> [ 2567.822290] [0000000000000010] pgd=08000008d6049003, p4d=08000008d6049003, pud=080000089397e003, pmd=0000000000000000
>>>>> [ 2567.833254] Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
>>>>> [ 2567.839747] Modules linked in: snd_soc_wsa884x q6prm_clocks q6apm_lpass_dais snd_q6dsp_common q6apm_dai q6prm 8021q garp mrp stp llc usb_f_fs libcomposite qrtr_mhi snd_soc_hdmi_codec ath12k mac80211 libarc4 mhi panel_visionox_vtdr6130 snd_q6apm pci_pwrctl_pwrseq pci_pwrctl_core rpmsg_ctrl apr fastrpc qrtr_smd rpmsg_char wcd939x_usbss nb7vpq904m qcom_pd_mapper goodix_berlin_spi goodix_berlin_core ucsi_glink typec_ucsi pmic_glink_altmode aux_hpd_bridge qcom_battmgr leds_qcom_lpg msm ocmem drm_exec hci_uart qcom_pbs gpu_sched led_class_multicolor btqca phy_qcom_eusb2_repeater btbcm qcom_spmi_temp_alarm drm_dp_aux_bus phy_qcom_qmp_combo crct10dif_ce bluetooth drm_display_helper sm3_ce ecdh_generic aux_bridge sm3 snd_soc_sc8280xp pwrseq_qcom_wcn sha3_ce snd_soc_qcom_sdw rtc_pm8xxx qcom_pon ecc nvmem_qcom_spmi_sdam sha512_ce qcom_stats spi_geni_qcom snd_soc_qcom_common sha512_arm64 pwrseq_core i2c_qcom_geni cfg80211 drm_kms_helper dispcc_sm8550 gpi ipa 
>>>>> snd_soc_lpass_va_macro snd_soc_lpass_tx_macro soundwire_qcom
>>>>> [ 2567.839860]  pinctrl_sm8650_lpass_lpi snd_soc_lpass_wsa_macro snd_soc_lpass_rx_macro rfkill slimbus phy_qcom_snps_eusb2 pinctrl_lpass_lpi gpucc_sm8650 snd_soc_lpass_macro_common qcom_q6v5_pas qcom_pil_info qcom_q6v5 qcrypto authenc icc_bwmon qcom_sysmon qcom_common qrtr qcom_glink_smem phy_qcom_qmp_pcie mdt_loader libdes llcc_qcom ufs_qcom phy_qcom_qmp_ufs pmic_glink snd_soc_wcd939x rmtfs_mem pdr_interface snd_soc_wcd939x_sdw regmap_sdw qcom_pdr_msg snd_soc_wcd_mbhc qmi_helpers snd_soc_wcd_classh soundwire_bus typec nvmem_reboot_mode qcom_rng socinfo fuse drm backlight ipv6
>>>>> [ 2567.983445] CPU: 5 UID: 0 PID: 554 Comm: kms_writeback Tainted: G S                 6.12.0-rc1-00022-ge581f752bf79 #2
>>>>> [ 2567.994390] Tainted: [S]=CPU_OUT_OF_SPEC
>>>>> [ 2567.998483] Hardware name: Qualcomm Technologies, Inc. SM8650 QRD (DT)
>>>>> [ 2568.005244] pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>>>>> [ 2568.012455] pc : dpu_encoder_helper_phys_setup_cwb+0xb8/0x1ec [msm]
>>>>> [ 2568.019009] lr : dpu_encoder_helper_phys_setup_cwb+0x88/0x1ec [msm]
>>>>> [ 2568.025532] sp : ffff80008939b7e0
>>>>> [ 2568.028999] x29: ffff80008939b810 x28: ffffcbcb66f26068 x27: ffff37ad962cb080
>>>>> [ 2568.036388] x26: ffff37ad9887ed80 x25: ffff80008939b878 x24: ffff37ad43642a80
>>>>> [ 2568.043775] x23: 0000000000000000 x22: ffff37ad42812080 x21: ffff37ad43642a80
>>>>> [ 2568.051163] x20: ffff37ad962cb080 x19: ffff37ad962c8080 x18: 0000000000000001
>>>>> [ 2568.058552] x17: 000000040044ffff x16: ffffcbcbb0fc8c64 x15: 00003d08ffff9c00
>>>>> [ 2568.065939] x14: 00000013519b2832 x13: ffff37ad9d392200 x12: 000000000000000b
>>>>> [ 2568.073325] x11: ffff37ad40dc56c0 x10: ffff37ad9d392200 x9 : ffff37afbe7bba80
>>>>> [ 2568.080712] x8 : ffff37ad42812718 x7 : 0000000000000004 x6 : ffff37ad989ac798
>>>>> [ 2568.088098] x5 : 0000000000000002 x4 : ffff80008939b7f8 x3 : ffff37ad962cb150
>>>>> [ 2568.095480] x2 : 0000000000000002 x1 : 0000000000000000 x0 : 0000000000000001
>>>>> [ 2568.102868] Call trace:
>>>>> [ 2568.105446]  dpu_encoder_helper_phys_setup_cwb+0xb8/0x1ec [msm]
>>>>> [ 2568.111608]  dpu_encoder_helper_phys_cleanup+0x328/0x3c4 [msm]
>>>>> [ 2568.117692]  dpu_encoder_phys_wb_disable+0x80/0xac [msm]
>>>>> [ 2568.123233]  dpu_encoder_virt_atomic_disable+0xb4/0x160 [msm]
>>>>> [ 2568.129224]  disable_outputs+0x108/0x32c [drm_kms_helper]
>>>>> [ 2568.134858]  drm_atomic_helper_commit_modeset_disables+0x1c/0x4c [drm_kms_helper]
>>>>> [ 2568.142614]  msm_atomic_commit_tail+0x188/0x514 [msm]
>>>>> [ 2568.147894]  commit_tail+0xa4/0x18c [drm_kms_helper]
>>>>> [ 2568.153065]  drm_atomic_helper_commit+0x17c/0x194 [drm_kms_helper]
>>>>> [ 2568.159482]  drm_atomic_commit+0xb8/0xf4 [drm]
>>>>> [ 2568.164176]  drm_mode_atomic_ioctl+0xad4/0xd88 [drm]
>>>>> [ 2568.169369]  drm_ioctl_kernel+0xc0/0x128 [drm]
>>>>> [ 2568.174039]  drm_ioctl+0x218/0x49c [drm]
>>>>> [ 2568.178165]  __arm64_sys_ioctl+0xac/0xf0
>>>>> [ 2568.182271]  invoke_syscall+0x48/0x10c
>>>>> [ 2568.186217]  el0_svc_common.constprop.0+0xc0/0xe0
>>>>> [ 2568.191109]  do_el0_svc+0x1c/0x28
>>>>> [ 2568.194576]  el0_svc+0x34/0xd8
>>>>> [ 2568.197788]  el0t_64_sync_handler+0x120/0x12c
>>>>> [ 2568.202321]  el0t_64_sync+0x190/0x194
>>>>> [ 2568.206157] Code: 910063e1 f8607822 f8607861 b9401042 (b9401021)
>>>>> [ 2568.212484] ---[ end trace 0000000000000000 ]---
>>>>>
>>>>> Neil
>>>>>
>>>>>> +                rt_pp_idx[i] = enable ? hw_pp->idx : PINGPONG_NONE;
>>>>>> +                break;
>>>>>> +            }
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    /*
>>>>>> +     * The CWB mux supports using LM or DSPP as tap points. For now,
>>>>>> +     * always use LM tap point
>>>>>> +     */
>>>>>> +    cwb_cfg.input = INPUT_MODE_LM_OUT;
>>>>>> +
>>>>>> +    for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
>>>>>> +        hw_cwb = dpu_enc->hw_cwb[i];
>>>>>> +        if (!hw_cwb)
>>>>>> +            continue;
>>>>>> +
>>>>>> +        cwb_cfg.pp_idx = rt_pp_idx[i];
>>>>>> +
>>>>>> +        hw_cwb->ops.config_cwb(hw_cwb, &cwb_cfg);
>>>>>> +    }
>>>>>> +}
>>>>>> +
>>>>>>   void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
>>>>>>                          const struct msm_format *dpu_fmt,
>>>>>>                          u32 output_type)
>>>>>> @@ -2557,6 +2630,14 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
>>>>>>       return INTF_MODE_NONE;
>>>>>>   }
>>>>>> +unsigned int dpu_encoder_helper_get_cwb(struct dpu_encoder_phys *phys_enc)
>>>>>> +{
>>>>>> +    struct drm_encoder *encoder = phys_enc->parent;
>>>>>> +    struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
>>>>>> +
>>>>>> +    return dpu_enc->cwb_mask;
>>>>>> +}
>>>>>> +
>>>>>>   unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
>>>>>>   {
>>>>>>       struct drm_encoder *encoder = phys_enc->parent;
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/ drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>>> index e77ebe3a68da..d7a02d1f8053 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>>>>> @@ -1,6 +1,6 @@
>>>>>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>>>>>   /*
>>>>>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>>    * Copyright (c) 2015-2018 The Linux Foundation. All rights reserved.
>>>>>>    */
>>>>>> @@ -331,6 +331,12 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>>>>>>       return BLEND_3D_NONE;
>>>>>>   }
>>>>>> +/**
>>>>>> + * dpu_encoder_helper_get_cwb - get CWB blocks mask for the DPU encoder
>>>>>> + * @phys_enc: Pointer to physical encoder structure
>>>>>> + */
>>>>>> +unsigned int dpu_encoder_helper_get_cwb(struct dpu_encoder_phys *phys_enc);
>>>>>> +
>>>>>>   /**
>>>>>>    * dpu_encoder_helper_get_dsc - get DSC blocks mask for the DPU encoder
>>>>>>    *   This helper function is used by physical encoder to get DSC blocks mask
>>>>>> @@ -400,6 +406,14 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>>>>>>    */
>>>>>>   void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc);
>>>>>> +/**
>>>>>> + * dpu_encoder_helper_phys_setup_cwb - helper to configure CWB muxes
>>>>>> + * @phys_enc: Pointer to physical encoder structure
>>>>>> + * @enable: Enable CWB mux
>>>>>> + */
>>>>>> +void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
>>>>>> +                       bool enable);
>>>>>> +
>>>>>>   /**
>>>>>>    * dpu_encoder_helper_phys_setup_cdm - setup chroma down sampling block
>>>>>>    * @phys_enc: Pointer to physical encoder
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/ drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>>>> index 882c717859ce..e88c4d91041f 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>>>>> @@ -1,6 +1,6 @@
>>>>>>   // SPDX-License-Identifier: GPL-2.0-only
>>>>>>   /*
>>>>>> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>>    */
>>>>>>   #define pr_fmt(fmt)    "[drm:%s:%d] " fmt, __func__, __LINE__
>>>>>> @@ -342,6 +342,8 @@ static void dpu_encoder_phys_wb_setup(
>>>>>>       dpu_encoder_helper_phys_setup_cdm(phys_enc, dpu_fmt, CDM_CDWN_OUTPUT_WB);
>>>>>> +    dpu_encoder_helper_phys_setup_cwb(phys_enc, true);
>>>>>> +
>>>>>>       dpu_encoder_phys_wb_setup_ctl(phys_enc);
>>>>>>   }
>>>>>>
>>>>>
>>>>
>>>
>>
> 

