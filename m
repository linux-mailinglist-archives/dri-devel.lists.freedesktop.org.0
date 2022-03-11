Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFC74D6148
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 13:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B3110E951;
	Fri, 11 Mar 2022 12:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1469D10E94E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 12:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647000730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=osGJxTmIVUcN2lm3C6s+f+4JyYHWv+8ETj+5z9WsXdc=;
 b=PNFy4dJwmIc4EwFseBudfJfBOvHnp3NGcwYqbNnR03zynYr4T1fndCM/lS6R63YvyF9nvR
 Fraq6QOihDiQ3VCJGtOcdJPF8x9QYthYV26RMCN+zzHfFi41dXtBI5nNWHkvWR7Fpv/rNB
 L9wvVCncJ7XwroPRBmLpFgaYObhImWg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-g7VObrHTOB2ubR9hhvES-A-1; Fri, 11 Mar 2022 07:12:08 -0500
X-MC-Unique: g7VObrHTOB2ubR9hhvES-A-1
Received: by mail-ej1-f70.google.com with SMTP id
 m12-20020a1709062acc00b006cfc98179e2so4849637eje.6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 04:12:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to;
 bh=4Gw9HWQW1QtNugIUAim6mJjbTffTDpT5qAjbtrRFAtk=;
 b=VPG5uUwsphDcNnts4SxofkMEAyyC/Xo6LraslLD4dKLT3oPnHwTuqiEaDjWwrmsHCq
 D8WAulL08gTd4gW0G9Co93sv8VFo3e94PnDwGaWMze3Hftv7yjw9qMwKuMHY2oR7/d3K
 kROJRCHOjrDfCV1PjmYEagYC2xY9KG0K1PlU4IDz2opF/Sfn5Q4WAy9n4jzhBM3vIjBU
 ocJoqiSI3z6Qhm61ZeIrlfNDnytMnQcZXAci4YEh+veUqfi0OJkJr0Eug5D9mD6zWPHG
 FebtknhS8bnWKomfa13NJfvuZQN5NlxCq/csrloMI+83JB1CuB5SCjMKSivk9umiZ88Z
 J0Qg==
X-Gm-Message-State: AOAM53069mM24V9t/gb1+/pPkwEcw81HTHL/P3ps2/HZMSBrieMUF9ae
 Qq5Ys+mmr6c0sjkUqwQk1FOl7zz7+9/Ym53tfrqlE7HndzImC70xC6HhiDdrCXQvDyStdM7vh12
 +ysDJVBym0PgNfj6amDe5pkQ0sB3S
X-Received: by 2002:a17:907:3e99:b0:6db:6c1c:d9d9 with SMTP id
 hs25-20020a1709073e9900b006db6c1cd9d9mr8348936ejc.688.1647000727486; 
 Fri, 11 Mar 2022 04:12:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeQZZ0/PjTWsnEVRUmeueb5zTpvvynCcjhvqgla7wn6hRGUEpxkz4WyMc22ar3ufoKotEzPQ==
