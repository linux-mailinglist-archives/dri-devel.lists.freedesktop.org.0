Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEz2LPUGfWmpPwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 20:31:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D368BE285
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 20:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E784A10E379;
	Fri, 30 Jan 2026 19:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bezPtvrK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E2510E373
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 19:30:56 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b8871718b00so433279866b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 11:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1769801451; x=1770406251;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W8y1hlS9W5Oawn5dkkGEikgR0ldBUwlhI0H6DXMwtiQ=;
 b=bezPtvrK5Yoa72R2eWqvAeSRUKRQ1mhxpL0CDopoN1WXJGxt5d7Mg3iwMlh9itRsFR
 +O8wLYOLpl5dR7HIGnfUHM1YEd+ZdMIkyiNlS0XzGfdZSQXMr2dVO2G5GSDJ6Fy717Ij
 fxHxeqge35kFGxcwiVlecKKcWx4A3czxW/SQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769801451; x=1770406251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W8y1hlS9W5Oawn5dkkGEikgR0ldBUwlhI0H6DXMwtiQ=;
 b=VW+DDI4nLhzn2y2uyMPEmJ8woTINui7A8eOm7BUkQD++yvg7hNmoj5bOEx6jfi/MUp
 U7SvLFCueJIsohIp1hSUXXZjW68oEVDcbZkwxcTYh1v/RbPgIL21RGqOHZUG3CSLw9bH
 v2iwy85mf5A6WQfKkf+l960ZNHpGYHfQKIyFHWm7NqKnLqyiwlQU8gVCHj693V2a/bE1
 +uQug/mgfdLAzZX6VOK7AxhBNRf7mAPfRs6ApLvOUU/xGQx2HZe+PuUvUOS+574hw2/N
 3HKWzvmdl22uSm6vnpEPt3Hsc48CNeiywrTyCgmLAbxMoCcgWGSPZVAwgNhgi5QGzGa8
 RPmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT84dPMqAHJC/2OpMBfOELLK1LxFBXISip5a4keRyjPMJaIFTiZrSOC0wV5+1KmicXEJFYIXMs4kE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0PKeAAKOAHX0cOU08uNl1BaUZykoZJR+/Aht733nixUtMKNBL
 4TA8ND4uBWoFGselmVhqs6d6IGBMLc57wcVn19wNTTvgADlM4wENbMqhIGfYI6i0KNDW2uDu4Je
 K0Ro=
X-Gm-Gg: AZuq6aKenXNw9UYQqq2DCruwgDGfGOz+Wq365uH0Av0zRnxrmlw24WNnHTxBYgyUxK6
 hgjOl4xsZBHdkTK82R09Bu/1YskIl6ykE45tNyT2jCeteghX0X3AXnumMLBTkBd/dXbnBJnxqnS
 btNNCSSUCuPXoGPlCV88zq01Un0SW+XXXnHg2T/dgzbzdi9XxlDgoRWUF6PT8rRrlkJtcbF5fjB
 3u2yfoaiJeJ9R9y+pIej0oMZzpyClswNhIyXE0Fn6KAggMwyFLZrxpwudEBmHTFVZG1iiVJKwmJ
 KQGeWpcKoNXIBc8O3OjYSVQE8QaUSWXCmbItE48hxCa+1fiof7wxZCjw1FqFRKAs0+QsK0oflA7
 KjalQPhAvstZ67CAqqXrWZ+kfVcw0u6fc+N65rLajH0Ukg/wtTf31lATzCPyA2y7nmliWwuiOQW
 DMVFSs6F0gSbLrFXJht+3tCSMuPb0Y/Ctz5v7IIfJiUrwmWYsE7w==
X-Received: by 2002:a17:907:9801:b0:b88:7568:26dc with SMTP id
 a640c23a62f3a-b8dff788e3dmr283749766b.43.1769801451480; 
 Fri, 30 Jan 2026 11:30:51 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-658b4452e98sm4616228a12.12.2026.01.30.11.30.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jan 2026 11:30:50 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-42fb4eeb482so1808725f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 11:30:49 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXJhOHUaQL2XseeMnJUxZgG7+bLM2iITPYvxpXiuom2HfQx83ErKAJVofdGc1SzqQYkOkpdUxn//FI=@lists.freedesktop.org
X-Received: by 2002:a05:6000:1868:b0:430:fd60:93fb with SMTP id
 ffacd0b85a97d-435f3aae16amr5934394f8f.32.1769801448483; Fri, 30 Jan 2026
 11:30:48 -0800 (PST)
MIME-Version: 1.0
References: <20260130030456.2080748-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20260130030456.2080748-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Jan 2026 11:30:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X6DOu7G3mOMxM9THTUnzpr-6BCVs4Z-s=yKE5a8TwTuQ@mail.gmail.com>
X-Gm-Features: AZwV_Qjf2yvESdZtAyB8hBkIg8DQ6B5tFv_g6rOWB0yC2kAyAY0PR76y20AHyUg
Message-ID: <CAD=FV=X6DOu7G3mOMxM9THTUnzpr-6BCVs4Z-s=yKE5a8TwTuQ@mail.gmail.com>
Subject: Re: [PATCH V2] drm/panel-edp: Add CMN N116BCL-EAK (C2)
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, treapking@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,chromium.org,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yangcong5@huaqin.corp-partner.google.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:treapking@chromium.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1D368BE285
X-Rspamd-Action: no action

Hi,

On Thu, Jan 29, 2026 at 7:05=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Add support for the CMN N116BCL-EAK (C2) panel, pleace the EDID here for
> subsequent reference.
>
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 0d ae 7a 11 00 00 00 00
> 08 22 01 04 95 1a 0e 78 03 46 a5 9c 5b 53 8b 24
> 1d 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 e6 1e 56 e2 50 00 3c 30 30 20
> a6 00 00 90 10 00 00 1a 00 00 00 fd 00 28 3c 32
> 32 08 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
> 4d 4e 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 4e 31 31 36 42 43 4c 2d 45 41 4b 0a 20 01 80
>
> 70 20 79 02 00 25 01 09 fc 34 01 fc 34 01 28 3c
> 80 81 00 10 72 1a 00 00 03 01 28 3c 00 00 00 00
> 00 00 3c 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 2f 90
>
> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
> Chage since V1:
>
> - Change string "N116BCL-EAK-c2" to "N116BCL-EAK".
>
> V1: https://lore.kernel.org/all/CAD=3DFV=3DV2HzOYcOgeY94h+Pk33=3DniJrQzzZ=
F0hLE+VH8Jacbfvw@mail.gmail.com
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next

[1/1] drm/panel-edp: Add CMN N116BCL-EAK (C2)
      commit: 3d65e4c276b32c03450261d114e495fda03c8e97
