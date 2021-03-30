Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D1234EA1B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 16:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A9A6E907;
	Tue, 30 Mar 2021 14:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866966E87C;
 Tue, 30 Mar 2021 08:41:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1617093697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jiLzz+FDg8IDgOr7Ru1IW7IRXYaqlH8yrJkDxBSOd+M=;
 b=SwyQOSqvaO5avOz2XsxkAeyYpWcAxuEpeTup5y2W/3hjoJIa9VL+ySLWFEDXOGMXYYzaNj
 yfuPCkvCrHUDqDn4OiHjX+VW5qEwgFf/bjJtmVzQs0eem+tKxgSvbAVrRlz0EIt6ankmR8
 9g4gU0a0vUOWreF+dSJDr1Ih1BW0A9I=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0DDEB1C1;
 Tue, 30 Mar 2021 08:41:36 +0000 (UTC)
Date: Tue, 30 Mar 2021 10:41:34 +0200
From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 06/11] cgroup: fix -Wzero-length-bounds warnings
Message-ID: <YGLkPjSBdgpriC0E@blackbook>
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-7-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210322160253.4032422-7-arnd@kernel.org>
X-Mailman-Approved-At: Tue, 30 Mar 2021 14:16:14 +0000
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
Cc: Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 Zefan Li <lizefan.x@bytedance.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Christian Brauner <christian.brauner@ubuntu.com>, Odin Ugedal <odin@uged.al>,
 linux-scsi@vger.kernel.org, x86@kernel.org,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 Kalle Valo <kvalo@codeaurora.org>, Andrii Nakryiko <andriin@fb.com>,
 ath11k@lists.infradead.org, Serge Hallyn <serge@hallyn.com>,
 Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Ning Sun <ning.sun@intel.com>, Anders Larsen <al@alarsen.net>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>, cgroups@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Martin Sebor <msebor@gcc.gnu.org>,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Simon Kelley <simon@thekelleys.org.uk>, intel-gfx@lists.freedesktop.org,
 Roman Gushchin <guro@fb.com>
Content-Type: multipart/mixed; boundary="===============0053195811=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0053195811==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Gbn4BprmVLVWv2rO"
Content-Disposition: inline


--Gbn4BprmVLVWv2rO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 22, 2021 at 05:02:44PM +0100, Arnd Bergmann <arnd@kernel.org> w=
rote:
> I'm not sure what is expected to happen for such a configuration,
> presumably these functions are never calls in that case.
Yes, the functions you patched would only be called from subsystems or
there should be no way to obtain a struct cgroup_subsys reference
anyway (hence it's ok to always branch as if ss=3D=3DNULL).

I'd prefer a variant that wouldn't compile the affected codepaths when
there are no subsystems registered, however, I couldn't come up with a
way how to do it without some preprocessor ugliness.

Reviewed-by: Michal Koutn=FD <mkoutny@suse.com>

--Gbn4BprmVLVWv2rO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEEoQaUCWq8F2Id1tNia1+riC5qSgFAmBi5DcACgkQia1+riC5
qSjuqxAAkm/zoS+xvdcQUERzkcuVxIruGtTqOse/NCPQQR9aGuJl6iybyjQw7D+r
63+BYz7+BdP8zDg+NSTO354Yt0vsWFtCvuZBBabO91wCheLRPaZhHnGByJa0fXyM
SKC2VSvFHKKiFuCG7mG7/WfDQxTGSaUL2jiFXlA5HAV5dKfkia/Jpuf+KtIy5nBR
g8g4f44M2wW/TCoBzd5Elt5Cpx6fU2aKuJRCRCE04ts4CQy06/lLcc9H0N7bvgHj
0oxkHbAjXeEnylnni4pfpmJpInUT2kOZuCjSF/WPw2XeLs00AnBnNB3lDP9Pe2qo
ippcDc3AFqYMqewKnnxDWoTI3lyMTm8r0yzrDdwpb9Zv28bOCAYiwyoIsFV7+kdN
C7DnhiL6d+UgKIzCqRuTPXnluthvSmHGzeblqF1vOAaWOFif4CcRmUtsR7v3EyZN
5aiUTGqVtoKr/pcBNnRU1e2w7ulYpq5sbL/8f9HtnKsZ8MZlLdhdcDoSLjOkuohK
OlQgS6p+2otxwk3xft0CdFPPHAFb5/WM6IyKdewFGuY0fohxczWJCRI92x94cfe9
p0JSNLl19JjdM8loYpmBRcmlkoBH+MtkdZiR68b5yX5wcXypubmZPZ9o8ZzQqx1j
ZX1/nhuyDl6KHuGW7gJXx8FhCLd6nPyKYVu4wbay23oLzdL/1sk=
=nVTO
-----END PGP SIGNATURE-----

--Gbn4BprmVLVWv2rO--

--===============0053195811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0053195811==--
