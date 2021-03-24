Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF3F348CE7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 10:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876B86ECEC;
	Thu, 25 Mar 2021 09:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 581 seconds by postgrey-1.36 at gabe;
 Wed, 24 Mar 2021 21:03:11 UTC
Received: from mail.namei.org (namei.org [65.99.196.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BB76E1BC;
 Wed, 24 Mar 2021 21:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.namei.org (Postfix) with ESMTPS id 507624E1;
 Wed, 24 Mar 2021 20:50:33 +0000 (UTC)
Date: Thu, 25 Mar 2021 07:50:33 +1100 (AEDT)
From: James Morris <jmorris@namei.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 03/11] security: commoncap: fix -Wstringop-overread warning
In-Reply-To: <20210322160253.4032422-4-arnd@kernel.org>
Message-ID: <b8ebab59-1cec-42d-6fb9-44aa1a464ae2@namei.org>
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-4-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="1665246916-699807841-1616619033=:3443171"
X-Mailman-Approved-At: Thu, 25 Mar 2021 09:30:06 +0000
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
Cc: dri-devel@lists.freedesktop.org,
 Christian Brauner <christian.brauner@ubuntu.com>, linux-scsi@vger.kernel.org,
 x86@kernel.org, James Smart <james.smart@broadcom.com>,
 tboot-devel@lists.sourceforge.net, Kalle Valo <kvalo@codeaurora.org>,
 ath11k@lists.infradead.org, Serge Hallyn <serge@hallyn.com>,
 Miklos Szeredi <mszeredi@redhat.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Ning Sun <ning.sun@intel.com>, Anders Larsen <al@alarsen.net>,
 cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Martin Sebor <msebor@gcc.gnu.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>, Tejun Heo <tj@kernel.org>,
 Simon Kelley <simon@thekelleys.org.uk>, intel-gfx@lists.freedesktop.org,
 Tycho Andersen <tycho@tycho.pizza>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1665246916-699807841-1616619033=:3443171
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 22 Mar 2021, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-11 introdces a harmless warning for cap_inode_getsecurity:
> 
> security/commoncap.c: In function ‘cap_inode_getsecurity’:
> security/commoncap.c:440:33: error: ‘memcpy’ reading 16 bytes from a region of size 0 [-Werror=stringop-overread]
>   440 |                                 memcpy(&nscap->data, &cap->data, sizeof(__le32) * 2 * VFS_CAP_U32);
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The problem here is that tmpbuf is initialized to NULL, so gcc assumes
> it is not accessible unless it gets set by vfs_getxattr_alloc().  This is
> a legitimate warning as far as I can tell, but the code is correct since
> it correctly handles the error when that function fails.
> 
> Add a separate NULL check to tell gcc about it as well.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git fixes-v5.12

-- 
James Morris
<jmorris@namei.org>

--1665246916-699807841-1616619033=:3443171
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--1665246916-699807841-1616619033=:3443171--
