Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C61B776B08D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 12:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E074F10E397;
	Tue,  1 Aug 2023 10:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A614E10E389
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 10:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690884690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4d5RyAtCPiwLt7dbKP8CSoyRE5uv1V8AZ3SwH/RgHzg=;
 b=W071uGKmdNNdOP+rFdBHaqJbG6HTHo62KTks7XiaPjvN5Cyd+NdBedze63qgLr29vmcvg6
 zfB8Ag/2TdHZTJKnohuz+9mnkxXfd5vzKh4zRdGD8joYaudSo5T9u6OMqmneXZlWEacJZh
 jclzPFISa/CvtnxT4aZQ6D2PRj6Irw4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-XHDwdwHZOLG_SIbMqJbYSg-1; Tue, 01 Aug 2023 06:11:29 -0400
X-MC-Unique: XHDwdwHZOLG_SIbMqJbYSg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-314134f403fso2751026f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 03:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690884688; x=1691489488;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=egslrfokJ14avjI7flC3SHtXVo9v1x5zibGCJO8LHlI=;
 b=CDxoM5d0TZBojvFWf3h7RsdF77HnrRQ07TfPkg1PasGhNJeUra6jW+SbS5ctNaq+S+
 yruqY+gDJdHlOi+0sgYlVMNEVvkpVTMwynkTZMrJG9Bdtr+Ur/6OhBtRAOUD3evPBPIl
 N5SAA/HRQIi73bjghA8oGC8BdZUyRD6zh6DrsEouAiKeEGcTxFVzeiPvcV7G1rDRkHUJ
 +D2FCuyaIgtjjhtoaItW27Zd4p8YJEicqgEiU8kRTiC006oLAM5h4czv/LkzdcM1FGj5
 /2zZrIqt7wxTIQOdmFXCZ39WfEW+/RUeLiUjrCyTGaLycfE4gnRtFbWANp0uyPUfc3AB
 Oo7g==
X-Gm-Message-State: ABy/qLaEXt+JrD12OSLevlafc1JGRCrN6EeKcNAUgNzPXgjSS6gY0bzM
 inO3YBNJ4ho5A1jUGpIds30W0dYEGBHgMEVYJ4VI5W7tUdNc/nVYGW8Dbj++ZRbDw7x34DzSzyP
 hyt4tbO/9Uzdd/uFDO8WcucYPpeNb
X-Received: by 2002:a5d:6782:0:b0:314:182a:3d96 with SMTP id
 v2-20020a5d6782000000b00314182a3d96mr1741225wru.28.1690884688349; 
 Tue, 01 Aug 2023 03:11:28 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFCq2ociEh4M4LECQRb6HFtw/eWt2plu/78OpMr/ul4PqW/UmBBOHB/Um0zf/9YCN9+cXFFKA==
X-Received: by 2002:a5d:6782:0:b0:314:182a:3d96 with SMTP id
 v2-20020a5d6782000000b00314182a3d96mr1741209wru.28.1690884687996; 
 Tue, 01 Aug 2023 03:11:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b?
 ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
 by smtp.gmail.com with ESMTPSA id
 h16-20020adffa90000000b0031423a8f4f7sm15623464wrr.56.2023.08.01.03.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 03:11:27 -0700 (PDT)
