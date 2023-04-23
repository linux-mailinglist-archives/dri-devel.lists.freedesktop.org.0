Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEF76EC164
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 19:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E89410E11C;
	Sun, 23 Apr 2023 17:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F62B10E0DA
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 17:36:45 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-504ecbfddd5so5097205a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 10:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1682271403; x=1684863403;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wNv3VClFzMvt3MDI7I2HzZM+U4+0tRFHNLn+/5zq8Hk=;
 b=ICB9f2XYji9QBkEQ20ggHB4He1kLG+CmpUtVBzlw85+XZnVMWov4Z0KbL79vWgMS/M
 jpOo7T1XzkagLlnFOzg+BSvAZbAOMpkw4KUU75Ul3OKq4HcNeUnC0s4Avd+RqCGzXwV1
 AVPnqpnLVLoDJTxHOivuTU7cd/cpNTjWddB80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682271403; x=1684863403;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wNv3VClFzMvt3MDI7I2HzZM+U4+0tRFHNLn+/5zq8Hk=;
 b=fk6UWQeT8PEhqfaH8r7IKnSXSyYdhW2iz+pP2die/JUojqS/TdHFwUIqjM81H6/UnP
 Eb9daXirDHPi37zlXgFB5DY7n1TouGyFWI4Uyhurk8q8gCeDoYYTdbix6gB+ODdc4iui
 UY044ski4dxmyM8Oc3XYTQ2QaD2ErLt9R/ECLPY32ptYch08ZhcJ+AeOIEKXcZEpgWZ1
 MfM/2krEzetmc3VXoK48BlzJIn180rRalfAk62aXv57m9r1OY2MgWQxKd1cnr8kpdpHE
 A9ijFfp/Qb1CDqRTgGYn8T63KaJP/4qQBqc5NoUq2PoU1Ar+bbTSUhwmQre2ZfmeKjHL
 yt6g==
X-Gm-Message-State: AAQBX9fxG6VkjUA1Y6ekeLxRS6lrReHQ1RS1xiyI6AungT5WyV5TpIp6
 bX4sR6AOvmECPxEjuj8tVFWfbg3IB+HkNIEe4x7x0Q==
X-Google-Smtp-Source: AKy350boAUyP0xI4v46nBIDLKe3+F0iPeLz50zAs9u+Am7q0qCdkJIWK8ngbdj4A67v7MY46B1Q+vQ==
X-Received: by 2002:aa7:d58d:0:b0:4fa:aee8:235f with SMTP id
 r13-20020aa7d58d000000b004faaee8235fmr9199848edq.9.1682271403263; 
 Sun, 23 Apr 2023 10:36:43 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 p15-20020aa7cc8f000000b004aef147add6sm3826853edt.47.2023.04.23.10.36.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 10:36:42 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-94ef8b88a5bso506062366b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 10:36:41 -0700 (PDT)
X-Received: by 2002:a17:907:7659:b0:94d:a2c2:9aeb with SMTP id
 kj25-20020a170907765900b0094da2c29aebmr7938240ejc.49.1682271401463; Sun, 23
 Apr 2023 10:36:41 -0700 (PDT)
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 23 Apr 2023 10:36:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whMiMqAv5ATKRkjrdgP2R7WgWmCS4hW2mPwBcL=gzdDNw@mail.gmail.com>
Message-ID: <CAHk-=whMiMqAv5ATKRkjrdgP2R7WgWmCS4hW2mPwBcL=gzdDNw@mail.gmail.com>
Subject: Disabling -Warray-bounds for gcc-13 too
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kees,
  I made the mistake of upgrading my M2 Macbook Air to Fedora-38, and
in the process I got gcc-13 which is not WERROR-clean because we only
limited the 'array-bounds' warning to gcc-11 and gcc-12. But gcc-13
has all the same issues.

And I want to be able to do my arm64 builds with WERROR on still...

I guess it never made much sense to hope it was going to go away
without having a confirmation, so I just changed it to be gcc-11+.

A lot of the warnings seem just crazy, with gcc just not getting the
bounds right, and then being upset about us going backwards with
'container_of()' etc. Ok, so the kernel is special. We do odd things.
I get it, gcc ends up being confused.

But before I disabled it, I did take a look at a couple of warnings
that didn't look like the sea of crazy.

And one of them is from you.

In particular, commit 4076ea2419cf ("drm/nouveau/disp: Fix
nvif_outp_acquire_dp() argument size") cannot possibly be right, It
changes

 nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[16],

to

 nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],

and then does

        memcpy(args.dp.dpcd, dpcd, sizeof(args.dp.dpcd));

where that 'args.dp.dpcd' is a 16-byte array, and DP_RECEIVER_CAP_SIZE is 15.

So yeah, it's copying 16 bytes from an argument that claims to be 15
bytes in size.

I think that commit was wrong, and the problem is that the 'dpcd'
array is something 15 and sometimes 16. For example, we have

  struct nouveau_encoder {
        ...
        union {
            struct {
            ...
                u8 dpcd[DP_RECEIVER_CAP_SIZE];
            } dp;
        };

so there it's indeed 15 bytes, but then we have

union nvif_outp_acquire_args {
        struct nvif_outp_acquire_v0 {
            ...
            union {
                ...
                struct {
                    ...
                    __u8 dpcd[16];
                } dp;

where it's 16.

I think it's all entirely harmless from a code generation standpoint,
because the 15-byte field will be padded out to 16 bytes in the
structure that contains it, but it's most definitely buggy.

So that warning does find real cases of wrong code. But when those
real cases are hidden by hundreds of lines of unfixable false
positives, we don't have much choice.

But could the Nouveau driver *please* pick a size for the dhcp[] array
and stick with it?

The other driver where the warnings didn't look entirely crazy was the
ath/carl9170 wireless driver, but I didn't look closer at that one.

                 Linus