X-Received: by 2002:a17:907:3e99:b0:6db:6c1c:d9d9 with SMTP id
 hs25-20020a1709073e9900b006db6c1cd9d9mr8348889ejc.688.1647000726938; 
 Fri, 11 Mar 2022 04:12:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0?
 (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a1709066b8200b006bbea7e566esm2919171ejr.55.2022.03.11.04.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 04:12:06 -0800 (PST)
Message-ID: <b71a3775-a7e2-002d-7f2a-9036695eb172@redhat.com>
Date: Fri, 11 Mar 2022 13:12:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] drm/amdgpu: Add support for drm_privacy_screen
To: Rajat Jain <rajatja@google.com>, Sean Paul <sean@poorly.run>
References: <20220309150606.1877288-1-sean@poorly.run>
 <CACK8Z6GsZd5E74ZB9hRHWVov_cE0AfDNFcEvWeJHmtQAf_vz4A@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CACK8Z6GsZd5E74ZB9hRHWVov_cE0AfDNFcEvWeJHmtQAf_vz4A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------wBi6cJJMYYFO0b0ClHYlxqHd"
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------wBi6cJJMYYFO0b0ClHYlxqHd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 3/9/22 18:53, Rajat Jain wrote:
> On Wed, Mar 9, 2022 at 7:06 AM Sean Paul <sean@poorly.run> wrote:
>>
>> From: Sean Paul <seanpaul@chromium.org>
>>
>> This patch adds the necessary hooks to make amdgpu aware of privacy
>> screens. On devices with privacy screen drivers (such as thinkpad-acpi),
>> the amdgpu driver will defer probe until it's ready and then sync the sw
>> and hw state on each commit the connector is involved and enabled.
>>
>> Changes in v2:
>> -Tweaked the drm_privacy_screen_get() error check to avoid logging
>>  errors when privacy screen is absent (Hans)
>>
>> Signed-off-by: Sean Paul <seanpaul@chromium.org>
>> Link: https://patchwork.freedesktop.org/patch/477640/ #v1
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c          |  9 +++++++++
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  3 +++
>>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  | 16 +++++++++++++++-
>>  3 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 2ab675123ae3..e2cfae56c020 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -26,6 +26,7 @@
>>  #include <drm/drm_aperture.h>
>>  #include <drm/drm_drv.h>
>>  #include <drm/drm_gem.h>
>> +#include <drm/drm_privacy_screen_consumer.h>
>>  #include <drm/drm_vblank.h>
>>  #include <drm/drm_managed.h>
>>  #include "amdgpu_drv.h"
>> @@ -1988,6 +1989,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>>  {
>>         struct drm_device *ddev;
>>         struct amdgpu_device *adev;
>> +       struct drm_privacy_screen *privacy_screen;
>>         unsigned long flags = ent->driver_data;
>>         int ret, retry = 0, i;
>>         bool supports_atomic = false;
>> @@ -2063,6 +2065,13 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>>         size = pci_resource_len(pdev, 0);
>>         is_fw_fb = amdgpu_is_fw_framebuffer(base, size);
>>
>> +       /* If the LCD panel has a privacy screen, defer probe until its ready */
>> +       privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
>> +       if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
>> +               return -EPROBE_DEFER;
>> +
>> +       drm_privacy_screen_put(privacy_screen);
>> +
>>         /* Get rid of things like offb */
>>         ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &amdgpu_kms_driver);
>>         if (ret)
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index e1d3db3fe8de..9e2bb6523add 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -9781,6 +9781,9 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>>                 if (acrtc) {
>>                         new_crtc_state = drm_atomic_get_new_crtc_state(state, &acrtc->base);
>>                         old_crtc_state = drm_atomic_get_old_crtc_state(state, &acrtc->base);
>> +
>> +                       /* Sync the privacy screen state between hw and sw */
>> +                       drm_connector_update_privacy_screen(new_con_state);
>>                 }
>>
>>                 /* Skip any modesets/resets */
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>> index 740435ae3997..594a8002975a 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
>> @@ -27,6 +27,7 @@
>>  #include <drm/drm_atomic_helper.h>
>>  #include <drm/dp/drm_dp_mst_helper.h>
>>  #include <drm/dp/drm_dp_helper.h>
>> +#include <drm/drm_privacy_screen_consumer.h>
>>  #include "dm_services.h"
>>  #include "amdgpu.h"
>>  #include "amdgpu_dm.h"
>> @@ -506,6 +507,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>>                                        struct amdgpu_dm_connector *aconnector,
>>                                        int link_index)
>>  {
>> +       struct drm_device *dev = dm->ddev;
>>         struct dc_link_settings max_link_enc_cap = {0};
>>
>>         aconnector->dm_dp_aux.aux.name =
>> @@ -519,8 +521,20 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>>         drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
>>                                       &aconnector->base);
>>
>> -       if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP)
>> +       if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP) {
>> +               struct drm_privacy_screen *privacy_screen)
>> +
>> +               /* Reference given up in drm_connector_cleanup() */
>> +               privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
> 
> Can we try to be more specific when looking up for privacy screen, e.g.:
> 
> privacy_screen = drm_privacy_screen_get(dev->dev,  "eDP-1");
> (and then also making the corresponding change in arch_init_data[] in
> drm_privacy_screen_x86.c"

So I just checked and yes I think we can be more specific at least
for the thinkpad_acpi supported models. See the attached patch
which has been tested on a ThinkPad T14 gen 1 with a builtin privacy-screen.

Rajat, can you adjust the chrome code in drivers/gpu/drm/drm_privacy_screen_x86.c 
to match and check that with the chrome code changes, my patch does not break
things on chromebooks? (Note your changes will need to be squashed into the
patch so that we change all of this in one go) .

Sean, same request to you, can you adjust your amdgpu patch to match
the i915 changes in the attached patch and then check if a kernel
with both changes still works ?

Regards,

Hans



> 
> My comment applies to this driver as well as to i915. The reason being
> today there is only 1 internal display with privacy screen so we can
> just assume that there shall be only 1 privacy-screen and that shall
> apply to eDP-1/internal display. But dual display systems are not far
> enough out, and perhaps external monitors with inbuilt
> privacy-screens?
> 
> Essentially the gap today is that today on Chromeos ACPI side, the
> device GOOG0010 represents the privacy-screen attached to the internal
> display/eDP-1, but there isn't a way to make it clear in the i915 and
> now amdgpu code.
> 
> Thanks,
> 
> Rajat
> 
> 
>> +               if (!IS_ERR(privacy_screen)) {
>> +                       drm_connector_attach_privacy_screen_provider(&aconnector->base,
>> +                                                                    privacy_screen);
>> +               } else if (PTR_ERR(privacy_screen) != -ENODEV) {
>> +                       drm_err(dev, "Error getting privacy screen, ret=%d\n",
>> +                               PTR_ERR(privacy_screen));
>> +               }
>>                 return;
>> +       }
>>
>>         dc_link_dp_get_max_link_enc_cap(aconnector->dc_link, &max_link_enc_cap);
>>         aconnector->mst_mgr.cbs = &dm_mst_cbs;
>> --
>> Sean Paul, Software Engineer, Google / Chromium OS
>>
> 
--------------wBi6cJJMYYFO0b0ClHYlxqHd
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-privacy-screen-Hardcode.patch"
Content-Disposition: attachment;
 filename="0001-drm-privacy-screen-Hardcode.patch"
