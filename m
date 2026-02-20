Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gC44Bf0emGnhAgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:44:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75962165DA2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA8F10E7E5;
	Fri, 20 Feb 2026 08:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bYvCcn0L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0054710E76B
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 02:38:48 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-59e4993e00aso1897676e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 18:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771555127; x=1772159927; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jrBPGa+g6iGltkbEuqyM0Qz1UaWayuNiGgTjd3xrtnk=;
 b=bYvCcn0LJPQFV5WwYYXHn9aUbfbuNrEAGpSi5XaIioXqEFNRY0MIFQl87ZvpUv02Q9
 tR1+CzYoGoCMh9PewuZha7SuLNiieAk6ejIbNCPzO932HqPNXwWAgv9oanVHRB69oI0n
 +ztC+PqLI/neUxZCIXpmuOysfdh4rVs8OWwiOyFJJkgCVgpiwTcNy8dfPDqM8HBxoWy/
 A6cVuFLp2bYqOwZPxmV9pfPb/0bRuOOurg1RISp8yJFdOXM3FyJoqbfDWfMH48LpL6Iv
 UY/DTFcp23wq98j2wFxMa79+Nj39jo3xMyWSWw6jusFXrXHcQQgE1qwtvJjAEAi7u76o
 JF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771555127; x=1772159927;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jrBPGa+g6iGltkbEuqyM0Qz1UaWayuNiGgTjd3xrtnk=;
 b=UJA7oJkCjGQd9elIW73PnfyrbEWwvR+dGvWs5uHRMAZLNPwDpWYFdR3uWfbGvRuU0t
 7MeQz+aOZOBekS+ofMj5+x4PacW+uhUDEW9aNOJvJyvjG9Rnb6H5Y6VxLdfN064/5qCz
 ZVHDBeTG8GUfZokeKVU/4yYy9rz9qEHzQnQDqj18Kt4LdJ7NDuLV/bmhyHNqBHzBhSBS
 5K520GXO8dnzBSXAjBlivZDRI0zNf0mM23UVFfl9VJZdbxe5T3dgmWA8f5VQWJktwogg
 WAyFCh/8Z5QbDjhpPFRZc6CxQcoWVMY0K/Wut4sRjKjzp8iPr5XSIK+8e+fgj6g8AhuT
 H1fA==
X-Gm-Message-State: AOJu0Yya6EKBVzDAphJmW9Ef/3xoMK5N6dqPmj+hiozg2woGhK9LTXgM
 tGboUIICfmwzQxWjkopBCUlVDj05V7xDsT+Bk+uI8W/mbtrUygubtVs=
X-Gm-Gg: AZuq6aKnJkvZvOj1cGpjb8769R/u3SJuC5qrJ+1Wcqc38Uj+FGa1dG2gZWjWnCwXhvc
 cjdsJ/fe1Dy2eGzhwkMJZmFLRyEbB06ccejRoxG6hSvRaSzOrVHSaLOMNinY3TtEXu4cQPJUz64
 QqFaXoSH9o1ExRE3mdAVQgirXKlN3eWfOqeRWeJ5H6I6i+djMkOPPayMiasKSW9xNN4Bpx/iEBf
 nx1uZjs2xtkt874eE2C395F0q/wd6ZpXCvnGDfM5QVWwKLZ+6gmU+x9WSytEVvOkZua9kSl2zKJ
 3Zg4x6UgYcoQEMLiPZFvhOpF3RjLiAoNGHws+SR2XkASIUtva2HapMwgaoljNZErGfZBqQYQtsZ
 YIrMPqcAzwJz2SFmJEmLD3JE+d8FJDiQAxuiihV9rqhPcd1TAuSpyeekgB9TPMciM3LHvdc9ClP
 WK+NYJDvI=
X-Received: by 2002:a05:6512:2301:b0:59f:9091:9023 with SMTP id
 2adb3069b0e04-59f90919031mr681369e87.16.1771555126743; 
 Thu, 19 Feb 2026 18:38:46 -0800 (PST)
