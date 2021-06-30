Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD55D3B7CC1
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 06:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8616E924;
	Wed, 30 Jun 2021 04:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB086E924
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 04:29:16 +0000 (UTC)
Received: from [222.129.34.206] (helo=[192.168.1.18])
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <aaron.ma@canonical.com>)
 id 1lyRqb-0003QF-SV; Wed, 30 Jun 2021 04:29:14 +0000
To: lyude@redhat.com, jani.nikula@intel.com, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>, stable@vger.kernel.org
References: <20210519095305.47133-1-aaron.ma@canonical.com>
 <57b373372cb64e8a48d12e033a23e7711332b0ec.camel@redhat.com>
From: Aaron Ma <aaron.ma@canonical.com>
Subject: Re: [PATCH] drm/i915: Force DPCD backlight mode for Samsung 16727
 panel
Message-ID: <33f42229-780f-9b4e-69db-db3fad32bf3a@canonical.com>
Date: Wed, 30 Jun 2021 12:29:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <57b373372cb64e8a48d12e033a23e7711332b0ec.camel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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

Hi Greg:

Could this patch get a chance to be applied on stable kernel?
It only for 5.11- kernel, not for Linus' tree.

Thanks,
Aaron

On 5/20/21 12:27 AM, Lyude Paul wrote:
> Seems reasonable to me:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> On Wed, 2021-05-19 at 17:53 +0800, Aaron Ma wrote:
>> Another Samsung OLED panel needs DPCD to get control of backlight.
>> Kernel 5.12+ support the backlight via:
>> commit: <4a8d79901d5b> ("drm/i915/dp: Enable Intel's HDR backlight int=
erface
>> (only SDR for now)")
>> Only make backlight work on lower versions of kernel.
>>
>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3474
>> Cc: stable@vger.kernel.org=C2=A0# 5.11-
>> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
>> ---
>>  =C2=A0drivers/gpu/drm/drm_dp_helper.c | 1 +
>>  =C2=A01 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_=
helper.c
>> index 5bd0934004e3..7b91d8a76cd6 100644
>> --- a/drivers/gpu/drm/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/drm_dp_helper.c
>> @@ -1960,6 +1960,7 @@ static const struct edid_quirk edid_quirk_list[]=
 =3D {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ MFG(0x4d, 0x10), PR=
OD_ID(0xe6, 0x14),
>> BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ MFG(0x4c, 0x83), PR=
OD_ID(0x47, 0x41),
>> BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ MFG(0x09, 0xe5), PR=
OD_ID(0xde, 0x08),
>> BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ MFG(0x4c, 0x83), PROD_ID(=
0x57, 0x41),
>> BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
>>  =C2=A0};
>>  =20
>>  =C2=A0#undef MFG


