Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C072F203051
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B276E245;
	Mon, 22 Jun 2020 07:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702696E2CC
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 14:25:29 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id c17so14585836lji.11
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4ruHPIPmurC463vAz1hNjJEMuv6zaWYHauq5gA/bN+8=;
 b=o8RmefqnB3QnbzCaoilt6Q+DIwbaOTaooiCT6fcwTWK3RuwWSjCg6rWT3TBjMADEja
 THzMgKgvRqC55inPhtupe5VG/ZiBQbXmnk84U9/laDe+MdJg5gRwFxbictKDo1CBDKi4
 GCJ9MOXK47onfMJukkmhDnJDPEojIp7toWb1/QOSJLy/6NBdVJt1NfW6HFhJmrv4h7BF
 2//TnZY6oqrq8fJU6YGQoehIRNuQRdzT7r3Smvwh8KRvUt0F128kYt8+YDpioENS0cnK
 L7UDGW+3RawaCCX5OuZ1/Hnq44dzU/GtZqK5B4IiEiqBkUFK2F6/yAPsKJcnPNbCZw8p
 VRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4ruHPIPmurC463vAz1hNjJEMuv6zaWYHauq5gA/bN+8=;
 b=naP3aQDQQCXrj26VUVdr6FWCiNkTnytaeTwwSpUClVfGeYmacDYvnphUGp6Lfgmztb
 aZSaTK6cTiF0NdrwcYBgTrpxEeMGWfFv2JibP0yRiElj9wjG3x8SGuCRMfx/mq0jDv/B
 DL/+ZbER1D8vO8qw2Ga9iQqc9oS83oZKlhHk8b7pNIfI0+KXpGmmBu5hwWPYymEl+5BO
 ldZIRWd1/N/rlZZNDP3ErYF1t11SyiW5TzNvikEivdIAd7/1JUMycCMq3IoAgWTqtu+d
 ek5AoBNinE+SGskqDJyC02qxiQ5Zk86+KInudLFSIQGO5EjGCSlC8ZYfJlVxGlD3o6qC
 3kqg==
X-Gm-Message-State: AOAM531jKzcZvMid40apNb0C5fcCA+KMa7gMAH9MDHFOpYfn5tsafZYH
 x5MruJ3WtV88RZPQw9cUDVM=
X-Google-Smtp-Source: ABdhPJyL6c94yYxmHLSrUkUoz370hw8tQobE6KtcyRTGoCUSZpYbUBqJF9dHlMa7CO3rluQkOE3K4w==
X-Received: by 2002:a2e:751a:: with SMTP id q26mr3979522ljc.258.1592663127861; 
 Sat, 20 Jun 2020 07:25:27 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id c20sm2106687lfb.33.2020.06.20.07.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Jun 2020 07:25:27 -0700 (PDT)
Subject: Re: [PATCH v11 1/4] drm/panel: Add helper for reading DT rotation
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Basehore <dbasehore@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Daniel Stone <daniel@fooishbar.org>
References: <20200617231842.30671-1-digetx@gmail.com>
 <20200617231842.30671-2-digetx@gmail.com>
Message-ID: <0626524c-eab6-c01b-63e1-91e1f0827831@gmail.com>
Date: Sat, 20 Jun 2020 17:25:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200617231842.30671-2-digetx@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:46 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTguMDYuMjAyMCAwMjoxOCwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gRnJvbTogRGVy
ZWsgQmFzZWhvcmUgPGRiYXNlaG9yZUBjaHJvbWl1bS5vcmc+Cj4gCj4gVGhpcyBhZGRzIGEgaGVs
cGVyIGZ1bmN0aW9uIGZvciByZWFkaW5nIHRoZSByb3RhdGlvbiAocGFuZWwKPiBvcmllbnRhdGlv
bikgZnJvbSB0aGUgZGV2aWNlIHRyZWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGVyZWsgQmFzZWhv
cmUgPGRiYXNlaG9yZUBjaHJvbWl1bS5vcmc+Cj4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz4KPiAtLS0KCk15IHQtYiBhY2NpZGVudGFsbHkgZ290IGxvc3QgYWZ0
ZXIgcmViYXNlLCBoZXJlIGl0IGlzOgoKVGVzdGVkLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0
eEBnbWFpbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