Message-ID: <548751aa-6184-a5b0-2b90-d96ca04a8640@redhat.com>
Date: Tue, 1 Aug 2023 12:11:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
To: Roger Sewell <roger.sewell@cantab.net>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
 <20230727223438.4658@revelation.broadband>
 <d5156750-34d4-87dc-41ff-f3c3ca1f48c3@suse.de>
 <3ff67cb3-c477-b834-3d6c-4eb99952d59b@redhat.com>
 <20230728131253.5411@revelation.broadband>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20230728131253.5411@revelation.broadband>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------Q2c0yt9VjZTpLtXJx7THo6CA"
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------Q2c0yt9VjZTpLtXJx7THo6CA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/07/2023 14:12, Roger Sewell wrote:
> 
> Thomas, Jocelyn,
> 
> JF> I think the culprit is probably this patch:
> JF> https://patchwork.freedesktop.org/patch/486242/
> JF>
> JF> before this patch,
> JF> mgag200_simple_display_pipe_mode_valid() always return MODE_OK
> JF>
> JF> after this patch, it checks the bandwidth limit too.
> 
> It turns out to be more complicated than that - and I still think it is
> something to do with how the two functions
> mgag200_simple_display_pipe_mode_valid and
> mgag200_mode_config_mode_valid are made known to the rest of the drm
> system, i.e. which slots in the various function structures they are put
> in.
> 
> I attach a contiguous excerpt from /var/log/messages, recording what
> happened when I did the following.
> 
> 1. I instrumented the old mgag200 module with printk statements in
>     mgag200_simple_display_pipe_mode_valid and mga_vga_mode_valid and
>     mga_vga_calculate_mode_bandwidth, and also put in a call to the
>     latter in mgag200_simple_display_pipe_mode_valid so that I could see
>     what parameters it had been called with. I then rebooted the system,
>     getting the messages starting at Jul 28 10:42:45 . As you will see,
>     almost every time mgag200_simple_display_pipe_mode_valid is called it
>     is immediately following a return of MODE_OK from mga_vga_mode_valid
>     with the same display parameters - the two exceptions are:
> 
>     a) at line 1156 is when it is called after "fbcon: mgag200drmfb (fb0)
>        is primary device", and
> 
>     b) with the mode actually being set (1440x900) at line 2681 when it
>        of course returns MODE_OK (as that is what it always returns, as
>        you say).
> 
> 2. I then switched to the new mgag200 module similarly instrumented, but
>     with the unique_rev_id increased by 1 to get sufficient bandwidth to
>     make 1440x900 usable. I then rebooted the system, getting the
>     messages starting at Jul 28 11:46:53 . Again, almost every time
>     mgag200_simple_display_pipe_mode_valid is called it is immediately
>     after a return of MODE_OK from mgag200_mode_config_mode_valid, and we
>     still have exception type (a) at line 5672. However, the exception
>     type (b) is no longer present, as at line 6590, on setting the
>     1440x900 mode, there is now a call of mgag200_mode_config_mode_valid
>     preceding the call of mgag200_simple_display_pipe_mode_valid.
> 
> 3. I then modified that mgag200 module by forcing a return of MODE_OK
>     from mgag200_simple_display_pipe_mode_valid and removing the
>     increment to unique_rev_id, so that 1440x900 is no longer "valid"
>     according to the criteria being used. I rebooted, getting the
>     messages starting at Jul 28 12:12:34 . Now at line 11004 we have a
>     failure to set mode immediately followed by a return of MODE_BAD, not
>     from mgag200_simple_display_pipe_mode_valid but from
>     mgag200_mode_config_mode_valid.
> 
> Thus between the old mgag200 module and the new one, there is a change
> in when the mode_config_mode_valid function gets called - there being
> one extra call. So even if one were to revert to
> mgag200_simple_display_pipe_mode_valid just always returning MODE_OK it
> wouldn't fix the problem.
> 
> At present I don't see how the change of behaviour can be anything other
> than to do with the way these function names are passed to the rest of
> the drm system (though of course even if that were reverted, the fact
> that mgag200_simple_display_pipe_mode_valid now tests bandwidth would
> still cause what I want to do to fail).
> 
> Sadly I don't understand how the drm system works, so I'm not sure that
> I can shed any more light - but if there are any more experiments that
> would help, please do let me know.

I think the issue is that in v5.18, the memory check was done on the 
connector mode_valid() callback, and in v6.0, it's done in the 
mode_config mode_valid() callback.

Can you please try the patch attached, I moved the bandwidth check back 
to the connector callback.

Best regards,

-- 

Jocelyn
> 
> Thanks,
> Roger.
> 