Content-Transfer-Encoding: base64

RnJvbSAwNDMyMGY5MzA3NWVlYjEzYTMwNWVjNzAzY2M5ZTU5MWNlMzM0NzQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpE
YXRlOiBGcmksIDExIE1hciAyMDIyIDEyOjI4OjQ3ICswMTAwClN1YmplY3Q6IFtQQVRDSF0gZHJt
L3ByaXZhY3ktc2NyZWVuOiBIYXJkY29kZQoKQVRNIHRoZSBkcm0gcHJpdmFjeS1zY3JlZW4gY29k
ZSBpcyBub3QgdXNpbmcgY29ubmVjdG9yIG5hbWVzIHRvIGxvb2t1cApkcm0gcHJpdmFjeS1zY3Jl
ZW4gcHJvdmlkZXJzLCBkcm1fcHJpdmFjeV9zY3JlZW5fZ2V0KCkgZG9lcyBzdXBwb3J0IHRoaXMs
CmJ1dCBiZWZvcmUgdGhpcyBjaGFuZ2UgdGhlIGNvbl9pZCBpcyBzZXQgdG8gTlVMTCBldmVyeXdo
ZXJlIHdoaWNoIGlzCnRyZWF0ZWQgYXMgYSB3aWxkY2FyZC4KClRoZXJlIGFyZSBzb21lIHdvcnJp
ZXMgdGhhdCB3ZSBtYXkgc2VlIGRldmljZXMgd2l0aCAyIGRpc3BsYXlzIHdpdGgKYSBwcml2YWN5
LXNjcmVlbiwgYmUgaXQgMiBpbnRlcm5hbCBkaXNwbGF5cyBvciAxIGludGVybmFsICsgMSBleHRl
cm5hbC4KCkFsbCBsYXB0b3AtbW9kZWxzIHdoaWNoIGN1cnJlbnRseSBhcmUgc3VwcG9ydGVkIGJ5
IHRoZSBkcm1fcHJpdmFjeV9zY3JlZW4KY29kZSB1c2UgYW4gZURQIGRpc3BsYXkgY29ubmVjdGVk
IHRvIGVEUC0xLgoKVGhpcyBjb21taXRzIGVuYWJsZXMgdGhlIHVzZSBvZiB0aGUgY29uX2lkIHBh
cmFtZXRlciwgaGFyZGNvZGluZyB0aGlzIHRvCiJlRFAtMSIgaW4gdGhlIGxvb2t1cCB0YWJsZXMg
aW4gZHJpdmVycy9ncHUvZHJtL2RybV9wcml2YWN5X3NjcmVlbl94ODYuYwphbmQgYWRqdXN0aW5n
IHRoZSBpOTE1IGRyaXZlciB0byBtYXRjaC4KClVzaW5nIHRoZSBjb25faWQgcGFyYW1ldGVyIHBh
dmVzIHRoZSB3YXkgZm9yIHBvdGVudGlhbGx5IGhhdmluZyBhbm90aGVyCmRpc3BsYXkgKGF0dGFj
aGVkIHRvIGEgZGlmZmVyZW50IGNvbm5lY3Rvcikgd2hpY2ggYWxzbyBoYXMgYSBidWlsdGluCnBy
aXZhY3ktc2NyZWVuLgoKU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVk
aGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3ByaXZhY3lfc2NyZWVuX3g4Ni5jICAg
ICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMgICAgIHwg
MiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgfCAyICst
CiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaXZhY3lfc2NyZWVuX3g4Ni5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9wcml2YWN5X3NjcmVlbl94ODYuYwppbmRleCBlN2FhNzRhZDBiMjQuLjA2
ZWE1YzUzNDZiNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcml2YWN5X3NjcmVl
bl94ODYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaXZhY3lfc2NyZWVuX3g4Ni5jCkBA
IC01NSw3ICs1NSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXJjaF9pbml0X2RhdGEgYXJjaF9p
bml0X2RhdGFbXSBfX2luaXRjb25zdCA9IHsKIAl7CiAJCS5sb29rdXAgPSB7CiAJCQkuZGV2X2lk
ID0gTlVMTCwKLQkJCS5jb25faWQgPSBOVUxMLAorCQkJLmNvbl9pZCA9ICJlRFAtMSIsCiAJCQku
cHJvdmlkZXIgPSAicHJpdmFjeV9zY3JlZW4tdGhpbmtwYWRfYWNwaSIsCiAJCX0sCiAJCS5kZXRl
Y3QgPSBkZXRlY3RfdGhpbmtwYWRfcHJpdmFjeV9zY3JlZW4sCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kZGkuYwppbmRleCBjYWI1MDUyNzc1OTUuLmUxOTMwYWI2ZmYxMSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jCkBAIC0zOTUxLDcgKzM5NTEs
NyBAQCBpbnRlbF9kZGlfaW5pdF9kcF9jb25uZWN0b3Ioc3RydWN0IGludGVsX2RpZ2l0YWxfcG9y
dCAqZGlnX3BvcnQpCiAJCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBkaWdfcG9ydC0+YmFzZS5i
YXNlLmRldjsKIAkJc3RydWN0IGRybV9wcml2YWN5X3NjcmVlbiAqcHJpdmFjeV9zY3JlZW47CiAK
LQkJcHJpdmFjeV9zY3JlZW4gPSBkcm1fcHJpdmFjeV9zY3JlZW5fZ2V0KGRldi0+ZGV2LCBOVUxM
KTsKKwkJcHJpdmFjeV9zY3JlZW4gPSBkcm1fcHJpdmFjeV9zY3JlZW5fZ2V0KGRldi0+ZGV2LCBj
b25uZWN0b3ItPmJhc2UubmFtZSk7CiAJCWlmICghSVNfRVJSKHByaXZhY3lfc2NyZWVuKSkgewog
CQkJZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfcHJpdmFjeV9zY3JlZW5fcHJvdmlkZXIoJmNvbm5lY3Rv
ci0+YmFzZSwKIAkJCQkJCQkJICAgICBwcml2YWN5X3NjcmVlbik7CmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCmluZGV4IGZiNDU1ZDM3MTBjNi4uYTVlMTJk
MzZkMmUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXku
YwpAQCAtMTA4MzUsNyArMTA4MzUsNyBAQCBib29sIGludGVsX21vZGVzZXRfcHJvYmVfZGVmZXIo
c3RydWN0IHBjaV9kZXYgKnBkZXYpCiAJCXJldHVybiB0cnVlOwogCiAJLyogSWYgdGhlIExDRCBw
YW5lbCBoYXMgYSBwcml2YWN5LXNjcmVlbiwgd2FpdCBmb3IgaXQgKi8KLQlwcml2YWN5X3NjcmVl
biA9IGRybV9wcml2YWN5X3NjcmVlbl9nZXQoJnBkZXYtPmRldiwgTlVMTCk7CisJcHJpdmFjeV9z
Y3JlZW4gPSBkcm1fcHJpdmFjeV9zY3JlZW5fZ2V0KCZwZGV2LT5kZXYsICJlRFAtMSIpOwogCWlm
IChJU19FUlIocHJpdmFjeV9zY3JlZW4pICYmIFBUUl9FUlIocHJpdmFjeV9zY3JlZW4pID09IC1F
UFJPQkVfREVGRVIpCiAJCXJldHVybiB0cnVlOwogCi0tIAoyLjM1LjEKCg==
--------------wBi6cJJMYYFO0b0ClHYlxqHd--