Received: from localhost ([2a0e:e6c0:20d0:4f00::1d])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e5f56369dsm5759705e87.2.2026.02.19.18.38.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 18:38:45 -0800 (PST)
Content-Type: multipart/mixed;
 boundary=1e5e143dab6d4627418243148766468191d5d89468e53e5132f562e28a0e
Mime-Version: 1.0
Date: Fri, 20 Feb 2026 05:38:45 +0300
Message-Id: <DGJFVPAQJA15.378GMU7XZXLU@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>, <regressions@lists.linux.dev>,
 <mwen@igalia.com>, <mario.limonciello@amd.com>, <alex.hung@amd.com>,
 <daniel.wheeler@amd.com>, <rodrigo.siqueira@amd.com>,
 <alexander.deucher@amd.com>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <christian.koenig@amd.com>, <huangalex409@gmail.com>
Subject: Re: [REGRESSION] VRR not detected on a DisplayPort monitor using an
 AMD GPU
From: "Ivan Sergeev" <ivan8215145640@gmail.com>
To: "Mario Limonciello" <superm1@kernel.org>, "John The Cooling Fan"
 <ivan8215145640@gmail.com>, <amd-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com>
 <090d89a2-4f80-44ef-827c-6462d8948493@kernel.org>
In-Reply-To: <090d89a2-4f80-44ef-827c-6462d8948493@kernel.org>
X-Mailman-Approved-At: Fri, 20 Feb 2026 08:44:31 +0000
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
X-Spamd-Result: default: False [1.29 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain,text/x-log];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.linux.dev,igalia.com,amd.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivan8215145640@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	HAS_ATTACHMENT(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 75962165DA2
X-Rspamd-Action: no action

--1e5e143dab6d4627418243148766468191d5d89468e53e5132f562e28a0e
Content-Type: multipart/alternative;
 boundary=2031d44b5890b85b4d1e1481ab05bf3dbf5f26518ad6b49c7f809f3abc4c

--2031d44b5890b85b4d1e1481ab05bf3dbf5f26518ad6b49c7f809f3abc4c
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Content-Type: text/plain; charset=UTF-8

On Fri Feb 20, 2026 at 5:26 AM MSK, Mario Limonciello wrote:
>
> Can you please share your bisect log?  There was a regression from that=
=20
> commit but it was already fixed a long time back.
>
> commit 7f2b5237e313 ("drm/amd/display: restore invalid MSA timing check=
=20
> for freesync")

Here's my bisect log. I've done the bisect using the v6.12.68 tag as
good and v6.18.8 tag as bad. I'll check the mentioned commit.

--2031d44b5890b85b4d1e1481ab05bf3dbf5f26518ad6b49c7f809f3abc4c--

--1e5e143dab6d4627418243148766468191d5d89468e53e5132f562e28a0e
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=vrr-issue-bisect-deepened.log
Content-Type: text/x-log; charset=utf-8; name=vrr-issue-bisect-deepened.log

Z2l0IGJpc2VjdCBzdGFydAojIHN0YXR1czogd2FpdGluZyBmb3IgYm90aCBnb29kIGFuZCBiYWQg
Y29tbWl0cwojIGdvb2Q6IFs5MGVjZjdkOWRhYTJkMDE2N2UyMGIyZTlmNmY1MmUwMWY0N2I4MTQ3
XSBMaW51eCA2LjEyLjY4CmdpdCBiaXNlY3QgZ29vZCA5MGVjZjdkOWRhYTJkMDE2N2UyMGIyZTlm
NmY1MmUwMWY0N2I4MTQ3CiMgYmFkOiBbMjUxYWViMGYyZjU3MGRiNTI5MGQwZGMyZjhlYmY4NzI0
N2IwMGI4NV0gTGludXggNi4xMy42CmdpdCBiaXNlY3QgYmFkIDI1MWFlYjBmMmY1NzBkYjUyOTBk
MGRjMmY4ZWJmODcyNDdiMDBiODUKIyBnb29kOiBbYWRjMjE4Njc2ZWVmMjU1NzU0NjkyMzQ3MDlj
MmQ4NzE4NWNhMjIzYV0gTGludXggNi4xMgpnaXQgYmlzZWN0IGdvb2QgYWRjMjE4Njc2ZWVmMjU1
NzU0NjkyMzQ3MDljMmQ4NzE4NWNhMjIzYQojIGJhZDogWzVjNzE3MjlhYjkyYzdlNzEwZDQ4ZWQ5
MzA0M2EyZDFlMzVjYzhkM2NdIG5ldDogcGNzOiB4cGNzOiBmaXggRFdfVlJfTUlJX0RJR19DVFJM
MV8yRzVfRU4gYml0IGJlaW5nIHNldCBmb3IgMUcgU0dNSUkgdy9vIGluYmFuZApnaXQgYmlzZWN0
IGJhZCA1YzcxNzI5YWI5MmM3ZTcxMGQ0OGVkOTMwNDNhMmQxZTM1Y2M4ZDNjCiMgYmFkOiBbNDgw
MDU3NWQ4YzBiMmYzNTRhYjA1YWIxYzQ3NDllNDVlMjEzYmY3M10gTWVyZ2UgdGFnICd4ZnMtZml4
ZXMtNi4xMy1yYzMnIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vZnMveGZzL3hmcy1s
aW51eApnaXQgYmlzZWN0IGJhZCA0ODAwNTc1ZDhjMGIyZjM1NGFiMDVhYjFjNDc0OWU0NWUyMTNi
ZjczCiMgYmFkOiBbODk2ZDg5NDZkYTk3MzMyZDRkYzgwZmExOTM3ZDhkZDZiMWMzNWFkNF0gTWVy
Z2UgdGFnICduZXQtNi4xMy1yYzInIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9uZXRkZXYvbmV0CmdpdCBiaXNlY3QgYmFkIDg5NmQ4OTQ2ZGE5NzMzMmQ0
ZGM4MGZhMTkzN2Q4ZGQ2YjFjMzVhZDQKIyBiYWQ6IFszMWYxYjU1ZDVkN2U1MzFjZDgyNzQxOWU1
ZDcxYzE5ZjI0ZGUxNjFjXSBuZXQgOm1hbmEgOlJlcXVlc3QgYSBWMiByZXNwb25zZSB2ZXJzaW9u
IGZvciBNQU5BX1FVRVJZX0dGX1NUQVQKZ2l0IGJpc2VjdCBiYWQgMzFmMWI1NWQ1ZDdlNTMxY2Q4
Mjc0MTllNWQ3MWMxOWYyNGRlMTYxYwojIGdvb2Q6IFtkMTUyNGQwNDBiMTJlNWJlZTFlZTFkMDRj
ZTUwMTIyYTFlYTM1MjU4XSBNZXJnZSBicmFuY2ggJ25ldC1maXgtc29tZS1jYWxsZXJzLW9mLWNv
cHlfZnJvbV9zb2NrcHRyJwpnaXQgYmlzZWN0IGdvb2QgZDE1MjRkMDQwYjEyZTViZWUxZWUxZDA0
Y2U1MDEyMmExZWEzNTI1OAojIGJhZDogWzUxZWUwNzVkNjk4YmIzZThkZjgyODdhYzgwNDQ3YTE4
YzcyM2RkNWFdIE1lcmdlIHRhZyAnbGludXgtY2FuLWZpeGVzLWZvci02LjEzLTIwMjQxMjAyJyBv
ZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbWtsL2xpbnV4
LWNhbgpnaXQgYmlzZWN0IGJhZCA1MWVlMDc1ZDY5OGJiM2U4ZGY4Mjg3YWM4MDQ0N2ExOGM3MjNk
ZDVhCiMgYmFkOiBbZjFjZDU2NWNlNTc3NjA5MjNkNWUwZmJkOWU5OTE0YjQxNWMwNjIwYV0gTWVy
Z2UgYnJhbmNoICdlbmV0Yy1tcXByaW8tZml4ZXMnIFdlaSBGYW5nIHNheXVzOgpnaXQgYmlzZWN0
IGJhZCBmMWNkNTY1Y2U1Nzc2MDkyM2Q1ZTBmYmQ5ZTk5MTRiNDE1YzA2MjBhCiMgZ29vZDogWzA0
ZjVjYjQ4OTk1ZDUxZGVlZDBhZjcxYWFiYTFiODY5OTUxMTMxM2ZdIERvY3VtZW50YXRpb246IHRs
c19vZmZsb2FkOiBmaXggdHlwb3MgYW5kIGdyYW1tYXIKZ2l0IGJpc2VjdCBnb29kIDA0ZjVjYjQ4
OTk1ZDUxZGVlZDBhZjcxYWFiYTFiODY5OTUxMTMxM2YKIyBiYWQ6IFtkODNlYzRhZmQyMDlhMDYx
OWIzMmI4NjdmNDVjODQ1ZDRkZGRjMmViXSBNZXJnZSB0YWcgJ3JlZ3VsYXRvci1maXgtdjYuMTMt
bWVyZ2Utd2luZG93JyBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvYnJvb25pZS9yZWd1bGF0b3IKZ2l0IGJpc2VjdCBiYWQgZDgzZWM0YWZkMjA5YTA2MTli
MzJiODY3ZjQ1Yzg0NWQ0ZGRkYzJlYgojIGdvb2Q6IFs1MjYyYmNiYjQxZDUyNmY5NDRhOTFhNmE2
Yzg4ZGZiNmZiYTM4ODliXSBkdC1iaW5kaW5nczogcmVndWxhdG9yOiBxY29tLWxhYmliYi1yZWd1
bGF0b3I6IGRvY3VtZW50IHRoZSBwbWk4OTUwIGxhYmliYiByZWd1bGF0b3IKZ2l0IGJpc2VjdCBn
b29kIDUyNjJiY2JiNDFkNTI2Zjk0NGE5MWE2YTZjODhkZmI2ZmJhMzg4OWIKIyBnb29kOiBbMzUx
ZjJiZmU2MzYyYzY2M2Y0NWY1YzYxMTFmMTQzNjVjZmQwOTRhYl0gcmVndWxhdG9yOiBjb3JlOiBJ
Z25vcmUgdW5zZXQgbWF4X3VBIGNvbnN0cmFpbnRzIGluIGN1cnJlbnQgbGltaXQgY2hlY2sKZ2l0
IGJpc2VjdCBnb29kIDM1MWYyYmZlNjM2MmM2NjNmNDVmNWM2MTExZjE0MzY1Y2ZkMDk0YWIKIyBi
YWQ6IFs0NDhlY2Q1NzcxZTI1NTYyOWJlZjBmYjE2YzliNzhjNGJiZDdiZDU2XSBNZXJnZSB0YWcg
J2Zvci12Ni4xMycgb2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3NyZS9saW51eC1wb3dlci1zdXBwbHkKZ2l0IGJpc2VjdCBiYWQgNDQ4ZWNkNTc3MWUyNTU2
MjliZWYwZmIxNmM5Yjc4YzRiYmQ3YmQ1NgojIGdvb2Q6IFtmY2M3OWUxNzE0ZThjMmI4ZTIxNmRj
MzE0OTgxMmVkZDM3ODg0ZWVmXSBNZXJnZSB0YWcgJ25ldC1uZXh0LTYuMTMnIG9mIGdpdDovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXRkZXYvbmV0LW5leHQKZ2l0
IGJpc2VjdCBnb29kIGZjYzc5ZTE3MTRlOGMyYjhlMjE2ZGMzMTQ5ODEyZWRkMzc4ODRlZWYKIyBi
YWQ6IFs2ZjliYWE5YjkyYzJlNGUyOGUzODVmYTU4MWYwNTExNjIxZGIzZjlhXSBNZXJnZSB0YWcg
J3BtLTYuMTMtcmMxLTInIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9yYWZhZWwvbGludXgtcG0KZ2l0IGJpc2VjdCBiYWQgNmY5YmFhOWI5MmMyZTRlMjhl
Mzg1ZmE1ODFmMDUxMTYyMWRiM2Y5YQojIGJhZDogWzI4ZWI3NWUxNzhkMzg5ZDMyNWYxNjY2ZTQy
MmJjMTNiYmJiOTgwNGNdIE1lcmdlIHRhZyAnZHJtLW5leHQtMjAyNC0xMS0yMScgb2YgaHR0cHM6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9rZXJuZWwKZ2l0IGJpc2VjdCBiYWQgMjhlYjc1
ZTE3OGQzODlkMzI1ZjE2NjZlNDIyYmMxM2JiYmI5ODA0YwojIGJhZDogWzliZWQ0OTRjZDYyN2Nl
Y2FiMTExNGNlMDQxNmM5ZGRiM2FkNjYwNjRdIE1lcmdlIHRhZyAnbWVkaWF0ZWstZHJtLW5leHQt
Ni4xMycgb2YgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
Y2h1bmt1YW5nLmh1L2xpbnV4IGludG8gZHJtLW5leHQKZ2l0IGJpc2VjdCBiYWQgOWJlZDQ5NGNk
NjI3Y2VjYWIxMTE0Y2UwNDE2YzlkZGIzYWQ2NjA2NAojIGdvb2Q6IFtjOWZmMTRkMDMzOWE3ODM4
YjcxZDlmMTk2YmQ0MjQ0ZWViNmUyODA4XSBNZXJnZSB0YWcgJ2RybS1pbnRlbC1ndC1uZXh0LTIw
MjQtMTAtMjMnIG9mIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJu
ZWwgaW50byBkcm0tbmV4dApnaXQgYmlzZWN0IGdvb2QgYzlmZjE0ZDAzMzlhNzgzOGI3MWQ5ZjE5
NmJkNDI0NGVlYjZlMjgwOAojIGJhZDogWzMwMTk0YjcxNmJkOGZmNjIxNWI0YTQ5YTA4OGVkZThk
ZTFhMzZkMTVdIGRybS9hbWQvZGlzcGxheTogdXBkYXRlIGZ1bGxzY3JlZW4gc3RhdHVzIHRvIFNQ
TApnaXQgYmlzZWN0IGJhZCAzMDE5NGI3MTZiZDhmZjYyMTViNGE0OWEwODhlZGU4ZGUxYTM2ZDE1
CiMgZ29vZDogWzE4NDU3NTJiMmY2YThhY2QxNzk0OWM4M2U0MWM1YWJhNGJkNGUyYmJdIGRybS9h
bWRncHU6IEZpeCBzcGVsbGluZyBtaXN0YWtlICJpbml0aWFsaXp0aW9uIiAtPiAiaW5pdGlhbGl6
YXRpb24iCmdpdCBiaXNlY3QgZ29vZCAxODQ1NzUyYjJmNmE4YWNkMTc5NDljODNlNDFjNWFiYTRi
ZDRlMmJiCiMgYmFkOiBbZjgzZmMzYWJkNTljMzRmY2M5ZjU2MWRiNzVlMzViYjAxYzA3ODg1YV0g
ZHJtL2FtZGdwdTogb3B0aW1pemUgZm4gZ2Z4X3YxMl9yaW5nX2luc2VydF9ub3AKZ2l0IGJpc2Vj
dCBiYWQgZjgzZmMzYWJkNTljMzRmY2M5ZjU2MWRiNzVlMzViYjAxYzA3ODg1YQojIGdvb2Q6IFs4
MmUyY2NhYTQ2ODExMzU2ZjFkYWFhYzIxMjdkYTc5ZWNkMjQ0MmQ0XSBkcm0vYW1kL2Rpc3BsYXk6
IDMuMi4zMDQKZ2l0IGJpc2VjdCBnb29kIDgyZTJjY2FhNDY4MTEzNTZmMWRhYWFjMjEyN2RhNzll
Y2QyNDQyZDQKIyBiYWQ6IFswNGJkYmE0NjU0MmM5NTNlMjZmM2JhNGFjODRkZDY1ZmJiNGU3Mzgy
XSBkcm0vYW1kZ3B1OiBVc2UgZHJtX3ByaW50X21lbW9yeV9zdGF0cyBoZWxwZXIgZnJvbSBmZGlu
Zm8KZ2l0IGJpc2VjdCBiYWQgMDRiZGJhNDY1NDJjOTUzZTI2ZjNiYTRhYzg0ZGQ2NWZiYjRlNzM4
MgojIGJhZDogWzJmZTc5NTA4ZDljMzkzYmI5OTMxYjAwMzdjNWVjYWVlMDlhOGRjMzldIGRybS9h
bWQvZGlzcGxheTogZml4IGhpYmVybmF0ZSBlbnRyeSBmb3IgRENOMzUrCmdpdCBiaXNlY3QgYmFk
IDJmZTc5NTA4ZDljMzkzYmI5OTMxYjAwMzdjNWVjYWVlMDlhOGRjMzkKIyBnb29kOiBbOWYyOTNj
NDU0NGY3NGE0MjgyNzVlNmZiZjliMmI2MjU4N2NlZDdmMF0gZHJtL2FtZC9kaXNwbGF5OiBzd2l0
Y2ggdG8gc2V0dGluZyBwaHlzaWNhbCBhZGRyZXNzIGRpcmVjdGx5CmdpdCBiaXNlY3QgZ29vZCA5
ZjI5M2M0NTQ0Zjc0YTQyODI3NWU2ZmJmOWIyYjYyNTg3Y2VkN2YwCiMgYmFkOiBbMDE1OWY4OGE5
OWM5ZjU3MjJkYmU1MmFjNDJmYWYzNDQ2ZjM3MWRlYV0gZHJtL2FtZC9kaXNwbGF5OiByZW1vdmUg
cmVkdW5kYW50IGZyZWVzeW5jIHBhcnNlciBmb3IgRFAKZ2l0IGJpc2VjdCBiYWQgMDE1OWY4OGE5
OWM5ZjU3MjJkYmU1MmFjNDJmYWYzNDQ2ZjM3MWRlYQojIGdvb2Q6IFthYmI5MWM1NDVhNTFmZWI5
ZWE4NzE1OTNkZDgxOWM0MjY0NGYyNWFkXSBkcm0vYW1kL2Rpc3BsYXk6IGFsd2F5cyBjYWxsIGNv
bm5lY3Rvcl91cGRhdGUgd2hlbiBwYXJzaW5nIGZyZWVzeW5jX2NhcHMKZ2l0IGJpc2VjdCBnb29k
IGFiYjkxYzU0NWE1MWZlYjllYTg3MTU5M2RkODE5YzQyNjQ0ZjI1YWQKIyBmaXJzdCBiYWQgY29t
bWl0OiBbMDE1OWY4OGE5OWM5ZjU3MjJkYmU1MmFjNDJmYWYzNDQ2ZjM3MWRlYV0gZHJtL2FtZC9k
aXNwbGF5OiByZW1vdmUgcmVkdW5kYW50IGZyZWVzeW5jIHBhcnNlciBmb3IgRFAK
--1e5e143dab6d4627418243148766468191d5d89468e53e5132f562e28a0e--
