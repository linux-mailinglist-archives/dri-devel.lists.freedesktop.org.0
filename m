Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DA2654DAA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 09:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995F210E607;
	Fri, 23 Dec 2022 08:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C581010E125
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 15:35:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1671636937; cv=none; d=zohomail.in; s=zohoarc; 
 b=OPfqfnyCBHt7EDRFmJCarYGJ48QZcNoJ+pE8zoyraIrFq4o9c6aO7L57HHb2eDqPd4n3cvPGKIvFo2tNWkVq3aH5sQSgWqN7/bVz98zijG/wOIU583WpdxquDRoUraY4NKm/HsEP4dz99ZZ6EkRmmxUC0w/V7+G45H+8wO0rxEc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1671636937;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=3Hz2uwW3hnNguqOhLl5TLTK8gM+WmAZ6vNtAY7+qxZE=; 
 b=eB/GaDcxK7eXkrrZ9xVBA0aZJS2VUZr3lVjCFsUjdi++rBb1LD2p98YNoJntF8WBN8MT86Yrm+XQ3AZEfLZvhnrXieXwgxeif6PwhWMv0YbIEmf/MFu0fpPjI/qyDBNm5035ySSJd8v+dgp5w/J2c5Eb53X7E53hKGPJ1wRI9CI=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671636937; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:Message-ID:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=3Hz2uwW3hnNguqOhLl5TLTK8gM+WmAZ6vNtAY7+qxZE=;
 b=fcWAWA6GKtmxvdk3GEUIJKNatO79SqPhDIKRCZ2adST6WVSbo/45/ITKJTXBVd/o
 ZUHMzHeJnqQgQJSY1V4eMaOZ95srCh+sjKg3hs9iI/AImYstC6LEnYd7H4T1TfYKKOX
 hNvyvE41NHwu9uJ6uo2nRx2OW6h40q9BCeGnka60=
Received: from [192.168.1.9] (110.226.31.37 [110.226.31.37]) by mx.zoho.in
 with SMTPS id 1671636936209255.79334159169218;
 Wed, 21 Dec 2022 21:05:36 +0530 (IST)
Date: Wed, 21 Dec 2022 21:05:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 04/10] drm/print: Fix support for NULL as first argument
 of drm_dbg_*
To: Jani Nikula <jani.nikula@linux.intel.com>
References: <cover.1671566741.git.code@siddh.me>
 <3ebf0d61ad5e82875a4493108602e62429306b14.1671566741.git.code@siddh.me>
 <87edst2ix8.fsf@intel.com>
Content-Language: en-US, en-GB, hi-IN
From: Siddh Raman Pant <code@siddh.me>
Message-ID: <21113999-99c2-0273-a6fe-8374ee910297@siddh.me>
In-Reply-To: <87edst2ix8.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
X-Mailman-Approved-At: Fri, 23 Dec 2022 08:44:25 +0000
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 21 2022 at 15:11:07 +0530, Jani Nikula wrote:
> On Wed, 21 Dec 2022, Siddh Raman Pant <code@siddh.me> wrote:
>> Comments say macros DRM_DEBUG_* are deprecated in favor of
>> drm_dbg_*(NULL, ...), but they have broken support for it,
>> as the macro will result in `(NULL) ? (NULL)->dev : NULL`.
>=20
> What's wrong with that?

NULL is not a struct, so the syntax is incorrect.

Note that this isn't about a dev pointer whose value is
NULL, the first argument is NULL directly. So "NULL" is
directly substituted as is. If it was a dev pointer, then
the definition of struct allowed for no error, but here
gcc will generate the following error:

error: request for member =E2=80=98dev=E2=80=99 in something not a structur=
e or union=20

Hence, there is a need to fix them.

Thanks,
Siddh

