Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2641519CF02
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 06:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989EA6E1B2;
	Fri,  3 Apr 2020 04:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419A66E1B2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 04:05:55 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48tmZ84pFxz9sRf;
 Fri,  3 Apr 2020 15:05:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1585886753;
 bh=+GNIM54E2dog7HMWp41rbgg9rU0MbTHzcNGHx83iCtI=;
 h=Date:From:To:Cc:Subject:From;
 b=f4IESQP/wcH/BJBZ1reRJjr8Bp9yj9tX4zrqG0HGeP3Gy9PthjEfOIryb9CanE0/v
 Fx3gNluJdpNS7cQsOE4E2QX8NGQ82Pk3DcsQa/Z4i9JCH94JAR3H7NpwDNSFPoe1QA
 NJOkKfHk/IMte281AERurvFWJNbAoSrjTLq7DanaDAXqK7vfc0pX0MTwRaUI1NUM4R
 LqEOzppfHRyttuHQqRkOm2+7sdiKLF21Mx5UYF7ZFqdu94hcH0g9Yf2k/bd2XA2WPV
 EHGR321apHqRafsJDe7umk11P1oOx0WHQCR06UcfLfFxGBWZpUgZsej0AZwaHXBqsh
 ccomdsQwc+jqg==
Date: Fri, 3 Apr 2020 15:05:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Dave Airlie
 <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the akpm-current tree with the drm tree
Message-ID: <20200403150550.35045a3a@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 "Thomas Hellstrom \(VMware\)" <thomas_os@shipmail.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0597334758=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0597334758==
Content-Type: multipart/signed; boundary="Sig_/v8V7/cyUjbpZpOmZ_DaY2rN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/v8V7/cyUjbpZpOmZ_DaY2rN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/memory.c

between commit:

  327e9fd48972 ("mm: Split huge pages on write-notify or COW")

from the drm tree and commit:

  de0b1f32cbeb ("userfaultfd: wp: hook userfault handler to write protectio=
n fault")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/memory.c
index efa59b1b109c,9e75440c79ce..000000000000
--- a/mm/memory.c
+++ b/mm/memory.c
@@@ -3949,42 -3969,29 +3969,40 @@@ static inline vm_fault_t create_huge_pm
  /* `inline' is required to avoid gcc 4.1.2 build error */
  static inline vm_fault_t wp_huge_pmd(struct vm_fault *vmf, pmd_t orig_pmd)
  {
- 	if (vma_is_anonymous(vmf->vma))
+ 	if (vma_is_anonymous(vmf->vma)) {
+ 		if (userfaultfd_huge_pmd_wp(vmf->vma, orig_pmd))
+ 			return handle_userfault(vmf, VM_UFFD_WP);
  		return do_huge_pmd_wp_page(vmf, orig_pmd);
+ 	}
 -	if (vmf->vma->vm_ops->huge_fault)
 -		return vmf->vma->vm_ops->huge_fault(vmf, PE_SIZE_PMD);
 +	if (vmf->vma->vm_ops->huge_fault) {
 +		vm_fault_t ret =3D vmf->vma->vm_ops->huge_fault(vmf, PE_SIZE_PMD);
 +
 +		if (!(ret & VM_FAULT_FALLBACK))
 +			return ret;
 +	}
 =20
 -	/* COW handled on pte level: split pmd */
 -	VM_BUG_ON_VMA(vmf->vma->vm_flags & VM_SHARED, vmf->vma);
 +	/* COW or write-notify handled on pte level: split pmd. */
  	__split_huge_pmd(vmf->vma, vmf->pmd, vmf->address, false, NULL);
 =20
  	return VM_FAULT_FALLBACK;
  }
 =20
- static inline bool vma_is_accessible(struct vm_area_struct *vma)
- {
- 	return vma->vm_flags & (VM_READ | VM_EXEC | VM_WRITE);
- }
-=20
  static vm_fault_t create_huge_pud(struct vm_fault *vmf)
  {
 -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 +#if defined(CONFIG_TRANSPARENT_HUGEPAGE) &&			\
 +	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
  	/* No support for anonymous transparent PUD pages yet */
  	if (vma_is_anonymous(vmf->vma))
 -		return VM_FAULT_FALLBACK;
 -	if (vmf->vma->vm_ops->huge_fault)
 -		return vmf->vma->vm_ops->huge_fault(vmf, PE_SIZE_PUD);
 +		goto split;
 +	if (vmf->vma->vm_ops->huge_fault) {
 +		vm_fault_t ret =3D vmf->vma->vm_ops->huge_fault(vmf, PE_SIZE_PUD);
 +
 +		if (!(ret & VM_FAULT_FALLBACK))
 +			return ret;
 +	}
 +split:
 +	/* COW or write-notify not handled on PUD level: split pud.*/
 +	__split_huge_pud(vmf->vma, vmf->pud, vmf->address);
  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
  	return VM_FAULT_FALLBACK;
  }

--Sig_/v8V7/cyUjbpZpOmZ_DaY2rN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6Gth4ACgkQAVBC80lX
0GzkYwf9GzuLBOUWcYGcMekgwOH1UTiaMzfCZ9Rkv6ztyaMZmiWXRRTm3YAXyXTJ
n6RtnToWlMFEhunDkjMMnUGf2Q1UB9wMmnllKwk+rZkGIAJyDV102+77HvptLhNN
saAH2APpGMCsDKMw3TJRNwwJxM5rraAkvSJE4sMl5LhnyrRH2+UxoD9wa47XncdJ
7XPw5O8DTYgKSOYKxxZvIgiTBoka0uUarvwj1tqJNWP343lNJPQueRa8I2GkmYTD
G9j4xwg+jg1d7CuxLOOLX8QsPAj3q+KqiKbAD78Dl8cdwxH5fg92flrc5kA40fNq
OPhQN6c85PHx2+TxTFz74U57s0oFAQ==
=Tdkc
-----END PGP SIGNATURE-----

--Sig_/v8V7/cyUjbpZpOmZ_DaY2rN--

--===============0597334758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0597334758==--