--------------Q2c0yt9VjZTpLtXJx7THo6CA
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-mgag200-move-the-memory-bandwidth-check-to-the-c.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-mgag200-move-the-memory-bandwidth-check-to-the-c.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBmMTM0YzgyMmIxMWY4ZThkMTZjN2Y3MmZlODA3N2M1OGY5ZWJiMWZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKb2NlbHluIEZhbGVtcGUgPGpmYWxlbXBlQHJlZGhhdC5jb20+
CkRhdGU6IFR1ZSwgMSBBdWcgMjAyMyAxMTo0OToxNCArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIGRy
bS9tZ2FnMjAwOiBtb3ZlIHRoZSBtZW1vcnkgYmFuZHdpZHRoIGNoZWNrIHRvIHRoZSBjb25uZWN0
b3IKIGNhbGxiYWNrCgpQcmlvciB0byBjb21taXQgNDc1ZTJiOTcwY2MzICgiZHJtL21nYWcyMDA6
IFNwbGl0IHVwIGNvbm5lY3RvcidzIG1vZGVfdmFsaWQKaGVscGVyIiksIHRoZSBtZW1vcnkgYmFu
ZHdpZHRoIGNoZWNrIHdhcyBkb25lIG9uIHRoZSBjb25uZWN0b3IgaGVscGVyLgpJdCB0aGVuIG1v
dmVkIHRvIHRoZSBkcm1fbW9kZV9jb25maWdfZnVuY3MgaGVscGVyLCB3aGljaCBjYW4ndCBiZQpi
eXBhc3NlZCBieSB0aGUgdXNlcnNwYWNlLCBhbmQgc29tZSByZXNvbHV0aW9uIChsaWtlIDE0NDB4
OTAwKSB0aGF0CnVzZWQgdG8gd29yayBhcmUgbm93IGJyb2tlbi4KClNpZ25lZC1vZmYtYnk6IEpv
Y2VseW4gRmFsZW1wZSA8amZhbGVtcGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bWdhZzIwMC9tZ2FnMjAwX21vZGUuYyB8IDgzICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYwppbmRleCAyMjVjY2EyZWQ2MGUuLjZmZDU3MzQw
ZDY3NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMKQEAgLTcwNyw4ICs3
MDcsNTQgQEAgc3RhdGljIGludCBtZ2FnMjAwX3ZnYV9jb25uZWN0b3JfaGVscGVyX2dldF9tb2Rl
cyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG8KIAlyZXR1cm4gcmV0OwogfQogCisvKiBD
YWxjdWxhdGVzIGEgbW9kZSdzIHJlcXVpcmVkIG1lbW9yeSBiYW5kd2lkdGggKGluIEtpQi9zZWMp
LiAqLworc3RhdGljIHVpbnQzMl90IG1nYWcyMDBfY2FsY3VsYXRlX21vZGVfYmFuZHdpZHRoKGNv
bnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlLAorCQkJCQkJIHVuc2lnbmVkIGludCBi
aXRzX3Blcl9waXhlbCkKK3sKKwl1aW50MzJfdCB0b3RhbF9hcmVhLCBkaXZpc29yOworCXVpbnQ2
NF90IGFjdGl2ZV9hcmVhLCBwaXhlbHNfcGVyX3NlY29uZCwgYmFuZHdpZHRoOworCXVpbnQ2NF90
IGJ5dGVzX3Blcl9waXhlbCA9IChiaXRzX3Blcl9waXhlbCArIDcpIC8gODsKKworCWRpdmlzb3Ig
PSAxMDI0OworCisJaWYgKCFtb2RlLT5odG90YWwgfHwgIW1vZGUtPnZ0b3RhbCB8fCAhbW9kZS0+
Y2xvY2spCisJCXJldHVybiAwOworCisJYWN0aXZlX2FyZWEgPSBtb2RlLT5oZGlzcGxheSAqIG1v
ZGUtPnZkaXNwbGF5OworCXRvdGFsX2FyZWEgPSBtb2RlLT5odG90YWwgKiBtb2RlLT52dG90YWw7
CisKKwlwaXhlbHNfcGVyX3NlY29uZCA9IGFjdGl2ZV9hcmVhICogbW9kZS0+Y2xvY2sgKiAxMDAw
OworCWRvX2RpdihwaXhlbHNfcGVyX3NlY29uZCwgdG90YWxfYXJlYSk7CisKKwliYW5kd2lkdGgg
PSBwaXhlbHNfcGVyX3NlY29uZCAqIGJ5dGVzX3Blcl9waXhlbCAqIDEwMDsKKwlkb19kaXYoYmFu
ZHdpZHRoLCBkaXZpc29yKTsKKworCXJldHVybiAodWludDMyX3QpYmFuZHdpZHRoOworfQorCitz
dGF0aWMgZW51bSBkcm1fbW9kZV9zdGF0dXMgbWdhZzIwMF92Z2FfY29ubmVjdG9yX2hlbHBlcl9t
b2RlX3ZhbGlkKAorCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCisJc3RydWN0IGRy
bV9kaXNwbGF5X21vZGUgKm1vZGUpCit7CisJc3RydWN0IG1nYV9kZXZpY2UgKm1kZXYgPSB0b19t
Z2FfZGV2aWNlKGNvbm5lY3Rvci0+ZGV2KTsKKwljb25zdCBzdHJ1Y3QgbWdhZzIwMF9kZXZpY2Vf
aW5mbyAqaW5mbyA9IG1kZXYtPmluZm87CisKKwkvKgorCSAqIFRlc3QgdGhlIG1vZGUncyByZXF1
aXJlZCBtZW1vcnkgYmFuZHdpZHRoIGlmIHRoZSBkZXZpY2UKKwkgKiBzcGVjaWZpZXMgYSBtYXhp
bXVtLiBOb3QgYWxsIGRldmljZXMgZG8gdGhvdWdoLgorCSAqLworCWlmIChpbmZvLT5tYXhfbWVt
X2JhbmR3aWR0aCkgeworCQl1aW50MzJfdCBtb2RlX2JhbmR3aWR0aCA9IG1nYWcyMDBfY2FsY3Vs
YXRlX21vZGVfYmFuZHdpZHRoKG1vZGUsIDMyKTsKKworCQlpZiAobW9kZV9iYW5kd2lkdGggPiAo
aW5mby0+bWF4X21lbV9iYW5kd2lkdGggKiAxMDI0KSkKKwkJCXJldHVybiBNT0RFX0JBRDsKKwl9
CisJcmV0dXJuIE1PREVfT0s7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
cl9oZWxwZXJfZnVuY3MgbWdhX3ZnYV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzID0gewogCS5nZXRf
bW9kZXMgID0gbWdhZzIwMF92Z2FfY29ubmVjdG9yX2hlbHBlcl9nZXRfbW9kZXMsCisJLm1vZGVf
dmFsaWQgPSBtZ2FnMjAwX3ZnYV9jb25uZWN0b3JfaGVscGVyX21vZGVfdmFsaWQsCiB9OwogCiBz
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MgbWdhX3ZnYV9jb25uZWN0b3Jf
ZnVuY3MgPSB7CkBAIC05ODYsMzggKzEwMzIsMTIgQEAgc3RhdGljIGNvbnN0IHVpbnQ2NF90IG1n
YWcyMDBfc2ltcGxlX2Rpc3BsYXlfcGlwZV9mbXRtb2RzW10gPSB7CiAgKiBNb2RlIGNvbmZpZwog
ICovCiAKLS8qIENhbGN1bGF0ZXMgYSBtb2RlJ3MgcmVxdWlyZWQgbWVtb3J5IGJhbmR3aWR0aCAo
aW4gS2lCL3NlYykuICovCi1zdGF0aWMgdWludDMyX3QgbWdhZzIwMF9jYWxjdWxhdGVfbW9kZV9i
YW5kd2lkdGgoY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUsCi0JCQkJCQkgdW5z
aWduZWQgaW50IGJpdHNfcGVyX3BpeGVsKQotewotCXVpbnQzMl90IHRvdGFsX2FyZWEsIGRpdmlz
b3I7Ci0JdWludDY0X3QgYWN0aXZlX2FyZWEsIHBpeGVsc19wZXJfc2Vjb25kLCBiYW5kd2lkdGg7
Ci0JdWludDY0X3QgYnl0ZXNfcGVyX3BpeGVsID0gKGJpdHNfcGVyX3BpeGVsICsgNykgLyA4Owot
Ci0JZGl2aXNvciA9IDEwMjQ7Ci0KLQlpZiAoIW1vZGUtPmh0b3RhbCB8fCAhbW9kZS0+dnRvdGFs
IHx8ICFtb2RlLT5jbG9jaykKLQkJcmV0dXJuIDA7Ci0KLQlhY3RpdmVfYXJlYSA9IG1vZGUtPmhk
aXNwbGF5ICogbW9kZS0+dmRpc3BsYXk7Ci0JdG90YWxfYXJlYSA9IG1vZGUtPmh0b3RhbCAqIG1v
ZGUtPnZ0b3RhbDsKLQotCXBpeGVsc19wZXJfc2Vjb25kID0gYWN0aXZlX2FyZWEgKiBtb2RlLT5j
bG9jayAqIDEwMDA7Ci0JZG9fZGl2KHBpeGVsc19wZXJfc2Vjb25kLCB0b3RhbF9hcmVhKTsKLQot
CWJhbmR3aWR0aCA9IHBpeGVsc19wZXJfc2Vjb25kICogYnl0ZXNfcGVyX3BpeGVsICogMTAwOwot
CWRvX2RpdihiYW5kd2lkdGgsIGRpdmlzb3IpOwotCi0JcmV0dXJuICh1aW50MzJfdCliYW5kd2lk
dGg7Ci19Ci0KIHN0YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cyBtZ2FnMjAwX21vZGVfY29uZmln
X21vZGVfdmFsaWQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJCQkJCQkgICBjb25zdCBzdHJ1
Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKIHsKIAlzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50
IG1heF9icHAgPSA0OyAvLyBEUk1fRk9STUFUX1hSR0I4ODg4CiAJc3RydWN0IG1nYV9kZXZpY2Ug
Km1kZXYgPSB0b19tZ2FfZGV2aWNlKGRldik7CiAJdW5zaWduZWQgbG9uZyBmYnNpemUsIGZicGFn
ZXMsIG1heF9mYnBhZ2VzOwotCWNvbnN0IHN0cnVjdCBtZ2FnMjAwX2RldmljZV9pbmZvICppbmZv
ID0gbWRldi0+aW5mbzsKIAogCW1heF9mYnBhZ2VzID0gbWRldi0+dnJhbV9hdmFpbGFibGUgPj4g
UEFHRV9TSElGVDsKIApAQCAtMTAyNywxNyArMTA0Nyw2IEBAIHN0YXRpYyBlbnVtIGRybV9tb2Rl
X3N0YXR1cyBtZ2FnMjAwX21vZGVfY29uZmlnX21vZGVfdmFsaWQoc3RydWN0IGRybV9kZXZpY2Ug
KmRlCiAJaWYgKGZicGFnZXMgPiBtYXhfZmJwYWdlcykKIAkJcmV0dXJuIE1PREVfTUVNOwogCi0J
LyoKLQkgKiBUZXN0IHRoZSBtb2RlJ3MgcmVxdWlyZWQgbWVtb3J5IGJhbmR3aWR0aCBpZiB0aGUg
ZGV2aWNlCi0JICogc3BlY2lmaWVzIGEgbWF4aW11bS4gTm90IGFsbCBkZXZpY2VzIGRvIHRob3Vn
aC4KLQkgKi8KLQlpZiAoaW5mby0+bWF4X21lbV9iYW5kd2lkdGgpIHsKLQkJdWludDMyX3QgbW9k
ZV9iYW5kd2lkdGggPSBtZ2FnMjAwX2NhbGN1bGF0ZV9tb2RlX2JhbmR3aWR0aChtb2RlLCBtYXhf
YnBwICogOCk7Ci0KLQkJaWYgKG1vZGVfYmFuZHdpZHRoID4gKGluZm8tPm1heF9tZW1fYmFuZHdp
ZHRoICogMTAyNCkpCi0JCQlyZXR1cm4gTU9ERV9CQUQ7Ci0JfQotCiAJcmV0dXJuIE1PREVfT0s7
CiB9CiAKLS0gCjIuNDEuMAoK
--------------Q2c0yt9VjZTpLtXJx7THo6CA--

